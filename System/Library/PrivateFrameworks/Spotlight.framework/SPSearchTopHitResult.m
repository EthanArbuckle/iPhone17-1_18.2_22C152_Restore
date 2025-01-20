@interface SPSearchTopHitResult
- (BOOL)_contentType:(id)a3 orContentTypeTree:(id)a4 representsType:(id)a5;
- (BOOL)audioIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)audioOrVideoIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)bookIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)contactIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)documentIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)doesQueryMatchContentForLowEngagementBundle:(id)a3 queryContext:(id)a4;
- (BOOL)messageIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (BOOL)playlistOrAlbumIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4;
- (CSSearchableItemAttributeSet)attributeSet;
- (SPSearchTopHitResult)initWithRankingItem:(id)a3 attributeSet:(id)a4 score:interestingDate:dataclass:bundleID:;
- (SPSearchTopHitResult)resultWithTime:(double)a3 searchString:(id)a4 isCorrectedQuery:(BOOL)a5 withQueryContext:(id)a6;
- (id)authorStringFromAttrs:(id)a3;
- (id)makeApplicationResult:(id)a3 dataclass:(id)a4 score:;
- (id)makeMailResult:(SPSearchTopHitResult *)self dataclass:(SEL)a2 score:(id)a3 searchString:(id)a4;
- (id)makeMessagesResult:(id)a3 dataclass:(id)a4 queryContext:(id)a5 score:;
- (id)makePersonResult:(id)a3 dataclass:(id)a4 queryContext:(id)a5 score:;
- (id)makePhotosResult:(id)a3 dataclass:(id)a4 queryContext:(id)a5 score:;
- (id)matchContentForPerson:(id)a3 queryContext:(id)a4 spotlightQueryTerms:(id)a5;
- (id)titleStringFromAttrs:(id)a3;
- (void)makeContactResult:(id)a3 identifier:(id)a4 queryContext:(id)a5 result:(id)a6;
- (void)makeDateBasedResult:(id)a3 result:(id)a4;
- (void)populateAttributesForResult:(id)a3 withAttrs:(id)a4;
- (void)populateCoreSpotlightResult:(id)a3 attrs:(id)a4 bundleID:(id)a5 queryContext:(id)a6;
- (void)setAttributeSet:(id)a3;
- (void)setupGenericItem:(id)a3 attrs:(id)a4 utiType:(id)a5 bundleID:(id)a6;
- (void)updateDataOwnerTypeForResult:(id)a3 accountID:(id)a4;
@end

@implementation SPSearchTopHitResult

- (SPSearchTopHitResult)initWithRankingItem:(id)a3 attributeSet:(id)a4 score:interestingDate:dataclass:bundleID:
{
  v8 = v7;
  v9 = v6;
  uint64_t v10 = v5;
  uint64_t v11 = v4;
  id v15 = a4;
  id v16 = v9;
  id v17 = v8;
  id v18 = v23;
  v22.receiver = self;
  v22.super_class = (Class)SPSearchTopHitResult;
  v19 = [(SPTopHitResult *)&v22 initWithRankingItem:a3];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_attributeSet, a4);
    -[SPTopHitResult setScore:](v20, "setScore:", v11, v10);
    [(SPTopHitResult *)v20 setInterestingDate:v16];
    [(SPTopHitResult *)v20 setDataclass:v17];
    [(SPTopHitResult *)v20 setBundleID:v18];
  }

  return v20;
}

- (SPSearchTopHitResult)resultWithTime:(double)a3 searchString:(id)a4 isCorrectedQuery:(BOOL)a5 withQueryContext:(id)a6
{
  BOOL v7 = a5;
  uint64_t v126 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  v12 = [v11 disabledApps];
  if ([v12 count])
  {
    v120 = [MEMORY[0x263EFFA08] setWithArray:v12];
  }
  else
  {
    v120 = 0;
  }
  attributeSet = self->_attributeSet;
  if (!attributeSet)
  {
    v25 = 0;
    goto LABEL_91;
  }
  v119 = self;
  v14 = [(CSSearchableItemAttributeSet *)attributeSet attributeDictionary];
  v121 = [v14 objectForKeyedSubscript:*MEMORY[0x263F01E20]];
  v117 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02790]];
  uint64_t v113 = *MEMORY[0x263F01F98];
  id v15 = objc_msgSend(v14, "objectForKeyedSubscript:");
  v116 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02670]];
  uint64_t v112 = *MEMORY[0x263F01F60];
  id v16 = objc_msgSend(v14, "objectForKeyedSubscript:");
  [v16 timeIntervalSinceReferenceDate];
  double v18 = v17;
  v19 = [v14 objectForKeyedSubscript:*MEMORY[0x263F01F80]];
  [v19 timeIntervalSinceReferenceDate];
  if ((v18 >= a3 || a3 - v18 >= 300.0) && (v20 >= a3 || a3 - v20 >= 300.0))
  {

    v24 = v121;
    if (([(__CFString *)v121 isEqualToString:*MEMORY[0x263F674E0]] & 1) != 0
      || ([(__CFString *)v121 isEqualToString:*MEMORY[0x263F674D8]] & 1) != 0
      || ([(__CFString *)v121 isEqualToString:@"com.apple.MobileAddressBook"] & 1) != 0)
    {
      int v23 = 0;
      goto LABEL_18;
    }
    v97 = [v14 objectForKeyedSubscript:*MEMORY[0x263F024E0]];
    v98 = v97;
    if (v10 && [v97 hasPrefix:v10])
    {
      if ([v98 isEqualToString:v10]) {
        int v23 = 2;
      }
      else {
        int v23 = 1;
      }
    }
    else
    {
      int v23 = 0;
    }
  }
  else
  {
    v21 = SPLogForSPLogCategoryQuery();
    os_log_type_t v22 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 138412290;
      v123 = @"Very recently created/modified";
      _os_log_impl(&dword_235D0B000, v21, v22, "%@", buf, 0xCu);
    }

    int v23 = 1;
  }
  v24 = v121;
LABEL_18:
  if ([v15 isEqualToString:*MEMORY[0x263F67528]]
    && (([(__CFString *)v24 isEqualToString:*MEMORY[0x263F674E0]] & 1) != 0
     || [(__CFString *)v24 isEqualToString:*MEMORY[0x263F674D8]]))
  {
    v26 = [(SPTopHitResult *)v119 dataclass];
    uint64_t v27 = [(SPTopHitResult *)v119 score];
    -[SPSearchTopHitResult makeApplicationResult:dataclass:score:](v119, "makeApplicationResult:dataclass:score:", v14, v26, v27, v28);
    id v29 = (id)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = [v29 applicationBundleIdentifier];
      int v31 = [v120 containsObject:v30];

      if (v31)
      {
        v32 = SPLogForSPLogCategoryDefault();
        os_log_type_t v33 = 2 * (*MEMORY[0x263F67540] == 0);
        v34 = v121;
        if (os_log_type_enabled(v32, v33))
        {
          v35 = [v29 applicationBundleIdentifier];
          *(_DWORD *)buf = 138412290;
          v123 = v35;
          _os_log_impl(&dword_235D0B000, v32, v33, "disabledAppSet contains  %@", buf, 0xCu);
        }
        v25 = 0;
        goto LABEL_89;
      }
      goto LABEL_36;
    }
    goto LABEL_39;
  }
  if ([(__CFString *)v24 isEqualToString:*MEMORY[0x263F79040]])
  {
    v36 = [(SPTopHitResult *)v119 dataclass];
    uint64_t v37 = [(SPTopHitResult *)v119 score];
    uint64_t v39 = -[SPSearchTopHitResult makeMailResult:dataclass:score:searchString:](v119, "makeMailResult:dataclass:score:searchString:", v14, v36, v37, v38, v10);
LABEL_34:
    id v29 = (id)v39;

    [v29 setResultBundleId:v24];
    goto LABEL_35;
  }
  if ([(__CFString *)v24 isEqualToString:*MEMORY[0x263F79048]])
  {
    v36 = [(SPTopHitResult *)v119 dataclass];
    uint64_t v40 = [(SPTopHitResult *)v119 score];
    uint64_t v39 = -[SPSearchTopHitResult makeMessagesResult:dataclass:queryContext:score:](v119, "makeMessagesResult:dataclass:queryContext:score:", v14, v36, v11, v40, v41);
    goto LABEL_34;
  }
  if ([(__CFString *)v24 isEqualToString:*MEMORY[0x263F79060]])
  {
    v36 = [(SPTopHitResult *)v119 dataclass];
    uint64_t v42 = [(SPTopHitResult *)v119 score];
    uint64_t v39 = -[SPSearchTopHitResult makePhotosResult:dataclass:queryContext:score:](v119, "makePhotosResult:dataclass:queryContext:score:", v14, v36, v11, v42, v43);
    goto LABEL_34;
  }
  if ([(__CFString *)v24 isEqualToString:*MEMORY[0x263F79058]])
  {
    v36 = [(SPTopHitResult *)v119 dataclass];
    uint64_t v44 = [(SPTopHitResult *)v119 score];
    uint64_t v39 = -[SPSearchTopHitResult makePersonResult:dataclass:queryContext:score:](v119, "makePersonResult:dataclass:queryContext:score:", v14, v36, v11, v44, v45);
    goto LABEL_34;
  }
  v86 = objc_opt_new();
  uint64_t v87 = [(SPTopHitResult *)v119 score];
  objc_msgSend(v86, "setScore:", v87, v88);
  [(SPTopHitResult *)v119 dataclass];
  uint64_t v90 = v89 = v24;
  [v86 setProtectionClass:v90];

  [(SPSearchTopHitResult *)v119 populateCoreSpotlightResult:v86 attrs:v14 bundleID:v89 queryContext:v11];
  id v29 = v86;
  v91 = [v29 fileProviderIdentifier];
  objc_opt_class();
  LOBYTE(v90) = objc_opt_isKindOfClass();

  if ((v90 & 1) == 0) {
    goto LABEL_116;
  }
  v92 = [v29 fileProviderIdentifier];
  if (![v92 length])
  {

LABEL_116:
LABEL_117:
    v99 = [v29 userActivityRequiredString];
    uint64_t v100 = [v99 length];

    if (v100)
    {
      v101 = [v14 objectForKeyedSubscript:*MEMORY[0x263F01EF0]];
      char v102 = [v101 isEqualToString:@"com.apple.DocumentManager"];

      if (v102)
      {
        v25 = 0;
        v34 = v121;
        goto LABEL_90;
      }
    }
    v96 = v121;
    goto LABEL_121;
  }
  v93 = [v29 userActivityRequiredString];

  if (v93) {
    goto LABEL_117;
  }

  if ([v116 unsignedIntValue]) {
    [v29 setSectionBundleIdentifier:*MEMORY[0x263F790D0]];
  }
  v94 = SPLogForSPLogCategoryDefault();
  os_log_type_t v95 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v94, v95))
  {
    *(_DWORD *)buf = 138412546;
    v123 = @"com.apple.DocumentsApp";
    __int16 v124 = 2112;
    v125 = @"com.apple.DocumentsApp";
    _os_log_impl(&dword_235D0B000, v94, v95, "remap %@ to %@", buf, 0x16u);
  }

  v96 = @"com.apple.DocumentsApp";
LABEL_121:
  [v29 setBundleID:v96];
  uint64_t v103 = [v29 sectionBundleIdentifier];
  v104 = (void *)v103;
  if (v103) {
    uint64_t v105 = v103;
  }
  else {
    uint64_t v105 = (uint64_t)v96;
  }
  [v29 setSectionBundleIdentifier:v105];

  [v29 setApplicationBundleIdentifier:v96];
  if ([(__CFString *)v96 isEqualToString:@"com.apple.shortcuts"] && v117) {
    [v29 setApplicationBundleIdentifier:v117];
  }
  v121 = v96;
  if ([(__CFString *)v96 isEqualToString:*MEMORY[0x263F78FB8]])
  {
    v106 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02000]];
    [v29 setStringForDedupe:v106];
    v107 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02020]];
    [v29 setDomainIdentifier:v107];
  }
LABEL_35:
  if (v29)
  {
LABEL_36:
    v118 = v15;
    v46 = SPLogForSPLogCategoryDefault();
    os_log_type_t v47 = 2 * (*MEMORY[0x263F67540] == 0);
    if (os_log_type_enabled(v46, v47))
    {
      id v48 = v10;
      uint64_t v49 = [v29 score];
      [v29 score];
      *(_DWORD *)buf = 134218240;
      v123 = (__CFString *)v49;
      id v10 = v48;
      __int16 v124 = 2048;
      v125 = v50;
      _os_log_impl(&dword_235D0B000, v46, v47, "Result score: 0x%08llx 0x%08llx", buf, 0x16u);
    }
    int v51 = 0;
    goto LABEL_42;
  }
LABEL_39:
  v118 = v15;
  v46 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_235D0B000, v46, OS_LOG_TYPE_DEFAULT, "*warn* Couldn't determine score for nil result", buf, 2u);
  }
  id v29 = 0;
  int v51 = 1;
LABEL_42:

  if (v23 > (int)[v29 topHit]) {
    [v29 setTopHit:SSSetTopHitWithReasonString()];
  }
  if ([v118 isEqualToString:@"public.calendar-event"])
  {
    v52 = [v29 title];
    v53 = [v52 text];
    [v29 setCompletedQuery:v53];
  }
  if (!v51)
  {
    v56 = [v29 compatibilityTitle];
    if (v56) {
      goto LABEL_59;
    }
    v56 = [v29 bundleID];
    if ([v56 isEqualToString:*MEMORY[0x263F79060]]) {
      goto LABEL_59;
    }
    v57 = [v29 sectionBundleIdentifier];
    if (SSSectionIsSyndicatedPhotos())
    {
LABEL_58:

LABEL_59:
      goto LABEL_60;
    }
    uint64_t v58 = [v11 queryKind];
    id v59 = [v11 clientBundleID];
    if (SPQueryKindIsSearchToolSearch_onceToken_1 != -1) {
      dispatch_once(&SPQueryKindIsSearchToolSearch_onceToken_1, &__block_literal_global_338);
    }
    if (SPQueryKindIsSearchToolSearch_isSearchToolDebugMode_1)
    {
LABEL_57:

      goto LABEL_58;
    }
    if (SPQueryKindIsSearchToolSearch_isSearchToolRanking_1)
    {
      if (([v59 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
        || ([v59 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
      {
        goto LABEL_57;
      }
      char v115 = [v59 hasPrefix:@"com.apple.ondeviceeval"];

      if (v58 == 12 || (v115 & 1) != 0)
      {
LABEL_60:
        [v29 setUserInput:v10];
        if (![v29 type])
        {
          v60 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02960]];
          if (v60) {
            uint64_t v61 = 4;
          }
          else {
            uint64_t v61 = 2;
          }
          [v29 setType:v61];
        }
        v62 = [v14 objectForKeyedSubscript:*MEMORY[0x263F024E0]];
        [v29 setLaunchString:v62];

        [v29 setRelatedBundleID:v117];
        [v29 setRelatedAppIdentifier:v117];
        v63 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02750]];
        [v29 setLaunchDates:v63];

        v64 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02738]];
        [v29 setItemProviderDataTypes:v64];

        v65 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02740]];
        [v29 setItemProviderFileTypes:v65];

        if ([(__CFString *)v121 isEqualToString:*MEMORY[0x263F79128]]
          || ([(__CFString *)v121 hasPrefix:@"com.apple"] & 1) == 0
          && [MEMORY[0x263F78DF0] isLowEngagementBundle:v121])
        {
          objc_msgSend(v29, "setHasTextContentMatch:", -[SPSearchTopHitResult doesQueryMatchContentForLowEngagementBundle:queryContext:](v119, "doesQueryMatchContentForLowEngagementBundle:queryContext:", v14, v11));
        }
        else if (([(__CFString *)v121 isEqualToString:*MEMORY[0x263F79058]] & 1) == 0 {
               && ([(__CFString *)v121 isEqualToString:*MEMORY[0x263F79030]] & 1) == 0)
        }
        {
          v66 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02A20]];
          [v29 setHasTextContentMatch:BOOLValueForAttr(v66)];
        }
        uint64_t v67 = [v29 contentType];
        if (!v67
          || (v68 = (void *)v67,
              [v29 contentTypeTree],
              v69 = objc_claimAutoreleasedReturnValue(),
              v69,
              v68,
              !v69))
        {
          v70 = [v14 objectForKeyedSubscript:v113];
          [v29 setContentType:v70];

          v71 = [v14 objectForKeyedSubscript:*MEMORY[0x263F01FA0]];
          [v29 setContentTypeTree:v71];
        }
        v114 = [v14 objectForKeyedSubscript:*MEMORY[0x263F01FF8]];
        objc_msgSend(v29, "setDataOwnerType:", -[NSObject integerValue](v114, "integerValue"));
        v72 = [v29 contentCreationDate];

        if (!v72)
        {
          v73 = [v14 objectForKeyedSubscript:v112];
          [v29 setContentCreationDate:v73];
        }
        if (v7)
        {
          v74 = [v11 searchString];
          [v29 setCorrectedQuery:v74];
        }
        v75 = [(SPTopHitResult *)v119 rankingItem];
        objc_msgSend(v29, "setQueryId:", objc_msgSend(v11, "queryIdent"));
        v76 = [v29 sectionBundleIdentifier];
        if ([v76 isEqualToString:*MEMORY[0x263F78E88]])
        {

          v34 = v121;
          v32 = v114;
        }
        else
        {
          [v29 sectionBundleIdentifier];
          v77 = v12;
          id v78 = v11;
          v80 = id v79 = v10;
          int v81 = [v80 isEqualToString:*MEMORY[0x263F78E80]];

          id v10 = v79;
          id v11 = v78;
          v12 = v77;

          v34 = v121;
          v32 = v114;
          if (!v81)
          {
LABEL_87:
            [v29 setRankingItem:v75];
            [v75 score];
            objc_msgSend(v29, "setL2score:");
            v83 = [v11 answerAttributes];
            v84 = (void *)[v83 copy];
            [v29 setAnswerAttributes:v84];

            [(SPSearchTopHitResult *)v119 populateAttributesForResult:v29 withAttrs:v14];
            id v29 = v29;

            v25 = v29;
            goto LABEL_88;
          }
        }
        if (([v75 didMatchRankingDescriptor:*MEMORY[0x263F78EE0]] & 1) != 0
          || ([v75 didMatchRankingDescriptor:*MEMORY[0x263F79008]] & 1) != 0)
        {
          uint64_t v82 = 0;
        }
        else
        {
          uint64_t v82 = [v75 didMatchRankingDescriptor:*MEMORY[0x263F78EC0]];
        }
        [v29 setIsStaticCorrection:v82];
        goto LABEL_87;
      }
    }
    else
    {
    }
    v32 = SPLogForSPLogCategoryDefault();
    os_log_type_t v108 = *MEMORY[0x263F67548] ^ 1;
    v34 = v121;
    if (os_log_type_enabled(v32, v108))
    {
      [v29 identifier];
      id v109 = v10;
      v110 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v111 = [v29 bundleID];
      *(_DWORD *)buf = 138412546;
      v123 = v110;
      __int16 v124 = 2112;
      v125 = v111;
      _os_log_impl(&dword_235D0B000, v32, v108, "No title for CoreSpotlight result, identifier:%@, bundleID:%@", buf, 0x16u);

      id v10 = v109;
    }
    goto LABEL_50;
  }
  v32 = SPLogForSPLogCategoryDefault();
  os_log_type_t v54 = *MEMORY[0x263F67548] ^ 1;
  v34 = v121;
  if (os_log_type_enabled(v32, v54))
  {
    v55 = [v14 objectForKeyedSubscript:*MEMORY[0x263F02938]];
    *(_DWORD *)buf = 138412546;
    v123 = v55;
    __int16 v124 = 2112;
    v125 = v121;
    _os_log_impl(&dword_235D0B000, v32, v54, "No result object for CoreSpotlight result, identifier:%@, bundleID:%@", buf, 0x16u);
  }
  id v29 = 0;
LABEL_50:
  v25 = 0;
LABEL_88:
  id v15 = v118;
LABEL_89:

LABEL_90:
LABEL_91:

  return (SPSearchTopHitResult *)v25;
}

- (id)makeApplicationResult:(id)a3 dataclass:(id)a4 score:
{
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  v71[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v67 = a4;
  id v10 = SPFastApplicationsGetNoBuild();
  uint64_t v11 = *MEMORY[0x263F02938];
  v12 = [v9 objectForKeyedSubscript:*MEMORY[0x263F02938]];
  v65 = v10;
  uint64_t v13 = [v10 objectForKeyedSubscript:v12];
  v66 = (void *)v13;
  if (v13)
  {
    v14 = (void *)v13;
    id v15 = v9;
    uint64_t v16 = v7;
    double v17 = objc_alloc_init(MEMORY[0x263F67490]);
    [v14 copyToSearchFoundationResult:v17];
    double v18 = [v17 compatibilityTitle];

    if (!v18)
    {
      v19 = [v15 objectForKeyedSubscript:*MEMORY[0x263F02010]];
      [v17 title];
      v21 = uint64_t v20 = v6;
      [v21 setText:v19];

      uint64_t v6 = v20;
      v14 = v66;
    }
    os_log_type_t v22 = [v14 subtitle];

    if (!v22)
    {
      int v23 = [v15 objectForKeyedSubscript:*MEMORY[0x263F02878]];
      if (v23)
      {
        [MEMORY[0x263F679F0] textWithString:v23];
        v25 = uint64_t v24 = v6;
        v71[0] = v25;
        v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:1];
        [v17 setDescriptions:v26];

        v14 = v66;
        uint64_t v6 = v24;
      }
    }
    if ([v14 isWebClip]) {
      [v17 setType:24];
    }
    uint64_t v27 = v16;
    if ([v14 isAppClip])
    {
      [v17 setSectionBundleIdentifier:*MEMORY[0x263F78E80]];
      [v17 setBundleID:*MEMORY[0x263F674E0]];
      [v17 setType:22];
      id v28 = objc_alloc(MEMORY[0x263F677A0]);
      id v29 = [v17 identifier];
      [v28 setBundleIdentifier:v29];

      [v17 setThumbnail:v28];
      id v9 = v15;
    }
    else
    {
      [v17 setSectionBundleIdentifier:*MEMORY[0x263F78E88]];
      if ([v14 isWebClip]) {
        uint64_t v37 = *MEMORY[0x263F01E20];
      }
      else {
        uint64_t v37 = v11;
      }
      id v9 = v15;
      uint64_t v38 = [v15 objectForKeyedSubscript:v37];
      [v17 setApplicationBundleIdentifier:v38];

      uint64_t v39 = [v15 objectForKeyedSubscript:v11];
      [v17 setExternalIdentifier:v39];

      id v28 = [v17 applicationBundleIdentifier];
      [v17 setBundleID:v28];
    }

    -[NSObject setScore:](v17, "setScore:", v27, v6);
    [v17 setProtectionClass:v67];
    [v17 setIsLocalApplicationResult:1];
    uint64_t v40 = [v17 applicationBundleIdentifier];

    if (v40)
    {
      uint64_t v41 = v66;
      goto LABEL_48;
    }
    uint64_t v41 = v66;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v17;
      _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "No applicationBundleIdentifier for %@", buf, 0xCu);
    }
    v30 = 0;
  }
  else if (([v12 isEqualToString:@"com.apple.TVRemoteUIService"] & 1) != 0 {
         || !v10
  }
         && (SPCopyVisibleApps(),
             uint64_t v42 = objc_claimAutoreleasedReturnValue(),
             int v43 = [v42 containsObject:v12],
             v42,
             v43))
  {
    uint64_t v63 = v7;
    uint64_t v64 = v6;
    double v17 = [v9 objectForKeyedSubscript:*MEMORY[0x263F01E20]];
    v30 = objc_alloc_init(MEMORY[0x263F67490]);
    uint64_t v31 = *MEMORY[0x263F674D8];
    [v30 setIsAppClip:[v17 isEqualToString:*MEMORY[0x263F674D8]]];
    v62 = [v9 objectForKeyedSubscript:*MEMORY[0x263F024A8]];
    -[NSObject setIsWebClip:](v30, "setIsWebClip:", [v62 BOOLValue]);
    int v32 = [v30 isAppClip];
    uint64_t v33 = *MEMORY[0x263F674E0];
    if (v32) {
      uint64_t v34 = v31;
    }
    else {
      uint64_t v34 = *MEMORY[0x263F674E0];
    }
    [v30 setSectionBundleIdentifier:v34];
    if ([v30 isAppClip])
    {
      id v35 = [NSString alloc];
      v36 = (void *)[v35 initWithFormat:@"%@%@", *MEMORY[0x263F320B8], v12];
      [v30 setIdentifier:v36];
    }
    else
    {
      [v30 setIdentifier:v12];
    }
    uint64_t v44 = [v9 objectForKeyedSubscript:*MEMORY[0x263F02010]];
    id v45 = objc_alloc_init(MEMORY[0x263F67A90]);
    v46 = v45;
    if (v44) {
      [v45 setText:v44];
    }
    [v30 setTitle:v46];
    os_log_type_t v47 = [v9 objectForKeyedSubscript:*MEMORY[0x263F02878]];
    if (v47)
    {
      [MEMORY[0x263F679F0] textWithString:v47];
      id v48 = v47;
      v50 = uint64_t v49 = v46;
      v68 = v50;
      int v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v68 count:1];
      [v30 setDescriptions:v51];

      v46 = v49;
      os_log_type_t v47 = v48;
    }
    [v30 setSectionBundleIdentifier:v17];
    uint64_t v61 = (void *)v44;
    if ([v30 isAppClip])
    {
      [v30 setBundleID:v33];
      [v30 setType:22];
      id v52 = objc_alloc(MEMORY[0x263F677A0]);
      [v30 identifier];
      os_log_type_t v54 = v53 = v46;
      [v52 setBundleIdentifier:v54];

      [v30 setThumbnail:v52];
      v55 = [v9 objectForKeyedSubscript:*MEMORY[0x263F02790]];
      [v30 setApplicationBundleIdentifier:v55];

      v46 = v53;
    }
    else
    {
      int v56 = [v30 isWebClip];
      v57 = v12;
      if (v56)
      {
        [v30 setType:24];
        v57 = v17;
      }
      [v30 setApplicationBundleIdentifier:v57];
      [v30 setExternalIdentifier:v12];
      uint64_t v58 = [v30 applicationBundleIdentifier];
      [v30 setBundleID:v58];

      [v30 setResultBundleId:v12];
    }
    uint64_t v41 = 0;
    -[NSObject setScore:](v30, "setScore:", v63, v64);
    [v30 setProtectionClass:v67];
    [v30 setIsLocalApplicationResult:1];
    id v59 = [v30 applicationBundleIdentifier];

    if (!v59)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v70 = v30;
        _os_log_impl(&dword_235D0B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "No applicationBundleIdentifier for %@", buf, 0xCu);
      }

      v30 = 0;
    }
  }
  else
  {
    double v17 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SPSearchTopHitResult makeApplicationResult:dataclass:score:]((uint64_t)v12, v17);
    }
    v30 = 0;
    uint64_t v41 = 0;
  }

  double v17 = v30;
LABEL_48:

  return v17;
}

- (id)authorStringFromAttrs:(id)a3
{
  id v3 = a3;
  uint64_t v4 = 0;
  if (![0 length])
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F01E00]];
    if ([v5 count])
    {
      uint64_t v4 = [v5 firstObject];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  if (![v4 length])
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:*MEMORY[0x263F01DE8]];
    if ([v6 count])
    {
      uint64_t v7 = [v6 firstObject];

      uint64_t v4 = (void *)v7;
    }
  }
  if (![v4 length])
  {
    v8 = [v3 objectForKeyedSubscript:*MEMORY[0x263F01DD0]];
    if ([v8 count])
    {
      uint64_t v9 = [v8 firstObject];

      uint64_t v4 = (void *)v9;
    }
  }
  return v4;
}

- (id)makeMailResult:(SPSearchTopHitResult *)self dataclass:(SEL)a2 score:(id)a3 searchString:(id)a4
{
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  uint64_t v10 = *MEMORY[0x263F02938];
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [v12 objectForKeyedSubscript:v10];
  v14 = [(SPSearchTopHitResult *)self authorStringFromAttrs:v12];
  id v15 = objc_alloc_init(MEMORY[0x263F67490]);
  uint64_t v16 = [MEMORY[0x263F67A90] textWithString:v14];
  [v15 setTitle:v16];

  [v15 setCompatibilityTitle:v14];
  [v15 setIdentifier:v13];
  uint64_t v17 = *MEMORY[0x263F01E20];
  double v18 = [v12 objectForKeyedSubscript:*MEMORY[0x263F01E20]];
  [v15 setSectionBundleIdentifier:v18];

  v19 = [v15 sectionBundleIdentifier];
  [v15 setApplicationBundleIdentifier:v19];

  uint64_t v20 = [v15 applicationBundleIdentifier];
  [v15 setSectionBundleIdentifier:v20];

  v21 = [v15 sectionBundleIdentifier];
  [v15 setBundleID:v21];

  objc_msgSend(v15, "setScore:", v7, v6);
  os_log_type_t v22 = [v12 objectForKeyedSubscript:*MEMORY[0x263F023D0]];
  [v15 setItemIdentifier:v22];

  [v15 setUserActivityType:*MEMORY[0x263F01CE0]];
  [v15 setExternalIdentifier:v13];
  int v23 = [v12 objectForKeyedSubscript:v17];
  [v15 setBundleID:v23];

  [v15 setProtectionClass:v11];
  uint64_t v24 = [v12 objectForKeyedSubscript:*MEMORY[0x263F01F60]];
  [v15 setInterestingDate:v24];

  v25 = [v12 objectForKeyedSubscript:*MEMORY[0x263F02980]];

  [v15 setMailConversationIdentifier:v25];
  return v15;
}

- (id)titleStringFromAttrs:(id)a3
{
  id v4 = a3;
  if (titleStringFromAttrs__onceToken != -1) {
    dispatch_once(&titleStringFromAttrs__onceToken, &__block_literal_global_11);
  }
  uint64_t v5 = 0;
  if (![0 length])
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F02010]];
  }
  if (![v5 length])
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F02920]];

    uint64_t v5 = (void *)v6;
  }
  if (![v5 length])
  {
    uint64_t v7 = [(SPSearchTopHitResult *)self authorStringFromAttrs:v4];

    uint64_t v5 = (void *)v7;
  }
  if (![v5 length])
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:*MEMORY[0x263F02870]];

    uint64_t v5 = (void *)v8;
  }
  uint64_t v9 = [v5 stringByTrimmingCharactersInSet:titleStringFromAttrs__sTrimSet];

  return v9;
}

uint64_t __45__SPSearchTopHitResult_titleStringFromAttrs___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F089C0] whitespaceAndNewlineCharacterSet];
  v1 = (void *)titleStringFromAttrs__sTrimSet;
  titleStringFromAttrs__sTrimSet = v0;

  v2 = (void *)titleStringFromAttrs__sTrimSet;
  return objc_msgSend(v2, "addCharactersInRange:", 65532, 0xFFFFLL);
}

- (BOOL)_contentType:(id)a3 orContentTypeTree:(id)a4 representsType:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([a3 isEqualToString:v8]) {
    char v9 = 1;
  }
  else {
    char v9 = [v7 containsObject:v8];
  }

  return v9;
}

- (BOOL)audioOrVideoIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  uint64_t v6 = (void *)*MEMORY[0x263F1D9C0];
  id v7 = a4;
  id v8 = a3;
  char v9 = [v6 identifier];
  LOBYTE(self) = [(SPSearchTopHitResult *)self _contentType:v8 orContentTypeTree:v7 representsType:v9];

  return (char)self;
}

- (BOOL)audioIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  uint64_t v6 = (void *)*MEMORY[0x263F1D9B8];
  id v7 = a4;
  id v8 = a3;
  char v9 = [v6 identifier];
  LOBYTE(self) = [(SPSearchTopHitResult *)self _contentType:v8 orContentTypeTree:v7 representsType:v9];

  return (char)self;
}

- (BOOL)playlistOrAlbumIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  uint64_t v6 = (void *)*MEMORY[0x263F1DC28];
  id v7 = a4;
  id v8 = a3;
  char v9 = [v6 identifier];
  LOBYTE(self) = [(SPSearchTopHitResult *)self _contentType:v8 orContentTypeTree:v7 representsType:v9];

  return (char)self;
}

- (BOOL)bookIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  return [(SPSearchTopHitResult *)self _contentType:a3 orContentTypeTree:a4 representsType:@"org.idpf.epub-container"];
}

- (BOOL)messageIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  uint64_t v6 = (void *)*MEMORY[0x263F1DBB8];
  id v7 = a4;
  id v8 = a3;
  char v9 = [v6 identifier];
  LOBYTE(self) = [(SPSearchTopHitResult *)self _contentType:v8 orContentTypeTree:v7 representsType:v9];

  return (char)self;
}

- (BOOL)contactIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  uint64_t v6 = (void *)*MEMORY[0x263F1DA30];
  id v7 = a4;
  id v8 = a3;
  char v9 = [v6 identifier];
  LOBYTE(self) = [(SPSearchTopHitResult *)self _contentType:v8 orContentTypeTree:v7 representsType:v9];

  return (char)self;
}

- (BOOL)documentIsRepresentedByContentType:(id)a3 orContentTypeTree:(id)a4
{
  uint64_t v6 = (void *)*MEMORY[0x263F1DA38];
  id v7 = a4;
  id v8 = a3;
  char v9 = [v6 identifier];
  LOBYTE(self) = [(SPSearchTopHitResult *)self _contentType:v8 orContentTypeTree:v7 representsType:v9];

  return (char)self;
}

- (void)setupGenericItem:(id)a3 attrs:(id)a4 utiType:(id)a5 bundleID:(id)a6
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F01FA0]];
  uint64_t v41 = [v11 objectForKeyedSubscript:*MEMORY[0x263F01D10]];
  int v43 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02340]];
  uint64_t v42 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02338]];
  id v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F027A0]];
  uint64_t v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02970]];
  }
  double v18 = v17;

  uint64_t v19 = *MEMORY[0x263F01CF8];
  uint64_t v20 = [v11 objectForKeyedSubscript:*MEMORY[0x263F01CF8]];
  v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    id v22 = [v11 objectForKeyedSubscript:v19];
  }
  int v23 = v22;

  if (v18)
  {
    [v10 setRelatedUniqueIdentifier:v18];
  }
  else
  {
    uint64_t v24 = [v10 relatedUniqueIdentifier];
    [v10 setRelatedUniqueIdentifier:v24];
  }
  if (v23)
  {
    [v10 setAccountIdentifier:v23];
  }
  else
  {
    v25 = [v10 accountIdentifier];
    [v10 setAccountIdentifier:v25];
  }
  [v10 setFileProviderIdentifier:v43];
  [v10 setFileProviderDomainIdentifier:v42];
  v26 = [v11 objectForKeyedSubscript:*MEMORY[0x263F01EF0]];
  [v10 setRelatedBundleID:v26];

  uint64_t v27 = [v11 objectForKeyedSubscript:*MEMORY[0x263F027F0]];
  [v10 setDisplayOrder:v27];

  if (([(SPSearchTopHitResult *)self audioOrVideoIsRepresentedByContentType:v12 orContentTypeTree:v14]|| [(SPSearchTopHitResult *)self audioIsRepresentedByContentType:v12 orContentTypeTree:v14]|| [(SPSearchTopHitResult *)self playlistOrAlbumIsRepresentedByContentType:v12 orContentTypeTree:v14]|| [(SPSearchTopHitResult *)self bookIsRepresentedByContentType:v12 orContentTypeTree:v14])
    && ([v13 isEqualToString:@"com.apple.podcasts"] & 1) == 0)
  {
    [v10 setStoreIdentifier:v41];
  }
  else
  {
    id v28 = [v10 compatibilityTitle];
    if (v28)
    {
    }
    else if ([(SPSearchTopHitResult *)self messageIsRepresentedByContentType:v12 orContentTypeTree:v14]|| [(SPSearchTopHitResult *)self contactIsRepresentedByContentType:v12 orContentTypeTree:v14])
    {
      id v29 = [(SPSearchTopHitResult *)self authorStringFromAttrs:v11];
      [v10 setCompatibilityTitle:v29];
    }
  }
  v30 = SPLogForSPLogCategoryDefault();
  os_log_type_t v31 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v39 = v14;
    id v32 = v13;
    uint64_t v33 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02010]];
    uint64_t v34 = (void *)v33;
    id v40 = v12;
    uint64_t v38 = v18;
    if (v33)
    {
      int v35 = 0;
      v36 = (void *)v33;
    }
    else
    {
      uint64_t v37 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02920]];
      if (v37)
      {
        int v35 = 0;
        double v18 = (void *)v37;
        v36 = (void *)v37;
      }
      else
      {
        v36 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02870]];
        double v18 = 0;
        int v35 = 1;
      }
    }
    *(_DWORD *)buf = 138412802;
    id v45 = v32;
    __int16 v46 = 2112;
    os_log_type_t v47 = v43;
    __int16 v48 = 2112;
    uint64_t v49 = v36;
    _os_log_impl(&dword_235D0B000, v30, v31, "Bundle id: %@ FPId: %@ Title:%@", buf, 0x20u);
    if (v35) {

    }
    if (!v34) {
    id v13 = v32;
    }
    v14 = v39;
    id v12 = v40;
    double v18 = v38;
  }
}

- (id)makeMessagesResult:(id)a3 dataclass:(id)a4 queryContext:(id)a5 score:
{
  uint64_t v33 = v5;
  uint64_t v34 = v6;
  id v10 = a3;
  uint64_t v11 = *MEMORY[0x263F02938];
  id v32 = a5;
  id v35 = a4;
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];
  id v13 = [v10 objectForKeyedSubscript:*MEMORY[0x263F02670]];
  v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F01E20]];
  id v15 = [v10 objectForKeyedSubscript:*MEMORY[0x263F029D0]];
  uint64_t v16 = [v10 objectForKeyedSubscript:*MEMORY[0x263F01F98]];
  id v17 = [v10 objectForKeyedSubscript:*MEMORY[0x263F01FA0]];
  double v18 = [(SPSearchTopHitResult *)self titleStringFromAttrs:v10];
  id v19 = v14;
  v36 = v15;
  uint64_t v37 = v13;
  uint64_t v38 = (void *)v12;
  if ([v15 isEqualToString:@"lnk"])
  {

    id v31 = (id)*MEMORY[0x263F790C8];
    uint64_t v20 = [v10 objectForKeyedSubscript:*MEMORY[0x263F02928]];
    v21 = getURLString(v20);

    id v22 = [NSURL URLWithString:v21];
    id v17 = &unk_26E931490;
  }
  else
  {
    if (!isMessagesAttachmentCoreSpotlightId())
    {
      id v22 = 0;
      id v31 = v19;
      uint64_t v24 = (void *)v16;
      goto LABEL_10;
    }
    if ([v13 unsignedIntValue]) {
      int v23 = (id *)MEMORY[0x263F790D0];
    }
    else {
      int v23 = (id *)MEMORY[0x263F79100];
    }
    id v31 = *v23;
    id v22 = 0;
    v21 = v19;
  }
  uint64_t v24 = (void *)v16;

LABEL_10:
  id v25 = objc_alloc_init(MEMORY[0x263F67490]);
  [(SPSearchTopHitResult *)self setupGenericItem:v25 attrs:v10 utiType:v24 bundleID:v19];
  v26 = [v25 bundleID];
  [(SPSearchTopHitResult *)self populateCoreSpotlightResult:v25 attrs:v10 bundleID:v26 queryContext:v32];

  uint64_t v27 = [MEMORY[0x263F67A90] textWithString:v18];
  [v25 setTitle:v27];

  [v25 setCompatibilityTitle:v18];
  [v25 setBundleID:v19];
  [v25 setApplicationBundleIdentifier:v19];
  [v25 setSectionBundleIdentifier:v31];
  [v25 setExternalIdentifier:v38];
  [v25 setIdentifier:v38];
  objc_msgSend(v25, "setScore:", v33, v34);
  [v25 setUserActivityType:*MEMORY[0x263F01CE0]];
  id v28 = [v10 objectForKeyedSubscript:*MEMORY[0x263F01F60]];
  [v25 setInterestingDate:v28];

  [v25 setProtectionClass:v35];
  id v29 = [v10 objectForKeyedSubscript:*MEMORY[0x263F02020]];
  [v25 setDomainIdentifier:v29];

  [v25 setContentType:v24];
  [v25 setContentTypeTree:v17];
  if (v22) {
    [v25 setUrl:v22];
  }

  return v25;
}

- (void)makeDateBasedResult:(id)a3 result:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [v15 objectForKeyedSubscript:*MEMORY[0x263F01F00]];
  id v8 = [v15 objectForKeyedSubscript:*MEMORY[0x263F01F60]];
  char v9 = [v15 objectForKeyedSubscript:*MEMORY[0x263F02028]];
  id v10 = [v15 objectForKeyedSubscript:*MEMORY[0x263F01F80]];
  uint64_t v11 = [v15 objectForKeyedSubscript:*MEMORY[0x263F02858]];
  uint64_t v12 = [v15 objectForKeyedSubscript:*MEMORY[0x263F01E48]];
  [v6 setCalendarIdentifier:v12];
  id v13 = v11;
  if (v11 || (id v13 = v7) != 0 || (id v13 = v9) != 0 || (id v13 = v10) != 0 || (id v13 = v8) != 0) {
    [(SPTopHitResult *)self setInterestingDate:v13];
  }
  v14 = [v15 objectForKeyedSubscript:*MEMORY[0x263F02020]];
  [v6 setDomainIdentifier:v14];

  if (v7) {
    [v6 setCompleted:1];
  }
}

- (void)updateDataOwnerTypeForResult:(id)a3 accountID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6 && ![v5 dataOwnerType])
  {
    if (updateDataOwnerTypeForResult_accountID__onceToken != -1) {
      dispatch_once(&updateDataOwnerTypeForResult_accountID__onceToken, &__block_literal_global_213);
    }
    id v7 = [(id)updateDataOwnerTypeForResult_accountID__sAccountsDictionary objectForKey:v6];
    if (v7) {
      goto LABEL_20;
    }
    id v8 = [MEMORY[0x263EFB210] defaultStore];
    id v15 = 0;
    char v9 = [v8 accountWithIdentifier:v6 error:&v15];
    id v10 = v15;

    if (v9)
    {
      uint64_t v11 = NSNumber;
      uint64_t v12 = [v9 MCIsManaged];
      id v13 = v11;
    }
    else
    {
      if (!v10 || [v10 code] == 10002)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v13 = NSNumber;
      uint64_t v12 = 1;
    }
    id v7 = [v13 numberWithBool:v12];
    [(id)updateDataOwnerTypeForResult_accountID__sAccountsDictionary setObject:v7 forKey:v6];

    if (v7)
    {
LABEL_20:
      if ([v7 BOOLValue]) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 1;
      }
      [v5 setDataOwnerType:v14];
      id v10 = v7;
      goto LABEL_13;
    }
  }
LABEL_14:
}

uint64_t __63__SPSearchTopHitResult_updateDataOwnerTypeForResult_accountID___block_invoke()
{
  updateDataOwnerTypeForResult_accountID__sAccountsDictionary = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

- (id)matchContentForPerson:(id)a3 queryContext:(id)a4 spotlightQueryTerms:(id)a5
{
  uint64_t v154 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v86 = a4;
  id v100 = a5;
  v94 = v7;
  v93 = [v7 objectForKeyedSubscript:*MEMORY[0x263F02010]];
  v92 = [v7 objectForKeyedSubscript:*MEMORY[0x263F01F18]];
  uint64_t v87 = [v7 objectForKeyedSubscript:*MEMORY[0x263F01D58]];
  v91 = [v7 objectForKeyedSubscript:*MEMORY[0x263F02038]];
  uint64_t v90 = [v7 objectForKeyedSubscript:*MEMORY[0x263F01D50]];
  v89 = [v7 objectForKeyedSubscript:*MEMORY[0x263F02658]];
  uint64_t v88 = [v7 objectForKeyedSubscript:*MEMORY[0x263F01D60]];
  id v8 = [MEMORY[0x263EFF980] array];
  if ([v92 count]) {
    [v8 addObjectsFromArray:v92];
  }
  if ([v87 count]) {
    [v8 addObjectsFromArray:v87];
  }
  if ([v91 count]) {
    [v8 addObjectsFromArray:v91];
  }
  if ([v90 count]) {
    [v8 addObjectsFromArray:v90];
  }
  if ([v89 count]) {
    [v8 addObjectsFromArray:v89];
  }
  if ([v88 count]) {
    [v8 addObjectsFromArray:v88];
  }
  v99 = [v86 normalizedSearchString];
  v96 = [v99 componentsSeparatedByString:@" "];
  uint64_t v95 = [v96 count];
  if (v93)
  {
    char v9 = [v93 lowercaseString];
    id v10 = SSNormalizedQueryString();

    if (v99) {
      uint64_t v11 = objc_msgSend(v10, "localizedStandardRangeOfString:");
    }
    else {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    id v13 = v93;
    uint64_t v143 = 0;
    v144 = &v143;
    uint64_t v145 = 0x2020000000;
    BOOL v146 = v11 == 0;
    if (v11)
    {
      uint64_t v139 = 0;
      v140 = &v139;
      uint64_t v141 = 0x2020000000;
      uint64_t v142 = 0;
      uint64_t v14 = [v10 length];
      v134[0] = MEMORY[0x263EF8330];
      v134[1] = 3221225472;
      v134[2] = __79__SPSearchTopHitResult_matchContentForPerson_queryContext_spotlightQueryTerms___block_invoke;
      v134[3] = &unk_264C77368;
      id v135 = v96;
      v136 = &v139;
      uint64_t v138 = v95;
      v137 = &v143;
      objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v14, 3, v134);

      _Block_object_dispose(&v139, 8);
      int v15 = *((unsigned __int8 *)v144 + 24);
      id v13 = v93;
    }
    else
    {
      int v15 = 1;
    }
    BOOL v12 = v15 != 0;
    if (v15)
    {
      id v98 = v13;
    }
    else
    {
      if (v100)
      {
        uint64_t v16 = NSString;
        id v17 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        double v18 = [v93 stringByTrimmingCharactersInSet:v17];
        id v19 = [v16 stringWithFormat:@"name=%@", v18];
        [v100 addObject:v19];
      }
      id v98 = 0;
    }
    _Block_object_dispose(&v143, 8);
  }
  else
  {
    BOOL v12 = 0;
    id v98 = 0;
  }
  long long v132 = 0u;
  long long v133 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  obuint64_t j = v8;
  uint64_t v20 = [obj countByEnumeratingWithState:&v130 objects:v153 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v131;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v131 != v21) {
          objc_enumerationMutation(obj);
        }
        if (v12)
        {
          BOOL v12 = 1;
        }
        else
        {
          int v23 = *(void **)(*((void *)&v130 + 1) + 8 * i);
          uint64_t v24 = [v23 lowercaseString];
          id v25 = SSNormalizedQueryString();

          if (v99) {
            uint64_t v26 = [v25 localizedStandardRangeOfString:v99];
          }
          else {
            uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
          }
          uint64_t v143 = 0;
          v144 = &v143;
          uint64_t v145 = 0x2020000000;
          BOOL v146 = v26 == 0;
          if (v26)
          {
            uint64_t v139 = 0;
            v140 = &v139;
            uint64_t v141 = 0x2020000000;
            uint64_t v142 = 0;
            uint64_t v27 = [v25 length];
            v125[0] = MEMORY[0x263EF8330];
            v125[1] = 3221225472;
            v125[2] = __79__SPSearchTopHitResult_matchContentForPerson_queryContext_spotlightQueryTerms___block_invoke_2;
            v125[3] = &unk_264C77368;
            id v126 = v96;
            v127 = &v139;
            uint64_t v129 = v95;
            v128 = &v143;
            objc_msgSend(v25, "enumerateSubstringsInRange:options:usingBlock:", 0, v27, 3, v125);

            _Block_object_dispose(&v139, 8);
            int v28 = *((unsigned __int8 *)v144 + 24);
          }
          else
          {
            int v28 = 1;
          }
          BOOL v12 = v28 != 0;
          if (v28)
          {
            id v29 = v23;

            id v98 = v29;
          }
          _Block_object_dispose(&v143, 8);
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v130 objects:v153 count:16];
    }
    while (v20);
  }

  if (v100)
  {
    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    id v30 = v92;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v121 objects:v152 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v122;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v122 != v32) {
            objc_enumerationMutation(v30);
          }
          uint64_t v34 = *(void **)(*((void *)&v121 + 1) + 8 * j);
          id v35 = NSString;
          v36 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
          uint64_t v37 = [v34 stringByTrimmingCharactersInSet:v36];
          uint64_t v38 = [v35 stringWithFormat:@"name=%@", v37];
          [v100 addObject:v38];
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v121 objects:v152 count:16];
      }
      while (v31);
    }

    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v39 = v91;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v117 objects:v151 count:16];
    if (v40)
    {
      uint64_t v41 = *(void *)v118;
      do
      {
        for (uint64_t k = 0; k != v40; ++k)
        {
          if (*(void *)v118 != v41) {
            objc_enumerationMutation(v39);
          }
          int v43 = *(void **)(*((void *)&v117 + 1) + 8 * k);
          uint64_t v44 = NSString;
          id v45 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
          __int16 v46 = [v43 stringByTrimmingCharactersInSet:v45];
          os_log_type_t v47 = [v44 stringWithFormat:@"email=%@", v46];
          [v100 addObject:v47];
        }
        uint64_t v40 = [v39 countByEnumeratingWithState:&v117 objects:v151 count:16];
      }
      while (v40);
    }

    long long v115 = 0u;
    long long v116 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    id v48 = v90;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v113 objects:v150 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v114;
      do
      {
        for (uint64_t m = 0; m != v49; ++m)
        {
          if (*(void *)v114 != v50) {
            objc_enumerationMutation(v48);
          }
          id v52 = *(void **)(*((void *)&v113 + 1) + 8 * m);
          v53 = NSString;
          os_log_type_t v54 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
          v55 = [v52 stringByTrimmingCharactersInSet:v54];
          int v56 = [v53 stringWithFormat:@"sharedEmail=%@", v55];
          [v100 addObject:v56];
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:&v113 objects:v150 count:16];
      }
      while (v49);
    }

    long long v111 = 0u;
    long long v112 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    id v57 = v89;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v109 objects:v149 count:16];
    if (v58)
    {
      uint64_t v59 = *(void *)v110;
      do
      {
        for (uint64_t n = 0; n != v58; ++n)
        {
          if (*(void *)v110 != v59) {
            objc_enumerationMutation(v57);
          }
          uint64_t v61 = *(void **)(*((void *)&v109 + 1) + 8 * n);
          v62 = NSString;
          uint64_t v63 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
          uint64_t v64 = [v61 stringByTrimmingCharactersInSet:v63];
          v65 = [v62 stringWithFormat:@"phone=%@", v64];
          [v100 addObject:v65];
        }
        uint64_t v58 = [v57 countByEnumeratingWithState:&v109 objects:v149 count:16];
      }
      while (v58);
    }

    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v66 = v88;
    uint64_t v67 = [v66 countByEnumeratingWithState:&v105 objects:v148 count:16];
    if (v67)
    {
      uint64_t v68 = *(void *)v106;
      do
      {
        for (iuint64_t i = 0; ii != v67; ++ii)
        {
          if (*(void *)v106 != v68) {
            objc_enumerationMutation(v66);
          }
          v70 = *(void **)(*((void *)&v105 + 1) + 8 * ii);
          v71 = NSString;
          v72 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
          v73 = [v70 stringByTrimmingCharactersInSet:v72];
          v74 = [v71 stringWithFormat:@"sharedPhone=%@", v73];
          [v100 addObject:v74];
        }
        uint64_t v67 = [v66 countByEnumeratingWithState:&v105 objects:v148 count:16];
      }
      while (v67);
    }

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    id v75 = v87;
    uint64_t v76 = [v75 countByEnumeratingWithState:&v101 objects:v147 count:16];
    if (v76)
    {
      uint64_t v77 = *(void *)v102;
      do
      {
        for (juint64_t j = 0; jj != v76; ++jj)
        {
          if (*(void *)v102 != v77) {
            objc_enumerationMutation(v75);
          }
          id v79 = *(void **)(*((void *)&v101 + 1) + 8 * jj);
          v80 = NSString;
          int v81 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
          uint64_t v82 = [v79 stringByTrimmingCharactersInSet:v81];
          v83 = [v80 stringWithFormat:@"rawName=%@", v82];
          [v100 addObject:v83];
        }
        uint64_t v76 = [v75 countByEnumeratingWithState:&v101 objects:v147 count:16];
      }
      while (v76);
    }
  }
  id v84 = v98;

  return v84;
}

void __79__SPSearchTopHitResult_matchContentForPerson_queryContext_spotlightQueryTerms___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (((objc_msgSend(v9, "hasPrefix:", v15, (void)v16) & 1) != 0
           || [v9 isEqualToString:v15])
          && *(void *)(a1 + 56) == ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          *a7 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

void __79__SPSearchTopHitResult_matchContentForPerson_queryContext_spotlightQueryTerms___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = *(id *)(a1 + 32);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (((objc_msgSend(v9, "hasPrefix:", v15, (void)v16) & 1) != 0
           || [v9 isEqualToString:v15])
          && *(void *)(a1 + 56) == ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          *a7 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)makeContactResult:(id)a3 identifier:(id)a4 queryContext:(id)a5 result:(id)a6
{
  id v25 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [(SPSearchTopHitResult *)self matchContentForPerson:v25 queryContext:a5 spotlightQueryTerms:0];
  [v11 setContactIdentifier:v10];
  if (v12)
  {
    [v11 setCompletion:v12];
    [v11 setIdentifier:v10];
    [v11 setType:36];
    if (makeContactResult_identifier_queryContext_result__onceToken != -1) {
      dispatch_once(&makeContactResult_identifier_queryContext_result__onceToken, &__block_literal_global_242);
    }
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v14 = [v25 objectForKeyedSubscript:*MEMORY[0x263F02010]];
    [v11 setCompletion:v14];

    [v11 setIdentifier:v10];
    [v11 setType:36];
    if (makeContactResult_identifier_queryContext_result__onceToken != -1) {
      dispatch_once(&makeContactResult_identifier_queryContext_result__onceToken, &__block_literal_global_242);
    }
    uint64_t v15 = [(SPTopHitResult *)self score];
    BOOL v13 = (makeContactResult_identifier_queryContext_result__mask & v15 | *(void *)algn_26AC2E8A8 & v16) != 0;
  }
  [v11 setHasTextContentMatch:v13];
  long long v17 = [v25 objectForKeyedSubscript:*MEMORY[0x263F02410]];
  if ([v17 count])
  {
    uint64_t v18 = 0;
    while (1)
    {
      long long v19 = [v17 objectAtIndexedSubscript:v18];
      uint64_t v20 = [v19 longLongValue];

      if (v20 >= 1) {
        break;
      }
      if (++v18 >= (unint64_t)[v17 count]) {
        goto LABEL_14;
      }
    }
    [v11 setHasCommunicationContent:1];
  }
LABEL_14:
  if (([v11 hasCommunicationContent] & 1) == 0)
  {
    uint64_t v21 = [v25 objectForKeyedSubscript:*MEMORY[0x263F025D0]];
    if ([v21 count])
    {
      uint64_t v22 = 0;
      while (1)
      {
        int v23 = [v21 objectAtIndexedSubscript:v22];
        uint64_t v24 = [v23 longLongValue];

        if (v24 >= 1) {
          break;
        }
        if (++v22 >= (unint64_t)[v21 count]) {
          goto LABEL_21;
        }
      }
      [v11 setHasCommunicationContent:1];
    }
LABEL_21:
  }
}

void __73__SPSearchTopHitResult_makeContactResult_identifier_queryContext_result___block_invoke()
{
  PRSRankingQueryIndexDictionary();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v4 objectForKeyedSubscript:*MEMORY[0x263F78ED0]];
  char v1 = [v0 integerValue];
  uint64_t v2 = 1 << v1;
  if ((v1 & 0x40) != 0) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 1 << v1;
  }
  if ((v1 & 0x40) == 0) {
    uint64_t v2 = 0;
  }
  makeContactResult_identifier_queryContext_result__mask |= v3;
  *(void *)algn_26AC2E8A8 |= v2;
}

- (id)makePhotosResult:(id)a3 dataclass:(id)a4 queryContext:(id)a5 score:
{
  uint64_t v29 = v5;
  uint64_t v30 = v6;
  v33[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  uint64_t v11 = *MEMORY[0x263F02938];
  id v12 = a5;
  id v31 = a4;
  int v28 = [v10 objectForKeyedSubscript:v11];
  BOOL v13 = [v10 objectForKeyedSubscript:*MEMORY[0x263F01E20]];
  uint64_t v14 = [v10 objectForKeyedSubscript:*MEMORY[0x263F01F98]];
  uint64_t v15 = [v10 objectForKeyedSubscript:*MEMORY[0x263F01FA0]];
  uint64_t v16 = [(SPSearchTopHitResult *)self titleStringFromAttrs:v10];
  uint64_t v32 = [v10 objectForKeyedSubscript:*MEMORY[0x263F02670]];
  int v17 = [v32 unsignedIntValue];
  uint64_t v18 = (id *)MEMORY[0x263F79100];
  if (v17) {
    uint64_t v18 = (id *)MEMORY[0x263F790D0];
  }
  id v19 = *v18;
  id v20 = objc_alloc_init(MEMORY[0x263F67490]);
  [(SPSearchTopHitResult *)self setupGenericItem:v20 attrs:v10 utiType:v14 bundleID:v13];
  uint64_t v21 = [v20 bundleID];
  [(SPSearchTopHitResult *)self populateCoreSpotlightResult:v20 attrs:v10 bundleID:v21 queryContext:v12];

  uint64_t v22 = [MEMORY[0x263F67A90] textWithString:v16];
  [v20 setTitle:v22];

  [v20 setCompatibilityTitle:v16];
  [v20 setBundleID:v13];
  [v20 setApplicationBundleIdentifier:v13];
  [v20 setSectionBundleIdentifier:v19];
  [v20 setExternalIdentifier:v28];
  [v20 setIdentifier:v28];
  objc_msgSend(v20, "setScore:", v29, v30);
  [v20 setUserActivityType:*MEMORY[0x263F01CE0]];
  int v23 = [v10 objectForKeyedSubscript:*MEMORY[0x263F01F60]];
  [v20 setInterestingDate:v23];

  [v20 setProtectionClass:v31];
  uint64_t v24 = [v10 objectForKeyedSubscript:*MEMORY[0x263F02020]];
  [v20 setDomainIdentifier:v24];

  id v25 = [v10 objectForKeyedSubscript:*MEMORY[0x263F01F58]];
  [v20 setContainerIdentifier:v25];

  [v20 setContentType:v14];
  if (v15 && [v15 count])
  {
    [v20 setContentTypeTree:v15];
  }
  else
  {
    v33[0] = v14;
    uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
    [v20 setContentTypeTree:v26];
  }
  return v20;
}

- (id)makePersonResult:(id)a3 dataclass:(id)a4 queryContext:(id)a5 score:
{
  uint64_t v7 = v6;
  uint64_t v8 = v5;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v45 = a5;
  uint64_t v42 = v13;
  uint64_t v38 = v7;
  if (makePersonResult_dataclass_queryContext_score__onceToken != -1) {
    dispatch_once(&makePersonResult_dataclass_queryContext_score__onceToken, &__block_literal_global_244_0);
  }
  uint64_t v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F02938]];
  uint64_t v15 = [v12 objectForKeyedSubscript:*MEMORY[0x263F01F10]];
  uint64_t v44 = [v12 objectForKeyedSubscript:*MEMORY[0x263F01E20]];
  uint64_t v37 = *MEMORY[0x263F02020];
  int v43 = objc_msgSend(v12, "objectForKeyedSubscript:");
  uint64_t v41 = [v12 objectForKeyedSubscript:*MEMORY[0x263F02630]];
  [v12 objectForKeyedSubscript:*MEMORY[0x263F01F98]];
  uint64_t v47 = v46 = @"public.contact";
  uint64_t v40 = (void *)v47;
  id v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:2];
  uint64_t v16 = objc_opt_new();
  int v17 = [(SPSearchTopHitResult *)self matchContentForPerson:v12 queryContext:v45 spotlightQueryTerms:v16];
  if (v15)
  {
    uint64_t v18 = [NSString stringWithFormat:@"contactIdentifier=%@", v15];
    [v16 addObject:v18];
  }
  if (v14)
  {
    id v19 = [NSString stringWithFormat:@"personIdentifier=%@", v14];
    [v16 addObject:v19];
  }
  if (v17)
  {
    BOOL v20 = 1;
  }
  else
  {
    uint64_t v21 = [(SPTopHitResult *)self score];
    BOOL v20 = (makePersonResult_dataclass_queryContext_score__mask & v21 | *(void *)algn_2688485A8 & v22) != 0;
  }
  id v23 = objc_alloc_init(MEMORY[0x263F67490]);
  [(SPSearchTopHitResult *)self setupGenericItem:v23 attrs:v12 utiType:@"com.apple.spotlight.contact" bundleID:v44];
  uint64_t v24 = [v23 bundleID];
  [(SPSearchTopHitResult *)self populateCoreSpotlightResult:v23 attrs:v12 bundleID:v24 queryContext:v45];

  [v23 setPersonIdentifier:v14];
  id v25 = [v16 componentsJoinedByString:@"\t"];
  [v23 setPersonQueryIdentifier:v25];

  [v23 setContactIdentifier:v15];
  [v23 setCompletion:v17];
  uint64_t v26 = (void *)MEMORY[0x263F67A90];
  uint64_t v27 = [v23 completion];
  int v28 = [v26 textWithString:v27];
  [v23 setTitle:v28];

  uint64_t v29 = [v23 completion];
  [v23 setCompatibilityTitle:v29];

  [v23 setBundleID:v43];
  uint64_t v30 = (void *)MEMORY[0x263F790A0];
  if (!v20) {
    uint64_t v30 = (void *)MEMORY[0x263F79058];
  }
  [v23 setSectionBundleIdentifier:*v30];
  [v23 setExternalIdentifier:v14];
  [v23 setIdentifier:v14];
  objc_msgSend(v23, "setScore:", v8, v38);
  [v23 setType:37];
  if (v41) {
    [v41 doubleValue];
  }
  else {
    double v31 = 0.0;
  }
  [v23 setRankingScore:v31];
  [v23 setUserActivityType:*MEMORY[0x263F01CE0]];
  uint64_t v32 = [v12 objectForKeyedSubscript:*MEMORY[0x263F01F60]];
  [v23 setInterestingDate:v32];

  [v23 setProtectionClass:v42];
  uint64_t v33 = [v12 objectForKeyedSubscript:v37];
  [v23 setDomainIdentifier:v33];

  uint64_t v34 = [v23 domainIdentifier];
  [v23 setApplicationBundleIdentifier:v34];

  [v23 setContentType:v40];
  [v23 setContentTypeTree:v39];
  [v23 setHasTextContentMatch:v20];
  id v35 = [v12 objectForKeyedSubscript:*MEMORY[0x263F02638]];
  [v23 setPersonType:v35];

  return v23;
}

void __70__SPSearchTopHitResult_makePersonResult_dataclass_queryContext_score___block_invoke()
{
  PRSRankingQueryIndexDictionary();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v16 objectForKeyedSubscript:*MEMORY[0x263F78ED0]];
  char v1 = [v0 integerValue];
  uint64_t v2 = 1 << v1;
  if ((v1 & 0x40) != 0) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 1 << v1;
  }
  if ((v1 & 0x40) == 0) {
    uint64_t v2 = 0;
  }
  makePersonResult_dataclass_queryContext_score__mask |= v3;
  *(void *)algn_2688485A8 |= v2;

  id v4 = [v16 objectForKeyedSubscript:*MEMORY[0x263F78E78]];
  char v5 = [v4 integerValue];
  uint64_t v6 = 1 << v5;
  if ((v5 & 0x40) != 0) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 1 << v5;
  }
  if ((v5 & 0x40) == 0) {
    uint64_t v6 = 0;
  }
  makePersonResult_dataclass_queryContext_score__mask |= v7;
  *(void *)algn_2688485A8 |= v6;

  uint64_t v8 = [v16 objectForKeyedSubscript:*MEMORY[0x263F78E70]];
  char v9 = [v8 integerValue];
  uint64_t v10 = 1 << v9;
  if ((v9 & 0x40) != 0) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = 1 << v9;
  }
  if ((v9 & 0x40) == 0) {
    uint64_t v10 = 0;
  }
  makePersonResult_dataclass_queryContext_score__mask |= v11;
  *(void *)algn_2688485A8 |= v10;

  id v12 = [v16 objectForKeyedSubscript:*MEMORY[0x263F78E68]];
  char v13 = [v12 integerValue];
  uint64_t v14 = 1 << v13;
  if ((v13 & 0x40) != 0) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 1 << v13;
  }
  if ((v13 & 0x40) == 0) {
    uint64_t v14 = 0;
  }
  makePersonResult_dataclass_queryContext_score__mask |= v15;
  *(void *)algn_2688485A8 |= v14;
}

- (BOOL)doesQueryMatchContentForLowEngagementBundle:(id)a3 queryContext:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F02010]];
  if (!v7)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F02920]];
  }
  uint64_t v8 = [v6 normalizedSearchString];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  uint64_t v38 = v7;
  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v11 = v8;
    if ((unint64_t)[v8 length] >= 4)
    {
      id v12 = [v7 lowercaseString];
      char v13 = SSNormalizedQueryString();

      id v35 = v11;
      uint64_t v14 = [v11 componentsSeparatedByString:@" "];
      uint64_t v34 = v13;
      int v43 = [v13 componentsSeparatedByString:@" "];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v15 = v14;
      uint64_t v42 = [v15 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v42)
      {
        uint64_t v16 = 0;
        unint64_t v17 = 0;
        int v39 = 0;
        uint64_t v40 = *(void *)v53;
        uint64_t v41 = v15;
        id v36 = v6;
        id v37 = v5;
        while (2)
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v53 != v40) {
              objc_enumerationMutation(v15);
            }
            uint64_t v46 = v16;
            unint64_t v47 = v17;
            uint64_t v45 = v18;
            id v19 = *(void **)(*((void *)&v52 + 1) + 8 * v18);
            uint64_t v44 = [v19 length];
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            id v20 = v43;
            uint64_t v21 = [v20 countByEnumeratingWithState:&v48 objects:v56 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              char v23 = 0;
              uint64_t v24 = *(void *)v49;
              unint64_t v25 = 0x7FFFFFFFLL;
              while (2)
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v49 != v24) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v27 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                  if ([v27 localizedStandardRangeOfString:v19] != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    uint64_t v29 = v28;
                    uint64_t v30 = [v27 length];
                    unint64_t v31 = [v27 length];
                    unint64_t v32 = v31;
                    if (v29 == v30)
                    {

                      unint64_t v25 = v32;
                      id v15 = v41;
                      goto LABEL_36;
                    }
                    if (v31 < v25) {
                      unint64_t v25 = [v27 length];
                    }
                    char v23 = 1;
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v48 objects:v56 count:16];
                if (v22) {
                  continue;
                }
                break;
              }
            }
            else
            {
              char v23 = 0;
              unint64_t v25 = 0x7FFFFFFFLL;
            }

            id v15 = v41;
            if ((v23 & 1) == 0
              || v39 > 0
              || (unint64_t)[v19 length] <= 3 && 3 * v25 > 4 * objc_msgSend(v19, "length"))
            {

              BOOL v10 = 0;
              id v6 = v36;
              id v5 = v37;
              goto LABEL_43;
            }
            int v39 = 1;
LABEL_36:
            unint64_t v17 = v44 + v47;
            uint64_t v16 = v25 + v46;
            uint64_t v18 = v45 + 1;
          }
          while (v45 + 1 != v42);
          id v6 = v36;
          id v5 = v37;
          uint64_t v42 = [v15 countByEnumeratingWithState:&v52 objects:v57 count:16];
          if (v42) {
            continue;
          }
          break;
        }

        if (v17 > 3)
        {
          BOOL v10 = 1;
          goto LABEL_43;
        }
      }
      else
      {

        unint64_t v17 = 0;
        uint64_t v16 = 0;
      }
      BOOL v10 = 3 * v16 <= 4 * v17;
LABEL_43:

      uint64_t v8 = v35;
    }
    else
    {
      BOOL v10 = 0;
      uint64_t v8 = v11;
    }
  }

  return v10;
}

- (void)populateCoreSpotlightResult:(id)a3 attrs:(id)a4 bundleID:(id)a5 queryContext:(id)a6
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v54 = a6;
  if (populateCoreSpotlightResult_attrs_bundleID_queryContext__onceToken != -1) {
    dispatch_once(&populateCoreSpotlightResult_attrs_bundleID_queryContext__onceToken, &__block_literal_global_261);
  }
  char v13 = [v11 objectForKeyedSubscript:*MEMORY[0x263F01F98]];
  uint64_t v14 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02968]];
  uint64_t v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02938]];
  uint64_t v56 = [v11 objectForKeyedSubscript:*MEMORY[0x263F023D0]];
  uint64_t v16 = [v11 objectForKeyedSubscript:*MEMORY[0x263F01FA8]];
  unint64_t v17 = getURLString(v16);

  uint64_t v18 = (void *)v15;
  uint64_t v19 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02960]];
  long long v52 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02670]];
  long long v53 = self;
  id v20 = [(SPSearchTopHitResult *)self titleStringFromAttrs:v11];
  uint64_t v21 = [v20 stringByTrimmingCharactersInSet:populateCoreSpotlightResult_attrs_bundleID_queryContext__sTrimSet];

  long long v55 = v21;
  [v10 setCompatibilityTitle:v21];
  [v10 setIdentifier:v18];
  uint64_t v22 = [v11 objectForKeyedSubscript:*MEMORY[0x263F01E20]];
  [v10 setResultBundleId:v22];

  [v10 setContentURL:v17];
  char v23 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02330]];
  [v10 setFileIdentifier:v23];

  uint64_t v24 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02600]];
  [v10 setParentFileIdentifier:v24];

  unint64_t v25 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02350]];
  [v10 setFilename:v25];

  uint64_t v26 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02018]];
  [v10 setDocumentIdentifier:v26];

  [v10 setUserActivityType:v14];
  id v57 = (void *)v19;
  [v10 setUserActivityRequiredString:v19];
  uint64_t v27 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02790]];
  [v10 setRelatedBundleID:v27];

  uint64_t v28 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02398]];
  [v10 setHasAppTopHitShortcut:BOOLValueForAttr(v28)];

  char v29 = [v12 isEqualToString:@"com.apple.shortcuts"];
  int v30 = [v13 hasPrefix:*MEMORY[0x263F0F780]];
  if (!v14 && (v29 & 1) == 0 && !v30)
  {
    unint64_t v31 = v54;
    unint64_t v32 = (void *)v56;
    if (([v13 isEqualToString:@"com.apple.mobilenotes.spotlightrecord"] & 1) != 0
      || ([v13 isEqualToString:@"com.apple.notes.spotlightrecord"] & 1) != 0
      || [v12 isEqualToString:@"com.apple.mobilenotes"])
    {
      [(SPSearchTopHitResult *)v53 setupGenericItem:v10 attrs:v11 utiType:v13 bundleID:v12];
      uint64_t v33 = v52;
      if ([v52 unsignedIntValue])
      {
        uint64_t v34 = (void *)MEMORY[0x263F790D0];
      }
      else
      {
        if (!isImageOrVideoContentType())
        {
LABEL_22:
          [v10 setUserActivityType:*MEMORY[0x263F01CE0]];
          goto LABEL_23;
        }
        uint64_t v34 = (void *)MEMORY[0x263F79100];
      }
      [v10 setSectionBundleIdentifier:*v34];
      goto LABEL_22;
    }
    if (([v12 isEqualToString:@"com.apple.reminders"] & 1) != 0
      || [v12 isEqualToString:@"com.apple.mobilecal"])
    {
      if ([v13 isEqualToString:@"public.to-do-item"]) {
        [(SPSearchTopHitResult *)v53 makeDateBasedResult:v11 result:v10];
      }
      uint64_t v40 = [v11 objectForKeyedSubscript:*MEMORY[0x263F01CF8]];
      [(SPSearchTopHitResult *)v53 updateDataOwnerTypeForResult:v10 accountID:v40];

      goto LABEL_29;
    }
    if ([v12 isEqualToString:@"com.apple.VoiceMemos"])
    {
      uint64_t v41 = SPLogForSPLogCategoryQuery();
      os_log_type_t v42 = 2 * (*MEMORY[0x263F67540] == 0);
      os_log_t log = v41;
      if (!os_log_type_enabled(v41, v42))
      {
LABEL_34:

        [(SPSearchTopHitResult *)v53 setupGenericItem:v10 attrs:v11 utiType:v13 bundleID:v12];
LABEL_29:
        uint64_t v33 = v52;
        unint64_t v32 = (void *)v56;
        goto LABEL_23;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v59 = v55;
      int v43 = "Adding voice memo: %@";
LABEL_33:
      _os_log_impl(&dword_235D0B000, log, v42, v43, buf, 0xCu);
      goto LABEL_34;
    }
    if ([v12 isEqualToString:@"com.apple.MobileAddressBook"])
    {
      os_log_t loga = v13;
      uint64_t v44 = v12;
      uint64_t v45 = v17;
      uint64_t v46 = (void *)v56;
      [(SPSearchTopHitResult *)v53 makeContactResult:v11 identifier:v18 queryContext:v54 result:v10];
      unint64_t v47 = SPLogForSPLogCategoryQuery();
      os_log_type_t v48 = 2 * (*MEMORY[0x263F67540] == 0);
      if (os_log_type_enabled(v47, v48))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v59 = v55;
LABEL_41:
        _os_log_impl(&dword_235D0B000, v47, v48, "Adding contact: %@", buf, 0xCu);
      }
    }
    else
    {
      if (![v12 isEqualToString:@"com.apple.CoreSuggestions"])
      {
        [v10 setUserActivityType:*MEMORY[0x263F01CE0]];
        long long v49 = SPLogForSPLogCategoryQuery();
        os_log_type_t v42 = 2 * (*MEMORY[0x263F67540] == 0);
        os_log_t log = v49;
        if (!os_log_type_enabled(v49, v42)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v59 = v13;
        int v43 = "Adding app search UTI: %@";
        goto LABEL_33;
      }
      os_log_t loga = v13;
      uint64_t v44 = v12;
      uint64_t v45 = v17;
      uint64_t v46 = (void *)v56;
      [(SPSearchTopHitResult *)v53 makeContactResult:v11 identifier:v18 queryContext:v54 result:v10];
      unint64_t v47 = SPLogForSPLogCategoryQuery();
      os_log_type_t v48 = 2 * (*MEMORY[0x263F67540] == 0);
      if (os_log_type_enabled(v47, v48))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v59 = v55;
        goto LABEL_41;
      }
    }

    unint64_t v32 = v46;
    unint64_t v17 = v45;
    uint64_t v14 = 0;
    id v12 = v44;
    char v13 = loga;
    uint64_t v33 = v52;
    goto LABEL_23;
  }
  unint64_t v32 = (void *)v56;
  id v35 = SPLogForSPLogCategoryQuery();
  os_log_type_t v36 = 2 * (*MEMORY[0x263F67540] == 0);
  if (os_log_type_enabled(v35, v36))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v59 = v12;
    _os_log_impl(&dword_235D0B000, v35, v36, "Found #apphistory item for %@", buf, 0xCu);
  }

  if (v56) {
    id v37 = (void *)v56;
  }
  else {
    id v37 = v57;
  }
  [v10 setUserActivityRequiredString:v37];
  uint64_t v38 = [v11 objectForKeyedSubscript:*MEMORY[0x263F02958]];
  int v39 = v38;
  if (v38) {
    objc_msgSend(v10, "setPubliclyIndexable:", objc_msgSend(v38, "BOOLValue"));
  }
  [(SPSearchTopHitResult *)v53 setupGenericItem:v10 attrs:v11 utiType:v13 bundleID:v12];

  unint64_t v31 = v54;
  uint64_t v33 = v52;
LABEL_23:
}

uint64_t __80__SPSearchTopHitResult_populateCoreSpotlightResult_attrs_bundleID_queryContext___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F089C0] whitespaceAndNewlineCharacterSet];
  char v1 = (void *)populateCoreSpotlightResult_attrs_bundleID_queryContext__sTrimSet;
  populateCoreSpotlightResult_attrs_bundleID_queryContext__sTrimSet = v0;

  uint64_t v2 = (void *)populateCoreSpotlightResult_attrs_bundleID_queryContext__sTrimSet;
  return objc_msgSend(v2, "addCharactersInRange:", 65532, 0xFFFFLL);
}

- (void)populateAttributesForResult:(id)a3 withAttrs:(id)a4
{
  v536[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v291 = *MEMORY[0x263F02458];
  uint64_t v7 = objc_msgSend(v6, "objectForKeyedSubscript:");
  unsigned int v288 = BOOLValueForAttr(v7);

  uint64_t v290 = *MEMORY[0x263F01E10];
  uint64_t v8 = objc_msgSend(v6, "objectForKeyedSubscript:");
  unsigned int v287 = BOOLValueForAttr(v8);

  uint64_t v289 = *MEMORY[0x263F02348];
  BOOL v9 = objc_msgSend(v6, "objectForKeyedSubscript:");
  if (v9)
  {
    id v10 = v9;
    id v11 = NSNumber;
    [v9 doubleValue];
    v534 = [v11 numberWithDouble:v12 * 1000000.0];
  }
  else
  {
    v534 = 0;
  }
  uint64_t v277 = *MEMORY[0x263F01D08];
  uint64_t v13 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v274 = *MEMORY[0x263F01D20];
  v532 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v279 = *MEMORY[0x263F01D58];
  v531 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v284 = *MEMORY[0x263F01D90];
  v530 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v282 = *MEMORY[0x263F01D98];
  v529 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v286 = *MEMORY[0x263F01DB0];
  v528 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v283 = *MEMORY[0x263F01DB8];
  v527 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v281 = *MEMORY[0x263F01DC0];
  v526 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v285 = *MEMORY[0x263F01DE0];
  v525 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v276 = *MEMORY[0x263F01DD0];
  v524 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v280 = *MEMORY[0x263F01DD8];
  v523 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v278 = *MEMORY[0x263F01DE8];
  v522 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v275 = *MEMORY[0x263F01E00];
  v521 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v305 = *MEMORY[0x263F02658];
  v520 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v306 = *MEMORY[0x263F028B0];
  uint64_t v14 = objc_msgSend(v6, "objectForKeyedSubscript:");
  unsigned int v297 = BOOLValueForAttr(v14);

  uint64_t v304 = *MEMORY[0x263F026A8];
  v519 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v303 = *MEMORY[0x263F026B0];
  v518 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v302 = *MEMORY[0x263F026B8];
  v517 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v169 = *MEMORY[0x263F026C0];
  v516 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v309 = *MEMORY[0x263F026F0];
  v515 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v298 = *MEMORY[0x263F026E8];
  v514 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v296 = *MEMORY[0x263F026D8];
  v513 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v293 = *MEMORY[0x263F026E0];
  v512 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v292 = *MEMORY[0x263F026D0];
  v511 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v294 = *MEMORY[0x263F02038];
  v510 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v295 = *MEMORY[0x263F02710];
  v509 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v301 = *MEMORY[0x263F02780];
  v508 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v300 = *MEMORY[0x263F02770];
  v507 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v299 = *MEMORY[0x263F02798];
  v506 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v15 = [v6 objectForKeyedSubscript:*MEMORY[0x263F02A28]];
  v533 = (void *)v13;
  if ([v15 count] != 2) {
    goto LABEL_11;
  }
  uint64_t v16 = [v15 objectAtIndexedSubscript:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }
  unint64_t v17 = [v15 objectAtIndexedSubscript:0];
  char v18 = [v17 isEqualToString:@"kMDItemTextContent"];

  uint64_t v19 = 0;
  if ((v18 & 1) == 0)
  {
    id v20 = [v15 objectAtIndexedSubscript:1];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v19 = [v15 objectAtIndexedSubscript:1];
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      char v22 = objc_opt_isKindOfClass();

      if (v22)
      {
        char v23 = [v15 objectAtIndexedSubscript:1];
        v536[0] = v23;
        uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v536 count:1];

        goto LABEL_12;
      }
LABEL_11:
      uint64_t v19 = 0;
    }
  }
LABEL_12:

  uint64_t v273 = *MEMORY[0x263F027C8];
  v504 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v272 = *MEMORY[0x263F027F0];
  v503 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v271 = *MEMORY[0x263F027E8];
  v502 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v128 = *MEMORY[0x263F02950];
  v501 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v270 = *MEMORY[0x263F02800];
  v500 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v269 = *MEMORY[0x263F027D8];
  v499 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v268 = *MEMORY[0x263F027F8];
  v498 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v267 = *MEMORY[0x263F027D0];
  v497 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v266 = *MEMORY[0x263F02808];
  v496 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v265 = *MEMORY[0x263F02818];
  v495 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v264 = *MEMORY[0x263F02810];
  v494 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v263 = *MEMORY[0x263F027E0];
  v493 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v257 = *MEMORY[0x263F01F00];
  v492 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v258 = *MEMORY[0x263F01F60];
  v491 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v259 = *MEMORY[0x263F02028];
  v490 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v255 = *MEMORY[0x263F02048];
  v489 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v253 = *MEMORY[0x263F02290];
  v488 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v24 = [v6 objectForKeyedSubscript:*MEMORY[0x263F024D0]];
  uint64_t v260 = *MEMORY[0x263F01F80];
  v487 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v25 = [v6 objectForKeyedSubscript:*MEMORY[0x263F02830]];
  uint64_t v262 = *MEMORY[0x263F02858];
  v486 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v208 = *MEMORY[0x263F01D88];
  v485 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v200 = *MEMORY[0x263F01D80];
  v484 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v220 = *MEMORY[0x263F01E08];
  v483 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v238 = *MEMORY[0x263F02030];
  v482 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v243 = *MEMORY[0x263F024D8];
  v481 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v240 = *MEMORY[0x263F02508];
  v480 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v242 = *MEMORY[0x263F028A8];
  uint64_t v26 = objc_msgSend(v6, "objectForKeyedSubscript:");
  unsigned int v236 = BOOLValueForAttr(v26);

  uint64_t v261 = *MEMORY[0x263F02850];
  v479 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v176 = *MEMORY[0x263F01D48];
  v478 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v186 = *MEMORY[0x263F01DA0];
  v477 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v198 = *MEMORY[0x263F01E40];
  v476 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v203 = *MEMORY[0x263F01F10];
  v475 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v201 = *MEMORY[0x263F01F50];
  v474 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v194 = *MEMORY[0x263F01FA8];
  uint64_t v27 = objc_msgSend(v6, "objectForKeyedSubscript:");
  v473 = getURLString(v27);

  uint64_t v197 = *MEMORY[0x263F02000];
  v472 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v195 = *MEMORY[0x263F02010];
  v535 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v199 = *MEMORY[0x263F023D0];
  v471 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v196 = *MEMORY[0x263F024C0];
  v470 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v207 = *MEMORY[0x263F029D0];
  v469 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v206 = *MEMORY[0x263F02580];
  v468 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v204 = *MEMORY[0x263F02628];
  v467 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v227 = *MEMORY[0x263F02748];
  v466 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v228 = *MEMORY[0x263F02760];
  v465 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v232 = *MEMORY[0x263F02790];
  v464 = objc_msgSend(v6, "objectForKeyedSubscript:");
  v463 = [v6 objectForKeyedSubscript:*MEMORY[0x263F01F90]];
  uint64_t v251 = *MEMORY[0x263F02828];
  v462 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v256 = *MEMORY[0x263F02870];
  v461 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v254 = *MEMORY[0x263F028F0];
  v460 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v252 = *MEMORY[0x263F028F8];
  v459 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v250 = *MEMORY[0x263F02900];
  v458 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v249 = *MEMORY[0x263F02908];
  v457 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v246 = *MEMORY[0x263F02910];
  v456 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v248 = *MEMORY[0x263F01FF0];
  v455 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v245 = *MEMORY[0x263F02920];
  v454 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v247 = *MEMORY[0x263F02938];
  v453 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v244 = *MEMORY[0x263F02928];
  uint64_t v28 = objc_msgSend(v6, "objectForKeyedSubscript:");
  v452 = getURLString(v28);

  uint64_t v241 = *MEMORY[0x263F02960];
  v451 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v239 = *MEMORY[0x263F02968];
  v450 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v237 = *MEMORY[0x263F01F98];
  char v29 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v30 = *MEMORY[0x263F025B8];
  v449 = [v6 objectForKeyedSubscript:*MEMORY[0x263F025B8]];
  uint64_t v235 = *MEMORY[0x263F02390];
  v448 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v234 = *MEMORY[0x263F024C8];
  v447 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v233 = *MEMORY[0x263F02370];
  unint64_t v31 = objc_msgSend(v6, "objectForKeyedSubscript:");
  v446 = [v6 objectForKeyedSubscript:*MEMORY[0x263F029C8]];

  uint64_t v230 = *MEMORY[0x263F028C0];
  v445 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v229 = *MEMORY[0x263F028B8];
  v444 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v226 = *MEMORY[0x263F01E38];
  v443 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v225 = *MEMORY[0x263F02680];
  v442 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v224 = *MEMORY[0x263F02698];
  v441 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v222 = *MEMORY[0x263F02690];
  v440 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v221 = *MEMORY[0x263F02020];
  v439 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v231 = *MEMORY[0x263F01F88];
  unint64_t v32 = objc_msgSend(v6, "objectForKeyedSubscript:");
  unsigned int v223 = BOOLValueForAttr(v32);

  uint64_t v216 = *MEMORY[0x263F01EF8];
  v438 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v214 = *MEMORY[0x263F023A0];
  v437 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v213 = *MEMORY[0x263F027B0];
  v436 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v211 = *MEMORY[0x263F027B8];
  v435 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v219 = *MEMORY[0x263F025A0];
  uint64_t v33 = objc_msgSend(v6, "objectForKeyedSubscript:");
  unsigned int v217 = BOOLValueForAttr(v33);

  uint64_t v218 = *MEMORY[0x263F02598];
  uint64_t v34 = objc_msgSend(v6, "objectForKeyedSubscript:");
  unsigned int v215 = BOOLValueForAttr(v34);

  uint64_t v205 = *MEMORY[0x263F02590];
  v434 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v202 = *MEMORY[0x263F02588];
  v433 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v212 = *MEMORY[0x263F02648];
  v432 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v210 = *MEMORY[0x263F02640];
  v431 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v209 = *MEMORY[0x263F02650];
  v430 = objc_msgSend(v6, "objectForKeyedSubscript:");
  v505 = v19;
  v308 = (void *)v24;
  v307 = (void *)v25;
  if (_os_feature_enabled_impl())
  {
    uint64_t v35 = [v5 resultBundleId];
    if (v35)
    {
      os_log_type_t v36 = (void *)v35;
      id v37 = [v5 resultBundleId];
      int v38 = [v37 isEqualToString:*MEMORY[0x263F79038]];

      if (v38)
      {
        uint64_t v39 = [v5 personalAnswerString];

        v535 = (void *)v39;
      }
    }
  }
  uint64_t v193 = *MEMORY[0x263F01D38];
  v429 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v192 = *MEMORY[0x263F01EE8];
  v428 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v191 = *MEMORY[0x263F01FC0];
  v427 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v190 = *MEMORY[0x263F01FD8];
  v426 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v189 = *MEMORY[0x263F02358];
  v425 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v188 = *MEMORY[0x263F02380];
  v424 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v187 = *MEMORY[0x263F02448];
  v423 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v185 = *MEMORY[0x263F026A0];
  v422 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v184 = *MEMORY[0x263F02728];
  v421 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v183 = *MEMORY[0x263F02768];
  v420 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v182 = *MEMORY[0x263F02778];
  v419 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v181 = *MEMORY[0x263F02868];
  v418 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v180 = *MEMORY[0x263F028D0];
  v417 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v179 = *MEMORY[0x263F02570];
  v416 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v178 = *MEMORY[0x263F02450];
  v415 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v177 = *MEMORY[0x263F02610];
  v414 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v175 = *MEMORY[0x263F02618];
  v413 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v174 = *MEMORY[0x263F029A8];
  v412 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v173 = *MEMORY[0x263F029A0];
  v411 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v172 = *MEMORY[0x263F02280];
  v410 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v171 = *MEMORY[0x263F029F0];
  v409 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v170 = *MEMORY[0x263F02150];
  v408 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v168 = *MEMORY[0x263F02158];
  v407 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v167 = *MEMORY[0x263F02100];
  v406 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v166 = *MEMORY[0x263F020E8];
  v405 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v165 = *MEMORY[0x263F020F0];
  v404 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v164 = *MEMORY[0x263F020F8];
  v403 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v162 = *MEMORY[0x263F020D8];
  v402 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v161 = *MEMORY[0x263F02148];
  v401 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v160 = *MEMORY[0x263F020A8];
  v400 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v159 = *MEMORY[0x263F020C0];
  v399 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v158 = *MEMORY[0x263F02118];
  v398 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v157 = *MEMORY[0x263F02130];
  v397 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v156 = *MEMORY[0x263F02108];
  v396 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v155 = *MEMORY[0x263F020D0];
  v395 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v154 = *MEMORY[0x263F02140];
  v394 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v153 = *MEMORY[0x263F020A0];
  v393 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v152 = *MEMORY[0x263F020B8];
  v392 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v151 = *MEMORY[0x263F020C8];
  v391 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v150 = *MEMORY[0x263F020B0];
  v390 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v149 = *MEMORY[0x263F02110];
  v389 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v148 = *MEMORY[0x263F02128];
  v388 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v147 = *MEMORY[0x263F02138];
  v387 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v146 = *MEMORY[0x263F02120];
  v386 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v145 = *MEMORY[0x263F02198];
  v385 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v144 = *MEMORY[0x263F021A8];
  v384 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v143 = *MEMORY[0x263F021A0];
  v383 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v142 = *MEMORY[0x263F02178];
  v382 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v141 = *MEMORY[0x263F02188];
  v381 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v140 = *MEMORY[0x263F02180];
  v380 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v139 = *MEMORY[0x263F02190];
  v379 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v138 = *MEMORY[0x263F021F0];
  v378 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v137 = *MEMORY[0x263F01D68];
  v377 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v136 = *MEMORY[0x263F01D70];
  v376 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v135 = *MEMORY[0x263F02820];
  v375 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v134 = *MEMORY[0x263F02660];
  v374 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v133 = *MEMORY[0x263F02668];
  v373 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v132 = *MEMORY[0x263F026C8];
  v372 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v131 = *MEMORY[0x263F026F8];
  v371 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v130 = *MEMORY[0x263F02678];
  v370 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v127 = *MEMORY[0x263F021C0];
  v369 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v129 = *MEMORY[0x263F02238];
  v367 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v125 = *MEMORY[0x263F022A8];
  v368 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v126 = *MEMORY[0x263F02070];
  v366 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v124 = *MEMORY[0x263F02230];
  v365 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v123 = *MEMORY[0x263F021E8];
  v364 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v122 = *MEMORY[0x263F021C8];
  v363 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v121 = *MEMORY[0x263F02250];
  v362 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v120 = *MEMORY[0x263F02248];
  v361 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v119 = *MEMORY[0x263F02088];
  v360 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v118 = *MEMORY[0x263F02080];
  v359 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v117 = *MEMORY[0x263F02260];
  v358 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v116 = *MEMORY[0x263F02268];
  v357 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v115 = *MEMORY[0x263F01EC8];
  v356 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v114 = *MEMORY[0x263F01ED0];
  v355 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v113 = *MEMORY[0x263F01F48];
  v354 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v112 = *MEMORY[0x263F024F8];
  v353 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v111 = *MEMORY[0x263F024F0];
  v352 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v110 = *MEMORY[0x263F024E8];
  v351 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v109 = *MEMORY[0x263F02860];
  v350 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v108 = *MEMORY[0x263F02050];
  v349 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v107 = *MEMORY[0x263F02918];
  v348 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v163 = *MEMORY[0x263F02008];
  v330 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v106 = *MEMORY[0x263F02228];
  v347 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v105 = *MEMORY[0x263F021D0];
  v346 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v104 = *MEMORY[0x263F021E0];
  v345 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v103 = *MEMORY[0x263F02270];
  v344 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v102 = *MEMORY[0x263F02258];
  v343 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v101 = *MEMORY[0x263F02090];
  v342 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v100 = *MEMORY[0x263F02500];
  v341 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v99 = *MEMORY[0x263F01E18];
  v340 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v98 = *MEMORY[0x263F01D40];
  v339 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v97 = *MEMORY[0x263F01E30];
  v338 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v96 = *MEMORY[0x263F01EA8];
  v337 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v95 = *MEMORY[0x263F01ED8];
  v336 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v94 = *MEMORY[0x263F01E98];
  v335 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v93 = *MEMORY[0x263F01E78];
  v334 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v92 = *MEMORY[0x263F01E88];
  v333 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v91 = *MEMORY[0x263F01E68];
  v332 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v90 = *MEMORY[0x263F01E90];
  v331 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v89 = *MEMORY[0x263F01EB0];
  v329 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v88 = *MEMORY[0x263F01E60];
  v328 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v87 = *MEMORY[0x263F01E58];
  v327 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v86 = *MEMORY[0x263F01E50];
  v326 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v85 = *MEMORY[0x263F01FB8];
  v325 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v84 = *MEMORY[0x263F01FB0];
  v324 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v83 = *MEMORY[0x263F01FE8];
  v323 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v82 = *MEMORY[0x263F02060];
  v322 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v81 = *MEMORY[0x263F02700];
  v321 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v80 = *MEMORY[0x263F02930];
  v320 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v78 = *MEMORY[0x263F02788];
  v319 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v79 = *MEMORY[0x263F020E0];
  v318 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v77 = *MEMORY[0x263F021D8];
  v317 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v76 = *MEMORY[0x263F02078];
  v316 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v75 = *MEMORY[0x263F02288];
  v315 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v74 = *MEMORY[0x263F022C8];
  v314 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v73 = *MEMORY[0x263F02300];
  v313 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v72 = *MEMORY[0x263F022D0];
  v312 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v71 = *MEMORY[0x263F02308];
  v311 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v70 = *MEMORY[0x263F02310];
  v310 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v68 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v67 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v69 = *MEMORY[0x263F022F0];
  uint64_t v40 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v65 = *MEMORY[0x263F02320];
  uint64_t v41 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v66 = *MEMORY[0x263F022C0];
  uint64_t v42 = objc_msgSend(v6, "objectForKeyedSubscript:");
  uint64_t v43 = [v5 contentType];
  uint64_t v44 = (void *)v43;
  if (v43) {
    uint64_t v45 = (void *)v43;
  }
  else {
    uint64_t v45 = v29;
  }
  uint64_t v46 = v5;
  id v47 = v45;

  os_log_type_t v48 = objc_opt_new();
  [v48 beginDictionary];
  long long v49 = [NSNumber numberWithBool:v288];
  [v48 encodeObject:v49 withKey:v291];

  long long v50 = [NSNumber numberWithBool:v287];
  [v48 encodeObject:v50 withKey:v290];

  [v48 encodeObject:v534 withKey:v289];
  [v48 encodeObject:v449 withKey:v30];
  [v48 encodeObject:v533 withKey:v277];
  [v48 encodeObject:v532 withKey:v274];
  [v48 encodeObject:v478 withKey:v176];
  [v48 encodeObject:v531 withKey:v279];
  [v48 encodeObject:v484 withKey:v200];
  [v48 encodeObject:v485 withKey:v208];
  [v48 encodeObject:v530 withKey:v284];
  [v48 encodeObject:v529 withKey:v282];
  [v48 encodeObject:v477 withKey:v186];
  [v48 encodeObject:v528 withKey:v286];
  [v48 encodeObject:v527 withKey:v283];
  [v48 encodeObject:v526 withKey:v281];
  [v48 encodeObject:v524 withKey:v276];
  [v48 encodeObject:v525 withKey:v285];
  [v48 encodeObject:v523 withKey:v280];
  [v48 encodeObject:v522 withKey:v278];
  [v48 encodeObject:v521 withKey:v275];
  [v48 encodeObject:v483 withKey:v220];
  [v48 encodeObject:v476 withKey:v198];
  [v48 encodeObject:v492 withKey:v257];
  [v48 encodeObject:v473 withKey:v194];
  [v48 encodeObject:v489 withKey:v255];
  [v48 encodeObject:v488 withKey:v253];
  [v48 encodeObject:v475 withKey:v203];
  [v48 encodeObject:v474 withKey:v201];
  [v48 encodeObject:v491 withKey:v258];
  [v48 encodeObject:v472 withKey:v197];
  [v48 encodeObject:v535 withKey:v195];
  [v48 encodeObject:v490 withKey:v259];
  [v48 encodeObject:v482 withKey:v238];
  [v48 encodeObject:v471 withKey:v199];
  [v48 encodeObject:v470 withKey:v196];
  [v48 encodeObject:v481 withKey:v243];
  [v48 encodeObject:v480 withKey:v240];
  long long v51 = [NSNumber numberWithBool:v236];
  [v48 encodeObject:v51 withKey:v242];

  [v48 encodeObject:v487 withKey:v260];
  [v48 encodeObject:v469 withKey:v207];
  [v48 encodeObject:v468 withKey:v206];
  [v48 encodeObject:v467 withKey:v204];
  [v48 encodeObject:v520 withKey:v305];
  long long v52 = [NSNumber numberWithBool:v297];
  [v48 encodeObject:v52 withKey:v306];

  [v48 encodeObject:v519 withKey:v304];
  [v48 encodeObject:v518 withKey:v303];
  [v48 encodeObject:v517 withKey:v302];
  [v48 encodeObject:v511 withKey:v292];
  [v48 encodeObject:v512 withKey:v293];
  [v48 encodeObject:v514 withKey:v298];
  [v48 encodeObject:v513 withKey:v296];
  [v48 encodeObject:v516 withKey:v169];
  [v48 encodeObject:v515 withKey:v309];
  [v48 encodeObject:v510 withKey:v294];
  [v48 encodeObject:v466 withKey:v227];
  [v48 encodeObject:v509 withKey:v295];
  [v48 encodeObject:v465 withKey:v228];
  [v48 encodeObject:v479 withKey:v261];
  [v48 encodeObject:v508 withKey:v301];
  [v48 encodeObject:v507 withKey:v300];
  [v48 encodeObject:v506 withKey:v299];
  [v48 encodeObject:v464 withKey:v232];
  [v48 encodeObject:v502 withKey:v271];
  [v48 encodeObject:v504 withKey:v273];
  [v48 encodeObject:v503 withKey:v272];
  [v48 encodeObject:v500 withKey:v270];
  [v48 encodeObject:v499 withKey:v269];
  [v48 encodeObject:v498 withKey:v268];
  [v48 encodeObject:v497 withKey:v267];
  [v48 encodeObject:v496 withKey:v266];
  [v48 encodeObject:v495 withKey:v265];
  [v48 encodeObject:v494 withKey:v264];
  [v48 encodeObject:v493 withKey:v263];
  [v48 encodeObject:v462 withKey:v251];
  [v48 encodeObject:v463 withKey:*MEMORY[0x263F02848]];
  [v48 encodeObject:v486 withKey:v262];
  [v48 encodeObject:v461 withKey:v256];
  [v48 encodeObject:v460 withKey:v254];
  [v48 encodeObject:v459 withKey:v252];
  [v48 encodeObject:v458 withKey:v250];
  [v48 encodeObject:v457 withKey:v249];
  [v48 encodeObject:v456 withKey:v246];
  [v48 encodeObject:v501 withKey:v128];
  [v48 encodeObject:v455 withKey:v248];
  [v48 encodeObject:v454 withKey:v245];
  [v48 encodeObject:v505 withKey:@"SSAttributeTopMatchedStrings"];
  [v48 encodeObject:v453 withKey:v247];
  [v48 encodeObject:v452 withKey:v244];
  [v48 encodeObject:v451 withKey:v241];
  [v48 encodeObject:v450 withKey:v239];
  [v48 encodeObject:v47 withKey:v237];

  [v48 encodeObject:v448 withKey:v235];
  [v48 encodeObject:v447 withKey:v234];
  [v48 encodeObject:v446 withKey:v233];
  [v48 encodeObject:v445 withKey:v230];
  [v48 encodeObject:v444 withKey:v229];
  [v48 encodeObject:v443 withKey:v226];
  [v48 encodeObject:v442 withKey:v225];
  [v48 encodeObject:v441 withKey:v224];
  [v48 encodeObject:v440 withKey:v222];
  [v48 encodeObject:v439 withKey:v221];
  [v48 encodeObject:v438 withKey:v216];
  [v48 encodeObject:v437 withKey:v214];
  [v48 encodeObject:v436 withKey:v213];
  [v48 encodeObject:v435 withKey:v211];
  long long v53 = [NSNumber numberWithBool:v223];
  [v48 encodeObject:v53 withKey:v231];

  [v48 encodeObject:v434 withKey:v205];
  [v48 encodeObject:v433 withKey:v202];
  id v54 = [NSNumber numberWithBool:v217];
  [v48 encodeObject:v54 withKey:v219];

  long long v55 = [NSNumber numberWithBool:v215];
  [v48 encodeObject:v55 withKey:v218];

  [v48 encodeObject:v432 withKey:v212];
  [v48 encodeObject:v431 withKey:v210];
  [v48 encodeObject:v430 withKey:v209];
  [v48 encodeObject:v429 withKey:v193];
  [v48 encodeObject:v428 withKey:v192];
  [v48 encodeObject:v427 withKey:v191];
  [v48 encodeObject:v426 withKey:v190];
  [v48 encodeObject:v425 withKey:v189];
  [v48 encodeObject:v424 withKey:v188];
  [v48 encodeObject:v423 withKey:v187];
  [v48 encodeObject:v422 withKey:v185];
  [v48 encodeObject:v421 withKey:v184];
  [v48 encodeObject:v420 withKey:v183];
  [v48 encodeObject:v419 withKey:v182];
  [v48 encodeObject:v418 withKey:v181];
  [v48 encodeObject:v417 withKey:v180];
  [v48 encodeObject:v416 withKey:v179];
  [v48 encodeObject:v415 withKey:v178];
  [v48 encodeObject:v414 withKey:v177];
  [v48 encodeObject:v413 withKey:v175];
  [v48 encodeObject:v412 withKey:v174];
  [v48 encodeObject:v411 withKey:v173];
  [v48 encodeObject:v410 withKey:v172];
  [v48 encodeObject:v409 withKey:v171];
  [v48 encodeObject:v408 withKey:v170];
  [v48 encodeObject:v407 withKey:v168];
  [v48 encodeObject:v406 withKey:v167];
  [v48 encodeObject:v405 withKey:v166];
  [v48 encodeObject:v404 withKey:v165];
  [v48 encodeObject:v403 withKey:v164];
  [v48 encodeObject:v402 withKey:v162];
  [v48 encodeObject:v401 withKey:v161];
  [v48 encodeObject:v400 withKey:v160];
  [v48 encodeObject:v399 withKey:v159];
  [v48 encodeObject:v398 withKey:v158];
  [v48 encodeObject:v397 withKey:v157];
  [v48 encodeObject:v396 withKey:v156];
  [v48 encodeObject:v395 withKey:v155];
  [v48 encodeObject:v394 withKey:v154];
  [v48 encodeObject:v393 withKey:v153];
  [v48 encodeObject:v392 withKey:v152];
  [v48 encodeObject:v391 withKey:v151];
  [v48 encodeObject:v390 withKey:v150];
  [v48 encodeObject:v389 withKey:v149];
  [v48 encodeObject:v388 withKey:v148];
  [v48 encodeObject:v387 withKey:v147];
  [v48 encodeObject:v386 withKey:v146];
  [v48 encodeObject:v385 withKey:v145];
  [v48 encodeObject:v384 withKey:v144];
  [v48 encodeObject:v383 withKey:v143];
  [v48 encodeObject:v382 withKey:v142];
  [v48 encodeObject:v381 withKey:v141];
  [v48 encodeObject:v380 withKey:v140];
  [v48 encodeObject:v379 withKey:v139];
  [v48 encodeObject:v378 withKey:v138];
  [v48 encodeObject:v377 withKey:v137];
  [v48 encodeObject:v376 withKey:v136];
  [v48 encodeObject:v375 withKey:v135];
  [v48 encodeObject:v374 withKey:v134];
  [v48 encodeObject:v373 withKey:v133];
  [v48 encodeObject:v372 withKey:v132];
  [v48 encodeObject:v371 withKey:v131];
  [v48 encodeObject:v370 withKey:v130];
  [v48 encodeObject:v369 withKey:v127];
  [v48 encodeObject:v368 withKey:v125];
  [v48 encodeObject:v367 withKey:v129];
  [v48 encodeObject:v366 withKey:v126];
  [v48 encodeObject:v365 withKey:v124];
  [v48 encodeObject:v364 withKey:v123];
  [v48 encodeObject:v363 withKey:v122];
  [v48 encodeObject:v362 withKey:v121];
  [v48 encodeObject:v361 withKey:v120];
  [v48 encodeObject:v360 withKey:v119];
  [v48 encodeObject:v359 withKey:v118];
  [v48 encodeObject:v358 withKey:v117];
  [v48 encodeObject:v357 withKey:v116];
  [v48 encodeObject:v356 withKey:v115];
  [v48 encodeObject:v355 withKey:v114];
  [v48 encodeObject:v354 withKey:v113];
  [v48 encodeObject:v353 withKey:v112];
  [v48 encodeObject:v352 withKey:v111];
  [v48 encodeObject:v351 withKey:v110];
  [v48 encodeObject:v350 withKey:v109];
  [v48 encodeObject:v349 withKey:v108];
  [v48 encodeObject:v348 withKey:v107];
  [v48 encodeObject:v347 withKey:v106];
  [v48 encodeObject:v346 withKey:v105];
  [v48 encodeObject:v345 withKey:v104];
  [v48 encodeObject:v344 withKey:v103];
  [v48 encodeObject:v343 withKey:v102];
  [v48 encodeObject:v342 withKey:v101];
  [v48 encodeObject:v341 withKey:v100];
  [v48 encodeObject:v340 withKey:v99];
  [v48 encodeObject:v339 withKey:v98];
  [v48 encodeObject:v338 withKey:v97];
  [v48 encodeObject:v337 withKey:v96];
  [v48 encodeObject:v336 withKey:v95];
  [v48 encodeObject:v335 withKey:v94];
  [v48 encodeObject:v334 withKey:v93];
  [v48 encodeObject:v333 withKey:v92];
  [v48 encodeObject:v332 withKey:v91];
  [v48 encodeObject:v331 withKey:v90];
  [v48 encodeObject:v329 withKey:v89];
  [v48 encodeObject:v328 withKey:v88];
  [v48 encodeObject:v327 withKey:v87];
  [v48 encodeObject:v326 withKey:v86];
  [v48 encodeObject:v325 withKey:v85];
  [v48 encodeObject:v324 withKey:v84];
  [v48 encodeObject:v323 withKey:v83];
  [v48 encodeObject:v322 withKey:v82];
  [v48 encodeObject:v321 withKey:v81];
  [v48 encodeObject:v320 withKey:v80];
  [v48 encodeObject:v319 withKey:v78];
  [v48 encodeObject:v330 withKey:v163];
  [v48 encodeObject:v318 withKey:v79];
  [v48 encodeObject:v317 withKey:v77];
  [v48 encodeObject:v316 withKey:v76];
  [v48 encodeObject:v315 withKey:v75];
  [v48 encodeObject:v314 withKey:v74];
  [v48 encodeObject:v313 withKey:v73];
  [v48 encodeObject:v312 withKey:v72];
  [v48 encodeObject:v311 withKey:v71];
  [v48 encodeObject:v310 withKey:v70];
  objc_msgSend(v48, "encodeObject:withKey:");
  objc_msgSend(v48, "encodeObject:withKey:");
  [v48 encodeObject:v40 withKey:v69];
  uint64_t v56 = (void *)v41;
  [v48 encodeObject:v41 withKey:v65];
  id v57 = (void *)v42;
  [v48 encodeObject:v42 withKey:v66];
  [v48 endDictionary];
  uint64_t v58 = [v48 data];
  uint64_t v59 = (void *)[v58 copy];
  [v46 setAttributeData:v59];

  uint64_t v60 = [v46 lastUsedDate];
  uint64_t v61 = (void *)v60;
  if (v307) {
    uint64_t v62 = (uint64_t)v307;
  }
  else {
    uint64_t v62 = (uint64_t)v308;
  }
  if (v60) {
    uint64_t v63 = v60;
  }
  else {
    uint64_t v63 = v62;
  }
  [v46 setLastUsedDate:v63];

  if (v307 && v308)
  {
    uint64_t v64 = [v307 laterDate:v308];
    [v46 setLastUsedDate:v64];
  }
}

- (CSSearchableItemAttributeSet)attributeSet
{
  return self->_attributeSet;
}

- (void)setAttributeSet:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)makeApplicationResult:(uint64_t)a1 dataclass:(NSObject *)a2 score:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_235D0B000, a2, OS_LOG_TYPE_ERROR, "Not processing app %@", (uint8_t *)&v2, 0xCu);
}

@end