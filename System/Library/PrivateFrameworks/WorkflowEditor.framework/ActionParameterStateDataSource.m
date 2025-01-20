@interface ActionParameterStateDataSource
- (_TtC14WorkflowEditorP33_A9926FE49755427AE9EF62E6C77745C430ActionParameterStateDataSource)init;
- (int64_t)hash;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)dealloc;
@end

@implementation ActionParameterStateDataSource

- (void)dealloc
{
  v2 = self;
  sub_234A98D48();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_A9926FE49755427AE9EF62E6C77745C430ActionParameterStateDataSource_action));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_A9926FE49755427AE9EF62E6C77745C430ActionParameterStateDataSource_parameter));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14WorkflowEditorP33_A9926FE49755427AE9EF62E6C77745C430ActionParameterStateDataSource_undoManager);
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  sub_234B3B588();
  id v6 = a3;
  v7 = self;
  sub_234A99FB0();

  swift_bridgeObjectRelease();
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_234A9A1F4();

  return v3;
}

- (_TtC14WorkflowEditorP33_A9926FE49755427AE9EF62E6C77745C430ActionParameterStateDataSource)init
{
}

@end