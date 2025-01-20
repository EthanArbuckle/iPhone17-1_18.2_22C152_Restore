@interface OneUpMockActionsController
- (BOOL)canPerformSimpleActionWithActionType:(unint64_t)a3;
- (BOOL)canPerformTrashAction;
- (BOOL)performSimpleActionWithActionType:(unint64_t)a3;
- (BOOL)performSimpleActionWithActionType:(unint64_t)a3 completionHandler:(id)a4;
- (BOOL)presentViewController:(id)a3;
- (BOOL)shouldEnableSimpleActionWithActionType:(unint64_t)a3;
- (BOOL)shouldEnableToggleDetailsAction;
- (PUOneUpActionsControllerDelegate)delegate;
- (PUOneUpActionsControllerPopoverHelper)popoverHelper;
- (_TtC15PhotosUIPrivate26OneUpMockActionsController)init;
- (void)dismissOneUp;
- (void)jumpToNextAsset;
- (void)jumpToPreviousAsset;
- (void)performActionType:(unint64_t)a3 assetsByAssetCollection:(id)a4;
- (void)performDuplicateActionWithAssetsByAssetCollection:(id)a3;
- (void)performShareAction;
- (void)performToggleDetailsAction;
- (void)performToggleFavoriteAction;
- (void)performToggleMuteAction;
- (void)performTrashAction;
- (void)performZoomAt:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPopoverHelper:(id)a3;
- (void)toggleChromeVisibility;
- (void)toggleImmersiveMode;
@end

@implementation OneUpMockActionsController

- (PUOneUpActionsControllerDelegate)delegate
{
  v2 = (void *)sub_1AEB0251C();
  return (PUOneUpActionsControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AEB02588((uint64_t)a3);
}

- (void)toggleChromeVisibility
{
  v2 = self;
  sub_1AEB02608();
}

- (BOOL)canPerformTrashAction
{
  return sub_1AEB02674() & 1;
}

- (void)performTrashAction
{
  v2 = self;
  sub_1AEB02750();
}

- (_TtC15PhotosUIPrivate26OneUpMockActionsController)init
{
  return (_TtC15PhotosUIPrivate26OneUpMockActionsController *)OneUpMockActionsController.init()();
}

- (PUOneUpActionsControllerPopoverHelper)popoverHelper
{
  v2 = (void *)sub_1AEB0295C();
  return (PUOneUpActionsControllerPopoverHelper *)v2;
}

- (void)setPopoverHelper:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AEB029FC((uint64_t)a3);
}

- (void)dismissOneUp
{
  v2 = self;
  sub_1AEB02AB8();
}

- (void)performShareAction
{
  v2 = self;
  sub_1AEB02B2C();
}

- (void)performToggleFavoriteAction
{
  v2 = self;
  sub_1AEB02BA4();
}

- (void)performToggleDetailsAction
{
  v2 = self;
  sub_1AEB02C1C();
}

- (void)performZoomAt:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AEB02C88();
  swift_unknownObjectRelease();
}

- (void)performToggleMuteAction
{
  v2 = self;
  sub_1AEB02D38();
}

- (void)toggleImmersiveMode
{
  v2 = self;
  sub_1AEB02DA4();
}

- (void)jumpToNextAsset
{
  v2 = self;
  sub_1AEB02E10();
}

- (void)jumpToPreviousAsset
{
  v2 = self;
  sub_1AEB02E7C();
}

- (BOOL)shouldEnableSimpleActionWithActionType:(unint64_t)a3
{
  return 1;
}

- (BOOL)canPerformSimpleActionWithActionType:(unint64_t)a3
{
  return 1;
}

- (void)performDuplicateActionWithAssetsByAssetCollection:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9A9CD40);
  sub_1AEF96CA0();
  v4 = self;
  sub_1AEB02EFC();

  swift_bridgeObjectRelease();
}

- (void)performActionType:(unint64_t)a3 assetsByAssetCollection:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9A9CD40);
  sub_1AEF96CA0();
  v6 = self;
  sub_1AEB02F94(a3);

  swift_bridgeObjectRelease();
}

- (BOOL)performSimpleActionWithActionType:(unint64_t)a3
{
  v4 = self;
  sub_1AEB03068(a3);

  return 1;
}

- (BOOL)performSimpleActionWithActionType:(unint64_t)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = sub_1AEB040FC;
  }
  v7 = self;
  sub_1AEB030BC(a3);
  sub_1AEA1FDC4((uint64_t)v6);

  return 1;
}

- (BOOL)presentViewController:(id)a3
{
  return 1;
}

- (BOOL)shouldEnableToggleDetailsAction
{
  return 1;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end