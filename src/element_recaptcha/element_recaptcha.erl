-module(element_recaptcha).
-compile(export_all).

-include_lib("nitrogen/include/wf.inc").
-include("elements.hrl").

reflect() ->
    record_info(fields, recaptcha).

render() ->
    wf:render(#panel{id=recaptcha_area}).

render(ControlId, R) -> 
    %when is_record(R, recaptcha) ->
    Id = ControlId,
    RecaptchaScript = "<script type='text/javascript' src='http://api.recaptcha.net/challenge?k=" ++ R#recaptcha.public_key ++ "'></script>",
    Panel = #panel{id=Id, class=["recaptcha ", R#recaptcha.class], body=RecaptchaScript},
    element_panel:render(Id, Panel).
