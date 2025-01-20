@interface PXStoryConcreteStyle
+ (id)bestClipCompositionFromClipCompositions:(id)a3 forKeyAsset:(id)a4 contentInfo:(id *)a5 playbackStyle:(int64_t)a6 spec:(id)a7 croppingContext:(id)a8 options:(unint64_t)a9 loggingOptions:(unint64_t)a10;
- ($1A23BB056C565A410801C90FE7234890)styleOptions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration;
- (BOOL)isCustomized;
- (Class)timelineStyleClass;
- (NSString)originalColorGradeCategory;
- (PXAudioCueSource)cueSource;
- (PXStoryAutoEditDecisionList)autoEditDecisionList;
- (PXStoryConcreteStyle)initWithCustomColorGradeKind:(int64_t)a3 originalColorGradeCategory:(id)a4 songResource:(id)a5 cueSource:(id)a6 autoEditDecisionList:(id)a7 styleOptions:(id)a8 isCustomized:(BOOL)a9 storyConfiguration:(id)a10;
- (PXStoryConcreteStyle)initWithStoryConfiguration:(id)a3;
- (PXStoryConfiguration)storyConfiguration;
- (PXStorySongResource)songResource;
- (id)createRandomNumberGenerators;
- (id)description;
- (id)timelineStyleWithSpec:(id)a3 resourcesDataSource:(id)a4 randomNumberGenerators:(id)a5 errorReporter:(id)a6;
- (int64_t)customColorGradeKind;
@end

@implementation PXStoryConcreteStyle

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storyConfiguration);
  objc_storeStrong((id *)&self->_autoEditDecisionList, 0);
  objc_storeStrong((id *)&self->_cueSource, 0);
  objc_storeStrong((id *)&self->_songResource, 0);
  objc_storeStrong((id *)&self->_originalColorGradeCategory, 0);
  objc_storeStrong((id *)&self->_autoEditConfiguration, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositionsInSquareView, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositionsInLandscape, 0);
  objc_storeStrong((id *)&self->_allowedClipCompositionsInPortrait, 0);
  objc_storeStrong((id *)&self->_allowedKeyAssetClipCompositionsInLandscape, 0);
  objc_storeStrong((id *)&self->_allowedKeyAssetClipCompositionsInPortrait, 0);
}

- (PXStoryConfiguration)storyConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storyConfiguration);
  return (PXStoryConfiguration *)WeakRetained;
}

- ($1A23BB056C565A410801C90FE7234890)styleOptions
{
  uint64_t v2 = *(void *)&self->_styleOptions.preferStillKeySegment;
  unint64_t croppingOptions = self->_styleOptions.croppingOptions;
  result.var1 = v2;
  result.var0 = croppingOptions;
  return result;
}

- (PXStoryAutoEditDecisionList)autoEditDecisionList
{
  return self->_autoEditDecisionList;
}

- (PXAudioCueSource)cueSource
{
  return self->_cueSource;
}

- (BOOL)isCustomized
{
  return self->_isCustomized;
}

- (PXStorySongResource)songResource
{
  return self->_songResource;
}

- (int64_t)customColorGradeKind
{
  return self->_customColorGradeKind;
}

- (NSString)originalColorGradeCategory
{
  return self->_originalColorGradeCategory;
}

- (id)timelineStyleWithSpec:(id)a3 resourcesDataSource:(id)a4 randomNumberGenerators:(id)a5 errorReporter:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  a6;
  a5;
  +[PXStorySettings sharedInstance];
  objc_claimAutoreleasedReturnValue();
  [v9 viewportSize];
  PXSizeGetAspectRatio();
}

- (id)createRandomNumberGenerators
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F8CD40]) initWithSeed:0];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)outroDuration
{
  v4 = [(PXStoryConcreteStyle *)self autoEditDecisionList];
  if (v4)
  {
    v6 = v4;
    [v4 outroDuration];
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (Class)timelineStyleClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(PXStoryConcreteStyle *)self originalColorGradeCategory];
  [(PXStoryConcreteStyle *)self customColorGradeKind];
  uint64_t v6 = PFStoryColorGradeKindToString();
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = @"-";
  }
  id v9 = [(PXStoryConcreteStyle *)self songResource];
  id v10 = objc_msgSend(v9, "px_storyResourceIdentifier");
  v11 = objc_msgSend(v3, "initWithFormat:", @"<%@ %p; originalColorGradeCategory: %@; customColorGradeKind %@; songID: %@>",
                  v4,
                  self,
                  v5,
                  v8,
                  v10);

  return v11;
}

- (PXStoryConcreteStyle)initWithCustomColorGradeKind:(int64_t)a3 originalColorGradeCategory:(id)a4 songResource:(id)a5 cueSource:(id)a6 autoEditDecisionList:(id)a7 styleOptions:(id)a8 isCustomized:(BOOL)a9 storyConfiguration:(id)a10
{
  SEL v67 = a2;
  v97[1] = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v73 = a5;
  id v72 = a6;
  id v71 = a7;
  id v17 = a10;
  v92.receiver = self;
  v92.super_class = (Class)PXStoryConcreteStyle;
  v18 = [(PXStoryConcreteStyle *)&v92 init];
  v19 = v18;
  if (!v18) {
    goto LABEL_33;
  }
  id v69 = v16;
  v18->_customColorGradeKind = a3;
  objc_storeStrong((id *)&v18->_originalColorGradeCategory, a4);
  objc_storeStrong((id *)&v19->_songResource, a5);
  objc_storeStrong((id *)&v19->_cueSource, a6);
  v19->_styleOptions = ($E177156E84AC54117B07FF8A1BF86624)a8;
  v19->_isCustomized = a9;
  objc_storeWeak((id *)&v19->_storyConfiguration, v17);
  uint64_t v20 = +[PXStoryAutoEditConfigurationFactory autoEditConfiguration];
  autoEditConfiguration = v19->_autoEditConfiguration;
  v19->_autoEditConfiguration = (PFStoryAutoEditConfiguration *)v20;

  p_autoEditDecisionList = (id *)&v19->_autoEditDecisionList;
  objc_storeStrong((id *)&v19->_autoEditDecisionList, a7);
  if (!v19->_autoEditDecisionList)
  {
    v23 = objc_msgSend(v73, "px_storyResourceSongAsset");
    v24 = v23;
    if (v23) {
      uint64_t v25 = [v23 pace];
    }
    else {
      uint64_t v25 = 2;
    }
    memset(&v91, 0, sizeof(v91));
    -[PFStoryAutoEditConfiguration outroDurationForSongPace:](v19->_autoEditConfiguration, "outroDurationForSongPace:", v25, v67);
    CMTimeMakeWithSeconds(&v91, v26, 600);
    if (v17) {
      uint64_t v27 = [v17 disableNUp] ^ 1;
    }
    else {
      uint64_t v27 = 1;
    }
    v28 = [PXStoryConcreteAutoEditDecisionList alloc];
    long long v29 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 48);
    v90[2] = *(_OWORD *)(MEMORY[0x1E4F8D288] + 32);
    v90[3] = v29;
    v90[4] = *(_OWORD *)(MEMORY[0x1E4F8D288] + 64);
    long long v30 = *(_OWORD *)(MEMORY[0x1E4F8D288] + 16);
    v90[0] = *MEMORY[0x1E4F8D288];
    v90[1] = v30;
    CMTime v89 = v91;
    uint64_t v31 = [(PXStoryConcreteAutoEditDecisionList *)v28 initWithColorGradeCategory:v16 song:v24 clipCatalog:0 constrainedOverallDurationInfo:v90 outroDuration:&v89 allowsNUp:v27];
    id v32 = *p_autoEditDecisionList;
    id *p_autoEditDecisionList = (id)v31;
  }
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  if ([v17 isLetterboxingAllowed])
  {
    v35 = +[PXStoryClipCompositionFactory defaultOneUpCompositions];
  }
  else
  {
    v36 = +[PXStoryClipCompositionFactory oneUpComposition];
    v97[0] = v36;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:1];
  }
  v37 = +[PXStorySettings sharedInstance];
  v70 = v37;
  if ([v17 otherAssetsAspectRatioOverride])
  {
    v38 = OneUpCompositionForAspectRatio([v17 otherAssetsAspectRatioOverride]);
    v96 = v38;
    uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v96 count:1];

    v37 = v70;
    v35 = (void *)v39;
  }
  if ([v17 keyAssetAspectRatioOverride])
  {
    v40 = OneUpCompositionForAspectRatio([v17 keyAssetAspectRatioOverride]);
    v95 = v40;
    v41 = (void *)MEMORY[0x1E4F1C978];
    v42 = &v95;
  }
  else
  {
    if ([v37 allowNonFillingCompositionsForKeyAsset]
      && [v17 isLetterboxingAllowed])
    {
      if ([v37 limitKeyAssetAspectRatioToFeedCard])
      {
        v86[0] = MEMORY[0x1E4F143A8];
        v86[1] = 3221225472;
        v86[2] = __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke_2;
        v86[3] = &unk_1E5DCE1A8;
        id v43 = v37;
        id v87 = v43;
        uint64_t v88 = 0x3F50624DD2F1A9FCLL;
        uint64_t v44 = __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke(v86);
        allowedKeyAssetClipCompositionsInPortrait = v19->_allowedKeyAssetClipCompositionsInPortrait;
        v19->_allowedKeyAssetClipCompositionsInPortrait = (NSArray *)v44;

        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke_3;
        v83[3] = &unk_1E5DCE1A8;
        id v84 = v43;
        uint64_t v85 = 0x3F50624DD2F1A9FCLL;
        uint64_t v46 = __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke(v83);
        allowedKeyAssetClipCompositionsInLandscape = v19->_allowedKeyAssetClipCompositionsInLandscape;
        v19->_allowedKeyAssetClipCompositionsInLandscape = (NSArray *)v46;

        v40 = v87;
      }
      else
      {
        objc_storeStrong((id *)&v19->_allowedKeyAssetClipCompositionsInLandscape, v35);
        v66 = v35;
        v40 = v19->_allowedKeyAssetClipCompositionsInPortrait;
        v19->_allowedKeyAssetClipCompositionsInPortrait = v66;
      }
      goto LABEL_23;
    }
    v40 = +[PXStoryClipCompositionFactory oneUpComposition];
    v94 = v40;
    v41 = (void *)MEMORY[0x1E4F1C978];
    v42 = &v94;
  }
  v48 = [v41 arrayWithObjects:v42 count:1];
  v49 = v19->_allowedKeyAssetClipCompositionsInLandscape;
  v19->_allowedKeyAssetClipCompositionsInLandscape = v48;

  objc_storeStrong((id *)&v19->_allowedKeyAssetClipCompositionsInPortrait, v48);
LABEL_23:

  [v33 addObjectsFromArray:v35];
  [v34 addObjectsFromArray:v35];
  if ([*p_autoEditDecisionList allowsNUp])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke_4;
    aBlock[3] = &unk_1E5DCE1D0;
    id v82 = v68;
    v79 = v19;
    id v80 = v34;
    id v68 = v33;
    id v81 = v33;
    v50 = (void (**)(void *, void))_Block_copy(aBlock);
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v51 = +[PXStoryClipCompositionFactory defaultTwoUpCompositions];
    uint64_t v52 = [v51 countByEnumeratingWithState:&v74 objects:v93 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v75 != v54) {
            objc_enumerationMutation(v51);
          }
          v50[2](v50, *(void *)(*((void *)&v74 + 1) + 8 * i));
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v74 objects:v93 count:16];
      }
      while (v53);
    }

    v56 = +[PXStoryClipCompositionFactory threeUpVerticalThirdsComposition];
    ((void (**)(void *, void *))v50)[2](v50, v56);

    v57 = +[PXStoryClipCompositionFactory threeUpHorizontalThirdsComposition];
    ((void (**)(void *, void *))v50)[2](v50, v57);

    id v33 = v68;
  }
  uint64_t v58 = objc_msgSend(v33, "array", v68);
  allowedClipCompositionsInPortrait = v19->_allowedClipCompositionsInPortrait;
  v19->_allowedClipCompositionsInPortrait = (NSArray *)v58;

  uint64_t v60 = [v34 array];
  allowedClipCompositionsInLandscape = v19->_allowedClipCompositionsInLandscape;
  v19->_allowedClipCompositionsInLandscape = (NSArray *)v60;

  v62 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v19->_allowedClipCompositionsInPortrait];
  [v62 addObjectsFromArray:v19->_allowedClipCompositionsInLandscape];
  uint64_t v63 = [v62 array];
  allowedClipCompositionsInSquareView = v19->_allowedClipCompositionsInSquareView;
  v19->_allowedClipCompositionsInSquareView = (NSArray *)v63;

  id v16 = v69;
LABEL_33:

  return v19;
}

BOOL __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke_2(uint64_t a1, double a2)
{
  [*(id *)(a1 + 32) feedCardPortraitAspectRatio];
  return v4 + *(double *)(a1 + 40) >= a2;
}

id __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke(void *a1)
{
  v1 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  double v4 = +[PXStoryClipCompositionFactory oneUpComposition];
  [v3 addObject:v4];

  v5 = +[PXStoryClipCompositionFactory oneUpCompositionsWithAspectRatioPassingTest:v2];

  [v3 addObjectsFromArray:v5];
  uint64_t v6 = (void *)[v3 copy];

  return v6;
}

BOOL __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke_3(uint64_t a1, double a2)
{
  [*(id *)(a1 + 32) feedCardLandscapeAspectRatio];
  return v4 - *(double *)(a1 + 40) <= a2;
}

void __169__PXStoryConcreteStyle_initWithCustomColorGradeKind_originalColorGradeCategory_songResource_cueSource_autoEditDecisionList_styleOptions_isCustomized_storyConfiguration___block_invoke_4(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 mainDividerAxis];
  if (v3 == 1)
  {
    uint64_t v6 = (id *)(a1 + 40);
LABEL_7:
    [*v6 addObject:v7];
    double v4 = v7;
    goto LABEL_8;
  }
  if (v3 == 2)
  {
    uint64_t v6 = (id *)(a1 + 48);
    goto LABEL_7;
  }
  double v4 = v7;
  if (!v3)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:*(void *)(a1 + 56) object:*(void *)(a1 + 32) file:@"PXStoryConcreteStyle.m" lineNumber:282 description:@"Code which should be unreachable has been reached"];

    abort();
  }
LABEL_8:
}

- (PXStoryConcreteStyle)initWithStoryConfiguration:(id)a3
{
  LOBYTE(v4) = 0;
  return -[PXStoryConcreteStyle initWithCustomColorGradeKind:originalColorGradeCategory:songResource:cueSource:autoEditDecisionList:styleOptions:isCustomized:storyConfiguration:](self, "initWithCustomColorGradeKind:originalColorGradeCategory:songResource:cueSource:autoEditDecisionList:styleOptions:isCustomized:storyConfiguration:", 0, 0, 0, 0, 0, 0, 0, v4, a3);
}

+ (id)bestClipCompositionFromClipCompositions:(id)a3 forKeyAsset:(id)a4 contentInfo:(id *)a5 playbackStyle:(int64_t)a6 spec:(id)a7 croppingContext:(id)a8 options:(unint64_t)a9 loggingOptions:(unint64_t)a10
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  a8;
  if (![v13 count])
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PXStoryConcreteStyle.m", 157, @"Invalid parameter not satisfying: %@", @"allowedClipCompositions.count > 0" object file lineNumber description];
  }
  [v15 viewportSize];
  [v15 nUpDividerWidth];
  [v14 aspectRatio];
  [v15 safeAreaInsets];
  [v15 viewportSize];
  PXSizeGetArea();
}

@end