@interface PXHighlightDiagnosticsViewController
- (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5;
- (PXHighlightDiagnosticsViewController)initWithHighlight:(id)a3;
- (id)assetsForCurationType:(int64_t)a3;
- (id)curationDebugInformationWithOptions:(id)a3;
- (id)radarAttachmentURLs;
- (id)radarComponentInfoForRoute:(id)a3;
- (id)radarDescriptionTemplate;
- (id)radarRoutes;
- (id)radarTitleTemplate;
- (id)sourceDictionary;
@end

@implementation PXHighlightDiagnosticsViewController

- (void).cxx_destruct
{
}

- (id)radarRoutes
{
  return &unk_1F02D4D20;
}

- (id)radarDescriptionTemplate
{
  return @"We should have something sensible here";
}

- (id)radarTitleTemplate
{
  v2 = NSString;
  v3 = [(PHPhotosHighlight *)self->_sourceHighlight localizedTitle];
  v4 = [v2 stringWithFormat:@"[CURATED LIBRARY] '%@'", v3];

  return v4;
}

- (id)radarComponentInfoForRoute:(id)a3
{
  int v3 = [a3 isEqualToString:@"Backend"];
  v4 = [PXCuratedAssetCollectionDiagnosticsRadarComponentInformation alloc];
  if (v3)
  {
    v5 = @"1393602";
    v6 = @"Photos Curated Library";
    v7 = @"all";
  }
  else
  {
    v5 = @"937048";
    v6 = @"Photos UI Library";
    v7 = @"iOS";
  }
  v8 = [(PXCuratedAssetCollectionDiagnosticsRadarComponentInformation *)v4 initWithComponentID:v5 name:v6 version:v7];
  return v8;
}

- (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5
{
  sourceHighlight = self->_sourceHighlight;
  v9 = [(PXHighlightDiagnosticsViewController *)self sourceDictionary];
  LOBYTE(a5) = +[PXHighlightDiagnosticsHelper generateSectionTitles:a3 andTableContent:a4 forIndex:a5 sourceHighlight:sourceHighlight sourceDictionary:v9];

  return a5;
}

- (id)curationDebugInformationWithOptions:(id)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v6 = [(PHPhotosHighlight *)self->_sourceHighlight localIdentifier];
  id v41 = 0;
  v33 = v4;
  id v7 = [v5 curationDebugInformationForAssetCollectionWithLocalIdentifier:v6 options:v4 error:&v41];
  id v8 = v41;

  if ([(PHPhotosHighlight *)self->_sourceHighlight kind] == 3)
  {
    v9 = [v5 librarySpecificFetchOptions];
    v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v43[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    [v9 setSortDescriptors:v11];

    v29 = v9;
    v12 = [MEMORY[0x1E4F39238] fetchChildDayGroupHighlightsForHighlight:self->_sourceHighlight options:v9];
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v7 count]) {
      id v13 = 0;
    }
    else {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v30 = v7;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v12;
    uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v38;
      do
      {
        uint64_t v17 = 0;
        v18 = v8;
        do
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v37 + 1) + 8 * v17);
          v20 = +[PXHighlightDiagnosticsHelper preprocessDictionaryForHighlight:v19 inPhotoLibrary:v5];
          v21 = (void *)[v20 mutableCopy];

          v22 = [v19 localIdentifier];
          id v36 = v18;
          v23 = [v5 curationDebugInformationForAssetCollectionWithLocalIdentifier:v22 options:v33 error:&v36];
          id v8 = v36;

          [v21 addEntriesFromDictionary:v23];
          [v32 addObject:v21];
          if (v13)
          {
            if ([v13 count])
            {
              v24 = v34;
              v34[0] = MEMORY[0x1E4F143A8];
              v34[1] = 3221225472;
              v25 = __76__PXHighlightDiagnosticsViewController_curationDebugInformationWithOptions___block_invoke_2;
            }
            else
            {
              v24 = v35;
              v35[0] = MEMORY[0x1E4F143A8];
              v35[1] = 3221225472;
              v25 = __76__PXHighlightDiagnosticsViewController_curationDebugInformationWithOptions___block_invoke;
            }
            v24[2] = v25;
            v24[3] = &unk_1E5DC3C68;
            v24[4] = v13;
            [v23 enumerateKeysAndObjectsUsingBlock:v24];
          }
          ++v17;
          v18 = v8;
        }
        while (v15 != v17);
        uint64_t v15 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v15);
    }

    if (v13)
    {
      v26 = v32;
      [v13 setObject:v32 forKeyedSubscript:@"childDebugInfos"];
      id v7 = v13;
      v27 = v30;
    }
    else
    {
      v27 = v30;
      id v7 = (id)[v30 mutableCopy];
      v26 = v32;
      [v7 setObject:v32 forKeyedSubscript:@"childDebugInfos"];
    }
  }
  return v7;
}

void __76__PXHighlightDiagnosticsViewController_curationDebugInformationWithOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = (void *)[v5 mutableCopy];
    id v7 = [v5 objectForKeyedSubscript:@"items"];
    id v8 = (void *)[v7 mutableCopy];

    [v6 setObject:v8 forKeyedSubscript:@"items"];
    v9 = [v5 objectForKeyedSubscript:@"rootCluster"];
    v10 = (void *)[v9 mutableCopy];

    [v6 setObject:v10 forKeyedSubscript:@"rootCluster"];
    v11 = [v10 objectForKeyedSubscript:@"sortedObjects"];
    v12 = (void *)[v11 mutableCopy];

    [v10 setObject:v12 forKeyedSubscript:@"sortedObjects"];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v13];
  }
  else
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v13];
  }
}

void __76__PXHighlightDiagnosticsViewController_curationDebugInformationWithOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v18 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v18];
    id v7 = [v6 objectForKeyedSubscript:@"items"];
    id v8 = [v5 objectForKeyedSubscript:@"items"];
    [v7 addEntriesFromDictionary:v8];

    v9 = [v5 objectForKeyedSubscript:@"rootCluster"];
    v10 = [v6 objectForKeyedSubscript:@"rootCluster"];
    v11 = NSNumber;
    v12 = [v10 objectForKeyedSubscript:@"totalNumberOfItems"];
    uint64_t v13 = [v12 unsignedIntegerValue];
    uint64_t v14 = [v9 objectForKeyedSubscript:@"totalNumberOfItems"];
    uint64_t v15 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + v13);
    [v10 setObject:v15 forKeyedSubscript:@"totalNumberOfItems"];

    uint64_t v16 = [v10 objectForKeyedSubscript:@"sortedObjects"];
    uint64_t v17 = [v9 objectForKeyedSubscript:@"sortedObjects"];
    [v16 addObjectsFromArray:v17];
  }
}

- (id)sourceDictionary
{
  sourceHighlight = self->_sourceHighlight;
  int v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v4 = +[PXHighlightDiagnosticsHelper preprocessDictionaryForHighlight:sourceHighlight inPhotoLibrary:v3];

  return v4;
}

- (id)radarAttachmentURLs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PXHighlightDiagnosticsViewController *)self sourceDictionary];
  id v5 = (void *)[v4 mutableCopy];

  v6 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self fullCurationDebugInformation];
  if (v6) {
    [v5 addEntriesFromDictionary:v6];
  }
  id v7 = PXFeedbackTapToRadarUtilitiesWriteDictionaryToPlistFile(v5, @"Photos-Highlight-Debug-Curation");
  if (v7) {
    [v3 addObject:v7];
  }
  id v8 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self hostLayoutDiagnosticDescription];
  v9 = PXFeedbackTapToRadarUtilitiesWriteStringToFileWithExtension(v8, @"Photos-Highlight-Debug-Layout", @"txt");
  if (v9) {
    [v3 addObject:v9];
  }
  v10 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self hostViewDiagnosticDescription];
  v11 = PXFeedbackTapToRadarUtilitiesWriteStringToFileWithExtension(v10, @"Photos-Highlight-Debug-View", @"txt");
  if (v11) {
    [v3 addObject:v11];
  }

  return v3;
}

- (id)assetsForCurationType:(int64_t)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = [(PHPhotosHighlight *)self->_sourceHighlight photoLibrary];
  v6 = [v5 librarySpecificFetchOptions];

  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v15[0] = v7;
  id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v15[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v6 setSortDescriptors:v9];

  [v6 setHighlightCurationType:0];
  if ((unint64_t)(a3 - 1) < 2)
  {
    v11 = v6;
    uint64_t v12 = 1;
LABEL_7:
    [v11 setHighlightCurationType:v12];
    goto LABEL_8;
  }
  if (a3 == 3)
  {
    v11 = v6;
    uint64_t v12 = 2;
    goto LABEL_7;
  }
  if (!a3)
  {
    uint64_t v10 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:self->_sourceHighlight referenceAsset:0];
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v10 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:self->_sourceHighlight options:v6];
LABEL_9:
  uint64_t v13 = (void *)v10;

  return v13;
}

- (PXHighlightDiagnosticsViewController)initWithHighlight:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXHighlightDiagnosticsViewController;
  v6 = [(PXCuratedAssetCollectionDiagnosticsViewController *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    [(PXHighlightDiagnosticsViewController *)v6 setTitle:@"Highlight Debug"];
    objc_storeStrong((id *)&v7->_sourceHighlight, a3);
  }

  return v7;
}

@end