@interface SSLegacySectionBuilder
+ (id)compactCardSectionForResult:(id)a3;
+ (id)supportedBundleIds;
- (id)buildSection;
@end

@implementation SSLegacySectionBuilder

+ (id)supportedBundleIds
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.spotlight.related_search";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)compactCardSectionForResult:(id)a3
{
  v3 = [a3 compactCard];
  v4 = [v3 cardSections];
  v5 = [v4 firstObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)buildSection
{
  v2 = self;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v3 = [(SSSectionBuilder *)self section];
  v4 = [v3 mutableDeepCopy];

  v5 = [(SSSectionBuilder *)v2 section];
  v6 = [v5 results];
  id v7 = (void *)[v6 copy];
  [v4 setResults:v7];

  v8 = objc_opt_new();
  v9 = objc_opt_new();
  uint64_t v10 = [(SSSectionBuilder *)v2 isTopHitSection];
  v53 = objc_opt_new();
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v11 = [v4 results];
  v51 = v8;
  v52 = v2;
  uint64_t v55 = [v11 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v55)
  {
    uint64_t v54 = *(void *)v66;
    v49 = v9;
    v50 = v4;
    unsigned int v48 = v10;
    v47 = v11;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v66 != v54) {
          objc_enumerationMutation(v11);
        }
        id v13 = *(id *)(*((void *)&v65 + 1) + 8 * v12);
        uint64_t v14 = [v13 inlineCard];
        uint64_t v56 = v12;
        if (v14)
        {
          v15 = (void *)v14;
          v16 = v13;
LABEL_8:

          id v13 = v16;
          goto LABEL_10;
        }
        v17 = [v13 compactCard];

        if (!v17)
        {
          v15 = +[SSResultBuilder resultBuilderWithResult:v13];
          v35 = [(SSSectionBuilder *)v2 queryContext];
          [v15 setQueryContext:v35];

          [v15 setIsTopHit:v10];
          v16 = [v15 buildResult];

          if ([v15 supportsClearingBackendData]) {
            [v16 clearBackendData];
          }
          if (v16) {
            [v53 addObject:v16];
          }
          goto LABEL_8;
        }
LABEL_10:
        objc_msgSend(v4, "results", v47);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        if ([v18 count] == 1) {
          int v19 = v10;
        }
        else {
          int v19 = 0;
        }
        if (v19 == 1
          && SSSnippetModernizationEnabled()
          && ([v13 usesCompactDisplay] & 1) == 0)
        {
          char v20 = [v13 shouldUseCompactDisplay];

          if (v20) {
            goto LABEL_34;
          }
          v21 = [v13 inlineCard];
          v22 = [v21 cardSections];

          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          id v18 = v22;
          uint64_t v23 = [v18 countByEnumeratingWithState:&v61 objects:v70 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v62;
            do
            {
              for (uint64_t i = 0; i != v24; ++i)
              {
                if (*(void *)v62 != v25) {
                  objc_enumerationMutation(v18);
                }
                v27 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                v28 = [v27 backgroundColor];

                if (!v28)
                {
                  v29 = objc_opt_new();
                  v30 = [v13 relatedAppIdentifier];
                  if (v30)
                  {
                    [v29 setApplicationBundleIdentifier:v30];
                  }
                  else
                  {
                    v31 = [v13 applicationBundleIdentifier];
                    if (v31)
                    {
                      [v29 setApplicationBundleIdentifier:v31];
                    }
                    else
                    {
                      v32 = [v13 sectionBundleIdentifier];
                      [v29 setApplicationBundleIdentifier:v32];
                    }
                  }

                  [v27 setBackgroundColor:v29];
                }
              }
              uint64_t v24 = [v18 countByEnumeratingWithState:&v61 objects:v70 count:16];
            }
            while (v24);
          }

          v4 = v50;
          v8 = v51;
          v2 = v52;
          v9 = v49;
          uint64_t v10 = v48;
          v11 = v47;
        }

LABEL_34:
        if (v13) {
          [v9 addObject:v13];
        }
        v33 = [(id)objc_opt_class() compactCardSectionForResult:v13];
        v34 = v33;
        if (v33)
        {
          [v33 setSpotlightBackingResult:v13];
          [v8 addObject:v34];
        }

        uint64_t v12 = v56 + 1;
      }
      while (v56 + 1 != v55);
      uint64_t v36 = [v11 countByEnumeratingWithState:&v65 objects:v71 count:16];
      uint64_t v55 = v36;
    }
    while (v36);
  }

  [(id)objc_opt_class() disambiguateUIIfNecessary:v8];
  v37 = objc_opt_new();
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v38 = v9;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v40; ++j)
      {
        if (*(void *)v58 != v41) {
          objc_enumerationMutation(v38);
        }
        id v43 = *(id *)(*((void *)&v57 + 1) + 8 * j);
        if ([v53 containsObject:v43])
        {
          uint64_t v44 = [objc_alloc((Class)objc_opt_class()) initWithResult:v43];

          id v43 = (id)v44;
        }
        [v37 addObject:v43];
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v40);
  }

  [v4 setResults:v37];
  v45 = [(SSSectionBuilder *)v52 buildButtonItem];
  [v4 setButton:v45];

  return v4;
}

@end