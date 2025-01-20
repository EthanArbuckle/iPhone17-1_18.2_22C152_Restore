@interface SettingsHostViewControllerRepresentable.MutableState
- (_TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState)init;
- (void)hostViewController:(id)a3 didBeginHosting:(id)a4;
- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5;
- (void)hostViewController:(id)a3 didFailToHost:(id)a4 error:(id)a5;
- (void)hostViewController:(id)a3 didPrepareToHost:(id)a4;
@end

@implementation SettingsHostViewControllerRepresentable.MutableState

- (void)hostViewController:(id)a3 didPrepareToHost:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1E4D725C0();
}

- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_1E4D728AC();
}

- (void)hostViewController:(id)a3 didFailToHost:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_1E4D72BB4(a5);
}

- (void)hostViewController:(id)a3 didBeginHosting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1E4D732F8();
}

- (_TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState)init
{
  result = (_TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState_role));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState__hostViewController));
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV8Settings39SettingsHostViewControllerRepresentableP33_660F061974F96B10B28E661239591CBA12MutableState_completion);
  sub_1E4D6E6B0(v3);
}

@end