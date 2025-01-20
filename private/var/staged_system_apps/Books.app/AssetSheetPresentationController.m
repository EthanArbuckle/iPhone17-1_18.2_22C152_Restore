@interface AssetSheetPresentationController
- (_TtC5Books32AssetSheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
@end

@implementation AssetSheetPresentationController

- (_TtC5Books32AssetSheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  result = (_TtC5Books32AssetSheetPresentationController *)sub_1007FF260();
  __break(1u);
  return result;
}

- (void)presentationTransitionWillBegin
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AssetSheetPresentationController();
  id v2 = v4.receiver;
  [(AssetSheetPresentationController *)&v4 presentationTransitionWillBegin];
  id v3 = [v2 presentedViewController];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() setStateShouldOpen:1];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  objc_super v4 = self;
  sub_1007B72B0(a3);
}

- (void)dismissalTransitionWillBegin
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AssetSheetPresentationController();
  id v2 = v4.receiver;
  [(AssetSheetPresentationController *)&v4 dismissalTransitionWillBegin];
  id v3 = [v2 presentedViewController];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() assetPresenterPrepareForDismissal];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  objc_super v4 = self;
  sub_1007B7534(a3);
}

@end