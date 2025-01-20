@interface VariableDelegate
- (_TtC14WorkflowUICoreP33_D6521D150D80B7008B3CC8BBAF4C7F1316VariableDelegate)init;
- (void)dealloc;
- (void)variableDidChange:(id)a3;
@end

@implementation VariableDelegate

- (void)dealloc
{
  v2 = self;
  sub_23538D840();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowUICoreP33_D6521D150D80B7008B3CC8BBAF4C7F1316VariableDelegate_variable));
}

- (void)variableDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23538D8C4();
}

- (_TtC14WorkflowUICoreP33_D6521D150D80B7008B3CC8BBAF4C7F1316VariableDelegate)init
{
  return (_TtC14WorkflowUICoreP33_D6521D150D80B7008B3CC8BBAF4C7F1316VariableDelegate *)sub_23538D9B0();
}

@end