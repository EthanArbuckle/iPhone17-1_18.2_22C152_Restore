@interface PGPhotosChallengeMeaningAlgorithmWrapper
- (PGGraph)graph;
- (PGPhotosChallengeMeaningAlgorithmWrapper)initWithEvaluationContext:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (id)debugInformationForMeaningIdentifier:(id)a3 assetUUID:(id)a4;
- (unsigned)predictQuestionStateForMeaningIdentifier:(id)a3 assetUUID:(id)a4 params:(id)a5;
@end

@implementation PGPhotosChallengeMeaningAlgorithmWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomy, 0);
}

- (PGGraph)graph
{
  return self->_graph;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)debugInformationForMeaningIdentifier:(id)a3 assetUUID:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v7 = (void *)MEMORY[0x1E4F38EB8];
  v37[0] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  v9 = [v7 fetchAssetsWithUUIDs:v8 options:v6];
  v10 = [v9 firstObject];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v10 withType:3 options:v6];
    v12 = [v11 firstObject];

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E4F1CAD0];
      v14 = [v12 uuid];
      v15 = [v13 setWithObject:v14];
      v16 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:v15 inGraph:self->_graph];

      if (v16)
      {
        v17 = [v16 sceneNodes];
        v18 = [v17 sceneNames];
        v34 = [v18 allObjects];

        v19 = [v16 reliableSceneNodes];
        v20 = [v19 sceneNames];
        v33 = [v20 allObjects];

        v21 = [v16 highConfidenceSceneNodes];
        v22 = [v21 sceneNames];
        v32 = [v22 allObjects];

        v23 = [v16 searchConfidenceSceneNodes];
        v24 = [v23 sceneNames];
        v31 = [v24 allObjects];

        v25 = [v34 componentsJoinedByString:@","];
        v26 = [v33 componentsJoinedByString:@","];
        v27 = [v32 componentsJoinedByString:@","];
        v28 = [v31 componentsJoinedByString:@","];
        v35[0] = @"sceneNames";
        v35[1] = @"reliableSceneNames";
        v36[0] = v25;
        v36[1] = v26;
        v35[2] = @"highConfidenceSceneNames";
        v35[3] = @"searchConfidenceSceneNames";
        v36[2] = v27;
        v36[3] = v28;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:4];
      }
      else
      {
        v29 = (void *)MEMORY[0x1E4F1CC08];
      }
    }
    else
    {
      v29 = (void *)MEMORY[0x1E4F1CC08];
    }
  }
  else
  {
    v29 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v29;
}

- (unsigned)predictQuestionStateForMeaningIdentifier:(id)a3 assetUUID:(id)a4 params:(id)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v12 = (void *)MEMORY[0x1E4F38EB8];
  v31[0] = v9;
  unsigned __int16 v13 = 1;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  v15 = [v12 fetchAssetsWithUUIDs:v14 options:v11];
  v16 = [v15 firstObject];

  if (v16)
  {
    v17 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v16 withType:3 options:v11];
    v18 = [v17 firstObject];

    if (v18)
    {
      v19 = [(PGGraph *)self->_graph momentNodeForMoment:v18];
      if (v19)
      {
        id v28 = v8;
        if ([v10 count])
        {
          id v29 = v8;
          v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
          uint64_t v21 = +[PGPhotosChallengeMeaningfulEventRequiredCriteriaFactory requiredCriteriaForIdentifiers:v20 inferenceType:0 graph:self->_graph sceneTaxonomy:self->_sceneTaxonomy params:v10];
        }
        else
        {
          id v30 = v8;
          v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
          uint64_t v21 = +[PGMeaningfulEventRequiredCriteriaFactory requiredCriteriaForIdentifiers:v20 inferenceType:0 graph:self->_graph sceneTaxonomy:self->_sceneTaxonomy];
        }
        v27 = (void *)v21;

        v22 = [PGMeaningfulEventProcessorCache alloc];
        v23 = [v19 collection];
        v24 = [(PGMeaningfulEventProcessorCache *)v22 initWithMomentNodes:v23];
        v25 = +[PGMeaningfulEventProcessor processRequiredCriteria:v27 forMoment:v19 meaningfulEventProcessorCache:v24 serviceManager:self->_serviceManager];

        if ([v25 count]) {
          unsigned __int16 v13 = 2;
        }
        else {
          unsigned __int16 v13 = 3;
        }

        id v8 = v28;
      }
      else
      {
        unsigned __int16 v13 = 1;
      }
    }
    else
    {
      unsigned __int16 v13 = 1;
    }
  }
  return v13;
}

- (PGPhotosChallengeMeaningAlgorithmWrapper)initWithEvaluationContext:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PGPhotosChallengeMeaningAlgorithmWrapper;
  id v5 = [(PGPhotosChallengeMeaningAlgorithmWrapper *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 photoLibrary];
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v6;

    uint64_t v8 = [v4 graph];
    graph = v5->_graph;
    v5->_graph = (PGGraph *)v8;

    uint64_t v10 = [v4 sceneTaxonomy];
    sceneTaxonomy = v5->_sceneTaxonomy;
    v5->_sceneTaxonomy = (CLSSceneTaxonomyHierarchy *)v10;

    uint64_t v12 = [v4 serviceManager];
    serviceManager = v5->_serviceManager;
    v5->_serviceManager = (CLSServiceManager *)v12;
  }
  return v5;
}

@end