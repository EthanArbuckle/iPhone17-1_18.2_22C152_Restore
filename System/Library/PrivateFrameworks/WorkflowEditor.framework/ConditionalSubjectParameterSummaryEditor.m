@interface ConditionalSubjectParameterSummaryEditor
- (BOOL)variableMenuSupportsVariableSelectionForSlotWithIdentifier:(id)a3;
- (_TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (id)clearButtonMenuItemForSlotWithIdentifier:(id)a3;
- (id)customMenuElementsForSlotWithIdentifier:(id)a3 style:(unint64_t)a4;
- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
@end

@implementation ConditionalSubjectParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_2349999D4(v8, v6);
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;
  sub_234AE9618((uint64_t)&unk_2687D1C18, v5);
}

- (BOOL)variableMenuSupportsVariableSelectionForSlotWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_23499A66C(v4);

  return self & 1;
}

- (id)clearButtonMenuItemForSlotWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_23499A860(v4);

  return v6;
}

- (id)customMenuElementsForSlotWithIdentifier:(id)a3 style:(unint64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_23499AA98(v6, a4);
  uint64_t v9 = v8;

  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2687D1BE0);
    v10 = (void *)sub_234B3B6F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = sub_23499BE50((uint64_t)a3, (uint64_t)a4);

  return v10;
}

- (_TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor *)sub_23499C628(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor_homeServiceModal));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor_pendingHome);
}

@end