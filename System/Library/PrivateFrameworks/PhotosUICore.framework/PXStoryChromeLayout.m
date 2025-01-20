@interface PXStoryChromeLayout
- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSMutableDictionary)itemControllers;
- (NSNumber)alphaOverride;
- (PXStoryChromeLayout)initWithViewModel:(id)a3;
- (PXStoryModel)mainModel;
- (PXStoryRecipeManager)recipeManager;
- (PXStoryRelatedLayoutGenerator)layoutGenerator;
- (PXStoryViewLayoutSpec)viewLayoutSpec;
- (PXStoryViewModel)viewModel;
- (UIEdgeInsets)paddingForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)_actionPerformer;
- (id)_buttonConfigurationForSpriteIndex:(unsigned int)a3;
- (id)_configurationForBrowserAddPhotosButton;
- (id)_configurationForBrowserSelectButton;
- (id)_configurationForButtonWithAction:(SEL)a3 systemImageName:(id)a4 backgroundStyle:(int64_t)a5 axLabelKey:(id)a6;
- (id)_configurationForButtonWithAction:(SEL)a3 systemImageName:(id)a4 backgroundStyle:(int64_t)a5 label:(id)a6 axLabelKey:(id)a7;
- (id)_configurationForCloseButtonWithAction:(SEL)a3 systemImageName:(id)a4 axLabelKey:(id)a5;
- (id)_configurationForLargeButtonWithAction:(SEL)a3 systemImageName:(id)a4 backgroundStyle:(int64_t)a5 axLabelKey:(id)a6;
- (id)_configurationForShareButtonWithAction:(SEL)a3 systemImageName:(id)a4 backgroundStyle:(int64_t)a5 axLabelKey:(id)a6;
- (id)_possiblyAccessibleSpriteIndexes;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axContentInfoAtSpriteIndex:(unsigned int)a3;
- (id)axLocalizedLabel;
- (id)axVisibleSpriteIndexes;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)mainLayoutSpec;
- (id)preferredFocusLayouts;
- (id)preferredFocusSpriteIndexes;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)stringDrawingOptionsForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3;
- (unsigned)_addButtonForChromeItem:(unint64_t)a3;
- (unsigned)_addEdgeHighlightForChromeItem:(unint64_t)a3;
- (unsigned)_addLabelForChromeItem:(unint64_t)a3;
- (unsigned)_addSpriteForChromeItemController:(id)a3 mediaKind:(unsigned __int8)a4 presentationType:(unsigned __int8)a5;
- (void)_configureDefaultContentLayout:(id)a3;
- (void)_configureUnifiedContentLayout:(id)a3;
- (void)_handleAspectModeButton:(id)a3;
- (void)_handleAutoEditButton:(id)a3;
- (void)_handleBrowserAddPhotosButton:(id)a3;
- (void)_handleBrowserGridButton:(id)a3;
- (void)_handleBrowserSelectButton:(id)a3;
- (void)_handleCloseButton:(id)a3;
- (void)_handleEditColorGradeButton:(id)a3;
- (void)_handleEditMusicButton:(id)a3;
- (void)_handleErrorIndicator:(id)a3;
- (void)_handleFavoriteButton:(id)a3;
- (void)_handleFeedbackButton:(id)a3;
- (void)_handleMuteToggleButton:(id)a3;
- (void)_handlePlayButton:(id)a3;
- (void)_handleReplayButton:(id)a3;
- (void)_handleShareButton:(id)a3;
- (void)_handleToggleViewModeButton:(id)a3;
- (void)_invalidateAXGroupRole;
- (void)_invalidateActionMenu;
- (void)_invalidateContent;
- (void)_invalidateContentAlpha;
- (void)_invalidateContentLayout;
- (void)_invalidateMainModel;
- (void)_menuDidClose;
- (void)_updateConfigurationUpdatedForPlaybackEnd:(id)a3;
- (void)_updateContentAlpha;
- (void)_updateContentLayout;
- (void)_updateMainModel;
- (void)alphaDidChange;
- (void)didUpdate;
- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)setAlphaOverride:(id)a3;
- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4;
- (void)setMainModel:(id)a3;
- (void)setRecipeManager:(id)a3;
- (void)update;
- (void)willUpdate;
@end

@implementation PXStoryChromeLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaOverride, 0);
  objc_storeStrong((id *)&self->_itemControllers, 0);
  objc_storeStrong((id *)&self->_recipeManager, 0);
  objc_storeStrong((id *)&self->_mainModel, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
  objc_storeStrong((id *)&self->_cachePossiblyAccessibleSpriteIndexes, 0);
}

- (NSNumber)alphaOverride
{
  return self->_alphaOverride;
}

- (NSMutableDictionary)itemControllers
{
  return self->_itemControllers;
}

- (PXStoryRecipeManager)recipeManager
{
  return self->_recipeManager;
}

- (PXStoryModel)mainModel
{
  return self->_mainModel;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (id)preferredFocusSpriteIndexes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  [v3 addIndex:self->_actionMenuButtonSpriteIndex];
  [v3 addIndex:self->_browserGridButtonSpriteIndex];
  [v3 addIndex:self->_browserAddPhotosButtonSpriteIndex];
  [v3 addIndex:self->_browserSelectButtonSpriteIndex];
  [v3 addIndex:self->_replayButtonSpriteIndex];
  [v3 addIndex:self->_toggleFavoriteButtonSpriteIndex];
  [v3 addIndex:self->_styleSwitcherButtonSpriteIndex];
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)preferredFocusLayouts
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [(PXStoryChromeLayout *)self viewModel];
  v11 = [v10 mainModel];
  if ([v11 viewMode] == 1)
  {
    v12 = [(PXStoryChromeLayout *)self viewModel];
    [v12 wantsChromeVisible];
  }
  v13 = [(PXGLayout *)self axNextResponder];
  char v14 = [v13 axGroup:v9 didRequestToPerformAction:a4 userInfo:v8];

  return v14;
}

- (id)axLocalizedLabel
{
  return PXLocalizedStringFromTable(@"InteractiveMemoryButtonAccessibilityLabelCurrentMemory", @"PhotosUICore");
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [(PXStoryChromeLayout *)self viewModel];
  int v6 = [v5 wantsChromeVisible];

  if (!v6) {
    return 0;
  }
  v7 = [(PXStoryChromeLayout *)self itemControllers];
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  id v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9
    || ([(PXStoryChromeLayout *)self viewModel],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 chromeItems],
        uint64_t v12 = [v9 chromeItem] & ~v11,
        v10,
        v12))
  {
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v13 = 2 * (([v9 chromeItem] & 0x800C00) == 0);
  }

  return v13;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXStoryChromeLayout;
  v5 = -[PXGLayout axContentInfoAtSpriteIndex:](&v11, sel_axContentInfoAtSpriteIndex_);
  if (self->_playButtonSpriteIndex == a3)
  {
    int v6 = [(PXStoryChromeLayout *)self viewModel];
    uint64_t v7 = [v6 desiredPlayState];

    if (v7)
    {
      if (v7 != 1)
      {
        id v9 = 0;
        goto LABEL_8;
      }
      id v8 = @"InteractiveMemoryButtonAccessibilityLabelPause";
    }
    else
    {
      id v8 = @"InteractiveMemoryButtonAccessibilityLabelPlay";
    }
    id v9 = PXLocalizedStringFromTable(v8, @"PhotosUICore");
LABEL_8:
    [v5 setContent:v9 ofContentKind:3];
  }
  return v5;
}

- (id)axVisibleSpriteIndexes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v4 = [(PXStoryChromeLayout *)self viewModel];
  uint64_t v5 = [v4 chromeItems];

  int v6 = [(PXStoryChromeLayout *)self itemControllers];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PXStoryChromeLayout_axVisibleSpriteIndexes__block_invoke;
  v9[3] = &unk_1E5DBB630;
  uint64_t v11 = v5;
  id v7 = v3;
  id v10 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __45__PXStoryChromeLayout_axVisibleSpriteIndexes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v5 = *(void *)(a1 + 40);
  if (([a3 chromeItem] & ~v5) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v6, "integerValue"));
  }
}

- (id)_possiblyAccessibleSpriteIndexes
{
  cachePossiblyAccessibleSpriteIndexes = self->_cachePossiblyAccessibleSpriteIndexes;
  if (!cachePossiblyAccessibleSpriteIndexes)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    uint64_t v5 = [(PXStoryChromeLayout *)self itemControllers];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __55__PXStoryChromeLayout__possiblyAccessibleSpriteIndexes__block_invoke;
    unint64_t v13 = &unk_1E5DBB608;
    char v14 = self;
    id v15 = v4;
    id v6 = v4;
    [v5 enumerateKeysAndObjectsUsingBlock:&v10];

    id v7 = (NSIndexSet *)objc_msgSend(v6, "copy", v10, v11, v12, v13, v14);
    id v8 = self->_cachePossiblyAccessibleSpriteIndexes;
    self->_cachePossiblyAccessibleSpriteIndexes = v7;

    cachePossiblyAccessibleSpriteIndexes = self->_cachePossiblyAccessibleSpriteIndexes;
  }
  return cachePossiblyAccessibleSpriteIndexes;
}

uint64_t __55__PXStoryChromeLayout__possiblyAccessibleSpriteIndexes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 integerValue];
  id v4 = *(_DWORD **)(a1 + 32);
  if (v4[276] != result && v4[277] != result && v4[282] != result)
  {
    uint64_t v5 = result;
    id v6 = *(void **)(a1 + 40);
    return [v6 addIndex:v5];
  }
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v10 = a3;
  if ((void *)ViewModelObservationContext_115538 != a5)
  {
    if ((void *)ItemControllerObservationContext == a5)
    {
      if ((a4 & 1) == 0) {
        goto LABEL_33;
      }
LABEL_32:
      [(PXStoryChromeLayout *)self _invalidateContentAlpha];
      goto LABEL_33;
    }
    if ((void *)MainModelObservationContext_115539 != a5)
    {
      if ((void *)RecipeManagerObservationContext != a5)
      {
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"PXStoryChromeLayout.m" lineNumber:1373 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      if ((a4 & 0x21) != 0) {
        [(PXStoryChromeLayout *)self _invalidateActionMenu];
      }
      goto LABEL_33;
    }
    if ((a4 & 0x1000010000) != 0) {
      [(PXStoryChromeLayout *)self _invalidateContent];
    }
    if ((a4 & 0x40) != 0)
    {
      [(PXStoryChromeLayout *)self _invalidateActionMenu];
      if ((a4 & 0x200000000000) == 0)
      {
LABEL_25:
        if ((a4 & 0x2000) == 0) {
          goto LABEL_26;
        }
        goto LABEL_30;
      }
    }
    else if ((a4 & 0x200000000000) == 0)
    {
      goto LABEL_25;
    }
    [(PXStoryChromeLayout *)self _invalidateActionMenu];
    [(PXStoryChromeLayout *)self _invalidateContent];
    if ((a4 & 0x2000) == 0)
    {
LABEL_26:
      if ((a4 & 0x800000000000000) == 0) {
        goto LABEL_33;
      }
      goto LABEL_31;
    }
LABEL_30:
    [(PXStoryChromeLayout *)self _invalidateContent];
    if ((a4 & 0x800000000000000) == 0) {
      goto LABEL_33;
    }
LABEL_31:
    [(PXStoryChromeLayout *)self _invalidateContentLayout];
    goto LABEL_32;
  }
  if ((a4 & 0x80000) != 0) {
    [(PXStoryChromeLayout *)self _invalidateContent];
  }
  if ((a4 & 0x418000000008020) != 0) {
    [(PXStoryChromeLayout *)self _invalidateContent];
  }
  if ((a4 & 0x40) != 0) {
    [(PXStoryChromeLayout *)self _invalidateMainModel];
  }
  if ((a4 & 0x4000) != 0) {
    [(PXStoryChromeLayout *)self _invalidateContentAlpha];
  }
  if ((a4 & 0x4140002C02) != 0) {
    [(PXStoryChromeLayout *)self _invalidateActionMenu];
  }
  if ((a4 & 0x8000) != 0) {
    [(PXStoryChromeLayout *)self _invalidateAXGroupRole];
  }
LABEL_33:
}

- (void)setDetailedPlacementOverride:(id)a3 forItemReference:(id)a4
{
  if (a3)
  {
    uint64_t v5 = NSNumber;
    [a3 chromeAlpha];
    objc_msgSend(v5, "numberWithDouble:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(PXStoryChromeLayout *)self setAlphaOverride:v6];
  }
  else
  {
    -[PXStoryChromeLayout setAlphaOverride:](self, "setAlphaOverride:");
  }
}

- (void)getDetailedPresentedPlacement:(id)a3 forItemReference:(id)a4
{
  id v5 = a3;
  [(PXGLayout *)self alpha];
  objc_msgSend(v5, "setChromeAlpha:");
}

- (void)_handleBrowserSelectButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryChromeLayout *)self _actionPerformer];
  [v5 performActionForChromeActionMenuItem:19 withValue:0 sender:v4];
}

- (void)_handleBrowserAddPhotosButton:(id)a3
{
  id v3 = [(PXStoryChromeLayout *)self _actionPerformer];
  [v3 presentAssetPicker];
}

- (void)_handleBrowserGridButton:(id)a3
{
  id v3 = [(PXStoryChromeLayout *)self _actionPerformer];
  [v3 presentBrowserGrid];
}

- (void)_handleAutoEditButton:(id)a3
{
  id v3 = [(PXStoryChromeLayout *)self _actionPerformer];
  [v3 presentStyleSwitcher];
}

- (void)_handleToggleViewModeButton:(id)a3
{
  id v4 = [(PXStoryChromeLayout *)self viewModel];
  id v3 = [v4 mainModel];
  [v3 performChanges:&__block_literal_global_452];
}

void __51__PXStoryChromeLayout__handleToggleViewModeButton___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v2 = [v4 viewMode];
  if (v2 == 1) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [v4 setViewMode:v3];
  if (v2 != 1) {
    [v4 rewindToBeginningOfCurrentSegment];
  }
}

- (void)_handleAspectModeButton:(id)a3
{
  id v4 = [(PXStoryChromeLayout *)self viewModel];
  uint64_t v3 = [v4 mainModel];
  [v3 performChanges:&__block_literal_global_450_115548];
}

void __47__PXStoryChromeLayout__handleAspectModeButton___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setShouldAspectFitCurrentSegment:", objc_msgSend(v2, "shouldAspectFitCurrentSegment") ^ 1);
}

- (void)_handleCloseButton:(id)a3
{
  id v3 = [(PXStoryChromeLayout *)self _actionPerformer];
  [v3 dismissStoryViewController];
}

- (void)_handleMuteToggleButton:(id)a3
{
  id v3 = [(PXStoryChromeLayout *)self _actionPerformer];
  [v3 toggleMuteState];
}

- (void)_handleErrorIndicator:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryChromeLayout *)self _actionPerformer];
  [v5 performActionForChromeActionMenuItem:13 withValue:0 sender:v4];
}

- (void)_handleFavoriteButton:(id)a3
{
  id v3 = [(PXStoryChromeLayout *)self _actionPerformer];
  [v3 toggleFavoriteState];
}

- (void)_handleFeedbackButton:(id)a3
{
  id v3 = [(PXStoryChromeLayout *)self _actionPerformer];
  [v3 provideFeedback];
}

- (void)_handleShareButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PXStoryChromeLayout *)self viewModel];
  int v6 = [v5 isAtPlaybackEnd];

  if (v6)
  {
    id v7 = [(PXStoryChromeLayout *)self viewModel];
    [v7 performChanges:&__block_literal_global_447];
  }
  id v8 = [(PXStoryChromeLayout *)self _actionPerformer];
  [v8 presentSharingViewWithSender:v4];
}

uint64_t __42__PXStoryChromeLayout__handleShareButton___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShouldCountDownToUpNext:0];
}

- (void)_handleReplayButton:(id)a3
{
  id v3 = [(PXStoryChromeLayout *)self viewModel];
  [v3 performChanges:&__block_literal_global_445];
}

uint64_t __43__PXStoryChromeLayout__handleReplayButton___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rewindToBeginning:1];
}

- (void)_handleEditColorGradeButton:(id)a3
{
  id v3 = [(PXStoryChromeLayout *)self _actionPerformer];
  [v3 presentColorGradeEditor];
}

- (void)_handleEditMusicButton:(id)a3
{
  id v3 = [(PXStoryChromeLayout *)self _actionPerformer];
  [v3 presentMusicEditor];
}

- (void)_handlePlayButton:(id)a3
{
  id v3 = [(PXStoryChromeLayout *)self viewModel];
  if ([v3 isAtPlaybackEnd])
  {
    [v3 performChanges:&__block_literal_global_441];
  }
  else
  {
    id v4 = [v3 mainModel];
    uint64_t v5 = [v4 desiredPlayState];
    uint64_t v6 = 1;
    if (v5) {
      uint64_t v6 = v5;
    }
    if (v5 == 1) {
      uint64_t v6 = 0;
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__PXStoryChromeLayout__handlePlayButton___block_invoke_2;
    v7[3] = &__block_descriptor_40_e31_v16__0___PXStoryMutableModel__8l;
    v7[4] = v6;
    [v4 performChanges:v7];
  }
}

uint64_t __41__PXStoryChromeLayout__handlePlayButton___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDesiredPlayState:*(void *)(a1 + 32)];
}

uint64_t __41__PXStoryChromeLayout__handlePlayButton___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rewindToBeginning:1];
}

- (id)_actionPerformer
{
  id v2 = [(PXStoryChromeLayout *)self viewModel];
  id v3 = [v2 actionPerformer];

  return v3;
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  id v8 = [(PXStoryChromeLayout *)self viewLayoutSpec];
  id v9 = v8;
  if (self->_leftEdgeHighlightSpriteIndex != a3 && self->_rightEdgeHighlightSpriteIndex != a3)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PXStoryChromeLayout.m" lineNumber:1199 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v10 = [v8 rightEdgeHighlightImageConfiguration];

  return v10;
}

- (int64_t)stringDrawingOptionsForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 33;
}

- (UIEdgeInsets)paddingForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  double v4 = 6.0;
  double v5 = 0.0;
  double v6 = 6.0;
  double v7 = 0.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  double v4 = [(PXStoryChromeLayout *)self attributedStringForSpriteAtIndex:*(void *)&a3 inLayout:a4];
  double v5 = [v4 string];
  double v6 = v5;
  if (!v5) {
    double v5 = &stru_1F00B0030;
  }
  double v7 = v5;

  return v7;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_titleSpriteIndex == a3)
  {
    id v8 = [(PXStoryChromeLayout *)self viewModel];
    uint64_t v9 = [v8 displayTitle];
  }
  else
  {
    if (self->_subtitleSpriteIndex != a3)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:self file:@"PXStoryChromeLayout.m" lineNumber:1168 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v8 = [(PXStoryChromeLayout *)self viewModel];
    uint64_t v9 = [v8 displaySubtitle];
  }
  id v10 = (void *)v9;

  return v10;
}

- (void)_menuDidClose
{
  if (self->_shouldInvalidateActionMenuOnClose)
  {
    self->_shouldInvalidateActionMenuOnClose = 0;
    [(PXStoryChromeLayout *)self _invalidateActionMenu];
  }
}

- (id)_configurationForButtonWithAction:(SEL)a3 systemImageName:(id)a4 backgroundStyle:(int64_t)a5 label:(id)a6 axLabelKey:(id)a7
{
  id v12 = a6;
  unint64_t v13 = [(PXStoryChromeLayout *)self _configurationForButtonWithAction:a3 systemImageName:a4 backgroundStyle:a5 axLabelKey:a7];
  [v13 setLabel:v12];

  return v13;
}

- (void)_updateConfigurationUpdatedForPlaybackEnd:(id)a3
{
  id v4 = a3;
  id v6 = [(PXStoryChromeLayout *)self viewLayoutSpec];
  [v6 playbackEndButtonSystemImageWeight];
  [v4 setPreferredSystemImageWeight:(uint64_t)v5];
  [v6 playbackEndButtonSystemImagePointSize];
  objc_msgSend(v4, "setPreferredSystemImagePointSize:");
}

- (id)_configurationForBrowserSelectButton
{
  id v3 = [(PXStoryChromeLayout *)self viewLayoutSpec];
  int v4 = [v3 insideCollectionDetailsView];

  if (v4) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 3;
  }
  id v6 = [(PXStoryChromeLayout *)self _configurationForButtonWithAction:sel__handleBrowserSelectButton_ systemImageName:@"checkmark" backgroundStyle:v5 axLabelKey:@"InteractiveMemoryButtonAccessibilityLabelBrowserSelect"];
  id v7 = v6;
  if (v4)
  {
    [v6 setPreferredSystemImageWeight:6];
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v7 setSolidBackgroundColor:v8];
  }
  return v7;
}

- (id)_configurationForBrowserAddPhotosButton
{
  id v3 = [(PXStoryChromeLayout *)self viewLayoutSpec];
  int v4 = [v3 insideCollectionDetailsView];

  if (v4) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 3;
  }
  id v6 = [(PXStoryChromeLayout *)self _configurationForButtonWithAction:sel__handleBrowserAddPhotosButton_ systemImageName:@"plus" backgroundStyle:v5 axLabelKey:@"InteractiveMemoryButtonAccessibilityLabelAddPhotos"];
  id v7 = v6;
  if (v4)
  {
    [v6 setPreferredSystemImageWeight:6];
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v7 setSolidBackgroundColor:v8];
  }
  return v7;
}

- (id)_configurationForCloseButtonWithAction:(SEL)a3 systemImageName:(id)a4 axLabelKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(PXStoryChromeLayout *)self viewLayoutSpec];
  uint64_t v11 = -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", a3, v9, [v10 insideCollectionDetailsView], v8);

  [v11 setPreferredSystemImageWeight:6];
  return v11;
}

- (id)_configurationForShareButtonWithAction:(SEL)a3 systemImageName:(id)a4 backgroundStyle:(int64_t)a5 axLabelKey:(id)a6
{
  return [(PXStoryChromeLayout *)self _configurationForButtonWithAction:a3 systemImageName:a4 backgroundStyle:0 axLabelKey:a6];
}

- (id)_configurationForButtonWithAction:(SEL)a3 systemImageName:(id)a4 backgroundStyle:(int64_t)a5 axLabelKey:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = objc_alloc_init(PXStoryChromeButtonConfiguration);
  [(PXStoryChromeButtonConfiguration *)v12 setBackgroundStyle:a5];
  [(PXStoryChromeButtonConfiguration *)v12 setSystemImageName:v11];

  [(PXStoryChromeButtonConfiguration *)v12 setAction:a3];
  [(PXStoryChromeButtonConfiguration *)v12 setTarget:self];
  unint64_t v13 = [(PXStoryChromeLayout *)self viewLayoutSpec];
  char v14 = [v13 chromeButtonSpec];
  [(PXStoryChromeButtonConfiguration *)v12 setSpec:v14];

  if (v10)
  {
    id v15 = PXLocalizedStringFromTable(v10, @"PhotosUICore");
    [(PXStoryChromeButtonConfiguration *)v12 setAxLabel:v15];
  }
  return v12;
}

- (id)_configurationForLargeButtonWithAction:(SEL)a3 systemImageName:(id)a4 backgroundStyle:(int64_t)a5 axLabelKey:(id)a6
{
}

- (id)_buttonConfigurationForSpriteIndex:(unsigned int)a3
{
  id v6 = [(PXStoryChromeLayout *)self viewLayoutSpec];
  id v7 = v6;
  if (self->_replayButtonSpriteIndex == a3)
  {
    id v8 = [v6 replayButtonImageName];
    uint64_t v9 = -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:label:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:label:axLabelKey:", sel__handleReplayButton_, v8, [v7 defaultChromeButtonBackgroundStyle], 0, @"InteractiveMemoryButtonAccessibilityLabelReplay");
LABEL_3:
    id v10 = (void *)v9;

    goto LABEL_16;
  }
  if (self->_shareButtonSpriteIndex == a3)
  {
    id v10 = [(PXStoryChromeLayout *)self _configurationForShareButtonWithAction:sel__handleShareButton_ systemImageName:@"square.and.arrow.up" backgroundStyle:0 axLabelKey:@"InteractiveMemoryShareButtonLabel"];
    [v7 shareButtonExtraOffset];
    objc_msgSend(v10, "setOffset:");
    goto LABEL_16;
  }
  if (self->_browserGridButtonSpriteIndex == a3)
  {
    id v11 = sel__handleBrowserGridButton_;
    uint64_t v12 = [v6 defaultChromeButtonBackgroundStyle];
    unint64_t v13 = @"rectangle.grid.3x2.fill";
    char v14 = @"InteractiveMemoryButtonAccessibilityLabelBrowse";
LABEL_8:
    uint64_t v15 = [(PXStoryChromeLayout *)self _configurationForLargeButtonWithAction:v11 systemImageName:v13 backgroundStyle:v12 axLabelKey:v14];
LABEL_15:
    id v10 = (void *)v15;
    goto LABEL_16;
  }
  if (self->_browserAddPhotosButtonSpriteIndex == a3)
  {
    uint64_t v15 = [(PXStoryChromeLayout *)self _configurationForBrowserAddPhotosButton];
    goto LABEL_15;
  }
  if (self->_browserSelectButtonSpriteIndex == a3)
  {
    uint64_t v15 = [(PXStoryChromeLayout *)self _configurationForBrowserSelectButton];
    goto LABEL_15;
  }
  if (self->_fullsizePlayerButtonSpriteIndex == a3)
  {
    uint64_t v15 = -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:label:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:label:axLabelKey:", sel__handleToggleViewModeButton_, @"play.circle.fill", [v6 defaultChromeButtonBackgroundStyle], 0, @"InteractiveMemoryButtonAccessibilityLabelPlay");
    goto LABEL_15;
  }
  if (self->_closeButtonSpriteIndex == a3)
  {
    id v8 = [v6 closeButtonImageName];
    uint64_t v9 = [(PXStoryChromeLayout *)self _configurationForCloseButtonWithAction:sel__handleCloseButton_ systemImageName:v8 axLabelKey:@"InteractiveMemoryButtonAccessibilityLabelClose"];
    goto LABEL_3;
  }
  if (self->_closeBrowserButtonSpriteIndex == a3)
  {
    uint64_t v15 = [(PXStoryChromeLayout *)self _configurationForCloseButtonWithAction:sel__handleCloseBrowserButton_ systemImageName:@"chevron.backward" axLabelKey:@"PXBack"];
    goto LABEL_15;
  }
  if (self->_aspectModeButtonIndex == a3)
  {
    v17 = [(PXStoryChromeLayout *)self viewModel];
    v18 = [v17 mainModel];
    int v19 = [v18 shouldAspectFitCurrentSegment];
    v20 = @"rectangle.arrowtriangle.2.inward";
    if (v19) {
      v20 = @"rectangle.arrowtriangle.2.outward";
    }
    v21 = v20;

    id v10 = -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:label:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:label:axLabelKey:", sel__handleAspectModeButton_, v21, [v7 defaultChromeButtonBackgroundStyle], 0, 0);
LABEL_27:

    goto LABEL_16;
  }
  if (self->_errorIndicatorSpriteIndex == a3)
  {
    v22 = sel__handleErrorIndicator_;
    uint64_t v23 = [v6 nonblurredChromeButtonBackgroundStyle];
    v24 = @"exclamationmark.circle";
    v25 = @"InteractiveMemoryButtonAccessibilityLabelError";
    goto LABEL_30;
  }
  if (self->_muteToggleButtonSpriteIndex == a3)
  {
    v26 = [(PXStoryChromeLayout *)self viewModel];
    int v27 = [v26 isMuted];

    if (v27) {
      v28 = @"speaker.slash";
    }
    else {
      v28 = @"speaker.wave.2";
    }
    if (v27) {
      v29 = @"InteractiveMemoryButtonAccessibilityLabelUnmute";
    }
    else {
      v29 = @"InteractiveMemoryButtonAccessibilityLabelMute";
    }
    id v10 = [(PXStoryChromeLayout *)self _configurationForButtonWithAction:sel__handleMuteToggleButton_ systemImageName:v28 backgroundStyle:0 axLabelKey:v29];
    v30 = [MEMORY[0x1E4F41A60] replaceOffUpTransition];
    v31 = [v30 transitionWithByLayer];
    [v10 setSymbolTransition:v31];

    goto LABEL_16;
  }
  if (self->_styleSwitcherButtonSpriteIndex == a3)
  {
    id v11 = sel__handleAutoEditButton_;
    uint64_t v12 = [v6 defaultChromeButtonBackgroundStyle];
    unint64_t v13 = @"music.and.sparkles";
    char v14 = @"InteractiveMemoryButtonAccessibilityLabelStyles";
    goto LABEL_8;
  }
  if (self->_playbackEndReplayButtonSpriteIndex == a3)
  {
    if ([v6 onlyShowReplayEndButtonAtTopOfTitle]) {
      uint64_t v32 = [v7 defaultChromeButtonBackgroundStyle];
    }
    else {
      uint64_t v32 = 0;
    }
    v34 = sel__handleReplayButton_;
    v35 = @"arrow.counterclockwise";
    v36 = @"InteractiveMemoryButtonAccessibilityLabelReplay";
    v37 = self;
    goto LABEL_53;
  }
  if (self->_playbackEndShareButtonSpriteIndex == a3)
  {
    uint64_t v33 = [(PXStoryChromeLayout *)self _configurationForShareButtonWithAction:sel__handleShareButton_ systemImageName:@"square.and.arrow.up" backgroundStyle:0 axLabelKey:@"InteractiveMemoryShareButtonLabel"];
LABEL_54:
    v38 = (void *)v33;
    v39 = self;
    id v10 = v38;
    v40 = v38;
LABEL_55:
    [(PXStoryChromeLayout *)v39 _updateConfigurationUpdatedForPlaybackEnd:v40];
    goto LABEL_16;
  }
  if (self->_playbackEndFavoriteButtonSpriteIndex == a3)
  {
    v34 = sel__handleFavoriteButton_;
    v35 = @"heart";
    v36 = @"InteractiveMemoryButtonAccessibilityLabelFavorite";
LABEL_52:
    v37 = self;
    uint64_t v32 = 0;
LABEL_53:
    uint64_t v33 = [(PXStoryChromeLayout *)v37 _configurationForButtonWithAction:v34 systemImageName:v35 backgroundStyle:v32 axLabelKey:v36];
    goto LABEL_54;
  }
  if (self->_playbackEndUnfavoriteButtonSpriteIndex == a3)
  {
    v34 = sel__handleFavoriteButton_;
    v35 = @"heart.fill";
    v36 = @"InteractiveMemoryButtonAccessibilityLabelUnfavorite";
    goto LABEL_52;
  }
  if (self->_provideFeedbackButtonSpriteIndex == a3)
  {
    v41 = [(PXStoryChromeLayout *)self _configurationForButtonWithAction:sel__handleFeedbackButton_ systemImageName:@"exclamationmark.bubble" backgroundStyle:3 axLabelKey:0];
    v42 = [MEMORY[0x1E4FB1618] systemTealColor];
    [v41 setSolidBackgroundColor:v42];

    v39 = self;
    id v10 = v41;
    v40 = v41;
    goto LABEL_55;
  }
  if (self->_actionMenuButtonSpriteIndex != a3)
  {
    if (self->_toggleFavoriteButtonSpriteIndex == a3)
    {
      v48 = [(PXStoryChromeLayout *)self viewModel];
      v49 = [v48 mainModel];
      int v50 = [v49 currentAssetCollectionIsFavorite];

      BOOL v51 = v50 == 0;
      if (v50) {
        v52 = @"heart.fill";
      }
      else {
        v52 = @"heart";
      }
      v53 = @"InteractiveMemoryButtonAccessibilityLabelUnfavorite";
      if (v51) {
        v53 = @"InteractiveMemoryButtonAccessibilityLabelFavorite";
      }
      v54 = v53;
      v21 = v52;
      id v10 = -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", sel__handleFavoriteButton_, v21, [v7 defaultChromeButtonBackgroundStyle], v54);

      goto LABEL_27;
    }
    if (self->_editMusicButtonSpriteIndex == a3)
    {
      v22 = sel__handleEditMusicButton_;
      uint64_t v23 = [v6 defaultChromeButtonBackgroundStyle];
      v24 = @"music.badge.plus";
      v25 = @"InteractiveMemoryButtonAccessibilityLabelEditMusic";
    }
    else
    {
      if (self->_editColorGradeButtonSpriteIndex != a3)
      {
        v55 = [MEMORY[0x1E4F28B00] currentHandler];
        [v55 handleFailureInMethod:a2 object:self file:@"PXStoryChromeLayout.m" lineNumber:1076 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      v22 = sel__handleEditColorGradeButton_;
      uint64_t v23 = [v6 defaultChromeButtonBackgroundStyle];
      v24 = @"camera.filters";
      v25 = @"InteractiveMemoryButtonAccessibilityLabelEditColorGrade";
    }
LABEL_30:
    uint64_t v15 = [(PXStoryChromeLayout *)self _configurationForButtonWithAction:v22 systemImageName:v24 backgroundStyle:v23 axLabelKey:v25];
    goto LABEL_15;
  }
  v43 = [v6 actionMenuButtonImageName];
  v44 = -[PXStoryChromeLayout _configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:](self, "_configurationForButtonWithAction:systemImageName:backgroundStyle:axLabelKey:", 0, v43, [v7 nonblurredChromeButtonBackgroundStyle], @"InteractiveMemoryButtonAccessibilityLabelActionMenu");

  objc_initWeak(&location, self);
  v45 = [(PXStoryChromeLayout *)self viewModel];
  v46 = +[PXMenuBuilder defaultStoryActionsMenuWithViewModel:v45];
  uint64_t v56 = MEMORY[0x1E4F143A8];
  uint64_t v57 = 3221225472;
  v58 = __58__PXStoryChromeLayout__buttonConfigurationForSpriteIndex___block_invoke;
  v59 = &unk_1E5DD32D0;
  objc_copyWeak(&v60, &location);
  v47 = [v46 onClose:&v56];
  objc_msgSend(v44, "setMenu:", v47, v56, v57, v58, v59);

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);
  id v10 = v44;
LABEL_16:

  return v10;
}

void __58__PXStoryChromeLayout__buttonConfigurationForSpriteIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _menuDidClose];
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (self->_playButtonSpriteIndex == v4)
  {
    id v7 = [PXStoryPlayButtonConfiguration alloc];
    id v8 = [(PXStoryChromeLayout *)self viewModel];
    uint64_t v9 = [(PXStoryPlayButtonConfiguration *)v7 initWithViewModel:v8];

    [(PXStoryBufferingStatusViewConfiguration *)v9 setTarget:self];
    [(PXStoryBufferingStatusViewConfiguration *)v9 setAction:sel__handlePlayButton_];
    id v10 = [(PXStoryChromeLayout *)self viewLayoutSpec];
    id v11 = [v10 playButtonSpec];
    [(PXStoryBufferingStatusViewConfiguration *)v9 setSpec:v11];

LABEL_9:
    goto LABEL_10;
  }
  if (self->_bufferingIndicatorSpriteIndex == v4)
  {
    uint64_t v9 = objc_alloc_init(PXStoryBufferingStatusViewConfiguration);
    id v10 = [(PXStoryChromeLayout *)self viewLayoutSpec];
    -[PXStoryBufferingStatusViewConfiguration setWantsBackground:](v9, "setWantsBackground:", [v10 bufferingIndicatorWantsBackground]);
    goto LABEL_9;
  }
  if (self->_chromeButtonFocusGuideSpriteIndex == v4)
  {
    uint64_t v12 = objc_alloc_init(PXGFocusContainerGuideViewConfiguration);
  }
  else
  {
    if (self->_infoPanelSpriteIndex == v4)
    {
      uint64_t v9 = objc_alloc_init(PXStoryTVInfoPanelViewConfiguration);
      id v10 = [(PXStoryChromeLayout *)self viewModel];
      [(PXStoryBufferingStatusViewConfiguration *)v9 setViewModel:v10];
      goto LABEL_9;
    }
    uint64_t v12 = [(PXStoryChromeLayout *)self _buttonConfigurationForSpriteIndex:v4];
  }
  uint64_t v9 = (PXStoryBufferingStatusViewConfiguration *)v12;
LABEL_10:

  return v9;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v4 = a4;
  uint64_t v5 = objc_opt_class();

  return (Class)v5;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)PXStoryChromeLayout;
  uint64_t v5 = -[PXGLayout hitTestResultForSpriteIndex:](&v10, sel_hitTestResultForSpriteIndex_);
  if (self->_titleSpriteIndex == v3 || self->_subtitleSpriteIndex == v3)
  {
    id v6 = [(PXFeedHitTestResult *)[PXStoryHitTestResult alloc] initWithSpriteIndex:v3 layout:self];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__PXStoryChromeLayout_hitTestResultForSpriteIndex___block_invoke;
    v9[3] = &unk_1E5DBB5C0;
    void v9[4] = self;
    uint64_t v7 = [(PXFeedHitTestResult *)v6 primaryAction:v9];

    uint64_t v5 = (void *)v7;
  }
  return v5;
}

uint64_t __51__PXStoryChromeLayout_hitTestResultForSpriteIndex___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) viewModel];
  [v1 performChanges:&__block_literal_global_115681];

  return 1;
}

void __51__PXStoryChromeLayout_hitTestResultForSpriteIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setShowSongInTitleWhenPaused:", objc_msgSend(v2, "showSongInTitleWhenPaused") ^ 1);
}

- (void)_invalidateAXGroupRole
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = [NSString stringWithUTF8String:"-[PXStoryChromeLayout _invalidateAXGroupRole]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryChromeLayout.m", 937, @"invalidating %lu after it already has been updated", 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 8;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_updateContentAlpha
{
  [(PXGLayout *)self alpha];
  double v4 = v3;
  uint64_t v5 = [(PXStoryChromeLayout *)self alphaOverride];
  id v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    double v4 = v7;
  }
  id v8 = [(PXStoryChromeLayout *)self viewModel];
  [v8 chromeVisibilityFraction];
  uint64_t v10 = v9;
  id v11 = [(PXStoryChromeLayout *)self mainModel];
  [v11 infoPanelVisibilityFraction];
  uint64_t v13 = v12;

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  uint64_t v14 = [(PXGLayout *)self localNumberOfSprites];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__PXStoryChromeLayout__updateContentAlpha__block_invoke;
  v17[3] = &unk_1E5DBB570;
  *(double *)&v17[7] = v4;
  v17[8] = v10;
  v17[9] = v13;
  v17[4] = self;
  v17[5] = v22;
  v17[6] = &v18;
  [(PXGLayout *)self modifySpritesInRange:v14 << 32 state:v17];
  uint64_t v15 = v19[3];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__PXStoryChromeLayout__updateContentAlpha__block_invoke_3;
  v16[3] = &unk_1E5DBB598;
  v16[4] = v22;
  v16[5] = &v18;
  v16[6] = v15;
  [v8 performChanges:v16];
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);
}

void __42__PXStoryChromeLayout__updateContentAlpha__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = [*(id *)(a1 + 32) itemControllers];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__PXStoryChromeLayout__updateContentAlpha__block_invoke_2;
  v7[3] = &unk_1E5DBB548;
  long long v10 = *(_OWORD *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v12 = a4;
  long long v8 = *(_OWORD *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

void __42__PXStoryChromeLayout__updateContentAlpha__block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  [v4 setBufferingIndicatorVisibilityFraction:v3];
  [v4 setMuteToggleButtonVisibilityFraction:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [v4 setMaximumIndividualTopChromeItemVisibilityFraction:*(double *)(a1 + 48)];
}

void __42__PXStoryChromeLayout__updateContentAlpha__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  unsigned int v6 = [a2 integerValue];
  [v5 alpha];
  double v8 = v7;

  double v9 = v8 * *(double *)(a1 + 56);
  long long v10 = *(_DWORD **)(a1 + 32);
  if (v10[277] != v6 && v10[276] != v6 && v10[279] != v6 && v10[258] != v6 && v10[259] != v6)
  {
    double v11 = *(double *)(a1 + 64);
    if (v10[282] != v6) {
      double v11 = v11 * (1.0 - *(double *)(a1 + 72));
    }
    double v9 = v9 * v11;
  }
  float v12 = v9;
  *(float *)(*(void *)(a1 + 80) + 160 * v6) = v12;
  uint64_t v13 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v13 + 1116) == v6)
  {
    uint64_t v14 = a1 + 40;
  }
  else
  {
    if (*(_DWORD *)(v13 + 1036) != v6) {
      return;
    }
    uint64_t v14 = a1 + 48;
  }
  *(double *)(*(void *)(*(void *)v14 + 8) + 24) = v9;
}

- (void)_invalidateContentAlpha
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      unsigned int v6 = [NSString stringWithUTF8String:"-[PXStoryChromeLayout _invalidateContentAlpha]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryChromeLayout.m", 890, @"invalidating %lu after it already has been updated", 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 2;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_configureUnifiedContentLayout:(id)a3
{
  id v4 = a3;
  [(PXStoryChromeLayout *)self viewModel];
  objc_claimAutoreleasedReturnValue();
  [(PXStoryChromeLayout *)self mainLayoutSpec];
  objc_claimAutoreleasedReturnValue();
  [(PXGLayout *)self displayScale];
  long long v7 = *MEMORY[0x1E4F1DAD8];
  [(PXGLayout *)self referenceSize];
  [v4 chromeButtonSize];
  [v4 chromeButtonPadding];
  [(PXGLayout *)self referenceDepth];
  unsigned int v6 = [(PXStoryChromeLayout *)self mainModel];
  [v6 infoPanelVisibilityFraction];

  [v4 infoPanelAnimationDistance];
  PXFloatByLinearlyInterpolatingFloats();
}

void __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke()
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2020000000;
  v3[3] = 0x7FEFFFFFFFFFFFFFLL;
  v0[0] = 0;
  v0[1] = v0;
  v0[2] = 0x4010000000;
  v0[3] = &unk_1AB5D584F;
  long long v1 = 0u;
  long long v2 = 0u;
  PXRectWithSizeAlignedToRectEdgesWithPadding();
}

double __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_2(uint64_t a1, int a2)
{
  double v3 = *(CGRect **)(*(void *)(a1 + 40) + 8);
  double x = v3[1].origin.x;
  CGFloat y = v3[1].origin.y;
  CGFloat width = v3[1].size.width;
  CGFloat height = v3[1].size.height;
  if (a2)
  {
    double MinX = CGRectGetMinX(v3[1]);
    [*(id *)(a1 + 32) interChromeButtonSpacing];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = MinX
                                                                - v9
                                                                - *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 48);
  }
  double v10 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v13.origin.double x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double v11 = CGRectGetMinX(v13);
  if (v10 < v11) {
    double v11 = v10;
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
  return x;
}

float32x2_t __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_3(uint64_t a1, unsigned int a2)
{
  v16.origin.CGFloat x = (*(double (**)(void))(*(void *)(a1 + 40) + 16))();
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  uint64_t v8 = *(void *)(a1 + 48) + 32 * a2;
  float v9 = *(double *)(a1 + 56);
  CGFloat MidX = CGRectGetMidX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat v15 = CGRectGetWidth(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v12 = CGRectGetHeight(v19);
  v13.f64[0] = v15;
  v13.f64[1] = v12;
  float32x2_t result = vcvt_f32_f64(v13);
  *(CGFloat *)uint64_t v8 = MidX;
  *(CGFloat *)(v8 + 8) = MidY;
  *(double *)(v8 + 16) = v9;
  *(float32x2_t *)(v8 + 24) = result;
  *(_WORD *)(*(void *)(a1 + 64) + 40 * a2 + 32) = *(_WORD *)(*(void *)(a1 + 32) + 1152);
  return result;
}

uint64_t __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) chromeItems];
  long long v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

double __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) attributedStringForSpriteAtIndex:a2 inLayout:*(void *)(a1 + 32)];
  if ([v5 length]
    && (objc_msgSend(v5, "px_sizeWithProposedWidth:maximumLines:drawingOptions:", a3, 1, *(double *)(a1 + 40)),
        v6 > 0.0))
  {
    double v7 = ceil(v6);
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
  }

  return v7;
}

double __54__PXStoryChromeLayout__configureUnifiedContentLayout___block_invoke_6(uint64_t a1)
{
  return 80.0;
}

- (void)_configureDefaultContentLayout:(id)a3
{
  id v4 = a3;
  [(PXStoryChromeLayout *)self viewModel];
  objc_claimAutoreleasedReturnValue();
  [(PXGLayout *)self referenceSize];
  [(PXGLayout *)self displayScale];
  [v4 chromeButtonSize];
  [v4 chromeButtonPadding];
  [(PXGLayout *)self referenceDepth];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x4010000000;
  v5[3] = &unk_1AB5D584F;
  long long v6 = 0u;
  long long v7 = 0u;
  PXRectWithSizeAlignedToRectEdgesWithPadding();
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke(uint64_t a1, int a2)
{
  long long v2 = *(CGRect **)(*(void *)(a1 + 40) + 8);
  double x = v2[1].origin.x;
  if (a2)
  {
    double MinX = CGRectGetMinX(v2[1]);
    [*(id *)(a1 + 32) interChromeButtonSpacing];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = MinX
                                                                - v6
                                                                - *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 48);
  }
  return x;
}

void __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_2(uint64_t a1, void *a2)
{
}

void __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_3(uint64_t a1, void *a2)
{
}

void __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_4(uint64_t a1, void *a2)
{
}

void __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) styleSwitcherButtonPlacement] == 4)
  {
    uint64_t v8 = *(void *)(a1 + 56);
    float v9 = [*(id *)(a1 + 40) _buttonConfigurationForSpriteIndex:*(unsigned int *)(*(void *)(a1 + 40) + 1072)];
    CGFloat v10 = (*(double (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    uint64_t v17 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 1072);
    float v18 = *(double *)(a1 + 96);
    v121.origin.CGFloat x = v10;
    v121.origin.CGFloat y = v12;
    v121.size.CGFloat width = v14;
    v121.size.CGFloat height = v16;
    CGFloat MidX = CGRectGetMidX(v121);
    v122.origin.CGFloat x = v10;
    v122.origin.CGFloat y = v12;
    v122.size.CGFloat width = v14;
    v122.size.CGFloat height = v16;
    CGFloat MidY = CGRectGetMidY(v122);
    v123.origin.CGFloat x = v10;
    v123.origin.CGFloat y = v12;
    v123.size.CGFloat width = v14;
    v123.size.CGFloat height = v16;
    CGFloat Width = CGRectGetWidth(v123);
    v124.origin.CGFloat x = v10;
    v124.origin.CGFloat y = v12;
    v124.size.CGFloat width = v14;
    v124.size.CGFloat height = v16;
    CGFloat Height = CGRectGetHeight(v124);
    v22.f64[0] = Width;
    v22.f64[1] = Height;
    *(CGFloat *)uint64_t v17 = MidX;
    *(CGFloat *)(v17 + 8) = MidY;
    *(double *)(v17 + 16) = v18;
    *(float32x2_t *)(v17 + 24) = vcvt_f32_f64(v22);
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 1072) + 32) = *(_WORD *)(*(void *)(a1 + 40)
                                                                                             + 1152);
  }
  v125.origin.CGFloat x = (*(double (**)(void))(*(void *)(a1 + 64) + 16))();
  CGFloat x = v125.origin.x;
  CGFloat y = v125.origin.y;
  CGFloat v25 = v125.size.width;
  CGFloat v26 = v125.size.height;
  uint64_t v27 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 1056);
  float v28 = *(double *)(a1 + 96);
  CGFloat v29 = CGRectGetMidX(v125);
  v126.origin.CGFloat x = x;
  v126.origin.CGFloat y = y;
  v126.size.CGFloat width = v25;
  v126.size.CGFloat height = v26;
  CGFloat v30 = CGRectGetMidY(v126);
  v127.origin.CGFloat x = x;
  v127.origin.CGFloat y = y;
  v127.size.CGFloat width = v25;
  v127.size.CGFloat height = v26;
  CGFloat v116 = CGRectGetWidth(v127);
  v128.origin.CGFloat x = x;
  v128.origin.CGFloat y = y;
  v128.size.CGFloat width = v25;
  v128.size.CGFloat height = v26;
  CGFloat v31 = CGRectGetHeight(v128);
  v32.f64[0] = v116;
  v32.f64[1] = v31;
  *(CGFloat *)uint64_t v27 = v29;
  *(CGFloat *)(v27 + 8) = v30;
  *(double *)(v27 + 16) = v28;
  *(float32x2_t *)(v27 + 24) = vcvt_f32_f64(v32);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 1056) + 32) = *(_WORD *)(*(void *)(a1 + 40)
                                                                                           + 1152);
  uint64_t v33 = [*(id *)(a1 + 40) viewLayoutSpec];
  LOBYTE(v27) = [v33 insideCollectionDetailsView];

  if ((v27 & 1) == 0)
  {
    uint64_t v34 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 1060);
    float v35 = *(double *)(a1 + 96);
    v129.origin.CGFloat x = x;
    v129.origin.CGFloat y = y;
    v129.size.CGFloat width = v25;
    v129.size.CGFloat height = v26;
    CGFloat v36 = CGRectGetMidX(v129);
    v130.origin.CGFloat x = x;
    v130.origin.CGFloat y = y;
    v130.size.CGFloat width = v25;
    v130.size.CGFloat height = v26;
    CGFloat v37 = CGRectGetMidY(v130);
    v131.origin.CGFloat x = x;
    v131.origin.CGFloat y = y;
    v131.size.CGFloat width = v25;
    v131.size.CGFloat height = v26;
    CGFloat v109 = CGRectGetWidth(v131);
    v132.origin.CGFloat x = x;
    v132.origin.CGFloat y = y;
    v132.size.CGFloat width = v25;
    v132.size.CGFloat height = v26;
    CGFloat v38 = CGRectGetHeight(v132);
    v39.f64[0] = v109;
    v39.f64[1] = v38;
    *(CGFloat *)uint64_t v34 = v36;
    *(CGFloat *)(v34 + 8) = v37;
    *(double *)(v34 + 16) = v35;
    *(float32x2_t *)(v34 + 24) = vcvt_f32_f64(v39);
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 1060) + 32) = *(_WORD *)(*(void *)(a1 + 40)
                                                                                             + 1152);
  }
  uint64_t v40 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 1068);
  float v41 = *(double *)(a1 + 96);
  v133.origin.CGFloat x = x;
  v133.origin.CGFloat y = y;
  v133.size.CGFloat width = v25;
  v133.size.CGFloat height = v26;
  CGFloat v42 = CGRectGetMidX(v133);
  v134.origin.CGFloat x = x;
  v134.origin.CGFloat y = y;
  v134.size.CGFloat width = v25;
  v134.size.CGFloat height = v26;
  CGFloat v43 = CGRectGetMidY(v134);
  v135.origin.CGFloat x = x;
  v135.origin.CGFloat y = y;
  v135.size.CGFloat width = v25;
  v135.size.CGFloat height = v26;
  CGFloat v110 = CGRectGetWidth(v135);
  v136.origin.CGFloat x = x;
  v136.origin.CGFloat y = y;
  v136.size.CGFloat width = v25;
  v136.size.CGFloat height = v26;
  CGFloat v44 = CGRectGetHeight(v136);
  v45.f64[0] = v110;
  v45.f64[1] = v44;
  *(CGFloat *)uint64_t v40 = v42;
  *(CGFloat *)(v40 + 8) = v43;
  *(double *)(v40 + 16) = v41;
  *(float32x2_t *)(v40 + 24) = vcvt_f32_f64(v45);
  *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 1068) + 32) = *(_WORD *)(*(void *)(a1 + 40)
                                                                                           + 1152);
  if ([*(id *)(a1 + 32) playButtonPlacement] == 1)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    double v47 = v46;
    CGFloat v49 = v48;
    double v51 = v50;
    double v52 = CGRectGetMidX(*(CGRect *)(a1 + 104)) + v48 * -0.5;
  }
  else if ([*(id *)(a1 + 32) playButtonPlacement] == 4)
  {
    v53 = *(double **)(*(void *)(a1 + 88) + 8);
    double v52 = v53[4];
    double v47 = v53[5];
    CGFloat v49 = v53[6];
    double v51 = v53[7];
  }
  else
  {
    double v52 = (*(double (**)(void))(*(void *)(a1 + 64) + 16))();
    double v47 = v54;
    CGFloat v49 = v55;
    double v51 = v56;
  }
  if ([*(id *)(a1 + 32) shouldVerticallyCenterPlayButton]) {
    double v47 = CGRectGetMidY(*(CGRect *)(a1 + 104)) + v51 * -0.5;
  }
  uint64_t v57 = (id *)(a1 + 40);
  uint64_t v58 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 1024);
  float v59 = *(double *)(a1 + 96);
  v137.origin.CGFloat x = v52;
  v137.origin.CGFloat y = v47;
  v137.size.CGFloat width = v49;
  v137.size.CGFloat height = v51;
  CGFloat v60 = CGRectGetMidX(v137);
  v138.origin.CGFloat x = v52;
  v138.origin.CGFloat y = v47;
  v138.size.CGFloat width = v49;
  v138.size.CGFloat height = v51;
  CGFloat v61 = CGRectGetMidY(v138);
  v139.origin.CGFloat x = v52;
  v139.origin.CGFloat y = v47;
  v139.size.CGFloat width = v49;
  v139.size.CGFloat height = v51;
  CGFloat v111 = CGRectGetWidth(v139);
  v140.origin.CGFloat x = v52;
  v140.origin.CGFloat y = v47;
  v140.size.CGFloat width = v49;
  v140.size.CGFloat height = v51;
  CGFloat v62 = CGRectGetHeight(v140);
  v63.f64[0] = v111;
  v63.f64[1] = v62;
  *(CGFloat *)uint64_t v58 = v60;
  *(CGFloat *)(v58 + 8) = v61;
  *(double *)(v58 + 16) = v59;
  *(float32x2_t *)(v58 + 24) = vcvt_f32_f64(v63);
  *(_WORD *)(a5 + 40 * *((unsigned int *)*v57 + 256) + 32) = *((_WORD *)*v57 + 576);
  uint64_t v64 = *(void *)(a1 + 56);
  v65 = [*v57 _buttonConfigurationForSpriteIndex:*((unsigned int *)*v57 + 257)];
  CGFloat v66 = (*(double (**)(uint64_t, void *, uint64_t))(v64 + 16))(v64, v65, 1);
  CGFloat v68 = v67;
  CGFloat v70 = v69;
  CGFloat v72 = v71;

  uint64_t v73 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 1028);
  float v74 = *(double *)(a1 + 96);
  v141.origin.CGFloat x = v66;
  v141.origin.CGFloat y = v68;
  v141.size.CGFloat width = v70;
  v141.size.CGFloat height = v72;
  CGFloat v75 = CGRectGetMidX(v141);
  v142.origin.CGFloat x = v66;
  v142.origin.CGFloat y = v68;
  v142.size.CGFloat width = v70;
  v142.size.CGFloat height = v72;
  CGFloat v76 = CGRectGetMidY(v142);
  v143.origin.CGFloat x = v66;
  v143.origin.CGFloat y = v68;
  v143.size.CGFloat width = v70;
  v143.size.CGFloat height = v72;
  CGFloat v112 = CGRectGetWidth(v143);
  v144.origin.CGFloat x = v66;
  v144.origin.CGFloat y = v68;
  v144.size.CGFloat width = v70;
  v144.size.CGFloat height = v72;
  CGFloat v77 = CGRectGetHeight(v144);
  v78.f64[0] = v112;
  v78.f64[1] = v77;
  *(CGFloat *)uint64_t v73 = v75;
  *(CGFloat *)(v73 + 8) = v76;
  *(double *)(v73 + 16) = v74;
  *(float32x2_t *)(v73 + 24) = vcvt_f32_f64(v78);
  *(_WORD *)(a5 + 40 * *((unsigned int *)*v57 + 257) + 32) = *((_WORD *)*v57 + 576);
  uint64_t v79 = *(void *)(a1 + 56);
  v80 = [*v57 _buttonConfigurationForSpriteIndex:*((unsigned int *)*v57 + 283)];
  CGFloat v81 = (*(double (**)(uint64_t, void *, uint64_t))(v79 + 16))(v79, v80, 1);
  CGFloat v83 = v82;
  CGFloat v85 = v84;
  CGFloat v87 = v86;

  uint64_t v88 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 1132);
  float v89 = *(double *)(a1 + 96);
  v145.origin.CGFloat x = v81;
  v145.origin.CGFloat y = v83;
  v145.size.CGFloat width = v85;
  v145.size.CGFloat height = v87;
  CGFloat v90 = CGRectGetMidX(v145);
  v146.origin.CGFloat x = v81;
  v146.origin.CGFloat y = v83;
  v146.size.CGFloat width = v85;
  v146.size.CGFloat height = v87;
  CGFloat v91 = CGRectGetMidY(v146);
  v147.origin.CGFloat x = v81;
  v147.origin.CGFloat y = v83;
  v147.size.CGFloat width = v85;
  v147.size.CGFloat height = v87;
  CGFloat v113 = CGRectGetWidth(v147);
  v148.origin.CGFloat x = v81;
  v148.origin.CGFloat y = v83;
  v148.size.CGFloat width = v85;
  v148.size.CGFloat height = v87;
  CGFloat v92 = CGRectGetHeight(v148);
  v93.f64[0] = v113;
  v93.f64[1] = v92;
  *(CGFloat *)uint64_t v88 = v90;
  *(CGFloat *)(v88 + 8) = v91;
  *(double *)(v88 + 16) = v89;
  *(float32x2_t *)(v88 + 24) = vcvt_f32_f64(v93);
  *(_WORD *)(a5 + 40 * *((unsigned int *)*v57 + 283) + 32) = *((_WORD *)*v57 + 576);
  uint64_t v94 = *(void *)(a1 + 56);
  v95 = [*v57 _buttonConfigurationForSpriteIndex:*((unsigned int *)*v57 + 284)];
  CGFloat v96 = (*(double (**)(uint64_t, void *, uint64_t))(v94 + 16))(v94, v95, 1);
  CGFloat v98 = v97;
  CGFloat v100 = v99;
  CGFloat v102 = v101;

  uint64_t v103 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 1136);
  float v104 = *(double *)(a1 + 96);
  v149.origin.CGFloat x = v96;
  v149.origin.CGFloat y = v98;
  v149.size.CGFloat width = v100;
  v149.size.CGFloat height = v102;
  CGFloat v105 = CGRectGetMidX(v149);
  v150.origin.CGFloat x = v96;
  v150.origin.CGFloat y = v98;
  v150.size.CGFloat width = v100;
  v150.size.CGFloat height = v102;
  CGFloat v106 = CGRectGetMidY(v150);
  v151.origin.CGFloat x = v96;
  v151.origin.CGFloat y = v98;
  v151.size.CGFloat width = v100;
  v151.size.CGFloat height = v102;
  CGFloat v114 = CGRectGetWidth(v151);
  v152.origin.CGFloat x = v96;
  v152.origin.CGFloat y = v98;
  v152.size.CGFloat width = v100;
  v152.size.CGFloat height = v102;
  CGFloat v107 = CGRectGetHeight(v152);
  v108.f64[0] = v114;
  v108.f64[1] = v107;
  *(CGFloat *)uint64_t v103 = v105;
  *(CGFloat *)(v103 + 8) = v106;
  *(double *)(v103 + 16) = v104;
  *(float32x2_t *)(v103 + 24) = vcvt_f32_f64(v108);
  *(_WORD *)(a5 + 40 * *((unsigned int *)*v57 + 284) + 32) = *((_WORD *)*v57 + 576);
  v117[0] = 0;
  v117[1] = v117;
  v117[2] = 0x4010000000;
  v117[3] = &unk_1AB5D584F;
  long long v118 = 0u;
  long long v119 = 0u;
  [*(id *)(a1 + 32) playbackEndButtonSize];
  [*(id *)(a1 + 32) playbackEndButtonPadding];
  PXRectWithSizeAlignedToRectEdgesWithPadding();
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_6(uint64_t a1)
{
  long long v2 = *(double **)(*(void *)(a1 + 40) + 8);
  double v3 = v2[4];
  v7.origin.CGFloat x = v3;
  v7.origin.CGFloat y = v2[5];
  v7.size.CGFloat width = v2[6];
  v7.size.CGFloat height = v2[7];
  double MaxX = CGRectGetMaxX(v7);
  [*(id *)(a1 + 32) interPlaybackEndButtonSpacing];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = MaxX + v5;
  return v3;
}

float32x2_t __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_7(uint64_t a1, unsigned int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v12 = *(void *)(a1 + 40) + 32 * a2;
  float v13 = *(double *)(a1 + 48);
  CGFloat MidX = CGRectGetMidX(*(CGRect *)&a3);
  v20.origin.CGFloat x = a3;
  v20.origin.CGFloat y = a4;
  v20.size.CGFloat width = a5;
  v20.size.CGFloat height = a6;
  CGFloat MidY = CGRectGetMidY(v20);
  v21.origin.CGFloat x = a3;
  v21.origin.CGFloat y = a4;
  v21.size.CGFloat width = a5;
  v21.size.CGFloat height = a6;
  CGFloat Width = CGRectGetWidth(v21);
  v22.origin.CGFloat x = a3;
  v22.origin.CGFloat y = a4;
  v22.size.CGFloat width = a5;
  v22.size.CGFloat height = a6;
  CGFloat Height = CGRectGetHeight(v22);
  v17.f64[0] = Width;
  v17.f64[1] = Height;
  float32x2_t result = vcvt_f32_f64(v17);
  *(CGFloat *)uint64_t v12 = MidX;
  *(CGFloat *)(v12 + 8) = MidY;
  *(double *)(v12 + 16) = v13;
  *(float32x2_t *)(v12 + 24) = result;
  *(_WORD *)(*(void *)(a1 + 56) + 40 * a2 + 32) = *(_WORD *)(*(void *)(a1 + 32) + 1152);
  return result;
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = [*(id *)(a1 + 32) _buttonConfigurationForSpriteIndex:a2];
  double v7 = (*(double (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, a3);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  (*(void (**)(double, double, double, double))(*(void *)(a1 + 48) + 16))(v7, v9, v11, v13);
  if (a3)
  {
    CGFloat v14 = *(double **)(*(void *)(a1 + 56) + 8);
    v14[4] = v7;
    v14[5] = v9;
    v14[6] = v11;
    v14[7] = v13;
  }
  return v7;
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  double v6 = [*(id *)(a1 + 32) _buttonConfigurationForSpriteIndex:a2];
  double v7 = (*(double (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, a3);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  (*(void (**)(double, double, double, double))(*(void *)(a1 + 48) + 16))(v7, v9, v11, v13);
  if (a3)
  {
    CGFloat v14 = *(double **)(*(void *)(a1 + 56) + 8);
    v14[4] = v7;
    v14[5] = v9;
    v14[6] = v11;
    v14[7] = v13;
  }
  return v7;
}

double __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_269(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) attributedStringForSpriteAtIndex:a2 inLayout:*(void *)(a1 + 32)];
  if ([v5 length]
    && (objc_msgSend(v5, "px_sizeWithProposedWidth:maximumLines:drawingOptions:", a3, 1, *(double *)(a1 + 40)),
        v6 > 0.0))
  {
    double v7 = ceil(v6);
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB30];
  }

  return v7;
}

void __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_2_271(uint64_t a1)
{
  if ([*(id *)(a1 + 32) wantsRelatedOverlayVisible])
  {
    if ([*(id *)(a1 + 40) onlyShowReplayEndButtonAtTopOfTitle]) {
      CGRectGetMaxY(*(CGRect *)(a1 + 80));
    }
    [*(id *)(a1 + 40) spacingBetweenPlaybackEndButtonAndTitles];
    CGRectGetMidX(*(CGRect *)(a1 + 112));
  }
  else
  {
    [*(id *)(a1 + 56) safeAreaInsets];
    CGRectGetMidY(*(CGRect *)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
    uint64_t v2 = *(void *)(a1 + 152);
    if (v2 == 1)
    {
      CGRectGetMidX(*(CGRect *)(a1 + 160));
    }
    else
    {
      if (v2)
      {
        double v3 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 144), *(void *)(a1 + 56), @"PXStoryChromeLayout.m", 717, @"unsupported text alignment %li", *(void *)(a1 + 152));

        abort();
      }
      CGRectGetMinX(*(CGRect *)(a1 + 160));
    }
  }
  sub_1AB23B20C();
}

void __54__PXStoryChromeLayout__configureDefaultContentLayout___block_invoke_3_273(uint64_t a1)
{
}

- (void)_updateContentLayout
{
}

- (void)_invalidateContentLayout
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if (self->_updateFlags.updated)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryChromeLayout _invalidateContentLayout]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryChromeLayout.m", 358, @"invalidating %lu after it already has been updated", 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 1;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)_invalidateActionMenu
{
  double v3 = [(PXStoryChromeLayout *)self viewModel];
  int v4 = [v3 isActionMenuOpen];

  if (v4)
  {
    self->_shouldInvalidateActionMenuOnClose = 1;
  }
  else
  {
    ++self->_actionMenuButtonVersion;
    [(PXStoryChromeLayout *)self _invalidateContentLayout];
  }
}

- (void)_invalidateContent
{
}

- (void)_updateMainModel
{
  id v4 = [(PXStoryChromeLayout *)self viewModel];
  double v3 = [v4 mainModel];
  [(PXStoryChromeLayout *)self setMainModel:v3];
}

- (void)_invalidateMainModel
{
  p_updateFlags = &self->_updateFlags;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->unint64_t needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryChromeLayout _invalidateMainModel]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXStoryChromeLayout.m", 336, @"invalidating %lu after it already has been updated", 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate) {
    goto LABEL_5;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->unint64_t needsUpdate = 4;
  if (!willPerformUpdate)
  {
    [(PXGLayout *)self setNeedsUpdate];
  }
}

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryChromeLayout;
  [(PXGCompositeLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryChromeLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryChromeLayout.m", 332, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
  }
}

- (void)update
{
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.BOOL willPerformUpdate = 0;
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      double v9 = [NSString stringWithUTF8String:"-[PXStoryChromeLayout update]"];
      [v8 handleFailureInFunction:v9, @"PXStoryChromeLayout.m", 313, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 4;
    if ((needsUpdate & 4) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFBLL;
      [(PXStoryChromeLayout *)self _updateMainModel];
      if (!p_updateFlags->isPerformingUpdate)
      {
        CGFloat v16 = [MEMORY[0x1E4F28B00] currentHandler];
        float64x2_t v17 = [NSString stringWithUTF8String:"-[PXStoryChromeLayout update]"];
        [v16 handleFailureInFunction:v17, @"PXStoryChromeLayout.m", 317, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
    }
    unint64_t v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if (v5)
    {
      p_updateFlags->unint64_t needsUpdate = v5 & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryChromeLayout *)self _updateContentLayout];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      double v11 = [NSString stringWithUTF8String:"-[PXStoryChromeLayout update]"];
      [v10 handleFailureInFunction:v11, @"PXStoryChromeLayout.m", 320, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v6 & 2) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v6 & 0xFFFFFFFFFFFFFFFDLL;
      [(PXStoryChromeLayout *)self _updateContentAlpha];
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      double v12 = [MEMORY[0x1E4F28B00] currentHandler];
      double v13 = [NSString stringWithUTF8String:"-[PXStoryChromeLayout update]"];
      [v12 handleFailureInFunction:v13, @"PXStoryChromeLayout.m", 323, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
    }
    unint64_t v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->unint64_t needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      [(PXStoryChromeLayout *)self _updateAXGroupRole];
      unint64_t v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      CGFloat v14 = [MEMORY[0x1E4F28B00] currentHandler];
      double v15 = [NSString stringWithUTF8String:"-[PXStoryChromeLayout update]"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"PXStoryChromeLayout.m", 326, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PXStoryChromeLayout;
  [(PXGCompositeLayout *)&v18 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryChromeLayout;
  [(PXGCompositeLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    double v3 = [MEMORY[0x1E4F28B00] currentHandler];
    id v4 = [NSString stringWithUTF8String:"-[PXStoryChromeLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryChromeLayout.m", 309, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (void)setAlphaOverride:(id)a3
{
  unint64_t v7 = (NSNumber *)a3;
  objc_super v5 = self->_alphaOverride;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(NSNumber *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_alphaOverride, a3);
      [(PXStoryChromeLayout *)self _invalidateContentAlpha];
    }
  }
}

- (void)setRecipeManager:(id)a3
{
  objc_super v5 = (PXStoryRecipeManager *)a3;
  recipeManager = self->_recipeManager;
  if (recipeManager != v5)
  {
    unint64_t v7 = v5;
    [(PXStoryRecipeManager *)recipeManager unregisterChangeObserver:self context:RecipeManagerObservationContext];
    objc_storeStrong((id *)&self->_recipeManager, a3);
    [(PXStoryRecipeManager *)self->_recipeManager registerChangeObserver:self context:RecipeManagerObservationContext];
    [(PXStoryChromeLayout *)self _invalidateActionMenu];
    objc_super v5 = v7;
  }
}

- (void)setMainModel:(id)a3
{
  double v10 = (PXStoryModel *)a3;
  p_mainModel = &self->_mainModel;
  char v6 = self->_mainModel;
  if (v6 == v10)
  {
  }
  else
  {
    char v7 = [(PXStoryModel *)v10 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      [(PXStoryModel *)*p_mainModel unregisterChangeObserver:self context:MainModelObservationContext_115539];
      objc_storeStrong((id *)&self->_mainModel, a3);
      [(PXStoryModel *)*p_mainModel registerChangeObserver:self context:MainModelObservationContext_115539];
      double v8 = [(PXStoryChromeLayout *)self mainModel];
      double v9 = [v8 recipeManager];
      [(PXStoryChromeLayout *)self setRecipeManager:v9];

      [(PXStoryChromeLayout *)self _invalidateActionMenu];
    }
  }
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryChromeLayout;
  [(PXGLayout *)&v3 alphaDidChange];
  [(PXStoryChromeLayout *)self _invalidateContentAlpha];
}

- (void)referenceDepthDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryChromeLayout;
  [(PXGCompositeLayout *)&v3 referenceDepthDidChange];
  [(PXStoryChromeLayout *)self _invalidateContentLayout];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryChromeLayout;
  [(PXGCompositeLayout *)&v3 referenceSizeDidChange];
  [(PXStoryChromeLayout *)self _invalidateContentLayout];
}

- (PXStoryRelatedLayoutGenerator)layoutGenerator
{
  layoutGenerator = self->_layoutGenerator;
  if (!layoutGenerator)
  {
    id v4 = [PXStoryRelatedLayoutGenerator alloc];
    objc_super v5 = [(PXStoryChromeLayout *)self viewModel];
    char v6 = [v5 viewLayoutSpec];
    char v7 = [v6 relatedLayoutMetrics];
    double v8 = [(PXStoryRelatedLayoutGenerator *)v4 initWithMetrics:v7];
    double v9 = self->_layoutGenerator;
    self->_layoutGenerator = v8;

    [(PXStoryRelatedLayoutGenerator *)self->_layoutGenerator setItemCount:1];
    double v10 = [(PXStoryChromeLayout *)self viewModel];
    double v11 = [v10 viewLayoutSpec];
    double v12 = [v11 relatedLayoutMetrics];
    [(PXStoryRelatedLayoutGenerator *)self->_layoutGenerator setMetrics:v12];

    layoutGenerator = self->_layoutGenerator;
  }
  return layoutGenerator;
}

- (id)mainLayoutSpec
{
  uint64_t v2 = [(PXStoryChromeLayout *)self mainModel];
  objc_super v3 = [v2 layoutSpec];

  return v3;
}

- (PXStoryViewLayoutSpec)viewLayoutSpec
{
  uint64_t v2 = [(PXStoryChromeLayout *)self viewModel];
  objc_super v3 = [v2 viewLayoutSpec];

  return (PXStoryViewLayoutSpec *)v3;
}

- (unsigned)_addSpriteForChromeItemController:(id)a3 mediaKind:(unsigned __int8)a4 presentationType:(unsigned __int8)a5
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __84__PXStoryChromeLayout__addSpriteForChromeItemController_mediaKind_presentationType___block_invoke;
  v11[3] = &__block_descriptor_34_e55_v56__0__PXGSpriteIndexRange_II_8___I_________________16l;
  unsigned __int8 v12 = a4;
  unsigned __int8 v13 = a5;
  id v6 = a3;
  uint64_t v7 = [(PXGLayout *)self addSpriteWithInitialState:v11];
  [v6 registerChangeObserver:self context:ItemControllerObservationContext];
  double v8 = [(PXStoryChromeLayout *)self itemControllers];
  double v9 = [NSNumber numberWithUnsignedInt:v7];
  [v8 setObject:v6 forKeyedSubscript:v9];

  return v7;
}

__n128 __84__PXStoryChromeLayout__addSpriteForChromeItemController_mediaKind_presentationType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_super v3 = *(_OWORD **)(a3 + 24);
  long long v4 = *((_OWORD *)off_1E5DAAF90 + 7);
  v3[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v3[7] = v4;
  long long v5 = *((_OWORD *)off_1E5DAAF90 + 9);
  v3[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v3[9] = v5;
  long long v6 = *((_OWORD *)off_1E5DAAF90 + 3);
  v3[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v3[3] = v6;
  long long v7 = *((_OWORD *)off_1E5DAAF90 + 5);
  v3[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  void v3[5] = v7;
  __n128 result = *(__n128 *)off_1E5DAAF90;
  long long v9 = *((_OWORD *)off_1E5DAAF90 + 1);
  *objc_super v3 = *(_OWORD *)off_1E5DAAF90;
  v3[1] = v9;
  double v10 = *(unsigned char **)(a3 + 32);
  v10[1] = *(unsigned char *)(a1 + 32);
  unsigned char *v10 = *(unsigned char *)(a1 + 33);
  return result;
}

- (unsigned)_addEdgeHighlightForChromeItem:(unint64_t)a3
{
  long long v5 = [PXStoryChromeLayoutEdgeHighlightController alloc];
  long long v6 = [(PXStoryChromeLayout *)self viewModel];
  long long v7 = [(PXStoryChromeLayoutItemController *)v5 initWithViewModel:v6 chromeItem:a3];

  LODWORD(self) = [(PXStoryChromeLayout *)self _addSpriteForChromeItemController:v7 mediaKind:1 presentationType:0];
  return self;
}

- (unsigned)_addLabelForChromeItem:(unint64_t)a3
{
  long long v5 = [PXStoryChromeLayoutItemController alloc];
  long long v6 = [(PXStoryChromeLayout *)self viewModel];
  long long v7 = [(PXStoryChromeLayoutItemController *)v5 initWithViewModel:v6 chromeItem:a3];

  LODWORD(self) = [(PXStoryChromeLayout *)self _addSpriteForChromeItemController:v7 mediaKind:3 presentationType:0];
  return self;
}

- (unsigned)_addButtonForChromeItem:(unint64_t)a3
{
  long long v5 = [PXStoryChromeLayoutItemController alloc];
  long long v6 = [(PXStoryChromeLayout *)self viewModel];
  long long v7 = [(PXStoryChromeLayoutItemController *)v5 initWithViewModel:v6 chromeItem:a3];

  LODWORD(self) = [(PXStoryChromeLayout *)self _addSpriteForChromeItemController:v7 mediaKind:10 presentationType:1];
  return self;
}

- (PXStoryChromeLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryChromeLayout;
  long long v6 = [(PXGAbsoluteCompositeLayout *)&v14 init];
  long long v7 = v6;
  if (v6)
  {
    p_viewModel = (id *)&v6->_viewModel;
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [*p_viewModel registerChangeObserver:v7 context:ViewModelObservationContext_115538];
    long long v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    itemControllers = v7->_itemControllers;
    v7->_itemControllers = v9;

    v7->_closeButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:1];
    v7->_closeBrowserButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0x20000];
    v7->_playButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:4];
    v7->_replayButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:32];
    v7->_errorIndicatorSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0x10000];
    v7->_muteToggleButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0x1000000];
    v7->_actionMenuButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:2];
    v7->_shareButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:64];
    v7->_browserGridButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:128];
    v7->_browserAddPhotosButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0x20000000];
    v7->_browserSelectButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0xFFFFFFFF80000000];
    v7->_fullsizePlayerButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:256];
    v7->_aspectModeButtonIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0x4000];
    v7->_bufferingIndicatorSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0x8000];
    v7->_toggleFavoriteButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0x400000];
    v7->_playbackEndReplayButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0x40000];
    v7->_playbackEndShareButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0x80000];
    v7->_playbackEndFavoriteButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0x100000];
    v7->_playbackEndUnfavoriteButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0x200000];
    v7->_provideFeedbackButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:0x2000000];
    v7->_titleSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addLabelForChromeItem:1024];
    v7->_subtitleSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addLabelForChromeItem:1024];
    v7->_styleSwitcherButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:512];
    v7->_editMusicButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:8];
    v7->_editColorGradeButtonSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addButtonForChromeItem:16];
    v7->_leftEdgeHighlightSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addEdgeHighlightForChromeItem:4096];
    v7->_rightEdgeHighlightSpriteIndeCGFloat x = [(PXStoryChromeLayout *)v7 _addEdgeHighlightForChromeItem:0x2000];
    v7->_chromeButtonFocusGuideSpriteIndeCGFloat x = -1;
    v7->_infoPanelSpriteIndeCGFloat x = -1;
    v7->_styleChromeSublayoutIndeCGFloat x = 0x7FFFFFFFFFFFFFFFLL;
    double v11 = +[PXStorySettings sharedInstance];
    if ([(PXStoryStyleChromeContainerLayout *)v11 showStyleSwitcher])
    {
      uint64_t v12 = [v5 viewMode];

      if (v12 == 5)
      {
LABEL_6:
        [(PXGLayout *)v7 setContentSource:v7];
        [(PXStoryChromeLayout *)v7 _invalidateMainModel];
        [(PXStoryChromeLayout *)v7 _invalidateContentAlpha];
        goto LABEL_7;
      }
      double v11 = [[PXStoryStyleChromeContainerLayout alloc] initWithViewModel:*p_viewModel];
      v7->_styleChromeSublayoutIndeCGFloat x = [(PXGLayout *)v7 addSublayout:v11];
    }

    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

@end