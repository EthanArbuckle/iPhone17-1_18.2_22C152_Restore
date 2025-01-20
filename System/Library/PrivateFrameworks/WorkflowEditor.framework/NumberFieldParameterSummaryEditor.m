@interface NumberFieldParameterSummaryEditor
+ (unint64_t)variableResultTypeForParameter:(id)a3;
- (BOOL)textEntryShouldChangeText:(id)a3;
- (WFVariableProvider)variableProvider;
- (_TtC14WorkflowEditor33NumberFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)setVariableProvider:(id)a3;
- (void)stageState:(id)a3;
- (void)textEntryDidFinish;
- (void)textEntryTextDidChange:(id)a3;
- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4;
@end

@implementation NumberFieldParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23498E418();
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;
  sub_234AE9618((uint64_t)&unk_2687D1960, v5);
}

- (WFVariableProvider)variableProvider
{
  v2 = self;
  id v3 = sub_23498E96C();

  return (WFVariableProvider *)v3;
}

- (void)setVariableProvider:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_23498EA14((uint64_t)a3);
}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  return 1;
}

- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_23498EB70((uint64_t)v8, (uint64_t)a4);

  return v9;
}

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
  swift_unknownObjectRetain();
  id v7 = self;
  sub_23498EC2C(a3, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (BOOL)textEntryShouldChangeText:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  id v6 = self;
  LOBYTE(v3) = sub_23498F134(v3);

  return v3 & 1;
}

- (void)textEntryTextDidChange:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_23498F25C(a3);
}

- (void)textEntryDidFinish
{
  v2 = self;
  sub_23498F538();
}

- (void)stageState:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_23498F630((uint64_t)a3);
}

- (_TtC14WorkflowEditor33NumberFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor33NumberFieldParameterSummaryEditor *)sub_23498FA38(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor33NumberFieldParameterSummaryEditor_autocompleteDataSource));
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC14WorkflowEditor33NumberFieldParameterSummaryEditor_autocompleteCoordinator);
}

@end