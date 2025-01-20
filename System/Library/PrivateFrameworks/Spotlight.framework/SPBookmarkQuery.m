@interface SPBookmarkQuery
+ (BOOL)isQuerySupported:(unint64_t)a3;
+ (unsigned)searchDomain;
- (BOOL)isURLQuery;
- (void)start;
@end

@implementation SPBookmarkQuery

+ (unsigned)searchDomain
{
  return 4;
}

+ (BOOL)isQuerySupported:(unint64_t)a3
{
  return 1;
}

- (BOOL)isURLQuery
{
  return 1;
}

- (void)start
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  if (![(SPKQuery *)self sendEmptyResponseIfNecessary])
  {
    v3 = [(SPKQuery *)self queryContext];
    v4 = [v3 getTrimmedSearchString];
    v5 = (void *)[v4 mutableCopy];

    int v6 = SSEnableSpotlightTopHitPersonalizedRanking();
    v7 = [v3 disabledBundles];
    uint64_t v8 = *MEMORY[0x263F78FD8];
    if ([v7 containsObject:*MEMORY[0x263F78FD8]])
    {
    }
    else
    {
      char v9 = looksLikeURL();

      if (v9)
      {
        if ([v5 containsString:@"://"])
        {
          id v10 = v5;
        }
        else
        {
          id v10 = [NSString stringWithFormat:@"https://%@", v5];
        }
        v13 = v10;
        v15 = [NSURL URLWithString:v10];
        v16 = v15;
        if (v15
          && ([v15 scheme], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0)
          && (v18 = (void *)v17,
              [v16 host],
              v19 = objc_claimAutoreleasedReturnValue(),
              v19,
              v18,
              v19))
        {
          v20 = objc_opt_new();
          v21 = (void (**)(void, void))objc_opt_new();
          v22 = objc_opt_new();
          [v22 setIconType:1];
          v48 = v22;
          [v21 setThumbnail:v22];
          v23 = [MEMORY[0x263F679F0] textWithString:v5];
          [v21 setTitle:v23];

          v24 = [MEMORY[0x263F679B0] punchoutWithURL:v16];
          v54 = v24;
          [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
          v25 = v49 = v13;
          [v21 setPunchoutOptions:v25];

          v26 = [MEMORY[0x263F679F0] textWithString:v5];
          v53 = v26;
          v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v53 count:1];
          [v21 setDescriptions:v27];

          v28 = objc_opt_new();
          [v20 setInlineCard:v28];

          v52 = v21;
          v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
          v30 = [v20 inlineCard];
          [v30 setCardSections:v29];

          [v20 setContentURL:v49];
          [v20 setApplicationBundleIdentifier:v8];
          [v20 setSectionBundleIdentifier:v8];
          [v20 setResultBundleId:*MEMORY[0x263F79018]];
          [v20 setType:2];
          objc_msgSend(v20, "setQueryId:", objc_msgSend(v3, "queryIdent"));
          v31 = [@"userTypedURL-" stringByAppendingString:v5];
          [v20 setIdentifier:v31];

          [v20 setProtectionClass:*MEMORY[0x263F080B0]];
          if ((v6 & 1) == 0)
          {
            [v20 setIsSafariTopHit:1];
            [v20 setTopHit:SSSetTopHitWithReasonString()];
          }
          [v20 setForceNoTopHit:0];
          v32 = [v16 host];
          [v20 setCompletion:v32];

          uint64_t v33 = SSCompactRankingAttrsAlloc();
          SSCompactRankingAttrsUpdateValue();
          SSCompactRankingAttrsUpdateValue();
          SSCompactRankingAttrsUpdateValue();
          v34 = (void *)[objc_alloc(MEMORY[0x263F78D48]) initWithAttrs:v33];
          [v20 setRankingItem:v34];

          if (v6)
          {
            v35 = [v20 rankingItem];
            objc_msgSend(v35, "setBundleIDType:", objc_msgSend(v35, "bundleIDType") | 0x80);
          }
          v36 = objc_opt_new();
          [v36 setMaxInitiallyVisibleResults:1];
          [v36 setBundleIdentifier:v8];
          v37 = SSAppNameForBundleId();
          [v36 setTitle:v37];

          v51 = v20;
          v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
          [v36 setResults:v38];

          if (v6) {
            [v36 setDomain:1];
          }
          id v39 = objc_alloc(MEMORY[0x263F78D80]);
          unint64_t v40 = [(SPKQuery *)self queryGroupId];
          v50 = v36;
          v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
          v42 = (void *)[v39 initWithQueryID:v40 sections:v41];

          [v42 setTopHitIsIn:1];
          v43 = [(SPKQuery *)self responseHandler];
          ((void (**)(void, void *))v43)[2](v43, v42);

          v13 = v49;
        }
        else
        {
          v44 = SPLogForSPLogCategoryDefault();
          os_log_type_t v45 = *MEMORY[0x263F67548] ^ 1;
          if (os_log_type_enabled(v44, v45))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v13;
            _os_log_impl(&dword_235D0B000, v44, v45, "Failed to create URL from query %@", buf, 0xCu);
          }

          id v46 = objc_alloc(MEMORY[0x263F78D80]);
          unint64_t v47 = [(SPKQuery *)self queryGroupId];
          v20 = (void *)[v46 initWithQueryID:v47 sections:MEMORY[0x263EFFA68]];
          v21 = [(SPKQuery *)self responseHandler];
          ((void (**)(void, void *))v21)[2](v21, v20);
        }

        goto LABEL_23;
      }
    }
    id v11 = objc_alloc(MEMORY[0x263F78D80]);
    unint64_t v12 = [(SPKQuery *)self queryGroupId];
    v13 = (void *)[v11 initWithQueryID:v12 sections:MEMORY[0x263EFFA68]];
    v14 = [(SPKQuery *)self responseHandler];
    ((void (**)(void, void *))v14)[2](v14, v13);

LABEL_23:
  }
}

@end