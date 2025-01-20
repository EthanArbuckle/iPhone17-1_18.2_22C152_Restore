@interface _PMTextFieldWithSuggestions.Coordinator
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtCV17PasswordManagerUIP33_CF5DA52F57BDE60542A548C59C33D5C827_PMTextFieldWithSuggestions11Coordinator)init;
- (void)textFieldDidBeginEditing:(id)a3;
@end

@implementation _PMTextFieldWithSuggestions.Coordinator

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_258BAA1B0(v4);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtCV17PasswordManagerUIP33_CF5DA52F57BDE60542A548C59C33D5C827_PMTextFieldWithSuggestions11Coordinator_focusNextField);
  id v5 = a3;
  v6 = self;
  v4();

  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (_TtCV17PasswordManagerUIP33_CF5DA52F57BDE60542A548C59C33D5C827_PMTextFieldWithSuggestions11Coordinator)init
{
  result = (_TtCV17PasswordManagerUIP33_CF5DA52F57BDE60542A548C59C33D5C827_PMTextFieldWithSuggestions11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

@end