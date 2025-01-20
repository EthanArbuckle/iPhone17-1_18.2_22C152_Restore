@interface TileImagePreviewViewController.ImagePreviewScaleModalTransitionController
- (_TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController)init;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
@end

@implementation TileImagePreviewViewController.ImagePreviewScaleModalTransitionController

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  v12 = (void *)sub_19F77BE44();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id result = (id)swift_unknownObjectUnownedLoadStrong();
  v6 = (double *)((char *)self
                + OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController_originalCenter);
  if (self->sourceImageView[OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController_originalCenter])
  {
    __break(1u);
    goto LABEL_7;
  }
  v7 = (double *)((char *)self
                + OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController_originalSize);
  if (self->sourceImageView[OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController_originalSize])
  {
LABEL_7:
    __break(1u);
    return result;
  }
  id v8 = result;
  double v10 = *v7;
  double v9 = v7[1];
  double v12 = *v6;
  double v11 = v6[1];
  id v13 = objc_allocWithZone((Class)type metadata accessor for TileImagePreviewViewController.ImagePreviewScaleModalAnimationAnimatedTransitioninHandler());
  id v14 = a3;
  v15 = self;
  id v16 = sub_19F77BD30(v12, v11, v10, v9, (uint64_t)v8, 0);

  return v16;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v9 = a4;
  if (!a4) {
    id v9 = a5;
  }
  double v10 = (objc_class *)type metadata accessor for TileImagePreviewViewController.ImagePreviewScaleModalPresentationController();
  double v11 = (char *)objc_allocWithZone(v10);
  *(void *)&v11[OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController____lazy_storage___backgroundView] = 0;
  *(void *)&v11[OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF944ImagePreviewScaleModalPresentationController_transitionController] = self;
  v20.receiver = v11;
  v20.super_class = v10;
  double v12 = self;
  id v13 = a4;
  id v14 = a5;
  id v15 = v13;
  id v16 = v12;
  id v17 = a3;
  v18 = [(TileImagePreviewViewController.ImagePreviewScaleModalTransitionController *)&v20 initWithPresentedViewController:v17 presentingViewController:v9];

  return v18;
}

- (_TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController)init
{
  id result = (_TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectUnownedDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9PassKitUI30TileImagePreviewViewControllerP33_C6DB725DC789A0DB9606D336BF0F8DF942ImagePreviewScaleModalTransitionController_sourceImageView));

  swift_bridgeObjectRelease();
}

@end