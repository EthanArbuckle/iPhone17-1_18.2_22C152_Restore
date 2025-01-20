@interface PGGraphPortraitDonationEnrichmentProcessor
+ (NSString)graphDonationBundleId;
- (BOOL)_shouldProcessGraphUpdate:(id)a3;
- (NSCountedSet)addressNodes;
- (NSCountedSet)businessNodes;
- (NSCountedSet)meaningNodes;
- (NSCountedSet)performerNodes;
- (NSCountedSet)poiNodes;
- (NSCountedSet)publicEventNodes;
- (NSCountedSet)roiNodes;
- (NSMutableDictionary)datesByAddressNode;
- (id)_knowledgeToDonateFromAccumulatedNodesWithProgressBlock:(id)a3;
- (id)_locationNamedEntitiesFromAddressNodes:(id)a3 dates:(id)a4 currentProgress:(double *)a5 progressFraction:(double)a6 progressBlock:(id)a7;
- (id)_namedEntitiesFromNamedEntityNodes:(id)a3 currentProgress:(double *)a4 progressFraction:(double)a5 progressBlock:(id)a6;
- (id)_topicsFromTopicNodes:(id)a3 currentProgress:(double *)a4 progressFraction:(double)a5 progressBlock:(id)a6;
- (void)_accumulateKnowledgeNodesFromMomentNodes:(id)a3 progressBlock:(id)a4;
- (void)_donateKnowledge:(id)a3 donationDate:(id)a4 loggingConnection:(id)a5;
- (void)_donateKnowledgeWithManager:(id)a3 progressBlock:(id)a4;
- (void)_prepareForKnowledgeDonation;
- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6;
@end

@implementation PGGraphPortraitDonationEnrichmentProcessor

+ (NSString)graphDonationBundleId
{
  return (NSString *)@"com.apple.mobileslideshow";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressNodes, 0);
  objc_storeStrong((id *)&self->_datesByAddressNode, 0);
  objc_storeStrong((id *)&self->_performerNodes, 0);
  objc_storeStrong((id *)&self->_publicEventNodes, 0);
  objc_storeStrong((id *)&self->_businessNodes, 0);
  objc_storeStrong((id *)&self->_roiNodes, 0);
  objc_storeStrong((id *)&self->_poiNodes, 0);
  objc_storeStrong((id *)&self->_meaningNodes, 0);
}

- (NSCountedSet)addressNodes
{
  return self->_addressNodes;
}

- (NSMutableDictionary)datesByAddressNode
{
  return self->_datesByAddressNode;
}

- (NSCountedSet)performerNodes
{
  return self->_performerNodes;
}

- (NSCountedSet)publicEventNodes
{
  return self->_publicEventNodes;
}

- (NSCountedSet)businessNodes
{
  return self->_businessNodes;
}

- (NSCountedSet)roiNodes
{
  return self->_roiNodes;
}

- (NSCountedSet)poiNodes
{
  return self->_poiNodes;
}

- (NSCountedSet)meaningNodes
{
  return self->_meaningNodes;
}

- (id)_namedEntitiesFromNamedEntityNodes:(id)a3 currentProgress:(double *)a4 progressFraction:(double)a5 progressBlock:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  if (!a4)
  {
    uint64_t v40 = 0;
    a4 = (double *)&v40;
  }
  uint64_t v11 = [v9 count];
  if (!v11)
  {
    id v18 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_31;
  }
  unint64_t v12 = v11;
  unint64_t v13 = objc_msgSend(v9, "pg_accumulatedCount");
  double v14 = *a4;
  v15 = (void (**)(void *, unsigned char *, double))_Block_copy(v10);
  double v16 = 0.0;
  if (!v15) {
    goto LABEL_12;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current < 0.01) {
    goto LABEL_12;
  }
  char v39 = 0;
  v15[2](v15, &v39, v14);
  if (!v39)
  {
    double v16 = Current;
LABEL_12:
    v34 = a4;
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v20 = v9;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      double v23 = a5 / (double)v12;
      uint64_t v24 = *(void *)v36;
      double v25 = (double)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v36 != v24) {
            objc_enumerationMutation(v20);
          }
          v27 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          unint64_t v28 = [v20 countForObject:v27];
          uint64_t v29 = objc_msgSend(v27, "pg_namedEntity");
          if (v29)
          {
            v30 = (void *)v29;
            v31 = (void *)[objc_alloc(MEMORY[0x1E4F89F00]) initWithItem:v29 score:(double)v28 / v25];
            [v19 addObject:v31];
            double v14 = v23 + v14;
            if (v15)
            {
              double v32 = CFAbsoluteTimeGetCurrent();
              if (v32 - v16 >= 0.01)
              {
                char v39 = 0;
                v15[2](v15, &v39, v14);
                if (v39)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    int v43 = 507;
                    __int16 v44 = 2080;
                    v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  id v18 = (id)MEMORY[0x1E4F1CBF0];
                  goto LABEL_29;
                }
                double v16 = v32;
              }
            }
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    double *v34 = v14;
    id v18 = v19;
LABEL_29:

    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v43 = 489;
    __int16 v44 = 2080;
    v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data M"
          "odel Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v18 = (id)MEMORY[0x1E4F1CBF0];
LABEL_30:

LABEL_31:
  return v18;
}

- (id)_locationNamedEntitiesFromAddressNodes:(id)a3 dates:(id)a4 currentProgress:(double *)a5 progressFraction:(double)a6 progressBlock:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v47 = a4;
  id v12 = a7;
  if (!a5)
  {
    uint64_t v57 = 0;
    a5 = (double *)&v57;
  }
  uint64_t v13 = [v11 count];
  if (!v13)
  {
    id v20 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_39;
  }
  unint64_t v14 = v13;
  unint64_t v15 = objc_msgSend(v11, "pg_accumulatedCount");
  double v16 = *a5;
  v17 = (void (**)(void *, unsigned char *, double))_Block_copy(v12);
  double v18 = 0.0;
  if (!v17) {
    goto LABEL_12;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current < 0.01) {
    goto LABEL_12;
  }
  char v56 = 0;
  v17[2](v17, &v56, v16);
  if (!v56)
  {
    double v18 = Current;
LABEL_12:
    uint64_t v40 = a5;
    id v42 = v12;
    uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v41 = v11;
    id v22 = v11;
    uint64_t v46 = [v22 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v46)
    {
      double v23 = a6 / (double)v14;
      uint64_t v45 = *(void *)v53;
      double v24 = (double)v15;
      id v43 = v22;
      __int16 v44 = v17;
      while (2)
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v53 != v45) {
            objc_enumerationMutation(v22);
          }
          v26 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          unint64_t v27 = [v22 countForObject:v26];
          unint64_t v28 = [v47 objectForKeyedSubscript:v26];
          if ([v28 count])
          {
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v29 = v28;
            uint64_t v30 = [v29 countByEnumeratingWithState:&v48 objects:v58 count:16];
            if (v30)
            {
              uint64_t v31 = v30;
              double v32 = (double)v27 / v24;
              uint64_t v33 = *(void *)v49;
LABEL_20:
              uint64_t v34 = 0;
              while (1)
              {
                if (*(void *)v49 != v33) {
                  objc_enumerationMutation(v29);
                }
                uint64_t v35 = *(void *)(*((void *)&v48 + 1) + 8 * v34);
                long long v36 = objc_msgSend(v26, "pg_locationNamedEntity");
                if (!v36) {
                  break;
                }
                long long v37 = v36;
                [v36 setScore:v32];
                [v37 setDate:v35];
                [v21 addObject:v37];

                if (v31 == ++v34)
                {
                  uint64_t v31 = [v29 countByEnumeratingWithState:&v48 objects:v58 count:16];
                  if (v31) {
                    goto LABEL_20;
                  }
                  break;
                }
              }
            }

            id v22 = v43;
            v17 = v44;
          }
          double v16 = v23 + v16;
          if (v17)
          {
            double v38 = CFAbsoluteTimeGetCurrent();
            if (v38 - v18 >= 0.01)
            {
              char v56 = 0;
              v17[2](v17, &v56, v16);
              if (v56)
              {
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  int v61 = 463;
                  __int16 v62 = 2080;
                  v63 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                id v20 = (id)MEMORY[0x1E4F1CBF0];
                goto LABEL_37;
              }
              double v18 = v38;
            }
          }
        }
        uint64_t v46 = [v22 countByEnumeratingWithState:&v52 objects:v59 count:16];
        if (v46) {
          continue;
        }
        break;
      }
    }

    *uint64_t v40 = v16;
    id v20 = v21;
LABEL_37:
    id v11 = v41;

    id v12 = v42;
    goto LABEL_38;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v61 = 437;
    __int16 v62 = 2080;
    v63 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data M"
          "odel Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v20 = (id)MEMORY[0x1E4F1CBF0];
LABEL_38:

LABEL_39:
  return v20;
}

- (id)_topicsFromTopicNodes:(id)a3 currentProgress:(double *)a4 progressFraction:(double)a5 progressBlock:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  if (!a4)
  {
    uint64_t v39 = 0;
    a4 = (double *)&v39;
  }
  uint64_t v11 = [v9 count];
  if (!v11)
  {
    id v18 = (id)MEMORY[0x1E4F1CC08];
    goto LABEL_30;
  }
  unint64_t v12 = v11;
  unint64_t v13 = objc_msgSend(v9, "pg_accumulatedCount");
  double v14 = *a4;
  unint64_t v15 = (void (**)(void *, unsigned char *, double))_Block_copy(v10);
  double v16 = 0.0;
  if (!v15) {
    goto LABEL_12;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current < 0.01) {
    goto LABEL_12;
  }
  char v38 = 0;
  v15[2](v15, &v38, v14);
  if (!v38)
  {
    double v16 = Current;
LABEL_12:
    uint64_t v33 = a4;
    v19 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v20 = v9;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      double v23 = a5 / (double)v12;
      uint64_t v24 = *(void *)v35;
      double v25 = (double)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v35 != v24) {
            objc_enumerationMutation(v20);
          }
          unint64_t v27 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          unint64_t v28 = [v20 countForObject:v27];
          id v29 = objc_msgSend(v27, "pg_topic");
          if (v29)
          {
            uint64_t v30 = [NSNumber numberWithDouble:(double)v28 / v25];
            [v19 setObject:v30 forKeyedSubscript:v29];

            double v14 = v23 + v14;
            if (v15)
            {
              double v31 = CFAbsoluteTimeGetCurrent();
              if (v31 - v16 >= 0.01)
              {
                char v38 = 0;
                v15[2](v15, &v38, v14);
                if (v38)
                {
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    int v42 = 411;
                    __int16 v43 = 2080;
                    __int16 v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  id v18 = (id)MEMORY[0x1E4F1CC08];
                  goto LABEL_28;
                }
                double v16 = v31;
              }
            }
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    *uint64_t v33 = v14;
    id v18 = v19;
LABEL_28:

    goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v42 = 394;
    __int16 v43 = 2080;
    __int16 v44 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data M"
          "odel Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v18 = (id)MEMORY[0x1E4F1CC08];
LABEL_29:

LABEL_30:
  return v18;
}

- (void)_donateKnowledge:(id)a3 donationDate:(id)a4 loggingConnection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(id)objc_opt_class() graphDonationBundleId];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__PGGraphPortraitDonationEnrichmentProcessor__donateKnowledge_donationDate_loggingConnection___block_invoke;
  v17[3] = &unk_1E68EF730;
  id v18 = v7;
  id v19 = v10;
  id v20 = v8;
  id v21 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v10;
  id v14 = v7;
  dispatch_block_t v15 = dispatch_block_create((dispatch_block_flags_t)0, v17);
  double v16 = dispatch_get_global_queue(0, 0);
  dispatch_async(v16, v15);

  dispatch_block_wait(v15, 0x2540BE400uLL);
}

void __94__PGGraphPortraitDonationEnrichmentProcessor__donateKnowledge_donationDate_loggingConnection___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) topics];
  if (![v2 count])
  {
    id v6 = 0;
    goto LABEL_7;
  }
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v24 = 0;
  char v5 = [MEMORY[0x1E4F89DF8] donatePhotosTopics:v2 bundleId:v3 date:v4 error:&v24];
  id v6 = v24;
  if (v5)
  {
LABEL_7:
    int v8 = 1;
    goto LABEL_8;
  }
  id v7 = *(NSObject **)(a1 + 56);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "PortraitEnrichment - Failed to donate topics with error: %@", buf, 0xCu);
  }
  int v8 = 0;
LABEL_8:
  id v9 = [*(id *)(a1 + 32) locationNamedEntities];
  uint64_t v10 = [v9 count];
  if (v8 && v10)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    id v23 = v6;
    char v12 = [MEMORY[0x1E4F89DF8] donatePhotosLocationNamedEntities:v9 bundleId:v11 error:&v23];
    id v13 = v23;

    if (v12)
    {
      int v8 = 1;
    }
    else
    {
      id v14 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v13;
        _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "PortraitEnrichment - Failed to donate location named entities with error: %@", buf, 0xCu);
      }
      int v8 = 0;
    }
  }
  else
  {
    id v13 = v6;
  }
  dispatch_block_t v15 = [*(id *)(a1 + 32) namedEntities];
  uint64_t v16 = [v15 count];
  if (v8 && v16)
  {
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    id v22 = v13;
    char v19 = [MEMORY[0x1E4F89DF8] donatePhotosNamedEntities:v15 bundleId:v17 date:v18 error:&v22];
    id v20 = v22;

    if ((v19 & 1) == 0)
    {
      id v21 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v20;
        _os_log_error_impl(&dword_1D1805000, v21, OS_LOG_TYPE_ERROR, "PortraitEnrichment - Failed to donate named entities with error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v20 = v13;
  }
}

- (id)_knowledgeToDonateFromAccumulatedNodesWithProgressBlock:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = (void (**)(void *, unsigned char *, double))_Block_copy(v4);
  double v29 = 0.5;
  id v6 = [(PGGraphPortraitDonationEnrichmentProcessor *)self _locationNamedEntitiesFromAddressNodes:self->_addressNodes dates:self->_datesByAddressNode currentProgress:&v29 progressFraction:v4 progressBlock:0.0714285714];
  double v7 = 0.0;
  if (!v5 || (double v8 = CFAbsoluteTimeGetCurrent(), v8 < 0.01))
  {
LABEL_8:
    uint64_t v10 = [(PGGraphPortraitDonationEnrichmentProcessor *)self _topicsFromTopicNodes:self->_meaningNodes currentProgress:&v29 progressFraction:v4 progressBlock:0.0714285714];
    if (v5)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v7 >= 0.01)
      {
        char v28 = 0;
        v5[2](v5, &v28, v29);
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v31 = 300;
            __int16 v32 = 2080;
            uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v9 = 0;
          goto LABEL_55;
        }
        double v7 = Current;
      }
    }
    char v12 = [(PGGraphPortraitDonationEnrichmentProcessor *)self _topicsFromTopicNodes:self->_roiNodes currentProgress:&v29 progressFraction:v4 progressBlock:0.0714285714];
    if (v5)
    {
      double v13 = CFAbsoluteTimeGetCurrent();
      if (v13 - v7 >= 0.01)
      {
        char v28 = 0;
        v5[2](v5, &v28, v29);
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v31 = 303;
            __int16 v32 = 2080;
            uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v9 = 0;
          goto LABEL_54;
        }
        double v7 = v13;
      }
    }
    id v14 = [(PGGraphPortraitDonationEnrichmentProcessor *)self _topicsFromTopicNodes:self->_poiNodes currentProgress:&v29 progressFraction:v4 progressBlock:0.0714285714];
    if (v5)
    {
      double v15 = CFAbsoluteTimeGetCurrent();
      if (v15 - v7 >= 0.01)
      {
        char v28 = 0;
        v5[2](v5, &v28, v29);
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v31 = 306;
            __int16 v32 = 2080;
            uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v9 = 0;
          goto LABEL_53;
        }
        double v7 = v15;
      }
    }
    uint64_t v16 = [(PGGraphPortraitDonationEnrichmentProcessor *)self _namedEntitiesFromNamedEntityNodes:self->_businessNodes currentProgress:&v29 progressFraction:v4 progressBlock:0.0714285714];
    id v26 = (void *)v16;
    if (v5)
    {
      double v17 = CFAbsoluteTimeGetCurrent();
      if (v17 - v7 >= 0.01)
      {
        char v28 = 0;
        v5[2](v5, &v28, v29);
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v31 = 309;
            __int16 v32 = 2080;
            uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v9 = 0;
          goto LABEL_52;
        }
        double v7 = v17;
      }
    }
    uint64_t v27 = -[PGGraphPortraitDonationEnrichmentProcessor _namedEntitiesFromNamedEntityNodes:currentProgress:progressFraction:progressBlock:](self, "_namedEntitiesFromNamedEntityNodes:currentProgress:progressFraction:progressBlock:", self->_publicEventNodes, &v29, v4, 0.0714285714, v16);
    if (v5)
    {
      double v18 = CFAbsoluteTimeGetCurrent();
      if (v18 - v7 >= 0.01)
      {
        char v28 = 0;
        v5[2](v5, &v28, v29);
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v31 = 312;
            __int16 v32 = 2080;
            uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          id v9 = 0;
LABEL_51:

LABEL_52:
LABEL_53:

LABEL_54:
LABEL_55:

          goto LABEL_56;
        }
        double v7 = v18;
      }
    }
    char v19 = v14;
    id v20 = v10;
    id v21 = v12;
    id v22 = [(PGGraphPortraitDonationEnrichmentProcessor *)self _namedEntitiesFromNamedEntityNodes:self->_performerNodes currentProgress:&v29 progressFraction:v4 progressBlock:0.0714285714];
    if (v5 && CFAbsoluteTimeGetCurrent() - v7 >= 0.01 && (char v28 = 0, v5[2](v5, &v28, v29), v28))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        int v31 = 315;
        __int16 v32 = 2080;
        uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Da"
              "ta Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      id v9 = 0;
    }
    else
    {
      id v23 = [MEMORY[0x1E4F1CA48] arrayWithArray:v16];
      [v23 addObjectsFromArray:v27];
      [v23 addObjectsFromArray:v22];
      id v24 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v20];
      [v24 addEntriesFromDictionary:v19];
      [v24 addEntriesFromDictionary:v21];
      id v9 = [[PGGraphPortraitKnowledgeToDonate alloc] initWithTopics:v24 namedEntities:v23 locationNamedEntities:v6];

      char v12 = v21;
    }

    uint64_t v10 = v20;
    id v14 = v19;
    goto LABEL_51;
  }
  char v28 = 0;
  v5[2](v5, &v28, v29);
  if (!v28)
  {
    double v7 = v8;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v31 = 297;
    __int16 v32 = 2080;
    uint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data M"
          "odel Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  id v9 = 0;
LABEL_56:

  return v9;
}

- (void)_accumulateKnowledgeNodesFromMomentNodes:(id)a3 progressBlock:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 count];
  if (v8)
  {
    unint64_t v9 = v8;
    id v35 = v7;
    uint64_t v10 = (void (**)(void *, unsigned char *, double))_Block_copy(v7);
    __int16 v43 = self->_meaningNodes;
    long long v37 = self->_poiNodes;
    char v38 = self->_roiNodes;
    int v42 = self->_businessNodes;
    uint64_t v40 = self->_publicEventNodes;
    uint64_t v39 = self->_performerNodes;
    __int16 v44 = self->_datesByAddressNode;
    uint64_t v11 = self->_addressNodes;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v36 = v6;
    id obj = v6;
    uint64_t v12 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (!v12) {
      goto LABEL_63;
    }
    uint64_t v13 = v12;
    char v14 = 0;
    double v15 = 0.3 / (double)v9 / 7.0;
    double v16 = 0.2;
    uint64_t v17 = *(void *)v62;
    double v18 = 0.0;
    while (1)
    {
      uint64_t v19 = 0;
      double v20 = v18;
      do
      {
        if (*(void *)v62 != v17) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v61 + 1) + 8 * v19);
        id v22 = (void *)MEMORY[0x1D25FED50]();
        id v23 = [v21 localStartDate];
        [v23 timeIntervalSince1970];
        double v25 = v24;

        id v26 = [v21 universalStartDate];
        [v26 timeIntervalSince1970];
        double v28 = v27;

        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke;
        v57[3] = &unk_1E68E6A98;
        double v60 = v25 - v28;
        v58 = v44;
        v59 = v11;
        [v21 enumerateAddressEdgesAndNodesUsingBlock:v57];
        double v16 = v15 + v16;
        if (!v10 || (double v18 = CFAbsoluteTimeGetCurrent(), v18 - v20 < 0.01))
        {
          double v18 = v20;
LABEL_10:
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_317;
          v54[3] = &unk_1E68EDAB8;
          long long v55 = v43;
          [v21 enumerateMeaningNodesUsingBlock:v54];
          double v16 = v15 + v16;
          if (v10 && (double v29 = CFAbsoluteTimeGetCurrent(), v29 - v18 >= 0.01))
          {
            unsigned __int8 v56 = 0;
            v10[2](v10, &v56, v16);
            if (!(v56 | v14 & 1))
            {
              char v14 = 0;
              goto LABEL_13;
            }
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v66 = 256;
              __int16 v67 = 2080;
              v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            char v14 = 1;
            int v34 = 1;
          }
          else
          {
            double v29 = v18;
LABEL_13:
            v52[0] = MEMORY[0x1E4F143A8];
            v52[1] = 3221225472;
            v52[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_319;
            v52[3] = &unk_1E68ED8F8;
            long long v53 = v42;
            [v21 enumerateBusinessNodesUsingBlock:v52];
            double v16 = v15 + v16;
            if (v10 && (double v30 = CFAbsoluteTimeGetCurrent(), v30 - v29 >= 0.01))
            {
              unsigned __int8 v56 = 0;
              v10[2](v10, &v56, v16);
              if (!(v56 | v14 & 1))
              {
                char v14 = 0;
                goto LABEL_16;
              }
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                int v66 = 262;
                __int16 v67 = 2080;
                v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              char v14 = 1;
              int v34 = 1;
            }
            else
            {
              double v30 = v29;
LABEL_16:
              v49[0] = MEMORY[0x1E4F143A8];
              v49[1] = 3221225472;
              v49[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_321;
              v49[3] = &unk_1E68E6AC0;
              long long v50 = v40;
              long long v51 = v39;
              [v21 enumeratePublicEventNodesUsingBlock:v49];
              double v16 = v15 + v16;
              if (v10 && (double v31 = CFAbsoluteTimeGetCurrent(), v31 - v30 >= 0.01))
              {
                unsigned __int8 v56 = 0;
                v10[2](v10, &v56, v16);
                if (!(v56 | v14 & 1))
                {
                  char v14 = 0;
                  goto LABEL_19;
                }
                if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  int v66 = 272;
                  __int16 v67 = 2080;
                  v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                  _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                char v14 = 1;
                int v34 = 1;
              }
              else
              {
                double v31 = v30;
LABEL_19:
                v47[0] = MEMORY[0x1E4F143A8];
                v47[1] = 3221225472;
                v47[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_324;
                v47[3] = &unk_1E68ED8D0;
                long long v48 = v38;
                [v21 enumerateROINodesUsingBlock:v47];
                double v16 = v15 + v16;
                if (v10 && (double v32 = CFAbsoluteTimeGetCurrent(), v32 - v31 >= 0.01))
                {
                  unsigned __int8 v56 = 0;
                  v10[2](v10, &v56, v16);
                  if (!(v56 | v14 & 1))
                  {
                    char v14 = 0;
                    goto LABEL_22;
                  }
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    int v66 = 278;
                    __int16 v67 = 2080;
                    v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  char v14 = 1;
                  int v34 = 1;
                }
                else
                {
                  double v32 = v31;
LABEL_22:
                  v45[0] = MEMORY[0x1E4F143A8];
                  v45[1] = 3221225472;
                  v45[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_326;
                  v45[3] = &unk_1E68ED8A8;
                  uint64_t v46 = v37;
                  [v21 enumeratePOINodesUsingBlock:v45];
                  double v16 = v15 + v16;
                  if (v10 && (double Current = CFAbsoluteTimeGetCurrent(), Current - v32 >= 0.01))
                  {
                    unsigned __int8 v56 = 0;
                    v10[2](v10, &v56, v16);
                    if (v56 | v14 & 1)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        int v66 = 284;
                        __int16 v67 = 2080;
                        v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }
                      char v14 = 1;
                      int v34 = 1;
                    }
                    else
                    {
                      char v14 = 0;
                      int v34 = 0;
                    }
                  }
                  else
                  {
                    int v34 = 0;
                    double Current = v32;
                  }

                  double v32 = Current;
                }

                double v31 = v32;
              }

              double v30 = v31;
            }

            double v29 = v30;
          }

          double v18 = v29;
          goto LABEL_60;
        }
        unsigned __int8 v56 = 0;
        v10[2](v10, &v56, v16);
        if (!(v56 | v14 & 1))
        {
          char v14 = 0;
          goto LABEL_10;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          int v66 = 250;
          __int16 v67 = 2080;
          v68 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/"
                "Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        char v14 = 1;
        int v34 = 1;
LABEL_60:

        if (v34) {
          goto LABEL_63;
        }
        ++v19;
        double v20 = v18;
      }
      while (v13 != v19);
      uint64_t v13 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
      if (!v13)
      {
LABEL_63:

        id v7 = v35;
        id v6 = v36;
        break;
      }
    }
  }
}

void __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  [a2 timestampUTCStart];
  id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v5 + *(double *)(a1 + 48)];
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
  [v7 addObject:v6];
  [*(id *)(a1 + 40) addObject:v8];
}

uint64_t __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_317(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_319(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_321(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addObject:v4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_2;
  v5[3] = &unk_1E68E82B0;
  id v6 = *(id *)(a1 + 40);
  [v4 enumeratePerformerNodesUsingBlock:v5];
}

uint64_t __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_324(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_326(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_prepareForKnowledgeDonation
{
  uint64_t v3 = [MEMORY[0x1E4F28BD0] set];
  meaningNodes = self->_meaningNodes;
  self->_meaningNodes = v3;

  double v5 = [MEMORY[0x1E4F28BD0] set];
  poiNodes = self->_poiNodes;
  self->_poiNodes = v5;

  id v7 = [MEMORY[0x1E4F28BD0] set];
  roiNodes = self->_roiNodes;
  self->_roiNodes = v7;

  unint64_t v9 = [MEMORY[0x1E4F28BD0] set];
  businessNodes = self->_businessNodes;
  self->_businessNodes = v9;

  uint64_t v11 = [MEMORY[0x1E4F28BD0] set];
  publicEventNodes = self->_publicEventNodes;
  self->_publicEventNodes = v11;

  uint64_t v13 = [MEMORY[0x1E4F28BD0] set];
  performerNodes = self->_performerNodes;
  self->_performerNodes = v13;

  double v15 = [MEMORY[0x1E4F1CA60] dictionary];
  datesByAddressNode = self->_datesByAddressNode;
  self->_datesByAddressNode = v15;

  uint64_t v17 = [MEMORY[0x1E4F28BD0] set];
  addressNodes = self->_addressNodes;
  self->_addressNodes = v17;
}

- (void)_donateKnowledgeWithManager:(id)a3 progressBlock:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 enrichmentLoggingConnection];
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  uint64_t v10 = v8;
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SiriPortraitDonation", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v12 = mach_absolute_time();
  *(void *)buf = 0;
  double v30 = buf;
  uint64_t v31 = 0x3032000000;
  double v32 = __Block_byref_object_copy__17838;
  uint64_t v33 = __Block_byref_object_dispose__17839;
  id v34 = 0;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __88__PGGraphPortraitDonationEnrichmentProcessor__donateKnowledgeWithManager_progressBlock___block_invoke;
  double v24 = &unk_1E68E6A70;
  uint64_t v13 = v11;
  double v25 = v13;
  id v14 = v7;
  id v26 = self;
  id v27 = v14;
  double v28 = buf;
  [v6 performSynchronousConcurrentGraphReadUsingBlock:&v21];
  if (*((void *)v30 + 5))
  {
    double v15 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v21, v22, v23, v24, v25);
    [(PGGraphPortraitDonationEnrichmentProcessor *)self _donateKnowledge:*((void *)v30 + 5) donationDate:v15 loggingConnection:v13];
  }
  uint64_t v16 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v19 = v13;
  double v20 = v19;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)id v36 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v20, OS_SIGNPOST_INTERVAL_END, v9, "SiriPortraitDonation", "", v36, 2u);
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v36 = 136315394;
    long long v37 = "SiriPortraitDonation";
    __int16 v38 = 2048;
    double v39 = (float)((float)((float)((float)(v16 - v12) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v36, 0x16u);
  }

  _Block_object_dispose(buf, 8);
}

void __88__PGGraphPortraitDonationEnrichmentProcessor__donateKnowledgeWithManager_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a2 graph];
  id v4 = *(NSObject **)(a1 + 32);
  if (v3)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D1805000, v4, OS_LOG_TYPE_DEBUG, "PortraitEnrichment - Will donate graph knowledge to Portrait", buf, 2u);
    }
    double v5 = (void (**)(void *, unsigned char *, double))_Block_copy(*(const void **)(a1 + 48));
    double v6 = 0.0;
    if (v5)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current >= 0.01)
      {
        char v18 = 0;
        v5[2](v5, &v18, 0.0);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v20 = 151;
            __int16 v21 = 2080;
            uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_33;
        }
        double v6 = Current;
      }
    }
    [*(id *)(a1 + 40) _prepareForKnowledgeDonation];
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    os_signpost_id_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-31557600.0];
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v9 endDate:v8];
    uint64_t v11 = [v3 momentNodesOverlappingLocalDateInterval:v10];
    if (v5)
    {
      double v12 = CFAbsoluteTimeGetCurrent();
      if (v12 - v6 >= 0.01)
      {
        char v18 = 0;
        v5[2](v5, &v18, 0.2);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            int v20 = 161;
            __int16 v21 = 2080;
            uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            uint64_t v13 = MEMORY[0x1E4F14500];
LABEL_31:
            _os_log_impl(&dword_1D1805000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_32;
          }
          goto LABEL_32;
        }
        double v6 = v12;
      }
    }
    if ([v11 count])
    {
      [*(id *)(a1 + 40) _accumulateKnowledgeNodesFromMomentNodes:v11 progressBlock:*(void *)(a1 + 48)];
      if (v5)
      {
        double v14 = CFAbsoluteTimeGetCurrent();
        if (v14 - v6 >= 0.01)
        {
          char v18 = 0;
          v5[2](v5, &v18, 0.5);
          if (v18)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              int v20 = 167;
              __int16 v21 = 2080;
              uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
              uint64_t v13 = MEMORY[0x1E4F14500];
              goto LABEL_31;
            }
LABEL_32:

LABEL_33:
            goto LABEL_34;
          }
          double v6 = v14;
        }
      }
      uint64_t v15 = [*(id *)(a1 + 40) _knowledgeToDonateFromAccumulatedNodesWithProgressBlock:*(void *)(a1 + 48)];
      uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;
    }
    if (!v5) {
      goto LABEL_32;
    }
    if (CFAbsoluteTimeGetCurrent() - v6 < 0.01) {
      goto LABEL_32;
    }
    char v18 = 0;
    v5[2](v5, &v18, 1.0);
    if (!v18 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    *(_DWORD *)buf = 67109378;
    int v20 = 172;
    __int16 v21 = 2080;
    uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data M"
          "odel Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
    uint64_t v13 = MEMORY[0x1E4F14500];
    goto LABEL_31;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1805000, v4, OS_LOG_TYPE_FAULT, "PortraitEnrichment - portrait donation can not run because the graph is nil", buf, 2u);
  }
LABEL_34:
}

- (BOOL)_shouldProcessGraphUpdate:(id)a3
{
  return [a3 isResumingFullAnalysis];
}

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  id v11 = a5;
  double v12 = [v9 enrichmentLoggingConnection];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  double v14 = v12;
  uint64_t v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGGraphPortraitDonationEnrichmentProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v16 = mach_absolute_time();
  BOOL v17 = [(PGGraphPortraitDonationEnrichmentProcessor *)self _shouldProcessGraphUpdate:v11];

  if (v17) {
    [(PGGraphPortraitDonationEnrichmentProcessor *)self _donateKnowledgeWithManager:v9 progressBlock:v10];
  }
  uint64_t v18 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  __int16 v21 = v15;
  uint64_t v22 = v21;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v22, OS_SIGNPOST_INTERVAL_END, v13, "PGGraphPortraitDonationEnrichmentProcessor", "", buf, 2u);
  }

  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    double v25 = "PGGraphPortraitDonationEnrichmentProcessor";
    __int16 v26 = 2048;
    double v27 = (float)((float)((float)((float)(v18 - v16) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

@end