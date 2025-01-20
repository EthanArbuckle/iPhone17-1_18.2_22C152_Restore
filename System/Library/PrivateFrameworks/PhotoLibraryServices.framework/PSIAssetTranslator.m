@interface PSIAssetTranslator
+ (BOOL)_containsPersonWithSceneTaxonomyProvider:(id)a3 forAsset:(id)a4;
+ (id)_nameForContributor:(id)a3;
+ (id)psiAssetFromAsset:(id)a3 fetchHelper:(id)a4 propertySets:(unint64_t)a5 graphData:(id)a6 indexingContext:(id)a7 documentObservation:(id)a8;
+ (id)psiAssetFromAsset:(id)a3 graphData:(id)a4 indexingContext:(id)a5 documentObservation:(id)a6;
+ (void)_appendAssetTextDataToAsset:(id)a3 forAsset:(id)a4;
+ (void)_appendAudioClassificationToAsset:(id)a3 forAsset:(id)a4;
+ (void)_appendBusinessCategories:(id)a3 toAsset:(id)a4;
+ (void)_appendBusinessNames:(id)a3 toAsset:(id)a4;
+ (void)_appendContributorToAsset:(id)a3 forAsset:(id)a4;
+ (void)_appendDateCreatedToAsset:(id)a3 indexingContext:(id)a4 withSynonyms:(id)a5 forAsset:(id)a6;
+ (void)_appendExifDataToAsset:(id)a3 forAsset:(id)a4;
+ (void)_appendFavoriteToAsset:(id)a3 forAsset:(id)a4;
+ (void)_appendGEODataToAsset:(id)a3 forAsset:(id)a4;
+ (void)_appendGraphDataToAsset:(id)a3 forMomentFromFetchHelper:(id)a4;
+ (void)_appendHolidays:(id)a3 toAsset:(id)a4;
+ (void)_appendHomeToAsset:(id)a3;
+ (void)_appendHumanActionsToAsset:(id)a3 forAsset:(id)a4 fetchHelper:(id)a5;
+ (void)_appendKeywords:(id)a3 toAsset:(id)a4;
+ (void)_appendLibraryScopeToAsset:(id)a3 forAsset:(id)a4;
+ (void)_appendMeanings:(id)a3 withSynonyms:(id)a4 toAsset:(id)a5;
+ (void)_appendMediaTypesToAsset:(id)a3 forAsset:(id)a4;
+ (void)_appendOCRTextForAsset:(id)a3 documentObservation:(id)a4;
+ (void)_appendPerson:(id)a3 fetchHelper:(id)a4 toAsset:(id)a5 withPersonSynonyms:(id)a6;
+ (void)_appendPersonsAndPetsToAsset:(id)a3 withPersonSynonyms:(id)a4 forAsset:(id)a5 fetchHelper:(id)a6;
+ (void)_appendPet:(id)a3 fetchHelper:(id)a4 toAsset:(id)a5;
+ (void)_appendPrivateEncryptedComputeScenes:(id)a3 forAsset:(id)a4 fetchHelper:(id)a5 csuTaxonomyObjectStore:(id)a6 locale:(id)a7;
+ (void)_appendPublicEventCategories:(id)a3 withSynonyms:(id)a4 toAsset:(id)a5;
+ (void)_appendPublicEventStrings:(id)a3 toAsset:(id)a4 forSearchIndexCategory:(unint64_t)a5;
+ (void)_appendSavedFromAppToAsset:(id)a3 forAsset:(id)a4;
+ (void)_appendSceneClassificationsToAsset:(id)a3 sceneTaxonomyProvider:(id)a4 forAsset:(id)a5 fetchHelper:(id)a6;
+ (void)_appendSocialGroupIdentifiers:(id)a3 toAsset:(id)a4;
+ (void)_appendStickerSuggestionsToAsset:(id)a3 fetchHelper:(id)a4 sceneTaxonomyProvider:(id)a5 forAsset:(id)a6;
+ (void)_appendUtilityTypesToAsset:(id)a3 forAsset:(id)a4 indexingContext:(id)a5;
+ (void)_appendWorkText:(id)a3 toAsset:(id)a4;
@end

@implementation PSIAssetTranslator

+ (void)_appendWorkText:(id)a3 toAsset:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 length])
  {
    id v6 = v5;
    id v7 = v8;
    if ([v7 length]) {
      [v6 addContentString:v7 category:1001 owningCategory:0];
    }
  }
}

+ (void)_appendHomeToAsset:(id)a3
{
  id v3 = a3;
  v4 = PLMomentsLocalizedFrameworkString(@"MOMENT_HOME");
  id v5 = v3;
  if ([v4 length]) {
    [v5 addContentString:v4 category:1000 owningCategory:0];
  }
}

+ (void)_appendHolidays:(id)a3 toAsset:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = v6;
        id v13 = v11;
        if ([v13 length]) {
          [v12 addContentString:v13 category:1103 owningCategory:0];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

+ (void)_appendMeanings:(id)a3 withSynonyms:(id)a4 toAsset:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v22 = a4;
  id v8 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v7;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
        id v14 = v8;
        id v15 = v13;
        if ([v15 length]) {
          [v14 addContentString:v15 category:1600 owningCategory:0];
        }

        long long v16 = [v22 objectForKeyedSubscript:v15];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v24;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v24 != v19) {
                objc_enumerationMutation(v16);
              }
              [v14 addSynonym:*(void *)(*((void *)&v23 + 1) + 8 * v20++) category:1601 originalContentString:v15];
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v18);
        }

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }
}

+ (void)_appendPublicEventStrings:(id)a3 toAsset:(id)a4 forSearchIndexCategory:(unint64_t)a5
{
  __int16 v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    uint64_t v12 = v5;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        id v15 = v8;
        id v16 = v14;
        if ([v16 length]) {
          [v15 addContentString:v16 category:v12 owningCategory:0];
        }

        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
}

+ (void)_appendPublicEventCategories:(id)a3 withSynonyms:(id)a4 toAsset:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v22 = a4;
  id v8 = a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v7;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * v12);
        id v14 = v8;
        id v15 = v13;
        if ([v15 length]) {
          [v14 addContentString:v15 category:1802 owningCategory:0];
        }

        id v16 = [v22 objectForKeyedSubscript:v15];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v24;
          do
          {
            uint64_t v20 = 0;
            do
            {
              if (*(void *)v24 != v19) {
                objc_enumerationMutation(v16);
              }
              [v14 addSynonym:*(void *)(*((void *)&v23 + 1) + 8 * v20++) category:1803 originalContentString:v15];
            }
            while (v18 != v20);
            uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v18);
        }

        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }
}

+ (void)_appendBusinessCategories:(id)a3 toAsset:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = v6;
        id v13 = v11;
        if ([v13 length]) {
          [v12 addContentString:v13 category:1701 owningCategory:0];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

+ (void)_appendBusinessNames:(id)a3 toAsset:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = v6;
        id v13 = v11;
        if ([v13 length]) {
          [v12 addContentString:v13 category:1700 owningCategory:0];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

+ (void)_appendSocialGroupIdentifiers:(id)a3 toAsset:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = PLSearchSocialGroupLookupIdentifier(*(void **)(*((void *)&v13 + 1) + 8 * v10));
        id v12 = v6;
        if ([v11 length]) {
          [v12 addIdentifier:v11 category:1310 owningCategory:0];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

+ (void)_appendOCRTextForAsset:(id)a3 documentObservation:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = PLSearchIndexGetLog();
    os_signpost_id_t v8 = os_signpost_id_generate(v7);
    uint64_t v9 = v7;
    uint64_t v10 = v9;
    unint64_t v32 = v8 - 1;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PSIAssetTranslator: OCR", "", buf, 2u);
    }
    os_signpost_id_t spid = v8;
    v31 = v10;

    id v33 = v6;
    +[PLSearchOCRUtilities ocrTextLinesFromDocumentObservation:v6];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v48;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v48 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = v11;
          id v12 = *(void **)(*((void *)&v47 + 1) + 8 * v11);
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v38 = [v12 candidates];
          uint64_t v13 = [v38 countByEnumeratingWithState:&v43 objects:v53 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v44;
            do
            {
              uint64_t v16 = 0;
              do
              {
                if (*(void *)v44 != v15) {
                  objc_enumerationMutation(v38);
                }
                long long v17 = *(void **)(*((void *)&v43 + 1) + 8 * v16);
                long long v39 = 0u;
                long long v40 = 0u;
                long long v41 = 0u;
                long long v42 = 0u;
                uint64_t v18 = [v17 words];
                uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v52 count:16];
                if (v19)
                {
                  uint64_t v20 = v19;
                  uint64_t v21 = *(void *)v40;
                  do
                  {
                    uint64_t v22 = 0;
                    do
                    {
                      if (*(void *)v40 != v21) {
                        objc_enumerationMutation(v18);
                      }
                      long long v23 = *(void **)(*((void *)&v39 + 1) + 8 * v22);
                      id v24 = v5;
                      id v25 = v23;
                      if ([v25 length]) {
                        [v24 addContentString:v25 category:1203 owningCategory:0];
                      }

                      ++v22;
                    }
                    while (v20 != v22);
                    uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v52 count:16];
                  }
                  while (v20);
                }

                ++v16;
              }
              while (v16 != v14);
              uint64_t v14 = [v38 countByEnumeratingWithState:&v43 objects:v53 count:16];
            }
            while (v14);
          }

          uint64_t v11 = v37 + 1;
        }
        while (v37 + 1 != v36);
        uint64_t v36 = [obj countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v36);
    }
    id v6 = v33;
    if ([obj count])
    {
      long long v26 = PLServicesLocalizedFrameworkString();
      id v27 = v5;
      if ([v26 length]) {
        [v27 addContentString:v26 category:1205 owningCategory:0];
      }
    }
    long long v28 = v31;
    long long v29 = v28;
    if (v32 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v29, OS_SIGNPOST_INTERVAL_END, spid, "PSIAssetTranslator: OCR", "", buf, 2u);
    }
  }
}

+ (void)_appendAssetTextDataToAsset:(id)a3 forAsset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 additionalAttributes];
  os_signpost_id_t v8 = [v7 title];
  id v9 = v5;
  if ([v8 length]) {
    [v9 addContentString:v8 category:1201 owningCategory:0];
  }

  uint64_t v10 = [v6 longDescription];

  id v11 = v9;
  if ([v10 length]) {
    [v11 addContentString:v10 category:1202 owningCategory:0];
  }
}

+ (id)_nameForContributor:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 nameComponents];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v4 style:0 options:0];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Search Index: No name for contributor: %@", (uint8_t *)&v7, 0xCu);
    }
    id v5 = 0;
  }

  return v5;
}

+ (void)_appendContributorToAsset:(id)a3 forAsset:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v21 = a4;
  id obj = [v21 libraryScopeContributors];
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v5)
  {
    uint64_t v23 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v8 = [a1 _nameForContributor:v7];
        uint64_t v9 = [v7 emailAddress];
        uint64_t v10 = [v7 phoneNumber];
        id v11 = objc_opt_new();
        if ([v7 isCurrentUser])
        {
          id v12 = PLServicesSharedLibraryLocalizedFrameworkString();
          [v11 addObject:v12];
          uint64_t v13 = PLServicesSharedLibraryLocalizedFrameworkString();
          [v11 addObject:v13];
        }
        uint64_t v14 = PLServicesSharedLibraryLocalizedFrameworkString();
        if ([v8 length])
        {
          uint64_t v15 = PFStringWithValidatedFormat();
          objc_msgSend(v11, "addObject:", v15, v8);
        }
        if ([v9 length])
        {
          uint64_t v16 = PFStringWithValidatedFormat();
          objc_msgSend(v11, "addObject:", v16, v9);
        }
        if ([v10 length])
        {
          long long v17 = PFStringWithValidatedFormat();
          objc_msgSend(v11, "addObject:", v17, v10);
        }
        uint64_t v18 = [v7 uuid];
        uint64_t v19 = [NSString stringWithFormat:@"%@/%@", @"contributor", v18];

        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x3032000000;
        v30[3] = __Block_byref_object_copy__46870;
        v30[4] = __Block_byref_object_dispose__46871;
        id v31 = 0;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __57__PSIAssetTranslator__appendContributorToAsset_forAsset___block_invoke;
        v26[3] = &unk_1E586CB80;
        id v27 = v25;
        id v20 = v19;
        id v28 = v20;
        long long v29 = v30;
        [v11 enumerateObjectsUsingBlock:v26];

        _Block_object_dispose(v30, 8);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v5);
  }
}

void __57__PSIAssetTranslator__appendContributorToAsset_forAsset___block_invoke(void *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  int v7 = (void *)a1[4];
  uint64_t v8 = a1[5];
  id v9 = v6;
  if (a3)
  {
    [v7 addSynonym:v6 lookupIdentifier:v8 category:1321 originalContentString:*(void *)(*(void *)(a1[6] + 8) + 40)];
  }
  else
  {
    [v7 addContentString:v6 identifier:v8 category:1320 owningCategory:0];
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
}

+ (void)_appendLibraryScopeToAsset:(id)a3 forAsset:(id)a4
{
  id v11 = a3;
  if ([a4 hasLibraryScope])
  {
    uint64_t v5 = PLServicesSharedLibraryLocalizedFrameworkString();
    id v6 = v11;
    if (![v5 length]) {
      goto LABEL_7;
    }
    int v7 = v6;
    uint64_t v8 = v5;
    uint64_t v9 = 2400;
  }
  else
  {
    uint64_t v5 = PLServicesSharedLibraryLocalizedFrameworkString();
    id v10 = v11;
    if (![v5 length]) {
      goto LABEL_7;
    }
    int v7 = v10;
    uint64_t v8 = v5;
    uint64_t v9 = 2401;
  }
  [v7 addContentString:v8 category:v9 owningCategory:0];
LABEL_7:
}

+ (void)_appendExifDataToAsset:(id)a3 forAsset:(id)a4
{
  id v8 = a3;
  uint64_t v5 = [a4 formattedCameraModel];
  if ([v5 length])
  {
    id v6 = v8;
    id v7 = v5;
    if ([v7 length]) {
      [v6 addContentString:v7 category:2300 owningCategory:0];
    }
  }
}

+ (void)_appendPet:(id)a3 fetchHelper:(id)a4 toAsset:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 detectionType] == 3
    || [v7 detectionType] == 4
    || [v7 detectionType] == 2)
  {
    id v10 = [v7 personUUID];
    id v11 = [v7 fullName];
    id v12 = v10;
    id v13 = v9;
    id v14 = v11;
    id v15 = v12;
    if ([v14 length] || objc_msgSend(v15, "length")) {
      [v13 addContentString:v14 identifier:v15 category:1330 owningCategory:0];
    }

    uint64_t v16 = PLServicesLocalizedFrameworkString();
    id v17 = v15;
    [v13 addSynonym:v16 lookupIdentifier:v17 category:1331 originalContentString:v14];

    uint64_t v18 = PLServicesLocalizedFrameworkString();
    uint64_t v19 = v17;
    [v13 addSynonym:v18 lookupIdentifier:v19 category:1331 originalContentString:v14];

    if (_os_feature_enabled_impl())
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __53__PSIAssetTranslator__appendPet_fetchHelper_toAsset___block_invoke;
      v22[3] = &unk_1E586A890;
      id v23 = v13;
      id v24 = v19;
      id v25 = v14;
      [v8 enumerateSearchEntityRelationsForPerson:v7 block:v22];
    }
  }
  else
  {
    uint64_t v19 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v20 = [v7 detectionType];
      id v21 = [v7 personUUID];
      *(_DWORD *)buf = 67109378;
      int v27 = v20;
      __int16 v28 = 2112;
      long long v29 = v21;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Unexpected detection type (%hd) for pet: %@", buf, 0x12u);
    }
  }
}

void __53__PSIAssetTranslator__appendPet_fetchHelper_toAsset___block_invoke(id *a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PSIAssetTranslator__appendPet_fetchHelper_toAsset___block_invoke_2;
  v4[3] = &unk_1E586A868;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  PLSearchStringsForPersonRelation(a2, v4);
}

void __53__PSIAssetTranslator__appendPet_fetchHelper_toAsset___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v7 addSynonym:v5 lookupIdentifier:v8 category:1331 originalContentString:*(void *)(a1 + 48)];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        id v15 = *(void **)(a1 + 32);
        id v16 = *(id *)(a1 + 40);
        objc_msgSend(v15, "addSynonym:lookupIdentifier:category:originalContentString:", v14, v16, 1331, *(void *)(a1 + 48), (void)v17);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

+ (void)_appendPerson:(id)a3 fetchHelper:(id)a4 toAsset:(id)a5 withPersonSynonyms:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 detectionType] == 1)
  {
    uint64_t v13 = [v9 personUUID];
    uint64_t v14 = [v9 fullName];
    id v15 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v16 = [v14 stringByTrimmingCharactersInSet:v15];

    id v17 = v13;
    id v18 = v11;
    id v19 = v16;
    long long v20 = v17;
    if ([v19 length] || -[NSObject length](v20, "length")) {
      [v18 addContentString:v19 identifier:v20 category:1300 owningCategory:0];
    }

    if (_os_feature_enabled_impl())
    {
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __75__PSIAssetTranslator__appendPerson_fetchHelper_toAsset_withPersonSynonyms___block_invoke;
      v37[3] = &unk_1E586A890;
      id v38 = v18;
      long long v39 = v20;
      id v40 = v19;
      [v10 enumerateSearchEntityRelationsForPerson:v9 block:v37];

      id v21 = v38;
    }
    else
    {
      id v21 = [v12 objectForKeyedSubscript:v20];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v24 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        id v30 = v12;
        id v31 = v11;
        id v32 = v10;
        uint64_t v26 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v21);
            }
            uint64_t v28 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            long long v29 = v20;
            [v18 addSynonym:v28 lookupIdentifier:v29 category:1301 originalContentString:v19];
          }
          uint64_t v25 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v25);
        id v11 = v31;
        id v10 = v32;
        id v12 = v30;
      }
    }
  }
  else
  {
    long long v20 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v22 = [v9 detectionType];
      id v23 = [v9 personUUID];
      *(_DWORD *)buf = 67109378;
      int v43 = v22;
      __int16 v44 = 2112;
      long long v45 = v23;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Unexpected detection type (%hd) for person: %@", buf, 0x12u);
    }
  }
}

void __75__PSIAssetTranslator__appendPerson_fetchHelper_toAsset_withPersonSynonyms___block_invoke(id *a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__PSIAssetTranslator__appendPerson_fetchHelper_toAsset_withPersonSynonyms___block_invoke_2;
  v4[3] = &unk_1E586A868;
  id v5 = a1[4];
  id v6 = a1[5];
  id v7 = a1[6];
  PLSearchStringsForPersonRelation(a2, v4);
}

void __75__PSIAssetTranslator__appendPerson_fetchHelper_toAsset_withPersonSynonyms___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 length])
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    [v7 addSynonym:v5 lookupIdentifier:v8 category:1301 originalContentString:*(void *)(a1 + 48)];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * v13);
        id v15 = *(void **)(a1 + 32);
        id v16 = *(id *)(a1 + 40);
        objc_msgSend(v15, "addSynonym:lookupIdentifier:category:originalContentString:", v14, v16, 1301, *(void *)(a1 + 48), (void)v17);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

+ (void)_appendPersonsAndPetsToAsset:(id)a3 withPersonSynonyms:(id)a4 forAsset:(id)a5 fetchHelper:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v8 = a4;
  id v40 = a6;
  id v9 = PLSearchIndexGetLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  uint64_t v11 = v9;
  uint64_t v12 = v11;
  unint64_t v36 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PSIAssetTranslator: Persons & Pets", "", buf, 2u);
  }
  long long v35 = v12;

  uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v14 = (void *)[v8 mutableCopy];
  id v15 = v14;
  uint64_t v37 = v8;
  os_signpost_id_t spid = v10;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  long long v42 = v16;

  id obj = [v40 allDetectedFaces];
  if (obj)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v22 = [v21 associatedPersonForFaceOrTorso:1 orTemporal:1];
          id v23 = [v22 personUUID];
          if ([v22 shouldIndexForSearch])
          {
            uint64_t v24 = [v42 objectForKeyedSubscript:v23];
            uint64_t v25 = (void *)[v24 mutableCopy];
            uint64_t v26 = v25;
            if (v25) {
              int v27 = v25;
            }
            else {
              int v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            uint64_t v28 = v27;

            if ((_os_feature_enabled_impl() & 1) == 0)
            {
              int v29 = [v21 ageType];
              v43[0] = MEMORY[0x1E4F143A8];
              v43[1] = 3221225472;
              v43[2] = __91__PSIAssetTranslator__appendPersonsAndPetsToAsset_withPersonSynonyms_forAsset_fetchHelper___block_invoke;
              v43[3] = &unk_1E586A840;
              id v30 = v28;
              __int16 v44 = v30;
              PLSearchSearchStringsForPersonAgeType(v29, v43);
              [v42 setObject:v30 forKeyedSubscript:v23];
            }
            int v31 = [v22 detectionType];
            if ((v31 - 3) >= 2)
            {
              if (v31 == 1 && ([v13 containsObject:v23] & 1) == 0)
              {
                [v13 addObject:v23];
                [a1 _appendPerson:v22 fetchHelper:v40 toAsset:v39 withPersonSynonyms:v42];
              }
            }
            else if (([v13 containsObject:v23] & 1) == 0)
            {
              [v13 addObject:v23];
              [a1 _appendPet:v22 fetchHelper:v40 toAsset:v39];
            }
          }
          else
          {
            uint64_t v28 = PLSearchBackendModelTranslationGetLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              long long v50 = v23;
              _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "Person not valid for indexing: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v18);
    }
  }
  id v32 = v35;
  long long v33 = v32;
  if (v36 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v33, OS_SIGNPOST_INTERVAL_END, spid, "PSIAssetTranslator: Persons & Pets", "", buf, 2u);
  }
}

void __91__PSIAssetTranslator__appendPersonsAndPetsToAsset_withPersonSynonyms_forAsset_fetchHelper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if ([v8 length])
  {
    [*(id *)(a1 + 32) addObject:v8];
    id v6 = *(void **)(a1 + 32);
    id v7 = [v5 allObjects];
    [v6 addObjectsFromArray:v7];
  }
}

+ (void)_appendFavoriteToAsset:(id)a3 forAsset:(id)a4
{
  id v7 = a3;
  if ([a4 favorite])
  {
    id v5 = PLServicesLocalizedFrameworkString();
    id v6 = v7;
    if ([v5 length]) {
      [v6 addContentString:v5 category:2000 owningCategory:0];
    }
  }
}

+ (void)_appendMediaTypesToAsset:(id)a3 forAsset:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 RAWBadgeAttribute] - 1 <= 2)
  {
    id v7 = PLServicesLocalizedFrameworkString();
    id v8 = v5;
    if ([v7 length]) {
      [v8 addContentString:v7 category:1902 owningCategory:0];
    }
  }
  int v9 = [v6 kind];
  if (v9 == 1)
  {
    os_signpost_id_t v10 = PLServicesLocalizedFrameworkString();
    id v15 = v5;
    if ([v10 length])
    {
      uint64_t v12 = v15;
      uint64_t v13 = v10;
      uint64_t v14 = 1901;
      goto LABEL_11;
    }
  }
  else
  {
    if (v9) {
      goto LABEL_13;
    }
    os_signpost_id_t v10 = PLServicesLocalizedFrameworkString();
    id v11 = v5;
    if ([v10 length])
    {
      uint64_t v12 = v11;
      uint64_t v13 = v10;
      uint64_t v14 = 1900;
LABEL_11:
      [v12 addContentString:v13 category:v14 owningCategory:0];
    }
  }

LABEL_13:
  int v16 = [v6 kindSubtype];
  int v17 = v16;
  if (v16 > 100)
  {
    if (v16 == 103)
    {
      uint64_t v18 = PLServicesLocalizedFrameworkString();
      id v26 = v5;
      if ([v18 length])
      {
        long long v20 = v26;
        id v21 = v18;
        uint64_t v22 = 1910;
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    if (v16 == 102)
    {
      uint64_t v18 = PLServicesLocalizedFrameworkString();
      id v27 = v5;
      if ([v18 length])
      {
        long long v20 = v27;
        id v21 = v18;
        uint64_t v22 = 1909;
        goto LABEL_32;
      }
      goto LABEL_33;
    }
    if (v16 != 101) {
      goto LABEL_34;
    }
    uint64_t v18 = PLServicesLocalizedFrameworkString();
    id v23 = v5;
    if (![v18 length]) {
      goto LABEL_33;
    }
    long long v20 = v23;
    id v21 = v18;
    uint64_t v22 = 1905;
LABEL_32:
    [v20 addContentString:v21 category:v22 owningCategory:0];
    goto LABEL_33;
  }
  if (v16 == 1)
  {
    uint64_t v18 = PLServicesLocalizedFrameworkString();
    id v24 = v5;
    if (![v18 length]) {
      goto LABEL_33;
    }
    long long v20 = v24;
    id v21 = v18;
    uint64_t v22 = 1908;
    goto LABEL_32;
  }
  if (v16 != 2)
  {
    if (v16 != 10) {
      goto LABEL_34;
    }
    uint64_t v18 = PLServicesLocalizedFrameworkString();
    id v19 = v5;
    if (![v18 length]) {
      goto LABEL_33;
    }
    long long v20 = v19;
    id v21 = v18;
    uint64_t v22 = 1907;
    goto LABEL_32;
  }
  uint64_t v18 = PLServicesLocalizedFrameworkString();
  id v25 = v5;
  if ([v18 length])
  {
    long long v20 = v25;
    id v21 = v18;
    uint64_t v22 = 1906;
    goto LABEL_32;
  }
LABEL_33:

LABEL_34:
  if ([v6 playbackVariation] == 3)
  {
    uint64_t v28 = PLServicesLocalizedFrameworkString();
    id v29 = v5;
    if ([v28 length]) {
      [v29 addContentString:v28 category:1911 owningCategory:0];
    }
  }
  int v30 = [v6 playbackStyle];
  if (v30 != 5)
  {
    if (v30 == 3)
    {
      id v31 = v5;
      if ([@"PLSearchIndexIdentifierLivePhotoPlaybackStyleEnabled" length]) {
        [v31 addIdentifier:@"PLSearchIndexIdentifierLivePhotoPlaybackStyleEnabled" category:1906 owningCategory:0];
      }
      goto LABEL_46;
    }
    if (v30 != 2) {
      goto LABEL_47;
    }
  }
  PLServicesLocalizedFrameworkString();
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  id v32 = v5;
  if ([v31 length]) {
    [v32 addContentString:v31 category:1912 owningCategory:0];
  }

LABEL_46:
LABEL_47:
  if (([v6 avalanchePickType] & 0x10) != 0)
  {
    long long v33 = PLServicesLocalizedFrameworkString();
    id v34 = v5;
    if ([v33 length]) {
      [v34 addContentString:v33 category:1913 owningCategory:0];
    }
  }
  int v35 = [v6 depthType];
  if (v35 == 2)
  {
    id v38 = PLServicesLocalizedFrameworkString();
    id v43 = v5;
    if ([v38 length])
    {
      id v40 = v43;
      long long v41 = v38;
      uint64_t v42 = 1903;
      goto LABEL_60;
    }
LABEL_61:

    goto LABEL_62;
  }
  if ((unsigned __int16)v35 == 1)
  {
    unint64_t v36 = PLServicesLocalizedFrameworkString();
    id v37 = v5;
    if ([v36 length]) {
      [v37 addContentString:v36 category:1914 owningCategory:0];
    }

    if (v17 == 2)
    {
      id v38 = PLServicesLivePortraitLocalizedFrameworkString();
      id v39 = v37;
      if ([v38 length])
      {
        id v40 = v39;
        long long v41 = v38;
        uint64_t v42 = 1918;
LABEL_60:
        [v40 addContentString:v41 category:v42 owningCategory:0];
        goto LABEL_61;
      }
      goto LABEL_61;
    }
  }
LABEL_62:
  if ([v6 spatialType])
  {
    __int16 v44 = PLServicesLocalizedFrameworkString();
    id v45 = v5;
    if ([v44 length]) {
      [v45 addContentString:v44 category:1919 owningCategory:0];
    }
  }
  if ([v6 isMagicCarpet])
  {
    long long v46 = PLServicesLocalizedFrameworkString();
    id v47 = v5;
    if ([v46 length]) {
      [v47 addContentString:v46 category:1904 owningCategory:0];
    }
  }
  long long v48 = [v6 additionalAttributes];
  int v49 = [v48 cameraCaptureDevice];

  if (v49 == 1)
  {
    long long v50 = PLServicesLocalizedFrameworkString();
    id v51 = v5;
    if ([v50 length]) {
      [v51 addContentString:v50 category:1915 owningCategory:0];
    }

    id v52 = v51;
    id v53 = v50;
    v54 = PLSearchLocalizedSynonymsForKey(@"ALL_SELFIES");
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v55 = [v54 countByEnumeratingWithState:&v59 objects:v63 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v60 != v57) {
            objc_enumerationMutation(v54);
          }
          [v52 addSynonym:*(void *)(*((void *)&v59 + 1) + 8 * i) category:1916 originalContentString:v53];
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v59 objects:v63 count:16];
      }
      while (v56);
    }
  }
}

+ (void)_appendKeywords:(id)a3 toAsset:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = v6;
        id v13 = v11;
        if ([v13 length]) {
          [v12 addContentString:v13 category:1200 owningCategory:0];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

+ (void)_appendSavedFromAppToAsset:(id)a3 forAsset:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  id v6 = [v5 importedByBundleIdentifier];
  uint64_t v7 = [v5 importedByDisplayName];

  if (PLShouldConstructDisplayNameForAppBundle(v6, (uint64_t)v7))
  {
    uint64_t v8 = PLSyndicatedDisplayNameForAppBundle(v6, v7);
    if ([v8 length])
    {
      id v9 = v11;
      id v10 = v8;
      if ([v10 length]) {
        [v9 addContentString:v10 category:2200 owningCategory:0];
      }
    }
  }
}

+ (BOOL)_containsPersonWithSceneTaxonomyProvider:(id)a3 forAsset:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = [v6 detectedFaces];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v27 + 1) + 8 * i) detectionType] == 1)
        {
          LOBYTE(v15) = 1;
          goto LABEL_27;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v34 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v7 = [v6 additionalAttributes];
  uint64_t v12 = [v7 sceneAnalysisVersion];
  id v13 = [v5 searchIndexSceneTaxonomyForSceneAnalysisVersion:v12];
  if (v13)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v14 = objc_msgSend(v7, "sceneClassifications", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v24;
      while (2)
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          if ([v18 sceneIdentifier] == 881)
          {
            if ([v13 nodeRefForExtendedSceneClassId:881])
            {
              [v18 confidence];
              double v20 = v19;
              PFSceneTaxonomyNodeSearchThreshold();
              if (v20 > v21)
              {
                LOBYTE(v15) = 1;
                goto LABEL_26;
              }
            }
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    long long v14 = PLSearchBackendStickerSuggestionsGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v33 = v12;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to load scene taxonomy for scene analysis version: %i.", buf, 8u);
    }
    LOBYTE(v15) = 0;
  }
LABEL_26:

LABEL_27:
  return v15;
}

+ (void)_appendStickerSuggestionsToAsset:(id)a3 fetchHelper:(id)a4 sceneTaxonomyProvider:(id)a5 forAsset:(id)a6
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  id v70 = a4;
  id v69 = a5;
  id v9 = a6;
  uint64_t v10 = PLSearchIndexGetLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = v10;
  id v13 = v12;
  unint64_t v66 = v11 - 1;
  os_signpost_id_t spid = v11;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PSIAssetTranslator: Stickers", "", buf, 2u);
  }

  if ([v9 kind] || objc_msgSend(v9, "kindSubtype") == 10) {
    goto LABEL_104;
  }
  v63 = [v9 mediaAnalysisAttributes];
  if ((int)[v63 visualSearchStickerConfidenceVersion] < 1) {
    goto LABEL_103;
  }
  [v9 stickerConfidenceScore];
  float v15 = v14;
  if (PLStickerSuggestionConfidenceThreshold_token != -1) {
    dispatch_once(&PLStickerSuggestionConfidenceThreshold_token, &__block_literal_global_64524);
  }
  if (v15 < *(float *)&PLStickerSuggestionConfidenceThreshold_stickerSuggestionConfidenceThreshold) {
    goto LABEL_103;
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
  long long v17 = [v70 allSceneClassifications];
  long long v62 = [v16 setWithArray:v17];

  if (![v62 count]) {
    goto LABEL_102;
  }
  uint64_t v18 = [v9 additionalAttributes];
  uint64_t v19 = [v18 sceneAnalysisVersion];

  if (!PLSearchIsAssetSafeForStickers(v62, v19)) {
    goto LABEL_102;
  }
  uint64_t v64 = [v69 searchIndexSceneTaxonomyForSceneAnalysisVersion:v19];
  if (!v64 && v19)
  {
    double v20 = PLSearchBackendStickerSuggestionsGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      double v21 = [v68 uuid];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v21;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to load scene taxonomy for scene analysis version: %i. Unable to index Sticker Category Suggestions for Asset: %@", buf, 0x12u);
    }
    goto LABEL_101;
  }
  double v84 = 0.0;
  CGSize v22 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  rect.size = v22;
  if (PLStickerSuggestionDominantSceneAreaMinThreshold_token != -1) {
    dispatch_once(&PLStickerSuggestionDominantSceneAreaMinThreshold_token, &__block_literal_global_277_64538);
  }
  double v23 = *(double *)&PLStickerSuggestionDominantSceneAreaMinThreshold_threshold;
  if (PLStickerSuggestionDominantSceneAreaMaxThreshold_token != -1) {
    dispatch_once(&PLStickerSuggestionDominantSceneAreaMaxThreshold_token, &__block_literal_global_282);
  }
  double v24 = *(double *)&PLStickerSuggestionDominantSceneAreaMaxThreshold_threshold;
  if (v64)
  {
    long long v61 = PLSearchDominantSceneWithIdentifierInSceneClassifications(v62, PLSearchDominantSceneAny, v64, &v84, &rect);
  }
  else
  {
    long long v61 = 0;
  }
  double MidX = CGRectGetMidX(rect);
  double MidY = CGRectGetMidY(rect);
  if (PLStickerSuggestionDominantSceneBoundingBoxCenterThreshold_token != -1) {
    dispatch_once(&PLStickerSuggestionDominantSceneBoundingBoxCenterThreshold_token, &__block_literal_global_292);
  }
  double v27 = *(float *)&PLStickerSuggestionDominantSceneBoundingBoxCenterThreshold_stickerSuggestionConfidenceThreshold;
  if (MidX <= *(float *)&PLStickerSuggestionDominantSceneBoundingBoxCenterThreshold_stickerSuggestionConfidenceThreshold)
  {
    BOOL v60 = 0;
  }
  else
  {
    BOOL v28 = MidX < 1.0 - v27;
    if (MidY <= v27) {
      BOOL v28 = 0;
    }
    if (MidY >= 1.0 - v27) {
      BOOL v28 = 0;
    }
    BOOL v60 = v28;
  }
  [v63 videoStickerSuggestionScore];
  float v30 = v29;
  unint64_t v31 = [v63 mediaAnalysisVersion];
  if ([v9 playbackStyle] == 3 && v31 >= 0x31)
  {
    if (PLLiveStickerSuggestionConfidenceThreshold_token != -1) {
      dispatch_once(&PLLiveStickerSuggestionConfidenceThreshold_token, &__block_literal_global_272);
    }
    char v32 = !v60;
    if (v30 < *(float *)&PLLiveStickerSuggestionConfidenceThreshold_liveStickerSuggestionConfidenceThreshold) {
      char v32 = 1;
    }
    if ((v32 & 1) == 0 && v84 > v23)
    {
      long long v81 = 0u;
      long long v82 = 0u;
      long long v80 = 0u;
      long long v79 = 0u;
      id v33 = v62;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v79 objects:v90 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v80;
LABEL_43:
        uint64_t v36 = 0;
        while (1)
        {
          if (*(void *)v80 != v35) {
            objc_enumerationMutation(v33);
          }
          id v37 = *(void **)(*((void *)&v79 + 1) + 8 * v36);
          if ([v37 sceneIdentifier] == 2147482079)
          {
            [v37 confidence];
            if (v38 >= 0.55) {
              break;
            }
          }
          if (v34 == ++v36)
          {
            uint64_t v34 = [v33 countByEnumeratingWithState:&v79 objects:v90 count:16];
            if (v34) {
              goto LABEL_43;
            }
            goto LABEL_50;
          }
        }
      }
      else
      {
LABEL_50:

        PLSearchLookupIdentifierForStickerSuggestionType(3);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        [v68 addIdentifier:v33 category:2700 owningCategory:0];
      }
    }
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v39 = v62;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v75 objects:v89 count:16];
  if (!v40)
  {
LABEL_96:

    goto LABEL_97;
  }
  uint64_t v41 = *(void *)v76;
  long long v59 = v71;
LABEL_54:
  uint64_t v42 = 0;
  while (1)
  {
    if (*(void *)v76 != v41) {
      objc_enumerationMutation(v39);
    }
    id v43 = *(void **)(*((void *)&v75 + 1) + 8 * v42);
    uint64_t v44 = objc_msgSend(v43, "sceneIdentifier", v59);
    if ((unint64_t)(v44 - 15) > 0x6E5) {
      goto LABEL_80;
    }
    uint64_t v45 = qword_19BA9B0F0[v44 - 15];
    if (!v45) {
      goto LABEL_80;
    }
    if (![v64 nodeRefForExtendedSceneClassId:v44])
    {
      id v52 = PLSearchBackendStickerSuggestionsGetLog();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v44;
        _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_ERROR, "Failed to find taxonomy node for Sticker SceneID: %llu", buf, 0xCu);
      }

      goto LABEL_80;
    }
    if (PFSceneTaxonomyNodeIsIndexed())
    {
      PFSceneTaxonomyNodeSearchThreshold();
      double v47 = v46;
      [v43 confidence];
      if (v48 >= v47) {
        break;
      }
    }
LABEL_80:
    if (v40 == ++v42)
    {
      uint64_t v40 = [v39 countByEnumeratingWithState:&v75 objects:v89 count:16];
      if (v40) {
        goto LABEL_54;
      }
      goto LABEL_96;
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v86 = __Block_byref_object_copy__46870;
  v87 = __Block_byref_object_dispose__46871;
  id v88 = 0;
  if (v84 > v23)
  {
    v71[0] = __98__PSIAssetTranslator__appendStickerSuggestionsToAsset_fetchHelper_sceneTaxonomyProvider_forAsset___block_invoke;
    v71[1] = &unk_1E586A810;
    id v49 = v61;
    v73 = v43;
    v74 = buf;
    id v72 = v49;
    PFSceneTaxonomyNodeVisitDetectors();
  }
  if (!v60 || !*(void *)(*(void *)&buf[8] + 40))
  {
    if (!v61 && v45 == 6) {
      goto LABEL_83;
    }
    goto LABEL_79;
  }
  if ((v84 >= v24 || v45 != 7) && v45 == 7)
  {
LABEL_79:
    _Block_object_dispose(buf, 8);

    goto LABEL_80;
  }
LABEL_83:
  _Block_object_dispose(buf, 8);

  if ((v45 & 0xFFFFFFFFFFFFFFFDLL) != 5)
  {
    uint64_t v55 = v45;
    if (v45 == 1)
    {
      if ([a1 _containsPersonWithSceneTaxonomyProvider:v69 forAsset:v9]) {
        goto LABEL_97;
      }
      uint64_t v55 = 1;
    }
    goto LABEL_91;
  }
  *(void *)buf = 0;
  id v53 = PLSearchDominantSceneWithIdentifierInSceneClassifications(v39, 881, v64, (double *)buf, 0);
  double v54 = *(double *)buf;
  if (PLStickerSuggestionPeopleDistractorDominantSceneAreaMaxThreshold_token != -1) {
    dispatch_once(&PLStickerSuggestionPeopleDistractorDominantSceneAreaMaxThreshold_token, &__block_literal_global_287);
  }
  uint64_t v55 = v45;
  if (v54 <= *(double *)&PLStickerSuggestionPeopleDistractorDominantSceneAreaMaxThreshold_threshold)
  {
LABEL_91:
    PLSearchLookupIdentifierForStickerSuggestionType(v55);
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    if ([v39 length])
    {
      [v68 addIdentifier:v39 category:2700 owningCategory:0];
    }
    else
    {
      uint64_t v56 = PLSearchBackendStickerSuggestionsGetLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v45;
        _os_log_impl(&dword_19B3C7000, v56, OS_LOG_TYPE_ERROR, "Failed to get search lookup identifier for StickerSuggestionType: %lu", buf, 0xCu);
      }
    }
    goto LABEL_96;
  }
LABEL_97:
  uint64_t v57 = v13;
  v58 = v57;
  if (v66 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v58, OS_SIGNPOST_INTERVAL_END, spid, "PSIAssetTranslator: Stickers", "", buf, 2u);
  }

LABEL_101:
LABEL_102:

LABEL_103:
LABEL_104:
}

BOOL __98__PSIAssetTranslator__appendStickerSuggestionsToAsset_fetchHelper_sceneTaxonomyProvider_forAsset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = [*(id *)(a1 + 32) sceneIdentifier];
  if (v4 == v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
  }
  return v4 == v5;
}

+ (void)_appendPrivateEncryptedComputeScenes:(id)a3 forAsset:(id)a4 fetchHelper:(id)a5 csuTaxonomyObjectStore:(id)a6 locale:(id)a7
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v44 = a4;
  id v11 = a5;
  id v12 = a6;
  id v49 = a7;
  id v43 = v11;
  id v13 = [v11 allSceneClassifications];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v52 = [v13 countByEnumeratingWithState:&v59 objects:v66 count:16];
  float v14 = 0;
  if (v52)
  {
    unint64_t v15 = 0x1E4F28000uLL;
    uint64_t v51 = *(void *)v60;
    id v45 = v12;
    double v48 = v13;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v60 != v51) {
          objc_enumerationMutation(v13);
        }
        long long v17 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        signed int v18 = [v17 classificationType];
        unint64_t v19 = v18;
        double v20 = [*(id *)(v15 + 3792) numberWithInteger:v18];
        int v21 = [&unk_1EEBF1D30 containsObject:v20];

        if (v18 == 4 || v21 != 0)
        {
          uint64_t v23 = [v17 sceneIdentifier];
          if (v18 <= 7)
          {
            if (((0xDuLL >> v18) & 1) == 0)
            {
              __int16 v24 = word_19BA9A0D0[v18];
              goto LABEL_14;
            }
            long long v25 = PLSearchBackendSceneTaxonomyGetLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)uint64_t v64 = 0;
              *(_WORD *)&v64[4] = 2048;
              *(void *)&v64[6] = v19;
              *(_WORD *)&v64[14] = 2048;
              *(void *)&v64[16] = v23;
              _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "CSU: Unsupported scene classification type (%hd) for Scene (%lu, %llu)", buf, 0x1Cu);
            }
LABEL_53:

            continue;
          }
          __int16 v24 = 1;
LABEL_14:
          id v58 = v14;
          long long v25 = [v12 entityForIdentifier:v23 idType:v24 error:&v58];
          id v26 = v58;

          if (v25) {
            BOOL v27 = v26 == 0;
          }
          else {
            BOOL v27 = 0;
          }
          if (!v27)
          {
            BOOL v28 = PLSearchBackendSceneTaxonomyGetLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)uint64_t v64 = v19;
              *(_WORD *)&v64[8] = 2048;
              *(void *)&v64[10] = v23;
              float v29 = v28;
              os_log_type_t v30 = OS_LOG_TYPE_ERROR;
              unint64_t v31 = "CSU: CSU entity not found in MAD database. Skipping Scene (%lu, %llu)";
              goto LABEL_23;
            }
            goto LABEL_52;
          }
          if ([v25 sensitiveLocation])
          {
            BOOL v28 = PLSearchBackendSceneTaxonomyGetLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)uint64_t v64 = v19;
              *(_WORD *)&v64[8] = 2048;
              *(void *)&v64[10] = v23;
              float v29 = v28;
              os_log_type_t v30 = OS_LOG_TYPE_DEBUG;
              unint64_t v31 = "CSU: CSU entity not eligible for suggestions. Skipping Scene (%lu, %llu)";
LABEL_23:
              _os_log_impl(&dword_19B3C7000, v29, v30, v31, buf, 0x16u);
            }
LABEL_52:

            float v14 = v26;
            goto LABEL_53;
          }
          BOOL v28 = [v25 localizedLabelWithLocale:v49];
          char v32 = PLSearchSceneLookupIdentifier(v19, v23);
          if (v19 > 7)
          {
            uint64_t v33 = 1510;
            if (v28) {
              goto LABEL_30;
            }
          }
          else
          {
            uint64_t v33 = qword_19BA9E820[v19];
            if (!v28) {
              goto LABEL_48;
            }
LABEL_30:
            if ([v28 length])
            {
              [v53 addContentString:v28 identifier:v32 category:(__int16)v33 owningCategory:0];
              uint64_t v34 = [v25 localizedSynonymsWithLocale:v49];
              uint64_t v35 = v34;
              if (v34 && [v34 count])
              {
                uint64_t v50 = v23;
                id v46 = v26;
                double v47 = v25;
                long long v56 = 0u;
                long long v57 = 0u;
                long long v54 = 0u;
                long long v55 = 0u;
                uint64_t v35 = v35;
                uint64_t v36 = [v35 countByEnumeratingWithState:&v54 objects:v65 count:16];
                if (v36)
                {
                  uint64_t v37 = v36;
                  __int16 v38 = PLSearchIndexSynonymCategoryForCategory(v33);
                  uint64_t v39 = *(void *)v55;
                  do
                  {
                    for (uint64_t j = 0; j != v37; ++j)
                    {
                      if (*(void *)v55 != v39) {
                        objc_enumerationMutation(v35);
                      }
                      uint64_t v41 = *(void **)(*((void *)&v54 + 1) + 8 * j);
                      if (v41 && [*(id *)(*((void *)&v54 + 1) + 8 * j) length])
                      {
                        if ([v41 isEqualToString:v28])
                        {
                          uint64_t v42 = PLSearchBackendSceneTaxonomyGetLog();
                          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)buf = 138412802;
                            *(void *)uint64_t v64 = v28;
                            *(_WORD *)&v64[8] = 2048;
                            *(void *)&v64[10] = v19;
                            *(_WORD *)&v64[18] = 2048;
                            *(void *)&v64[20] = v50;
                            _os_log_impl(&dword_19B3C7000, v42, OS_LOG_TYPE_ERROR, "CSU: Duplicate PrivateEncryptedCompute label: '%@' found in synonyms for Scene (%lu, %llu)", buf, 0x20u);
                          }
                        }
                        else
                        {
                          [v53 addSynonym:v41 lookupIdentifier:v32 category:v38 originalContentString:v28];
                        }
                      }
                    }
                    uint64_t v37 = [v35 countByEnumeratingWithState:&v54 objects:v65 count:16];
                  }
                  while (v37);
                }

                id v12 = v45;
                id v26 = v46;
                unint64_t v15 = 0x1E4F28000;
                long long v25 = v47;
              }
              else
              {
                unint64_t v15 = 0x1E4F28000;
              }
              goto LABEL_51;
            }
          }
LABEL_48:
          uint64_t v35 = PLSearchBackendSceneTaxonomyGetLog();
          unint64_t v15 = 0x1E4F28000;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)uint64_t v64 = v19;
            *(_WORD *)&v64[8] = 2048;
            *(void *)&v64[10] = v23;
            _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_ERROR, "CSU: Failed to get localized text from CSU for Scene (%lu, %llu)", buf, 0x16u);
          }
LABEL_51:

          id v13 = v48;
          goto LABEL_52;
        }
      }
      uint64_t v52 = [v13 countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v52);
  }
}

+ (void)_appendSceneClassificationsToAsset:(id)a3 sceneTaxonomyProvider:(id)a4 forAsset:(id)a5 fetchHelper:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = PLSearchIndexGetLog();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  unint64_t v15 = v13;
  uint64_t v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PSIAssetTranslator: Scenes", "", buf, 2u);
  }

  long long v17 = (void *)MEMORY[0x1E4F1CAD0];
  signed int v18 = [v12 allSceneClassifications];

  unint64_t v19 = [v17 setWithArray:v18];

  if ([v19 count])
  {
    double v20 = [v11 additionalAttributes];
    uint64_t v21 = [v20 sceneAnalysisVersion];

    CGSize v22 = [v10 searchIndexSceneTaxonomyForSceneAnalysisVersion:v21];
    if (!v22 && v21)
    {
      uint64_t v23 = PLSearchBackendSceneTaxonomyGetLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        __int16 v24 = [v9 uuid];
        *(_DWORD *)buf = 67109378;
        int v29 = v21;
        __int16 v30 = 2112;
        unint64_t v31 = v24;
        _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_ERROR, "Could not open taxonomy for scene analysis version: %i, unable to index scenes for asset: %@", buf, 0x12u);
      }
      goto LABEL_13;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __100__PSIAssetTranslator__appendSceneClassificationsToAsset_sceneTaxonomyProvider_forAsset_fetchHelper___block_invoke;
    v26[3] = &unk_1E586A7E8;
    id v27 = v9;
    [v22 enumerateKeywordAndSynonymsForScenes:v19 usingBlock:v26];
  }
  long long v25 = v16;
  uint64_t v23 = v25;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v23, OS_SIGNPOST_INTERVAL_END, v14, "PSIAssetTranslator: Scenes", "", buf, 2u);
  }
LABEL_13:
}

void __100__PSIAssetTranslator__appendSceneClassificationsToAsset_sceneTaxonomyProvider_forAsset_fetchHelper___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    id v10 = [NSString stringWithFormat:@"%@/%llu", @"scene", a5];
    [*(id *)(a1 + 32) addContentString:v8 identifier:v10 category:1500 owningCategory:0];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v9;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      unint64_t v15 = MEMORY[0x1E4F14500];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v17 isEqualToString:v8])
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v24 = v8;
              __int16 v25 = 2048;
              uint64_t v26 = a5;
              _os_log_error_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Search Indexing: duplicate scene keyword: '%@' found in scene synonyms array for scene ID: %llu", buf, 0x16u);
            }
          }
          else
          {
            [*(id *)(a1 + 32) addSynonym:v17 lookupIdentifier:v10 category:1501 originalContentString:v8];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v13);
    }

    id v9 = v18;
  }
}

+ (void)_appendDateCreatedToAsset:(id)a3 indexingContext:(id)a4 withSynonyms:(id)a5 forAsset:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v48 = a6;
  id v10 = [v48 dateCreated];
  double v47 = v9;
  id v11 = [v9 searchIndexDateFormatter];
  uint64_t v12 = (void *)[v11 newLocalizedComponentsFromDate:v10 includeMonth:0];
  if ([v12 count] == 1)
  {
    uint64_t v13 = [v12 firstObject];
    id v14 = v8;
    if ([v13 length]) {
      [v14 addContentString:v13 category:1101 owningCategory:0];
    }
  }
  id v45 = v12;
  id v46 = v11;
  unint64_t v15 = [v11 localizedMonthStringsFromDate:v10];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v60;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v60 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = *(void **)(*((void *)&v59 + 1) + 8 * v19);
        id v21 = v8;
        id v22 = v20;
        if ([v22 length]) {
          [v21 addContentString:v22 category:1100 owningCategory:0];
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v59 objects:v65 count:16];
    }
    while (v17);
  }
  uint64_t v23 = [v48 localDateCreated];
  id v24 = PLSearchPartsOfDayForLocalDate(v23);

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v25 = v24;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v56;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v56 != v28) {
          objc_enumerationMutation(v25);
        }
        __int16 v30 = *(void **)(*((void *)&v55 + 1) + 8 * v29);
        id v31 = v8;
        id v32 = v30;
        if ([v32 length]) {
          [v31 addContentString:v32 category:1106 owningCategory:0];
        }

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v27);
  }

  uint64_t v33 = [v48 localDateCreated];
  uint64_t v34 = PLSearchPartsOfWeekForLocalDate(v33);

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v35 = v34;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v52;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v52 != v38) {
          objc_enumerationMutation(v35);
        }
        uint64_t v40 = *(void **)(*((void *)&v51 + 1) + 8 * v39);
        id v41 = v8;
        id v42 = v40;
        if ([v42 length]) {
          [v41 addContentString:v42 category:1107 owningCategory:0];
        }

        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [v35 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v37);
  }

  id v43 = [v47 calendar];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __86__PSIAssetTranslator__appendDateCreatedToAsset_indexingContext_withSynonyms_forAsset___block_invoke;
  v49[3] = &unk_1E586A7C0;
  id v50 = v8;
  id v44 = v8;
  PLSearchSeasonStringsForDate(v10, v43, v49);
}

void __86__PSIAssetTranslator__appendDateCreatedToAsset_indexingContext_withSynonyms_forAsset___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [NSString stringWithFormat:@"%@/%lu", @"season", a2];
  [*(id *)(a1 + 32) addContentString:v7 identifier:v9 category:1104 owningCategory:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(a1 + 32) addSynonym:*(void *)(*((void *)&v15 + 1) + 8 * v14++) lookupIdentifier:v9 category:1105 originalContentString:v7];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
}

+ (void)_appendGEODataToAsset:(id)a3 forAsset:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 locationInfo];
  if (v7)
  {
    id v8 = [v6 placeAnnotation];
    id v9 = [v7 placeWithAnnotation:v8];

    if (v9)
    {
      id v10 = v5;
      id v11 = v9;
      uint64_t v12 = [v10 tokens];
      if ([v12 count]) {
        __assert_rtn("PLIndexRevGeoPlace", "PSIAssetTranslator.m", 59, "tokens.count == 0");
      }
      uint64_t v29 = v7;
      id v30 = v6;
      id v31 = v5;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __PLIndexRevGeoPlace_block_invoke;
      v36[3] = &unk_1E586CD40;
      id v27 = v12;
      id v37 = v27;
      id v28 = v10;
      id v38 = v28;
      uint64_t v13 = (void (**)(void, void, void))MEMORY[0x19F38D650](v36);
      uint64_t v14 = &qword_19BA9AE30;
      do
      {
        uint64_t v15 = *v14;
        long long v16 = objc_msgSend(v11, "placeInfosForOrderType", v27);
        long long v17 = [NSNumber numberWithUnsignedInteger:v15];
        long long v18 = [v16 objectForKeyedSubscript:v17];

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v39 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v33 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = [*(id *)(*((void *)&v32 + 1) + 8 * i) placeName];
              ((void (**)(void, void *, uint64_t))v13)[2](v13, v24, v15);
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v39 count:16];
          }
          while (v21);
        }

        --v14;
      }
      while (v14 >= PLIndexRevGeoPlace_PLRevGeoOrderTypes);
      [v28 reverse];

      id v7 = v29;
      id v6 = v30;
      id v5 = v31;
      if ([v29 isHome])
      {
        id v25 = PLMomentsLocalizedFrameworkString(@"MOMENT_HOME");
        id v26 = v28;
        if ([v25 length]) {
          [v26 addContentString:v25 category:1000 owningCategory:0];
        }
      }
    }
  }
}

+ (void)_appendUtilityTypesToAsset:(id)a3 forAsset:(id)a4 indexingContext:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = PLSearchIndexGetLog();
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  uint64_t v12 = v10;
  uint64_t v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PSIAssetTranslator: Utility Types V2", "", buf, 2u);
  }

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__PSIAssetTranslator__appendUtilityTypesToAsset_forAsset_indexingContext___block_invoke;
  v17[3] = &unk_1E586A798;
  id v18 = v7;
  id v14 = v7;
  PLSearchEnumerateSearchStringsForUtilityCollections(v9, v8, v17);

  uint64_t v15 = v13;
  long long v16 = v15;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v11, "PSIAssetTranslator: Utility Types V2", "", buf, 2u);
  }
}

uint64_t __74__PSIAssetTranslator__appendUtilityTypesToAsset_forAsset_indexingContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) addContentString:a3 identifier:a4 category:2800 owningCategory:0];
}

+ (void)_appendHumanActionsToAsset:(id)a3 forAsset:(id)a4 fetchHelper:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [a5 allDetectedFaces];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * v11) detectionTraits];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __70__PSIAssetTranslator__appendHumanActionsToAsset_forAsset_fetchHelper___block_invoke;
        v13[3] = &unk_1E586A770;
        id v14 = v6;
        PLSearchEnumerateSearchStringsForDetectionTraits(v12, v13);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

void __70__PSIAssetTranslator__appendHumanActionsToAsset_forAsset_fetchHelper___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [a2 value];
  uint64_t v10 = [NSString stringWithFormat:@"%@/%u", @"humanAction", v9];
  [*(id *)(a1 + 32) addContentString:v7 identifier:v10 category:2600 owningCategory:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(a1 + 32) addSynonym:*(void *)(*((void *)&v16 + 1) + 8 * v15++) lookupIdentifier:v10 category:2601 originalContentString:v7];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

+ (void)_appendAudioClassificationToAsset:(id)a3 forAsset:(id)a4
{
  id v5 = a3;
  id v6 = [a4 additionalAttributes];
  id v7 = [v6 temporalSceneClassifications];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PSIAssetTranslator__appendAudioClassificationToAsset_forAsset___block_invoke;
  v9[3] = &unk_1E586A748;
  id v10 = v5;
  id v8 = v5;
  PLSearchEnumerateSearchStringsForAudioClassifications(v7, v9);
}

void __65__PSIAssetTranslator__appendAudioClassificationToAsset_forAsset___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [a2 sceneIdentifier];
  id v10 = [NSString stringWithFormat:@"%@/%llu", @"audio", v9];
  [*(id *)(a1 + 32) addContentString:v7 identifier:v10 category:2500 owningCategory:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(a1 + 32) addSynonym:*(void *)(*((void *)&v16 + 1) + 8 * v15++) lookupIdentifier:v10 category:2501 originalContentString:v7];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

+ (void)_appendGraphDataToAsset:(id)a3 forMomentFromFetchHelper:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__PSIAssetTranslator__appendGraphDataToAsset_forMomentFromFetchHelper___block_invoke;
  v7[3] = &unk_1E586A720;
  id v8 = v5;
  id v6 = v5;
  [a4 enumerateMomentSearchEntitiesWithBlock:v7];
}

void __71__PSIAssetTranslator__appendGraphDataToAsset_forMomentFromFetchHelper___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 label];
  uint64_t v5 = [v3 type];
  uint64_t v6 = v5;
  if (v5 > 1699)
  {
    if (v5 == 1802) {
      uint64_t v8 = 1802;
    }
    else {
      uint64_t v8 = 0;
    }
    if (v5 == 1801) {
      uint64_t v8 = 1801;
    }
    if (v5 == 1800) {
      uint64_t v8 = 1800;
    }
    if (v5 == 1701) {
      uint64_t v9 = 1701;
    }
    else {
      uint64_t v9 = 0;
    }
    if (v5 == 1700) {
      uint64_t v9 = 1700;
    }
    id v7 = 0;
    if (v5 <= 1799) {
      uint64_t v6 = v9;
    }
    else {
      uint64_t v6 = v8;
    }
  }
  else if (v5 <= 1101)
  {
    if (v5 == 1000 || v5 == 1001)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = 0;
      uint64_t v6 = 0;
    }
  }
  else if (v5 == 1102)
  {
    id v7 = 0;
    uint64_t v6 = 1103;
  }
  else if (v5 == 1600)
  {
    id v10 = [v3 identifier];
    uint64_t v11 = [v10 integerValue];

    id v7 = [NSString stringWithFormat:@"%@/%lu", @"meaning", v11];
    uint64_t v6 = 1600;
  }
  else
  {
    id v7 = 0;
    if (v5 != 1610) {
      uint64_t v6 = 0;
    }
  }
  [*(id *)(a1 + 32) addContentString:v4 identifier:v7 category:(__int16)v6 owningCategory:0];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [v3 synonyms];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    __int16 v15 = PLSearchIndexSynonymCategoryForCategory(v6);
    uint64_t v16 = *(void *)v20;
    uint64_t v17 = v15;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(a1 + 32) addSynonym:*(void *)(*((void *)&v19 + 1) + 8 * i) lookupIdentifier:v7 category:v17 originalContentString:v4];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }
}

+ (id)psiAssetFromAsset:(id)a3 fetchHelper:(id)a4 propertySets:(unint64_t)a5 graphData:(id)a6 indexingContext:(id)a7 documentObservation:(id)a8
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  long long v19 = [v14 uuid];
  LOBYTE(a7) = PLIsValidUUIDString();

  if (a7)
  {
    long long v76 = v16;
    id v20 = v15;
    long long v21 = PLSearchIndexGetLog();
    os_signpost_id_t v22 = os_signpost_id_generate(v21);
    uint64_t v23 = v21;
    uint64_t v24 = v23;
    os_signpost_id_t spid = v22;
    unint64_t v73 = v22 - 1;
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PSIAssetTranslator: Asset translation time", "", buf, 2u);
    }
    id v72 = v24;

    long long v75 = [v17 seasonSynonymsBySeason];
    long long v77 = [v17 synonymsByIndexCategoryMask];
    v74 = [v17 sceneTaxonomyProvider];
    id v25 = [PSIDate alloc];
    id v26 = [v14 dateCreated];
    id v27 = [v17 calendar];
    uint64_t v28 = [(PSIDate *)v25 initWithUniversalDate:v26 calendar:v27];

    uint64_t v29 = [PSIAsset alloc];
    id v30 = [v14 uuid];
    v71 = (void *)v28;
    id v31 = [(PSIAsset *)v29 initWithUUID:v30 creationDate:v28];

    [(PSIAsset *)v31 setPropertySets:a5];
    id v15 = v20;
    id v16 = v76;
    if (a5)
    {
      char v64 = a5;
      id v66 = v18;
      uint64_t v67 = v17;
      id v68 = v15;
      [a1 _appendGEODataToAsset:v31 forAsset:v14];
      [a1 _appendFilenameToAsset:v31 forAsset:v14];
      id v65 = a1;
      id v69 = v31;
      [a1 _appendSavedFromAppToAsset:v31 forAsset:v14];
      a5 = (unint64_t)v14;
      long long v32 = [v14 additionalAttributes];
      long long v33 = [v32 keywords];

      long long v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v33, "count"));
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id obj = v33;
      uint64_t v35 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v81 != v37) {
              objc_enumerationMutation(obj);
            }
            uint64_t v39 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            uint64_t v40 = PLBackendGetLog();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              id v41 = [(id)a5 uuid];
              *(_DWORD *)buf = 138412290;
              v86 = v41;
              _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "keyword for asset: %@", buf, 0xCu);
            }
            id v42 = [v39 title];
            [v34 addObject:v42];
          }
          uint64_t v36 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
        }
        while (v36);
      }

      a1 = v65;
      id v31 = v69;
      [v65 _appendKeywords:v34 toAsset:v69];
      id v43 = [v77 objectForKeyedSubscript:&unk_1EEBEE5E0];
      id v14 = (id)a5;
      id v15 = v68;
      [v65 _appendPersonsAndPetsToAsset:v69 withPersonSynonyms:v43 forAsset:a5 fetchHelper:v68];

      id v17 = v67;
      if ([v67 isSharedLibraryEnabled])
      {
        [v65 _appendLibraryScopeToAsset:v69 forAsset:a5];
        [v65 _appendContributorToAsset:v69 forAsset:a5];
      }
      [v65 _appendAssetTextDataToAsset:v69 forAsset:a5];
      [v65 _appendDateCreatedToAsset:v69 indexingContext:v67 withSynonyms:v75 forAsset:a5];
      [v65 _appendMediaTypesToAsset:v69 forAsset:a5];
      [v65 _appendFavoriteToAsset:v69 forAsset:a5];
      [v65 _appendExifDataToAsset:v69 forAsset:a5];
      [v65 _appendSceneClassificationsToAsset:v69 sceneTaxonomyProvider:v74 forAsset:a5 fetchHelper:v68];
      [v65 _appendAudioClassificationToAsset:v69 forAsset:a5];
      [v65 _appendHumanActionsToAsset:v69 forAsset:a5 fetchHelper:v68];
      [v65 _appendUtilityTypesToAsset:v69 forAsset:a5 indexingContext:v67];
      uint64_t v44 = [v67 csuTaxonomyObjectStore];
      id v45 = [v67 locale];
      long long v78 = (void *)v44;
      [v65 _appendPrivateEncryptedComputeScenes:v69 forAsset:a5 fetchHelper:v68 csuTaxonomyObjectStore:v44 locale:v45];

      [v65 _appendStickerSuggestionsToAsset:v69 fetchHelper:v68 sceneTaxonomyProvider:v74 forAsset:a5];
      id v16 = v76;
      LOBYTE(a5) = v64;
      if (_os_feature_enabled_impl())
      {
        id v46 = PLSearchBackendModelTranslationGetLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          double v47 = [v14 uuid];
          *(_DWORD *)buf = 138412290;
          v86 = v47;
          _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_DEBUG, "PSI using Graph data from photo library storage for asset: %@", buf, 0xCu);
        }
        [v65 _appendGraphDataToAsset:v69 forMomentFromFetchHelper:v68];
      }
      else if (v76)
      {
        id v50 = [v76 objectForKeyedSubscript:&unk_1EEBEE5F8];
        [v65 _appendSocialGroupIdentifiers:v50 toAsset:v69];

        long long v51 = [v76 objectForKeyedSubscript:&unk_1EEBEE610];
        [v65 _appendBusinessNames:v51 toAsset:v69];

        long long v52 = [v76 objectForKeyedSubscript:&unk_1EEBEE628];
        [v65 _appendBusinessCategories:v52 toAsset:v69];

        long long v53 = [v76 objectForKeyedSubscript:&unk_1EEBEE640];
        [v65 _appendPublicEventStrings:v53 toAsset:v69 forSearchIndexCategory:1800];

        long long v54 = [v76 objectForKeyedSubscript:&unk_1EEBEE658];
        [v65 _appendPublicEventStrings:v54 toAsset:v69 forSearchIndexCategory:1801];

        long long v55 = [v76 objectForKeyedSubscript:&unk_1EEBEE670];
        long long v56 = [v77 objectForKeyedSubscript:&unk_1EEBEE688];
        [v65 _appendPublicEventCategories:v55 withSynonyms:v56 toAsset:v69];

        long long v57 = [v76 objectForKeyedSubscript:&unk_1EEBEE6A0];
        id v31 = v69;
        long long v58 = [v77 objectForKeyedSubscript:&unk_1EEBEE6B8];
        [v65 _appendMeanings:v57 withSynonyms:v58 toAsset:v69];

        long long v59 = [v76 objectForKeyedSubscript:&unk_1EEBEE6D0];
        [v65 _appendHolidays:v59 toAsset:v69];

        long long v60 = [v76 objectForKeyedSubscript:&unk_1EEBEE6E8];
        [v65 _appendWorkText:v60 toAsset:v69];

        long long v61 = [v76 objectForKeyedSubscript:&unk_1EEBEE700];
        LODWORD(v58) = [v61 BOOLValue];

        if (v58) {
          [v65 _appendHomeToAsset:v69];
        }
      }

      id v18 = v66;
    }
    if ((a5 & 2) != 0) {
      [a1 _appendOCRTextForAsset:v31 documentObservation:v18];
    }
    long long v62 = v72;
    id v48 = v62;
    if (v73 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v62))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v48, OS_SIGNPOST_INTERVAL_END, spid, "PSIAssetTranslator: Asset translation time", "", buf, 2u);
    }
  }
  else
  {
    id v48 = PLSearchBackendModelTranslationGetLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      id v49 = [v14 uuid];
      *(_DWORD *)buf = 138543362;
      v86 = v49;
      _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_ERROR, "Invalid Asset UUID: %{public}@. Not inserting Asset into PSI.", buf, 0xCu);
    }
    id v31 = 0;
  }

  return v31;
}

+ (id)psiAssetFromAsset:(id)a3 graphData:(id)a4 indexingContext:(id)a5 documentObservation:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [PLSearchIndexingLazyFetchHelper alloc];
  id v14 = [v12 photoLibrary];
  id v15 = [v14 libraryServicesManager];
  uint64_t v16 = [v15 wellKnownPhotoLibraryIdentifier];
  id v17 = [v12 photoLibrary];
  id v18 = [v17 managedObjectContext];
  long long v19 = [(PLSearchIndexingLazyFetchHelper *)v13 initWithObject:v12 libraryIdentifier:v16 managedObjectContext:v18];

  id v20 = [a1 psiAssetFromAsset:v12 fetchHelper:v19 propertySets:3 graphData:v11 indexingContext:v10 documentObservation:v9];

  return v20;
}

@end