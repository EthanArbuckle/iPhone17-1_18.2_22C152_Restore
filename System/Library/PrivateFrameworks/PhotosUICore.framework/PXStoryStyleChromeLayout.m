@interface PXStoryStyleChromeLayout
+ (void)startCachingResourcesForStyleInfo:(id)a3 viewLayoutSpec:(id)a4 displayScale:(double)a5;
+ (void)stopCachingResourcesForStyleInfo:(id)a3 viewLayoutSpec:(id)a4 displayScale:(double)a5;
- (BOOL)canHandleVisibleRectRejection;
- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (NSAttributedString)colorGradeNameAttributedString;
- (NSAttributedString)subtitleAttributedString;
- (NSAttributedString)titleAccessoryAttributedString;
- (NSAttributedString)titleAttributedString;
- (PXStoryColorGradingRepository)colorGradingRepository;
- (PXStoryStyleChromeLayout)init;
- (PXStoryStyleChromeLayout)initWithViewModel:(id)a3;
- (PXStoryStyleDescriptor)styleInfo;
- (PXStoryViewLayoutSpec)viewLayoutSpec;
- (PXStoryViewModel)viewModel;
- (id)_actionPerformer;
- (id)_styleSongAsset;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axSpriteIndexes;
- (id)axVisibleSpriteIndexes;
- (id)musicFeedbackContextMenuDelegate;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)_backgroundCircleStyle;
- (int64_t)stringDrawingOptionsForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3;
- (unsigned)mediaVersion;
- (void)_handleFilterButton:(id)a3;
- (void)_handleMusicButton:(id)a3;
- (void)_invalidateContent;
- (void)_invalidateStrings;
- (void)_updateContent;
- (void)alphaDidChange;
- (void)didUpdate;
- (void)displayScaleDidChange;
- (void)referenceDepthDidChange;
- (void)referenceSizeDidChange;
- (void)setColorGradingRepository:(id)a3;
- (void)setMediaVersion:(unsigned __int16)a3;
- (void)setStyleInfo:(id)a3;
- (void)setViewLayoutSpec:(id)a3;
- (void)update;
- (void)willUpdate;
@end

@implementation PXStoryStyleChromeLayout

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorGradingRepository, 0);
  objc_storeStrong((id *)&self->_viewLayoutSpec, 0);
  objc_storeStrong((id *)&self->_styleInfo, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong(&self->_musicFeedbackContextMenuDelegate, 0);
  objc_storeStrong((id *)&self->_colorGradeNameAttributedString, 0);
  objc_storeStrong((id *)&self->_subtitleAttributedString, 0);
  objc_storeStrong((id *)&self->_titleAccessoryAttributedString, 0);
  objc_storeStrong((id *)&self->_titleAttributedString, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
}

- (unsigned)mediaVersion
{
  return self->_mediaVersion;
}

- (PXStoryColorGradingRepository)colorGradingRepository
{
  return self->_colorGradingRepository;
}

- (PXStoryViewLayoutSpec)viewLayoutSpec
{
  return self->_viewLayoutSpec;
}

- (PXStoryStyleDescriptor)styleInfo
{
  return self->_styleInfo;
}

- (PXStoryViewModel)viewModel
{
  return self->_viewModel;
}

- (id)musicFeedbackContextMenuDelegate
{
  id musicFeedbackContextMenuDelegate = self->_musicFeedbackContextMenuDelegate;
  if (!musicFeedbackContextMenuDelegate)
  {
    objc_initWeak(&location, self);
    v4 = [(PXStoryStyleChromeLayout *)self viewModel];
    v5 = [v4 actionPerformer];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__PXStoryStyleChromeLayout_musicFeedbackContextMenuDelegate__block_invoke;
    v9[3] = &unk_1E5DCBC30;
    objc_copyWeak(&v10, &location);
    v6 = [v5 musicFeedbackContextMenuDelegateWithAudioAssetProvidingBlock:v9];
    id v7 = self->_musicFeedbackContextMenuDelegate;
    self->_id musicFeedbackContextMenuDelegate = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    id musicFeedbackContextMenuDelegate = self->_musicFeedbackContextMenuDelegate;
  }
  return musicFeedbackContextMenuDelegate;
}

id __60__PXStoryStyleChromeLayout_musicFeedbackContextMenuDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _styleSongAsset];

  return v2;
}

- (void)_handleFilterButton:(id)a3
{
  id v3 = [(PXStoryStyleChromeLayout *)self _actionPerformer];
  [v3 presentColorGradeEditor];
}

- (void)_handleMusicButton:(id)a3
{
  id v3 = [(PXStoryStyleChromeLayout *)self _actionPerformer];
  [v3 presentMusicEditor];
}

- (id)_styleSongAsset
{
  v2 = [(PXStoryStyleChromeLayout *)self styleInfo];
  id v3 = [v2 songResource];
  v4 = objc_msgSend(v3, "px_storyResourceSongAsset");

  return v4;
}

- (NSAttributedString)subtitleAttributedString
{
  subtitleAttributedString = self->_subtitleAttributedString;
  if (!subtitleAttributedString)
  {
    v4 = [(PXStoryStyleChromeLayout *)self viewLayoutSpec];
    v5 = [(PXStoryStyleChromeLayout *)self styleInfo];
    v6 = [v5 songResource];
    id v7 = objc_msgSend(v6, "px_storyResourceSongAsset");
    uint64_t v8 = [v7 subtitle];
    v9 = (void *)v8;
    id v10 = &stru_1F00B0030;
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    v11 = v10;

    id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
    v13 = [v4 styleSwitcherDetailsLabelAttributesB];
    v14 = (NSAttributedString *)[v12 initWithString:v11 attributes:v13];

    v15 = self->_subtitleAttributedString;
    self->_subtitleAttributedString = v14;

    subtitleAttributedString = self->_subtitleAttributedString;
  }
  return subtitleAttributedString;
}

- (NSAttributedString)titleAccessoryAttributedString
{
  id v3 = [(PXStoryStyleChromeLayout *)self styleInfo];
  v4 = [v3 songResource];
  v5 = objc_msgSend(v4, "px_storyResourceSongAsset");

  if (!self->_titleAccessoryAttributedString && ([v5 flags] & 1) != 0)
  {
    v6 = [(PXStoryStyleChromeLayout *)self viewLayoutSpec];
    id v7 = PXLocalizedStringFromTable(@"InteractiveMemoryExplicitLyricsIcon", @"PhotosUICore");
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    v9 = [v6 styleSwitcherDetailsLabelAttributesAAccessory];
    id v10 = (NSAttributedString *)[v8 initWithString:v7 attributes:v9];
    titleAccessoryAttributedString = self->_titleAccessoryAttributedString;
    self->_titleAccessoryAttributedString = v10;
  }
  id v12 = self->_titleAccessoryAttributedString;

  return v12;
}

- (NSAttributedString)titleAttributedString
{
  titleAttributedString = self->_titleAttributedString;
  if (!titleAttributedString)
  {
    v4 = [(PXStoryStyleChromeLayout *)self viewLayoutSpec];
    v5 = [(PXStoryStyleChromeLayout *)self styleInfo];
    v6 = [v5 songResource];
    id v7 = objc_msgSend(v6, "px_storyResourceSongAsset");
    uint64_t v8 = [v7 title];
    v9 = (void *)v8;
    id v10 = &stru_1F00B0030;
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    v11 = v10;

    id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
    v13 = [v4 styleSwitcherDetailsLabelAttributesA];
    v14 = (NSAttributedString *)[v12 initWithString:v11 attributes:v13];

    v15 = self->_titleAttributedString;
    self->_titleAttributedString = v14;

    titleAttributedString = self->_titleAttributedString;
  }
  return titleAttributedString;
}

- (NSAttributedString)colorGradeNameAttributedString
{
  colorGradeNameAttributedString = self->_colorGradeNameAttributedString;
  if (!colorGradeNameAttributedString)
  {
    v4 = [(PXStoryStyleChromeLayout *)self viewLayoutSpec];
    v5 = [(PXStoryStyleChromeLayout *)self colorGradingRepository];
    v6 = [(PXStoryStyleChromeLayout *)self styleInfo];
    id v7 = objc_msgSend(v5, "localizedTitleForColorGradeKind:", objc_msgSend(v6, "customColorGradeKind"));

    uint64_t v8 = [v4 styleSwitcherDetailsLabelAttributesC];
    if (v7)
    {
      v9 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4FB0870]) initWithData:0 ofType:0];
      id v10 = [v4 styleSwitcherColorGradeNameGlyphImage];
      [(NSAttributedString *)v9 setImage:v10];

      v11 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v9];
      id v12 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      [v12 appendAttributedString:v11];
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v8];
      [v12 appendAttributedString:v13];

      v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v8];
      [v12 appendAttributedString:v14];

      v15 = (NSAttributedString *)[v12 copy];
      v16 = self->_colorGradeNameAttributedString;
      self->_colorGradeNameAttributedString = v15;
    }
    else
    {
      v17 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F00B0030 attributes:v8];
      v9 = self->_colorGradeNameAttributedString;
      self->_colorGradeNameAttributedString = v17;
    }

    colorGradeNameAttributedString = self->_colorGradeNameAttributedString;
  }
  return colorGradeNameAttributedString;
}

- (void)_invalidateStrings
{
  colorGradeNameAttributedString = self->_colorGradeNameAttributedString;
  self->_colorGradeNameAttributedString = 0;

  titleAttributedString = self->_titleAttributedString;
  self->_titleAttributedString = 0;

  subtitleAttributedString = self->_subtitleAttributedString;
  self->_subtitleAttributedString = 0;
}

- (id)_actionPerformer
{
  v2 = [(PXStoryStyleChromeLayout *)self viewModel];
  id v3 = [v2 actionPerformer];

  return v3;
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  id v3 = [(PXStoryStyleChromeLayout *)self viewModel];
  BOOL v4 = [v3 viewMode] == 4;

  return 2 * v4;
}

- (id)axVisibleSpriteIndexes
{
  id v3 = [(PXStoryStyleChromeLayout *)self viewModel];
  uint64_t v4 = [v3 viewMode];

  if (v4 == 4)
  {
    id v5 = [(PXStoryStyleChromeLayout *)self axSpriteIndexes];
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  }
  return v5;
}

- (id)axSpriteIndexes
{
  axSpriteIndexes = self->_axSpriteIndexes;
  if (!axSpriteIndexes)
  {
    uint64_t v4 = (NSIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, self->_spriteCount);
    id v5 = self->_axSpriteIndexes;
    self->_axSpriteIndexes = v4;

    axSpriteIndexes = self->_axSpriteIndexes;
  }
  return axSpriteIndexes;
}

- (int64_t)_backgroundCircleStyle
{
  return 1;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_songArtworkSpriteIndex == a3)
  {
    uint64_t v8 = objc_alloc_init(PXStoryChromeButtonConfiguration);
    [(PXStoryChromeButtonConfiguration *)v8 setBackgroundStyle:2];
    [(PXStoryChromeButtonConfiguration *)v8 setTarget:self];
    v9 = [(PXStoryStyleChromeLayout *)self viewLayoutSpec];
    id v10 = [v9 chromeButtonSpec];

    [(PXStoryChromeButtonConfiguration *)v8 setSpec:v10];
    v11 = [(PXStoryStyleChromeLayout *)self _styleSongAsset];
    id v12 = [v11 artworkDisplayAsset];
    [(PXStoryChromeButtonConfiguration *)v8 setDisplayAsset:v12];

    v13 = [(PXStoryStyleChromeLayout *)self musicFeedbackContextMenuDelegate];
    [(PXStoryChromeButtonConfiguration *)v8 setCustomContextMenuInteractionDelegate:v13];
  }
  else if (self->_musicButtonSpriteIndex == a3)
  {
    uint64_t v8 = objc_alloc_init(PXStoryChromeButtonConfiguration);
    [(PXStoryChromeButtonConfiguration *)v8 setBackgroundStyle:[(PXStoryStyleChromeLayout *)self _backgroundCircleStyle]];
    [(PXStoryChromeButtonConfiguration *)v8 setTarget:self];
    [(PXStoryChromeButtonConfiguration *)v8 setAction:sel__handleMusicButton_];
    v14 = [(PXStoryStyleChromeLayout *)self viewLayoutSpec];
    v15 = [v14 chromeButtonSpec];
    [(PXStoryChromeButtonConfiguration *)v8 setSpec:v15];

    [(PXStoryChromeButtonConfiguration *)v8 setSystemImageName:@"music.badge.plus"];
    [(PXStoryChromeButtonConfiguration *)v8 setApplyTintColorAsHierarchicalColor:1];
  }
  else if (self->_filterButtonSpriteIndex == a3)
  {
    uint64_t v8 = objc_alloc_init(PXStoryChromeButtonConfiguration);
    [(PXStoryChromeButtonConfiguration *)v8 setBackgroundStyle:[(PXStoryStyleChromeLayout *)self _backgroundCircleStyle]];
    [(PXStoryChromeButtonConfiguration *)v8 setTarget:self];
    [(PXStoryChromeButtonConfiguration *)v8 setAction:sel__handleFilterButton_];
    v16 = [(PXStoryStyleChromeLayout *)self viewLayoutSpec];
    v17 = [v16 chromeButtonSpec];
    [(PXStoryChromeButtonConfiguration *)v8 setSpec:v17];

    [(PXStoryChromeButtonConfiguration *)v8 setApplyTintColorAsHierarchicalColor:1];
    [(PXStoryChromeButtonConfiguration *)v8 setSystemImageName:@"camera.filters"];
  }
  else
  {
    if (self->_customLabelSpriteIndex != a3)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:self file:@"PXStoryStyleChromeLayout.m" lineNumber:446 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v8 = objc_alloc_init(PXStoryChromeButtonConfiguration);
    [(PXStoryChromeButtonConfiguration *)v8 setBackgroundStyle:2];
    v18 = [(PXStoryStyleChromeLayout *)self viewLayoutSpec];
    v19 = [v18 chromeButtonSpec];
    [(PXStoryChromeButtonConfiguration *)v8 setSpec:v19];

    v20 = PXLocalizedStringFromTable(@"InteractiveMemoryCustomStyleLabel", @"PhotosUICore");
    [(PXStoryChromeButtonConfiguration *)v8 setLabel:v20];
  }
  return v8;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  if (self->_songArtworkSpriteIndex != a3
    && self->_musicButtonSpriteIndex != a3
    && self->_filterButtonSpriteIndex != a3
    && self->_customLabelSpriteIndex != a3)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXStoryStyleChromeLayout.m", 407, @"Invalid parameter not satisfying: %@", @"index == _songArtworkSpriteIndex || index == _musicButtonSpriteIndex || index == _filterButtonSpriteIndex || index == _customLabelSpriteIndex" object file lineNumber description];
  }
  return (Class)objc_opt_class();
}

- (int64_t)stringDrawingOptionsForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 35;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7 = a4;
  if (self->_songTitleSpriteIndex == a3)
  {
    uint64_t v8 = [(PXStoryStyleChromeLayout *)self titleAttributedString];
  }
  else if (self->_songSubtitleSpriteIndex == a3)
  {
    uint64_t v8 = [(PXStoryStyleChromeLayout *)self subtitleAttributedString];
  }
  else if (self->_colorGradeNameSpriteIndex == a3)
  {
    uint64_t v8 = [(PXStoryStyleChromeLayout *)self colorGradeNameAttributedString];
  }
  else
  {
    if (self->_songTitleAccessorySpriteIndex != a3)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXStoryStyleChromeLayout.m" lineNumber:397 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    uint64_t v8 = [(PXStoryStyleChromeLayout *)self titleAccessoryAttributedString];
  }
  v9 = (void *)v8;

  return v9;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return &stru_1F00B0030;
}

- (void)_updateContent
{
  [(PXGLayout *)self referenceSize];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [(PXStoryStyleChromeLayout *)self viewLayoutSpec];
  [v8 chromeButtonSize];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  [(PXGLayout *)self referenceDepth];
  double v14 = -v13;
  unsigned __int16 v15 = [(PXStoryStyleChromeLayout *)self mediaVersion];
  [(PXGLayout *)self alpha];
  uint64_t v17 = v16;
  [(PXGLayout *)self displayScale];
  uint64_t v19 = v18;
  [v8 styleSwitcherDistanceBetweenAlbumArtAndLabels];
  uint64_t v21 = v20;
  char v22 = [v8 styleSwitcherCanShowEditButtons];
  uint64_t spriteCount = self->_spriteCount;
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v24 = spriteCount << 32;
  uint64_t v27 = 3221225472;
  v28 = __42__PXStoryStyleChromeLayout__updateContent__block_invoke;
  v29 = &unk_1E5DCBC08;
  long long v32 = *MEMORY[0x1E4F1DAD8];
  double v33 = v5;
  double v34 = v7;
  SEL v35 = a2;
  id v30 = v8;
  v31 = self;
  uint64_t v36 = v10;
  uint64_t v37 = v12;
  char v46 = v22;
  uint64_t v38 = v21;
  double v39 = v14;
  unsigned __int16 v45 = v15;
  uint64_t v40 = v17;
  uint64_t v41 = v19;
  long long v42 = v32;
  double v43 = v5;
  double v44 = v7;
  id v25 = v8;
  [(PXGLayout *)self modifySpritesInRange:v24 state:&v26];
  -[PXGLayout setContentSize:](self, "setContentSize:", v5, v7, v26, v27, v28, v29);
}

void __42__PXStoryStyleChromeLayout__updateContent__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = [*(id *)(a1 + 32) styleSwitcherDetailsLabelAttributesA];
  uint64_t v10 = *MEMORY[0x1E4FB06F8];
  uint64_t v11 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  [v11 lineHeight];

  uint64_t v12 = [*(id *)(a1 + 32) styleSwitcherDetailsLabelAttributesB];
  double v13 = [v12 objectForKeyedSubscript:v10];
  [v13 lineHeight];

  double v14 = [*(id *)(a1 + 32) styleSwitcherDetailsLabelAttributesC];
  unsigned __int16 v15 = [v14 objectForKeyedSubscript:v10];
  [v15 lineHeight];

  CGFloat v16 = *(double *)(a1 + 48);
  CGFloat v17 = *(double *)(a1 + 56);
  CGFloat v18 = *(double *)(a1 + 64);
  CGFloat v19 = *(double *)(a1 + 72);
  switch([*(id *)(a1 + 32) styleSwitcherChromeArrangement])
  {
    case 0:
      v98 = [MEMORY[0x1E4F28B00] currentHandler];
      [v98 handleFailureInMethod:*(void *)(a1 + 80) object:*(void *)(a1 + 40) file:@"PXStoryStyleChromeLayout.m" lineNumber:226 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      PXRectWithSizeAlignedToRectEdges();
    case 2:
      v120.origin.x = v16;
      v120.origin.y = v17;
      v120.size.width = v18;
      v120.size.height = v19;
      CGRectGetWidth(v120);
      PXRectWithSizeAlignedToRectEdges();
    case 3:
      PXRectWithSizeAlignedToRectEdges();
    default:
      uint64_t v20 = [*(id *)(a1 + 40) titleAccessoryAttributedString];
      [v20 size];
      double v22 = v21;

      [*(id *)(a1 + 32) styleSwitcherDetailsTitleAccessoryPadding];
      if (v22 <= 0.0)
      {
        float64_t MinY = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        CGFloat v102 = *MEMORY[0x1E4F1DB28];
        CGFloat v103 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        CGFloat Height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      }
      else
      {
        double v24 = v23;
        v121.origin.x = v16;
        v121.origin.y = v17;
        v121.size.width = v18;
        v121.size.height = v19;
        double v25 = CGRectGetMaxX(v121) - v22;
        v122.origin.x = 0.0;
        v122.origin.y = 0.0;
        v122.size.width = 0.0;
        v122.size.height = 0.0;
        double v26 = v24 + CGRectGetMaxX(v122);
        if (v25 >= v26) {
          double v25 = v26;
        }
        v123.origin.x = 0.0;
        v123.origin.y = 0.0;
        v123.size.width = 0.0;
        v123.size.height = 0.0;
        float64_t MinY = CGRectGetMinY(v123);
        v124.origin.x = 0.0;
        v124.origin.y = 0.0;
        v124.size.width = 0.0;
        v124.size.height = 0.0;
        CGFloat Height = CGRectGetHeight(v124);
        v125.origin.x = 0.0;
        v125.origin.y = 0.0;
        v125.size.width = 0.0;
        v125.size.height = 0.0;
        CGFloat v102 = v25;
        CGFloat v103 = v22;
        if (CGRectGetMaxX(v125) - v25 - v24 > 0.0) {
          PXInsetRectWithValueForEdges();
        }
      }
      uint64_t v27 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 872);
      float v28 = *(double *)(a1 + 112);
      v126.origin.x = 0.0;
      v126.origin.y = 0.0;
      v126.size.width = 0.0;
      v126.size.height = 0.0;
      CGFloat MidX = CGRectGetMidX(v126);
      v127.origin.x = 0.0;
      v127.origin.y = 0.0;
      v127.size.width = 0.0;
      v127.size.height = 0.0;
      CGFloat MidY = CGRectGetMidY(v127);
      v128.origin.x = 0.0;
      v128.origin.y = 0.0;
      v128.size.width = 0.0;
      v128.size.height = 0.0;
      CGFloat Width = CGRectGetWidth(v128);
      v129.origin.x = 0.0;
      v129.origin.y = 0.0;
      v129.size.width = 0.0;
      v129.size.height = 0.0;
      CGFloat v31 = CGRectGetHeight(v129);
      v32.f64[0] = Width;
      v32.f64[1] = v31;
      *(CGFloat *)uint64_t v27 = MidX;
      *(CGFloat *)(v27 + 8) = MidY;
      *(double *)(v27 + 16) = v28;
      *(float32x2_t *)(v27 + 24) = vcvt_f32_f64(v32);
      double v33 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 872));
      long long v118 = *((_OWORD *)off_1E5DAAF90 + 1);
      long long v119 = *(_OWORD *)off_1E5DAAF90;
      *double v33 = *(_OWORD *)off_1E5DAAF90;
      v33[1] = v118;
      long long v116 = *((_OWORD *)off_1E5DAAF90 + 4);
      long long v117 = *((_OWORD *)off_1E5DAAF90 + 5);
      v33[4] = v116;
      v33[5] = v117;
      long long v113 = *((_OWORD *)off_1E5DAAF90 + 2);
      long long v115 = *((_OWORD *)off_1E5DAAF90 + 3);
      v33[2] = v113;
      v33[3] = v115;
      long long v111 = *((_OWORD *)off_1E5DAAF90 + 8);
      long long v112 = *((_OWORD *)off_1E5DAAF90 + 9);
      v33[8] = v111;
      v33[9] = v112;
      long long v109 = *((_OWORD *)off_1E5DAAF90 + 6);
      long long rect = *((_OWORD *)off_1E5DAAF90 + 7);
      v33[6] = v109;
      v33[7] = rect;
      v32.f64[0] = *(float64_t *)(a1 + 112);
      *(float *)&CGFloat v31 = *(double *)(a1 + 120);
      *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 872)) = LODWORD(v31);
      *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 872) + 1) = 10;
      *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 872) + 32) = *(_WORD *)(a1 + 168);
      *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 872)) = 1;
      uint64_t v34 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 896);
      float v35 = v32.f64[0];
      uint64_t v36 = 0;
      v32.f64[0] = 0.0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      CGFloat v39 = CGRectGetMidX(*(CGRect *)((char *)&v32 - 8));
      v130.origin.x = 0.0;
      v130.origin.y = 0.0;
      v130.size.width = 0.0;
      v130.size.height = 0.0;
      CGFloat v40 = CGRectGetMidY(v130);
      v131.origin.x = 0.0;
      v131.origin.y = 0.0;
      v131.size.width = 0.0;
      v131.size.height = 0.0;
      CGFloat v99 = CGRectGetWidth(v131);
      v132.origin.x = 0.0;
      v132.origin.y = 0.0;
      v132.size.width = 0.0;
      v132.size.height = 0.0;
      CGFloat v41 = CGRectGetHeight(v132);
      v42.f64[0] = v99;
      v42.f64[1] = v41;
      *(CGFloat *)uint64_t v34 = v39;
      *(CGFloat *)(v34 + 8) = v40;
      *(double *)(v34 + 16) = v35;
      *(float32x2_t *)(v34 + 24) = vcvt_f32_f64(v42);
      double v43 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 896));
      *double v43 = v119;
      v43[1] = v118;
      v43[4] = v116;
      v43[5] = v117;
      v43[2] = v113;
      v43[3] = v115;
      v43[8] = v111;
      v43[9] = v112;
      v43[6] = v109;
      v43[7] = rect;
      float v44 = 0.0;
      float v45 = 0.0;
      if (*(unsigned char *)(a1 + 170)) {
        float v45 = *(double *)(a1 + 120);
      }
      *(float *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 896)) = v45;
      *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 896) + 1) = 10;
      *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 896) + 32) = *(_WORD *)(a1 + 168);
      *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 896)) = 1;
      uint64_t v46 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 892);
      float v47 = *(double *)(a1 + 112);
      v133.origin.x = 0.0;
      v133.origin.y = 0.0;
      v133.size.width = 0.0;
      v133.size.height = 0.0;
      CGFloat v48 = CGRectGetMidX(v133);
      v134.origin.x = 0.0;
      v134.origin.y = 0.0;
      v134.size.width = 0.0;
      v134.size.height = 0.0;
      CGFloat v49 = CGRectGetMidY(v134);
      v135.origin.x = 0.0;
      v135.origin.y = 0.0;
      v135.size.width = 0.0;
      v135.size.height = 0.0;
      CGFloat v104 = CGRectGetWidth(v135);
      v136.origin.x = 0.0;
      v136.origin.y = 0.0;
      v136.size.width = 0.0;
      v136.size.height = 0.0;
      CGFloat v50 = CGRectGetHeight(v136);
      v51.f64[0] = v104;
      v51.f64[1] = v50;
      *(CGFloat *)uint64_t v46 = v48;
      *(CGFloat *)(v46 + 8) = v49;
      *(double *)(v46 + 16) = v47;
      *(float32x2_t *)(v46 + 24) = vcvt_f32_f64(v51);
      v52 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 892));
      _OWORD *v52 = v119;
      v52[1] = v118;
      v52[4] = v116;
      v52[5] = v117;
      v52[2] = v113;
      v52[3] = v115;
      v52[8] = v111;
      v52[9] = v112;
      v52[6] = v109;
      v52[7] = rect;
      if (*(unsigned char *)(a1 + 170)) {
        float v44 = *(double *)(a1 + 120);
      }
      *(float *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 892)) = v44;
      *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 892) + 1) = 10;
      *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 892) + 32) = *(_WORD *)(a1 + 168);
      *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 892)) = 1;
      uint64_t v53 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 876);
      float v54 = *(double *)(a1 + 112);
      v137.origin.x = 0.0;
      v137.origin.y = 0.0;
      v137.size.width = 0.0;
      v137.size.height = 0.0;
      CGFloat v55 = CGRectGetMidX(v137);
      v138.origin.x = 0.0;
      v138.origin.y = 0.0;
      v138.size.width = 0.0;
      v138.size.height = 0.0;
      CGFloat v56 = CGRectGetMidY(v138);
      v139.origin.x = 0.0;
      v139.origin.y = 0.0;
      v139.size.width = 0.0;
      v139.size.height = 0.0;
      CGFloat v105 = CGRectGetWidth(v139);
      v140.origin.x = 0.0;
      v140.origin.y = 0.0;
      v140.size.width = 0.0;
      v140.size.height = 0.0;
      CGFloat v57 = CGRectGetHeight(v140);
      v58.f64[0] = v105;
      v58.f64[1] = v57;
      *(CGFloat *)uint64_t v53 = v55;
      *(CGFloat *)(v53 + 8) = v56;
      *(double *)(v53 + 16) = v54;
      *(float32x2_t *)(v53 + 24) = vcvt_f32_f64(v58);
      v59 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 876));
      v59[6] = v109;
      v59[7] = rect;
      v59[8] = v111;
      v59[9] = v112;
      v59[2] = v113;
      v59[3] = v115;
      v59[4] = v116;
      v59[5] = v117;
      _OWORD *v59 = v119;
      v59[1] = v118;
      v58.f64[0] = *(float64_t *)(a1 + 128);
      *(float *)&CGFloat v57 = *(double *)(a1 + 120);
      *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 876)) = LODWORD(v57);
      *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 876) + 1) = 3;
      *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 876) + 32) = *(_WORD *)(a1 + 168);
      *(float *)&CGFloat v57 = v58.f64[0];
      uint64_t v60 = *(unsigned int *)(*(void *)(a1 + 40) + 876);
      *(float32x2_t *)(a5 + 40 * v60 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v60 + 24), *(float *)&v57);
      uint64_t v61 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 880);
      float v62 = *(double *)(a1 + 112);
      CGFloat v63 = v102;
      v58.f64[0] = MinY;
      CGFloat v64 = v103;
      CGFloat v65 = Height;
      CGFloat v66 = CGRectGetMidX(*(CGRect *)((char *)&v58 - 8));
      v141.origin.x = v102;
      v141.origin.y = MinY;
      v141.size.width = v103;
      v141.size.height = Height;
      CGFloat v67 = CGRectGetMidY(v141);
      v142.origin.x = v102;
      v142.origin.y = MinY;
      v142.size.width = v103;
      v142.size.height = Height;
      CGFloat v106 = CGRectGetWidth(v142);
      v143.origin.x = v102;
      v143.origin.y = MinY;
      v143.size.width = v103;
      v143.size.height = Height;
      CGFloat v68 = CGRectGetHeight(v143);
      v69.f64[0] = v106;
      v69.f64[1] = v68;
      *(CGFloat *)uint64_t v61 = v66;
      *(CGFloat *)(v61 + 8) = v67;
      *(double *)(v61 + 16) = v62;
      *(float32x2_t *)(v61 + 24) = vcvt_f32_f64(v69);
      v70 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 880));
      v70[6] = v109;
      v70[7] = rect;
      v70[8] = v111;
      v70[9] = v112;
      v70[2] = v113;
      v70[3] = v115;
      v70[4] = v116;
      v70[5] = v117;
      _OWORD *v70 = v119;
      v70[1] = v118;
      v69.f64[0] = *(float64_t *)(a1 + 128);
      *(float *)&CGFloat v68 = *(double *)(a1 + 120);
      *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 880)) = LODWORD(v68);
      *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 880) + 1) = 3;
      *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 880) + 32) = *(_WORD *)(a1 + 168);
      *(float *)&CGFloat v68 = v69.f64[0];
      uint64_t v71 = *(unsigned int *)(*(void *)(a1 + 40) + 880);
      *(float32x2_t *)(a5 + 40 * v71 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v71 + 24), *(float *)&v68);
      uint64_t v72 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 884);
      float v73 = *(double *)(a1 + 112);
      uint64_t v74 = 0;
      v69.f64[0] = 0.0;
      uint64_t v75 = 0;
      uint64_t v76 = 0;
      CGFloat v77 = CGRectGetMidX(*(CGRect *)((char *)&v69 - 8));
      v144.origin.x = 0.0;
      v144.origin.y = 0.0;
      v144.size.width = 0.0;
      v144.size.height = 0.0;
      CGFloat v78 = CGRectGetMidY(v144);
      v145.origin.x = 0.0;
      v145.origin.y = 0.0;
      v145.size.width = 0.0;
      v145.size.height = 0.0;
      CGFloat v107 = CGRectGetWidth(v145);
      v146.origin.x = 0.0;
      v146.origin.y = 0.0;
      v146.size.width = 0.0;
      v146.size.height = 0.0;
      CGFloat v79 = CGRectGetHeight(v146);
      v80.f64[0] = v107;
      v80.f64[1] = v79;
      *(CGFloat *)uint64_t v72 = v77;
      *(CGFloat *)(v72 + 8) = v78;
      *(double *)(v72 + 16) = v73;
      *(float32x2_t *)(v72 + 24) = vcvt_f32_f64(v80);
      v81 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 884));
      v81[6] = v109;
      v81[7] = rect;
      v81[8] = v111;
      v81[9] = v112;
      v81[2] = v113;
      v81[3] = v115;
      v81[4] = v116;
      v81[5] = v117;
      _OWORD *v81 = v119;
      v81[1] = v118;
      v80.f64[0] = *(float64_t *)(a1 + 128);
      *(float *)&CGFloat v79 = *(double *)(a1 + 120);
      *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 884)) = LODWORD(v79);
      *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 884) + 1) = 3;
      *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 884) + 32) = *(_WORD *)(a1 + 168);
      *(float *)&CGFloat v79 = v80.f64[0];
      uint64_t v82 = *(unsigned int *)(*(void *)(a1 + 40) + 884);
      *(float32x2_t *)(a5 + 40 * v82 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v82 + 24), *(float *)&v79);
      uint64_t v83 = a3 + 32 * *(unsigned int *)(*(void *)(a1 + 40) + 888);
      float v84 = *(double *)(a1 + 112);
      uint64_t v85 = 0;
      v80.f64[0] = 0.0;
      uint64_t v86 = 0;
      uint64_t v87 = 0;
      CGFloat v88 = CGRectGetMidX(*(CGRect *)((char *)&v80 - 8));
      v147.origin.x = 0.0;
      v147.origin.y = 0.0;
      v147.size.width = 0.0;
      v147.size.height = 0.0;
      CGFloat v89 = CGRectGetMidY(v147);
      v148.origin.x = 0.0;
      v148.origin.y = 0.0;
      v148.size.width = 0.0;
      v148.size.height = 0.0;
      CGFloat v108 = CGRectGetWidth(v148);
      v149.origin.x = 0.0;
      v149.origin.y = 0.0;
      v149.size.width = 0.0;
      v149.size.height = 0.0;
      CGFloat v90 = CGRectGetHeight(v149);
      v91.f64[0] = v108;
      v91.f64[1] = v90;
      *(CGFloat *)uint64_t v83 = v88;
      *(CGFloat *)(v83 + 8) = v89;
      *(double *)(v83 + 16) = v84;
      *(float32x2_t *)(v83 + 24) = vcvt_f32_f64(v91);
      v92 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 888));
      v92[6] = v109;
      v92[7] = rect;
      v92[8] = v111;
      v92[9] = v112;
      v92[2] = v113;
      v92[3] = v115;
      v92[4] = v116;
      v92[5] = v117;
      _OWORD *v92 = v119;
      v92[1] = v118;
      v91.f64[0] = *(float64_t *)(a1 + 128);
      *(float *)&CGFloat v90 = *(double *)(a1 + 120);
      *(_DWORD *)(a4 + 160 * *(unsigned int *)(*(void *)(a1 + 40) + 888)) = LODWORD(v90);
      *(unsigned char *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 888) + 1) = 3;
      *(_WORD *)(a5 + 40 * *(unsigned int *)(*(void *)(a1 + 40) + 888) + 32) = *(_WORD *)(a1 + 168);
      *(float *)&CGFloat v90 = v91.f64[0];
      uint64_t v93 = *(unsigned int *)(*(void *)(a1 + 40) + 888);
      *(float32x2_t *)(a5 + 40 * v93 + 8) = vmul_n_f32(*(float32x2_t *)(a3 + 32 * v93 + 24), *(float *)&v90);
      v94 = [*(id *)(a1 + 40) viewUserDataForSpriteAtIndex:*(unsigned int *)(*(void *)(a1 + 40) + 900) inLayout:*(void *)(a1 + 40)];
      +[PXStoryChromeButton sizeWithConfiguration:v94];

      v95 = [*(id *)(a1 + 40) viewModel];
      v96 = [v95 mainModel];
      v97 = [v96 layoutSpec];
      [v97 styleSwitcherViewportInset];

      CGRectGetMaxY(*(CGRect *)(a1 + 136));
      v150.origin.y = 0.0;
      v150.origin.x = 0.0;
      v150.size.width = 0.0;
      v150.size.height = 0.0;
      CGRectGetMinY(v150);
      PXRectWithSizeAlignedToRectEdgesWithPadding();
  }
}

- (void)_invalidateContent
{
  colorGradeNameAttributedString = self->_colorGradeNameAttributedString;
  self->_colorGradeNameAttributedString = 0;

  titleAccessoryAttributedString = self->_titleAccessoryAttributedString;
  self->_titleAccessoryAttributedString = 0;

  titleAttributedString = self->_titleAttributedString;
  self->_titleAttributedString = 0;

  subtitleAttributedString = self->_subtitleAttributedString;
  self->_subtitleAttributedString = 0;

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
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeLayout _invalidateContent]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PXStoryStyleChromeLayout.m", 194, @"invalidating %lu after it already has been updated", 1);

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

- (void)didUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryStyleChromeLayout;
  [(PXGLayout *)&v5 didUpdate];
  if (self->_updateFlags.willPerformUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v4 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeLayout didUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryStyleChromeLayout.m", 186, @"Invalid parameter not satisfying: %@", @"!_updateFlags.willPerformUpdate" file lineNumber description];
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
      objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
      double v6 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeLayout update]"];
      [v5 handleFailureInFunction:v6, @"PXStoryStyleChromeLayout.m", 176, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];

      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if (needsUpdate)
    {
      p_updateFlags->unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      [(PXStoryStyleChromeLayout *)self _updateContent];
      unint64_t needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeLayout update]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"PXStoryStyleChromeLayout.m", 180, @"still needing to update %lu after update pass", p_updateFlags->needsUpdate);
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXStoryStyleChromeLayout;
  [(PXGLayout *)&v9 update];
}

- (void)willUpdate
{
  v5.receiver = self;
  v5.super_class = (Class)PXStoryStyleChromeLayout;
  [(PXGLayout *)&v5 willUpdate];
  self->_updateFlags.BOOL willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    double v4 = [NSString stringWithUTF8String:"-[PXStoryStyleChromeLayout willUpdate]"];
    [v3 handleFailureInFunction:v4, @"PXStoryStyleChromeLayout.m", 172, @"Invalid parameter not satisfying: %@", @"!_updateFlags.isPerformingUpdate" file lineNumber description];
  }
}

- (BOOL)canHandleVisibleRectRejection
{
  return 1;
}

- (void)displayScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeLayout;
  [(PXGLayout *)&v3 displayScaleDidChange];
  [(PXStoryStyleChromeLayout *)self _invalidateContent];
}

- (void)alphaDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeLayout;
  [(PXGLayout *)&v3 alphaDidChange];
  [(PXStoryStyleChromeLayout *)self _invalidateContent];
}

- (void)referenceDepthDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeLayout;
  [(PXGLayout *)&v3 referenceDepthDidChange];
  [(PXStoryStyleChromeLayout *)self _invalidateContent];
}

- (void)referenceSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryStyleChromeLayout;
  [(PXGLayout *)&v3 referenceSizeDidChange];
  [(PXStoryStyleChromeLayout *)self _invalidateContent];
}

- (PXStoryStyleChromeLayout)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryStyleChromeLayout.m", 141, @"%s is not available as initializer", "-[PXStoryStyleChromeLayout init]");

  abort();
}

- (void)setMediaVersion:(unsigned __int16)a3
{
  if (self->_mediaVersion != a3)
  {
    self->_mediaVersion = a3;
    [(PXStoryStyleChromeLayout *)self _invalidateContent];
  }
}

- (void)setColorGradingRepository:(id)a3
{
  double v7 = (PXStoryColorGradingRepository *)a3;
  objc_super v5 = self->_colorGradingRepository;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryColorGradingRepository *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_colorGradingRepository, a3);
      [(PXStoryStyleChromeLayout *)self _invalidateContent];
    }
  }
}

- (void)setViewLayoutSpec:(id)a3
{
  double v7 = (PXStoryViewLayoutSpec *)a3;
  objc_super v5 = self->_viewLayoutSpec;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryViewLayoutSpec *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewLayoutSpec, a3);
      [(PXStoryStyleChromeLayout *)self setMediaVersion:(unsigned __int16)([(PXStoryStyleChromeLayout *)self mediaVersion] + 1)];
      [(PXStoryStyleChromeLayout *)self _invalidateContent];
      [(PXStoryStyleChromeLayout *)self _invalidateStrings];
    }
  }
}

- (void)setStyleInfo:(id)a3
{
  double v7 = (PXStoryStyleDescriptor *)a3;
  objc_super v5 = self->_styleInfo;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(PXStoryStyleDescriptor *)v7 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_styleInfo, a3);
      [(PXStoryStyleChromeLayout *)self setMediaVersion:(unsigned __int16)([(PXStoryStyleChromeLayout *)self mediaVersion] + 1)];
      [(PXStoryStyleChromeLayout *)self _invalidateContent];
    }
  }
}

- (PXStoryStyleChromeLayout)initWithViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryStyleChromeLayout;
  char v6 = [(PXGLayout *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    [(PXGLayout *)v7 setContentSource:v7];
    v7->_songTitleSpriteIndex = 0;
    v7->_songTitleAccessorySpriteIndex = 1;
    v7->_songSubtitleSpriteIndex = 2;
    v7->_colorGradeNameSpriteIndex = 3;
    v7->_songArtworkSpriteIndex = 4;
    v7->_filterButtonSpriteIndex = 5;
    v7->_musicButtonSpriteIndex = 6;
    v7->_customLabelSpriteIndex = 7;
    v7->_uint64_t spriteCount = 8;
    [(PXGLayout *)v7 applySpriteChangeDetails:0 countAfterChanges:8 initialState:0 modifyState:0];
  }

  return v7;
}

+ (void)stopCachingResourcesForStyleInfo:(id)a3 viewLayoutSpec:(id)a4 displayScale:(double)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = [a3 songResource];
  uint64_t v8 = objc_msgSend(v7, "px_storyResourceSongAsset");
  uint64_t v9 = [v8 artworkDisplayAsset];

  if (v9)
  {
    uint64_t v10 = [off_1E5DA7108 defaultManager];
    [v10 imageProviderForAsset:v9];
    objc_claimAutoreleasedReturnValue();

    v11[0] = v9;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    objc_claimAutoreleasedReturnValue();
    [v6 chromeButtonSize];
    PXSizeScale();
  }
}

+ (void)startCachingResourcesForStyleInfo:(id)a3 viewLayoutSpec:(id)a4 displayScale:(double)a5
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = [a3 songResource];
  uint64_t v8 = objc_msgSend(v7, "px_storyResourceSongAsset");
  uint64_t v9 = [v8 artworkDisplayAsset];

  if (v9)
  {
    uint64_t v10 = [off_1E5DA7108 defaultManager];
    [v10 imageProviderForAsset:v9];
    objc_claimAutoreleasedReturnValue();

    v11[0] = v9;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    objc_claimAutoreleasedReturnValue();
    [v6 chromeButtonSize];
    PXSizeScale();
  }
}

@end