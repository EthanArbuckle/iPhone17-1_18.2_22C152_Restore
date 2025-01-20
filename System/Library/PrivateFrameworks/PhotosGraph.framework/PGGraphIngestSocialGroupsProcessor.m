@interface PGGraphIngestSocialGroupsProcessor
+ (unint64_t)requiredMomentUpdateTypes;
- (BOOL)shouldRunWithGraphUpdate:(id)a3;
- (PGGraphIngestSocialGroupsProcessor)initWithGraphBuilder:(id)a3;
- (void)insertAggregateSocialGroupsIntoGraph:(id)a3 progressBlock:(id)a4;
- (void)insertOwnerPetToRelevantSocialGroups:(id)a3 progressBlock:(id)a4;
- (void)processSocialGroups:(BOOL)a3 graph:(id)a4 progressBlock:(id)a5;
- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4;
@end

@implementation PGGraphIngestSocialGroupsProcessor

- (void).cxx_destruct
{
}

- (void)insertAggregateSocialGroupsIntoGraph:(id)a3 progressBlock:(id)a4
{
  v80[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id aBlock = a4;
  v7 = [(PGGraphBuilder *)self->_graphBuilder loggingConnection];
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  os_signpost_id_t spid = v8;
  unint64_t v48 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "SocialGroupAggregation", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v46 = mach_absolute_time();
  v11 = (void (**)(void *, unsigned char *, double))_Block_copy(aBlock);
  *(void *)buf = 0;
  v74 = buf;
  uint64_t v75 = 0x2020000000;
  char v76 = 0;
  uint64_t v69 = 0;
  v70 = (double *)&v69;
  uint64_t v71 = 0x2020000000;
  uint64_t v72 = 0;
  if (!v11
    || (double v12 = CFAbsoluteTimeGetCurrent(), v12 - v70[3] < 0.01)
    || (v70[3] = v12, v68 = 0, v11[2](v11, &v68, 0.0), uint8_t v13 = v74[24] | v68, (v74[24] = v13) == 0))
  {
    v54 = +[PGGraphNodeCollection nodesInGraph:v6];
    v52 = +[PGGraphNodeCollection nodesInGraph:v6];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke;
    v66[3] = &unk_1E68ED578;
    id v50 = v14;
    id v67 = v50;
    [v52 enumerateSocialGroupIdentifiersUsingBlock:v66];
    id v15 = objc_alloc(MEMORY[0x1E4F71E90]);
    v16 = +[PGGraphFrequentLocationNode momentOfFrequentLocation];
    v80[0] = v16;
    v17 = +[PGGraphMomentNode socialGroupInMoment];
    v80[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:2];
    v51 = (void *)[v15 initWithSteps:v18];

    v19 = [MEMORY[0x1E4F71E88] adjacencyWithSources:v54 relation:v51 targetsClass:objc_opt_class()];
    v20 = (void *)MEMORY[0x1E4F71E88];
    v21 = +[PGGraphFrequentLocationNode momentOfFrequentLocation];
    v49 = [v20 adjacencyWithSources:v54 relation:v21 targetsClass:objc_opt_class()];

    v22 = (void *)MEMORY[0x1E4F71E88];
    v23 = [v19 targets];
    v24 = +[PGGraphSocialGroupNode momentOfSocialGroup];
    v25 = [v22 adjacencyWithSources:v23 relation:v24 targetsClass:objc_opt_class()];

    v26 = (void *)MEMORY[0x1E4F71E88];
    v27 = [v19 targets];
    v28 = +[PGGraphSocialGroupNode memberOfSocialGroup];
    v29 = [v26 adjacencyWithSources:v27 relation:v28 targetsClass:objc_opt_class()];

    if (v11)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      if (Current - v70[3] >= 0.01)
      {
        v70[3] = Current;
        char v68 = 0;
        v11[2](v11, &v68, 0.2);
        uint8_t v31 = v74[24] | v68;
        v74[24] = v31;
        if (v31)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v78 = 67109378;
            *(_DWORD *)v79 = 364;
            *(_WORD *)&v79[4] = 2080;
            *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v78, 0x12u);
          }
          goto LABEL_26;
        }
      }
    }
    id v32 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_268;
    v55[3] = &unk_1E68E8840;
    v33 = v11;
    id v62 = v33;
    v63 = &v69;
    v64 = buf;
    uint64_t v65 = 0x3F847AE147AE147BLL;
    id v56 = v49;
    id v57 = v25;
    id v58 = v29;
    id v34 = v6;
    id v59 = v34;
    id v60 = v50;
    id v35 = v32;
    id v61 = v35;
    [v19 enumerateTargetsBySourceWithBlock:v55];
    [v34 executeGraphChangeRequest:v35];
    if (v11
      && (double v36 = CFAbsoluteTimeGetCurrent(), v36 - v70[3] >= 0.01)
      && (v70[3] = v36, v68 = 0, v33[2](v33, &v68, 1.0), uint8_t v37 = v74[24] | v68, (v74[24] = v37) != 0))
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      *(_DWORD *)v78 = 67109378;
      *(_DWORD *)v79 = 435;
      *(_WORD *)&v79[4] = 2080;
      *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Graph/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
      v38 = MEMORY[0x1E4F14500];
      v39 = "Cancelled at line %d in file %s";
      uint32_t v40 = 18;
    }
    else
    {
      uint64_t v41 = mach_absolute_time();
      uint32_t numer = info.numer;
      uint32_t denom = info.denom;
      v44 = v10;
      v45 = v44;
      if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)v78 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, v45, OS_SIGNPOST_INTERVAL_END, spid, "SocialGroupAggregation", "", v78, 2u);
      }

      if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
      *(_DWORD *)v78 = 136315394;
      *(void *)v79 = "SocialGroupAggregation";
      *(_WORD *)&v79[8] = 2048;
      *(double *)&v79[10] = (float)((float)((float)((float)(v41 - v46) * (float)numer) / (float)denom) / 1000000.0);
      v39 = "[Performance] %s: %f ms";
      v38 = v45;
      uint32_t v40 = 22;
    }
    _os_log_impl(&dword_1D1805000, v38, OS_LOG_TYPE_INFO, v39, v78, v40);
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v78 = 67109378;
    *(_DWORD *)v79 = 346;
    *(_WORD *)&v79[4] = 2080;
    *(void *)&v79[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v78, 0x12u);
  }
LABEL_27:
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(buf, 8);
}

void __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

void __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_268(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v38 = a2;
  id v37 = a3;
  uint64_t v40 = a1;
  if (*(void *)(a1 + 80)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v8 = *(void *)(*(void *)(a1 + 88) + 8),
        Current - *(double *)(v8 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v8 + 24) = Current,
        LOBYTE(v66) = 0,
        (*(void (**)(double))(*(void *)(a1 + 80) + 16))(0.5),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    double v36 = [*(id *)(a1 + 32) targetsForSources:v38];
    v9 = [*(id *)(a1 + 40) intersectingTargetsWith:v36];
    id v10 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F71E60]);
    uint64_t v66 = 0;
    id v67 = (double *)&v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    uint64_t v62 = 0;
    v63 = (int *)&v62;
    uint64_t v64 = 0x2020000000;
    int v65 = 0;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_2;
    v53[3] = &unk_1E68E87F0;
    id v32 = v9;
    id v54 = v32;
    id v55 = *(id *)(v40 + 40);
    id v56 = *(id *)(v40 + 48);
    id v13 = v10;
    id v57 = v13;
    id v33 = v11;
    id v58 = v33;
    id v34 = v12;
    id v59 = v34;
    id v60 = &v66;
    id v61 = &v62;
    [v37 enumerateImportancesUsingBlock:v53];
    id v35 = v13;
    if ((unint64_t)[v13 count] >= 3)
    {
      v30 = [(MAElementCollection *)[PGGraphPersonNodeCollection alloc] initWithGraph:*(void *)(v40 + 56) elementIdentifiers:v13];
      uint8_t v31 = [(MAElementCollection *)v30 array];
      int64_t v14 = +[PGGraphSocialGroupNode identifierForMemberNodes:](PGGraphSocialGroupNode, "identifierForMemberNodes:");
      id v15 = *(void **)(v40 + 64);
      v16 = [NSNumber numberWithInteger:v14];
      LOBYTE(v15) = [v15 containsObject:v16];

      if ((v15 & 1) == 0)
      {
        v17 = *(void **)(v40 + 64);
        v18 = [NSNumber numberWithInteger:v14];
        [v17 addObject:v18];

        v19 = [[PGGraphSocialGroupNode alloc] initWithSocialGroupIdentifier:v14 importance:v67[3] / (double)v63[6]];
        [*(id *)(v40 + 72) addNode:v19];
        v20 = [(MAElementCollection *)[PGGraphSocialGroupNodeCollection alloc] initWithGraph:*(void *)(v40 + 56) elementIdentifiers:v34];
        long long v51 = 0u;
        long long v52 = 0u;
        long long v50 = 0u;
        long long v49 = 0u;
        id obj = v31;
        uint64_t v21 = [obj countByEnumeratingWithState:&v49 objects:v70 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v50;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v50 != v22) {
                objc_enumerationMutation(obj);
              }
              v24 = *(void **)(*((void *)&v49 + 1) + 8 * i);
              v25 = [v24 collection];
              v26 = +[PGGraphEdgeCollection edgesFromNodes:v25 toNodes:v20];

              uint64_t v45 = 0;
              uint64_t v46 = (double *)&v45;
              uint64_t v47 = 0x2020000000;
              uint64_t v48 = 0;
              v44[0] = MEMORY[0x1E4F143A8];
              v44[1] = 3221225472;
              v44[2] = __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_3;
              v44[3] = &unk_1E68E8818;
              v44[4] = &v45;
              [v26 enumerateEdgesUsingBlock:v44];
              id v27 = -[PGGraphBelongsToEdge initFromMemberNode:toSocialGroupNode:importance:]([PGGraphBelongsToEdge alloc], "initFromMemberNode:toSocialGroupNode:importance:", v24, v19, v46[3] / (double)(unint64_t)[v26 count]);
              [*(id *)(v40 + 72) addEdge:v27];

              _Block_object_dispose(&v45, 8);
            }
            uint64_t v21 = [obj countByEnumeratingWithState:&v49 objects:v70 count:16];
          }
          while (v21);
        }

        v28 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithGraph:*(void *)(v40 + 56) elementIdentifiers:v33];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_4;
        v41[3] = &unk_1E68F0768;
        v29 = v19;
        v42 = v29;
        id v43 = *(id *)(v40 + 72);
        [(MANodeCollection *)v28 enumerateNodesUsingBlock:v41];
      }
    }

    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
  }
}

void __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2, double a3)
{
  id v16 = [*(id *)(a1 + 32) targetsForSourceIdentifier:a2];
  id v6 = [*(id *)(a1 + 40) targetsForSourceIdentifier:a2];
  double v7 = (double)(unint64_t)[v16 count];
  if (v7 / (double)(unint64_t)[v6 count] >= 0.3)
  {
    uint64_t v8 = [*(id *)(a1 + 48) targetsForSourceIdentifier:a2];
    v9 = [v8 personNodes];
    if (![*(id *)(a1 + 56) count]
      || (id v10 = *(void **)(a1 + 56),
          [v9 elementIdentifiers],
          id v11 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v10) = [v10 intersectsIdentifierSet:v11],
          v11,
          v10))
    {
      id v12 = *(void **)(a1 + 56);
      id v13 = [v9 elementIdentifiers];
      [v12 unionWithIdentifierSet:v13];

      int64_t v14 = *(void **)(a1 + 64);
      id v15 = [v16 elementIdentifiers];
      [v14 unionWithIdentifierSet:v15];

      [*(id *)(a1 + 72) addIdentifier:a2];
      *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                              + 24)
                                                                  + a3;
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    }
  }
}

double __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 importance];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

void __89__PGGraphIngestSocialGroupsProcessor_insertAggregateSocialGroupsIntoGraph_progressBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PGGraphSocialGroupEdge alloc] initFromMomentNode:v3 toSocialGroupNode:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) addEdge:v4];
}

- (void)insertOwnerPetToRelevantSocialGroups:(id)a3 progressBlock:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  graphBuilder = self->_graphBuilder;
  id v8 = a4;
  v9 = [(PGGraphBuilder *)graphBuilder loggingConnection];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  id v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SocialGroupPets", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v13 = mach_absolute_time();
  int64_t v14 = (void (**)(void *, unsigned char *, double))_Block_copy(v8);

  double v15 = 0.0;
  if (v14)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      char v60 = 0;
      v14[2](v14, &v60, 0.0);
      if (v60)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v63 = 247;
          *(_WORD *)&v63[4] = 2080;
          *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_32;
      }
      double v15 = Current;
    }
  }
  v17 = [v6 meNode];
  v18 = v17;
  if (v17)
  {
    v19 = [v17 collection];
    v20 = [v19 ownedPetNodes];

    if ([v20 count])
    {
      uint64_t v45 = v13;
      unint64_t v46 = v10 - 1;
      os_signpost_id_t spid = v10;
      id v21 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
      if ([v20 count])
      {
        uint64_t v22 = [v20 array];
        int64_t v23 = +[PGGraphSocialGroupNode identifierForMemberNodes:v22];
        v24 = +[PGGraphSocialGroupNodeCollection socialGroupNodeForSocialGroupIdentifier:v23 inGraph:v6];
        v25 = [[PGGraphSocialGroupNode alloc] initWithSocialGroupIdentifier:v23 importance:1.0];
        if ([v24 count])
        {
          v26 = [v24 anyNode];
        }
        else
        {
          [v21 addNode:v25];
          v57[0] = MEMORY[0x1E4F143A8];
          v57[1] = 3221225472;
          v57[2] = __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke;
          v57[3] = &unk_1E68E8778;
          v26 = v25;
          id v58 = v26;
          id v59 = v21;
          [v22 enumerateObjectsUsingBlock:v57];

          v25 = v58;
        }

        v28 = [v20 momentNodes];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_2;
        v54[3] = &unk_1E68F0768;
        id v55 = v26;
        id v56 = v21;
        v29 = v26;
        [v28 enumerateNodesUsingBlock:v54];
      }
      v30 = +[PGGraphNodeCollection nodesInGraph:v6];
      uint64_t v47 = +[PGGraphSocialGroupNodeCollection userVerifiedSocialGroupNodesInGraph:v6];
      objc_msgSend(v30, "collectionBySubtracting:");
      v32 = uint8_t v31 = v21;
      id v33 = (void *)MEMORY[0x1E4F71E88];
      id v34 = +[PGGraphSocialGroupNode momentOfSocialGroup];
      uint64_t v48 = v30;
      id v35 = [v33 adjacencyWithSources:v30 relation:v34 targetsClass:objc_opt_class()];

      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_3;
      v49[3] = &unk_1E68E87C8;
      id v50 = v35;
      v20 = v20;
      long long v51 = v20;
      id v36 = v6;
      id v52 = v36;
      id v37 = v31;
      id v53 = v37;
      id v38 = v35;
      [v32 enumerateImportancesUsingBlock:v49];
      [v36 executeGraphChangeRequest:v37];
      if (v14 && CFAbsoluteTimeGetCurrent() - v15 >= 0.01 && (char v60 = 0, v14[2](v14, &v60, 1.0), v60))
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v63 = 339;
          *(_WORD *)&v63[4] = 2080;
          *(void *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Graph/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
      else
      {
        uint64_t v39 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        v42 = v12;
        id v43 = v42;
        if (v46 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v43, OS_SIGNPOST_INTERVAL_END, spid, "SocialGroupPets", "", buf, 2u);
        }

        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)v63 = "SocialGroupPets";
          *(_WORD *)&v63[8] = 2048;
          *(double *)&v63[10] = (float)((float)((float)((float)(v39 - v45) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v43, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    id v27 = +[PGLogging sharedLogging];
    v20 = [v27 loggingConnection];

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v20, OS_LOG_TYPE_ERROR, "[PGGraphIngestSocialGroupsProcessor] Error found a nil Me Node", buf, 2u);
    }
  }

LABEL_32:
}

void __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PGGraphBelongsToEdge alloc] initFromMemberNode:v3 toSocialGroupNode:*(void *)(a1 + 32) importance:1.0];

  [*(id *)(a1 + 40) addEdge:v4];
}

void __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PGGraphSocialGroupEdge alloc] initFromMomentNode:v3 toSocialGroupNode:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) addEdge:v4];
}

void __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_3(uint64_t a1, uint64_t a2, double a3)
{
  id v6 = [*(id *)(a1 + 32) targetsForSourceIdentifier:a2];
  double v7 = [v6 petNodes];
  id v8 = [v7 collectionByIntersecting:*(void *)(a1 + 40)];

  if ([v8 count])
  {
    v9 = [v8 momentNodes];
    os_signpost_id_t v10 = [v9 collectionByIntersecting:v6];

    id v11 = [PGGraphSocialGroupNodeCollection alloc];
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F71E40]) initWithElementIdentifier:a2];
    int64_t v14 = [(MAElementCollection *)v11 initWithGraph:v12 elementIdentifiers:v13];

    double v15 = (double)(unint64_t)[v10 count];
    if ((double)(unint64_t)[v6 count] * 0.3 <= v15)
    {
      id v16 = [(PGGraphSocialGroupNodeCollection *)v14 memberNodes];
      v17 = [v16 collectionByFormingUnionWith:v8];

      v18 = [v17 array];
      int64_t v19 = +[PGGraphSocialGroupNode identifierForMemberNodes:v18];

      v20 = [[PGGraphSocialGroupNode alloc] initWithSocialGroupIdentifier:v19 importance:a3];
      [*(id *)(a1 + 56) addNode:v20];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_4;
      v27[3] = &unk_1E68E87A0;
      id v28 = v6;
      id v21 = v10;
      id v29 = v21;
      v30 = v14;
      uint64_t v22 = v20;
      uint8_t v31 = v22;
      id v32 = *(id *)(a1 + 56);
      [v17 enumerateNodesUsingBlock:v27];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_6;
      v24[3] = &unk_1E68F0768;
      v25 = v22;
      id v26 = *(id *)(a1 + 56);
      int64_t v23 = v22;
      [v21 enumerateNodesUsingBlock:v24];
    }
  }
}

void __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 label];

  if (v4 == @"Pet")
  {
    if ([*(id *)(a1 + 32) count])
    {
      unint64_t v9 = [*(id *)(a1 + 40) count];
      double v8 = (double)(v9 / [*(id *)(a1 + 32) count]);
    }
    else
    {
      double v8 = 0.0;
    }
  }
  else
  {
    v5 = [(MANodeCollection *)[PGGraphSocialGroupMemberNodeCollection alloc] initWithNode:v3];
    id v6 = +[PGGraphEdgeCollection edgesFromNodes:v5 toNodes:*(void *)(a1 + 48)];
    uint64_t v12 = 0;
    uint64_t v13 = (double *)&v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    if ([v6 count])
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_5;
      v11[3] = &unk_1E68EFA90;
      v11[4] = &v12;
      [v6 enumerateImportancesUsingBlock:v11];
      double v7 = v13[3];
      double v8 = v7 / (double)(unint64_t)[v6 count];
    }
    else
    {
      double v8 = 0.0;
    }
    _Block_object_dispose(&v12, 8);
  }
  id v10 = [[PGGraphBelongsToEdge alloc] initFromMemberNode:v3 toSocialGroupNode:*(void *)(a1 + 56) importance:v8];
  [*(id *)(a1 + 64) addEdge:v10];
}

void __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PGGraphSocialGroupEdge alloc] initFromMomentNode:v3 toSocialGroupNode:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) addEdge:v4];
}

double __89__PGGraphIngestSocialGroupsProcessor_insertOwnerPetToRelevantSocialGroups_progressBlock___block_invoke_5(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = *(double *)(v2 + 24) + a2;
  *(double *)(v2 + 24) = result;
  return result;
}

- (void)processSocialGroups:(BOOL)a3 graph:(id)a4 progressBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v35 = a5;
  double v8 = (void (**)(void *, int *, double))_Block_copy(v35);
  uint64_t v65 = 0;
  uint64_t v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  uint64_t v61 = 0;
  uint64_t v62 = (double *)&v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  if (v8)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current - v62[3] >= 0.01)
    {
      v62[3] = Current;
      LOBYTE(v69) = 0;
      v8[2](v8, &v69, 0.0);
      char v10 = *((unsigned char *)v66 + 24) | v69;
      *((unsigned char *)v66 + 24) = v10;
      if (v10)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          uint64_t buf = 0x8704000202;
          LOWORD(v74) = 2080;
          *(void *)((char *)&v74 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
          _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }
        goto LABEL_31;
      }
    }
  }
  id v37 = +[PGGraphNodeCollection nodesInGraph:](PGGraphSocialGroupNodeCollection, "nodesInGraph:", v7, self);
  id v11 = +[PGGraphSocialGroupNodeCollection userVerifiedSocialGroupNodesInGraph:v7];
  id v36 = [v37 collectionBySubtracting:v11];
  id v38 = v11;
  if (v6)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
    [v12 removeNodes:v36];
    [v7 executeGraphChangeRequest:v12];
    id v13 = 0;
    id v14 = 0;
LABEL_10:

    goto LABEL_11;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F71E60]);
  if ([v11 count])
  {
    uint64_t v15 = [v11 elementIdentifiers];
    [v13 unionWithIdentifierSet:v15];

    id v12 = +[PGGraphEdgeCollection edgesToNodes:v38];
    id v16 = [v12 elementIdentifiers];
    [v14 unionWithIdentifierSet:v16];

    goto LABEL_10;
  }
LABEL_11:
  id v17 = objc_alloc_init(MEMORY[0x1E4F71EE0]);
  uint64_t buf = 0;
  *(void *)&long long v74 = &buf;
  *((void *)&v74 + 1) = 0x2020000000;
  char v75 = 0;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke;
  v50[3] = &unk_1E68E8750;
  v18 = v8;
  id v55 = v18;
  id v56 = &v61;
  p_uint64_t buf = &buf;
  uint64_t v59 = 0x3F847AE147AE147BLL;
  id v57 = &v65;
  BOOL v60 = v6;
  id v19 = v7;
  id v51 = v19;
  id v34 = v13;
  id v52 = v34;
  id v33 = v14;
  id v53 = v33;
  id v20 = v17;
  id v54 = v20;
  [v19 enumerateSocialGroupsWithBlock:v50 includeInvalidGroups:1];
  if (*((unsigned char *)v66 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v69 = 67109378;
      int v70 = 207;
      __int16 v71 = 2080;
      uint64_t v72 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v69, 0x12u);
    }
  }
  else
  {
    if (!v6)
    {
      id v21 = v36;
      if ([v34 count])
      {
        uint64_t v22 = [(MAElementCollection *)[PGGraphSocialGroupNodeCollection alloc] initWithGraph:v19 elementIdentifiers:v34];
        uint64_t v23 = [v21 collectionBySubtracting:v22];

        id v21 = (id)v23;
      }
      if ([v21 count]) {
        [v20 removeNodes:v21];
      }
      v24 = +[PGGraphEdgeCollection edgesInGraph:v19];
      if ([v33 count])
      {
        v25 = [(MAElementCollection *)[PGGraphSocialGroupEdgeCollection alloc] initWithGraph:v19 elementIdentifiers:v33];
        uint64_t v26 = [v24 collectionBySubtracting:v25];

        v24 = (void *)v26;
      }
      if ([v24 count]) {
        [v20 removeEdges:v24];
      }
    }
    [v19 executeGraphChangeRequest:v20];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_251;
    v45[3] = &unk_1E68F03F8;
    id v27 = v18;
    unint64_t v46 = v27;
    uint64_t v47 = &v61;
    uint64_t v48 = &v65;
    uint64_t v49 = 0x3F847AE147AE147BLL;
    [v32 insertOwnerPetToRelevantSocialGroups:v19 progressBlock:v45];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_2_252;
    v40[3] = &unk_1E68F03F8;
    id v28 = v27;
    uint64_t v41 = v28;
    v42 = &v61;
    id v43 = &v65;
    uint64_t v44 = 0x3F847AE147AE147BLL;
    [v32 insertAggregateSocialGroupsIntoGraph:v19 progressBlock:v40];
    if (v8)
    {
      double v29 = CFAbsoluteTimeGetCurrent();
      if (v29 - v62[3] >= 0.01)
      {
        v62[3] = v29;
        char v39 = 0;
        v28[2](v28, (int *)&v39, 1.0);
        char v30 = *((unsigned char *)v66 + 24) | v39;
        *((unsigned char *)v66 + 24) = v30;
        if (v30)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            int v69 = 67109378;
            int v70 = 241;
            __int16 v71 = 2080;
            uint64_t v72 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Ingest/Ingest Processing/PGGraphIngestSocialGroupsProcessor.m";
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v69, 0x12u);
          }
        }
      }
    }
  }
  _Block_object_dispose(&buf, 8);

LABEL_31:
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
}

void __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, float a5)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (*(void *)(a1 + 64)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8),
        Current - *(double *)(v13 + 24) >= *(double *)(a1 + 96))
    && (*(double *)(v13 + 24) = Current,
        char v52 = 0,
        (*(void (**)(double))(*(void *)(a1 + 64) + 16))(0.5),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                               + 24)) != 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  }
  else
  {
    int64_t v14 = +[PGGraphSocialGroupNode identifierForMemberNodes:v9];
    if (*(unsigned char *)(a1 + 104))
    {
      uint64_t v15 = 0;
    }
    else
    {
      uint64_t v15 = +[PGGraphSocialGroupNodeCollection socialGroupNodeForSocialGroupIdentifier:v14 inGraph:*(void *)(a1 + 32)];
    }
    id v36 = v11;
    id v37 = v10;
    id v35 = v15;
    if ([v15 count])
    {
      id v16 = [v15 anyNode];
      objc_msgSend(*(id *)(a1 + 40), "addIdentifier:", -[MANode identifier](v16, "identifier"));
      id v17 = [(MAElementCollection *)[PGGraphMomentNodeCollection alloc] initWithArray:v11 graph:*(void *)(a1 + 32)];
      v18 = +[PGGraphEdgeCollection edgesFromNodes:v17 toNodes:v15];
      id v19 = *(void **)(a1 + 48);
      id v20 = [v18 elementIdentifiers];
      [v19 unionWithIdentifierSet:v20];

      id v21 = +[MANodeCollection sourceNodesOfEdges:v18];
      uint64_t v22 = (void *)MEMORY[0x1E4F28F60];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_2;
      v50[3] = &unk_1E68E86D8;
      id v51 = v21;
      id v34 = v21;
      uint64_t v23 = [v22 predicateWithBlock:v50];
      id v24 = [v11 filteredArrayUsingPredicate:v23];

      v25 = [(MAElementCollection *)[PGGraphSocialGroupMemberNodeCollection alloc] initWithArray:v9 graph:*(void *)(a1 + 32)];
      uint64_t v26 = +[PGGraphEdgeCollection edgesFromNodes:v25 toNodes:v15];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_3;
      v46[3] = &unk_1E68E8700;
      id v47 = v9;
      id v48 = v37;
      id v49 = *(id *)(a1 + 32);
      [v26 enumerateEdgesUsingBlock:v46];
    }
    else
    {
      id v27 = [[PGGraphSocialGroupNode alloc] initWithSocialGroupIdentifier:v14 importance:a5];
      [*(id *)(a1 + 56) addNode:v27];
      id v24 = v11;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_4;
      v42[3] = &unk_1E68E8728;
      id v43 = (PGGraphMomentNodeCollection *)v10;
      id v16 = v27;
      uint64_t v44 = v16;
      id v45 = *(id *)(a1 + 56);
      [v9 enumerateObjectsUsingBlock:v42];

      id v17 = v43;
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v28 = v24;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v38 objects:v53 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v39 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = [[PGGraphSocialGroupEdge alloc] initFromMomentNode:*(void *)(*((void *)&v38 + 1) + 8 * i) toSocialGroupNode:v16];
          [*(id *)(a1 + 56) addEdge:v33];
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v38 objects:v53 count:16];
      }
      while (v30);
    }

    id v11 = v36;
    id v10 = v37;
  }
}

void __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_251(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.33 + 0.33);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

void __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_2_252(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3 * 0.33 + 0.66);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

uint64_t __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsNode:a2] ^ 1;
}

void __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v10 = v3;
  v5 = [v3 memberNode];
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v6];
    [v7 doubleValue];
    double v9 = v8;

    +[PGGraphBelongsToEdge setImportance:onBelongsToEdgeForIdentifier:inGraph:](PGGraphBelongsToEdge, "setImportance:onBelongsToEdgeForIdentifier:inGraph:", [v10 identifier], *(void *)(a1 + 48), v9);
  }
}

void __78__PGGraphIngestSocialGroupsProcessor_processSocialGroups_graph_progressBlock___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 objectAtIndexedSubscript:a3];
  [v7 doubleValue];
  double v9 = v8;

  id v10 = [[PGGraphBelongsToEdge alloc] initFromMemberNode:v6 toSocialGroupNode:*(void *)(a1 + 40) importance:v9];
  [*(id *)(a1 + 48) addEdge:v10];
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  graphBuilder = self->_graphBuilder;
  id v8 = a3;
  double v9 = [(PGGraphBuilder *)graphBuilder loggingConnection];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  id v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestSocialGroupsProcessor", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v13 = mach_absolute_time();
  int64_t v14 = [(PGGraphBuilder *)self->_graphBuilder graph];
  uint64_t v15 = [v8 isResumingFullAnalysis];

  id v16 = [(PGGraphBuilder *)self->_graphBuilder photoLibrary];
  if (v16)
  {
    os_signpost_id_t spid = v10;
    uint64_t v44 = v13;
    unint64_t v46 = v10 - 1;
    id v17 = (void *)MEMORY[0x1E4F71F08];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __71__PGGraphIngestSocialGroupsProcessor_runWithGraphUpdate_progressBlock___block_invoke;
    v53[3] = &unk_1E68F04F0;
    id v47 = v6;
    id v18 = v6;
    id v54 = v18;
    [v17 progressReporterWithProgressBlock:v53];
    id v45 = v52 = 0;
    uint64_t v19 = +[PGSocialGroupsPromoter ingestUserVerifiedSocialGroupsFromPhotoLibrary:intoGraph:progressReporter:error:](PGSocialGroupsPromoter, "ingestUserVerifiedSocialGroupsFromPhotoLibrary:intoGraph:progressReporter:error:", v16, v14);
    id v20 = 0;
    id v21 = +[PGLogging sharedLogging];
    uint64_t v22 = [v21 loggingConnection];

    id v48 = (void *)v19;
    if (v19)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t buf = 138412290;
        id v57 = (const char *)v19;
        _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, "[PGGraphIngestSocialGroupsProcessor] Ingested user-verified social groups from database into graph with UUIDs %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v42 = [v20 localizedDescription];
      *(_DWORD *)uint64_t buf = 138412290;
      id v57 = v42;
      _os_log_error_impl(&dword_1D1805000, v22, OS_LOG_TYPE_ERROR, "[PGGraphIngestSocialGroupsProcessor] Error ingesting user-verified social groups from database into graph: %@", buf, 0xCu);
    }
    [(PGGraphIngestSocialGroupsProcessor *)self processSocialGroups:v15 graph:v14 progressBlock:v18];
    v25 = (void *)MEMORY[0x1E4F71F08];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __71__PGGraphIngestSocialGroupsProcessor_runWithGraphUpdate_progressBlock___block_invoke_232;
    v50[3] = &unk_1E68F04F0;
    id v51 = v18;
    uint64_t v26 = [v25 progressReporterWithProgressBlock:v50];
    id v27 = [(PGGraphBuilder *)self->_graphBuilder photoLibrary];
    id v49 = v20;
    id v28 = +[PGSocialGroupsPromoter promoteSocialGroupsInGraph:photoLibrary:maxNumberOfElectedSocialGroups:progressReporter:persistGroups:error:](PGSocialGroupsPromoter, "promoteSocialGroupsInGraph:photoLibrary:maxNumberOfElectedSocialGroups:progressReporter:persistGroups:error:", v14, v27, +[PGSocialGroupsElector defaultNumberOfElectedSocialGroups], v26, 1, &v49);
    id v24 = v49;

    uint64_t v29 = [v28 newAutomaticSocialGroupsToCreateCount];
    uint64_t v30 = [v28 currentAutomaticSocialGroupsToModifyCount];
    uint64_t v31 = +[PGLogging sharedLogging];
    id v32 = [v31 loggingConnection];

    if (v28)
    {
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
LABEL_17:

        id v34 = +[PGLogging sharedLogging];
        id v35 = [v34 loggingConnection];

        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          uint64_t v36 = [v28 socialGroupsSkippedBecauseNoCommonAssetsCount];
          *(_DWORD *)uint64_t buf = 134217984;
          id v57 = (const char *)v36;
          _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "[PGGraphIngestSocialGroupsProcessor] Skipped persisting %ld social groups in graph to database because they have no assets of all members", buf, 0xCu);
        }

        uint64_t v37 = mach_absolute_time();
        uint32_t numer = info.numer;
        uint32_t denom = info.denom;
        long long v40 = v12;
        long long v41 = v40;
        id v6 = v47;
        if (v46 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v41, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestSocialGroupsProcessor", "", buf, 2u);
        }

        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 136315394;
          id v57 = "PGGraphIngestSocialGroupsProcessor";
          __int16 v58 = 2048;
          double v59 = (float)((float)((float)((float)(v37 - v44) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v41, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        goto LABEL_25;
      }
      id v33 = [v24 localizedDescription];
      *(_DWORD *)uint64_t buf = 134218498;
      id v57 = (const char *)v29;
      __int16 v58 = 2048;
      double v59 = *(double *)&v30;
      __int16 v60 = 2112;
      uint64_t v61 = v33;
      _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "[PGGraphIngestSocialGroupsProcessor] Successfully promoted %ld new automatic social groups in graph to database and modified order of %ld automatic social groups: %@", buf, 0x20u);
    }
    else
    {
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      id v33 = [v24 localizedDescription];
      *(_DWORD *)uint64_t buf = 134218498;
      id v57 = (const char *)v29;
      __int16 v58 = 2048;
      double v59 = *(double *)&v30;
      __int16 v60 = 2112;
      uint64_t v61 = v33;
      _os_log_error_impl(&dword_1D1805000, v32, OS_LOG_TYPE_ERROR, "[PGGraphIngestSocialGroupsProcessor] Error promoting %ld new automatic social groups in graph to database and modifying order of %ld automatic social groups: %@", buf, 0x20u);
    }

    goto LABEL_17;
  }
  uint64_t v23 = +[PGLogging sharedLogging];
  id v24 = [v23 loggingConnection];

  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t buf = 0;
    _os_log_error_impl(&dword_1D1805000, v24, OS_LOG_TYPE_ERROR, "[PGGraphIngestSocialGroupsProcessor] Skipping social group ingest and generation due to nil photoLibrary! Returning...", buf, 2u);
  }
LABEL_25:
}

uint64_t __71__PGGraphIngestSocialGroupsProcessor_runWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a2 * 0.5);
}

uint64_t __71__PGGraphIngestSocialGroupsProcessor_runWithGraphUpdate_progressBlock___block_invoke_232(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a2 * 0.5 + 0.5);
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isResumingFullAnalysis] & 1) != 0
    || ([v4 hasDeletedMomentNodes] & 1) != 0
    || ([v4 hasDeletedPersonNodes] & 1) != 0
    || (uint64_t v5 = [v4 momentUpdateTypes],
        ([(id)objc_opt_class() requiredMomentUpdateTypes] & v5) != 0)
    || ([v4 hasSocialGroupsToInsert] & 1) != 0
    || ([v4 hasSocialGroupsToUpdate] & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else
  {
    if ([(PGGraphBuilder *)self->_graphBuilder isSharedLibraryEnabled])
    {
      id v8 = [(PGGraphBuilder *)self->_graphBuilder graph];
      double v9 = [v8 meNode];
      BOOL v10 = v9 != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = [v4 insertedMomentNodes];
    uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = [*(id *)(*((void *)&v21 + 1) + 8 * i) collection];
          if (v10)
          {
            id v16 = [(PGGraphBuilder *)self->_graphBuilder momentNodesWhereMeIsPresent];
            char v17 = [v16 intersectsCollection:v15];
          }
          else
          {
            char v17 = 1;
          }
          id v18 = [v15 personNodes];
          uint64_t v19 = [v18 count];

          if (v19 && (v17 & 1) != 0)
          {
            BOOL v6 = 1;
            goto LABEL_26;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v6 = 0;
LABEL_26:
  }
  return v6;
}

- (PGGraphIngestSocialGroupsProcessor)initWithGraphBuilder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestSocialGroupsProcessor;
  BOOL v6 = [(PGGraphIngestSocialGroupsProcessor *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
  }

  return v7;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 8;
}

@end