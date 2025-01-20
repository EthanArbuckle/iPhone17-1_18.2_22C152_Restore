@interface WFPosterPickerParameterSummaryEditor
- (_TtC14WorkflowEditor36WFPosterPickerParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)modalController:(id)a3 didDismissSheetWithResponse:(id)a4;
@end

@implementation WFPosterPickerParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_234AC3D28((uint64_t)v8, v7);
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_234AC44A4((uint64_t)sub_23498B5AC, v5);

  swift_release();
}

- (_TtC14WorkflowEditor36WFPosterPickerParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor36WFPosterPickerParameterSummaryEditor *)sub_234AC4704(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor36WFPosterPickerParameterSummaryEditor_presentedViewController));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC14WorkflowEditor36WFPosterPickerParameterSummaryEditor_controller);
}

- (void)modalController:(id)a3 didDismissSheetWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_234AC4848((uint64_t)v8, v7);
}

@end