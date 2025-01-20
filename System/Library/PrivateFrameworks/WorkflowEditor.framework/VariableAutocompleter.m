@interface VariableAutocompleter
- (_TtC14WorkflowEditor21VariableAutocompleter)init;
- (void)availableVariablesDidChange;
@end

@implementation VariableAutocompleter

- (void)availableVariablesDidChange
{
  v2 = self;
  sub_234AB6CA4();
}

- (_TtC14WorkflowEditor21VariableAutocompleter)init
{
  return (_TtC14WorkflowEditor21VariableAutocompleter *)sub_234AB6CF0();
}

- (void).cxx_destruct
{
  sub_23494A5D4((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor21VariableAutocompleter_variableProvider);
  swift_bridgeObjectRelease();
  swift_weakDestroy();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end