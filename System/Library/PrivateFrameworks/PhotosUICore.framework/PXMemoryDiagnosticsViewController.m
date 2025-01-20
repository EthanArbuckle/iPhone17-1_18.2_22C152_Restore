@interface PXMemoryDiagnosticsViewController
- (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5;
- (PXMemoryDiagnosticsViewController)initWithMemory:(id)a3;
- (id)assetsForCurationType:(int64_t)a3;
- (id)curationDebugInformationWithOptions:(id)a3;
- (id)radarAttachmentURLs;
- (id)radarComponentInfoForRoute:(id)a3;
- (id)radarDescriptionTemplate;
- (id)radarRoutes;
- (id)radarTitleTemplate;
- (id)sourceDictionary;
@end

@implementation PXMemoryDiagnosticsViewController

- (void).cxx_destruct
{
}

- (id)radarRoutes
{
  return &unk_1F02D4C48;
}

- (id)radarDescriptionTemplate
{
  v2 = NSString;
  v3 = [(PHMemory *)self->_sourceMemory localizedTitle];
  v4 = [v2 stringWithFormat:@"\n- Do you like/dislike the memory? Why?\n\n- Is the title '%@' correct? What would be a better title?\n\n- Do you like the key asset? Would you have picked another one?\n\n- Was this the right time to show you this memory?\n\n- Did you receive a notification? If so, did you appreciate it?\n\n- Other feedback (people, music, movie, selected pictures, place, etc):\n\n", v3];

  return v4;
}

- (id)radarTitleTemplate
{
  v2 = NSString;
  v3 = [(PHMemory *)self->_sourceMemory localizedTitle];
  v4 = [v2 stringWithFormat:@"[MEMORIES] '%@'", v3];

  return v4;
}

- (id)radarComponentInfoForRoute:(id)a3
{
  int v3 = [a3 isEqualToString:@"Backend"];
  v4 = [PXCuratedAssetCollectionDiagnosticsRadarComponentInformation alloc];
  if (v3)
  {
    v5 = @"936729";
    v6 = @"Photos Memories";
    v7 = @"all";
  }
  else
  {
    v5 = @"681154";
    v6 = @"Photos UI Memories";
    v7 = @"iOS";
  }
  v8 = [(PXCuratedAssetCollectionDiagnosticsRadarComponentInformation *)v4 initWithComponentID:v5 name:v6 version:v7];
  return v8;
}

- (id)radarAttachmentURLs
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PXMemoryDiagnosticsViewController *)self sourceDictionary];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(PXCuratedAssetCollectionDiagnosticsViewController *)self fullCurationDebugInformation];
  if (v6) {
    [v5 addEntriesFromDictionary:v6];
  }
  v7 = +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:self->_sourceMemory];
  if (v7) {
    [v5 setObject:v7 forKey:@"memorySummary"];
  }
  v8 = PXFeedbackTapToRadarUtilitiesWriteDictionaryToPlistFile(v5, @"MemoryInfoAndCuration");
  if (v8) {
    [v3 addObject:v8];
  }
  v9 = v3;
  v10 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v11 = [v10 photoAnalysisClient];
  uint64_t v12 = *MEMORY[0x1E4F8AE68];
  id v20 = 0;
  v13 = [v11 requestExportGraphForPurpose:v12 error:&v20];
  id v14 = v20;

  if (v13)
  {
    v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13];
    if (v15) {
      [v9 addObject:v15];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v14;
    _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error exporting the graph for TTR: %@", buf, 0xCu);
  }
  if ([(PHMemory *)self->_sourceMemory isGenerative])
  {

    sourceMemory = self->_sourceMemory;
    id v19 = 0;
    v17 = [MEMORY[0x1E4F8E7E8] memoryCreationDiagnosticFilesForMemory:sourceMemory error:&v19];
    id v14 = v19;
    if (v17) {
      [v9 addObjectsFromArray:v17];
    }
  }
  return v9;
}

- (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5
{
  if (a5 == 3) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = a5;
  }
  sourceMemory = self->_sourceMemory;
  v9 = [(PXMemoryDiagnosticsViewController *)self sourceDictionary];
  BOOL v10 = +[PXMemoriesRelatedDiagnosticsHelper generateSectionTitles:a3 andTableContent:a4 forIndex:v7 sourceMemory:sourceMemory sourceDictionary:v9];

  return v10;
}

- (id)curationDebugInformationWithOptions:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F39228];
  id v5 = a3;
  v6 = objc_msgSend(v4, "px_deprecated_appPhotoLibrary");
  int64_t v7 = [(PHMemory *)self->_sourceMemory localIdentifier];
  uint64_t v10 = 0;
  v8 = [v6 curationDebugInformationForAssetCollectionWithLocalIdentifier:v7 options:v5 error:&v10];

  return v8;
}

- (id)sourceDictionary
{
  id v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v4 = [v3 photoAnalysisClient];
  id v5 = [(PHMemory *)self->_sourceMemory localIdentifier];
  id v14 = 0;
  v6 = [v4 requestMemoryDebugInformationForMemoryWithLocalIdentifier:v5 error:&v14];
  id v7 = v14;

  v8 = [(PHMemory *)self->_sourceMemory photosGraphProperties];
  v9 = [(PHMemory *)self->_sourceMemory localIdentifier];
  uint64_t v10 = [(PHMemory *)self->_sourceMemory photosGraphVersion];

  v11 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v12 = +[PXMemoriesRelatedDiagnosticsHelper preprocessDictionary:v8 forMemoryWithLocalIdentifier:v9 algorithmsVersion:v10 inPhotoLibrary:v11];

  return v12;
}

- (id)assetsForCurationType:(int64_t)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = [(PHMemory *)self->_sourceMemory photoLibrary];
  v6 = [v5 librarySpecificFetchOptions];

  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v15[0] = v7;
  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
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
    uint64_t v10 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:self->_sourceMemory referenceAsset:0];
    goto LABEL_9;
  }
LABEL_8:
  uint64_t v10 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:self->_sourceMemory options:v6];
LABEL_9:
  v13 = (void *)v10;

  return v13;
}

- (PXMemoryDiagnosticsViewController)initWithMemory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXMemoryDiagnosticsViewController;
  v6 = [(PXCuratedAssetCollectionDiagnosticsViewController *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    [(PXMemoryDiagnosticsViewController *)v6 setTitle:@"Memory Debug"];
    objc_storeStrong((id *)&v7->_sourceMemory, a3);
  }

  return v7;
}

@end