@interface PhotosFeatureHittingSet
- (NSMutableArray)matchedFeaturesAll;
- (NSMutableArray)matchedPhotoAttributes;
- (NSMutableArray)matchedTokenAttributes;
- (NSMutableSet)hittingSet;
- (PhotosFeatureHittingSet)initWithPhoto:(id)a3 query:(id)a4 matchInfo:(id)a5 keyboardLanguage:(id)a6;
- (void)computeHitingSet;
- (void)selectBestPhotoAttribute:(id)a3 photoAttributeFrequency:(float *)a4 attributeTokenMatchPercentage:(float *)a5 matchedFeatures:(id)a6;
- (void)setHittingSet:(id)a3;
- (void)setMatchedFeaturesAll:(id)a3;
- (void)setMatchedPhotoAttributes:(id)a3;
- (void)setMatchedTokenAttributes:(id)a3;
- (void)setupMatchFeaturesPhoto:(id)a3 query:(id)a4 matchInfo:(id)a5 keyboardLanguage:(id)a6;
- (void)setupMatchedPhotoAttributes:(id)a3 uniqueMatchedFeatureIndexes:(id)a4 tokenMatchType:(unint64_t)a5 confidences:(id)a6 boundingBoxes:(id)a7 sceneSynonymsCount:(id)a8 keyboardLanguage:(id)a9;
@end

@implementation PhotosFeatureHittingSet

- (PhotosFeatureHittingSet)initWithPhoto:(id)a3 query:(id)a4 matchInfo:(id)a5 keyboardLanguage:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PhotosFeatureHittingSet;
  v14 = [(PhotosFeatureHittingSet *)&v20 init];
  if (v14)
  {
    v15 = objc_opt_new();
    [(PhotosFeatureHittingSet *)v14 setMatchedTokenAttributes:v15];

    v16 = objc_opt_new();
    [(PhotosFeatureHittingSet *)v14 setMatchedPhotoAttributes:v16];

    v17 = objc_opt_new();
    [(PhotosFeatureHittingSet *)v14 setMatchedFeaturesAll:v17];

    v18 = objc_opt_new();
    [(PhotosFeatureHittingSet *)v14 setHittingSet:v18];

    [(PhotosFeatureHittingSet *)v14 setupMatchFeaturesPhoto:v10 query:v11 matchInfo:v12 keyboardLanguage:v13];
  }

  return v14;
}

- (void)setupMatchFeaturesPhoto:(id)a3 query:(id)a4 matchInfo:(id)a5 keyboardLanguage:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  v14 = objc_opt_new();
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __84__PhotosFeatureHittingSet_setupMatchFeaturesPhoto_query_matchInfo_keyboardLanguage___block_invoke;
  v40[3] = &unk_1E634D2D0;
  id v36 = v14;
  id v41 = v36;
  id v15 = v11;
  id v42 = v15;
  v43 = self;
  [v13 enumerateKeysAndObjectsUsingBlock:v40];

  uint64_t v16 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0xB8uLL);
  if (v16)
  {
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v16];
    v18 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0x80uLL);
    [(PhotosFeatureHittingSet *)self setupMatchedPhotoAttributes:v18 uniqueMatchedFeatureIndexes:v17 tokenMatchType:0 confidences:0 boundingBoxes:0 sceneSynonymsCount:0 keyboardLanguage:v12];
  }
  uint64_t v19 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0xC7uLL);
  if (v19)
  {
    objc_super v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v19];
    v21 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0x8AuLL);
    [(PhotosFeatureHittingSet *)self setupMatchedPhotoAttributes:v21 uniqueMatchedFeatureIndexes:v20 tokenMatchType:3 confidences:0 boundingBoxes:0 sceneSynonymsCount:0 keyboardLanguage:v12];
  }
  v22 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0xB9uLL);
  v37 = (void *)v19;
  v38 = (void *)v16;
  if (v22)
  {
    v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v22];
    v24 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0x81uLL);
    v25 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0x84uLL);
    v26 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0xB6uLL);
    [(PhotosFeatureHittingSet *)self setupMatchedPhotoAttributes:v24 uniqueMatchedFeatureIndexes:v23 tokenMatchType:1 confidences:v25 boundingBoxes:v26 sceneSynonymsCount:0 keyboardLanguage:v12];
  }
  else
  {
    v25 = 0;
    v26 = 0;
  }
  v27 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0xBAuLL);
  if (v27)
  {
    id v34 = v15;
    id v35 = v12;
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v27];
    v29 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0x85uLL);
    v30 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0xB7uLL);
    if (v25)
    {
      uint64_t v31 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0x84uLL);

      v25 = (void *)v31;
    }
    if (v26)
    {
      uint64_t v32 = SSCompactRankingAttrsGetValue((int8x8_t *)[v10 attributes], 0xB6uLL);

      v26 = (void *)v32;
    }
    id v12 = v35;
    [(PhotosFeatureHittingSet *)self setupMatchedPhotoAttributes:v29 uniqueMatchedFeatureIndexes:v28 tokenMatchType:2 confidences:v25 boundingBoxes:v26 sceneSynonymsCount:v30 keyboardLanguage:v35];

    id v15 = v34;
  }
  v33 = [(PhotosFeatureHittingSet *)self matchedTokenAttributes];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __84__PhotosFeatureHittingSet_setupMatchFeaturesPhoto_query_matchInfo_keyboardLanguage___block_invoke_2;
  v39[3] = &unk_1E634D2F8;
  v39[4] = self;
  [v33 enumerateObjectsUsingBlock:v39];
}

void __84__PhotosFeatureHittingSet_setupMatchFeaturesPhoto_query_matchInfo_keyboardLanguage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v29 = a2;
  id v5 = a3;
  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [v5 objectAtIndexedSubscript:v6];
      id v8 = (id)[v7 tokenize];
      uint64_t v9 = ConvertMatchedKeyToType_onceToken;
      id v10 = v29;
      if (v9 != -1) {
        dispatch_once(&ConvertMatchedKeyToType_onceToken, &__block_literal_global_458);
      }
      id v11 = [(id)ConvertMatchedKeyToType_matchedKeyTypeDict objectForKey:v10];

      if (v11) {
        id v12 = v11;
      }
      else {
        id v12 = &unk_1F1861A18;
      }
      id v13 = v12;

      v14 = *(void **)(a1 + 32);
      id v15 = [v7 original];
      uint64_t v16 = [v14 objectForKeyedSubscript:v15];

      if (v16)
      {
        v17 = [*(id *)(a1 + 48) matchedTokenAttributes];
        v18 = *(void **)(a1 + 32);
        uint64_t v19 = [v7 original];
        objc_super v20 = [v18 objectForKeyedSubscript:v19];
        objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v20, "unsignedIntegerValue"));
        id v21 = (id)objc_claimAutoreleasedReturnValue();

        v22 = [v21 matchedTypes];
        v23 = (void *)[v22 mutableCopy];

        [v23 addObject:v13];
        [v21 setMatchedTypes:v23];
      }
      else
      {
        id v21 = [[MatchedTokenAttribute alloc] initMatchedToken:v7 query:*(void *)(a1 + 40) matchedType:v13];

        v24 = [*(id *)(a1 + 48) matchedTokenAttributes];
        [v24 addObject:v21];

        v25 = *(void **)(a1 + 32);
        v26 = (void *)MEMORY[0x1E4F28ED0];
        v23 = [*(id *)(a1 + 48) matchedTokenAttributes];
        v27 = objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v23, "count") - 1);
        v28 = [v7 original];
        [v25 setValue:v27 forKey:v28];
      }
      ++v6;
    }
    while (v6 < [v5 count]);
  }
}

void __84__PhotosFeatureHittingSet_setupMatchFeaturesPhoto_query_matchInfo_keyboardLanguage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v31 = a3;
  id v4 = a2;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v32 = v4;
  unint64_t v6 = [v4 matchedTypes];
  v7 = [v5 setWithArray:v6];

  id v8 = [*(id *)(a1 + 32) matchedPhotoAttributes];
  int v9 = [v8 count];

  if (v9 >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      id v11 = objc_msgSend(*(id *)(a1 + 32), "matchedPhotoAttributes", v31);
      id v12 = [v11 objectAtIndexedSubscript:v10];

      id v13 = (void *)MEMORY[0x1E4F1CAD0];
      v14 = [v12 types];
      id v15 = [v13 setWithArray:v14];

      uint64_t v16 = (void *)[v15 mutableCopy];
      [v16 intersectSet:v7];
      if ([v16 count])
      {
        v17 = [v12 feature];
        v18 = [v32 token];
        uint64_t v19 = [v17 tokenMatchForMatchInfoToken:v18];

        if ([v19 type])
        {
          double v20 = (double)(unint64_t)[v32 tokenNum];
          double v21 = v20 / (double)(unint64_t)[v12 tokenNum];
          double v22 = (double)(unint64_t)[v32 tokenLength];
          double v23 = v22 / (double)(unint64_t)[v12 tokenLength];
          v24 = [MatchedFeatures alloc];
          v25 = [v19 indexes];
          v26 = [v16 allObjects];
          id v27 = [(MatchedFeatures *)v24 initMatchedFeaturesTokenIndex:v31 photoFeatureIndex:v10 matchedPositions:v25 tokenMatchRatio:v26 characterMatchRatio:v21 matchedTypes:v23];

          v28 = [*(id *)(a1 + 32) matchedFeaturesAll];
          [v28 addObject:v27];
        }
      }

      ++v10;
      id v29 = [*(id *)(a1 + 32) matchedPhotoAttributes];
      int v30 = [v29 count];
    }
    while (v10 < v30);
  }
}

- (void)setupMatchedPhotoAttributes:(id)a3 uniqueMatchedFeatureIndexes:(id)a4 tokenMatchType:(unint64_t)a5 confidences:(id)a6 boundingBoxes:(id)a7 sceneSynonymsCount:(id)a8 keyboardLanguage:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  double v20 = objc_opt_new();
  if (a5 == 2)
  {
    double v21 = [v15 array];
    [v21 sortedArrayUsingComparator:&__block_literal_global_37];
    id v33 = v14;
    id v22 = v15;
    v24 = id v23 = v18;

    v25 = objc_opt_new();
    v26 = [v25 convertToLabelIndexWithSynonymCount:v23 synonymsIndex:v24];

    id v18 = v23;
    id v15 = v22;
    id v14 = v33;
  }
  else
  {
    v26 = 0;
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __160__PhotosFeatureHittingSet_setupMatchedPhotoAttributes_uniqueMatchedFeatureIndexes_tokenMatchType_confidences_boundingBoxes_sceneSynonymsCount_keyboardLanguage___block_invoke_2;
  v35[3] = &unk_1E634D320;
  id v36 = v14;
  id v37 = v19;
  id v38 = v20;
  id v39 = v26;
  id v40 = v16;
  id v41 = v17;
  id v42 = self;
  unint64_t v43 = a5;
  id v27 = v17;
  id v28 = v16;
  id v29 = v26;
  id v30 = v20;
  id v31 = v19;
  id v32 = v14;
  [v15 enumerateObjectsUsingBlock:v35];
}

uint64_t __160__PhotosFeatureHittingSet_setupMatchedPhotoAttributes_uniqueMatchedFeatureIndexes_tokenMatchType_confidences_boundingBoxes_sceneSynonymsCount_keyboardLanguage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __160__PhotosFeatureHittingSet_setupMatchedPhotoAttributes_uniqueMatchedFeatureIndexes_tokenMatchType_confidences_boundingBoxes_sceneSynonymsCount_keyboardLanguage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v42 = a2;
  id v5 = [SSTokenizedString alloc];
  unint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v42, "unsignedLongValue"));
  v7 = [v6 lowercaseString];
  id v8 = [(SSTokenizedString *)v5 initWithString:v7 locale:*(void *)(a1 + 40)];

  int v9 = *(void **)(a1 + 48);
  uint64_t v10 = [(SSTokenizedString *)v8 original];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (!v11)
  {
    id v26 = [(SSTokenizedString *)v8 tokenize];
    if (*(void *)(a1 + 88) == 2)
    {
      uint64_t v27 = [*(id *)(a1 + 56) objectAtIndexedSubscript:a3];

      id v28 = (void *)v27;
    }
    else
    {
      id v28 = v42;
    }
    id v42 = v28;
    unint64_t v29 = [v28 unsignedIntegerValue];
    id v30 = *(void **)(a1 + 64);
    if (v30 && [v30 count] > v29)
    {
      id v16 = [*(id *)(a1 + 64) objectAtIndexedSubscript:v29];
    }
    else
    {
      id v16 = 0;
    }
    id v31 = *(void **)(a1 + 72);
    if (v31 && [v31 count] > v29)
    {
      v25 = [*(id *)(a1 + 72) objectAtIndexedSubscript:v29];
    }
    else
    {
      v25 = 0;
    }
    id v32 = [MatchedPhotoAttribute alloc];
    uint64_t v33 = *(void *)(a1 + 88);
    id v34 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    [v16 doubleValue];
    id v35 = -[MatchedPhotoAttribute initPhotoFeature:matchedType:totalFeaturesNum:confidence:boundingBox:](v32, "initPhotoFeature:matchedType:totalFeaturesNum:confidence:boundingBox:", v8, v33, v34, v25);

    id v36 = [*(id *)(a1 + 80) matchedPhotoAttributes];
    [v36 addObject:v35];

    id v37 = *(void **)(a1 + 48);
    id v38 = (void *)MEMORY[0x1E4F28ED0];
    id v39 = [*(id *)(a1 + 80) matchedPhotoAttributes];
    id v40 = objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "count") - 1);
    id v41 = [(SSTokenizedString *)v8 original];
    [v37 setValue:v40 forKey:v41];

    goto LABEL_20;
  }
  id v12 = [*(id *)(a1 + 80) matchedPhotoAttributes];
  id v13 = *(void **)(a1 + 48);
  id v14 = [(SSTokenizedString *)v8 original];
  id v15 = [v13 objectForKeyedSubscript:v14];
  id v16 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v15, "unsignedIntegerValue"));

  id v17 = [v16 types];
  id v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(a1 + 88)];
  [v17 addObject:v18];

  id v19 = [v16 totalFeaturesNum];
  double v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  [v19 addObject:v20];

  unint64_t v21 = [v42 unsignedIntegerValue];
  id v22 = *(void **)(a1 + 64);
  if (v22 && [v22 count] > v21)
  {
    id v23 = [*(id *)(a1 + 64) objectAtIndexedSubscript:v21];
    [v23 doubleValue];
    objc_msgSend(v16, "setConfidence:");
  }
  v24 = *(void **)(a1 + 72);
  if (v24 && [v24 count] > v21)
  {
    v25 = [*(id *)(a1 + 72) objectAtIndexedSubscript:v21];
    [v16 setBoundingBox:v25];
LABEL_20:
  }
}

- (void)selectBestPhotoAttribute:(id)a3 photoAttributeFrequency:(float *)a4 attributeTokenMatchPercentage:(float *)a5 matchedFeatures:(id)a6
{
  id v16 = a3;
  id v9 = a6;
  float v10 = a4[[v9 photoFeatureIndex]];
  float v11 = a5[[v9 photoFeatureIndex]];
  [v16 maxAttributeFreq];
  if (v10 > *(float *)&v12)
  {
    *(float *)&double v12 = v10;
    [v16 setMaxAttributeFreq:v12];
LABEL_5:
    objc_msgSend(v16, "setSelectedAttribute:", objc_msgSend(v9, "photoFeatureIndex"));
    *(float *)&double v15 = v11;
    [v16 setSelectedTokenPercentage:v15];
    goto LABEL_6;
  }
  [v16 maxAttributeFreq];
  if (v10 == v13)
  {
    [v16 selectedTokenPercentage];
    if (v11 > v14) {
      goto LABEL_5;
    }
  }
LABEL_6:
}

- (void)computeHitingSet
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  v3 = [(PhotosFeatureHittingSet *)self matchedTokenAttributes];
  uint64_t v4 = [v3 count];

  id v5 = [(PhotosFeatureHittingSet *)self matchedPhotoAttributes];
  uint64_t v6 = [v5 count];

  v7 = [(PhotosFeatureHittingSet *)self matchedFeaturesAll];
  uint64_t v8 = [v7 count];

  if (v4 && v6 && v8)
  {
    v72[1] = v72;
    id v9 = (char *)v72 - ((4 * v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v9, 4 * v4);
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    float v10 = [(PhotosFeatureHittingSet *)self matchedFeaturesAll];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v95 objects:v103 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v96;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v96 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v95 + 1) + 8 * i) tokenIndex];
          *(float *)&v9[4 * v15] = *(float *)&v9[4 * v15] + 1.0;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v95 objects:v103 count:16];
      }
      while (v12);
    }

    id v16 = (float *)((char *)v72 - ((4 * v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      if (*v16 > 1.0) {
        float *v16 = 1.0 / *v16;
      }
      ++v16;
      --v4;
    }
    while (v4);
    v78 = (float *)v72;
    bzero((char *)v72 - ((4 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 4 * v6);
    v77 = (char *)v72 - ((4 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v77, 4 * v6);
    id v17 = objc_opt_new();
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v74 = self;
    id v75 = [(PhotosFeatureHittingSet *)self matchedFeaturesAll];
    uint64_t v18 = [v75 countByEnumeratingWithState:&v91 objects:v102 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      v76 = *(SelectedPhotoAttribute **)v92;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(SelectedPhotoAttribute **)v92 != v76) {
            objc_enumerationMutation(v75);
          }
          unint64_t v21 = *(void **)(*((void *)&v91 + 1) + 8 * j);
          float v22 = *(float *)&v9[4 * [v21 tokenIndex]];
          uint64_t v23 = [v21 photoFeatureIndex];
          v78[v23] = v22 + v78[v23];
          [v21 tokenMatchRatio];
          double v25 = v24;
          [v21 characterMatchRatio];
          double v27 = v26;
          uint64_t v28 = [v21 photoFeatureIndex];
          float v29 = *(float *)&v77[4 * v28] + v25 * v27;
          *(float *)&v77[4 * v28] = v29;
          id v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v21, "photoFeatureIndex"));
          id v31 = [v17 objectForKey:v30];

          if (!v31)
          {
            id v32 = objc_opt_new();
            uint64_t v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v21, "photoFeatureIndex"));
            [v17 setObject:v32 forKeyedSubscript:v33];
          }
          id v34 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v21, "photoFeatureIndex"));
          id v35 = [v17 objectForKeyedSubscript:v34];
          id v36 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v21, "tokenIndex"));
          [v35 addObject:v36];
        }
        uint64_t v19 = [v75 countByEnumeratingWithState:&v91 objects:v102 count:16];
      }
      while (v19);
    }
    id v73 = v17;

    id v37 = v74;
    while (1)
    {
      id v38 = [[SelectedPhotoAttribute alloc] initWithZeros];
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      id v39 = [(PhotosFeatureHittingSet *)v37 matchedFeaturesAll];
      uint64_t v40 = [v39 countByEnumeratingWithState:&v87 objects:v101 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v88;
        do
        {
          for (uint64_t k = 0; k != v41; ++k)
          {
            if (*(void *)v88 != v42) {
              objc_enumerationMutation(v39);
            }
            v44 = *(void **)(*((void *)&v87 + 1) + 8 * k);
            if (*(float *)&v9[4 * [v44 tokenIndex]] > 0.0) {
              [(PhotosFeatureHittingSet *)v37 selectBestPhotoAttribute:v38 photoAttributeFrequency:v78 attributeTokenMatchPercentage:v77 matchedFeatures:v44];
            }
          }
          uint64_t v41 = [v39 countByEnumeratingWithState:&v87 objects:v101 count:16];
        }
        while (v41);
      }

      [(SelectedPhotoAttribute *)v38 maxAttributeFreq];
      if (v45 <= 0.0) {
        break;
      }
      v46 = [(PhotosFeatureHittingSet *)v37 hittingSet];
      v47 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SelectedPhotoAttribute selectedAttribute](v38, "selectedAttribute"));
      [v46 addObject:v47];

      v76 = v38;
      v48 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SelectedPhotoAttribute selectedAttribute](v38, "selectedAttribute"));
      v49 = [v73 objectForKeyedSubscript:v48];

      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      v50 = [(PhotosFeatureHittingSet *)v37 matchedFeaturesAll];
      uint64_t v51 = [v50 countByEnumeratingWithState:&v83 objects:v100 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v84;
        do
        {
          for (uint64_t m = 0; m != v52; ++m)
          {
            if (*(void *)v84 != v53) {
              objc_enumerationMutation(v50);
            }
            v55 = *(void **)(*((void *)&v83 + 1) + 8 * m);
            v56 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v55, "tokenIndex"));
            int v57 = [v49 containsObject:v56];

            if (v57)
            {
              float v58 = *(float *)&v9[4 * [v55 tokenIndex]];
              uint64_t v59 = [v55 photoFeatureIndex];
              v78[v59] = v78[v59] - v58;
              [v55 tokenMatchRatio];
              double v61 = v60;
              [v55 characterMatchRatio];
              double v63 = v62;
              uint64_t v64 = [v55 photoFeatureIndex];
              float v65 = *(float *)&v77[4 * v64] - v61 * v63;
              *(float *)&v77[4 * v64] = v65;
            }
          }
          uint64_t v52 = [v50 countByEnumeratingWithState:&v83 objects:v100 count:16];
        }
        while (v52);
      }

      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v66 = v49;
      uint64_t v67 = [v66 countByEnumeratingWithState:&v79 objects:v99 count:16];
      id v37 = v74;
      v68 = v76;
      if (v67)
      {
        uint64_t v69 = v67;
        uint64_t v70 = *(void *)v80;
        do
        {
          for (uint64_t n = 0; n != v69; ++n)
          {
            if (*(void *)v80 != v70) {
              objc_enumerationMutation(v66);
            }
            *(_DWORD *)&v9[4 * [*(id *)(*((void *)&v79 + 1) + 8 * n) unsignedIntValue]] = 0;
          }
          uint64_t v69 = [v66 countByEnumeratingWithState:&v79 objects:v99 count:16];
        }
        while (v69);
      }
    }
  }
}

- (NSMutableArray)matchedTokenAttributes
{
  return self->_matchedTokenAttributes;
}

- (void)setMatchedTokenAttributes:(id)a3
{
}

- (NSMutableArray)matchedPhotoAttributes
{
  return self->_matchedPhotoAttributes;
}

- (void)setMatchedPhotoAttributes:(id)a3
{
}

- (NSMutableArray)matchedFeaturesAll
{
  return self->_matchedFeaturesAll;
}

- (void)setMatchedFeaturesAll:(id)a3
{
}

- (NSMutableSet)hittingSet
{
  return self->_hittingSet;
}

- (void)setHittingSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hittingSet, 0);
  objc_storeStrong((id *)&self->_matchedFeaturesAll, 0);
  objc_storeStrong((id *)&self->_matchedPhotoAttributes, 0);
  objc_storeStrong((id *)&self->_matchedTokenAttributes, 0);
}

@end