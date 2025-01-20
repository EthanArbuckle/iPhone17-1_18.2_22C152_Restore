@interface _PSFamilyPhotoSuggestions
+ (BOOL)_allowRelationship:(int64_t)a3;
+ (id)fetchVerifiedPersonsForFamilyPhotoSuggestionsModel;
+ (id)photosContactsKnowledgeSuggestions;
+ (id)photosRelationshipKnowledgeSuggestions;
+ (void)fetchVerifiedPersonsForFamilyPhotoSuggestionsModel;
+ (void)photosContactsKnowledgeSuggestions;
+ (void)photosRelationshipKnowledgeSuggestions;
@end

@implementation _PSFamilyPhotoSuggestions

+ (id)photosContactsKnowledgeSuggestions
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v29 = [(id)objc_opt_class() fetchVerifiedPersonsForFamilyPhotoSuggestionsModel];
  v2 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[_PSFamilyPhotoSuggestions photosContactsKnowledgeSuggestions].cold.5(v2);
  }

  v3 = objc_opt_new();
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  v4 = (void *)getGDViewServiceClass_softClass;
  uint64_t v38 = getGDViewServiceClass_softClass;
  if (!getGDViewServiceClass_softClass)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = __getGDViewServiceClass_block_invoke;
    v43 = &unk_1E5ADE858;
    v44 = &v35;
    __getGDViewServiceClass_block_invoke((uint64_t)&v40);
    v4 = (void *)v36[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v35, 8);
  v6 = [v5 clientService];
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  v7 = (void **)getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr;
  uint64_t v38 = getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr;
  if (!getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr)
  {
    uint64_t v40 = MEMORY[0x1E4F143A8];
    uint64_t v41 = 3221225472;
    v42 = __getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_block_invoke;
    v43 = &unk_1E5ADE858;
    v44 = &v35;
    v8 = (void *)IntelligencePlatformLibrary();
    v9 = dlsym(v8, "GDAutonamingViewPhotosAutonamingViewName");
    *(void *)(v44[1] + 24) = v9;
    getGDAutonamingViewPhotosAutonamingViewNameSymbolLoc_ptr = *(void *)(v44[1] + 24);
    v7 = (void **)v36[3];
  }
  _Block_object_dispose(&v35, 8);
  if (!v7)
  {
    -[_PSBlockedHandlesCache beginSyncingWithTU]();
    __break(1u);
  }
  v10 = *v7;
  id v34 = 0;
  id v11 = v10;
  v12 = [v6 autonamingViewWithViewName:v11 error:&v34];
  id v28 = v34;

  if (v12)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v13 = v29;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v31 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v18 = objc_msgSend(v17, "localIdentifier", v28);
          v19 = [v12 personForIdentifier:v18];

          if (!v19
            || ([v19 contactIdentifier],
                v20 = objc_claimAutoreleasedReturnValue(),
                BOOL v21 = v20 == 0,
                v20,
                v21))
          {
            v22 = +[_PSLogging familyRecommenderChannel];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              +[_PSFamilyPhotoSuggestions photosContactsKnowledgeSuggestions];
            }
          }
          else
          {
            v22 = [v19 contactIdentifier];
            [v3 addObject:v22];
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v14);
    }

    v23 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      +[_PSFamilyPhotoSuggestions photosContactsKnowledgeSuggestions](v3);
    }

    id v24 = v3;
  }
  else
  {
    if (v28)
    {
      v25 = +[_PSLogging familyRecommenderChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        +[_PSFamilyPhotoSuggestions photosContactsKnowledgeSuggestions]();
      }
    }
    id v24 = (id)objc_opt_new();
  }
  v26 = v24;

  return v26;
}

+ (id)photosRelationshipKnowledgeSuggestions
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(id)objc_opt_class() fetchVerifiedPersonsForFamilyPhotoSuggestionsModel];
  v4 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[_PSFamilyPhotoSuggestions photosRelationshipKnowledgeSuggestions](v4);
  }

  id v5 = [getPHPersonClass() batchFetchRelationshipInferencesForPersons:v3];
  v6 = objc_opt_new();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __67___PSFamilyPhotoSuggestions_photosRelationshipKnowledgeSuggestions__block_invoke;
  v22[3] = &unk_1E5AE1218;
  id v24 = a1;
  id v7 = v6;
  id v23 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v22];
  v8 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[_PSFamilyPhotoSuggestions photosRelationshipKnowledgeSuggestions](v7);
  }

  v9 = objc_opt_new();
  v10 = [getPHPersonClass() fetchPersonsWithLocalIdentifiers:v7 options:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) personUri];
        if (v15) {
          [v9 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v12);
  }
  v16 = +[_PSLogging familyRecommenderChannel];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    +[_PSFamilyPhotoSuggestions photosRelationshipKnowledgeSuggestions](v9);
  }

  return v9;
}

+ (id)fetchVerifiedPersonsForFamilyPhotoSuggestionsModel
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v2 = (void *)getPHPhotoLibraryClass_softClass_0;
  uint64_t v13 = getPHPhotoLibraryClass_softClass_0;
  if (!getPHPhotoLibraryClass_softClass_0)
  {
    PhotosLibraryCore_0();
    v11[3] = (uint64_t)objc_getClass("PHPhotoLibrary");
    getPHPhotoLibraryClass_softClass_0 = v11[3];
    v2 = (void *)v11[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v10, 8);
  v4 = [v3 sharedPhotoLibrary];
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 librarySpecificFetchOptions];
    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"verifiedType = %@ OR verifiedType = %@", &unk_1EF675AB0, &unk_1EF675AC8];
    [v6 setPredicate:v7];

    [v6 setShouldPrefetchCount:1];
    [v6 setFetchLimit:100];
    v8 = [getPHPersonClass() fetchPersonsWithOptions:v6];
  }
  else
  {
    v6 = +[_PSLogging familyRecommenderChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      +[_PSFamilyPhotoSuggestions fetchVerifiedPersonsForFamilyPhotoSuggestionsModel](v6);
    }
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_allowRelationship:(int64_t)a3
{
  return ((unint64_t)a3 > 0xD) | (0x7FEu >> a3) & 1;
}

+ (void)photosContactsKnowledgeSuggestions
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "Fetching contacts inferences from Megadome", v1, 2u);
}

+ (void)photosRelationshipKnowledgeSuggestions
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "Fetching family inferences from Photos", v1, 2u);
}

+ (void)fetchVerifiedPersonsForFamilyPhotoSuggestionsModel
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A314B000, log, OS_LOG_TYPE_FAULT, "Photo library is nil. Will fail to suggest family suggestions from Photos framework", v1, 2u);
}

@end