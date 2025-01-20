@interface PUOneUpDefaultActionsController
- (BOOL)assetActionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5;
- (BOOL)assetActionPerformer:(id)a3 presentViewController:(id)a4;
- (BOOL)canPerformSimpleActionWithActionType:(unint64_t)a3;
- (BOOL)canPerformTrashAction;
- (BOOL)executeActionPerformer:(id)a3 completionHandler:(id)a4;
- (BOOL)performSimpleActionWithActionType:(unint64_t)a3;
- (BOOL)performSimpleActionWithActionType:(unint64_t)a3 completionHandler:(id)a4;
- (BOOL)prefersAssetInclusionAfterRemovalForActionPerformer:(id)a3;
- (BOOL)presentViewController:(id)a3;
- (BOOL)shouldEnableSimpleActionWithActionType:(unint64_t)a3;
- (BOOL)shouldEnableToggleDetailsAction;
- (PUOneUpActionsControllerDelegate)delegate;
- (PUOneUpActionsControllerPopoverHelper)popoverHelper;
- (PUOneUpDefaultActionsController)init;
- (PUOneUpDefaultActionsController)initWithBrowsingSession:(id)a3 viewController:(id)a4;
- (PUOneUpDefaultActionsControllerActionManagerSource)assetActionManagerSource;
- (double)assetActionPerformerBottomPaddingForPresentingToast:(id)a3;
- (id)assetActionPerformerHostViewControllerForPresentingToast:(id)a3;
- (id)undoManagerForAssetActionPerformer:(id)a3;
- (void)dismissOneUp;
- (void)internalToggleGainMapImage;
- (void)jumpToNextAsset;
- (void)jumpToPreviousAsset;
- (void)performActionType:(unint64_t)a3 assetsByAssetCollection:(id)a4;
- (void)performCancelEditingAction;
- (void)performDoneEditingAction;
- (void)performDuplicateActionWithAssetsByAssetCollection:(id)a3;
- (void)performEditAudioMixModeActionWithAudioMixMode:(id)a3;
- (void)performEditPlaybackRateActionWithPlaybackRate:(float)a3;
- (void)performLikeActionWithLike:(BOOL)a3;
- (void)performMergeDuplicatesAction;
- (void)performMuteActionWithShouldMute:(BOOL)a3;
- (void)performPendingEditsActionWithRequest:(id)a3;
- (void)performPlayPauseActionWithDesiredState:(int64_t)a3;
- (void)performQuickCropActionWithContext:(id)a3;
- (void)performRestoreAction;
- (void)performShareAction;
- (void)performShowInLibraryAction;
- (void)performSyndicationSaveAction;
- (void)performToggleCommentsActionAndBeginEditing:(BOOL)a3;
- (void)performToggleDetailsAction;
- (void)performToggleFavoriteAction;
- (void)performToggleMuteAction;
- (void)performTrashAction;
- (void)performZoomAt:(id)a3;
- (void)preheatShareAction;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)setAssetActionManagerSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPopoverHelper:(id)a3;
- (void)toggleChromeVisibility;
- (void)toggleImmersiveMode;
- (void)togglePlayback;
- (void)toggleSelectionMode;
@end

@implementation PUOneUpDefaultActionsController

- (PUOneUpActionsControllerDelegate)delegate
{
  v2 = (void *)sub_1AEB41730();
  return (PUOneUpActionsControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AEB4179C();
}

- (PUOneUpDefaultActionsControllerActionManagerSource)assetActionManagerSource
{
  v2 = (void *)sub_1AEB41878();
  return (PUOneUpDefaultActionsControllerActionManagerSource *)v2;
}

- (void)setAssetActionManagerSource:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AEB418E4();
}

- (PUOneUpActionsControllerPopoverHelper)popoverHelper
{
  v2 = (void *)sub_1AEB419BC();
  return (PUOneUpActionsControllerPopoverHelper *)v2;
}

- (void)setPopoverHelper:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AEB41A5C();
}

- (PUOneUpDefaultActionsController)initWithBrowsingSession:(id)a3 viewController:(id)a4
{
  return (PUOneUpDefaultActionsController *)OneUpDefaultActionsController.init(browsingSession:viewController:)(a3, a4);
}

- (void)performShareAction
{
  v2 = self;
  sub_1AEB41CF0();
}

- (void)preheatShareAction
{
  v2 = self;
  sub_1AEB420A4();
}

- (void)performLikeActionWithLike:(BOOL)a3
{
  v4 = self;
  sub_1AEB422D0(a3);
}

- (void)performRestoreAction
{
  v2 = self;
  sub_1AEB424C0();
}

- (void)performMuteActionWithShouldMute:(BOOL)a3
{
  v4 = self;
  sub_1AEB427D8(a3);
}

- (void)performToggleFavoriteAction
{
  v2 = self;
  sub_1AEB428A4();
}

- (void)performSyndicationSaveAction
{
  v2 = self;
  sub_1AEB42CE4();
}

- (void)togglePlayback
{
  v2 = self;
  sub_1AEB431D8();
}

- (void)toggleChromeVisibility
{
  v2 = self;
  sub_1AEB43304();
}

- (void)toggleImmersiveMode
{
  v2 = self;
  sub_1AEB43358();
}

- (void)performPlayPauseActionWithDesiredState:(int64_t)a3
{
  v4 = self;
  sub_1AEB43494(a3);
}

- (void)performToggleMuteAction
{
  v2 = self;
  sub_1AEB43994();
}

- (void)performToggleDetailsAction
{
  v2 = self;
  sub_1AEB43A54();
}

- (void)performZoomAt:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AEB43B14((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)performToggleCommentsActionAndBeginEditing:(BOOL)a3
{
  v4 = self;
  sub_1AEB43BF0(a3);
}

- (void)performShowInLibraryAction
{
  v2 = self;
  sub_1AEB43F0C();
}

- (void)performDoneEditingAction
{
  v2 = self;
  sub_1AEB444AC();
}

- (void)performCancelEditingAction
{
  v2 = self;
  sub_1AEB4451C();
}

- (void)performMergeDuplicatesAction
{
  v2 = self;
  sub_1AEB4469C();
}

- (void)performQuickCropActionWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEB44864((uint64_t)v4);
}

- (void)performEditPlaybackRateActionWithPlaybackRate:(float)a3
{
  id v4 = self;
  sub_1AEB448E4(a3);
}

- (void)performEditAudioMixModeActionWithAudioMixMode:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEB44BC4((uint64_t)v4);
}

- (void)performPendingEditsActionWithRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEB44ED0(v4);
}

- (void)performActionType:(unint64_t)a3 assetsByAssetCollection:(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9A9CD40);
  uint64_t v6 = sub_1AEF96CA0();
  v7 = self;
  sub_1AEB45350(a3, v6);

  swift_bridgeObjectRelease();
}

- (void)performDuplicateActionWithAssetsByAssetCollection:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E9A9CD40);
  uint64_t v4 = sub_1AEF96CA0();
  v5 = self;
  sub_1AEB454A0(v4);

  swift_bridgeObjectRelease();
}

- (void)performTrashAction
{
  v2 = self;
  sub_1AEB45718();
}

- (BOOL)canPerformTrashAction
{
  v2 = self;
  unsigned __int8 v3 = sub_1AEB4591C();

  return v3 & 1;
}

- (void)toggleSelectionMode
{
  v2 = self;
  sub_1AEB459E0();
}

- (BOOL)canPerformSimpleActionWithActionType:(unint64_t)a3
{
  uint64_t v4 = self;
  LOBYTE(a3) = sub_1AEB45C70(a3);

  return a3 & 1;
}

- (BOOL)performSimpleActionWithActionType:(unint64_t)a3
{
  uint64_t v4 = self;
  LOBYTE(a3) = sub_1AEB45E4C(a3);

  return a3 & 1;
}

- (BOOL)performSimpleActionWithActionType:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    uint64_t v6 = sub_1AEB49D04;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  char v9 = sub_1AEB45E94(a3, (uint64_t)v6, v7);
  sub_1AEA1FDC4((uint64_t)v6);

  return v9 & 1;
}

- (BOOL)presentViewController:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1AEB462D4(v4);

  return self & 1;
}

- (void)jumpToNextAsset
{
  v2 = self;
  sub_1AEB464F0();
}

- (void)jumpToPreviousAsset
{
  v2 = self;
  sub_1AEB46568();
}

- (void)dismissOneUp
{
  v2 = self;
  sub_1AEB467DC();
}

- (BOOL)shouldEnableSimpleActionWithActionType:(unint64_t)a3
{
  id v4 = self;
  sub_1AEB4688C(a3);
  LOBYTE(a3) = v5;

  return a3 & 1;
}

- (BOOL)shouldEnableToggleDetailsAction
{
  v2 = self;
  unsigned __int8 v3 = sub_1AEB46B0C();

  return v3 & 1;
}

- (void)internalToggleGainMapImage
{
  v2 = self;
  sub_1AEB46BA8();
}

- (id)undoManagerForAssetActionPerformer:(id)a3
{
  id v4 = a3;
  char v5 = self;
  sub_1AEB46D60();
  uint64_t v7 = v6;

  return v7;
}

- (BOOL)assetActionPerformer:(id)a3 presentViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  LOBYTE(a4) = sub_1AEB46E1C((uint64_t)v8, a4);

  return a4 & 1;
}

- (BOOL)assetActionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_1AEB49C50;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  char v13 = sub_1AEB46E8C((uint64_t)v12, (uint64_t)a4, v8, v9);
  sub_1AEA1FDC4((uint64_t)v8);

  return v13 & 1;
}

- (id)assetActionPerformerHostViewControllerForPresentingToast:(id)a3
{
  id v4 = a3;
  char v5 = self;
  id v6 = sub_1AEB47100();

  return v6;
}

- (double)assetActionPerformerBottomPaddingForPresentingToast:(id)a3
{
  id v4 = a3;
  char v5 = self;
  double v6 = sub_1AEB471CC();

  return v6;
}

- (BOOL)prefersAssetInclusionAfterRemovalForActionPerformer:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  double v6 = self;
  LOBYTE(v3) = sub_1AEB47290(v3);

  return v3 & 1;
}

- (BOOL)executeActionPerformer:(id)a3 completionHandler:(id)a4
{
  double v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    double v6 = sub_1AEB040FC;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  uint64_t v9 = self;
  char v10 = sub_1AEB4739C(v8, (uint64_t)v6, v7);
  sub_1AEA1FDC4((uint64_t)v6);

  return v10 & 1;
}

- (PUOneUpDefaultActionsController)init
{
}

- (void).cxx_destruct
{
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR___PUOneUpDefaultActionsController_delegate);
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR___PUOneUpDefaultActionsController_assetActionManagerSource);
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR___PUOneUpDefaultActionsController_popoverHelper);

  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4 = (UIPopoverPresentationController *)a3;
  id v5 = self;
  OneUpDefaultActionsController.prepareForPopoverPresentation(_:)(v4);
}

@end