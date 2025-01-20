@interface PGPhotosChallengePublicEventAlgorithmWrapper
- (PGPhotosChallengePublicEventAlgorithmWrapper)initWithEvaluationContext:(id)a3;
- (unsigned)predictedQuestionStateForAssetUUID:(id)a3 publicEventMUID:(unint64_t)a4;
@end

@implementation PGPhotosChallengePublicEventAlgorithmWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicEventDisambiguator, 0);
  objc_storeStrong((id *)&self->_publicEventManager, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

- (unsigned)predictedQuestionStateForAssetUUID:(id)a3 publicEventMUID:(unint64_t)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PHPhotoLibrary *)self->_photoLibrary librarySpecificFetchOptions];
  v8 = (void *)MEMORY[0x1E4F38EB8];
  v55[0] = v6;
  unsigned __int16 v9 = 1;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
  v11 = [v8 fetchAssetsWithUUIDs:v10 options:v7];
  v12 = [v11 firstObject];

  if (v12)
  {
    v13 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v12 withType:3 options:v7];
    v14 = [v13 firstObject];

    if (v14)
    {
      v15 = [(PGGraph *)self->_graph momentNodeForMoment:v14];
      if (v15)
      {
        v16 = [(CLSPublicEventManager *)self->_publicEventManager cachedPublicEventsForMuid:a4];
        if ([v16 count])
        {
          v41 = v14;
          v42 = v12;
          v43 = v7;
          id v44 = v6;
          uint64_t v17 = [(PGGraph *)self->_graph largeFrequentLocationNodes];
          publicEventDisambiguator = self->_publicEventDisambiguator;
          v19 = [(MANodeCollection *)[PGGraphMomentNodeCollection alloc] initWithNode:v15];
          id v50 = 0;
          id v51 = 0;
          id v49 = 0;
          v40 = (void *)v17;
          [(PGPublicEventDisambiguator *)publicEventDisambiguator collectConsolidatedAddressesForMomentNodes:v19 largeFrequentLocationNodes:v17 consolidatedAddresses:&v51 consolidatedAddressesByMomentIdentifier:&v50 momentNodesForConsolidatedAddresses:&v49 progressBlock:&__block_literal_global_10852];
          id v39 = v51;
          id v20 = v50;
          id v37 = v49;

          v21 = [MEMORY[0x1E4F1CA80] set];
          v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "identifier"));
          v38 = v20;
          v23 = [v20 objectForKeyedSubscript:v22];

          v24 = [PGMeaningfulEventProcessorCache alloc];
          v25 = [v15 collection];
          v26 = [(PGMeaningfulEventProcessorCache *)v24 initWithMomentNodes:v25];

          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v27 = v23;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v52 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v46;
            do
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v46 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = -[PGPublicEventDisambiguator disambiguateEvents:forTimeLocationTuple:momentNode:graph:meaningfulEventProcessorCache:serviceManager:](self->_publicEventDisambiguator, "disambiguateEvents:forTimeLocationTuple:momentNode:graph:meaningfulEventProcessorCache:serviceManager:", v16, *(void *)(*((void *)&v45 + 1) + 8 * i), v15, self->_graph, v26, self->_serviceManager, v37);
                [v21 unionSet:v32];
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v45 objects:v52 count:16];
            }
            while (v29);
          }

          uint64_t v33 = [v21 count];
          if (v33 == [v16 count]) {
            unsigned __int16 v9 = 2;
          }
          else {
            unsigned __int16 v9 = 3;
          }

          v7 = v43;
          id v6 = v44;
          v14 = v41;
          v12 = v42;
        }
        else
        {
          unsigned __int16 v9 = 1;
        }
      }
      else
      {
        unsigned __int16 v9 = 1;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          v35 = [v14 uuid];
          *(_DWORD *)buf = 138412290;
          v54 = v35;
          unsigned __int16 v9 = 1;
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PublicEvents] No moment node found for moment with uuid: %@, skipping", buf, 0xCu);
        }
      }
    }
    else
    {
      unsigned __int16 v9 = 1;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        v34 = [v12 uuid];
        *(_DWORD *)buf = 138412290;
        v54 = v34;
        unsigned __int16 v9 = 1;
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[PublicEvents] No moment found for asset with uuid: %@, skipping", buf, 0xCu);
      }
    }
  }
  return v9;
}

- (PGPhotosChallengePublicEventAlgorithmWrapper)initWithEvaluationContext:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PGPhotosChallengePublicEventAlgorithmWrapper;
  v5 = [(PGPhotosChallengePublicEventAlgorithmWrapper *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 graph];
    graph = v5->_graph;
    v5->_graph = (PGGraph *)v6;

    uint64_t v8 = [v4 photoLibrary];
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v8;

    uint64_t v10 = [v4 serviceManager];
    serviceManager = v5->_serviceManager;
    v5->_serviceManager = (CLSServiceManager *)v10;

    uint64_t v12 = [v4 publicEventManager];
    publicEventManager = v5->_publicEventManager;
    v5->_publicEventManager = (CLSPublicEventManager *)v12;

    v14 = [PGPublicEventDisambiguator alloc];
    v15 = [v4 sceneTaxonomy];
    uint64_t v16 = [(PGPublicEventDisambiguator *)v14 initWithSceneTaxonomy:v15];
    publicEventDisambiguator = v5->_publicEventDisambiguator;
    v5->_publicEventDisambiguator = (PGPublicEventDisambiguator *)v16;
  }
  return v5;
}

@end