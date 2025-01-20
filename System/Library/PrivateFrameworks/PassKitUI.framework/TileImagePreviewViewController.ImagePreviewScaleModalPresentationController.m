@interface TileImagePreviewViewController.ImagePreviewScaleModalPresentationController
- (_TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
@end

@implementation TileImagePreviewViewController.ImagePreviewScaleModalPresentationController

- (void)presentationTransitionWillBegin
{
  v2 = self;
  sub_19F77A57C();
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  if (!a3)
  {
    v4 = self;
    id v5 = sub_19F77A4C8();
    objc_msgSend(v5, sel_removeFromSuperview);
  }
}

- (void)dismissalTransitionWillBegin
{
  v2 = self;
  sub_19F77A858();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
  {
    uint64_t v3 = self;
    id v4 = sub_19F77A4C8();
    objc_msgSend(v4, sel_removeFromSuperview);
  }
}

- (_TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController_transitionController));
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController____lazy_storage___backgroundView);
}

@end