@interface PGGraphIngestRecipe
- (NSArray)highlightsToIngest;
- (NSArray)momentsToIngest;
- (PGGraphIngestRecipe)initWithPhotoLibrary:(id)a3;
- (id)_highlightsForLibraryAnalysis;
- (id)_momentsForLibraryAnalysis;
- (id)defaultPostprocessorsWithGraphBuilder:(id)a3;
- (id)defaultPreprocessorsWithGraphBuilder:(id)a3;
@end

@implementation PGGraphIngestRecipe

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightsToIngest, 0);
  objc_storeStrong((id *)&self->_momentsToIngest, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (id)defaultPostprocessorsWithGraphBuilder:(id)a3
{
  v28[22] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v27 = [[PGGraphIngestHomeWorkProcessor alloc] initWithGraphBuilder:v3];
  v28[0] = v27;
  v26 = [[PGGraphIngestLocationDisambiguationProcessor alloc] initWithGraphBuilder:v3];
  v28[1] = v26;
  v25 = [[PGGraphIngestFrequentLocationProcessor alloc] initWithGraphBuilder:v3];
  v28[2] = v25;
  v24 = [[PGGraphIngestPointsOfInterestProcessor alloc] initWithGraphBuilder:v3];
  v28[3] = v24;
  v23 = [[PGGraphIngestLocationsOfInterestProcessor alloc] initWithGraphBuilder:v3];
  v28[4] = v23;
  v22 = [[PGGraphIngestPublicEventsProcessor alloc] initWithGraphBuilder:v3];
  v28[5] = v22;
  v21 = [[PGGraphIngestBusinessProcessor alloc] initWithGraphBuilder:v3];
  v28[6] = v21;
  v20 = [[PGGraphIngestNextEdgesProcessor alloc] initWithGraphBuilder:v3];
  v28[7] = v20;
  v19 = [[PGGraphRelationshipTaggingProcessor alloc] initWithGraphBuilder:v3];
  v28[8] = v19;
  v18 = [[PGGraphIngestSocialGroupsProcessor alloc] initWithGraphBuilder:v3];
  v28[9] = v18;
  v17 = [[PGGraphIngestAOIBlockingProcessor alloc] initWithGraphBuilder:v3];
  v28[10] = v17;
  v16 = [[PGGraphIngestHolidaysProcessor alloc] initWithGraphBuilder:v3];
  v28[11] = v16;
  v15 = [[PGGraphIngestMeaningfulEventsProcessor alloc] initWithGraphBuilder:v3];
  v28[12] = v15;
  v4 = [[PGGraphIngestPersonAgeCategoryProcessor alloc] initWithGraphBuilder:v3];
  v28[13] = v4;
  v5 = [[PGGraphIngestPersonBiologicalSexProcessor alloc] initWithGraphBuilder:v3];
  v28[14] = v5;
  v6 = [[PGGraphIngestRelationshipProcessor alloc] initWithGraphBuilder:v3];
  v28[15] = v6;
  v7 = [[PGGraphIngestPetProcessor alloc] initWithGraphBuilder:v3];
  v28[16] = v7;
  v8 = [[PGGraphIngestEventLabelingProcessor alloc] initWithGraphBuilder:v3];
  v28[17] = v8;
  v9 = [[PGGraphIngestMusicProcessor alloc] initWithGraphBuilder:v3];
  v28[18] = v9;
  v10 = [[PGGraphIngestPersonalAestheticsProcessor alloc] initWithGraphBuilder:v3];
  v28[19] = v10;
  v11 = [[PGGraphIngestTripProcessor alloc] initWithGraphBuilder:v3];
  v28[20] = v11;
  v12 = [[PGGraphIngestMemoryProcessor alloc] initWithGraphBuilder:v3];

  v28[21] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:22];

  return v13;
}

- (id)defaultPreprocessorsWithGraphBuilder:(id)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [[PGGraphIngestPrefetchEventProcessor alloc] initWithGraphBuilder:v3];
  v5 = -[PGGraphIngestPrefetchPeopleProcessor initWithGraphBuilder:]([PGGraphIngestPrefetchPeopleProcessor alloc], "initWithGraphBuilder:", v3, v4);
  v9[1] = v5;
  v6 = [[PGGraphIngestPrefetchLocationProcessor alloc] initWithGraphBuilder:v3];

  v9[2] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];

  return v7;
}

- (id)_highlightsForLibraryAnalysis
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v13[0] = v3;
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:0];
  v13[1] = v4;
  v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v13[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  [v2 setSortDescriptors:v6];

  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %ld || kind = %ld", 0, 3);
  [v2 setPredicate:v7];

  v8 = [MEMORY[0x1E4F39238] fetchHighlightsWithOptions:v2];
  v9 = (void *)MEMORY[0x1E4F1C978];
  v10 = [v8 fetchedObjects];
  v11 = [v9 arrayWithArray:v10];

  return v11;
}

- (id)_momentsForLibraryAnalysis
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v2 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  id v3 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v20[0] = v3;
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:0];
  v20[1] = v4;
  v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v20[2] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  [v2 setSortDescriptors:v6];

  v7 = [MEMORY[0x1E4F38EE8] fetchMomentsWithOptions:v2];
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(v7, "count"));
  v9 = (void *)[v8 mutableCopy];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __49__PGGraphIngestRecipe__momentsForLibraryAnalysis__block_invoke;
  v17 = &unk_1E68EFDD8;
  id v18 = v7;
  id v19 = v9;
  id v10 = v9;
  id v11 = v7;
  [v8 enumerateIndexesUsingBlock:&v14];
  v12 = objc_msgSend(v11, "objectsAtIndexes:", v10, v14, v15, v16, v17);

  return v12;
}

void __49__PGGraphIngestRecipe__momentsForLibraryAnalysis__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) objectAtIndex:a2];
  if (![v4 estimatedAssetCount]) {
    [*(id *)(a1 + 40) removeIndex:a2];
  }
}

- (NSArray)highlightsToIngest
{
  highlightsToIngest = self->_highlightsToIngest;
  if (!highlightsToIngest)
  {
    id v4 = [(PGGraphIngestRecipe *)self _highlightsForLibraryAnalysis];
    v5 = self->_highlightsToIngest;
    self->_highlightsToIngest = v4;

    highlightsToIngest = self->_highlightsToIngest;
  }
  return highlightsToIngest;
}

- (NSArray)momentsToIngest
{
  momentsToIngest = self->_momentsToIngest;
  if (!momentsToIngest)
  {
    id v4 = [(PGGraphIngestRecipe *)self _momentsForLibraryAnalysis];
    v5 = self->_momentsToIngest;
    self->_momentsToIngest = v4;

    momentsToIngest = self->_momentsToIngest;
  }
  return momentsToIngest;
}

- (PGGraphIngestRecipe)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestRecipe;
  v6 = [(PGGraphIngestRecipe *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
  }

  return v7;
}

@end