@interface PXMessagesStackView
+ (unsigned)accessoryMediaKind;
+ (unsigned)itemMediaKind;
- ($9C403407A5B624E1CD2E2AFE16A3B680)tapbackConfigurationForProposedConfiguration:(SEL)a3 spriteIndex:(id *)a4 inLayout:(unsigned int)a5;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- ($DE30A600513D762F9B6AB73D2AED4B95)additionalItemsCount;
- (BOOL)_isSpriteReferenceForPrimaryItem:(id)a3;
- (BOOL)_shouldAutoplayAsset:(id)a3;
- (BOOL)allowPlayableContentLoading;
- (BOOL)contentChangedForItemBeforeDataSource:(id)a3 beforeIndexPath:(PXSimpleIndexPath *)a4 afterDataSource:(id)a5 afterIndexPath:(PXSimpleIndexPath *)a6;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasTapbacksForSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (BOOL)hidesTopLeadingBadgesInLayout:(id)a3;
- (BOOL)providesLoadingAppearanceAndBehavior;
- (BOOL)stackItemsLayout:(id)a3 itemHasTapback:(int64_t)a4;
- (BOOL)wantsAssetBadgeDecorationsInLayout:(id)a3;
- (BOOL)wantsFileSizeBadgesInLayout:(id)a3;
- (BOOL)wantsInteractiveFavoriteBadgesInLayout:(id)a3;
- (BOOL)wantsTapbackDecorationInLayout:(id)a3;
- (CGRect)itemsLayout:(id)a3 bestCropRectForItem:(int64_t)a4 withAspectRatio:(double)a5;
- (CGSize)minSpriteSizeForPresentationStyle:(unint64_t)a3;
- (Class)viewClassForAccessoryItemAtIndex:(int64_t)a3;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4;
- (NSSet)hiddenAssetReferences;
- (PXGAssetDecorationInfo)assetDecorationInfoForAsset:(SEL)a3 atSpriteIndex:(id)a4 inLayout:(unsigned int)a5;
- (PXGDisplayAssetVideoPresentationController)currentVideoPresentationController;
- (PXMessagesStackView)initWithFrame:(CGRect)a3;
- (PXMessagesStackViewDelegate)delegate;
- (PXTapbackStatusManager)tapbackStatusManager;
- (PXUIMediaProvider)mediaProvider;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)transitionPlaceholderView;
- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4;
- (id)_presentationControllerForAsset:(id)a3;
- (id)_regionOfInterestForAssetReference:(id)a3 forTransitioning:(BOOL)a4;
- (id)_trackingContainerViewForAssetReference:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4;
- (id)installTransitionSnapshotViewForAssetReference:(id)a3 uncroppedImageFrame:(CGRect *)a4;
- (id)interactionControllerForDismissal:(id)a3;
- (id)itemsLayout:(id)a3 objectReferenceForItem:(int64_t)a4;
- (id)regionOfInterestForAssetReference:(id)a3;
- (id)regionOfInterestForTransitioningAssetReference:(id)a3;
- (id)selectedSpriteIndexesInLayout:(id)a3;
- (id)viewUserDataForAccessoryItemAtIndex:(int64_t)a3;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4;
- (int64_t)itemsLayout:(id)a3 itemForObjectReference:(id)a4 options:(unint64_t)a5;
- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)selectionDecorationStyleInLayout:(id)a3;
- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3;
- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3;
- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_updateCurrentPresentationController;
- (void)currentDataSourceDidChange;
- (void)prepareForDisplay;
- (void)primaryItemDidChange:(BOOL)a3 didChangeIndex:(BOOL)a4;
- (void)removeTransitionSnapshotView;
- (void)setAdditionalItemsCount:(id)a3;
- (void)setAllowPlayableContentLoading:(BOOL)a3;
- (void)setCurrentVideoPresentationController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHiddenAssetReferences:(id)a3;
- (void)setHiddenAssetReferences:(id)a3 animationType:(int64_t)a4;
- (void)setMediaProvider:(id)a3;
- (void)setProvidesLoadingAppearanceAndBehavior:(BOOL)a3;
- (void)setTapbackStatusManager:(id)a3;
- (void)setTransitionPlaceholderView:(id)a3;
- (void)settledDidChange;
- (void)willBeginScrolling;
@end

@implementation PXMessagesStackView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionPlaceholderView, 0);
  objc_storeStrong((id *)&self->_currentVideoPresentationController, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hiddenAssetReferences, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_activityIndicatorViewUserData, 0);
  objc_storeStrong((id *)&self->_cachedAdditionalItemsUserData, 0);
  objc_storeStrong((id *)&self->_assetDecorationSource, 0);
  objc_storeStrong((id *)&self->_playbackControlViewModel, 0);
  objc_storeStrong((id *)&self->_cachedPlaybackControlUserData, 0);
  objc_storeStrong((id *)&self->_videoPresentationControllersByItem, 0);
  objc_storeStrong((id *)&self->_cachedClampedFetchResult, 0);
}

- (UIView)transitionPlaceholderView
{
  return self->_transitionPlaceholderView;
}

- (PXGDisplayAssetVideoPresentationController)currentVideoPresentationController
{
  return self->_currentVideoPresentationController;
}

- ($DE30A600513D762F9B6AB73D2AED4B95)additionalItemsCount
{
  p_additionalItemsCount = &self->_additionalItemsCount;
  unint64_t count = self->_additionalItemsCount.count;
  int64_t type = p_additionalItemsCount->type;
  result.var1 = type;
  result.var0 = count;
  return result;
}

- (void)setProvidesLoadingAppearanceAndBehavior:(BOOL)a3
{
  self->_providesLoadingAppearanceAndBehavior = a3;
}

- (BOOL)providesLoadingAppearanceAndBehavior
{
  return self->_providesLoadingAppearanceAndBehavior;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (BOOL)allowPlayableContentLoading
{
  return self->_allowPlayableContentLoading;
}

- (NSSet)hiddenAssetReferences
{
  return self->_hiddenAssetReferences;
}

- (PXMessagesStackViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXMessagesStackViewDelegate *)WeakRetained;
}

- (PXUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (id)regionOfInterestForTransitioningAssetReference:(id)a3
{
  return [(PXMessagesStackView *)self _regionOfInterestForAssetReference:a3 forTransitioning:1];
}

- (id)interactionControllerForDismissal:(id)a3
{
  return (id)[a3 interactionController];
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  v5 = [[PXMessagesStackDismissalAnimationController alloc] initWithStackView:self dismissingViewController:v4];

  return v5;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  v5 = [[PXMessagesStackPresentationAnimationController alloc] initWithStackView:self];
  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(PXMessagesStackView *)self tapGestureRecognizer];

  if (v5 == v4)
  {
    v7 = self;
    v6 = [(PXBaseMessagesStackView *)v7 tungstenView];
    v8 = [v6 scrollViewController];
    v9 = [v8 scrollView];

    [v4 locationInView:v7];
    -[PXMessagesStackView hitTest:withEvent:](v7, "hitTest:withEvent:", 0);
    v10 = (PXMessagesStackView *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v6) = 1;
    if (v10 != v7 && v10 != v9) {
      LODWORD(v6) = [(PXMessagesStackView *)v10 isUserInteractionEnabled] ^ 1;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return (char)v6;
}

- (id)viewUserDataForAccessoryItemAtIndex:(int64_t)a3
{
  cachedAdditionalItemsUserData = self->_cachedAdditionalItemsUserData;
  if (!cachedAdditionalItemsUserData)
  {
    id v5 = [PXMessagesStackAdditionalItemsViewUserData alloc];
    uint64_t v6 = [(PXMessagesStackView *)self additionalItemsCount];
    v8 = -[PXMessagesStackAdditionalItemsViewUserData initWithAdditionalItemsCount:](v5, "initWithAdditionalItemsCount:", v6, v7);
    v9 = self->_cachedAdditionalItemsUserData;
    self->_cachedAdditionalItemsUserData = v8;

    cachedAdditionalItemsUserData = self->_cachedAdditionalItemsUserData;
  }
  return cachedAdditionalItemsUserData;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([v6 decoratingTypeForSpriteIndex:v4] != 3)
  {
    id v12 = [(PXPhotosGridAssetDecorationSource *)self->_assetDecorationSource viewUserDataForSpriteAtIndex:v4 inLayout:v6];
LABEL_13:
    v16 = v12;
    goto LABEL_14;
  }
  uint64_t v7 = [(PXBaseMessagesStackView *)self layout];
  uint64_t v8 = _StackItemIndexForSpriteIndexInLayout(v4, v6, v7);

  if ((v8 & 0x8000000000000000) == 0)
  {
    if (v8
      || ![(PXMessagesStackView *)self providesLoadingAppearanceAndBehavior])
    {
      cachedPlaybackControlUserData = self->_cachedPlaybackControlUserData;
      if (!cachedPlaybackControlUserData
        || [(PXMessagesStackPlaybackControlUserData *)cachedPlaybackControlUserData itemIndex] != v8)
      {
        v14 = [[PXMessagesStackPlaybackControlUserData alloc] initWithItemIndex:v8 viewModel:self->_playbackControlViewModel];
        v15 = self->_cachedPlaybackControlUserData;
        self->_cachedPlaybackControlUserData = v14;
      }
      activityIndicatorViewUserData = self->_cachedPlaybackControlUserData;
    }
    else
    {
      activityIndicatorViewUserData = self->_activityIndicatorViewUserData;
      if (!activityIndicatorViewUserData)
      {
        v10 = objc_alloc_init(PXMessagesStackActivityIndicatorViewUserData);
        v11 = self->_activityIndicatorViewUserData;
        self->_activityIndicatorViewUserData = v10;

        activityIndicatorViewUserData = self->_activityIndicatorViewUserData;
      }
    }
    id v12 = activityIndicatorViewUserData;
    goto LABEL_13;
  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (Class)viewClassForAccessoryItemAtIndex:(int64_t)a3
{
  return (Class)objc_opt_class();
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inDecoratingLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if ([v6 decoratingTypeForSpriteIndex:v4] != 3)
  {
    uint64_t v9 = [(PXPhotosGridAssetDecorationSource *)self->_assetDecorationSource viewClassForSpriteAtIndex:v4 inLayout:v6];
    goto LABEL_7;
  }
  uint64_t v7 = [(PXBaseMessagesStackView *)self layout];
  uint64_t v8 = _StackItemIndexForSpriteIndexInLayout(v4, v6, v7);

  if ((v8 & 0x8000000000000000) == 0)
  {
    if (!v8
      && [(PXMessagesStackView *)self providesLoadingAppearanceAndBehavior])
    {
      uint64_t v9 = objc_opt_class();
LABEL_7:
      v10 = (void *)v9;
      goto LABEL_13;
    }
    if ([(PXMessagesStackView *)self allowPlayableContentLoading])
    {
      v11 = [(PXBaseMessagesStackView *)self currentDataSource];
      id v12 = [(PXBaseMessagesStackView *)self currentDataSource];
      v15[0] = [v12 identifier];
      v15[1] = 0;
      v15[2] = v8;
      v15[3] = 0x7FFFFFFFFFFFFFFFLL;
      v13 = [v11 assetAtItemIndexPath:v15];

      if ([v13 playbackStyle] == 4)
      {
        v10 = objc_opt_class();

        goto LABEL_13;
      }
    }
  }
  v10 = 0;
LABEL_13:

  return (Class)v10;
}

- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  float v4 = *(float *)off_1E5DAAF58;
  float v5 = *((float *)off_1E5DAAF58 + 1);
  float v6 = *((float *)off_1E5DAAF58 + 2);
  float v7 = *((float *)off_1E5DAAF58 + 3);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (id)selectedSpriteIndexesInLayout:(id)a3
{
  return 0;
}

- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3
{
  return 0;
}

- (int64_t)selectionDecorationStyleInLayout:(id)a3
{
  return 0;
}

- ($9C403407A5B624E1CD2E2AFE16A3B680)tapbackConfigurationForProposedConfiguration:(SEL)a3 spriteIndex:(id *)a4 inLayout:(unsigned int)a5
{
  double v11 = v9;
  double v12 = v8;
  double v13 = v7;
  double v14 = v6;
  v15 = [(PXBaseMessagesStackView *)self layout];
  objc_msgSend(v15, "tapbackConfigurationForProposedConfiguration:spriteIndex:", a4, v14, v13, v12, v11);

  return result;
}

- (BOOL)hasTapbacksForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  return [(PXPhotosGridAssetDecorationSource *)self->_assetDecorationSource hasTapbacksForSpriteIndex:*(void *)&a3 inLayout:a4];
}

- (BOOL)wantsTapbackDecorationInLayout:(id)a3
{
  return [(PXPhotosGridAssetDecorationSource *)self->_assetDecorationSource wantsTapbackDecorationInLayout:a3];
}

- (PXGAssetDecorationInfo)assetDecorationInfoForAsset:(SEL)a3 atSpriteIndex:(id)a4 inLayout:(unsigned int)a5
{
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result = (PXGAssetDecorationInfo *)self->_assetDecorationSource;
  if (result) {
    return (PXGAssetDecorationInfo *)[(PXGAssetDecorationInfo *)result assetDecorationInfoForAsset:a4 atSpriteIndex:*(void *)&a5 inLayout:a6];
  }
  return result;
}

- (BOOL)hidesTopLeadingBadgesInLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsFileSizeBadgesInLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsInteractiveFavoriteBadgesInLayout:(id)a3
{
  return 0;
}

- (BOOL)wantsAssetBadgeDecorationsInLayout:(id)a3
{
  return 1;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  float v5 = [(PXBaseMessagesStackView *)self layout];
  uint64_t v6 = [v5 itemForSpriteIndex:0];

  double v7 = [(PXBaseMessagesStackView *)self layout];
  uint64_t v8 = [v7 numberOfItems] - v6;

  BOOL v9 = self->_cachedClampedItemRange.location == v6 && self->_cachedClampedItemRange.length == v8;
  if (!v9 || (cachedClampedFetchResult = self->_cachedClampedFetchResult) == 0)
  {
    double v12 = [(PXBaseMessagesStackView *)self currentDataSource];
    uint64_t v14 = [v12 identifier];
    long long v15 = xmmword_1AB359AA0;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    [v12 assetsInSectionIndexPath:&v14];
    objc_claimAutoreleasedReturnValue();
    PXDisplayAssetFetchResultSubfetchResultWithRange();
  }
  double v11 = cachedClampedFetchResult;
  return v11;
}

- (CGSize)minSpriteSizeForPresentationStyle:(unint64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3
{
  return 3;
}

- (CGRect)itemsLayout:(id)a3 bestCropRectForItem:(int64_t)a4 withAspectRatio:(double)a5
{
  double v7 = [(PXBaseMessagesStackView *)self currentDataSource];
  v25[0] = [v7 identifier];
  v25[1] = 0;
  v25[2] = a4;
  v25[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v8 = [v7 assetAtItemIndexPath:v25];
  BOOL v9 = +[PXMessagesUISettings sharedInstance];
  int v10 = [v9 bestCropRectEnabled];

  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v8 bestCropRectForAspectRatioV2:0 verticalContentMode:2 cropMode:a5];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v14 = *(double *)off_1E5DAB010;
    double v16 = *((double *)off_1E5DAB010 + 1);
    double v18 = *((double *)off_1E5DAB010 + 2);
    double v20 = *((double *)off_1E5DAB010 + 3);
    uint64_t v11 = [v8 pixelWidth];
    uint64_t v12 = [v8 pixelHeight];
    if (v11 && v12) {
      PXRectWithAspectRatioFittingRect();
    }
  }

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4
{
  double v6 = 0.75;
  if ([(PXBaseMessagesStackView *)self useAspectTiles])
  {
    double v7 = [(PXBaseMessagesStackView *)self currentDataSource];
    v12[0] = [v7 identifier];
    v12[1] = 0;
    v12[2] = a4;
    v12[3] = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v8 = [v7 assetAtItemIndexPath:v12];
    [v8 aspectRatio];
    double v10 = 1.0;
    if (v9 < 0.99) {
      double v10 = 0.75;
    }
    if (v9 <= 1.01) {
      double v6 = v10;
    }
    else {
      double v6 = 1.33333333;
    }
  }
  return v6;
}

- (id)itemsLayout:(id)a3 objectReferenceForItem:(int64_t)a4
{
  float v5 = [(PXBaseMessagesStackView *)self currentDataSource];
  v8[0] = [v5 identifier];
  v8[1] = 0;
  v8[2] = a4;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  double v6 = [v5 assetReferenceAtItemIndexPath:v8];

  return v6;
}

- (int64_t)itemsLayout:(id)a3 itemForObjectReference:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v9 = v8;
  }
  else {
    double v9 = 0;
  }
  id v10 = v9;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = [(PXBaseMessagesStackView *)self currentDataSource];
    double v13 = v12;
    double v14 = v8;
    if (v5)
    {
      double v14 = [v12 objectReferenceNearestToObjectReference:v11 inSection:0];
      if (v14)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          double v16 = [MEMORY[0x1E4F28B00] currentHandler];
          double v17 = (objc_class *)objc_opt_class();
          double v18 = NSStringFromClass(v17);
          double v19 = objc_msgSend(v14, "px_descriptionForAssertionMessage");
          [v16 handleFailureInMethod:a2, self, @"PXMessagesStackView.m", 499, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"[dataSource objectReferenceNearestToObjectReference:assetReference inSection:0]", v18, v19 object file lineNumber description];
        }
      }
    }
    if (v13) {
      [v13 indexPathForAssetReference:v14];
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)stackItemsLayout:(id)a3 itemHasTapback:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 spriteIndexForItem:a4];
  BOOL v8 = v7 != -1
    && [(PXMessagesStackView *)self hasTapbacksForSpriteIndex:v7 inLayout:v6];

  return v8;
}

- (void)setTransitionPlaceholderView:(id)a3
{
  char v5 = (UIView *)a3;
  p_transitionPlaceholderView = &self->_transitionPlaceholderView;
  if (*p_transitionPlaceholderView != v5)
  {
    uint64_t v7 = v5;
    [(UIView *)*p_transitionPlaceholderView removeFromSuperview];
    objc_storeStrong((id *)p_transitionPlaceholderView, a3);
    char v5 = v7;
  }
}

- (id)_presentationControllerForAsset:(id)a3
{
  id v4 = a3;
  if ([(PXMessagesStackView *)self allowPlayableContentLoading]
    && ((uint64_t v5 = [v4 playbackStyle], v6 = objc_msgSend(v4, "playbackStyle"), v7 = v6 == 5, v5 == 4)
     || v6 == 5))
  {
    double v9 = [v4 uuid];
    BOOL v8 = [(PXLRUMemoryCache *)self->_videoPresentationControllersByItem objectForKeyedSubscript:v9];
    if (!v8)
    {
      id v10 = [PXGDisplayAssetVideoPresentationController alloc];
      uint64_t v11 = [(PXBaseMessagesStackView *)self layout];
      uint64_t v12 = [v11 layoutQueue];
      BOOL v8 = [(PXGDisplayAssetVideoPresentationController *)v10 initWithDisplayAsset:v4 accessQueue:v12];

      [(PXLRUMemoryCache *)self->_videoPresentationControllersByItem setObject:v8 forKeyedSubscript:v9];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__PXMessagesStackView__presentationControllerForAsset___block_invoke;
    v14[3] = &__block_descriptor_33_e61_v16__0___PXGMutableDisplayAssetVideoPresentationController__8l;
    BOOL v15 = v7;
    [(PXGDisplayAssetVideoPresentationController *)v8 performChanges:v14];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __55__PXMessagesStackView__presentationControllerForAsset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  [v4 setIsLoopingEnabled:v3];
  [v4 setResetsDesiredPlayStateOnHide:*(unsigned char *)(a1 + 32) == 0];
}

- (void)_updateCurrentPresentationController
{
  BOOL v3 = [(PXBaseMessagesStackView *)self isSettled];
  id v4 = [(PXBaseMessagesStackView *)self layout];
  uint64_t v5 = [v4 primaryItemIndex];

  uint64_t v6 = [(PXBaseMessagesStackView *)self layout];
  if (v5 >= [v6 numberOfItems]) {
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v7 = v5;
  }

  if (v3)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v8 = 0;
    }
    else
    {
      double v9 = [(PXBaseMessagesStackView *)self currentDataSource];
      id v10 = [(PXBaseMessagesStackView *)self currentDataSource];
      v15[0] = [v10 identifier];
      v15[1] = 0;
      v15[2] = v7;
      v15[3] = 0x7FFFFFFFFFFFFFFFLL;
      BOOL v8 = [v9 assetAtItemIndexPath:v15];
    }
    uint64_t v11 = [(PXMessagesStackView *)self _presentationControllerForAsset:v8];
    [(PXMessagesStackView *)self setCurrentVideoPresentationController:v11];
    if (v11 && [(PXMessagesStackView *)self _shouldAutoplayAsset:v8]) {
      [v11 performChanges:&__block_literal_global_33_296285];
    }
  }
  else
  {
    [(PXMessagesStackView *)self setCurrentVideoPresentationController:0];
  }
  playbackControlViewModel = self->_playbackControlViewModel;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__PXMessagesStackView__updateCurrentPresentationController__block_invoke_2;
  v13[3] = &unk_1E5DD2348;
  BOOL v14 = v3;
  v13[4] = self;
  v13[5] = v7;
  [(PXMessagesStackPlaybackControlViewModel *)playbackControlViewModel performChanges:v13];
}

void __59__PXMessagesStackView__updateCurrentPresentationController__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  id v4 = a2;
  [v4 setSettled:v3];
  [v4 setCurrentItem:*(void *)(a1 + 40)];
  id v5 = [*(id *)(a1 + 32) currentVideoPresentationController];
  [v4 setVideoController:v5];
}

uint64_t __59__PXMessagesStackView__updateCurrentPresentationController__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDesiredPlayState:1];
}

- (BOOL)_shouldAutoplayAsset:(id)a3
{
  id v4 = a3;
  if ([v4 playbackStyle] == 5 && self->_delegateRespondsTo.shouldAutoplayAsset)
  {
    id v5 = [(PXMessagesStackView *)self delegate];
    char v6 = [v5 stackView:self shouldAutoplayAsset:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setCurrentVideoPresentationController:(id)a3
{
  id v5 = (PXGDisplayAssetVideoPresentationController *)a3;
  p_currentVideoPresentationController = &self->_currentVideoPresentationController;
  if (*p_currentVideoPresentationController != v5)
  {
    uint64_t v7 = v5;
    [(PXGDisplayAssetVideoPresentationController *)*p_currentVideoPresentationController performChanges:&__block_literal_global_31];
    objc_storeStrong((id *)p_currentVideoPresentationController, a3);
    id v5 = v7;
  }
}

uint64_t __61__PXMessagesStackView_setCurrentVideoPresentationController___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDesiredPlayState:0];
}

- (BOOL)_isSpriteReferenceForPrimaryItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PXBaseMessagesStackView *)self layout];
  uint64_t v6 = [v5 primaryItemIndex];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v8 = v6;
    int v9 = [v5 spriteIndexForSpriteReference:v4];
    if ([v5 numberOfItems] <= v8) {
      int v10 = objc_msgSend(v5, "spriteIndexForAccessoryItem:", v8 - objc_msgSend(v5, "numberOfItems"));
    }
    else {
      int v10 = [v5 spriteIndexForItem:v8];
    }
    BOOL v7 = v9 == v10;
  }

  return v7;
}

- (void)_handleTap:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 state] != 3) {
    goto LABEL_38;
  }
  id v5 = [(PXBaseMessagesStackView *)self tungstenView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  int v10 = [(PXBaseMessagesStackView *)self layout];
  uint64_t v11 = [(PXBaseMessagesStackView *)self tungstenView];
  uint64_t v12 = objc_msgSend(v11, "hitTestResultsAtPoint:", v7, v9);

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v55 count:16];
  if (!v14) {
    goto LABEL_25;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v52;
  v49 = v10;
  v50 = v4;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v52 != v16) {
        objc_enumerationMutation(v13);
      }
      double v18 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      double v19 = objc_msgSend(v18, "identifier", v49);
      int v20 = [v19 isEqualToString:@"PXGHitTestUserDataIdentifierItem"];

      if (v20)
      {
        v28 = [v18 spriteReference];
        v29 = [v18 spriteReference];
        BOOL v30 = [(PXMessagesStackView *)self _isSpriteReferenceForPrimaryItem:v29];

        v31 = [(PXBaseMessagesStackView *)self layout];
        uint64_t v32 = [v31 spriteIndexForSpriteReference:v28];

        v33 = [(PXBaseMessagesStackView *)self layout];
        uint64_t v34 = [v33 itemForSpriteIndex:v32];

        if (v30)
        {
          int v10 = v49;
          id v4 = v50;
          if (!self->_delegateRespondsTo.didSelectAssetReference) {
            goto LABEL_37;
          }
          v35 = objc_msgSend(v49, "objectReferenceForItem:", objc_msgSend(v49, "primaryItemIndex"));
          v36 = [(PXMessagesStackView *)self delegate];
          [v36 stackView:self didSelectAssetReference:v35];

LABEL_23:
          goto LABEL_37;
        }
        int v10 = v49;
        id v4 = v50;
LABEL_27:
        if (v34 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v43 = [v10 primaryItemIndex];
          uint64_t v44 = v43;
          if (v34 >= v43)
          {
            uint64_t v47 = v43 + 1;
            uint64_t v48 = [v10 numberOfItems];
            if (v47 < v48 - 1) {
              uint64_t v46 = v44 + 1;
            }
            else {
              uint64_t v46 = v48 - 1;
            }
          }
          else
          {
            if (v43 <= 1) {
              uint64_t v45 = 1;
            }
            else {
              uint64_t v45 = v43;
            }
            uint64_t v46 = v45 - 1;
          }
          [(PXBaseMessagesStackView *)self scrollToIndex:v46 animated:1];
        }
        goto LABEL_37;
      }
      double v21 = [v18 identifier];
      int v22 = [v21 isEqualToString:@"PXGHitTestUserDataIdentifierDecorationView"];

      if (!v22)
      {
        v26 = [v18 identifier];
        int v27 = [v26 isEqualToString:@"PXGHitTestUserDataIdentifierAccessoryItem"];

        if ((v27 & 1) == 0) {
          continue;
        }
        v37 = [v18 spriteReference];
        v38 = [v18 spriteReference];
        BOOL v39 = [(PXMessagesStackView *)self _isSpriteReferenceForPrimaryItem:v38];

        int v10 = v49;
        uint64_t v40 = [v49 spriteIndexForSpriteReference:v37];
        uint64_t v41 = [v49 numberOfItems];
        uint64_t v42 = [v49 accessoryItemForSpriteIndex:v40];

        if (v39)
        {
          id v4 = v50;
          if (!self->_delegateRespondsTo.didSelectAdditionalItems) {
            goto LABEL_37;
          }
          v35 = [(PXMessagesStackView *)self delegate];
          [v35 stackViewDidSelectAdditionalItemsCard:self];
          goto LABEL_23;
        }
        uint64_t v34 = v42 + v41;
        id v4 = v50;
        goto LABEL_27;
      }
      double v23 = [v18 spriteReference];
      double v24 = [(PXBaseMessagesStackView *)self tungstenView];
      v25 = [v24 viewForSpriteReference:v23];

      if (v25)
      {
        [v50 locationInView:v25];
        if (objc_msgSend(v25, "handleTapAtPoint:"))
        {

          int v10 = v49;
          id v4 = v50;
          goto LABEL_25;
        }
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v55 count:16];
    int v10 = v49;
    id v4 = v50;
    if (v15) {
      continue;
    }
    break;
  }
LABEL_25:

LABEL_37:
LABEL_38:
}

- (void)prepareForDisplay
{
  activityIndicatorViewUserData = self->_activityIndicatorViewUserData;
  self->_activityIndicatorViewUserData = 0;

  id v4 = [(PXBaseMessagesStackView *)self layout];
  [v4 invalidateDecoration];

  v5.receiver = self;
  v5.super_class = (Class)PXMessagesStackView;
  [(PXBaseMessagesStackView *)&v5 prepareForDisplay];
}

- (void)setAdditionalItemsCount:(id)a3
{
  if (self->_additionalItemsCount.count != a3.var0 || self->_additionalItemsCount.type != a3.var1)
  {
    unint64_t var0 = a3.var0;
    self->_additionalItemsCount = ($7D1650DB7441A0F5833AC641852B48F3)a3;
    cachedAdditionalItemsUserData = self->_cachedAdditionalItemsUserData;
    self->_cachedAdditionalItemsUserData = 0;

    [(PXBaseMessagesStackView *)self setNumberOfAccessoryItems:var0 != 0];
  }
}

- (void)removeTransitionSnapshotView
{
}

- (id)installTransitionSnapshotViewForAssetReference:(id)a3 uncroppedImageFrame:(CGRect *)a4
{
  double v6 = [(PXMessagesStackView *)self currentAssetReference];
  double v7 = [(PXMessagesStackView *)self regionOfInterestForAssetReference:v6];

  double v8 = [v7 placeholderViewFactory];

  if (v8)
  {
    double v9 = [v7 placeholderViewFactory];
    double v8 = ((void (**)(void, void *))v9)[2](v9, v7);

    [(PXMessagesStackView *)self addSubview:v8];
    [(PXMessagesStackView *)self setTransitionPlaceholderView:v8];
  }
  if (a4)
  {
    [v7 uncroppedImageFrameInCoordinateSpace:self];
    objc_msgSend(v8, "convertRect:fromView:", self);
    a4->origin.x = v10;
    a4->origin.y = v11;
    a4->size.width = v12;
    a4->size.height = v13;
  }

  return v8;
}

- (void)setHiddenAssetReferences:(id)a3 animationType:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(PXBaseMessagesStackView *)self tungstenView];
  double v8 = [v7 rootLayout];
  [v8 hideSpritesForObjectReferences:v6];

  if ((unint64_t)a4 >= 3)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"PXPhotosGridHideAssetAnimationType _GridHideAssetAnimationType(PXMessagesStackHideAssetAnimationType)"];
    [v14 handleFailureInFunction:v15 file:@"PXMessagesStackView.m" lineNumber:48 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  double v9 = [(PXBaseMessagesStackView *)self tungstenView];
  CGFloat v10 = [v9 rootLayout];
  CGFloat v11 = +[PXPhotosGridHideAssetAnimationHelper createDecorationAnimationsForLayout:v10 animationType:a4];

  uint64_t v12 = [v11 count];
  if (a4 && !v12)
  {
    CGFloat v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "Failed to create animations for hiding/unhiding assets", v16, 2u);
    }
  }
}

- (void)setHiddenAssetReferences:(id)a3
{
}

- (id)_trackingContainerViewForAssetReference:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PXBaseMessagesStackView *)self tungstenView];
  id v6 = [v5 rootLayout];

  double v7 = [v6 spriteReferenceForObjectReference:v4];

  uint64_t v8 = [v6 spriteIndexForSpriteReference:v7 options:0];
  if (v8 == -1)
  {
    CGFloat v11 = 0;
  }
  else
  {
    uint64_t v9 = v8;
    CGFloat v10 = [(PXBaseMessagesStackView *)self tungstenView];
    CGFloat v11 = [v10 trackingContainerViewForSpriteIndex:v9];
  }
  return v11;
}

- (id)_regionOfInterestForAssetReference:(id)a3 forTransitioning:(BOOL)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(PXBaseMessagesStackView *)self tungstenView];
  uint64_t v8 = [(PXBaseMessagesStackView *)self layout];
  uint64_t v31 = 0;
  uint64_t v9 = PXRegionOfInterestForAssetReference(v7, v8, v6, &v31, 0);
  CGFloat v10 = PLUIGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v6;
    __int16 v34 = 2112;
    uint64_t v35 = v31;
    _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "PXMessagesStackView regionOfInterestForAssetReference:%@ imageRef:%@", buf, 0x16u);
  }

  if (v31)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:");
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = 0;
  if (!v11 && !a4)
  {
    CGFloat v13 = [v7 rootLayout];
    uint64_t v14 = [v13 spriteReferenceForObjectReference:v6];
    uint64_t v15 = [v13 spriteIndexForSpriteReference:v14 options:0];
    if (v15 == -1)
    {
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = [v7 viewForSpriteIndex:v15];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v16 snapshotViewAfterScreenUpdates:0];
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  if (v11 | v12)
  {
    double v17 = v9;
    if (v11) {
      goto LABEL_27;
    }
  }
  else
  {
    double v18 = [(PXMessagesStackView *)self mediaProvider];
    double v17 = PXRegionOfInterestForAssetReference(v7, v8, v6, &v31, v18);

    double v19 = PLUIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v6;
      __int16 v34 = 2112;
      uint64_t v35 = v31;
      _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEFAULT, "PXMessagesStackView regionOfInterestForAssetReference:%@ with fallback imageRef:%@", buf, 0x16u);
    }

    if (v31)
    {
      uint64_t v11 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:");
      if (v11) {
        goto LABEL_27;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  if (!v12 && v17)
  {
    [v17 rectInCoordinateSpace:self];
    uint64_t v12 = -[PXMessagesStackView resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:](self, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0);
  }
LABEL_27:
  if (v12)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __75__PXMessagesStackView__regionOfInterestForAssetReference_forTransitioning___block_invoke;
    v29[3] = &unk_1E5DD2298;
    id v30 = (id)v12;
    [v17 setPlaceholderViewFactory:v29];
  }
  else if (v11)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __75__PXMessagesStackView__regionOfInterestForAssetReference_forTransitioning___block_invoke_2;
    v27[3] = &unk_1E5DD22C0;
    v27[4] = self;
    id v28 = (id)v11;
    [v17 setPlaceholderViewFactory:v27];
  }
  int v20 = [v17 placeholderViewFactory];

  if (v20)
  {
    objc_initWeak((id *)buf, self);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __75__PXMessagesStackView__regionOfInterestForAssetReference_forTransitioning___block_invoke_3;
    v24[3] = &unk_1E5DD22E8;
    objc_copyWeak(&v26, (id *)buf);
    id v25 = v6;
    [v17 setTrackingContainerViewFactory:v24];

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
  }
  if (v17)
  {
    double v21 = [v17 placeholderViewFactory];
    BOOL v22 = v21 == 0;

    if (v22) {
      PXAssertGetLog();
    }
  }

  return v17;
}

id __75__PXMessagesStackView__regionOfInterestForAssetReference_forTransitioning___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __75__PXMessagesStackView__regionOfInterestForAssetReference_forTransitioning___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 rectInCoordinateSpace:v3];
  uint64_t v9 = PXPreviewImageViewForImage(*(void **)(a1 + 40), v4, v5, v6, v7, v8);

  [v9 setContentMode:2];
  return v9;
}

id __75__PXMessagesStackView__regionOfInterestForAssetReference_forTransitioning___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained _trackingContainerViewForAssetReference:*(void *)(a1 + 32)];

  return v3;
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  return [(PXMessagesStackView *)self _regionOfInterestForAssetReference:a3 forTransitioning:0];
}

- (void)setAllowPlayableContentLoading:(BOOL)a3
{
  if (self->_allowPlayableContentLoading != a3)
  {
    self->_allowPlayableContentLoading = a3;
    if (!a3) {
      [(PXLRUMemoryCache *)self->_videoPresentationControllersByItem removeAllObjects];
    }
    id v5 = [(PXBaseMessagesStackView *)self layout];
    id v4 = objc_msgSend(off_1E5DA5568, "changeDetailsWithChangedIndexRange:", 0, objc_msgSend(v5, "numberOfItems"));
    objc_msgSend(v5, "setNumberOfItems:withChangeDetails:changeMediaVersionHandler:", objc_msgSend(v5, "numberOfItems"), v4, &__block_literal_global_296303);
    [(PXMessagesStackView *)self _updateCurrentPresentationController];
  }
}

uint64_t __54__PXMessagesStackView_setAllowPlayableContentLoading___block_invoke()
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    id v6 = objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    self->_delegateRespondsTo.didSelectAssetReference = objc_opt_respondsToSelector() & 1;

    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    p_delegateRespondsTo->didChangeCurrentAssetReference = objc_opt_respondsToSelector() & 1;

    id v9 = objc_loadWeakRetained((id *)p_delegate);
    p_delegateRespondsTo->shouldAutoplayAsset = objc_opt_respondsToSelector() & 1;

    id v10 = objc_loadWeakRetained((id *)p_delegate);
    p_delegateRespondsTo->didSelectAdditionalItems = objc_opt_respondsToSelector() & 1;
  }
}

- (void)willBeginScrolling
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackView;
  [(PXBaseMessagesStackView *)&v3 willBeginScrolling];
  [(PXMessagesStackView *)self removeTransitionSnapshotView];
}

- (void)primaryItemDidChange:(BOOL)a3 didChangeIndex:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMessagesStackView;
  -[PXBaseMessagesStackView primaryItemDidChange:didChangeIndex:](&v9, sel_primaryItemDidChange_didChangeIndex_);
  [(PXMessagesStackView *)self _updateCurrentPresentationController];
  if (self->_delegateRespondsTo.didChangeCurrentAssetReference)
  {
    double v7 = [(PXMessagesStackView *)self delegate];
    id v8 = [(PXMessagesStackView *)self currentAssetReference];
    [v7 stackView:self didChangeCurrentAssetReference:v8 isProgrammaticChange:v5 didChangeIndex:v4];
  }
}

- (void)settledDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXMessagesStackView;
  [(PXBaseMessagesStackView *)&v3 settledDidChange];
  [(PXMessagesStackView *)self _updateCurrentPresentationController];
}

- (void)currentDataSourceDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)PXMessagesStackView;
  [(PXBaseMessagesStackView *)&v7 currentDataSourceDidChange];
  self->_cachedClampedItemRange = (_NSRange)xmmword_1AB359BD0;
  cachedClampedFetchResult = self->_cachedClampedFetchResult;
  self->_cachedClampedFetchResult = 0;

  cachedPlaybackControlUserData = self->_cachedPlaybackControlUserData;
  self->_cachedPlaybackControlUserData = 0;

  assetDecorationSource = self->_assetDecorationSource;
  id v6 = [(PXBaseMessagesStackView *)self currentDataSource];
  [(PXPhotosGridAssetDecorationSource *)assetDecorationSource setDataSource:v6 section:0];

  [(PXMessagesStackView *)self _updateCurrentPresentationController];
}

- (BOOL)contentChangedForItemBeforeDataSource:(id)a3 beforeIndexPath:(PXSimpleIndexPath *)a4 afterDataSource:(id)a5 afterIndexPath:(PXSimpleIndexPath *)a6
{
  long long v8 = *(_OWORD *)&a4->item;
  long long v19 = *(_OWORD *)&a4->dataSourceIdentifier;
  long long v20 = v8;
  id v9 = a5;
  id v10 = [a3 assetAtItemIndexPath:&v19];
  long long v11 = *(_OWORD *)&a6->item;
  long long v19 = *(_OWORD *)&a6->dataSourceIdentifier;
  long long v20 = v11;
  uint64_t v12 = [v9 assetAtItemIndexPath:&v19];

  id v13 = v12;
  id v14 = v10;
  uint64_t v15 = v14;
  if (v13 == v14)
  {
    BOOL v16 = 0;
  }
  else
  {
    BOOL v16 = 1;
    if (v14 && v13)
    {
      uint64_t v17 = [v13 isContentEqualTo:v14];
      if (!v17) {
        uint64_t v17 = [v15 isContentEqualTo:v13];
      }
      BOOL v16 = v17 != 2;
    }
  }

  return v16;
}

- (PXTapbackStatusManager)tapbackStatusManager
{
  return [(PXPhotosGridAssetDecorationSource *)self->_assetDecorationSource tapbackStatusManager];
}

- (void)setTapbackStatusManager:(id)a3
{
}

- (void)setMediaProvider:(id)a3
{
  BOOL v5 = (PXUIMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    [(PXBaseMessagesStackView *)self registerAllTextureProvidersWithMediaProvider:v5];
  }
}

- (PXMessagesStackView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PXMessagesStackView;
  objc_super v3 = -[PXBaseMessagesStackView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  BOOL v4 = v3;
  if (v3)
  {
    BOOL v5 = [(PXBaseMessagesStackView *)v3 layout];
    id v6 = [(PXBaseMessagesStackView *)v4 tungstenView];
    objc_super v7 = objc_alloc_init(PXPhotosGridAssetDecorationSource);
    assetDecorationSource = v4->_assetDecorationSource;
    v4->_assetDecorationSource = v7;

    [(PXPhotosGridAssetDecorationSource *)v4->_assetDecorationSource setDecoratedLayout:v5];
    [(PXPhotosGridAssetDecorationSource *)v4->_assetDecorationSource setDurationAlwaysHidden:1];
    [(PXPhotosGridAssetDecorationSource *)v4->_assetDecorationSource setEnableSpatialBadges:1];
    [v5 setDelegate:v4];
    id v9 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__handleTap_];
    [(UITapGestureRecognizer *)v9 setDelegate:v4];
    [(UITapGestureRecognizer *)v9 setCancelsTouchesInView:0];
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = v9;
    long long v11 = v9;

    [v6 addGestureRecognizer:v11];
    uint64_t v12 = objc_alloc_init(PXLRUMemoryCache);
    videoPresentationControllersByItem = v4->_videoPresentationControllersByItem;
    v4->_videoPresentationControllersByItem = v12;

    -[PXLRUMemoryCache setNumberOfSlots:](v4->_videoPresentationControllersByItem, "setNumberOfSlots:", (2 * [v5 stackedItemsCount]) | 1);
    id v14 = objc_alloc_init(PXMessagesStackPlaybackControlViewModel);
    playbackControlViewModel = v4->_playbackControlViewModel;
    v4->_playbackControlViewModel = v14;

    v4->_additionalItemsCount = *($7D1650DB7441A0F5833AC641852B48F3 *)off_1E5DAAEF8;
  }
  return v4;
}

+ (unsigned)accessoryMediaKind
{
  return 10;
}

+ (unsigned)itemMediaKind
{
  return 2;
}

@end