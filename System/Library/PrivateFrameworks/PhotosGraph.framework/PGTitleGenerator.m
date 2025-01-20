@interface PGTitleGenerator
- (BOOL)_triggerDefaultTitleGenerationIfNil;
- (BOOL)_useSplitTimeTitlesIfNeeded;
- (BOOL)isForHighlight;
- (NSLocale)locale;
- (NSSet)momentNodes;
- (NSSet)usedLocationNodes;
- (PGGraphYearNodeCollection)featuredYearNodes;
- (PGTitle)subtitle;
- (PGTitle)title;
- (PGTitleGenerationContext)titleGenerationContext;
- (PGTitleGenerator)initWithMomentNode:(id)a3 referenceDateInterval:(id)a4 keyAsset:(id)a5 curatedAssetCollection:(id)a6 assetCollection:(id)a7 type:(int64_t)a8 titleGenerationContext:(id)a9;
- (PGTitleGenerator)initWithMomentNode:(id)a3 type:(int64_t)a4 titleGenerationContext:(id)a5;
- (PGTitleGenerator)initWithMomentNodes:(id)a3 referenceDateInterval:(id)a4 keyAsset:(id)a5 curatedAssetCollection:(id)a6 assetCollection:(id)a7 type:(int64_t)a8 titleGenerationContext:(id)a9;
- (PGTitleGenerator)initWithMomentNodes:(id)a3 type:(int64_t)a4 titleGenerationContext:(id)a5;
- (PGTitleGeneratorDateMatching)dateMatching;
- (PHAsset)keyAsset;
- (PHAssetCollection)assetCollection;
- (PHAssetCollection)curatedAssetCollection;
- (double)_ratioOfAssetsWithoutLocation;
- (id)_addressNodeFromKeyAsset;
- (id)_addressNodesFromCuratedAssetCollection;
- (id)_defaultLocationTitle;
- (id)_defaultTimeTitle;
- (id)_defaultTitle;
- (id)_fetchAssetsFromCuratedAssetCollection;
- (id)_splitTimeTitles;
- (unint64_t)_allowedTimeTitleFormats;
- (unint64_t)lineBreakBehavior;
- (unint64_t)preferredTitleType;
- (void)_generateTitleAndSubtitle;
- (void)_generateTitleAndSubtitleWithResult:(id)a3;
- (void)setFeaturedYearNodes:(id)a3;
- (void)setIsForHighlight:(BOOL)a3;
- (void)setLineBreakBehavior:(unint64_t)a3;
- (void)setLocale:(id)a3;
- (void)setPreferredTitleType:(unint64_t)a3;
- (void)setUsedLocationNodes:(id)a3;
@end

@implementation PGTitleGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuredYearNodes, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_usedLocationNodes, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleGenerationContext, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_curatedAssetCollection, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_dateMatching, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_curatedAssets, 0);
}

- (void)setFeaturedYearNodes:(id)a3
{
}

- (PGGraphYearNodeCollection)featuredYearNodes
{
  return self->_featuredYearNodes;
}

- (void)setIsForHighlight:(BOOL)a3
{
  self->_isForHighlight = a3;
}

- (BOOL)isForHighlight
{
  return self->_isForHighlight;
}

- (void)setLineBreakBehavior:(unint64_t)a3
{
  self->_lineBreakBehavior = a3;
}

- (unint64_t)lineBreakBehavior
{
  return self->_lineBreakBehavior;
}

- (void)setPreferredTitleType:(unint64_t)a3
{
  self->_preferredTitleType = a3;
}

- (unint64_t)preferredTitleType
{
  return self->_preferredTitleType;
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setUsedLocationNodes:(id)a3
{
}

- (NSSet)usedLocationNodes
{
  return self->_usedLocationNodes;
}

- (PGTitleGenerationContext)titleGenerationContext
{
  return self->_titleGenerationContext;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PHAssetCollection)curatedAssetCollection
{
  return self->_curatedAssetCollection;
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (PGTitleGeneratorDateMatching)dateMatching
{
  return self->_dateMatching;
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (id)_addressNodesFromCuratedAssetCollection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_curatedAssetCollection)
  {
    v3 = [MEMORY[0x1E4F1CA80] set];
    [(PGTitleGenerator *)self _fetchAssetsFromCuratedAssetCollection];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x1D25FED50](v5);
          v11 = objc_msgSend(v9, "location", (void)v14);
          if (v11)
          {
            v12 = +[PGAssetLocationResolver closestAddressNodeFromMomentNodes:self->_momentNodes toLocation:v11 withMaximumDistance:0 allowRemoteLocations:30000.0];
            if (v12) {
              [v3 addObject:v12];
            }
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        uint64_t v6 = v5;
      }
      while (v5);
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  return v3;
}

- (double)_ratioOfAssetsWithoutLocation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(PGTitleGenerator *)self _fetchAssetsFromCuratedAssetCollection];
  uint64_t v3 = [v2 count];
  if (v3)
  {
    unint64_t v4 = v3;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v2;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      unint64_t v8 = 0;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = (void *)MEMORY[0x1E4F8A930];
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "locationCoordinate", (void)v15);
          v8 += objc_msgSend(v11, "canUseCoordinate:") ^ 1;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
      double v12 = (double)v8;
    }
    else
    {
      double v12 = 0.0;
    }

    double v13 = v12 / (double)v4;
  }
  else
  {
    double v13 = 0.0;
  }

  return v13;
}

- (id)_fetchAssetsFromCuratedAssetCollection
{
  curatedAssetCollection = self->_curatedAssetCollection;
  if (curatedAssetCollection)
  {
    curatedAssets = self->_curatedAssets;
    if (!curatedAssets)
    {
      id v5 = [(PHAssetCollection *)curatedAssetCollection photoLibrary];
      uint64_t v6 = [v5 librarySpecificFetchOptions];

      [v6 setIncludeGuestAssets:1];
      uint64_t v7 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:self->_curatedAssetCollection options:v6];
      unint64_t v8 = self->_curatedAssets;
      self->_curatedAssets = v7;

      curatedAssets = self->_curatedAssets;
    }
    curatedAssetCollection = curatedAssets;
  }
  return curatedAssetCollection;
}

- (id)_addressNodeFromKeyAsset
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  keyAsset = self->_keyAsset;
  if (keyAsset)
  {
    [(PHAsset *)keyAsset setCanUseLocationCoordinateForLocation:1];
    unint64_t v4 = +[PGAssetLocationResolver closestAssetLocationForAsset:self->_keyAsset inAssetCollection:self->_assetCollection];
    momentNodes = self->_momentNodes;
    if (v4) {
      +[PGAssetLocationResolver closestAddressNodeFromMomentNodes:momentNodes toLocation:v4 withMaximumDistance:0 allowRemoteLocations:1.79769313e308];
    }
    else {
    uint64_t v6 = +[PGCommonTitleUtility bestAddressNodeForMomentNodes:momentNodes];
    }
    if (!v6)
    {
      uint64_t v7 = +[PGLogging sharedLogging];
      unint64_t v8 = [v7 loggingConnection];

      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = self->_momentNodes;
        int v11 = 138412290;
        double v12 = v9;
        _os_log_impl(&dword_1D1805000, v8, OS_LOG_TYPE_INFO, "Cannot find address node in moment node %@.", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (BOOL)_useSplitTimeTitlesIfNeeded
{
  return 1;
}

- (BOOL)_triggerDefaultTitleGenerationIfNil
{
  return 0;
}

- (unint64_t)_allowedTimeTitleFormats
{
  if (self->_preferredTitleType == 1) {
    return 1;
  }
  else {
    return [(PGTitleGeneratorDateMatching *)self->_dateMatching allowedTimeTitleFormats];
  }
}

- (id)_splitTimeTitles
{
  if ((self->_preferredTitleType & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v2 = 0;
  }
  else
  {
    unint64_t v4 = objc_alloc_init(PGTimeTitleOptions);
    [(PGTimeTitleOptions *)v4 setMomentNodes:self->_momentNodes];
    [(PGTimeTitleOptions *)v4 setAllowedFormats:[(PGTitleGenerator *)self _allowedTimeTitleFormats]];
    [(PGTimeTitleOptions *)v4 setLocale:self->_locale];
    [(PGTimeTitleOptions *)v4 setFilterDates:self->_preferredTitleType != 1];
    [(PGTimeTitleOptions *)v4 setFeaturedYearNodes:self->_featuredYearNodes];
    v2 = +[PGTimeTitleUtility splitTimeTitleWithOptions:v4];
  }
  return v2;
}

- (id)_defaultTimeTitle
{
  if ((self->_preferredTitleType & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v2 = 0;
  }
  else
  {
    unint64_t v4 = objc_alloc_init(PGTimeTitleOptions);
    [(PGTimeTitleOptions *)v4 setMomentNodes:self->_momentNodes];
    [(PGTimeTitleOptions *)v4 setAllowedFormats:[(PGTitleGenerator *)self _allowedTimeTitleFormats]];
    [(PGTimeTitleOptions *)v4 setLocale:self->_locale];
    [(PGTimeTitleOptions *)v4 setFilterDates:self->_preferredTitleType != 1];
    [(PGTimeTitleOptions *)v4 setFeaturedYearNodes:self->_featuredYearNodes];
    if (![(PGTitleGeneratorDateMatching *)self->_dateMatching type]) {
      [(PGTimeTitleOptions *)v4 setLocationNodes:self->_usedLocationNodes];
    }
    id v5 = +[PGTimeTitleUtility timeTitleWithOptions:v4];
    v2 = +[PGTitle titleWithString:v5 category:5];
  }
  return v2;
}

- (id)_defaultLocationTitle
{
  if (self->_preferredTitleType == 1)
  {
    v2 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    long long v15 = &v14;
    uint64_t v16 = 0x3032000000;
    long long v17 = __Block_byref_object_copy__43600;
    long long v18 = __Block_byref_object_dispose__43601;
    id v19 = 0;
    unint64_t v4 = [(PGTitleGenerator *)self _addressNodeFromKeyAsset];
    id v5 = [(PGTitleGenerator *)self _addressNodesFromCuratedAssetCollection];
    uint64_t v6 = v5;
    if (self->_curatedAssetCollection && ![v5 count]
      || ([(PGTitleGenerator *)self _ratioOfAssetsWithoutLocation], v7 >= 0.9))
    {
      v2 = 0;
    }
    else
    {
      unint64_t v8 = objc_alloc_init(PGLocationTitleOptions);
      [(PGLocationTitleOptions *)v8 setMomentNodes:self->_momentNodes];
      [(PGLocationTitleOptions *)v8 setKeyAssetAddressNode:v4];
      [(PGLocationTitleOptions *)v8 setCurationAddressNodes:v6];
      [(PGLocationTitleOptions *)v8 setLineBreakBehavior:self->_lineBreakBehavior];
      if (self->_isForHighlight)
      {
        [(PGLocationTitleOptions *)v8 setUseBusinessItems:1];
        [(PGLocationTitleOptions *)v8 setUseDistrict:1];
        [(PGLocationTitleOptions *)v8 setAllowFamilyHome:0];
        [(PGLocationTitleOptions *)v8 setAoiDisplayType:2];
      }
      if (self->_preferredTitleType == 3) {
        [(PGLocationTitleOptions *)v8 setShowAllCities:1];
      }
      uint64_t v9 = [(PGTitleGenerationContext *)self->_titleGenerationContext locationHelper];
      v10 = [(PGTitleGenerationContext *)self->_titleGenerationContext serviceManager];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __41__PGTitleGenerator__defaultLocationTitle__block_invoke;
      v13[3] = &unk_1E68EE790;
      v13[4] = self;
      v13[5] = &v14;
      +[PGLocationTitleUtility generateLocationTitleWithOptions:v8 locationHelper:v9 serviceManager:v10 result:v13];

      int v11 = (void *)v15[5];
      if (v11 && [v11 length])
      {
        v2 = +[PGTitle titleWithString:v15[5] category:4];
      }
      else
      {
        v2 = 0;
      }
    }
    _Block_object_dispose(&v14, 8);
  }
  return v2;
}

void __41__PGTitleGenerator__defaultLocationTitle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 88);
  *(void *)(v9 + 88) = v6;
}

- (id)_defaultTitle
{
  uint64_t v3 = self->_momentNodes;
  if ([(NSSet *)v3 count])
  {
    if (self->_preferredTitleType == 3)
    {
      unint64_t v4 = [(PGTitleGenerator *)self _defaultLocationTitle];
    }
    else
    {
      uint64_t v7 = [(PGTitleGenerator *)self dateMatching];
      unint64_t v8 = [PGTitleGeneratorDateMatching alloc];
      uint64_t v9 = [v7 type];
      v10 = [v7 referenceDateInterval];
      id v11 = [(PGTitleGeneratorDateMatching *)v8 initWithType:v9 referenceDateInterval:v10 momentNodes:self->_momentNodes lineBreakBehavior:[(PGTitleGenerator *)self lineBreakBehavior] isForHighlight:self->_isForHighlight titleGenerationContext:self->_titleGenerationContext];

      double v12 = [(PGTitleGeneratorDateMatching *)v11 title];
      unint64_t v4 = v12;
      if (!v12
        || ([v12 stringValue],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            uint64_t v14 = [v13 length],
            v13,
            !v14))
      {
        uint64_t v15 = [(PGTitleGenerator *)self _defaultLocationTitle];

        unint64_t v4 = (void *)v15;
      }
    }
  }
  else
  {
    id v5 = +[PGLogging sharedLogging];
    id v6 = [v5 loggingConnection];

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_error_impl(&dword_1D1805000, v6, OS_LOG_TYPE_ERROR, "Cannot generate title with no Moment Nodes", v17, 2u);
    }

    unint64_t v4 = 0;
  }

  return v4;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  id v6 = (void (**)(id, void *, void *))a3;
  unint64_t v4 = [(PGTitleGenerator *)self _defaultTitle];
  id v5 = [(PGTitleGenerator *)self _defaultTimeTitle];
  if (v6) {
    v6[2](v6, v4, v5);
  }
}

- (void)_generateTitleAndSubtitle
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__43600;
  v36 = __Block_byref_object_dispose__43601;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__43600;
  v30 = __Block_byref_object_dispose__43601;
  id v31 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __45__PGTitleGenerator__generateTitleAndSubtitle__block_invoke;
  v25[3] = &unk_1E68EA580;
  v25[4] = &v32;
  v25[5] = &v26;
  [(PGTitleGenerator *)self _generateTitleAndSubtitleWithResult:v25];
  uint64_t v3 = [(id)v33[5] stringValue];
  unint64_t v4 = [(id)v27[5] stringValue];
  if (v3 && [v3 length]
    || [(PGTitleGenerator *)self _triggerDefaultTitleGenerationIfNil])
  {
    p_subtitle = &self->_subtitle;
    objc_storeStrong((id *)&self->_subtitle, (id)v27[5]);
    if (v3 && [v3 length])
    {
      id v6 = v33;
LABEL_7:
      uint64_t v7 = (PGTitle *)(id)v6[5];
      title = self->_title;
      self->_title = v7;
LABEL_8:

      goto LABEL_19;
    }
    if ([(PGTitleGenerator *)self _triggerDefaultTitleGenerationIfNil])
    {
      uint64_t v9 = [(PGTitleGenerator *)self _defaultTitle];
      v10 = self->_title;
      self->_title = v9;

      if (![v4 length])
      {
        uint64_t v11 = [(PGTitleGenerator *)self _defaultTimeTitle];
        title = *p_subtitle;
        *p_subtitle = (PGTitle *)v11;
        goto LABEL_8;
      }
    }
  }
  else
  {
    if ([(PGTitleGenerator *)self _useSplitTimeTitlesIfNeeded])
    {
      title = [(PGTitleGenerator *)self _splitTimeTitles];
      if ([title count])
      {
        double v12 = [title firstObject];
        uint64_t v13 = +[PGTitle titleWithString:v12 category:5];
        uint64_t v14 = self->_title;
        self->_title = v13;

        if ((unint64_t)[title count] >= 2)
        {
          uint64_t v15 = [title lastObject];
          uint64_t v16 = +[PGTitle titleWithString:v15 category:5];
          subtitle = self->_subtitle;
          self->_subtitle = v16;
        }
      }
      goto LABEL_8;
    }
    if (v4 && [v4 length])
    {
      id v6 = v27;
      goto LABEL_7;
    }
  }
LABEL_19:
  if (!self->_title && (self->_preferredTitleType & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    long long v18 = +[PGLogging sharedLogging];
    id v19 = [v18 loggingConnection];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = v33[5];
      uint64_t v24 = v27[5];
      *(_DWORD *)buf = 138412546;
      uint64_t v39 = v23;
      __int16 v40 = 2112;
      uint64_t v41 = v24;
      _os_log_error_impl(&dword_1D1805000, v19, OS_LOG_TYPE_ERROR, "Title and subtitle are nil, which should never happen. \"%@\" \"%@\". Will use empty string for title", buf, 0x16u);
    }

    uint64_t v20 = +[PGTitle titleWithString:&stru_1F283BC78 category:0];
    v21 = self->_title;
    self->_title = v20;

    v22 = self->_subtitle;
    self->_subtitle = 0;
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

void __45__PGTitleGenerator__generateTitleAndSubtitle__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  unint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (PGTitle)subtitle
{
  if (!self->_title) {
    [(PGTitleGenerator *)self _generateTitleAndSubtitle];
  }
  subtitle = self->_subtitle;
  return subtitle;
}

- (PGTitle)title
{
  title = self->_title;
  if (!title)
  {
    [(PGTitleGenerator *)self _generateTitleAndSubtitle];
    title = self->_title;
  }
  return title;
}

- (PGTitleGenerator)initWithMomentNode:(id)a3 type:(int64_t)a4 titleGenerationContext:(id)a5
{
  return [(PGTitleGenerator *)self initWithMomentNode:a3 referenceDateInterval:0 keyAsset:0 curatedAssetCollection:0 assetCollection:0 type:a4 titleGenerationContext:a5];
}

- (PGTitleGenerator)initWithMomentNodes:(id)a3 type:(int64_t)a4 titleGenerationContext:(id)a5
{
  return [(PGTitleGenerator *)self initWithMomentNodes:a3 referenceDateInterval:0 keyAsset:0 curatedAssetCollection:0 assetCollection:0 type:a4 titleGenerationContext:a5];
}

- (PGTitleGenerator)initWithMomentNodes:(id)a3 referenceDateInterval:(id)a4 keyAsset:(id)a5 curatedAssetCollection:(id)a6 assetCollection:(id)a7 type:(int64_t)a8 titleGenerationContext:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v26 = a5;
  id v25 = a6;
  id v17 = a7;
  id v18 = a9;
  v27.receiver = self;
  v27.super_class = (Class)PGTitleGenerator;
  id v19 = [(PGTitleGenerator *)&v27 init];
  uint64_t v20 = v19;
  if (v19)
  {
    v19->_lineBreakBehavior = 1;
    objc_storeStrong((id *)&v19->_momentNodes, a3);
    objc_storeStrong((id *)&v20->_assetCollection, a7);
    objc_storeStrong((id *)&v20->_keyAsset, a5);
    objc_storeStrong((id *)&v20->_curatedAssetCollection, a6);
    v21 = [[PGTitleGeneratorDateMatching alloc] initWithType:a8 referenceDateInterval:v16 momentNodes:v15 titleGenerationContext:v18];
    dateMatching = v20->_dateMatching;
    v20->_dateMatching = v21;

    v20->_preferredTitleType = 0;
    objc_storeStrong((id *)&v20->_titleGenerationContext, a9);
  }

  return v20;
}

- (PGTitleGenerator)initWithMomentNode:(id)a3 referenceDateInterval:(id)a4 keyAsset:(id)a5 curatedAssetCollection:(id)a6 assetCollection:(id)a7 type:(int64_t)a8 titleGenerationContext:(id)a9
{
  id v16 = (void *)MEMORY[0x1E4F1CAD0];
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  if (a3) {
    [v16 setWithObject:a3];
  }
  else {
  v22 = [v16 set];
  }
  uint64_t v23 = [(PGTitleGenerator *)self initWithMomentNodes:v22 referenceDateInterval:v21 keyAsset:v20 curatedAssetCollection:v19 assetCollection:v18 type:a8 titleGenerationContext:v17];

  return v23;
}

@end