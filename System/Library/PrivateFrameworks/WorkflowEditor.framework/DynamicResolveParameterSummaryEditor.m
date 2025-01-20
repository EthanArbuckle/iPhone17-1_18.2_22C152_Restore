@interface DynamicResolveParameterSummaryEditor
- (_TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)parameterValuePickerViewController:(id)a3 didFinishWithParameterState:(id)a4;
- (void)parameterValuePickerViewControllerDidCancel:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation DynamicResolveParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_234AD1454((uint64_t)v8, v7);
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  id v6 = self;
  sub_234AE9618((uint64_t)&unk_2687D7B20, v5);
}

- (_TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor *)sub_234AD1D88(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor_presentedViewController));
}

- (void)parameterValuePickerViewControllerDidCancel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_234AD1E84();
}

- (void)parameterValuePickerViewController:(id)a3 didFinishWithParameterState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_234AD1F1C((uint64_t)v8, (uint64_t)a4);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_234AD1F98();
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  int64_t v9 = sub_234A40414((uint64_t)v8, v7);

  return v9;
}

@end