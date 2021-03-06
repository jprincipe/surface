defmodule Surface.Components.Form.FileInput do
  @moduledoc """
  Generates a file input.

  It requires the given form to be configured with `multipart: true`.

  All options passed via `opts` will be sent to `file_input/3`, `value` and
  `class` can be set directly and will override anything in `opts`.


  ## Examples

  ```
  <FileInput form="user" field="picture" />

  <Form for={{ :user }} opts={{ multipart: true }}>
    <FileInput field={{ :picture }} />
  </Form>
  ```
  """

  use Surface.Components.Form.Input

  import Phoenix.HTML.Form, only: [file_input: 3]
  import Surface.Components.Form.Utils

  def render(assigns) do
    props = get_non_nil_props(assigns, [:value, class: @default_class])
    event_opts = get_events_to_opts(assigns)

    ~H"""
    <InputContext assigns={{ assigns }} :let={{ form: form, field: field }}>
      {{ file_input(form, field, props ++ @opts ++ event_opts) }}
    </InputContext>
    """
  end
end
