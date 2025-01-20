@interface QuantityFieldParameterSummaryEditor
+ (unint64_t)variableResultTypeForParameter:(id)a3;
- (BOOL)textEntryShouldChangeText:(id)a3;
- (BOOL)variableMenuSupportsVariableSelectionForSlotWithIdentifier:(id)a3;
- (WFVariableProvider)variableProvider;
- (_TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (id)clearButtonMenuItemForSlotWithIdentifier:(id)a3;
- (id)customMenuElementsForSlotWithIdentifier:(id)a3 style:(unint64_t)a4;
- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)setVariableProvider:(id)a3;
- (void)stageState:(id)a3;
- (void)textEntryDidFinish;
- (void)textEntryTextDidChange:(id)a3;
- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4;
@end

@implementation QuantityFieldParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_2349A6F48(v6);
}

- (id)customMenuElementsForSlotWithIdentifier:(id)a3 style:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  uint64_t v7 = sub_2349A70C8(v5);

  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687D1BE0);
    v8 = (void *)sub_234B3B6F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;
  sub_234AE9618((uint64_t)&unk_2687D2088, v5);
}

- (WFVariableProvider)variableProvider
{
  v2 = self;
  id v3 = sub_2349A77B0();

  return (WFVariableProvider *)v3;
}

- (void)setVariableProvider:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_2349A7858((uint64_t)a3);
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
  id v9 = sub_2349A7930((uint64_t)v8, a4);

  return v9;
}

- (BOOL)variableMenuSupportsVariableSelectionForSlotWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  char v6 = sub_2349A7A70(v4);

  return v6 & 1;
}

- (id)clearButtonMenuItemForSlotWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_2349A7B98(v4);

  return v6;
}

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
  swift_unknownObjectRetain();
  id v7 = self;
  sub_2349A7D18(a3, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (BOOL)textEntryShouldChangeText:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  id v6 = self;
  LOBYTE(v3) = sub_2349A8064(v3);

  return v3 & 1;
}

- (void)textEntryTextDidChange:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_2349A8154(a3);
}

- (void)textEntryDidFinish
{
  v2 = self;
  sub_2349A84E4();
}

- (void)stageState:(id)a3
{
  id v6 = a3;
  id v5 = self;
  sub_2349A85DC((uint64_t)a3);
}

- (_TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *)sub_2349A8A90(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor_autocompleteDataSource));
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor_autocompleteCoordinator);
}

@end