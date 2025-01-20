@interface PXMemoriesLivingOnFeedbackWidget
- (BOOL)allowUserInteractionWithSubtitle;
- (BOOL)hasContentForCurrentInput;
- (BOOL)hasLoadedContentData;
- (BOOL)isUserInteractionEnabled;
- (CGSize)_layoutTokenViewsWithWidth:(double)a3;
- (NSArray)featureViews;
- (NSArray)features;
- (NSString)localizedDisclosureTitle;
- (NSString)localizedTitle;
- (PHMemory)memory;
- (PXAnonymousView)contentView;
- (PXPhotosDetailsContext)context;
- (PXWidgetDelegate)widgetDelegate;
- (double)preferredContentHeightForWidth:(double)a3;
- (id)_loadContentView;
- (id)_tokenViewsWithSuperview:(id)a3;
- (int64_t)contentLayoutStyle;
- (int64_t)contentViewAnchoringType;
- (void)_loadContentData;
- (void)_loadFeaturesFromPhotosGraphProperties:(id)a3;
- (void)_showReportFeedback;
- (void)loadContentData;
- (void)setContext:(id)a3;
- (void)setFeatureViews:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setMemory:(id)a3;
- (void)setWidgetDelegate:(id)a3;
- (void)unloadContentData;
@end

@implementation PXMemoriesLivingOnFeedbackWidget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_featureViews, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)setMemory:(id)a3
{
}

- (PHMemory)memory
{
  return self->_memory;
}

- (void)setFeatureViews:(id)a3
{
}

- (void)setFeatures:(id)a3
{
}

- (NSArray)features
{
  return self->_features;
}

- (PXWidgetDelegate)widgetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  return (PXWidgetDelegate *)WeakRetained;
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (void)_showReportFeedback
{
  v3 = [PXMemoryDiagnosticsViewController alloc];
  v4 = [(PXMemoriesLivingOnFeedbackWidget *)self memory];
  v6 = [(PXMemoryDiagnosticsViewController *)v3 initWithMemory:v4];

  [(PXCuratedAssetCollectionDiagnosticsViewController *)v6 setShouldPresentTapToRadar:1];
  v5 = [(PXMemoriesLivingOnFeedbackWidget *)self widgetDelegate];
  [v5 widget:self transitionToViewController:v6 withTransitionType:2];
}

- (BOOL)allowUserInteractionWithSubtitle
{
  return 0;
}

- (NSString)localizedDisclosureTitle
{
  return (NSString *)PXLocalizedStringFromTable(@"Provide Feedback", @"PhotosUICore");
}

- (NSString)localizedTitle
{
  return (NSString *)PXLocalizedStringFromTable(@"Rate this Memory", @"PhotosUICore");
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (int64_t)contentLayoutStyle
{
  return 0;
}

- (int64_t)contentViewAnchoringType
{
  return 0;
}

- (CGSize)_layoutTokenViewsWithWidth:(double)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v4 = (CGFloat *)MEMORY[0x1E4F1DB28];
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  CGFloat r1 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v6 = [(PXMemoriesLivingOnFeedbackWidget *)self featureViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    CGFloat x = *v4;
    CGFloat y = v4[1];
    uint64_t v11 = *(void *)v28;
    double v25 = a3 + -20.0;
    double v12 = 20.0;
    double v13 = 20.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v6);
        }
        v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_msgSend(v15, "intrinsicContentSize", *(void *)&v25);
        double v17 = v16;
        double v19 = v18;
        v34.origin.CGFloat x = v13;
        v34.origin.CGFloat y = v12;
        v34.size.width = v17;
        v34.size.double height = v19;
        CGFloat MaxX = CGRectGetMaxX(v34);
        BOOL v21 = MaxX <= v25;
        if (MaxX > v25) {
          double v13 = 20.0;
        }
        double v22 = -0.0;
        if (!v21) {
          double v22 = v19 + 4.0;
        }
        double v12 = v12 + v22;
        objc_msgSend(v15, "setFrame:", v13, v12, v17, v19);
        v35.origin.CGFloat x = x;
        v35.origin.CGFloat y = y;
        v35.size.width = r1;
        v35.size.double height = height;
        v37.origin.CGFloat x = v13;
        v37.origin.CGFloat y = v12;
        v37.size.width = v17;
        v37.size.double height = v19;
        CGRect v36 = CGRectUnion(v35, v37);
        CGFloat x = v36.origin.x;
        CGFloat y = v36.origin.y;
        CGFloat r1 = v36.size.width;
        double height = v36.size.height;
        v36.origin.CGFloat x = v13;
        v36.origin.CGFloat y = v12;
        v36.size.width = v17;
        v36.size.double height = v19;
        double v13 = CGRectGetMaxX(v36) + 4.0;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  double v23 = height + 15.0;
  double v24 = r1;
  result.double height = v23;
  result.width = v24;
  return result;
}

- (NSArray)featureViews
{
  featureViews = self->_featureViews;
  if (!featureViews)
  {
    v4 = [(PXMemoriesLivingOnFeedbackWidget *)self contentView];
    v5 = [(PXMemoriesLivingOnFeedbackWidget *)self _tokenViewsWithSuperview:v4];
    v6 = self->_featureViews;
    self->_featureViews = v5;

    featureViews = self->_featureViews;
  }
  return featureViews;
}

- (id)_tokenViewsWithSuperview:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  id v6 = v4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [(PXMemoriesLivingOnFeedbackWidget *)self features];
  uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        double v12 = objc_alloc_init(PXProtoTextualFeatureView);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __61__PXMemoriesLivingOnFeedbackWidget__tokenViewsWithSuperview___block_invoke;
        v15[3] = &unk_1E5DD2CD0;
        v15[4] = v11;
        [(PXProtoFeatureView *)v12 performChanges:v15];
        [v5 addObject:v12];
        [v6 addSubview:v12];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

uint64_t __61__PXMemoriesLivingOnFeedbackWidget__tokenViewsWithSuperview___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFeature:*(void *)(a1 + 32)];
}

- (void)_loadFeaturesFromPhotosGraphProperties:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"info"];
  v49 = [v4 objectForKeyedSubscript:@"meaningLabels"];
  v53 = [v4 objectForKeyedSubscript:@"moodKeywords"];
  v54 = [v4 objectForKeyedSubscript:@"suggestedMood"];
  v51 = v4;
  v55 = [v4 objectForKeyedSubscript:@"notificationQuality"];
  v52 = v3;
  v5 = [v3 objectForKeyedSubscript:@"backingMoments"];
  v60 = [MEMORY[0x1E4F1CA80] set];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v5;
  uint64_t v58 = [obj countByEnumeratingWithState:&v77 objects:v87 count:16];
  if (v58)
  {
    uint64_t v57 = *(void *)v78;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v78 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v59 = v6;
        uint64_t v7 = [*(id *)(*((void *)&v77 + 1) + 8 * v6) objectForKeyedSubscript:@"keywords"];
        uint64_t v8 = [v7 objectForKeyedSubscript:@"Place"];

        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v73 objects:v86 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v74 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v73 + 1) + 8 * i);
              unint64_t v15 = [v14 rangeOfString:@"]"];
              if (v15 < 2 || v15 == 0x7FFFFFFFFFFFFFFFLL)
              {
                long long v17 = PLUIGetLog();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v85 = v14;
                  _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_DEFAULT, "Cannot parse place \"%@\" in places. Unknown format.", buf, 0xCu);
                }
              }
              else
              {
                long long v17 = objc_msgSend(v14, "substringWithRange:", 1, v15 - 1);
                [v60 addObject:v17];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v73 objects:v86 count:16];
          }
          while (v11);
        }

        uint64_t v6 = v59 + 1;
      }
      while (v59 + 1 != v58);
      uint64_t v58 = [obj countByEnumeratingWithState:&v77 objects:v87 count:16];
    }
    while (v58);
  }

  uint64_t v18 = [v49 count];
  uint64_t v19 = [v53 count];
  uint64_t v20 = [v60 count];
  uint64_t v21 = v55 != 0;
  if (v54) {
    ++v21;
  }
  double v22 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v21 + v18 + v19 + v20];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v23 = v49;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v69 objects:v83 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v70 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = *(__CFString **)(*((void *)&v69 + 1) + 8 * j);
        int v29 = [(__CFString *)v28 isEqualToString:@"HolidayEvent"];
        long long v30 = [PXMemoriesDebugFeature alloc];
        if (v29)
        {
          v31 = &stru_1F00B0030;
          uint64_t v32 = 1;
        }
        else
        {
          v31 = v28;
          uint64_t v32 = 0;
        }
        v33 = [(PXMemoriesDebugFeature *)v30 initWithLocalizedTitle:v31 type:v32];
        [v22 addObject:v33];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v69 objects:v83 count:16];
    }
    while (v25);
  }

  if (v54)
  {
    CGRect v34 = [[PXMemoriesDebugFeature alloc] initWithLocalizedTitle:v54 type:3];
    [v22 addObject:v34];
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v35 = v53;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v65 objects:v82 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v66;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v66 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = [[PXMemoriesDebugFeature alloc] initWithLocalizedTitle:*(void *)(*((void *)&v65 + 1) + 8 * k) type:4];
        [v22 addObject:v40];
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v65 objects:v82 count:16];
    }
    while (v37);
  }

  if (v55 && ([v55 isEqualToString:@"None"] & 1) == 0)
  {
    v41 = [[PXMemoriesDebugFeature alloc] initWithLocalizedTitle:v55 type:5];
    [v22 addObject:v41];
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v42 = v60;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v61 objects:v81 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v62;
    do
    {
      for (uint64_t m = 0; m != v44; ++m)
      {
        if (*(void *)v62 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = [[PXMemoriesDebugFeature alloc] initWithLocalizedTitle:*(void *)(*((void *)&v61 + 1) + 8 * m) type:2];
        [v22 addObject:v47];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v61 objects:v81 count:16];
    }
    while (v44);
  }

  [(PXMemoriesLivingOnFeedbackWidget *)self setFeatures:v22];
  featureViews = self->_featureViews;
  self->_featureViews = 0;
}

- (id)_loadContentView
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  id v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return v3;
}

- (PXAnonymousView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id v4 = [(PXMemoriesLivingOnFeedbackWidget *)self _loadContentView];
    v5 = self->_contentView;
    self->_contentView = v4;

    contentView = self->_contentView;
  }
  return contentView;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  [(PXMemoriesLivingOnFeedbackWidget *)self _layoutTokenViewsWithWidth:a3];
  return v3;
}

- (BOOL)hasLoadedContentData
{
  return self->_hasLoadedContentData;
}

- (void)unloadContentData
{
  self->_hasLoadedContentData = 0;
}

- (void)_loadContentData
{
  id v7 = [(PXMemoriesLivingOnFeedbackWidget *)self context];
  double v3 = [v7 assetCollections];
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    if ([v4 assetCollectionType] == 4)
    {
      id v5 = v4;
      [(PXMemoriesLivingOnFeedbackWidget *)self setMemory:v5];
      uint64_t v6 = [v5 photosGraphProperties];

      [(PXMemoriesLivingOnFeedbackWidget *)self _loadFeaturesFromPhotosGraphProperties:v6];
    }
  }
  self->_hasLoadedContentData = 1;
}

- (void)loadContentData
{
  if (!self->_hasLoadedContentData) {
    [(PXMemoriesLivingOnFeedbackWidget *)self _loadContentData];
  }
}

- (BOOL)hasContentForCurrentInput
{
  [(PXMemoriesLivingOnFeedbackWidget *)self loadContentData];
  double v3 = [(PXMemoriesLivingOnFeedbackWidget *)self features];
  uint64_t v4 = [v3 count];

  return v4 != 0;
}

- (void)setWidgetDelegate:(id)a3
{
  id obj = a3;
  p_widgetDelegate = &self->_widgetDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_widgetDelegate);

  uint64_t v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_widgetDelegate, obj);
    uint64_t v6 = obj;
  }
}

- (void)setContext:(id)a3
{
  id v5 = (PXPhotosDetailsContext *)a3;
  context = self->_context;
  p_context = &self->_context;
  if (context != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_context, a3);
    id v5 = v8;
  }
}

@end