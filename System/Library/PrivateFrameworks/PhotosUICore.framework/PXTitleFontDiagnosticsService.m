@interface PXTitleFontDiagnosticsService
+ (id)_statisticsDescriptionForAssetCollections:(id)a3 usingFontIndexBlock:(id)a4;
+ (id)diagnosticsDescriptionForAssetCollections:(id)a3;
- (BOOL)canProvideContextualViewController;
- (id)contextualViewController;
- (id)title;
@end

@implementation PXTitleFontDiagnosticsService

- (id)contextualViewController
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v4 = [(PXDiagnosticsService *)self itemProviders];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v9 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierAssetCollection"])
        {
          v10 = [v9 itemForIdentifier:@"PXDiagnosticsItemIdentifierAssetCollection"];
          [v3 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  v11 = [MEMORY[0x1E4F39008] transientCollectionListWithCollections:v3 title:0];
  v12 = (void *)MEMORY[0x1E4FB1EC0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__PXTitleFontDiagnosticsService_contextualViewController__block_invoke;
  v16[3] = &unk_1E5DC5600;
  id v17 = v11;
  id v13 = v11;
  v14 = objc_msgSend(v12, "px_viewControllerWithOutput:", v16);

  return v14;
}

id __57__PXTitleFontDiagnosticsService_contextualViewController__block_invoke(uint64_t a1)
{
  v1 = [MEMORY[0x1E4F39008] fetchCollectionsInCollectionList:*(void *)(a1 + 32) options:0];
  v2 = +[PXTitleFontDiagnosticsService diagnosticsDescriptionForAssetCollections:v1];

  return v2;
}

- (BOOL)canProvideContextualViewController
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = +[PXDiagnosticsSettings sharedInstance];
  int v4 = [v3 enableTitleFontService];

  if (!v4) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(PXDiagnosticsService *)self itemProviders];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) hasItemForIdentifier:@"PXDiagnosticsItemIdentifierAssetCollection"])
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (id)title
{
  return @"Title Font Diagnostics";
}

+ (id)_statisticsDescriptionForAssetCollections:(id)a3 usingFontIndexBlock:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (uint64_t (**)(id, void))a4;
  uint64_t v7 = [MEMORY[0x1E4F38EE8] defaultTitleFontNames];
  unint64_t v8 = [v7 count];

  id v9 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  unint64_t v11 = 0x1E4F28000uLL;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v36;
    do
    {
      uint64_t v28 = v13;
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        unint64_t v16 = v6[2](v6, *(void *)(*((void *)&v35 + 1) + 8 * i));
        if (v16 >= v8)
        {
          [v9 addObject:@"Other"];
        }
        else
        {
          [*(id *)(v11 + 3792) numberWithUnsignedInteger:v16];
          v18 = unint64_t v17 = v11;
          [v9 addObject:v18];

          unint64_t v11 = v17;
        }
      }
      uint64_t v13 = v28 + v12;
      uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v13 = 0;
  }

  long long v19 = [MEMORY[0x1E4F28E78] string];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__PXTitleFontDiagnosticsService__statisticsDescriptionForAssetCollections_usingFontIndexBlock___block_invoke;
  aBlock[3] = &unk_1E5DC5650;
  id v29 = v9;
  id v32 = v29;
  uint64_t v34 = v13;
  id v27 = v19;
  id v33 = v27;
  long long v20 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  if (v8)
  {
    unint64_t v21 = v11;
    for (uint64_t j = 0; j != v8; ++j)
    {
      uint64_t v23 = [*(id *)(v21 + 3792) numberWithUnsignedInteger:j];
      v24 = objc_msgSend(NSString, "stringWithFormat:", @"index:%li", j);
      v20[2](v20, v23, v24);
    }
  }
  if ([v29 containsObject:@"Other"]) {
    v20[2](v20, @"Other", @"Other");
  }
  id v25 = v27;

  return v25;
}

void __95__PXTitleFontDiagnosticsService__statisticsDescriptionForAssetCollections_usingFontIndexBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  unint64_t v5 = [*(id *)(a1 + 32) countForObject:a2];
  float v6 = (float)((float)v5 / (float)*(unint64_t *)(a1 + 48)) * 100.0;
  [*(id *)(a1 + 40) appendFormat:@"%@\tcount:%li\t%6.1f%%\t", v8, v5, v6];
  for (unint64_t i = (unint64_t)(float)(ceilf(v6) * 0.5); i; --i)
    [*(id *)(a1 + 40) appendString:@"*"];
  [*(id *)(a1 + 40) appendString:@"\n"];
}

+ (id)diagnosticsDescriptionForAssetCollections:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F28E78] string];
  if ((unint64_t)[v4 count] >= 2)
  {
    float v6 = [MEMORY[0x1E4F38EE8] defaultTitleFontNames];
    objc_msgSend(v5, "appendFormat:", @"Count: %li\n\n", objc_msgSend(v4, "count"));
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke;
    v53[3] = &unk_1E5DC5628;
    id v7 = v6;
    id v54 = v7;
    id v8 = [a1 _statisticsDescriptionForAssetCollections:v4 usingFontIndexBlock:v53];
    id v9 = objc_msgSend(v8, "px_stringByIndentingNewLines");
    [v5 appendFormat:@"Font Distribution:\n\t%@\n", v9];

    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke_2;
    v51[3] = &unk_1E5DC5628;
    id v10 = v7;
    id v52 = v10;
    unint64_t v11 = [a1 _statisticsDescriptionForAssetCollections:v4 usingFontIndexBlock:v51];
    uint64_t v12 = objc_msgSend(v11, "px_stringByIndentingNewLines");
    [v5 appendFormat:@"Creation Date Hash Distribution:\n\t%@\n", v12];

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke_3;
    v49[3] = &unk_1E5DC5628;
    id v50 = v10;
    id v13 = v10;
    uint64_t v14 = [a1 _statisticsDescriptionForAssetCollections:v4 usingFontIndexBlock:v49];
    long long v15 = objc_msgSend(v14, "px_stringByIndentingNewLines");
    [v5 appendFormat:@"Title Hash Distribution:\n\t%@\n", v15];

    [v5 appendString:@"Font Names:\n"];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke_4;
    v47[3] = &unk_1E5DCAEA0;
    id v16 = v5;
    id v48 = v16;
    [v13 enumerateObjectsUsingBlock:v47];
    [v16 appendString:@"\n"];
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v4;
  uint64_t v17 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    long long v19 = @"Assect Collection: %@\n";
    unint64_t v20 = 0x1E4F39000uLL;
    uint64_t v21 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        objc_msgSend(v5, "appendFormat:", v19, v23);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v24 = v23;
          v42 = [v24 photosGraphProperties];
          [v42 objectForKeyedSubscript:@"titleCategory"];
          v26 = id v25 = v19;
          [v5 appendFormat:@"Title Category (from Graph data): %@\n", v26];

          id v27 = *(void **)(v20 + 352);
          [v24 movieData];
          uint64_t v28 = v18;
          v30 = unint64_t v29 = v20;
          v31 = [v27 titleFontNameFromMovieData:v30];
          [v5 appendFormat:@"Font Name (from Movie data): %@\n", v31];

          long long v19 = v25;
          unint64_t v20 = v29;
          uint64_t v18 = v28;
        }
        uint64_t v32 = [v23 titleCategory];
        id v33 = objc_msgSend(MEMORY[0x1E4F38EE8], "descriptionOfTitleCategory:", objc_msgSend(v23, "titleCategory"));
        [v5 appendFormat:@"Title Category: %i “%@”\n", v32, v33];

        uint64_t v34 = [v23 creationDate];
        [v5 appendFormat:@"Creation Date: %@\n", v34];

        long long v35 = (void *)MEMORY[0x1E4F38EE8];
        long long v36 = [v23 creationDate];
        objc_msgSend(v5, "appendFormat:", @"Creation Date Hash: %li\n", objc_msgSend(v35, "titleFontNameHashFromDate:", v36));

        long long v37 = (void *)MEMORY[0x1E4F38EE8];
        long long v38 = [v23 title];
        objc_msgSend(v5, "appendFormat:", @"Title Hash: %li\n", objc_msgSend(v37, "titleFontNameHashFromString:", v38));

        v39 = [v23 titleFontName];
        [v5 appendFormat:@"Font Name: %@\n", v39];

        [v5 appendString:@"\n"];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v43 objects:v55 count:16];
    }
    while (v18);
  }

  return v5;
}

uint64_t __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 titleFontName];
  uint64_t v4 = [v2 indexOfObject:v3];

  return v4;
}

unint64_t __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F38EE8];
  uint64_t v4 = [a2 creationDate];
  unint64_t v5 = [v3 titleFontNameHashFromDate:v4];
  unint64_t v6 = v5 % [*(id *)(a1 + 32) count];

  return v6;
}

unint64_t __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F38EE8];
  uint64_t v4 = [a2 title];
  unint64_t v5 = [v3 titleFontNameHashFromString:v4];
  unint64_t v6 = v5 % [*(id *)(a1 + 32) count];

  return v6;
}

uint64_t __75__PXTitleFontDiagnosticsService_diagnosticsDescriptionForAssetCollections___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"\t%li:\t%@\n", a3, a2];
}

@end