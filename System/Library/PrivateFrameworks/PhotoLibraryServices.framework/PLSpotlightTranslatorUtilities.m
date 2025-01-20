@interface PLSpotlightTranslatorUtilities
+ (id)contentRatingFromScenes:(id)a3 algorithmVersion:(signed __int16)a4;
+ (id)seasonsForDate:(id)a3 calendar:(id)a4;
+ (id)spotlightAudioClassificationsFromScenes:(id)a3;
+ (id)spotlightPersonsFromPLPersons:(id)a3;
+ (id)spotlightScenesFromDetectionTraits:(id)a3;
+ (id)spotlightScenesFromScenes:(id)a3 sceneTaxonomy:(id)a4;
+ (id)textFromGraphData:(id)a3 searchIndexCategoryMask:(unint64_t)a4;
+ (id)textFromGraphData:(id)a3 searchIndexCategoryMask:(unint64_t)a4 synonymSearchIndexCategoryMask:(unint64_t)a5 synonyms:(id)a6;
+ (int64_t)CSSceneTypeForPLSceneClassificationType:(int64_t)a3;
+ (void)tagCSSearchableItem:(id)a3 entityInstanceIdentifier:(id)a4 typeIdentifier:(id)a5 typeDisplayName:(id)a6 displayTitle:(id)a7 displaySubtitle:(id)a8;
@end

@implementation PLSpotlightTranslatorUtilities

+ (void)tagCSSearchableItem:(id)a3 entityInstanceIdentifier:(id)a4 typeIdentifier:(id)a5 typeDisplayName:(id)a6 displayTitle:(id)a7 displaySubtitle:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v19 = (void *)getLNSpotlightAppEntityMapperClass_softClass;
  uint64_t v25 = getLNSpotlightAppEntityMapperClass_softClass;
  if (!getLNSpotlightAppEntityMapperClass_softClass)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __getLNSpotlightAppEntityMapperClass_block_invoke;
    v21[3] = &unk_1E5875840;
    v21[4] = &v22;
    __getLNSpotlightAppEntityMapperClass_block_invoke((uint64_t)v21);
    v19 = (void *)v23[3];
  }
  id v20 = v19;
  _Block_object_dispose(&v22, 8);
  [v20 tagCSSearchableItem:v13 entityInstanceIdentifier:v14 typeIdentifier:v15 displayTitle:v17 displaySubtitle:v18 displaySynonyms:0 typeDisplayName:v16 typeDisplaySynonyms:0 propertyDictionary:0 priority:&unk_1EEBEE4D8];
}

+ (int64_t)CSSceneTypeForPLSceneClassificationType:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return 4;
  }
  else {
    return qword_19BA9AD58[a3];
  }
}

+ (id)textFromGraphData:(id)a3 searchIndexCategoryMask:(unint64_t)a4 synonymSearchIndexCategoryMask:(unint64_t)a5 synonyms:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = v12;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PLSpotlightTranslatorUtilities.m", 184, @"Invalid parameter not satisfying: %@", @"graphData" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, a1, @"PLSpotlightTranslatorUtilities.m", 185, @"Invalid parameter not satisfying: %@", @"synonyms" object file lineNumber description];

LABEL_3:
  id v14 = objc_opt_new();
  id v15 = [NSNumber numberWithUnsignedLongLong:a4];
  id v16 = [v11 objectForKeyedSubscript:v15];

  [v14 addObjectsFromArray:v16];
  id v17 = [NSNumber numberWithUnsignedLongLong:a5];
  id v18 = [v13 objectForKeyedSubscript:v17];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = v16;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = [v18 objectForKeyedSubscript:*(void *)(*((void *)&v28 + 1) + 8 * i)];
        [v14 addObjectsFromArray:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v21);
  }

  return v14;
}

+ (id)textFromGraphData:(id)a3 searchIndexCategoryMask:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PLSpotlightTranslatorUtilities.m", 172, @"Invalid parameter not satisfying: %@", @"graphData" object file lineNumber description];
  }
  v8 = objc_opt_new();
  v9 = [NSNumber numberWithUnsignedLongLong:a4];
  v10 = [v7 objectForKeyedSubscript:v9];

  [v8 addObjectsFromArray:v10];
  return v8;
}

+ (id)seasonsForDate:(id)a3 calendar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (v7)
    {
LABEL_3:
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58__PLSpotlightTranslatorUtilities_seasonsForDate_calendar___block_invoke;
      v14[3] = &unk_1E586A7C0;
      id v15 = v9;
      id v10 = v9;
      PLSearchSeasonStringsForDate(v7, v8, v14);
      id v11 = (void *)[v10 copy];

      goto LABEL_6;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PLSpotlightTranslatorUtilities.m", 152, @"Invalid parameter not satisfying: %@", @"calendar" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_6:

  return v11;
}

void __58__PLSpotlightTranslatorUtilities_seasonsForDate_calendar___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a4;
  [v6 addObject:a3];
  id v8 = *(void **)(a1 + 32);
  id v9 = [v7 allObjects];

  [v8 addObjectsFromArray:v9];
}

+ (id)contentRatingFromScenes:(id)a3 algorithmVersion:(signed __int16)a4
{
  uint64_t v4 = PLSearchImageSensitivityForSceneClassifications(a3, a4);
  v5 = &unk_1EEBF26B0;
  if (v4 != 1) {
    v5 = 0;
  }
  if (v4 == 2) {
    return &unk_1EEBF26C0;
  }
  else {
    return v5;
  }
}

+ (id)spotlightScenesFromDetectionTraits:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PLSpotlightTranslatorUtilities_spotlightScenesFromDetectionTraits___block_invoke;
  v8[3] = &unk_1E586A770;
  id v9 = v4;
  id v5 = v4;
  PLSearchEnumerateSearchStringsForDetectionTraits(v3, v8);

  v6 = (void *)[v5 copy];
  return v6;
}

void __69__PLSpotlightTranslatorUtilities_spotlightScenesFromDetectionTraits___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = (objc_class *)MEMORY[0x1E4F23820];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 alloc];
  id v12 = [v8 allObjects];

  [v10 score];
  double v14 = v13;
  LODWORD(v8) = [v10 value];

  id v15 = (id)[v11 initWithLabel:v9 synonyms:v12 confidence:(int)v8 sceneIdentifier:v14];
  [v15 setSceneType:2];
  [*(id *)(a1 + 32) addObject:v15];
}

+ (id)spotlightAudioClassificationsFromScenes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PLSpotlightTranslatorUtilities_spotlightAudioClassificationsFromScenes___block_invoke;
  v7[3] = &unk_1E586A748;
  id v5 = v4;
  id v8 = v5;
  PLSearchEnumerateSearchStringsForAudioClassifications(v3, v7);

  return v5;
}

void __74__PLSpotlightTranslatorUtilities_spotlightAudioClassificationsFromScenes___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = (objc_class *)MEMORY[0x1E4F23820];
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id v11 = [v7 alloc];
  id v12 = [v8 allObjects];

  uint64_t v13 = [v10 sceneIdentifier];
  id v14 = (id)[v11 initWithLabel:v9 synonyms:v12 confidence:v13 sceneIdentifier:1.0];

  [v14 setSceneType:3];
  [*(id *)(a1 + 32) addObject:v14];
}

+ (id)spotlightScenesFromScenes:(id)a3 sceneTaxonomy:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  if ([v5 count])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PLSpotlightTranslatorUtilities_spotlightScenesFromScenes_sceneTaxonomy___block_invoke;
    v10[3] = &unk_1E586A7E8;
    id v11 = v7;
    [v6 enumerateKeywordAndSynonymsForScenes:v5 usingBlock:v10];
  }
  id v8 = (void *)[v7 copy];

  return v8;
}

void __74__PLSpotlightTranslatorUtilities_spotlightScenesFromScenes_sceneTaxonomy___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if ([v10 length])
  {
    id v12 = objc_alloc(MEMORY[0x1E4F23820]);
    uint64_t v13 = [v11 allObjects];
    [v9 confidence];
    id v14 = objc_msgSend(v12, "initWithLabel:synonyms:confidence:sceneIdentifier:", v10, v13, a5);

    [v14 setSceneType:1];
    CGSize v15 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    buf.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    buf.size = v15;
    if (objc_opt_respondsToSelector())
    {
      [v9 packedBoundingBoxRect];
      PLSplitToCGRectFromInt64();
    }
    else if (objc_opt_respondsToSelector())
    {
      [v9 boundingBox];
      buf.origin.x = v16;
      buf.origin.y = v17;
      buf.size.width = v18;
      buf.size.height = v19;
    }
    else
    {
      uint64_t v20 = PLSearchBackendModelTranslationGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138412290;
        id v23 = v9;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to get boundingBox. Unexpected scene object: %@", (uint8_t *)&v22, 0xCu);
      }
    }
    -[NSObject setBoundingBox:](v14, "setBoundingBox:", buf.origin.x, buf.origin.y, *(_OWORD *)&buf.size);
    if (!CGRectIsNull(buf))
    {
      CGFloat v21 = buf.size.width * buf.size.height;
      *(float *)&CGFloat v21 = buf.size.width * buf.size.height;
      [v14 setSceneArea:v21];
    }
    [*(id *)(a1 + 32) addObject:v14];
  }
  else
  {
    id v14 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.origin.x) = 134217984;
      *(void *)((char *)&buf.origin.x + 4) = [v9 sceneIdentifier];
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to get Keyword for sceneID: %llu", (uint8_t *)&buf, 0xCu);
    }
  }
}

+ (id)spotlightPersonsFromPLPersons:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    CGFloat v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLSpotlightTranslatorUtilities.m", 32, @"Invalid parameter not satisfying: %@", @"plPersons" object file lineNumber description];
  }
  if ([v5 count])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v20 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v12 shouldIndexForSearch])
          {
            uint64_t v13 = [v12 fullName];
            if ([v13 length])
            {
              id v14 = objc_alloc(MEMORY[0x1E4F23810]);
              CGSize v15 = [v12 fullName];
              CGFloat v16 = (void *)[v14 initWithDisplayName:v15 handles:MEMORY[0x1E4F1CBF0] handleIdentifier:&stru_1EEB2EB80];

              CGFloat v17 = [v12 personUri];
              [v16 setContactIdentifier:v17];

              [v6 addObject:v16];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }

    id v5 = v20;
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

@end