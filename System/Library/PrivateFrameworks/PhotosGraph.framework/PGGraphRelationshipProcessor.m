@interface PGGraphRelationshipProcessor
- (CLSServiceManager)serviceManager;
- (NSDictionary)personLocalIdentifierByContactIdentifier;
- (NSMutableArray)analyzersToRun;
- (NSMutableDictionary)childScoreByPersonLocalIdentifier;
- (NSMutableDictionary)coworkerScoreByPersonLocalIdentifier;
- (NSMutableDictionary)familyScoreByPersonLocalIdentifier;
- (NSMutableDictionary)friendScoreByPersonLocalIdentifier;
- (NSMutableDictionary)parentScoreByPersonLocalIdentifier;
- (NSMutableDictionary)partnerScoreByPersonLocalIdentifier;
- (NSMutableDictionary)relationshipAnalyzerPropertiesByPersonLocalIdentifier;
- (NSSet)contactIdentifiers;
- (PGGraph)graph;
- (PGGraphMomentNodeCollection)momentNodes;
- (PGGraphPersonNodeCollection)personNodes;
- (PGGraphRelationshipProcessor)initWithPersonNodes:(id)a3 runOptions:(unint64_t)a4 serviceManager:(id)a5;
- (id)_socialGroupNodesIncludingPersonLocalIdentifiers:(id)a3 minimumMatches:(unint64_t)a4 amongSocialGroupNodes:(id)a5;
- (id)personLocalIdentifierForContactIdentifier:(id)a3;
- (id)relationshipAnalyzerPropertiesForPersonLocalIdentifier:(id)a3;
- (unint64_t)numberOfSignals;
- (unint64_t)runOptions;
- (void)_aggregateScores;
- (void)_enumerateInferredChildrenUsingBlock:(id)a3;
- (void)_enumerateInferredCoworkersUsingBlock:(id)a3;
- (void)_enumerateInferredFamilyMembersUsingBlock:(id)a3;
- (void)_enumerateInferredFriendsUsingBlock:(id)a3;
- (void)_enumerateInferredParentsUsingBlock:(id)a3;
- (void)_enumerateInferredPartnerUsingBlock:(id)a3;
- (void)_enumerateInferredRelationshipMembersFromScores:(id)a3 cumulativeThreshold:(double)a4 minimumConfidence:(double)a5 usingBlock:(id)a6;
- (void)_extractSignalsFromRunOptions;
- (void)enumerateHighRecallInferredRelationshipsExcludingPersonNodes:(id)a3 usingBlock:(id)a4;
- (void)enumerateInferredRelationshipsUsingBlock:(id)a3;
- (void)runRelationshipAnalysisWithLoggingConnection:(id)a3 progressBlock:(id)a4;
- (void)setAnalyzersToRun:(id)a3;
- (void)setChildScoreByPersonLocalIdentifier:(id)a3;
- (void)setCoworkerScoreByPersonLocalIdentifier:(id)a3;
- (void)setFamilyScoreByPersonLocalIdentifier:(id)a3;
- (void)setFriendScoreByPersonLocalIdentifier:(id)a3;
- (void)setParentScoreByPersonLocalIdentifier:(id)a3;
- (void)setPartnerScoreByPersonLocalIdentifier:(id)a3;
- (void)setRelationshipAnalyzerPropertiesByPersonLocalIdentifier:(id)a3;
@end

@implementation PGGraphRelationshipProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_friendScoreByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_coworkerScoreByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_familyScoreByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_childScoreByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_parentScoreByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_partnerScoreByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_graph, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifierByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
  objc_storeStrong((id *)&self->_personNodes, 0);
  objc_storeStrong((id *)&self->_analyzersToRun, 0);
}

- (CLSServiceManager)serviceManager
{
  return (CLSServiceManager *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFriendScoreByPersonLocalIdentifier:(id)a3
{
}

- (NSMutableDictionary)friendScoreByPersonLocalIdentifier
{
  return self->_friendScoreByPersonLocalIdentifier;
}

- (void)setCoworkerScoreByPersonLocalIdentifier:(id)a3
{
}

- (NSMutableDictionary)coworkerScoreByPersonLocalIdentifier
{
  return self->_coworkerScoreByPersonLocalIdentifier;
}

- (void)setFamilyScoreByPersonLocalIdentifier:(id)a3
{
}

- (NSMutableDictionary)familyScoreByPersonLocalIdentifier
{
  return self->_familyScoreByPersonLocalIdentifier;
}

- (void)setChildScoreByPersonLocalIdentifier:(id)a3
{
}

- (NSMutableDictionary)childScoreByPersonLocalIdentifier
{
  return self->_childScoreByPersonLocalIdentifier;
}

- (void)setParentScoreByPersonLocalIdentifier:(id)a3
{
}

- (NSMutableDictionary)parentScoreByPersonLocalIdentifier
{
  return self->_parentScoreByPersonLocalIdentifier;
}

- (void)setPartnerScoreByPersonLocalIdentifier:(id)a3
{
}

- (NSMutableDictionary)partnerScoreByPersonLocalIdentifier
{
  return self->_partnerScoreByPersonLocalIdentifier;
}

- (void)setRelationshipAnalyzerPropertiesByPersonLocalIdentifier:(id)a3
{
}

- (NSMutableDictionary)relationshipAnalyzerPropertiesByPersonLocalIdentifier
{
  return self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier;
}

- (PGGraph)graph
{
  return self->_graph;
}

- (NSDictionary)personLocalIdentifierByContactIdentifier
{
  return self->_personLocalIdentifierByContactIdentifier;
}

- (NSSet)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (PGGraphMomentNodeCollection)momentNodes
{
  return self->_momentNodes;
}

- (PGGraphPersonNodeCollection)personNodes
{
  return self->_personNodes;
}

- (unint64_t)numberOfSignals
{
  return self->_numberOfSignals;
}

- (void)setAnalyzersToRun:(id)a3
{
}

- (NSMutableArray)analyzersToRun
{
  return self->_analyzersToRun;
}

- (unint64_t)runOptions
{
  return self->_runOptions;
}

- (id)relationshipAnalyzerPropertiesForPersonLocalIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PGGraph *)self->_graph personNodeForPersonLocalIdentifier:v4];
  if (v5 && [(MANodeCollection *)self->_personNodes containsNode:v5])
  {
    v6 = [(NSMutableDictionary *)self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier objectForKeyedSubscript:v4];
    if (!v6)
    {
      v6 = objc_alloc_init(PGPersonRelationshipAnalyzerProperties);
      [(NSMutableDictionary *)self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier setObject:v6 forKeyedSubscript:v4];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)personLocalIdentifierForContactIdentifier:(id)a3
{
  return [(NSDictionary *)self->_personLocalIdentifierByContactIdentifier objectForKeyedSubscript:a3];
}

- (void)_enumerateInferredCoworkersUsingBlock:(id)a3
{
}

- (void)_enumerateInferredFriendsUsingBlock:(id)a3
{
}

- (void)_enumerateInferredChildrenUsingBlock:(id)a3
{
}

- (void)_enumerateInferredParentsUsingBlock:(id)a3
{
  id v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__16599;
  v18[4] = __Block_byref_object_dispose__16600;
  id v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__16599;
  v16[4] = __Block_byref_object_dispose__16600;
  id v17 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  parentScoreByPersonLocalIdentifier = self->_parentScoreByPersonLocalIdentifier;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PGGraphRelationshipProcessor__enumerateInferredParentsUsingBlock___block_invoke;
  v13[3] = &unk_1E68E6720;
  v13[4] = v15;
  v13[5] = v14;
  v13[6] = v16;
  v13[7] = v18;
  v13[8] = v20;
  [(NSMutableDictionary *)parentScoreByPersonLocalIdentifier enumerateKeysAndObjectsUsingBlock:v13];
  v6 = self->_parentScoreByPersonLocalIdentifier;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PGGraphRelationshipProcessor__enumerateInferredParentsUsingBlock___block_invoke_2;
  v8[3] = &unk_1E68E6748;
  v10 = v18;
  v11 = v16;
  v12 = v20;
  id v7 = v4;
  id v9 = v7;
  [(NSMutableDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v8];

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
}

void __68__PGGraphRelationshipProcessor__enumerateInferredParentsUsingBlock___block_invoke(void *a1, void *a2, void *a3)
{
  id v11 = a2;
  [a3 doubleValue];
  double v7 = v6;
  double v8 = *(double *)(*(void *)(a1[4] + 8) + 24);
  uint64_t v9 = *(void *)(a1[5] + 8);
  if (v7 <= v8)
  {
    if (v7 <= *(double *)(v9 + 24)) {
      goto LABEL_6;
    }
    *(double *)(v9 + 24) = v7;
    v10 = a1 + 6;
  }
  else
  {
    *(double *)(v9 + 24) = v8;
    *(double *)(*(void *)(a1[4] + 8) + 24) = v7;
    v10 = a1 + 7;
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(*(void *)(a1[7] + 8) + 40));
  }
  objc_storeStrong((id *)(*(void *)(*v10 + 8) + 40), a2);
LABEL_6:
  *(double *)(*(void *)(a1[8] + 8) + 24) = v7 + *(double *)(*(void *)(a1[8] + 8) + 24);
}

void __68__PGGraphRelationshipProcessor__enumerateInferredParentsUsingBlock___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ((([v7 isEqualToString:*(void *)(*(void *)(a1[5] + 8) + 40)] & 1) != 0
     || [v7 isEqualToString:*(void *)(*(void *)(a1[6] + 8) + 40)])
    && ([v5 doubleValue],
        v6.n128_f64[0] = v6.n128_f64[0] / *(double *)(*(void *)(a1[7] + 8) + 24),
        v6.n128_f64[0] > 0.4))
  {
    (*(void (**)(__n128))(a1[4] + 16))(v6);
  }
  else
  {
    v6.n128_u64[0] = 0;
    (*(void (**)(__n128))(a1[4] + 16))(v6);
  }
}

- (void)_enumerateInferredFamilyMembersUsingBlock:(id)a3
{
}

- (id)_socialGroupNodesIncludingPersonLocalIdentifiers:(id)a3 minimumMatches:(unint64_t)a4 amongSocialGroupNodes:(id)a5
{
  id v7 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __118__PGGraphRelationshipProcessor__socialGroupNodesIncludingPersonLocalIdentifiers_minimumMatches_amongSocialGroupNodes___block_invoke;
  v11[3] = &unk_1E68E66F8;
  id v12 = v7;
  unint64_t v13 = a4;
  id v8 = v7;
  uint64_t v9 = [a5 filteredCollectionUsingBlock:v11];

  return v9;
}

BOOL __118__PGGraphRelationshipProcessor__socialGroupNodesIncludingPersonLocalIdentifiers_minimumMatches_amongSocialGroupNodes___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 personNodes];
  if ((unint64_t)[v3 count] >= *(void *)(a1 + 40))
  {
    id v5 = [v3 localIdentifiers];
    __n128 v6 = (void *)[v5 mutableCopy];

    [v6 intersectSet:*(void *)(a1 + 32)];
    BOOL v4 = (unint64_t)[v6 count] >= *(void *)(a1 + 40);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_enumerateInferredRelationshipMembersFromScores:(id)a3 cumulativeThreshold:(double)a4 minimumConfidence:(double)a5 usingBlock:(id)a6
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (void (**)(id, void, double))a6;
  uint64_t v67 = 0;
  v68 = (double *)&v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 0;
  if ([v10 count])
  {
    id v12 = (void *)MEMORY[0x1E4F28C68];
    unint64_t v13 = [v10 allValues];
    v47 = [v12 expressionForConstantValue:v13];

    v14 = (void *)MEMORY[0x1E4F28C68];
    v74[0] = v47;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
    v16 = [v14 expressionForFunction:@"average:" arguments:v15];
    id v17 = [v16 expressionValueWithObject:0 context:0];
    [v17 doubleValue];
    uint64_t v19 = v18;

    v20 = (void *)MEMORY[0x1E4F28C68];
    v73 = v47;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
    v22 = [v20 expressionForFunction:@"stddev:" arguments:v21];
    v23 = [v22 expressionValueWithObject:0 context:0];
    [v23 doubleValue];
    uint64_t v25 = v24;

    v26 = [MEMORY[0x1E4F1CA80] set];
    v27 = [MEMORY[0x1E4F1CA80] set];
    v28 = (void *)MEMORY[0x1E4F1CA80];
    v29 = [v10 allKeys];
    uint64_t v45 = [v28 setWithArray:v29];

    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __129__PGGraphRelationshipProcessor__enumerateInferredRelationshipMembersFromScores_cumulativeThreshold_minimumConfidence_usingBlock___block_invoke;
    v61[3] = &unk_1E68E6680;
    v63 = &v67;
    uint64_t v64 = v19;
    uint64_t v65 = v25;
    double v66 = a4;
    id v30 = v26;
    id v62 = v30;
    [v10 enumerateKeysAndObjectsUsingBlock:v61];
    if ([v30 count])
    {
      v31 = +[PGGraphNodeCollection nodesInGraph:](PGGraphSocialGroupNodeCollection, "nodesInGraph:", self->_graph, v45);
      v32 = [(PGGraphRelationshipProcessor *)self _socialGroupNodesIncludingPersonLocalIdentifiers:v30 minimumMatches:2 amongSocialGroupNodes:v31];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __129__PGGraphRelationshipProcessor__enumerateInferredRelationshipMembersFromScores_cumulativeThreshold_minimumConfidence_usingBlock___block_invoke_2;
      v56[3] = &unk_1E68E66D0;
      id v57 = v10;
      v59 = &v67;
      double v60 = a5;
      id v58 = v27;
      [v32 enumerateIdentifiersAsCollectionsWithBlock:v56];
    }
    objc_msgSend(v30, "unionSet:", v27, v45);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v33 = v30;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v52 objects:v72 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v53 != v35) {
            objc_enumerationMutation(v33);
          }
          uint64_t v37 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          v38 = [v10 objectForKeyedSubscript:v37];
          [v38 doubleValue];
          v11[2](v11, v37, v39 / v68[3]);
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v52 objects:v72 count:16];
      }
      while (v34);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v40 = v46;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v48 objects:v71 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v49 != v42) {
            objc_enumerationMutation(v40);
          }
          uint64_t v44 = *(void *)(*((void *)&v48 + 1) + 8 * j);
          if (([v33 containsObject:v44] & 1) == 0) {
            v11[2](v11, v44, 0.0);
          }
        }
        uint64_t v41 = [v40 countByEnumeratingWithState:&v48 objects:v71 count:16];
      }
      while (v41);
    }
  }
  _Block_object_dispose(&v67, 8);
}

void __129__PGGraphRelationshipProcessor__enumerateInferredRelationshipMembersFromScores_cumulativeThreshold_minimumConfidence_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  [a3 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);
  [MEMORY[0x1E4F76C60] cumulativeNormalDistributionForX:v5 mu:*(double *)(a1 + 48) sigma:*(double *)(a1 + 56)];
  if (v6 >= *(double *)(a1 + 64)) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __129__PGGraphRelationshipProcessor__enumerateInferredRelationshipMembersFromScores_cumulativeThreshold_minimumConfidence_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = [a3 personNodes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __129__PGGraphRelationshipProcessor__enumerateInferredRelationshipMembersFromScores_cumulativeThreshold_minimumConfidence_usingBlock___block_invoke_3;
  v7[3] = &unk_1E68E66A8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 56);
  long long v6 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v6;
  long long v9 = v6;
  [v4 enumerateNodesUsingBlock:v7];
}

void __129__PGGraphRelationshipProcessor__enumerateInferredRelationshipMembersFromScores_cumulativeThreshold_minimumConfidence_usingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = [a2 localIdentifier];
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  BOOL v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    if (v5 / *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) >= *(double *)(a1 + 56)) {
      [*(id *)(a1 + 40) addObject:v6];
    }
  }
}

- (void)_enumerateInferredPartnerUsingBlock:(id)a3
{
  id v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__16599;
  void v14[4] = __Block_byref_object_dispose__16600;
  id v15 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  partnerScoreByPersonLocalIdentifier = self->_partnerScoreByPersonLocalIdentifier;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PGGraphRelationshipProcessor__enumerateInferredPartnerUsingBlock___block_invoke;
  v12[3] = &unk_1E68E6630;
  v12[4] = v13;
  v12[5] = v14;
  v12[6] = v16;
  [(NSMutableDictionary *)partnerScoreByPersonLocalIdentifier enumerateKeysAndObjectsUsingBlock:v12];
  id v6 = self->_partnerScoreByPersonLocalIdentifier;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PGGraphRelationshipProcessor__enumerateInferredPartnerUsingBlock___block_invoke_2;
  v8[3] = &unk_1E68E6658;
  uint64_t v10 = v14;
  id v11 = v16;
  id v7 = v4;
  id v9 = v7;
  [(NSMutableDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v8];

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);

  _Block_object_dispose(v16, 8);
}

void __68__PGGraphRelationshipProcessor__enumerateInferredPartnerUsingBlock___block_invoke(void *a1, void *a2, void *a3)
{
  id v8 = a2;
  [a3 doubleValue];
  double v7 = v6;
  if (v6 > *(double *)(*(void *)(a1[4] + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
    *(double *)(*(void *)(a1[4] + 8) + 24) = v7;
  }
  *(double *)(*(void *)(a1[6] + 8) + 24) = v7 + *(double *)(*(void *)(a1[6] + 8) + 24);
}

void __68__PGGraphRelationshipProcessor__enumerateInferredPartnerUsingBlock___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 isEqualToString:*(void *)(*(void *)(a1[5] + 8) + 40)]
    && ([v5 doubleValue],
        v6.n128_f64[0] = v6.n128_f64[0] / *(double *)(*(void *)(a1[6] + 8) + 24),
        v6.n128_f64[0] > 0.5))
  {
    (*(void (**)(__n128))(a1[4] + 16))(v6);
  }
  else
  {
    v6.n128_u64[0] = 0;
    (*(void (**)(__n128))(a1[4] + 16))(v6);
  }
}

- (void)_aggregateScores
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  partnerScoreByPersonLocalIdentifier = self->_partnerScoreByPersonLocalIdentifier;
  self->_partnerScoreByPersonLocalIdentifier = v3;

  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  parentScoreByPersonLocalIdentifier = self->_parentScoreByPersonLocalIdentifier;
  self->_parentScoreByPersonLocalIdentifier = v5;

  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  childScoreByPersonLocalIdentifier = self->_childScoreByPersonLocalIdentifier;
  self->_childScoreByPersonLocalIdentifier = v7;

  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  familyScoreByPersonLocalIdentifier = self->_familyScoreByPersonLocalIdentifier;
  self->_familyScoreByPersonLocalIdentifier = v9;

  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  coworkerScoreByPersonLocalIdentifier = self->_coworkerScoreByPersonLocalIdentifier;
  self->_coworkerScoreByPersonLocalIdentifier = v11;

  unint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
  friendScoreByPersonLocalIdentifier = self->_friendScoreByPersonLocalIdentifier;
  self->_friendScoreByPersonLocalIdentifier = v13;

  relationshipAnalyzerPropertiesByPersonLocalIdentifier = self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __48__PGGraphRelationshipProcessor__aggregateScores__block_invoke;
  v16[3] = &unk_1E68E6608;
  void v16[4] = self;
  [(NSMutableDictionary *)relationshipAnalyzerPropertiesByPersonLocalIdentifier enumerateKeysAndObjectsUsingBlock:v16];
}

void __48__PGGraphRelationshipProcessor__aggregateScores__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v24 = a2;
  id v5 = a3;
  [v5 partnerScore];
  if (v6 > 0.0)
  {
    id v7 = objc_msgSend(NSNumber, "numberWithDouble:");
    id v8 = [*(id *)(a1 + 32) partnerScoreByPersonLocalIdentifier];
    [v8 setObject:v7 forKeyedSubscript:v24];
  }
  [v5 parentScore];
  if (v9 > 0.0)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithDouble:");
    id v11 = [*(id *)(a1 + 32) parentScoreByPersonLocalIdentifier];
    [v11 setObject:v10 forKeyedSubscript:v24];
  }
  [v5 childScore];
  if (v12 > 0.0)
  {
    unint64_t v13 = objc_msgSend(NSNumber, "numberWithDouble:");
    v14 = [*(id *)(a1 + 32) childScoreByPersonLocalIdentifier];
    [v14 setObject:v13 forKeyedSubscript:v24];
  }
  [v5 familyScore];
  if (v15 > 0.0)
  {
    v16 = objc_msgSend(NSNumber, "numberWithDouble:");
    id v17 = [*(id *)(a1 + 32) familyScoreByPersonLocalIdentifier];
    [v17 setObject:v16 forKeyedSubscript:v24];
  }
  [v5 coworkerScore];
  if (v18 > 0.0)
  {
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithDouble:");
    v20 = [*(id *)(a1 + 32) coworkerScoreByPersonLocalIdentifier];
    [v20 setObject:v19 forKeyedSubscript:v24];
  }
  [v5 friendScore];
  if (v21 > 0.0)
  {
    v22 = objc_msgSend(NSNumber, "numberWithDouble:");
    v23 = [*(id *)(a1 + 32) friendScoreByPersonLocalIdentifier];
    [v23 setObject:v22 forKeyedSubscript:v24];
  }
}

- (void)_extractSignalsFromRunOptions
{
  if (+[PGPeopleInferencesConveniences signalInRunOptions:self->_runOptions signal:2])
  {
    analyzersToRun = self->_analyzersToRun;
    id v4 = [[PGRelationshipTripAnalyzer alloc] initWithRelationshipProcessor:self];
    [(NSMutableArray *)analyzersToRun addObject:v4];
  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:self->_runOptions signal:4])
  {
    id v5 = self->_analyzersToRun;
    double v6 = [[PGRelationshipNightOutAnalyzer alloc] initWithRelationshipProcessor:self];
    [(NSMutableArray *)v5 addObject:v6];
  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:self->_runOptions signal:16])
  {
    id v7 = self->_analyzersToRun;
    id v8 = [[PGRelationshipHolidayAnalyzer alloc] initWithRelationshipProcessor:self];
    [(NSMutableArray *)v7 addObject:v8];
  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:self->_runOptions signal:32])
  {
    double v9 = self->_analyzersToRun;
    uint64_t v10 = [[PGRelationshipContactNameAnalyzer alloc] initWithRelationshipProcessor:self];
    [(NSMutableArray *)v9 addObject:v10];
  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:self->_runOptions signal:64])
  {
    id v11 = self->_analyzersToRun;
    double v12 = [[PGRelationshipHomeAnalyzer alloc] initWithRelationshipProcessor:self];
    [(NSMutableArray *)v11 addObject:v12];
  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:self->_runOptions signal:128])
  {
    unint64_t v13 = self->_analyzersToRun;
    v14 = [[PGRelationshipAnniversaryAnalyzer alloc] initWithRelationshipProcessor:self];
    [(NSMutableArray *)v13 addObject:v14];
  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:self->_runOptions signal:256])
  {
    double v15 = self->_analyzersToRun;
    v16 = [[PGRelationshipSocialGroupAnalyzer alloc] initWithRelationshipProcessor:self];
    [(NSMutableArray *)v15 addObject:v16];
  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:self->_runOptions signal:8])
  {
    id v17 = self->_analyzersToRun;
    double v18 = [[PGRelationshipMomentFrequencyAnalyzer alloc] initWithRelationshipProcessor:self];
    [(NSMutableArray *)v17 addObject:v18];
  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:self->_runOptions signal:512])
  {
    uint64_t v19 = self->_analyzersToRun;
    v20 = [[PGRelationshipWeekendAnalyzer alloc] initWithRelationshipProcessor:self];
    [(NSMutableArray *)v19 addObject:v20];
  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:self->_runOptions signal:1024])
  {
    double v21 = self->_analyzersToRun;
    v22 = [[PGRelationshipCalendarAnalyzer alloc] initWithRelationshipProcessor:self];
    [(NSMutableArray *)v21 addObject:v22];
  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:self->_runOptions signal:2048])
  {
    v23 = self->_analyzersToRun;
    id v24 = [[PGRelationshipWorkAnalyzer alloc] initWithRelationshipProcessor:self];
    [(NSMutableArray *)v23 addObject:v24];
  }
  if (+[PGPeopleInferencesConveniences signalInRunOptions:self->_runOptions signal:4096])
  {
    uint64_t v25 = self->_analyzersToRun;
    v26 = [[PGRelationshipAgeAnalyzer alloc] initWithRelationshipProcessor:self];
    [(NSMutableArray *)v25 addObject:v26];
  }
  self->_numberOfSignals = [(NSMutableArray *)self->_analyzersToRun count];
}

- (void)enumerateHighRecallInferredRelationshipsExcludingPersonNodes:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PGGraphRelationshipProcessor *)self personNodes];
  double v9 = [v8 collectionBySubtracting:v7];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __104__PGGraphRelationshipProcessor_enumerateHighRecallInferredRelationshipsExcludingPersonNodes_usingBlock___block_invoke;
  v11[3] = &unk_1E68E65E0;
  void v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 enumerateLocalIdentifiersUsingBlock:v11];
}

void __104__PGGraphRelationshipProcessor_enumerateHighRecallInferredRelationshipsExcludingPersonNodes_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [*(id *)(a1 + 32) relationshipAnalyzerPropertiesByPersonLocalIdentifier];
  id v4 = [v3 objectForKeyedSubscript:v5];

  if (![v4 isInferredHighRecallChild]) {
    [v4 isInferredHighRecallHouseholdMember];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)enumerateInferredRelationshipsUsingBlock:(id)a3
{
  id v4 = a3;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  char v37 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke;
  v33[3] = &unk_1E68E6590;
  v33[4] = self;
  id v5 = v4;
  id v34 = v5;
  uint64_t v35 = v36;
  [(PGGraphRelationshipProcessor *)self _enumerateInferredPartnerUsingBlock:v33];
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_2;
  v28[3] = &unk_1E68E65B8;
  id v7 = v6;
  id v29 = v7;
  id v30 = self;
  id v8 = v5;
  id v31 = v8;
  v32 = v36;
  [(PGGraphRelationshipProcessor *)self _enumerateInferredFamilyMembersUsingBlock:v28];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_3;
  v23[3] = &unk_1E68E65B8;
  id v9 = v7;
  id v24 = v9;
  uint64_t v25 = self;
  id v10 = v8;
  id v26 = v10;
  v27 = v36;
  [(PGGraphRelationshipProcessor *)self _enumerateInferredFriendsUsingBlock:v23];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_243;
  v20[3] = &unk_1E68E6590;
  void v20[4] = self;
  id v11 = v10;
  id v21 = v11;
  v22 = v36;
  [(PGGraphRelationshipProcessor *)self _enumerateInferredParentsUsingBlock:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_2_244;
  v17[3] = &unk_1E68E6590;
  v17[4] = self;
  id v12 = v11;
  id v18 = v12;
  uint64_t v19 = v36;
  [(PGGraphRelationshipProcessor *)self _enumerateInferredChildrenUsingBlock:v17];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_3_245;
  v14[3] = &unk_1E68E6590;
  void v14[4] = self;
  id v13 = v12;
  id v15 = v13;
  v16 = v36;
  [(PGGraphRelationshipProcessor *)self _enumerateInferredCoworkersUsingBlock:v14];

  _Block_object_dispose(v36, 8);
}

void __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 relationshipAnalyzerPropertiesByPersonLocalIdentifier];
  id v9 = [v7 objectForKeyedSubscript:v6];

  id v8 = [v9 edgeProperties];
  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(a3);
}

void __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_2(uint64_t a1, void *a2, double a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithDouble:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];

  id v8 = [*(id *)(a1 + 40) relationshipAnalyzerPropertiesByPersonLocalIdentifier];
  id v10 = [v8 objectForKeyedSubscript:v6];

  id v9 = [v10 edgeProperties];
  (*(void (**)(double))(*(void *)(a1 + 48) + 16))(a3);
}

void __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_3(uint64_t a1, void *a2, double a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  [v6 doubleValue];
  if (v7 <= a3)
  {
    id v10 = [*(id *)(a1 + 40) relationshipAnalyzerPropertiesByPersonLocalIdentifier];
    id v11 = [v10 objectForKeyedSubscript:v5];

    id v12 = [v11 edgeProperties];
    (*(void (**)(double))(*(void *)(a1 + 48) + 16))(a3);
  }
  else
  {
    id v8 = +[PGLogging sharedLogging];
    id v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_1D1805000, v9, OS_LOG_TYPE_INFO, "Person %@ is inferred family, filtering out of friends", (uint8_t *)&v13, 0xCu);
    }
  }
}

void __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_243(uint64_t a1, void *a2, double a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [v5 relationshipAnalyzerPropertiesByPersonLocalIdentifier];
  id v9 = [v7 objectForKeyedSubscript:v6];

  id v8 = [v9 edgeProperties];
  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(a3);
}

void __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_2_244(uint64_t a1, void *a2, double a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [v5 relationshipAnalyzerPropertiesByPersonLocalIdentifier];
  id v9 = [v7 objectForKeyedSubscript:v6];

  id v8 = [v9 edgeProperties];
  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(a3);
}

void __73__PGGraphRelationshipProcessor_enumerateInferredRelationshipsUsingBlock___block_invoke_3_245(uint64_t a1, void *a2, double a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [v5 relationshipAnalyzerPropertiesByPersonLocalIdentifier];
  id v9 = [v7 objectForKeyedSubscript:v6];

  id v8 = [v9 edgeProperties];
  (*(void (**)(double))(*(void *)(a1 + 40) + 16))(a3);
}

- (void)runRelationshipAnalysisWithLoggingConnection:(id)a3 progressBlock:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id aBlock = a4;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  relationshipAnalyzerPropertiesByPersonLocalIdentifier = self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier;
  self->_relationshipAnalyzerPropertiesByPersonLocalIdentifier = v5;

  double v7 = +[PGPeopleInferencesConveniences personLocalIdentifierByContactIdentifierFromPersonNodes:self->_personNodes];
  personLocalIdentifierByContactIdentifier = self->_personLocalIdentifierByContactIdentifier;
  self->_personLocalIdentifierByContactIdentifier = v7;

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = [(NSDictionary *)self->_personLocalIdentifierByContactIdentifier allKeys];
  id v11 = [v9 setWithArray:v10];
  contactIdentifiers = self->_contactIdentifiers;
  self->_contactIdentifiers = v11;

  uint64_t v65 = 0;
  double v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  uint64_t v61 = 0;
  id v62 = (double *)&v61;
  uint64_t v63 = 0x2020000000;
  uint64_t v64 = 0;
  uint64_t v42 = _Block_copy(aBlock);
  if (v42
    && (double v13 = CFAbsoluteTimeGetCurrent(), v13 - v62[3] >= 0.01)
    && (v62[3] = v13,
        LOBYTE(v57) = 0,
        (*((void (**)(void *, uint64_t *, double))v42 + 2))(v42, &v57, 0.0),
        char v14 = *((unsigned char *)v66 + 24) | v57,
        (*((unsigned char *)v66 + 24) = v14) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 96;
      LOWORD(v75) = 2080;
      *(void *)((char *)&v75 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/People Inferences/Relationship/PGGraphRelationshipProcessor.m";
      _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&long long v75 = buf;
    *((void *)&v75 + 1) = 0x2020000000;
    char v76 = 0;
    uint64_t v57 = 0;
    id v58 = &v57;
    uint64_t v59 = 0x2020000000;
    uint64_t v60 = 0;
    unint64_t numberOfSignals = self->_numberOfSignals;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    obuint64_t j = self->_analyzersToRun;
    uint64_t v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v53 objects:v73 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v54;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v54 != v17) {
            objc_enumerationMutation(obj);
          }
          if (*(unsigned char *)(v75 + 24))
          {

            goto LABEL_29;
          }
          uint64_t v19 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          uint64_t v20 = v58[3];
          id v21 = v41;
          os_signpost_id_t v22 = os_signpost_id_generate(v21);
          v23 = v21;
          id v24 = v23;
          if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
          {
            *(_WORD *)uint64_t v69 = 0;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "RelationshipAnalyzer", "", v69, 2u);
          }

          mach_timebase_info info = 0;
          mach_timebase_info(&info);
          uint64_t v25 = mach_absolute_time();
          id v26 = (void *)MEMORY[0x1D25FED50]();
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __91__PGGraphRelationshipProcessor_runRelationshipAnalysisWithLoggingConnection_progressBlock___block_invoke;
          v43[3] = &unk_1E68E6568;
          id v44 = v42;
          uint64_t v45 = &v61;
          v46 = &v57;
          v47 = &v65;
          uint64_t v50 = v20;
          double v51 = 0.9 / (double)numberOfSignals;
          uint64_t v49 = 0x3F847AE147AE147BLL;
          long long v48 = buf;
          [v19 runAnalysisWithProgressBlock:v43];

          uint64_t v27 = mach_absolute_time();
          mach_timebase_info v28 = info;
          id v29 = v24;
          id v30 = v29;
          if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            id v31 = [v19 name];
            *(_DWORD *)uint64_t v69 = 138412290;
            *(void *)uint64_t v70 = v31;
            _os_signpost_emit_with_name_impl(&dword_1D1805000, v30, OS_SIGNPOST_INTERVAL_END, v22, "RelationshipAnalyzer", "Relationship Analyzer: %@", v69, 0xCu);
          }
          v32 = v30;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            id v33 = NSString;
            id v34 = [v19 name];
            uint64_t v35 = [v33 stringWithFormat:@"Relationship Analyzer: %@", v34];
            *(_DWORD *)uint64_t v69 = 136315650;
            *(void *)uint64_t v70 = "RelationshipAnalyzer";
            *(_WORD *)&v70[8] = 2112;
            *(void *)&v70[10] = v35;
            __int16 v71 = 2048;
            double v72 = (float)((float)((float)((float)(v27 - v25) * (float)v28.numer) / (float)v28.denom) / 1000000.0);
            _os_log_impl(&dword_1D1805000, v32, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v69, 0x20u);
          }
        }
        uint64_t v16 = [(NSMutableArray *)obj countByEnumeratingWithState:&v53 objects:v73 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    if (!*(unsigned char *)(v75 + 24))
    {
      [(PGGraphRelationshipProcessor *)self _aggregateScores];
      if (v42)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (Current - v62[3] >= 0.01)
        {
          v62[3] = Current;
          LOBYTE(info.numer) = 0;
          (*((void (**)(void *, mach_timebase_info *, double))v42 + 2))(v42, &info, 1.0);
          char v37 = *((unsigned char *)v66 + 24) | LOBYTE(info.numer);
          *((unsigned char *)v66 + 24) = v37;
          if (v37)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t v69 = 67109378;
              *(_DWORD *)uint64_t v70 = 129;
              *(_WORD *)&v70[4] = 2080;
              *(void *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/People Inferences/Relationship/PGGraphRelationshipProcessor.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v69, 0x12u);
            }
          }
        }
      }
    }
LABEL_29:
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
}

void __91__PGGraphRelationshipProcessor_runRelationshipAnalysisWithLoggingConnection_progressBlock___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32)
    && (double Current = CFAbsoluteTimeGetCurrent(),
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8),
        Current - *(double *)(v7 + 24) >= *(double *)(a1 + 72))
    && (*(double *)(v7 + 24) = Current,
        (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                 + 24)),
        (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                               + 24)) != 0))
  {
    *a2 = 1;
  }
  else
  {
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(a1 + 80) + *(double *)(a1 + 88) * a3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *a2;
  }
}

- (PGGraphRelationshipProcessor)initWithPersonNodes:(id)a3 runOptions:(unint64_t)a4 serviceManager:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PGGraphRelationshipProcessor;
  id v11 = [(PGGraphRelationshipProcessor *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [v9 graph];
    graph = v11->_graph;
    v11->_graph = (PGGraph *)v12;

    objc_storeStrong((id *)&v11->_personNodes, a3);
    uint64_t v14 = [v9 momentNodes];
    momentNodes = v11->_momentNodes;
    v11->_momentNodes = (PGGraphMomentNodeCollection *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CAD0] set];
    contactIdentifiers = v11->_contactIdentifiers;
    v11->_contactIdentifiers = (NSSet *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionary];
    personLocalIdentifierByContactIdentifier = v11->_personLocalIdentifierByContactIdentifier;
    v11->_personLocalIdentifierByContactIdentifier = (NSDictionary *)v18;

    v11->_runOptions = a4;
    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    analyzersToRun = v11->_analyzersToRun;
    v11->_analyzersToRun = (NSMutableArray *)v20;

    objc_storeStrong((id *)&v11->_serviceManager, a5);
    [(PGGraphRelationshipProcessor *)v11 _extractSignalsFromRunOptions];
  }

  return v11;
}

@end