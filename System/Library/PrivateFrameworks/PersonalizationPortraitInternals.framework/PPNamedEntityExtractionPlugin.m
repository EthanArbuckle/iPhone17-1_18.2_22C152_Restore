@interface PPNamedEntityExtractionPlugin
+ (id)sharedInstance;
- (BOOL)_processUserActivity:(id)a3 extractionContainer:(id)a4 rawTextOut:(id *)a5 language:(id)a6;
- (PPNamedEntityExtractionPlugin)init;
- (PPNamedEntityExtractionPlugin)initWithNamedEntityDissector:(id)a3;
- (id)_entityContainersForContent:(id)a3 contentDataSource:(id)a4 isOutgoing:(BOOL)a5 contactHandles:(id)a6 uniqueIdentifier:(id)a7 domainIdentifier:(id)a8 bundleIdentifier:(id)a9;
- (id)_entityContainersForUserAction:(id)a3 searchableItem:(id)a4;
- (id)_extractionCountForContainers:(id)a3;
- (id)_extractionsFromEntityContainers:(id)a3;
- (id)consumeSearchableUserActivityWithContext:(id)a3;
- (id)consumeUserActivityMetadataWithContext:(id)a3;
- (id)consumerName;
- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3;
- (id)entityContainersForUserActivity:(id)a3;
- (void)_processCSSearchableItemLocationWithName:(id)a3 thoroughfare:(id)a4 city:(id)a5 state:(id)a6 country:(id)a7 postalCode:(id)a8 latitude:(id)a9 longitude:(id)a10 extractionContainer:(id)a11;
- (void)_writeAndFlushContainers:(id)a3;
@end

@implementation PPNamedEntityExtractionPlugin

- (id)deleteDataDerivedFromContentMatchingRequest:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F93758], "ignored", a3);
}

- (id)consumerName
{
  return @"com.apple.proactive.PersonalizationPortrait.NamedEntityExtractionPlugin";
}

- (void).cxx_destruct
{
}

- (id)entityContainersForUserActivity:(id)a3
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = +[PPHarvestingUtils appBlocklist];
  v5 = [v3 bundleId];
  int v6 = [v4 containsObject:v5];

  if (v6)
  {
    v7 = pp_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = [v3 bundleId];
      *(_DWORD *)buf = 138412290;
      v126 = v8;
      _os_log_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_INFO, "PPNamedEntityExtractionPlugin: entityContainersForUserActivity: blocking NSUA from %@", buf, 0xCu);
    }
    v9 = 0;
    goto LABEL_49;
  }
  v116 = v3;
  v7 = [v3 searchableItem];
  unsigned int v112 = [MEMORY[0x1E4F93790] searchableItemIsOutgoing:v7];
  v114 = objc_opt_new();
  v122 = objc_opt_new();
  v121 = +[PPHarvestingUtils contactHandlesForSearchableItem:v7];
  v10 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v11 = [v10 localeIdentifier];

  v12 = objc_opt_new();
  v13 = [v7 attributeSet];
  v14 = [v13 thoroughfare];
  BOOL v15 = isNontrivialString(v14);

  v117 = v12;
  if (v15)
  {
    v16 = [v7 attributeSet];
    v17 = [v16 thoroughfare];
    v115 = _PASCollapseWhitespaceAndStrip();

    v18 = [v7 attributeSet];
    v19 = [v18 subThoroughfare];
    if (isNontrivialString(v19))
    {
      v20 = [v7 attributeSet];
      v21 = [v20 subThoroughfare];
      uint64_t v22 = _PASCollapseWhitespaceAndStrip();

      v12 = v117;
    }
    else
    {
      uint64_t v22 = 0;
    }

    v109 = (void *)v22;
    v23 = +[PPNamedEntitySupport streetAddressFromThoroughfare:v115 subThoroughfare:v22];
    if (v23)
    {
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v23 category:8 language:v11];
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v24 score:1.0];
      [v12 addObject:v25];

      id v26 = v23;
    }
  }
  else
  {
    v23 = 0;
    v115 = 0;
    v109 = 0;
  }
  v27 = [v7 attributeSet];
  v28 = [v27 city];
  BOOL v29 = isNontrivialString(v28);

  if (v29)
  {
    v30 = [v7 attributeSet];
    v31 = [v30 city];
    uint64_t v32 = _PASCollapseWhitespaceAndStrip();

    v120 = (void *)v32;
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v32 category:9 language:v11];
    v34 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v33 score:1.0];
    [v12 addObject:v34];
  }
  else
  {
    v120 = 0;
  }
  v35 = [v7 attributeSet];
  v36 = [v35 stateOrProvince];
  BOOL v37 = isNontrivialString(v36);

  if (v37)
  {
    v38 = [v7 attributeSet];
    v39 = [v38 stateOrProvince];
    v119 = _PASCollapseWhitespaceAndStrip();
  }
  else
  {
    v119 = 0;
  }
  v40 = [v7 attributeSet];
  v41 = [v40 postalCode];
  BOOL v42 = isNontrivialString(v41);

  if (v42)
  {
    v43 = [v7 attributeSet];
    v44 = [v43 postalCode];
    v118 = _PASCollapseWhitespaceAndStrip();
  }
  else
  {
    v118 = 0;
  }
  v45 = [v7 attributeSet];
  v46 = [v45 country];
  BOOL v47 = isNontrivialString(v46);

  if (v47)
  {
    v48 = [v7 attributeSet];
    v49 = [v48 country];
    uint64_t v50 = _PASCollapseWhitespaceAndStrip();

    v51 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v50 category:11 language:v11];
    v52 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v51 score:1.0];
    [v12 addObject:v52];
  }
  else
  {
    uint64_t v50 = 0;
  }
  v113 = v23;
  v111 = (void *)v50;
  v53 = +[PPNamedEntitySupport fullAddressForStreetAddress:v23 city:v120 state:v119 postalCode:v118 country:v50];
  if (v53)
  {
    v54 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v53 category:12 language:v11];
    v55 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v54 score:1.0];
    [v12 addObject:v55];
  }
  v56 = objc_opt_new();
  [v56 setEntities:v12];
  v108 = v53;
  uint64_t v57 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89F48]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, objc_msgSend(v53, "length"), 0, (unsigned __int16)objc_msgSend(v121, "count"), v112);
  id v58 = objc_alloc(MEMORY[0x1E4F89F40]);
  v59 = [v3 bundleId];
  v60 = [v3 domainId];
  v61 = [v3 uniqueId];
  v107 = (void *)v57;
  v62 = (void *)[v58 initWithBundleId:v59 groupId:v60 documentId:v61 date:v122 relevanceDate:0 contactHandles:v121 language:v11 metadata:v57];
  [v56 setSource:v62];

  [v56 setEntityAlgorithm:5];
  [v56 setCloudSync:0];
  [v56 setDecayRate:*MEMORY[0x1E4F8A1A8]];
  v63 = [v3 userActivity];
  id v124 = 0;
  v110 = (void *)v11;
  [(PPNamedEntityExtractionPlugin *)self _processUserActivity:v63 extractionContainer:v56 rawTextOut:&v124 language:v11];
  id v64 = v124;

  v65 = [v7 attributeSet];
  v66 = [v65 title];

  v67 = [v7 attributeSet];
  v68 = [v67 namedLocation];

  v69 = objc_opt_new();
  if ([v64 length]) {
    [v69 addObject:v64];
  }
  if ([v66 length]) {
    [v69 addObject:v66];
  }
  v105 = v66;
  v106 = v64;
  v70 = v117;
  if ([v68 length]) {
    [v69 addObject:v68];
  }
  v103 = v69;
  v104 = v68;
  v71 = objc_msgSend(v69, "_pas_componentsJoinedByString:", @"\n\n");
  v72 = pp_default_log_handle();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    v73 = [v7 uniqueIdentifier];
    uint64_t v74 = [v71 length];
    *(_DWORD *)buf = 138412546;
    v126 = v73;
    __int16 v127 = 2048;
    uint64_t v128 = v74;
    _os_log_impl(&dword_1CA9A8000, v72, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin: entityContainersForUserActivity: %@: text content length: %tu", buf, 0x16u);
  }
  if ([v71 length])
  {
    v75 = +[PPConfiguration sharedInstance];
    char v76 = [v75 isMultilingual];

    if (v76)
    {
      v77 = (void *)MEMORY[0x1E4F89D60];
      v78 = [MEMORY[0x1E4F89FC8] preferredLanguages];
      v79 = [v77 detectLanguageFromTextHeuristicallyWithLanguages:v71 languages:v78 defaultLanguage:0];

      v80 = (void *)MEMORY[0x1E4F1CA20];
      if (v79)
      {
        int v81 = 0;
        v82 = v79;
LABEL_41:
        v83 = [v80 componentsFromLocaleIdentifier:v82];
        v84 = [v83 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

        if (v81)
        {
        }
        v85 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89F48]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, objc_msgSend(v71, "length"), 0, (unsigned __int16)objc_msgSend(v121, "count"), v112);
        id v86 = objc_alloc(MEMORY[0x1E4F89F40]);
        v87 = [v116 bundleId];
        v88 = [v116 domainId];
        v89 = [v116 uniqueId];
        v90 = (void *)[v86 initWithBundleId:v87 groupId:v88 documentId:v89 date:v122 relevanceDate:0 contactHandles:v121 language:v84 metadata:v85];

        v91 = +[PPConfiguration sharedInstance];
        v92 = [v7 bundleID];
        v93 = [v91 extractionAlgorithmsForBundleId:v92 sourceLanguage:v84 conservative:1 domain:1];

        v94 = [(PPNamedEntityDissector *)self->_dissector entitiesInPlainText:v71 eligibleRegions:0 source:v90 cloudSync:1 algorithms:v93];
        v95 = pp_default_log_handle();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v126 = v94;
          _os_log_impl(&dword_1CA9A8000, v95, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin: entityContainersForUserActivity: text extractions: %@ ", buf, 0xCu);
        }

        [v114 addObjectsFromArray:v94];
        id v3 = v116;
        v70 = v117;
        v23 = v113;
        goto LABEL_46;
      }
    }
    else
    {
      v80 = (void *)MEMORY[0x1E4F1CA20];
    }
    v70 = [v80 currentLocale];
    v82 = [v70 languageCode];
    v79 = 0;
    int v81 = 1;
    goto LABEL_41;
  }
LABEL_46:
  v96 = [v7 attributeSet];
  v97 = [v96 namedLocation];

  if (isNontrivialString(v97))
  {
    v98 = [v7 attributeSet];
    v99 = [v98 latitude];
    v100 = [v7 attributeSet];
    v101 = [v100 longitude];
    [(PPNamedEntityExtractionPlugin *)self _processCSSearchableItemLocationWithName:v97 thoroughfare:v115 city:v120 state:v119 country:v111 postalCode:v118 latitude:v99 longitude:v101 extractionContainer:v56];

    v70 = v117;
  }

  v9 = v114;
  [v114 addObject:v56];

LABEL_49:
  return v9;
}

- (id)_entityContainersForUserAction:(id)a3 searchableItem:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = pp_default_log_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 bundleID];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin received user action from %@", buf, 0xCu);
  }
  v10 = [v7 uniqueIdentifier];
  uint64_t v11 = [v7 attributeSet];
  v12 = [v11 relatedUniqueIdentifier];

  if (v12)
  {
    v13 = pp_default_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "Replacing NSUA uniqueIdentifier: %@ with relatedUniqueIdentifier: %@", buf, 0x16u);
    }

    id v14 = v12;
    v10 = v14;
  }
  BOOL v15 = [v7 bundleID];
  if (v15) {
    BOOL v16 = v10 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  int v17 = v16;

  if (v17)
  {
    v18 = pp_default_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEBUG, "PPNamedEntityExtractionPlugin suppressing NSUA with missing fields", buf, 2u);
    }
    v19 = 0;
  }
  else
  {
    dispatch_semaphore_t v20 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v34 = __Block_byref_object_copy__8041;
    v35 = __Block_byref_object_dispose__8042;
    id v36 = 0;
    v21 = (void *)MEMORY[0x1E4F22488];
    uint64_t v22 = [v6 uaIdentifier];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    BOOL v29 = __79__PPNamedEntityExtractionPlugin__entityContainersForUserAction_searchableItem___block_invoke;
    v30 = &unk_1E65D6920;
    uint64_t v32 = buf;
    v18 = v20;
    v31 = v18;
    id v23 = (id)[v21 _fetchUserActivityWithUUID:v22 intervalToWaitForDocumentSynchronizationToComplete:&v27 completionHandler:5.0];

    objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:", v18, v27, v28, v29, v30);
    id v24 = objc_alloc(MEMORY[0x1E4F93798]);
    v25 = (void *)[v24 initWithUserActivity:*(void *)(*(void *)&buf[8] + 40) searchableItem:v7];
    v19 = [(PPNamedEntityExtractionPlugin *)self entityContainersForUserActivity:v25];

    _Block_object_dispose(buf, 8);
  }

  return v19;
}

void __79__PPNamedEntityExtractionPlugin__entityContainersForUserAction_searchableItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = pp_default_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "PPNamedEntityExtractionPlugin failed to fetch user activity: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_processCSSearchableItemLocationWithName:(id)a3 thoroughfare:(id)a4 city:(id)a5 state:(id)a6 country:(id)a7 postalCode:(id)a8 latitude:(id)a9 longitude:(id)a10 extractionContainer:(id)a11
{
  int v17 = (void *)MEMORY[0x1E4F89E68];
  id v18 = a11;
  id v21 = [v17 placemarkWithLatitudeDegrees:a9 longitudeDegrees:a10 name:a3 thoroughfare:a4 subthoroughFare:0 locality:a5 subLocality:0 administrativeArea:a6 subAdministrativeArea:0 postalCode:a8 countryCode:0 country:a7 inlandWater:0 ocean:0 areasOfInterest:0];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F89E48]) initWithPlacemark:v21 category:0 mostRelevantRecord:0];
  dispatch_semaphore_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F89F10]) initWithLocation:v19 score:1.0 sentimentScore:0.0];
  [v18 addLocation:v20 algorithm:5];
}

- (BOOL)_processUserActivity:(id)a3 extractionContainer:(id)a4 rawTextOut:(id *)a5 language:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v9)
  {
    v12 = [v9 _payloadForIdentifier:@"UAMKMapItemPayload"];
    if (v12)
    {
      id v63 = 0;
      v13 = [MEMORY[0x1E4F28F98] propertyListWithData:v12 options:0 format:0 error:&v63];
      id v14 = v63;
      BOOL v15 = v13 != 0;
      if (v13)
      {
        id v58 = v13;
        BOOL v16 = +[PPLocalLocationStore locationFromMapItemDictionary:v13];
        if (v16)
        {
          int v17 = (void *)[objc_alloc(MEMORY[0x1E4F89F10]) initWithLocation:v16 score:1.0 sentimentScore:0.0];
          [v10 addLocation:v17 algorithm:5];
        }
        v60 = v14;
        v61 = v12;
        id v62 = v9;
        id v18 = [v16 placemark];
        v19 = [v18 name];

        if ([v19 length])
        {
          dispatch_semaphore_t v20 = pp_default_log_handle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138739971;
            v65 = v19;
            _os_log_debug_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEBUG, "PPNamedEntityExtractionPlugin found location name from MapItem data in NSUA: %{sensitive}@", buf, 0xCu);
          }
          id v21 = v16;

          if (a5) {
            *a5 = v19;
          }
          uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v19 category:3 language:v11];
          id v23 = (void *)MEMORY[0x1CB79D060]();
          id v24 = [v10 entities];
          v25 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v22 score:1.0];
          id v26 = [v24 arrayByAddingObject:v25];

          [v10 setEntities:v26];

          BOOL v16 = v21;
        }
        v55 = v19;
        BOOL v59 = v15;
        uint64_t v27 = [v16 placemark];
        uint64_t v28 = [v27 thoroughfare];
        BOOL v29 = [v16 placemark];
        v30 = [v29 subThoroughfare];
        uint64_t v31 = +[PPNamedEntitySupport streetAddressFromThoroughfare:v28 subThoroughfare:v30];

        v54 = [v16 placemark];
        uint64_t v32 = [v54 locality];
        v33 = [v16 placemark];
        v34 = [v33 administrativeArea];
        [v16 placemark];
        id v57 = v11;
        id v36 = v35 = v10;
        uint64_t v37 = [v36 postalCode];
        v56 = v16;
        v38 = v16;
        v39 = (void *)v31;
        v40 = [v38 placemark];
        v41 = [v40 country];
        BOOL v42 = +[PPNamedEntitySupport fullAddressForStreetAddress:v39 city:v32 state:v34 postalCode:v37 country:v41];

        id v10 = v35;
        id v11 = v57;

        if ([v42 length])
        {
          v43 = (void *)MEMORY[0x1CB79D060]();
          v44 = pp_default_log_handle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138739971;
            v65 = v42;
            _os_log_debug_impl(&dword_1CA9A8000, v44, OS_LOG_TYPE_DEBUG, "PPNamedEntityExtractionPlugin found street address in NSUA: %{sensitive}@", buf, 0xCu);
          }

          v45 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v42 category:12 language:v57];
          v46 = [v10 entities];
          BOOL v47 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v45 score:1.0];
          v48 = [v46 arrayByAddingObject:v47];
          [v10 setEntities:v48];
        }

        v12 = v61;
        id v9 = v62;
        id v14 = v60;
        BOOL v15 = v59;
        v13 = v58;
        v49 = v56;
      }
      else
      {
        v49 = pp_default_log_handle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v14;
          _os_log_impl(&dword_1CA9A8000, v49, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin failed to deserialize MKMapItem dict: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v14 = pp_default_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v50 = [v9 _uniqueIdentifier];
        [v50 UUIDString];
        v52 = id v51 = v10;
        *(_DWORD *)buf = 138412290;
        v65 = v52;
        _os_log_impl(&dword_1CA9A8000, v14, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin found no MKMapItem in NSUA %@.", buf, 0xCu);

        id v10 = v51;
      }
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)_extractionsFromEntityContainers:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "entities", (void)v25);

        if (v12)
        {
          v13 = [v11 entities];
          id v14 = [v11 source];
          BOOL v15 = +[PPLocalNamedEntityStore recordsForNamedEntities:source:algorithm:](PPLocalNamedEntityStore, "recordsForNamedEntities:source:algorithm:", v13, v14, [v11 entityAlgorithm]);
          [v4 addObjectsFromArray:v15];
        }
        BOOL v16 = [v11 topics];

        if (v16)
        {
          int v17 = [v11 topics];
          id v18 = [v11 source];
          v19 = +[PPLocalTopicStore recordsForTopics:source:algorithm:](PPLocalTopicStore, "recordsForTopics:source:algorithm:", v17, v18, [v11 topicAlgorithm]);
          [v5 addObjectsFromArray:v19];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  id v20 = objc_alloc(MEMORY[0x1E4F89E20]);
  if ([v4 count]) {
    id v21 = v4;
  }
  else {
    id v21 = 0;
  }
  if (objc_msgSend(v5, "count", (void)v25)) {
    uint64_t v22 = v5;
  }
  else {
    uint64_t v22 = 0;
  }
  id v23 = (void *)[v20 initWithNamedEntityRecords:v21 topicRecords:v22];

  return v23;
}

- (id)_entityContainersForContent:(id)a3 contentDataSource:(id)a4 isOutgoing:(BOOL)a5 contactHandles:(id)a6 uniqueIdentifier:(id)a7 domainIdentifier:(id)a8 bundleIdentifier:(id)a9
{
  BOOL v42 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v45 = a4;
  id v14 = a9;
  id v43 = a8;
  id v15 = a7;
  id v16 = a6;
  unint64_t v17 = [v13 length];
  if (v17 >= 0xC8000) {
    uint64_t v18 = 819200;
  }
  else {
    uint64_t v18 = v17;
  }
  v19 = pp_default_log_handle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v48 = v18;
    _os_log_impl(&dword_1CA9A8000, v19, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin processing text content of length: %tu", buf, 0xCu);
  }

  id v20 = +[PPConfiguration sharedInstance];
  char v21 = [v20 isMultilingual];

  v46 = v13;
  if (v21)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F89D60];
    id v23 = [MEMORY[0x1E4F89FC8] preferredLanguages];
    id v24 = [v22 detectLanguageFromTextHeuristicallyWithLanguages:v13 languages:v23 defaultLanguage:0];

    long long v25 = (void *)MEMORY[0x1E4F1CA20];
    if (v24)
    {
      int v26 = 0;
      long long v27 = v24;
      goto LABEL_11;
    }
  }
  else
  {
    long long v25 = (void *)MEMORY[0x1E4F1CA20];
  }
  id v23 = [v25 currentLocale];
  long long v27 = [v23 languageCode];
  id v24 = 0;
  int v26 = 1;
LABEL_11:
  long long v28 = [v25 componentsFromLocaleIdentifier:v27];
  BOOL v29 = [v28 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  if (v26)
  {
  }
  uint64_t v30 = v18;
  uint64_t v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89F48]), "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, v18, 0, (unsigned __int16)objc_msgSend(v16, "count"), v42);
  id v32 = objc_alloc(MEMORY[0x1E4F89F40]);
  v33 = objc_opt_new();
  v34 = (void *)[v32 initWithBundleId:v14 groupId:v43 documentId:v15 date:v33 relevanceDate:0 contactHandles:v16 language:v29 metadata:v31];

  id v35 = +[PPConfiguration sharedInstance];
  id v36 = [v35 extractionAlgorithmsForBundleId:v14 sourceLanguage:v29 conservative:0 domain:1];
  uint64_t v37 = (void *)[v36 mutableCopy];

  LODWORD(v35) = [(id)*MEMORY[0x1E4F937E8] isEqualToString:v14];
  if (v35 && (!v45 || ([v45 isEqualToString:*MEMORY[0x1E4F937F8]] & 1) == 0)) {
    [v37 removeObject:&unk_1F2568DE0];
  }
  dissector = self->_dissector;
  v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, v30);
  v40 = [(PPNamedEntityDissector *)dissector entitiesInPlainText:v46 eligibleRegions:v39 source:v34 cloudSync:1 algorithms:v37];

  return v40;
}

- (id)_extractionCountForContainers:(id)a3
{
  id v3 = &unk_1F2568DC8;
  v4 = objc_msgSend(a3, "_pas_leftFoldWithInitialObject:accumulate:", &unk_1F2568DC8, &__block_literal_global_89_8064);
  v5 = v4;
  if (v4) {
    id v3 = v4;
  }

  return v3;
}

id __63__PPNamedEntityExtractionPlugin__extractionCountForContainers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  LODWORD(a2) = [a2 intValue];
  id v6 = [v5 numberOfExtractions];

  uint64_t v7 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v6, "intValue") + a2);

  return v7;
}

- (void)_writeAndFlushContainers:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7++) writeSynchronous];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "flushWrites", (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (id)consumeSearchableUserActivityWithContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = pp_default_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 content];
    int v16 = 138412546;
    uint64_t v17 = (uint64_t)v4;
    __int16 v18 = 2112;
    long long v19 = v6;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin: consumeSearchableUserActivityWithContext: %@: %@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v7 = [v4 content];
  id v8 = [(PPNamedEntityExtractionPlugin *)self entityContainersForUserActivity:v7];
  uint64_t v9 = pp_default_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v8 count];
    uint64_t v11 = [v7 uniqueId];
    int v16 = 134218242;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    long long v19 = v11;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin: consumeSearchableUserActivityWithContext: got %tu containers from %@", (uint8_t *)&v16, 0x16u);
  }
  if (v8) {
    [(PPNamedEntityExtractionPlugin *)self _writeAndFlushContainers:v8];
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F93758];
  long long v13 = [(PPNamedEntityExtractionPlugin *)self _extractionCountForContainers:v8];
  long long v14 = [v12 successWithNumberOfExtractions:v13];

  return v14;
}

- (id)consumeUserActivityMetadataWithContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = pp_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 content];
    int v8 = 138412546;
    id v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1CA9A8000, v4, OS_LOG_TYPE_DEFAULT, "PPNamedEntityExtractionPlugin: consumeUserActivityMetadataWithContext: %@: %@ - ignoring until 74452163.", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v6 = [MEMORY[0x1E4F93758] successWithNumberOfExtractions:&unk_1F2568DC8];

  return v6;
}

- (PPNamedEntityExtractionPlugin)init
{
  id v3 = +[PPNamedEntityDissector sharedInstance];
  id v4 = [(PPNamedEntityExtractionPlugin *)self initWithNamedEntityDissector:v3];

  return v4;
}

- (PPNamedEntityExtractionPlugin)initWithNamedEntityDissector:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPNamedEntityExtractionPlugin;
  uint64_t v6 = [(PPNamedEntityExtractionPlugin *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dissector, a3);
    int v8 = [MEMORY[0x1E4F93750] defaultCoordinator];
    [v8 registerUserActivityConsumer:v7 levelOfService:4];
  }
  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_8083 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_8083, &__block_literal_global_8084);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_8085;
  return v2;
}

void __47__PPNamedEntityExtractionPlugin_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_8085;
  sharedInstance__pasExprOnceResult_8085 = v1;
}

@end