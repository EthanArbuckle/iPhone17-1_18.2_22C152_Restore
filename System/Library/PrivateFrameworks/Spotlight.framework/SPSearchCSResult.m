@interface SPSearchCSResult
- (BOOL)doesQueryMatchContentForLowEngagementBundle:(id)a3 queryContext:(id)a4;
- (SPResultValueItem2_s)clientData;
- (SPSearchCSResult)initWithRankingItem:(id)a3 clientData:(SPResultValueItem2_s *)a4;
- (SPSearchCSResult)resultWithTime:(double)a3 searchString:(id)a4 isCorrectedQuery:(BOOL)a5 withQueryContext:(id)a6;
- (id)makeApplicationResult:(id)a3 dataclass:(id)a4 score:;
- (void)clearClientData;
- (void)dealloc;
- (void)populateAttributesForResult:(id)a3 withValues:(id)a4;
@end

@implementation SPSearchCSResult

- (SPSearchCSResult)initWithRankingItem:(id)a3 clientData:(SPResultValueItem2_s *)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SPSearchCSResult;
  result = -[SPSearchResult initWithRankingItem:](&v12, sel_initWithRankingItem_, a3, a4, a5, *(void *)&a7, a9, a10, a6);
  if (result)
  {
    atomic_fetch_add(&a4->var0, 1u);
    result->_clientData = a4;
  }
  return result;
}

- (void)clearClientData
{
  clientData = self->_clientData;
  if (clientData)
  {
    sprvreleaseCallback((uint64_t)self, (CFTypeRef *)clientData);
    self->_clientData = 0;
  }
}

- (SPResultValueItem2_s)clientData
{
  return self->_clientData;
}

- (void)dealloc
{
  clientData = self->_clientData;
  if (clientData) {
    sprvreleaseCallback((uint64_t)self, (CFTypeRef *)clientData);
  }
  v4.receiver = self;
  v4.super_class = (Class)SPSearchCSResult;
  [(SPSearchCSResult *)&v4 dealloc];
}

- (id)makeApplicationResult:(id)a3 dataclass:(id)a4 score:
{
  uint64_t v65 = v5;
  uint64_t v6 = v4;
  v69[1] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  v10 = SPFastApplicationsGetNoBuild();
  v11 = [v9 attributeSet];

  objc_super v12 = [v11 attributeDictionary];
  uint64_t v64 = *MEMORY[0x263F02938];
  v13 = objc_msgSend(v12, "objectForKey:");
  v14 = [v10 objectForKeyedSubscript:v13];
  if (!v14)
  {
    if (([v13 isEqualToString:@"com.apple.TVRemoteUIService"] & 1) == 0)
    {
      if (v10
        || (SPCopyVisibleApps(),
            v49 = objc_claimAutoreleasedReturnValue(),
            int v50 = [v49 containsObject:v13],
            v49,
            !v50))
      {
        id v15 = 0;
        goto LABEL_39;
      }
    }
    uint64_t v62 = v6;
    uint64_t v58 = *MEMORY[0x263F01E20];
    objc_msgSend(v12, "objectForKey:");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = objc_alloc_init(MEMORY[0x263F67490]);
    [v29 setIdentifier:v13];
    v30 = [v12 objectForKey:*MEMORY[0x263F02010]];
    id v31 = objc_alloc_init(MEMORY[0x263F67A90]);
    id v32 = v31;
    if (v30) {
      [v31 setText:v30];
    }
    v60 = v32;
    [v29 setTitle:v32];
    uint64_t v33 = [v12 objectForKey:*MEMORY[0x263F02878]];
    v59 = (void *)v33;
    if (v33)
    {
      v34 = [MEMORY[0x263F679F0] textWithString:v33];
      v66 = v34;
      [MEMORY[0x263EFF8C0] arrayWithObjects:&v66 count:1];
      v35 = v30;
      v36 = v12;
      v37 = v13;
      v38 = v10;
      v39 = v11;
      v41 = id v40 = v8;
      [v29 setDescriptions:v41];

      id v8 = v40;
      v11 = v39;
      v10 = v38;
      v13 = v37;
      objc_super v12 = v36;
      v30 = v35;
      v14 = 0;
    }
    [v29 setSectionBundleIdentifier:v15];
    id v63 = v8;
    if ([v15 isEqualToString:*MEMORY[0x263F78E80]])
    {
      [v29 setBundleID:*MEMORY[0x263F674E0]];
      [v29 setType:22];
      id v42 = objc_alloc(MEMORY[0x263F677A0]);
      v43 = [v29 identifier];
      [v42 setBundleIdentifier:v43];

      [v29 setThumbnail:v42];
      v44 = [v12 objectForKey:*MEMORY[0x263F02790]];
      [v29 setApplicationBundleIdentifier:v44];
    }
    else
    {
      v51 = [v12 objectForKey:*MEMORY[0x263F024A8]];

      uint64_t v52 = v64;
      if (v51)
      {
        [v29 setType:24];
        uint64_t v52 = v58;
      }
      v53 = [v12 objectForKey:v52];
      [v29 setApplicationBundleIdentifier:v53];

      v54 = [v12 objectForKey:v64];
      [v29 setExternalIdentifier:v54];

      v55 = [v29 applicationBundleIdentifier];
      [v29 setBundleID:v55];

      id v42 = [v29 externalIdentifier];
      [v29 setResultBundleId:v42];
    }

    objc_msgSend(v29, "setScore:", v62, v65);
    id v8 = v63;
    [v29 setProtectionClass:v63];
    [v29 setIsLocalApplicationResult:1];
    v56 = [v29 applicationBundleIdentifier];

    if (!v56)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v68 = v29;
        _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "No applicationBundleIdentifier for %@", buf, 0xCu);
      }

      id v29 = 0;
    }

    goto LABEL_38;
  }
  id v15 = objc_alloc_init(MEMORY[0x263F67490]);
  [v14 copyToSearchFoundationResult:v15];
  v16 = [v15 compatibilityTitle];

  if (!v16)
  {
    v17 = [v12 objectForKey:*MEMORY[0x263F02010]];
    [v15 title];
    v19 = id v18 = v8;
    [v19 setText:v17];

    id v8 = v18;
  }
  v20 = [v14 subtitle];

  if (!v20)
  {
    v21 = [v12 objectForKey:*MEMORY[0x263F02878]];
    if (v21)
    {
      [MEMORY[0x263F679F0] textWithString:v21];
      v61 = v13;
      v22 = v10;
      v23 = v11;
      v25 = id v24 = v8;
      v69[0] = v25;
      v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:1];
      [v15 setDescriptions:v26];

      id v8 = v24;
      v11 = v23;
      v10 = v22;
      v13 = v61;
    }
  }
  if ([v14 isWebClip]) {
    [v15 setType:24];
  }
  if ([v14 isAppClip])
  {
    [v15 setSectionBundleIdentifier:*MEMORY[0x263F78E80]];
    [v15 setBundleID:*MEMORY[0x263F674E0]];
    [v15 setType:22];
    id v27 = objc_alloc(MEMORY[0x263F677A0]);
    v28 = [v15 identifier];
    [v27 setBundleIdentifier:v28];

    [v15 setThumbnail:v27];
  }
  else
  {
    [v15 setSectionBundleIdentifier:*MEMORY[0x263F78E88]];
    if ([v14 isWebClip]) {
      uint64_t v45 = *MEMORY[0x263F01E20];
    }
    else {
      uint64_t v45 = v64;
    }
    v46 = [v12 objectForKey:v45];
    [v15 setApplicationBundleIdentifier:v46];

    v47 = [v12 objectForKey:v64];
    [v15 setExternalIdentifier:v47];

    id v27 = [v15 applicationBundleIdentifier];
    [v15 setBundleID:v27];
  }

  objc_msgSend(v15, "setScore:", v6, v65);
  [v15 setProtectionClass:v8];
  [v15 setIsLocalApplicationResult:1];
  v48 = [v15 applicationBundleIdentifier];

  if (!v48)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v68 = v15;
      _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "No applicationBundleIdentifier for %@", buf, 0xCu);
    }
    id v29 = 0;
LABEL_38:

    id v15 = v29;
  }
LABEL_39:

  return v15;
}

- (BOOL)doesQueryMatchContentForLowEngagementBundle:(id)a3 queryContext:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [a3 attributeSet];
  v7 = [v6 attributeDictionary];
  id v8 = [v7 objectForKey:*MEMORY[0x263F02010]];
  if (!v8)
  {
    id v8 = [v7 objectForKey:*MEMORY[0x263F02920]];
  }
  id v9 = [v5 normalizedSearchString];
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  id v40 = v8;
  if (v10)
  {
    BOOL v11 = 0;
  }
  else
  {
    objc_super v12 = v9;
    if ((unint64_t)[v9 length] >= 4)
    {
      v13 = [v8 lowercaseString];
      v14 = SSNormalizedQueryString();

      id v36 = v12;
      id v15 = [v12 componentsSeparatedByString:@" "];
      v35 = v14;
      uint64_t v45 = [v14 componentsSeparatedByString:@" "];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v16 = v15;
      uint64_t v44 = [v16 countByEnumeratingWithState:&v54 objects:v59 count:16];
      if (v44)
      {
        uint64_t v17 = 0;
        unint64_t v18 = 0;
        int v41 = 0;
        uint64_t v42 = *(void *)v55;
        v43 = v16;
        v38 = v6;
        id v39 = v5;
        v37 = v7;
        while (2)
        {
          uint64_t v19 = 0;
          do
          {
            uint64_t v48 = v17;
            if (*(void *)v55 != v42) {
              objc_enumerationMutation(v16);
            }
            unint64_t v49 = v18;
            uint64_t v47 = v19;
            v20 = *(void **)(*((void *)&v54 + 1) + 8 * v19);
            uint64_t v46 = [v20 length];
            long long v50 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v21 = v45;
            uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v58 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              char v24 = 0;
              uint64_t v25 = *(void *)v51;
              unint64_t v26 = 0x7FFFFFFFLL;
              while (2)
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v51 != v25) {
                    objc_enumerationMutation(v21);
                  }
                  v28 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                  if ([v28 localizedStandardRangeOfString:v20] != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    uint64_t v30 = v29;
                    uint64_t v31 = [v28 length];
                    unint64_t v32 = [v28 length];
                    unint64_t v33 = v32;
                    if (v30 == v31)
                    {

                      unint64_t v26 = v33;
                      id v16 = v43;
                      goto LABEL_36;
                    }
                    if (v32 < v26) {
                      unint64_t v26 = [v28 length];
                    }
                    char v24 = 1;
                  }
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v50 objects:v58 count:16];
                if (v23) {
                  continue;
                }
                break;
              }
            }
            else
            {
              char v24 = 0;
              unint64_t v26 = 0x7FFFFFFFLL;
            }

            id v16 = v43;
            if ((v24 & 1) == 0
              || v41 > 0
              || (unint64_t)[v20 length] <= 3 && 3 * v26 > 4 * objc_msgSend(v20, "length"))
            {

              BOOL v11 = 0;
              uint64_t v6 = v38;
              id v5 = v39;
              v7 = v37;
              goto LABEL_43;
            }
            int v41 = 1;
LABEL_36:
            unint64_t v18 = v46 + v49;
            uint64_t v17 = v26 + v48;
            uint64_t v19 = v47 + 1;
          }
          while (v47 + 1 != v44);
          uint64_t v6 = v38;
          id v5 = v39;
          v7 = v37;
          uint64_t v44 = [v16 countByEnumeratingWithState:&v54 objects:v59 count:16];
          if (v44) {
            continue;
          }
          break;
        }

        if (v18 > 3)
        {
          BOOL v11 = 1;
          goto LABEL_43;
        }
      }
      else
      {

        unint64_t v18 = 0;
        uint64_t v17 = 0;
      }
      BOOL v11 = 3 * v17 <= 4 * v18;
LABEL_43:

      id v9 = v36;
    }
    else
    {
      BOOL v11 = 0;
      id v9 = v12;
    }
  }

  return v11;
}

- (SPSearchCSResult)resultWithTime:(double)a3 searchString:(id)a4 isCorrectedQuery:(BOOL)a5 withQueryContext:(id)a6
{
  BOOL v7 = a5;
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  objc_super v12 = [v11 disabledApps];
  v13 = (void *)[v12 count];
  if (v13)
  {
    v13 = [MEMORY[0x263EFFA08] setWithArray:v12];
  }
  clientData = self->_clientData;
  if (!clientData)
  {
    id v36 = 0;
    goto LABEL_79;
  }
  BOOL v85 = v7;
  id v88 = v13;
  id v90 = v10;
  id v91 = *(id *)&clientData[16].var0;
  v87 = [v91 attributeSet];
  id v15 = [v87 attributeDictionary];
  id v16 = [v15 objectForKey:*MEMORY[0x263F01E20]];
  v89 = [v15 objectForKey:*MEMORY[0x263F02790]];
  uint64_t v84 = *MEMORY[0x263F01F98];
  v93 = objc_msgSend(v15, "objectForKey:");
  v86 = [v15 objectForKey:*MEMORY[0x263F02670]];
  uint64_t v83 = *MEMORY[0x263F01F60];
  uint64_t v17 = objc_msgSend(v15, "objectForKey:");
  [v17 timeIntervalSinceReferenceDate];
  double v19 = v18;
  v20 = [v15 objectForKey:*MEMORY[0x263F01F80]];
  [v20 timeIntervalSinceReferenceDate];
  double v22 = v21;
  uint64_t v23 = [v15 objectForKey:*MEMORY[0x263F01D78]];
  [v23 timeIntervalSinceReferenceDate];
  v92 = v16;
  if ((v19 >= a3 || a3 - v19 >= 18000.0) && (v22 >= a3 || a3 - v22 >= 18000.0) && (v24 >= a3 || a3 - v24 >= 18000.0))
  {

    if (([v16 isEqualToString:*MEMORY[0x263F674E0]] & 1) != 0
      || ([v16 isEqualToString:*MEMORY[0x263F674D8]] & 1) != 0
      || ([v16 isEqualToString:@"com.apple.MobileAddressBook"] & 1) != 0)
    {
      int v27 = 0;
    }
    else
    {
      v76 = [v15 objectForKey:*MEMORY[0x263F024E0]];
      v77 = v76;
      int v27 = (int)v90;
      if (v90)
      {
        if ([v76 hasPrefix:v90])
        {
          if ([v77 isEqualToString:v90]) {
            int v27 = 2;
          }
          else {
            int v27 = 1;
          }
        }
        else
        {
          int v27 = 0;
        }
      }
    }
  }
  else
  {
    uint64_t v25 = SPLogForSPLogCategoryQuery();
    os_log_type_t v26 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v25, v26))
    {
      *(_DWORD *)buf = 138412290;
      v95 = @"Very recently created/modified";
      _os_log_impl(&dword_235D0B000, v25, v26, "%@", buf, 0xCu);
    }

    int v27 = 1;
    id v16 = v92;
  }
  if ([v93 isEqualToString:*MEMORY[0x263F67528]]
    && (([v16 isEqualToString:*MEMORY[0x263F674E0]] & 1) != 0
     || [v16 isEqualToString:*MEMORY[0x263F674D8]])
    && (-[SPSearchCSResult makeApplicationResult:dataclass:score:](self, "makeApplicationResult:dataclass:score:", v91, *(void *)&self->_clientData[8].var0, *(void *)&self->_clientData[4].var0, *(void *)&self->_clientData[6].var0), (v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v29 = v28;
    uint64_t v30 = [v28 applicationBundleIdentifier];
    int v31 = [v88 containsObject:v30];

    unint64_t v32 = SPLogForSPLogCategoryDefault();
    os_log_type_t v33 = 2 * (*MEMORY[0x263F67540] == 0);
    BOOL v34 = os_log_type_enabled(v32, v33);
    if (v31)
    {
      if (v34)
      {
        v35 = [v29 applicationBundleIdentifier];
        *(_DWORD *)buf = 138412290;
        v95 = v35;
        _os_log_impl(&dword_235D0B000, v32, v33, "disabledAppSet contains  %@", buf, 0xCu);
      }
      id v36 = 0;
      v37 = v91;
      goto LABEL_77;
    }
    if (v34)
    {
      uint64_t v70 = [v29 score];
      [v29 score];
      *(_DWORD *)buf = 134218240;
      v95 = (__CFString *)v70;
      __int16 v96 = 2048;
      v97 = v71;
      _os_log_impl(&dword_235D0B000, v32, v33, "Result score: 0x%08llx 0x%08llx", buf, 0x16u);
    }
    int v38 = 0;
  }
  else
  {
    unint64_t v32 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_235D0B000, v32, OS_LOG_TYPE_DEFAULT, "*warn* Couldn't determine score for nil result", buf, 2u);
    }
    uint64_t v29 = 0;
    int v38 = 1;
  }

  if (v27 > (int)[v29 topHit]) {
    [v29 setTopHit:SSSetTopHitWithReasonString()];
  }
  id v39 = v92;
  if ([v93 isEqualToString:@"public.calendar-event"])
  {
    id v40 = [v29 title];
    int v41 = [v40 text];
    [v29 setCompletedQuery:v41];
  }
  if (!v38)
  {
    uint64_t v45 = [v29 compatibilityTitle];
    if (v45) {
      goto LABEL_41;
    }
    uint64_t v45 = [v29 bundleID];
    if ([v45 isEqualToString:*MEMORY[0x263F79060]]) {
      goto LABEL_41;
    }
    uint64_t v46 = [v29 sectionBundleIdentifier];
    if (SSSectionIsSyndicatedPhotos())
    {
LABEL_40:

LABEL_41:
      goto LABEL_42;
    }
    uint64_t v47 = [v11 queryKind];
    id v48 = [v11 clientBundleID];
    if (SPQueryKindIsSearchToolSearch_onceToken_0 != -1) {
      dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken_0, &__block_literal_global_10);
    }
    if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode_0)
    {
LABEL_39:

      id v39 = v92;
      goto LABEL_40;
    }
    if (SPQueryKindIsSearchToolSearch_isSearchToolRanking_0)
    {
      if (([v48 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
        || ([v48 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
      {
        goto LABEL_39;
      }
      char v78 = [v48 hasPrefix:@"com.apple.ondeviceeval"];

      id v39 = v92;
      if (v47 == 12 || (v78 & 1) != 0)
      {
LABEL_42:
        [v29 setUserInput:v90];
        if (![v29 type])
        {
          unint64_t v49 = [v15 objectForKey:*MEMORY[0x263F02960]];
          if (v49) {
            uint64_t v50 = 4;
          }
          else {
            uint64_t v50 = 2;
          }
          [v29 setType:v50];
        }
        long long v51 = [v15 objectForKey:*MEMORY[0x263F024E0]];
        [v29 setLaunchString:v51];

        [v29 setRelatedBundleID:v89];
        [v29 setRelatedAppIdentifier:v89];
        long long v52 = [v15 objectForKey:*MEMORY[0x263F02750]];
        [v29 setLaunchDates:v52];

        long long v53 = [v15 objectForKey:*MEMORY[0x263F02738]];
        [v29 setItemProviderDataTypes:v53];

        long long v54 = [v15 objectForKey:*MEMORY[0x263F02740]];
        [v29 setItemProviderFileTypes:v54];

        if ([v39 isEqualToString:*MEMORY[0x263F79128]]
          || ([v39 hasPrefix:@"com.apple"] & 1) == 0
          && [MEMORY[0x263F78DF0] isLowEngagementBundle:v39])
        {
          [v29 setHasTextContentMatch:[(SPSearchCSResult *)self doesQueryMatchContentForLowEngagementBundle:v91 queryContext:v11]];
        }
        else if (([v39 isEqualToString:*MEMORY[0x263F79058]] & 1) == 0 {
               && ([v39 isEqualToString:*MEMORY[0x263F79030]] & 1) == 0)
        }
        {
          long long v55 = [v15 objectForKeyedSubscript:*MEMORY[0x263F02A20]];
          [v29 setHasTextContentMatch:BOOLValueForAttr(v55)];
        }
        uint64_t v56 = [v29 contentType];
        if (!v56
          || (long long v57 = (void *)v56,
              [v29 contentTypeTree],
              uint64_t v58 = objc_claimAutoreleasedReturnValue(),
              v58,
              v57,
              !v58))
        {
          v59 = [v15 objectForKey:v84];
          [v29 setContentType:v59];

          uint64_t v60 = [v15 objectForKey:*MEMORY[0x263F01FA0]];
          [v29 setContentTypeTree:v60];
        }
        v61 = [v15 objectForKey:*MEMORY[0x263F01FF8]];
        -[NSObject setDataOwnerType:](v29, "setDataOwnerType:", [v61 integerValue]);
        uint64_t v62 = [v29 contentCreationDate];

        if (!v62)
        {
          id v63 = [v15 objectForKey:v83];
          [v29 setContentCreationDate:v63];
        }
        if (v85)
        {
          uint64_t v64 = [v11 searchString];
          [v29 setCorrectedQuery:v64];
        }
        uint64_t v65 = [(SPSearchResult *)self rankingItem];
        -[NSObject setQueryId:](v29, "setQueryId:", [v11 queryIdent]);
        v66 = [v29 sectionBundleIdentifier];
        if ([v66 isEqualToString:*MEMORY[0x263F78E88]])
        {
        }
        else
        {
          v67 = [v29 sectionBundleIdentifier];
          int v68 = [v67 isEqualToString:*MEMORY[0x263F78E80]];

          if (!v68)
          {
LABEL_76:
            [v29 setRankingItem:v65];
            [v65 score];
            -[NSObject setL2score:](v29, "setL2score:");
            v72 = [v11 answerAttributes];
            v73 = (void *)[v72 copy];
            [v29 setAnswerAttributes:v73];

            v74 = [v15 objectForKey:*MEMORY[0x263F02398]];
            [v29 setHasAppTopHitShortcut:BOOLValueForAttr(v74)];

            v37 = v91;
            [(SPSearchCSResult *)self populateAttributesForResult:v29 withValues:v91];
            uint64_t v29 = v29;

            id v36 = v29;
LABEL_77:
            uint64_t v44 = v87;
            id v39 = v92;
            goto LABEL_78;
          }
        }
        if (([v65 didMatchRankingDescriptor:*MEMORY[0x263F78EE0]] & 1) != 0
          || ([v65 didMatchRankingDescriptor:*MEMORY[0x263F79008]] & 1) != 0)
        {
          uint64_t v69 = 0;
        }
        else
        {
          uint64_t v69 = [v65 didMatchRankingDescriptor:*MEMORY[0x263F78EC0]];
        }
        [v29 setIsStaticCorrection:v69];
        goto LABEL_76;
      }
    }
    else
    {

      id v39 = v92;
    }
    v79 = SPLogForSPLogCategoryDefault();
    os_log_type_t v80 = *MEMORY[0x263F67548] ^ 1;
    if (os_log_type_enabled(v79, v80))
    {
      v81 = [v29 identifier];
      v82 = [v29 bundleID];
      *(_DWORD *)buf = 138412546;
      v95 = v81;
      __int16 v96 = 2112;
      v97 = v82;
      _os_log_impl(&dword_235D0B000, v79, v80, "No title for CoreSpotlight result, identifier:%@, bundleID:%@", buf, 0x16u);
    }
    goto LABEL_31;
  }
  uint64_t v29 = SPLogForSPLogCategoryDefault();
  os_log_type_t v42 = *MEMORY[0x263F67548] ^ 1;
  if (os_log_type_enabled(v29, v42))
  {
    v43 = [v15 objectForKey:*MEMORY[0x263F02938]];
    *(_DWORD *)buf = 138412546;
    v95 = v43;
    __int16 v96 = 2112;
    v97 = v92;
    _os_log_impl(&dword_235D0B000, v29, v42, "No result object for CoreSpotlight result, identifier:%@, bundleID:%@", buf, 0x16u);
  }
LABEL_31:
  id v36 = 0;
  v37 = v91;
  uint64_t v44 = v87;
LABEL_78:

  id v10 = v90;
  v13 = v88;
LABEL_79:

  return (SPSearchCSResult *)v36;
}

- (void)populateAttributesForResult:(id)a3 withValues:(id)a4
{
  v280[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v178 = [v6 attributeSet];
  BOOL v7 = [v178 attributeDictionary];
  uint64_t v177 = *MEMORY[0x263F02458];
  id v8 = objc_msgSend(v7, "objectForKeyedSubscript:");
  unsigned int v155 = BOOLValueForAttr(v8);

  uint64_t v174 = *MEMORY[0x263F01E10];
  id v9 = objc_msgSend(v7, "objectForKeyedSubscript:");
  unsigned int v154 = BOOLValueForAttr(v9);

  uint64_t v156 = *MEMORY[0x263F02348];
  id v10 = objc_msgSend(v7, "objectForKey:");
  if (v10)
  {
    id v11 = v10;
    objc_super v12 = NSNumber;
    [v10 doubleValue];
    uint64_t v14 = [v12 numberWithDouble:v13 * 1000000.0];
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v144 = *MEMORY[0x263F01D08];
  v277 = objc_msgSend(v7, "objectForKey:");
  uint64_t v141 = *MEMORY[0x263F01D20];
  v276 = objc_msgSend(v7, "objectForKey:");
  uint64_t v146 = *MEMORY[0x263F01D58];
  v275 = objc_msgSend(v7, "objectForKey:");
  uint64_t v151 = *MEMORY[0x263F01D90];
  v274 = objc_msgSend(v7, "objectForKey:");
  uint64_t v149 = *MEMORY[0x263F01D98];
  v273 = objc_msgSend(v7, "objectForKey:");
  uint64_t v153 = *MEMORY[0x263F01DB0];
  uint64_t v15 = objc_msgSend(v7, "objectForKey:");
  uint64_t v150 = *MEMORY[0x263F01DB8];
  v271 = objc_msgSend(v7, "objectForKey:");
  uint64_t v148 = *MEMORY[0x263F01DC0];
  v270 = objc_msgSend(v7, "objectForKey:");
  uint64_t v152 = *MEMORY[0x263F01DE0];
  v269 = objc_msgSend(v7, "objectForKey:");
  uint64_t v143 = *MEMORY[0x263F01DD0];
  v268 = objc_msgSend(v7, "objectForKey:");
  uint64_t v147 = *MEMORY[0x263F01DD8];
  v267 = objc_msgSend(v7, "objectForKey:");
  uint64_t v145 = *MEMORY[0x263F01DE8];
  v266 = objc_msgSend(v7, "objectForKey:");
  uint64_t v142 = *MEMORY[0x263F01E00];
  v265 = objc_msgSend(v7, "objectForKey:");
  uint64_t v172 = *MEMORY[0x263F02658];
  uint64_t v16 = objc_msgSend(v7, "objectForKey:");
  uint64_t v173 = *MEMORY[0x263F028B0];
  uint64_t v17 = objc_msgSend(v7, "objectForKeyedSubscript:");
  unsigned int v164 = BOOLValueForAttr(v17);

  uint64_t v171 = *MEMORY[0x263F026A8];
  uint64_t v18 = objc_msgSend(v7, "objectForKey:");
  uint64_t v170 = *MEMORY[0x263F026B0];
  v262 = objc_msgSend(v7, "objectForKey:");
  uint64_t v169 = *MEMORY[0x263F026B8];
  v261 = objc_msgSend(v7, "objectForKey:");
  uint64_t v176 = *MEMORY[0x263F026C0];
  v260 = objc_msgSend(v7, "objectForKey:");
  uint64_t v175 = *MEMORY[0x263F026F0];
  v259 = objc_msgSend(v7, "objectForKey:");
  uint64_t v165 = *MEMORY[0x263F026E8];
  v258 = objc_msgSend(v7, "objectForKey:");
  uint64_t v163 = *MEMORY[0x263F026D8];
  v257 = objc_msgSend(v7, "objectForKey:");
  uint64_t v160 = *MEMORY[0x263F026E0];
  v256 = objc_msgSend(v7, "objectForKey:");
  uint64_t v159 = *MEMORY[0x263F026D0];
  v255 = objc_msgSend(v7, "objectForKey:");
  uint64_t v161 = *MEMORY[0x263F02038];
  v254 = objc_msgSend(v7, "objectForKey:");
  uint64_t v162 = *MEMORY[0x263F02710];
  v253 = objc_msgSend(v7, "objectForKey:");
  uint64_t v168 = *MEMORY[0x263F02780];
  v252 = objc_msgSend(v7, "objectForKey:");
  uint64_t v167 = *MEMORY[0x263F02770];
  v251 = objc_msgSend(v7, "objectForKey:");
  uint64_t v166 = *MEMORY[0x263F02798];
  v250 = objc_msgSend(v7, "objectForKey:");
  double v19 = [v6 attributeSet];

  v20 = [v19 attributeDictionary];
  double v21 = [v20 objectForKey:*MEMORY[0x263F02A28]];
  double v22 = v21;
  v272 = (void *)v15;
  v263 = (void *)v18;
  v264 = (void *)v16;
  if (!v21)
  {
    v249 = 0;
    goto LABEL_19;
  }
  if ([v21 count])
  {
    uint64_t v23 = [v22 objectAtIndex:0];
    if (v23)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (([v23 isEqualToString:@"kMDItemTextContent"] & 1) != 0
          || (unint64_t)[v22 count] <= 1)
        {
          goto LABEL_17;
        }
LABEL_14:
        uint64_t v24 = v14;
        uint64_t v25 = [v22 objectAtIndex:1];
        if (!v25)
        {
          v249 = 0;
LABEL_40:
          uint64_t v14 = v24;
          goto LABEL_18;
        }
        os_log_type_t v26 = (void *)v25;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = v26;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v249 = 0;
            goto LABEL_39;
          }
          v280[0] = v26;
          id v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v280 count:1];
        }
        v249 = v27;
LABEL_39:

        goto LABEL_40;
      }
      if ((unint64_t)[v22 count] >= 2) {
        goto LABEL_14;
      }
    }
  }
  else
  {
    uint64_t v23 = 0;
  }
LABEL_17:
  v249 = 0;
LABEL_18:

LABEL_19:
  v278 = (void *)v14;

  uint64_t v139 = *MEMORY[0x263F027C8];
  v248 = objc_msgSend(v7, "objectForKey:");
  uint64_t v138 = *MEMORY[0x263F027F0];
  v246 = objc_msgSend(v7, "objectForKey:");
  uint64_t v137 = *MEMORY[0x263F027E8];
  v247 = objc_msgSend(v7, "objectForKey:");
  uint64_t v140 = *MEMORY[0x263F02950];
  v211 = objc_msgSend(v7, "objectForKey:");
  uint64_t v136 = *MEMORY[0x263F02800];
  v245 = objc_msgSend(v7, "objectForKey:");
  uint64_t v135 = *MEMORY[0x263F027D8];
  v244 = objc_msgSend(v7, "objectForKey:");
  uint64_t v134 = *MEMORY[0x263F027F8];
  v243 = objc_msgSend(v7, "objectForKey:");
  uint64_t v133 = *MEMORY[0x263F027D0];
  v242 = objc_msgSend(v7, "objectForKey:");
  uint64_t v132 = *MEMORY[0x263F02808];
  v241 = objc_msgSend(v7, "objectForKey:");
  uint64_t v131 = *MEMORY[0x263F02818];
  v240 = objc_msgSend(v7, "objectForKey:");
  uint64_t v130 = *MEMORY[0x263F02810];
  v239 = objc_msgSend(v7, "objectForKey:");
  uint64_t v129 = *MEMORY[0x263F027E0];
  v232 = objc_msgSend(v7, "objectForKey:");
  uint64_t v123 = *MEMORY[0x263F01F00];
  v238 = objc_msgSend(v7, "objectForKey:");
  uint64_t v124 = *MEMORY[0x263F01F60];
  v237 = objc_msgSend(v7, "objectForKey:");
  uint64_t v125 = *MEMORY[0x263F02028];
  v236 = objc_msgSend(v7, "objectForKey:");
  uint64_t v118 = *MEMORY[0x263F02048];
  v235 = objc_msgSend(v7, "objectForKey:");
  uint64_t v116 = *MEMORY[0x263F02290];
  v234 = objc_msgSend(v7, "objectForKey:");
  v158 = [v7 objectForKey:*MEMORY[0x263F024D0]];
  uint64_t v126 = *MEMORY[0x263F01F80];
  v233 = objc_msgSend(v7, "objectForKey:");
  v157 = [v7 objectForKey:*MEMORY[0x263F02830]];
  uint64_t v128 = *MEMORY[0x263F02858];
  v210 = objc_msgSend(v7, "objectForKey:");
  uint64_t v69 = *MEMORY[0x263F01D88];
  v231 = objc_msgSend(v7, "objectForKey:");
  uint64_t v65 = *MEMORY[0x263F01D80];
  v230 = objc_msgSend(v7, "objectForKey:");
  uint64_t v82 = *MEMORY[0x263F01E08];
  v229 = objc_msgSend(v7, "objectForKey:");
  uint64_t v101 = *MEMORY[0x263F02030];
  v228 = objc_msgSend(v7, "objectForKey:");
  uint64_t v106 = *MEMORY[0x263F024D8];
  v227 = objc_msgSend(v7, "objectForKey:");
  uint64_t v103 = *MEMORY[0x263F02508];
  v226 = objc_msgSend(v7, "objectForKey:");
  uint64_t v105 = *MEMORY[0x263F028A8];
  v28 = objc_msgSend(v7, "objectForKeyedSubscript:");
  unsigned int v99 = BOOLValueForAttr(v28);

  uint64_t v127 = *MEMORY[0x263F02850];
  v225 = objc_msgSend(v7, "objectForKey:");
  uint64_t v29 = *MEMORY[0x263F01D48];
  uint64_t v30 = [v7 objectForKey:*MEMORY[0x263F01D48]];
  uint64_t v58 = *MEMORY[0x263F01DA0];
  int v31 = objc_msgSend(v7, "objectForKey:");
  uint64_t v60 = *MEMORY[0x263F01E40];
  v224 = objc_msgSend(v7, "objectForKey:");
  uint64_t v67 = *MEMORY[0x263F01F10];
  v223 = objc_msgSend(v7, "objectForKey:");
  uint64_t v66 = *MEMORY[0x263F01F50];
  v222 = objc_msgSend(v7, "objectForKey:");
  uint64_t v59 = *MEMORY[0x263F01FA8];
  v221 = objc_msgSend(v7, "objectForKey:");
  uint64_t v62 = *MEMORY[0x263F02000];
  v220 = objc_msgSend(v7, "objectForKey:");
  uint64_t v61 = *MEMORY[0x263F02010];
  v219 = objc_msgSend(v7, "objectForKey:");
  uint64_t v64 = *MEMORY[0x263F023D0];
  v218 = objc_msgSend(v7, "objectForKey:");
  uint64_t v63 = *MEMORY[0x263F024C0];
  v217 = objc_msgSend(v7, "objectForKey:");
  uint64_t v71 = *MEMORY[0x263F029D0];
  v216 = objc_msgSend(v7, "objectForKey:");
  uint64_t v70 = *MEMORY[0x263F02580];
  v215 = objc_msgSend(v7, "objectForKey:");
  uint64_t v68 = *MEMORY[0x263F02628];
  v214 = objc_msgSend(v7, "objectForKey:");
  uint64_t v91 = *MEMORY[0x263F02748];
  v213 = objc_msgSend(v7, "objectForKey:");
  uint64_t v94 = *MEMORY[0x263F02760];
  v212 = objc_msgSend(v7, "objectForKey:");
  uint64_t v98 = *MEMORY[0x263F02790];
  v209 = objc_msgSend(v7, "objectForKey:");
  v207 = [v7 objectForKey:*MEMORY[0x263F01F90]];
  uint64_t v119 = *MEMORY[0x263F02828];
  v208 = objc_msgSend(v7, "objectForKey:");
  uint64_t v122 = *MEMORY[0x263F02870];
  v206 = objc_msgSend(v7, "objectForKey:");
  uint64_t v121 = *MEMORY[0x263F028F0];
  v205 = objc_msgSend(v7, "objectForKey:");
  uint64_t v120 = *MEMORY[0x263F028F8];
  v204 = objc_msgSend(v7, "objectForKey:");
  uint64_t v117 = *MEMORY[0x263F02900];
  v203 = objc_msgSend(v7, "objectForKey:");
  uint64_t v115 = *MEMORY[0x263F02908];
  v202 = objc_msgSend(v7, "objectForKey:");
  uint64_t v112 = *MEMORY[0x263F02910];
  v201 = objc_msgSend(v7, "objectForKey:");
  uint64_t v114 = *MEMORY[0x263F01FF0];
  v200 = objc_msgSend(v7, "objectForKey:");
  uint64_t v111 = *MEMORY[0x263F02920];
  v199 = objc_msgSend(v7, "objectForKey:");
  uint64_t v113 = *MEMORY[0x263F02938];
  v198 = objc_msgSend(v7, "objectForKey:");
  uint64_t v110 = *MEMORY[0x263F02928];
  v197 = objc_msgSend(v7, "objectForKey:");
  uint64_t v109 = *MEMORY[0x263F02960];
  v196 = objc_msgSend(v7, "objectForKey:");
  uint64_t v108 = *MEMORY[0x263F02968];
  v195 = objc_msgSend(v7, "objectForKey:");
  uint64_t v107 = *MEMORY[0x263F01F98];
  unint64_t v32 = objc_msgSend(v7, "objectForKey:");
  uint64_t v33 = *MEMORY[0x263F025B8];
  BOOL v34 = [v7 objectForKey:*MEMORY[0x263F025B8]];
  uint64_t v104 = *MEMORY[0x263F02390];
  v194 = objc_msgSend(v7, "objectForKey:");
  uint64_t v102 = *MEMORY[0x263F024C8];
  v193 = objc_msgSend(v7, "objectForKey:");
  uint64_t v100 = *MEMORY[0x263F02370];
  uint64_t v35 = objc_msgSend(v7, "objectForKey:");
  if (!v35)
  {
    uint64_t v35 = [v7 objectForKey:*MEMORY[0x263F029C8]];
  }
  v192 = (void *)v35;
  uint64_t v96 = *MEMORY[0x263F028C0];
  v191 = objc_msgSend(v7, "objectForKey:");
  uint64_t v95 = *MEMORY[0x263F028B8];
  v190 = objc_msgSend(v7, "objectForKey:");
  uint64_t v92 = *MEMORY[0x263F01E38];
  v189 = objc_msgSend(v7, "objectForKey:");
  uint64_t v90 = *MEMORY[0x263F02680];
  v188 = objc_msgSend(v7, "objectForKey:");
  uint64_t v89 = *MEMORY[0x263F02698];
  v187 = objc_msgSend(v7, "objectForKey:");
  uint64_t v86 = *MEMORY[0x263F02690];
  v186 = objc_msgSend(v7, "objectForKey:");
  uint64_t v85 = *MEMORY[0x263F02020];
  v185 = objc_msgSend(v7, "objectForKey:");
  uint64_t v97 = *MEMORY[0x263F01F88];
  id v36 = objc_msgSend(v7, "objectForKeyedSubscript:");
  unsigned int v93 = BOOLValueForAttr(v36);

  uint64_t v81 = *MEMORY[0x263F01EF8];
  v184 = objc_msgSend(v7, "objectForKey:");
  uint64_t v80 = *MEMORY[0x263F023A0];
  v183 = objc_msgSend(v7, "objectForKey:");
  uint64_t v78 = *MEMORY[0x263F027B0];
  v182 = objc_msgSend(v7, "objectForKey:");
  uint64_t v76 = *MEMORY[0x263F027B8];
  v181 = objc_msgSend(v7, "objectForKey:");
  uint64_t v88 = *MEMORY[0x263F025A0];
  v37 = objc_msgSend(v7, "objectForKeyedSubscript:");
  unsigned int v84 = BOOLValueForAttr(v37);

  uint64_t v87 = *MEMORY[0x263F02598];
  int v38 = objc_msgSend(v7, "objectForKeyedSubscript:");
  unsigned int v83 = BOOLValueForAttr(v38);

  uint64_t v73 = *MEMORY[0x263F02590];
  v180 = objc_msgSend(v7, "objectForKey:");
  uint64_t v72 = *MEMORY[0x263F02588];
  v179 = objc_msgSend(v7, "objectForKey:");
  v79 = objc_msgSend(v7, "objectForKey:");
  v77 = objc_msgSend(v7, "objectForKey:");
  v75 = objc_msgSend(v7, "objectForKey:");
  v74 = objc_msgSend(v7, "objectForKey:");
  uint64_t v39 = [v5 contentType];
  v279 = v5;
  id v40 = (void *)v39;
  if (v39) {
    int v41 = (void *)v39;
  }
  else {
    int v41 = v32;
  }
  id v42 = v41;

  v43 = objc_opt_new();
  [v43 beginDictionary];
  uint64_t v44 = [NSNumber numberWithBool:v155];
  [v43 encodeObject:v44 withKey:v177];

  uint64_t v45 = [NSNumber numberWithBool:v154];
  [v43 encodeObject:v45 withKey:v174];

  [v43 encodeObject:v278 withKey:v156];
  [v43 encodeObject:v34 withKey:v33];
  [v43 encodeObject:v277 withKey:v144];
  [v43 encodeObject:v276 withKey:v141];
  [v43 encodeObject:v30 withKey:v29];
  [v43 encodeObject:v275 withKey:v146];
  [v43 encodeObject:v230 withKey:v65];
  [v43 encodeObject:v231 withKey:v69];
  [v43 encodeObject:v274 withKey:v151];
  [v43 encodeObject:v273 withKey:v149];
  [v43 encodeObject:v31 withKey:v58];
  [v43 encodeObject:v272 withKey:v153];
  [v43 encodeObject:v271 withKey:v150];
  [v43 encodeObject:v270 withKey:v148];
  [v43 encodeObject:v268 withKey:v143];
  [v43 encodeObject:v269 withKey:v152];
  [v43 encodeObject:v267 withKey:v147];
  [v43 encodeObject:v266 withKey:v145];
  [v43 encodeObject:v265 withKey:v142];
  [v43 encodeObject:v229 withKey:v82];
  [v43 encodeObject:v224 withKey:v60];
  [v43 encodeObject:v238 withKey:v123];
  [v43 encodeObject:v221 withKey:v59];
  [v43 encodeObject:v235 withKey:v118];
  [v43 encodeObject:v234 withKey:v116];
  [v43 encodeObject:v223 withKey:v67];
  [v43 encodeObject:v222 withKey:v66];
  [v43 encodeObject:v237 withKey:v124];
  [v43 encodeObject:v220 withKey:v62];
  [v43 encodeObject:v219 withKey:v61];
  [v43 encodeObject:v236 withKey:v125];
  [v43 encodeObject:v228 withKey:v101];
  [v43 encodeObject:v218 withKey:v64];
  [v43 encodeObject:v217 withKey:v63];
  [v43 encodeObject:v227 withKey:v106];
  [v43 encodeObject:v226 withKey:v103];
  uint64_t v46 = [NSNumber numberWithBool:v99];
  [v43 encodeObject:v46 withKey:v105];

  [v43 encodeObject:v233 withKey:v126];
  [v43 encodeObject:v216 withKey:v71];
  [v43 encodeObject:v215 withKey:v70];
  [v43 encodeObject:v214 withKey:v68];
  [v43 encodeObject:v264 withKey:v172];
  uint64_t v47 = [NSNumber numberWithBool:v164];
  [v43 encodeObject:v47 withKey:v173];

  [v43 encodeObject:v263 withKey:v171];
  [v43 encodeObject:v262 withKey:v170];
  [v43 encodeObject:v261 withKey:v169];
  [v43 encodeObject:v255 withKey:v159];
  [v43 encodeObject:v256 withKey:v160];
  [v43 encodeObject:v258 withKey:v165];
  [v43 encodeObject:v257 withKey:v163];
  [v43 encodeObject:v260 withKey:v176];
  [v43 encodeObject:v259 withKey:v175];
  [v43 encodeObject:v254 withKey:v161];
  [v43 encodeObject:v213 withKey:v91];
  [v43 encodeObject:v253 withKey:v162];
  [v43 encodeObject:v212 withKey:v94];
  [v43 encodeObject:v225 withKey:v127];
  [v43 encodeObject:v252 withKey:v168];
  [v43 encodeObject:v251 withKey:v167];
  [v43 encodeObject:v250 withKey:v166];
  [v43 encodeObject:v209 withKey:v98];
  [v43 encodeObject:v247 withKey:v137];
  [v43 encodeObject:v248 withKey:v139];
  [v43 encodeObject:v246 withKey:v138];
  [v43 encodeObject:v245 withKey:v136];
  [v43 encodeObject:v244 withKey:v135];
  [v43 encodeObject:v243 withKey:v134];
  [v43 encodeObject:v242 withKey:v133];
  [v43 encodeObject:v241 withKey:v132];
  [v43 encodeObject:v240 withKey:v131];
  [v43 encodeObject:v239 withKey:v130];
  [v43 encodeObject:v232 withKey:v129];
  [v43 encodeObject:v208 withKey:v119];
  [v43 encodeObject:v207 withKey:*MEMORY[0x263F02848]];
  [v43 encodeObject:v210 withKey:v128];
  [v43 encodeObject:v206 withKey:v122];
  [v43 encodeObject:v205 withKey:v121];
  [v43 encodeObject:v204 withKey:v120];
  [v43 encodeObject:v203 withKey:v117];
  [v43 encodeObject:v202 withKey:v115];
  [v43 encodeObject:v201 withKey:v112];
  [v43 encodeObject:v211 withKey:v140];
  [v43 encodeObject:v200 withKey:v114];
  [v43 encodeObject:v199 withKey:v111];
  [v43 encodeObject:v249 withKey:@"SSAttributeTopMatchedStrings"];
  [v43 encodeObject:v198 withKey:v113];
  [v43 encodeObject:v197 withKey:v110];
  [v43 encodeObject:v196 withKey:v109];
  [v43 encodeObject:v195 withKey:v108];
  [v43 encodeObject:v42 withKey:v107];

  [v43 encodeObject:v194 withKey:v104];
  [v43 encodeObject:v193 withKey:v102];
  [v43 encodeObject:v192 withKey:v100];
  [v43 encodeObject:v191 withKey:v96];
  [v43 encodeObject:v190 withKey:v95];
  [v43 encodeObject:v189 withKey:v92];
  [v43 encodeObject:v188 withKey:v90];
  [v43 encodeObject:v187 withKey:v89];
  [v43 encodeObject:v186 withKey:v86];
  [v43 encodeObject:v185 withKey:v85];
  [v43 encodeObject:v184 withKey:v81];
  [v43 encodeObject:v183 withKey:v80];
  [v43 encodeObject:v182 withKey:v78];
  [v43 encodeObject:v181 withKey:v76];
  id v48 = [NSNumber numberWithBool:v93];
  [v43 encodeObject:v48 withKey:v97];

  [v43 encodeObject:v180 withKey:v73];
  [v43 encodeObject:v179 withKey:v72];
  unint64_t v49 = [NSNumber numberWithBool:v84];
  [v43 encodeObject:v49 withKey:v88];

  uint64_t v50 = [NSNumber numberWithBool:v83];
  [v43 encodeObject:v50 withKey:v87];

  objc_msgSend(v43, "encodeObject:withKey:");
  objc_msgSend(v43, "encodeObject:withKey:");
  objc_msgSend(v43, "encodeObject:withKey:");
  objc_msgSend(v43, "encodeObject:withKey:");
  [v43 endDictionary];
  long long v51 = [v43 data];
  long long v52 = (void *)[v51 copy];
  [v279 setAttributeData:v52];

  uint64_t v53 = [v279 lastUsedDate];
  long long v54 = (void *)v53;
  if (v157) {
    uint64_t v55 = (uint64_t)v157;
  }
  else {
    uint64_t v55 = (uint64_t)v158;
  }
  if (v53) {
    uint64_t v56 = v53;
  }
  else {
    uint64_t v56 = v55;
  }
  [v279 setLastUsedDate:v56];

  if (v157 && v158)
  {
    long long v57 = [v157 laterDate:v158];
    [v279 setLastUsedDate:v57];
  }
}

@end