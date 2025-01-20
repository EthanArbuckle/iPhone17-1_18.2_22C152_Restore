@interface SummaryModal
- (_TtC14WorkflowEditor12SummaryModal)init;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
@end

@implementation SummaryModal

- (_TtC14WorkflowEditor12SummaryModal)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14WorkflowEditor12SummaryModal_viewController);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  SummaryModal.presentationControllerDidDismiss(_:)((UIPresentationController)v5);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  UIModalPresentationStyle v9 = SummaryModal.adaptivePresentationStyle(for:traitCollection:)((UIPresentationController)v8, (UITraitCollection)v7);

  return v9;
}

@end