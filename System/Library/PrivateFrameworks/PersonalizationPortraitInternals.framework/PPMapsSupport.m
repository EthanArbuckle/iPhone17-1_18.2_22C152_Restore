@interface PPMapsSupport
+ (BOOL)harvestMapItem:(id)a3 documentIdentifier:(id)a4 groupIdentifier:(id)a5 includingPostalAddress:(BOOL)a6 localNamedEntityStore:(id)a7 localLocationStore:(id)a8 error:(id *)a9;
+ (void)importMapsDataWithCollectionRequest:(id)a3 localNamedEntityStore:(id)a4 localLocationStore:(id)a5 shouldContinueBlock:(id)a6;
+ (void)importMapsDataWithFavoriteRequest:(id)a3 localNamedEntityStore:(id)a4 localLocationStore:(id)a5 shouldContinueBlock:(id)a6;
+ (void)importMapsDataWithShouldContinueBlock:(id)a3;
@end

@implementation PPMapsSupport

+ (BOOL)harvestMapItem:(id)a3 documentIdentifier:(id)a4 groupIdentifier:(id)a5 includingPostalAddress:(BOOL)a6 localNamedEntityStore:(id)a7 localLocationStore:(id)a8 error:(id *)a9
{
  BOOL v81 = a6;
  v94[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v18 = pp_default_log_handle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v87 = (uint64_t)v14;
    __int16 v88 = 2112;
    id v89 = v15;
    __int16 v90 = 1024;
    LODWORD(v91) = v81;
    _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: harvesting map item for document: %@ group: %@ includingPostalAddress:%d", buf, 0x1Cu);
  }

  v19 = +[PPConfiguration sharedInstance];
  uint64_t v20 = *MEMORY[0x1E4F8A0A0];
  v21 = [v19 extractionAlgorithmsForBundleId:*MEMORY[0x1E4F8A0A0] sourceLanguage:0 conservative:0 domain:1];

  v22 = +[PPConfiguration sharedInstance];
  v23 = [v22 extractionAlgorithmsForBundleId:v20 sourceLanguage:0 conservative:0 domain:2];

  v79 = v21;
  int v24 = [v21 containsObject:&unk_1F2569878];
  int v25 = [v23 containsObject:&unk_1F2569890];
  v82 = v13;
  if (v24 & 1) != 0 || (v25)
  {
    int v73 = v25;
    v74 = [v13 geoAddress];
    v29 = [v74 structuredAddress];
    v80 = objc_opt_new();
    id v76 = v14;
    id v77 = v16;
    id v75 = v17;
    v78 = v29;
    if (v81)
    {
      if ([v29 hasThoroughfare])
      {
        id v30 = objc_alloc(MEMORY[0x1E4F89E90]);
        v31 = [v78 thoroughfare];
        v32 = [MEMORY[0x1E4F1CA20] currentLocale];
        v33 = [v32 languageCode];
        v34 = (void *)[v30 initWithName:v31 category:8 language:v33];

        id v14 = v76;
        id v16 = v77;
        v35 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v34 score:0.5];
        [v80 addObject:v35];

        v29 = v78;
      }
      if ([v29 hasLocality])
      {
        id v36 = objc_alloc(MEMORY[0x1E4F89E90]);
        v37 = [v78 locality];
        v38 = [MEMORY[0x1E4F1CA20] currentLocale];
        v39 = [v38 languageCode];
        v40 = (void *)[v36 initWithName:v37 category:9 language:v39];

        id v14 = v76;
        id v16 = v77;

        v41 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v40 score:0.5];
        [v80 addObject:v41];

        v29 = v78;
      }
    }
    if ([v29 hasAdministrativeArea])
    {
      id v42 = objc_alloc(MEMORY[0x1E4F89E90]);
      v43 = [v78 administrativeArea];
      v44 = [MEMORY[0x1E4F1CA20] currentLocale];
      v45 = [v44 languageCode];
      v46 = (void *)[v42 initWithName:v43 category:10 language:v45];

      id v14 = v76;
      id v16 = v77;

      v47 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v46 score:0.5];
      [v80 addObject:v47];
    }
    v48 = [v13 name];

    if (v48)
    {
      id v49 = objc_alloc(MEMORY[0x1E4F89E90]);
      v50 = [v13 name];
      v51 = [MEMORY[0x1E4F1CA20] currentLocale];
      v52 = [v51 languageCode];
      v53 = (void *)[v49 initWithName:v50 category:3 language:v52];

      id v14 = v76;
      id v16 = v77;

      v54 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v53 score:0.5];
      [v80 addObject:v54];
    }
    if (![v80 count])
    {
      v57 = pp_default_log_handle();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v87 = (uint64_t)v14;
        __int16 v88 = 2112;
        id v89 = v15;
        __int16 v90 = 1024;
        LODWORD(v91) = v81;
        _os_log_impl(&dword_1CA9A8000, v57, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: harvested 0 entities from map item for document: %@ group: %@ includingPostalAddress:%d", buf, 0x1Cu);
      }
      BOOL v27 = 1;
      id v17 = v75;
      v28 = v79;
      v26 = v74;
      goto LABEL_48;
    }
    id v55 = objc_alloc(MEMORY[0x1E4F89F40]);
    v56 = objc_opt_new();
    v57 = [v55 initWithBundleId:v20 groupId:v15 documentId:v14 date:v56];

    if (v24)
    {
      id v85 = 0;
      char v58 = [v16 donateNamedEntities:v80 source:v57 algorithm:7 cloudSync:1 sentimentScore:&v85 error:0.0];
      id v59 = v85;
      id v60 = v59;
      id v17 = v75;
      if ((v58 & 1) == 0)
      {
        v63 = pp_default_log_handle();
        v26 = v74;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v87 = (uint64_t)v60;
          _os_log_error_impl(&dword_1CA9A8000, v63, OS_LOG_TYPE_ERROR, "PPMapsSupport failed to donate Maps interaction structured location to PPLocalNamedEntityStore: %@", buf, 0xCu);
        }
        BOOL v27 = 0;
        goto LABEL_47;
      }
      v61 = v59;
    }
    else
    {
      v62 = pp_default_log_handle();
      id v17 = v75;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v62, OS_LOG_TYPE_DEBUG, "PPMapsSupport: Not donating events from maps interaction because it is disabled.", buf, 2u);
      }

      v61 = 0;
    }
    if (v73)
    {
      v63 = +[PPLocalLocationStore locationFromMapItem:v82];
      v64 = (void *)[objc_alloc(MEMORY[0x1E4F89F10]) initWithLocation:v63 score:1.0 sentimentScore:0.0];
      v94[0] = v64;
      v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:1];
      id v84 = v61;
      char v66 = [v17 donateLocations:v65 source:v57 contextualNamedEntities:0 algorithm:7 cloudSync:1 error:&v84];
      id v60 = v84;

      if ((v66 & 1) == 0)
      {
        v71 = pp_default_log_handle();
        id v16 = v77;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v87 = (uint64_t)v60;
          _os_log_error_impl(&dword_1CA9A8000, v71, OS_LOG_TYPE_ERROR, "PPMapsSupport failed to donate Maps interaction structured location to PPLocalLocationStore: %@", buf, 0xCu);
        }

        BOOL v27 = 0;
        id v17 = v75;
        goto LABEL_46;
      }

      id v16 = v77;
      id v17 = v75;
    }
    else
    {
      v63 = pp_default_log_handle();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA9A8000, v63, OS_LOG_TYPE_DEBUG, "PPMapsSupport: not donating locations from maps interaction because it is disabled.", buf, 2u);
      }
      id v60 = v61;
      id v16 = v77;
    }

    id v83 = 0;
    char v67 = [v16 flushDonationsWithError:&v83];
    v63 = v83;
    if ((v67 & 1) == 0)
    {
      v68 = pp_default_log_handle();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v87 = (uint64_t)v63;
        _os_log_impl(&dword_1CA9A8000, v68, OS_LOG_TYPE_DEFAULT, "PPMapsSupport warning: failed to flush named entities: %@", buf, 0xCu);
      }
    }
    v69 = pp_default_log_handle();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v70 = [v80 count];
      *(_DWORD *)buf = 134218754;
      uint64_t v87 = v70;
      __int16 v88 = 2112;
      id v89 = v14;
      __int16 v90 = 2112;
      id v91 = v15;
      __int16 v92 = 1024;
      BOOL v93 = v81;
      _os_log_impl(&dword_1CA9A8000, v69, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: completed harvesting %lu entities from map item for document: %@ group: %@ includingPostalAddress:%d", buf, 0x26u);
    }

    BOOL v27 = 1;
LABEL_46:
    v26 = v74;
LABEL_47:

    v28 = v79;
LABEL_48:

    goto LABEL_49;
  }
  v26 = pp_default_log_handle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v26, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: Maps Interaction blocked for both named entities and locations, skipping.", buf, 2u);
  }
  BOOL v27 = 1;
  v28 = v79;
LABEL_49:

  return v27;
}

+ (void)importMapsDataWithFavoriteRequest:(id)a3 localNamedEntityStore:(id)a4 localLocationStore:(id)a5 shouldContinueBlock:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  id v13 = pp_default_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: harvesting Maps Favorite Items", buf, 2u);
  }

  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __112__PPMapsSupport_importMapsDataWithFavoriteRequest_localNamedEntityStore_localLocationStore_shouldContinueBlock___block_invoke;
  v22 = &unk_1E65D9B90;
  id v23 = v9;
  id v24 = v10;
  dispatch_semaphore_t v25 = v14;
  id v26 = v11;
  id v15 = v14;
  id v16 = v10;
  id v17 = v9;
  id v18 = v11;
  [v12 fetchWithCompletionHandler:&v19];

  objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:", v15, v19, v20, v21, v22);
}

void __112__PPMapsSupport_importMapsDataWithFavoriteRequest_localNamedEntityStore_localLocationStore_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v19 = a3;
  v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = [v5 count];
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: MSFavoriteItemRequest fetchContents called with %tu places", buf, 0xCu);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    uint64_t v10 = *MEMORY[0x1E4F8A148];
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
      if (((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))() & 1) == 0) {
        break;
      }
      id v13 = [v12 identifier];
      dispatch_semaphore_t v14 = [v13 UUIDString];
      BOOL v15 = v14 == 0;

      if (v15)
      {
        id v16 = pp_default_log_handle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: MSFavoriteItemRequest item missing storage identifier", buf, 2u);
        }
      }
      else
      {
        id v16 = [v12 mapItemStorage];
        if (v16)
        {
          id v17 = [v12 identifier];
          id v18 = [v17 UUIDString];
          +[PPMapsSupport harvestMapItem:documentIdentifier:groupIdentifier:includingPostalAddress:localNamedEntityStore:localLocationStore:error:](PPMapsSupport, "harvestMapItem:documentIdentifier:groupIdentifier:includingPostalAddress:localNamedEntityStore:localLocationStore:error:", v16, v18, v10, 1, *(void *)(a1 + 32), *(void *)(a1 + 40), 0, v19, (void)v20);
        }
        else
        {
          id v17 = pp_default_log_handle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: MSFavoriteItemRequest item missing map item", buf, 2u);
          }
        }
      }
      if (v8 == ++v11)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

+ (void)importMapsDataWithCollectionRequest:(id)a3 localNamedEntityStore:(id)a4 localLocationStore:(id)a5 shouldContinueBlock:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = a3;
  id v13 = pp_default_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: harvesting Maps Collections", buf, 2u);
  }

  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  long long v21 = __114__PPMapsSupport_importMapsDataWithCollectionRequest_localNamedEntityStore_localLocationStore_shouldContinueBlock___block_invoke;
  long long v22 = &unk_1E65D9B90;
  id v23 = v9;
  id v24 = v10;
  dispatch_semaphore_t v25 = v14;
  id v26 = v11;
  BOOL v15 = v14;
  id v16 = v10;
  id v17 = v9;
  id v18 = v11;
  [v12 fetchWithCompletionHandler:&v19];

  objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:", v15, v19, v20, v21, v22);
}

void __114__PPMapsSupport_importMapsDataWithCollectionRequest_localNamedEntityStore_localLocationStore_shouldContinueBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v19 = a3;
  v6 = pp_default_log_handle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v26 = [v5 count];
    _os_log_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: MSCollectionPlaceItemRequest fetchContents called with %tu locations", buf, 0xCu);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    uint64_t v10 = *MEMORY[0x1E4F8A140];
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
      if (((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))() & 1) == 0) {
        break;
      }
      id v13 = [v12 identifier];
      dispatch_semaphore_t v14 = [v13 UUIDString];
      BOOL v15 = v14 == 0;

      if (v15)
      {
        id v16 = pp_default_log_handle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA9A8000, v16, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: MSCollectionPlaceItemRequest item missing storage identifier", buf, 2u);
        }
      }
      else
      {
        id v16 = [v12 mapItemStorage];
        if (v16)
        {
          id v17 = [v12 identifier];
          id v18 = [v17 UUIDString];
          +[PPMapsSupport harvestMapItem:documentIdentifier:groupIdentifier:includingPostalAddress:localNamedEntityStore:localLocationStore:error:](PPMapsSupport, "harvestMapItem:documentIdentifier:groupIdentifier:includingPostalAddress:localNamedEntityStore:localLocationStore:error:", v16, v18, v10, 1, *(void *)(a1 + 32), *(void *)(a1 + 40), 0, v19, (void)v20);
        }
        else
        {
          id v17 = pp_default_log_handle();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CA9A8000, v17, OS_LOG_TYPE_DEFAULT, "PPMapsSupport: MSCollectionPlaceItemRequest item missing map item", buf, 2u);
          }
        }
      }
      if (v8 == ++v11)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

+ (void)importMapsDataWithShouldContinueBlock:(id)a3
{
  v3 = (unsigned int (**)(void))a3;
  if (((unsigned int (*)(void))v3[2])())
  {
    v4 = +[PPSettings sharedInstance];
    char v5 = [v4 bundleIdentifierIsEnabledForDonation:*MEMORY[0x1E4F8A0A0]];

    if ((v5 & 1) == 0)
    {
      id v12 = pp_default_log_handle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v13 = "skipping Maps import due to settings";
        dispatch_semaphore_t v14 = buf;
        goto LABEL_9;
      }
LABEL_10:

      goto LABEL_11;
    }
    if (v3[2](v3))
    {
      v6 = objc_opt_new();
      id v7 = +[PPLocalNamedEntityStore defaultStore];
      uint64_t v8 = +[PPLocalLocationStore defaultStore];
      +[PPMapsSupport importMapsDataWithCollectionRequest:v6 localNamedEntityStore:v7 localLocationStore:v8 shouldContinueBlock:v3];

      if (v3[2](v3))
      {
        uint64_t v9 = objc_opt_new();
        uint64_t v10 = +[PPLocalNamedEntityStore defaultStore];
        uint64_t v11 = +[PPLocalLocationStore defaultStore];
        +[PPMapsSupport importMapsDataWithFavoriteRequest:v9 localNamedEntityStore:v10 localLocationStore:v11 shouldContinueBlock:v3];

        id v12 = pp_default_log_handle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v15 = 0;
          id v13 = "PPMapsSupport: Maps import complete";
          dispatch_semaphore_t v14 = (uint8_t *)&v15;
LABEL_9:
          _os_log_impl(&dword_1CA9A8000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
  }
LABEL_11:
}

@end