@interface PGRelated
- (BOOL)isGeneratingTitleBasedOnKeyAsset;
- (BOOL)shouldGenerateTitle;
- (NSArray)moments;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)keywords;
- (NSString)debugDescription;
- (NSString)subtitle;
- (NSString)title;
- (PGGraphRelatableEvent)eventNode;
- (PGRelated)initWithGraphMatchingResult:(id)a3 assetCollection:(id)a4 needsDebugInfo:(BOOL)a5;
- (PGRelated)initWithGraphMatchingResult:(id)a3 highlight:(id)a4 needsDebugInfo:(BOOL)a5;
- (PGRelated)initWithGraphMatchingResult:(id)a3 memory:(id)a4 needsDebugInfo:(BOOL)a5;
- (PGRelated)initWithGraphMatchingResult:(id)a3 moment:(id)a4 needsDebugInfo:(BOOL)a5;
- (PGRelated)initWithGraphMatchingResult:(id)a3 moments:(id)a4 tripMemoryTitleType:(unint64_t)a5 tripMomentNodes:(id)a6 titleGenerationContext:(id)a7 needsDebugInfo:(BOOL)a8;
- (PGRelated)initWithHighlight:(id)a3 needsDebugInfo:(BOOL)a4;
- (PGRelated)initWithMemory:(id)a3 needsDebugInfo:(BOOL)a4;
- (PGRelated)initWithMoment:(id)a3 needsDebugInfo:(BOOL)a4;
- (PHMemory)memory;
- (PHPhotosHighlight)highlight;
- (double)matchingScore;
- (double)score;
- (id)_initWithGraphMatchingResult:(id)a3 highlight:(id)a4 moments:(id)a5 needsDebugInfo:(BOOL)a6;
- (int64_t)dateMatchingType;
- (int64_t)titleCategory;
- (unint64_t)memoryTripTitleType;
- (unsigned)aggregatedVersions;
- (unsigned)graphSchemaVersion;
- (unsigned)relatedAlgorithmsVersion;
- (void)_addKeywords:(id)a3 forRelatedType:(unint64_t)a4;
- (void)_addKeywordsFromKeywords:(id)a3;
- (void)_generateTitleWithHighlightNode:(id)a3 referenceDateInterval:(id)a4 titleGenerationContext:(id)a5;
- (void)_generateTitleWithMomentNodes:(id)a3 keyAsset:(id)a4 referenceDateInterval:(id)a5 titleGenerationContext:(id)a6;
- (void)setDateMatchingType:(int64_t)a3;
- (void)setDebugDescription:(id)a3;
- (void)setEventNode:(id)a3;
- (void)setGenerateTitleBasedOnKeyAsset:(BOOL)a3;
- (void)setGraphSchemaVersion:(unsigned __int16)a3;
- (void)setHighlight:(id)a3;
- (void)setMatchingScore:(double)a3;
- (void)setMemoryTripTitleType:(unint64_t)a3;
- (void)setMoments:(id)a3;
- (void)setRelatedAlgorithmsVersion:(unsigned __int16)a3;
- (void)setScore:(double)a3;
- (void)setShouldGenerateTitle:(BOOL)a3;
- (void)setTitleCategory:(int64_t)a3;
@end

@implementation PGRelated

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_eventNode, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_moments, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_debugDescription, 0);
}

- (PHMemory)memory
{
  return self->_memory;
}

- (void)setEventNode:(id)a3
{
}

- (PGGraphRelatableEvent)eventNode
{
  return self->_eventNode;
}

- (void)setShouldGenerateTitle:(BOOL)a3
{
  self->_shouldGenerateTitle = a3;
}

- (BOOL)shouldGenerateTitle
{
  return self->_shouldGenerateTitle;
}

- (void)setGenerateTitleBasedOnKeyAsset:(BOOL)a3
{
  self->_generateTitleBasedOnKeyAsset = a3;
}

- (BOOL)isGeneratingTitleBasedOnKeyAsset
{
  return self->_generateTitleBasedOnKeyAsset;
}

- (void)setDateMatchingType:(int64_t)a3
{
  self->_dateMatchingType = a3;
}

- (int64_t)dateMatchingType
{
  return self->_dateMatchingType;
}

- (void)setMemoryTripTitleType:(unint64_t)a3
{
  self->_memoryTripTitleType = a3;
}

- (unint64_t)memoryTripTitleType
{
  return self->_memoryTripTitleType;
}

- (unsigned)aggregatedVersions
{
  return self->_aggregatedVersions;
}

- (NSDate)localEndDate
{
  return self->_localEndDate;
}

- (NSDate)localStartDate
{
  return self->_localStartDate;
}

- (void)setTitleCategory:(int64_t)a3
{
  self->_titleCategory = a3;
}

- (int64_t)titleCategory
{
  return self->_titleCategory;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (void)setMatchingScore:(double)a3
{
  self->_matchingScore = a3;
}

- (double)matchingScore
{
  return self->_matchingScore;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (NSDictionary)keywords
{
  return self->_keywords;
}

- (void)setMoments:(id)a3
{
}

- (NSArray)moments
{
  return self->_moments;
}

- (void)setHighlight:(id)a3
{
}

- (PHPhotosHighlight)highlight
{
  return self->_highlight;
}

- (void)setDebugDescription:(id)a3
{
}

- (NSString)debugDescription
{
  return self->_debugDescription;
}

- (void)_addKeywords:(id)a3 forRelatedType:(unint64_t)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v6 = NSNumber;
  id v7 = a3;
  v8 = [v6 numberWithUnsignedInteger:a4];
  v10 = v8;
  v11[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [(PGRelated *)self _addKeywordsFromKeywords:v9];
}

- (void)_addKeywordsFromKeywords:(id)a3
{
  keywords = self->_keywords;
  id v5 = a3;
  v6 = (void *)[(NSDictionary *)keywords mutableCopy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__PGRelated__addKeywordsFromKeywords___block_invoke;
  v10[3] = &unk_1E68EB5B0;
  id v7 = v6;
  v11 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  v8 = self->_keywords;
  self->_keywords = v7;
  v9 = v7;
}

void __38__PGRelated__addKeywordsFromKeywords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];

  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    v8 = [v7 objectForKeyedSubscript:v10];
    v9 = [v8 arrayByAddingObjectsFromArray:v5];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
  }
  else
  {
    [v7 setObject:v5 forKeyedSubscript:v10];
  }
}

- (void)setRelatedAlgorithmsVersion:(unsigned __int16)a3
{
  LOWORD(self->_aggregatedVersions) = a3;
}

- (unsigned)relatedAlgorithmsVersion
{
  return self->_aggregatedVersions;
}

- (void)setGraphSchemaVersion:(unsigned __int16)a3
{
  HIWORD(self->_aggregatedVersions) = a3;
}

- (unsigned)graphSchemaVersion
{
  return HIWORD(self->_aggregatedVersions);
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(PGRelated *)self title];

  if (v4)
  {
    id v5 = [(PGRelated *)self title];
    [v3 setObject:v5 forKeyedSubscript:@"PHRelatedSuggestedTitleKey"];
  }
  v6 = [(PGRelated *)self subtitle];

  if (v6)
  {
    id v7 = [(PGRelated *)self subtitle];
    [v3 setObject:v7 forKeyedSubscript:@"PHRelatedSuggestedSubtitleKey"];
  }
  v8 = NSNumber;
  [(PGRelated *)self score];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  [v3 setObject:v9 forKeyedSubscript:@"PHRelatedScoreKey"];

  id v10 = [(PGRelated *)self keywords];
  [v3 setObject:v10 forKeyedSubscript:@"PHRelatedKeywordsKey"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[PGRelated graphSchemaVersion](self, "graphSchemaVersion"));
  [v3 setObject:v11 forKeyedSubscript:@"PHRelatedGraphSchemaVersion"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[PGRelated relatedAlgorithmsVersion](self, "relatedAlgorithmsVersion"));
  [v3 setObject:v12 forKeyedSubscript:@"PHRelatedRelatedAlgorithmsVersion"];

  v13 = [(PGRelated *)self highlight];
  v14 = [v13 localIdentifier];
  [v3 setObject:v14 forKeyedSubscript:@"PHRelatedHighlightIdentifierKey"];

  v15 = [(PGRelated *)self memory];
  v16 = [v15 localIdentifier];
  [v3 setObject:v16 forKeyedSubscript:@"PHRelatedMemoryIdentifierKey"];

  v17 = [(PGRelated *)self moments];
  v18 = [v17 valueForKey:@"localIdentifier"];
  [v3 setObject:v18 forKeyedSubscript:@"PHRelatedMomentIdentifiersKey"];

  v19 = objc_msgSend(NSNumber, "numberWithInteger:", -[PGRelated titleCategory](self, "titleCategory"));
  [v3 setObject:v19 forKeyedSubscript:@"PHRelatedTitleCategoryKey"];

  return (NSDictionary *)v3;
}

- (void)_generateTitleWithMomentNodes:(id)a3 keyAsset:(id)a4 referenceDateInterval:(id)a5 titleGenerationContext:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [PGTitleGenerator alloc];
  v15 = [(NSArray *)self->_moments firstObject];
  v23 = [(PGTitleGenerator *)v14 initWithMomentNodes:v13 referenceDateInterval:v11 keyAsset:v12 curatedAssetCollection:0 assetCollection:v15 type:self->_dateMatchingType titleGenerationContext:v10];

  v16 = [(PGTitleGenerator *)v23 title];
  v17 = [v16 stringValue];
  title = self->_title;
  self->_title = v17;

  v19 = [(PGTitleGenerator *)v23 subtitle];
  v20 = [v19 stringValue];
  subtitle = self->_subtitle;
  self->_subtitle = v20;

  v22 = [(PGTitleGenerator *)v23 title];
  self->_titleCategory = [v22 category];
}

- (void)_generateTitleWithHighlightNode:(id)a3 referenceDateInterval:(id)a4 titleGenerationContext:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  highlight = self->_highlight;
  if (highlight && self->_shouldGenerateTitle)
  {
    uint64_t v11 = [(PHPhotosHighlight *)highlight titleCategory];
    int64_t v12 = 6;
    if (v11) {
      int64_t v12 = v11;
    }
    self->_titleCategory = v12;
    if (MEMORY[0x1D25FE3D0]([(PHPhotosHighlight *)self->_highlight type]))
    {
      id v13 = [[PGTripMemoryTitleGenerator alloc] initWithHighlightNode:v25 titleGenerationContext:v9];
      v14 = [(PGTitleGenerator *)v13 title];
      v15 = [v14 stringValue];

      v16 = [(PGTitleGenerator *)v13 subtitle];
      v17 = [v16 stringValue];
    }
    else if (self->_dateMatchingType)
    {
      id v13 = [[PGTitleGeneratorDateMatching alloc] initWithType:self->_dateMatchingType referenceDateInterval:v8 highlightNode:v25 titleGenerationContext:v9];
      v16 = [(PGTitleGenerator *)v13 title];
      v15 = [v16 stringValue];
      v17 = 0;
    }
    else
    {
      id v13 = [[PGCollectionTitleGenerator alloc] initWithCollection:v25 titleGenerationContext:v9];
      v16 = [(PGTripMemoryTitleGenerator *)v13 titleTuple];
      v18 = [v16 title];
      v15 = [v18 stringValue];

      v19 = [v16 subtitle];
      v17 = [v19 stringValue];

      v20 = [v16 title];
      self->_titleCategory = [v20 category];
    }
    if (v15)
    {
      v21 = v15;
    }
    else
    {
      v21 = [(PHPhotosHighlight *)self->_highlight localizedSubtitle];
    }
    title = self->_title;
    self->_title = v21;

    if (v17)
    {
      v23 = v17;
    }
    else
    {
      v23 = [(PHPhotosHighlight *)self->_highlight localizedTitle];
    }
    subtitle = self->_subtitle;
    self->_subtitle = v23;
  }
}

- (PGRelated)initWithMemory:(id)a3 needsDebugInfo:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PGRelated;
  id v8 = [(PGRelated *)&v25 init];
  id v9 = (PGRelated *)v8;
  if (v8)
  {
    *((_WORD *)v8 + 4) = 256;
    *(_OWORD *)(v8 + 104) = xmmword_1D1F4F130;
    uint64_t v10 = [v7 titleCategory];
    uint64_t v11 = 6;
    if (v10) {
      uint64_t v11 = v10;
    }
    v9->_titleCategory = v11;
    objc_storeStrong((id *)&v9->_memory, a3);
    keywords = v9->_keywords;
    v9->_keywords = (NSDictionary *)MEMORY[0x1E4F1CC08];

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v9->_score = _Q0;
    uint64_t v18 = [v7 startDate];
    localStartDate = v9->_localStartDate;
    v9->_localStartDate = (NSDate *)v18;

    uint64_t v20 = [v7 endDate];
    localEndDate = v9->_localEndDate;
    v9->_localEndDate = (NSDate *)v20;

    if (v4)
    {
      uint64_t v22 = [(PGRelated *)v9 description];
      debugDescription = v9->_debugDescription;
      v9->_debugDescription = (NSString *)v22;
    }
    [(PGRelated *)v9 setGraphSchemaVersion:617];
    [(PGRelated *)v9 setRelatedAlgorithmsVersion:4];
  }

  return v9;
}

- (PGRelated)initWithHighlight:(id)a3 needsDebugInfo:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PGRelated;
  id v8 = [(PGRelated *)&v25 init];
  id v9 = (PGRelated *)v8;
  if (v8)
  {
    *((_WORD *)v8 + 4) = 256;
    *(_OWORD *)(v8 + 104) = xmmword_1D1F4F130;
    uint64_t v10 = [v7 titleCategory];
    uint64_t v11 = 6;
    if (v10) {
      uint64_t v11 = v10;
    }
    v9->_titleCategory = v11;
    objc_storeStrong((id *)&v9->_highlight, a3);
    keywords = v9->_keywords;
    v9->_keywords = (NSDictionary *)MEMORY[0x1E4F1CC08];

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v9->_score = _Q0;
    uint64_t v18 = [v7 localStartDate];
    localStartDate = v9->_localStartDate;
    v9->_localStartDate = (NSDate *)v18;

    uint64_t v20 = [v7 localEndDate];
    localEndDate = v9->_localEndDate;
    v9->_localEndDate = (NSDate *)v20;

    if (v4)
    {
      uint64_t v22 = [(PGRelated *)v9 description];
      debugDescription = v9->_debugDescription;
      v9->_debugDescription = (NSString *)v22;
    }
    [(PGRelated *)v9 setGraphSchemaVersion:617];
    [(PGRelated *)v9 setRelatedAlgorithmsVersion:4];
  }

  return v9;
}

- (PGRelated)initWithMoment:(id)a3 needsDebugInfo:(BOOL)a4
{
  BOOL v4 = a4;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PGRelated;
  id v7 = [(PGRelated *)&v24 init];
  id v8 = (PGRelated *)v7;
  if (v7)
  {
    *((_WORD *)v7 + 4) = 257;
    *(_OWORD *)(v7 + 104) = xmmword_1D1F4F130;
    *((void *)v7 + 10) = 0;
    v25[0] = v6;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    moments = v8->_moments;
    v8->_moments = (NSArray *)v9;

    keywords = v8->_keywords;
    v8->_keywords = (NSDictionary *)MEMORY[0x1E4F1CC08];

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v8->_score = _Q0;
    uint64_t v17 = [v6 localStartDate];
    localStartDate = v8->_localStartDate;
    v8->_localStartDate = (NSDate *)v17;

    uint64_t v19 = [v6 localEndDate];
    localEndDate = v8->_localEndDate;
    v8->_localEndDate = (NSDate *)v19;

    if (v4)
    {
      uint64_t v21 = [(PGRelated *)v8 description];
      debugDescription = v8->_debugDescription;
      v8->_debugDescription = (NSString *)v21;
    }
    [(PGRelated *)v8 setGraphSchemaVersion:617];
    [(PGRelated *)v8 setRelatedAlgorithmsVersion:4];
  }

  return v8;
}

- (PGRelated)initWithGraphMatchingResult:(id)a3 moments:(id)a4 tripMemoryTitleType:(unint64_t)a5 tripMomentNodes:(id)a6 titleGenerationContext:(id)a7 needsDebugInfo:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a6;
  id v15 = a7;
  v16 = [(PGRelated *)self _initWithGraphMatchingResult:a3 highlight:0 moments:a4 needsDebugInfo:v8];
  uint64_t v17 = v16;
  if (v16)
  {
    v16->_shouldGenerateTitle = 0;
    v16->_memoryTripTitleType = a5;
    uint64_t v18 = [[PGTripMemoryTitleGenerator alloc] initWithMomentNodes:v14 type:a5 titleGenerationContext:v15];
    uint64_t v19 = [(PGTitleGenerator *)v18 title];
    uint64_t v20 = [v19 stringValue];
    title = v17->_title;
    v17->_title = (NSString *)v20;

    uint64_t v22 = [(PGTitleGenerator *)v18 subtitle];
    uint64_t v23 = [v22 stringValue];
    subtitle = v17->_subtitle;
    v17->_subtitle = (NSString *)v23;

    objc_super v25 = [(PGTitleGenerator *)v18 title];
    v17->_titleCategory = [v25 category];
  }
  return v17;
}

- (PGRelated)initWithGraphMatchingResult:(id)a3 moment:(id)a4 needsDebugInfo:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v9)
  {
    id v20 = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    int64_t v12 = [(PGRelated *)self _initWithGraphMatchingResult:v8 highlight:0 moments:v11 needsDebugInfo:v5];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
    int64_t v12 = [(PGRelated *)self _initWithGraphMatchingResult:v8 highlight:0 moments:MEMORY[0x1E4F1CBF0] needsDebugInfo:v5];
    if (!v12) {
      goto LABEL_12;
    }
  }
  id v13 = [v8 contextItemForRelatedType:2];
  unint64_t v14 = [v13 criteria];
  unint64_t v15 = v14;
  if (v14 < 0xC && ((0xFFDu >> v14) & 1) != 0)
  {
    int64_t v18 = qword_1D1F4F3F0[v14];
  }
  else
  {
    v16 = +[PGLogging sharedLogging];
    uint64_t v17 = [v16 loggingConnection];

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v22 = v15;
      _os_log_error_impl(&dword_1D1805000, v17, OS_LOG_TYPE_ERROR, "Unsupported asset collection type for asset collection: %@", buf, 0xCu);
    }

    int64_t v18 = 0;
  }
  v12->_dateMatchingType = v18;

LABEL_12:
  return v12;
}

- (PGRelated)initWithGraphMatchingResult:(id)a3 highlight:(id)a4 needsDebugInfo:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(PGRelated *)self _initWithGraphMatchingResult:v8 highlight:a4 moments:0 needsDebugInfo:v5];
  uint64_t v10 = (PGRelated *)v9;
  if (!v9) {
    goto LABEL_15;
  }
  if ([v9[3] type] == 1
    || [(PHPhotosHighlight *)v10->_highlight type] == 4)
  {
    uint64_t v11 = 0;
LABEL_5:
    v10->_memoryTripTitleType = v11;
    goto LABEL_6;
  }
  if ([(PHPhotosHighlight *)v10->_highlight type] == 2)
  {
    uint64_t v11 = 1;
    goto LABEL_5;
  }
LABEL_6:
  int64_t v12 = [v8 contextItemForRelatedType:2];
  unint64_t v13 = [v12 criteria];
  unint64_t v14 = v13;
  if (v13 < 0xC && ((0xFFDu >> v13) & 1) != 0)
  {
    int64_t v17 = qword_1D1F4F3F0[v13];
  }
  else
  {
    unint64_t v15 = +[PGLogging sharedLogging];
    v16 = [v15 loggingConnection];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 134217984;
      unint64_t v20 = v14;
      _os_log_error_impl(&dword_1D1805000, v16, OS_LOG_TYPE_ERROR, "Unsupported asset collection type for asset collection: %@", (uint8_t *)&v19, 0xCu);
    }

    int64_t v17 = 0;
  }
  v10->_dateMatchingType = v17;

LABEL_15:
  return v10;
}

- (PGRelated)initWithGraphMatchingResult:(id)a3 assetCollection:(id)a4 needsDebugInfo:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 assetCollectionType] == 3)
  {
    uint64_t v10 = [(PGRelated *)self initWithGraphMatchingResult:v8 moment:v9 needsDebugInfo:v5];
LABEL_7:
    self = v10;
    uint64_t v11 = self;
    goto LABEL_8;
  }
  if ([v9 assetCollectionType] == 6)
  {
    uint64_t v10 = [(PGRelated *)self initWithGraphMatchingResult:v8 highlight:v9 needsDebugInfo:v5];
    goto LABEL_7;
  }
  if ([v9 assetCollectionType] == 4)
  {
    uint64_t v10 = [(PGRelated *)self initWithGraphMatchingResult:v8 memory:v9 needsDebugInfo:v5];
    goto LABEL_7;
  }
  unint64_t v13 = +[PGLogging sharedLogging];
  unint64_t v14 = [v13 loggingConnection];

  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138412290;
    id v16 = v9;
    _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "Unsupported asset collection type for asset collection: %@", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v11 = 0;
LABEL_8:

  return v11;
}

- (PGRelated)initWithGraphMatchingResult:(id)a3 memory:(id)a4 needsDebugInfo:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PGRelated;
  uint64_t v10 = [(PGRelated *)&v25 init];
  uint64_t v11 = (PGRelated *)v10;
  if (v10)
  {
    *(_OWORD *)(v10 + 104) = xmmword_1D1F4F130;
    objc_storeStrong((id *)v10 + 16, a4);
    uint64_t v12 = [v8 keywords];
    keywords = v11->_keywords;
    v11->_keywords = (NSDictionary *)v12;

    [v8 score];
    v11->_score = v14;
    [v8 score];
    v11->_matchingScore = v15;
    uint64_t v16 = [v8 localStartDate];
    localStartDate = v11->_localStartDate;
    v11->_localStartDate = (NSDate *)v16;

    uint64_t v18 = [v8 localEndDate];
    localEndDate = v11->_localEndDate;
    v11->_localEndDate = (NSDate *)v18;

    uint64_t v20 = [v8 event];
    eventNode = v11->_eventNode;
    v11->_eventNode = (PGGraphRelatableEvent *)v20;

    if (v5)
    {
      uint64_t v22 = [v8 debugDescription];
      debugDescription = v11->_debugDescription;
      v11->_debugDescription = (NSString *)v22;
    }
    [(PGRelated *)v11 setGraphSchemaVersion:617];
    [(PGRelated *)v11 setRelatedAlgorithmsVersion:4];
  }

  return v11;
}

- (id)_initWithGraphMatchingResult:(id)a3 highlight:(id)a4 moments:(id)a5 needsDebugInfo:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PGRelated;
  unint64_t v13 = [(PGRelated *)&v28 init];
  double v14 = (id *)v13;
  if (v13)
  {
    v13[9] = 1;
    v13[8] = v11 == 0;
    *(_OWORD *)(v13 + 104) = xmmword_1D1F4F130;
    objc_storeStrong((id *)v13 + 3, a4);
    objc_storeStrong(v14 + 4, a5);
    uint64_t v15 = [v10 keywords];
    id v16 = v14[5];
    v14[5] = (id)v15;

    [v10 score];
    v14[6] = v17;
    [v10 score];
    v14[7] = v18;
    uint64_t v19 = [v10 localStartDate];
    id v20 = v14[11];
    v14[11] = (id)v19;

    uint64_t v21 = [v10 localEndDate];
    id v22 = v14[12];
    v14[12] = (id)v21;

    uint64_t v23 = [v10 event];
    id v24 = v14[15];
    v14[15] = (id)v23;

    if (v6)
    {
      uint64_t v25 = [v10 debugDescription];
      id v26 = v14[2];
      v14[2] = (id)v25;
    }
    [v14 setGraphSchemaVersion:617];
    [v14 setRelatedAlgorithmsVersion:4];
  }

  return v14;
}

@end