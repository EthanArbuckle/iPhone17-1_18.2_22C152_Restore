@interface PLSocialGroupAssetContainment
+ (BOOL)_updateAssetPersonEdgesForAssetIDsInBatch:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (BOOL)_updateAssetPersonEdgesForAssetWithID:(id)a3 usingPersonFaceSizes:(id)a4 existingEdges:(id)a5 inContext:(id)a6 error:(id *)a7;
+ (BOOL)updateAndSaveAssetPersonEdgesForAssetsWithIDs:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (double)assetContainmentLargeFaceThreshold;
+ (double)assetContainmentMinPeopleInMomentRatio;
+ (double)assetContainmentSmallFaceThreshold;
+ (double)assetContainmentSmallTorsoThreshold;
+ (id)_batchAssetIDs:(id)a3;
+ (id)_generateFaceSizesByPersonIDByAssetIDForAssetIDs:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (int)_detectedFaceSizeFromBodyHeight:(double)a3 bodyWidth:(double)a4 size:(double)a5;
+ (void)_updateEdgeLabelsIfNeededForEdge:(id)a3 expectedLabel:(id)a4;
+ (void)setAssetContainmentLargeFaceThreshold:(double)a3;
+ (void)setAssetContainmentSmallFaceThreshold:(double)a3;
+ (void)setAssetContainmentSmallTorsoThreshold:(double)a3;
- (BOOL)_foundPersonIDsPassingContainmentRequirements:(id)a3;
- (NSManagedObjectContext)context;
- (PLSocialGroup)socialGroup;
- (PLSocialGroupAssetContainment)initWithPersons:(id)a3 inContext:(id)a4;
- (PLSocialGroupAssetContainment)initWithSocialGroup:(id)a3;
- (id)_assetIDsPassingContainmentRequirementsFromAssetPersonEdgeDictionaries:(id)a3 error:(id *)a4;
- (id)_assetIDsWithLargeMemberFacesFromAssetPersonEdgeDictionaries:(id)a3 containmentProgress:(id)a4 error:(id *)a5;
- (id)_assetIDsWithRequiredPersonsPresentWithAssetIDs:(id)a3 error:(id *)a4;
- (id)_assetPersonEdgeDictionaries:(id *)a3 forAssetIDs:(id)a4;
- (id)_edgeIDSetFromAssetPersonEdgeDictionaries:(id)a3;
- (id)_fetchEdgeIDsWithLabel:(id)a3 inEdgeIDSet:(id)a4 containmentProgress:(id)a5 error:(id *)a6;
- (id)_fetchEdgeInfosToMediumAndLargeNonMembersInPotentialAssetIDs:(id)a3 edgeInfosToSmallNonMembers:(id)a4 error:(id *)a5;
- (id)_fetchEdgeInfosToSmallNonMembersInPotentialAssetIDs:(id)a3 error:(id *)a4;
- (id)_personIDsByAssetIDFromAssetPersonEdgeDictionaries:(id)a3 potentialAssetIDs:(id)a4 error:(id *)a5;
- (id)_potentialAssetIDsExcludingNonMembersFromAssetIDs:(id)a3 assetIDsWithLargeMemberFaces:(id)a4 error:(id *)a5;
- (id)_potentialAssetIDsFromAssetPersonEdgeDictionaries:(id)a3 containmentProgress:(id)a4 error:(id *)a5;
- (id)assetIDsIncludedInExclusiveContainment:(id)a3 error:(id *)a4;
- (id)runAssetContainment:(id *)a3;
- (id)runAssetContainmentOnAssetIDs:(id)a3 error:(id *)a4;
@end

@implementation PLSocialGroupAssetContainment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_socialGroup, 0);
  objc_storeStrong((id *)&self->_members, 0);
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (PLSocialGroup)socialGroup
{
  return self->_socialGroup;
}

- (id)assetIDsIncludedInExclusiveContainment:(id)a3 error:(id *)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSSet *)self->_members count] > 1)
  {
    v13 = [(PLSocialGroupAssetContainment *)self _assetIDsWithRequiredPersonsPresentWithAssetIDs:v6 error:a4];
    v12 = [v13 exclusiveAssetIDs];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F8C500];
    uint64_t v15 = *MEMORY[0x1E4F28228];
    v16[0] = @"unexpected member set size";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    v10 = [v7 errorWithDomain:v8 code:41003 userInfo:v9];
    v11 = v10;
    if (a4) {
      *a4 = v10;
    }

    v12 = 0;
  }

  return v12;
}

- (id)runAssetContainmentOnAssetIDs:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSSet *)self->_members count] > 1)
  {
    v12 = [(PLSocialGroupAssetContainment *)self _assetIDsWithRequiredPersonsPresentWithAssetIDs:v6 error:a4];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F8C500];
    uint64_t v14 = *MEMORY[0x1E4F28228];
    v15[0] = @"unexpected member set size";
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v10 = [v7 errorWithDomain:v8 code:41003 userInfo:v9];
    v11 = v10;
    if (a4) {
      *a4 = v10;
    }

    v12 = 0;
  }

  return v12;
}

- (id)runAssetContainment:(id *)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([(NSSet *)self->_members count] > 1)
  {
    v10 = [(PLSocialGroupAssetContainment *)self _assetIDsWithRequiredPersonsPresentWithAssetIDs:0 error:a3];
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F8C500];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    v13[0] = @"unexpected member set size";
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v8 = [v5 errorWithDomain:v6 code:41003 userInfo:v7];
    v9 = v8;
    if (a3) {
      *a3 = v8;
    }

    v10 = 0;
  }
  return v10;
}

- (id)_assetIDsWithRequiredPersonsPresentWithAssetIDs:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F90];
  id v7 = a3;
  uint64_t v8 = [v6 progressWithTotalUnitCount:2];
  [v8 becomeCurrentWithPendingUnitCount:1];
  v9 = [(PLSocialGroupAssetContainment *)self _assetPersonEdgeDictionaries:a4 forAssetIDs:v7];

  [v8 resignCurrent];
  if (v9)
  {
    [v8 becomeCurrentWithPendingUnitCount:1];
    v10 = [(PLSocialGroupAssetContainment *)self _assetIDsPassingContainmentRequirementsFromAssetPersonEdgeDictionaries:v9 error:a4];
    [v8 resignCurrent];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_assetIDsPassingContainmentRequirementsFromAssetPersonEdgeDictionaries:(id)a3 error:(id *)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:5];
  uint64_t v8 = [(PLSocialGroupAssetContainment *)self _potentialAssetIDsFromAssetPersonEdgeDictionaries:v6 containmentProgress:v7 error:a4];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 inclusiveAssetIDs];
    v11 = [v9 exclusiveAssetIDs];
    [v7 becomeCurrentWithPendingUnitCount:1];
    uint64_t v12 = [(PLSocialGroupAssetContainment *)self _personIDsByAssetIDFromAssetPersonEdgeDictionaries:v6 potentialAssetIDs:v10 error:a4];
    [v7 resignCurrent];
    if (v12)
    {
      v27 = v10;
      v28 = v11;
      v13 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(v12, "count"));
      [v7 becomeCurrentWithPendingUnitCount:1];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __110__PLSocialGroupAssetContainment__assetIDsPassingContainmentRequirementsFromAssetPersonEdgeDictionaries_error___block_invoke;
      v29[3] = &unk_1E5867A00;
      id v16 = v15;
      id v30 = v16;
      v31 = self;
      id v17 = v13;
      id v32 = v17;
      id v33 = v11;
      id v18 = v14;
      id v34 = v18;
      [v12 enumerateKeysAndObjectsUsingBlock:v29];
      [v7 resignCurrent];
      if ([v7 isCancelled])
      {
        id v26 = v16;
        v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v20 = *MEMORY[0x1E4F8C500];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        v36[0] = @"User cancelled exclusive/ inclusive assetID processing";
        v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
        v22 = [v19 errorWithDomain:v20 code:3072 userInfo:v21];
        v23 = v22;
        if (a4) {
          *a4 = v22;
        }

        v24 = 0;
        v11 = v28;
        id v16 = v26;
      }
      else
      {
        v24 = [[PLSocialGroupAssetContainmentResult alloc] initWithInclusiveAssetIDs:v17 exclusiveAssetIDs:v18];
      }

      v10 = v27;
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __110__PLSocialGroupAssetContainment__assetIDsPassingContainmentRequirementsFromAssetPersonEdgeDictionaries_error___block_invoke(id *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if ([a1[4] isCancelled])
  {
    *a4 = 1;
  }
  else if ([a1[5] _foundPersonIDsPassingContainmentRequirements:v7])
  {
    [a1[6] addObject:v8];
    if ([a1[7] containsObject:v8]) {
      [a1[8] addObject:v8];
    }
  }
  objc_msgSend(a1[4], "setCompletedUnitCount:", objc_msgSend(a1[4], "completedUnitCount") + 1);
}

- (id)_potentialAssetIDsFromAssetPersonEdgeDictionaries:(id)a3 containmentProgress:(id)a4 error:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F1CA80] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "objectForKeyedSubscript:", @"sourceAsset", (void)v22);
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v13);
  }

  id v17 = [MEMORY[0x1E4F1CA80] setWithSet:v10];
  id v18 = [(PLSocialGroupAssetContainment *)self _assetIDsWithLargeMemberFacesFromAssetPersonEdgeDictionaries:v11 containmentProgress:v9 error:a5];
  if (v18)
  {
    [v9 becomeCurrentWithPendingUnitCount:1];
    uint64_t v19 = [(PLSocialGroupAssetContainment *)self _potentialAssetIDsExcludingNonMembersFromAssetIDs:v17 assetIDsWithLargeMemberFaces:v18 error:a5];

    [v9 resignCurrent];
    if (v19)
    {
      uint64_t v20 = [[PLSocialGroupAssetContainmentResult alloc] initWithInclusiveAssetIDs:v10 exclusiveAssetIDs:v19];
      id v17 = (void *)v19;
      goto LABEL_13;
    }
    id v17 = 0;
  }
  uint64_t v20 = 0;
LABEL_13:

  return v20;
}

- (id)_potentialAssetIDsExcludingNonMembersFromAssetIDs:(id)a3 assetIDsWithLargeMemberFaces:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:2];
  [v10 becomeCurrentWithPendingUnitCount:1];
  id v11 = [(PLSocialGroupAssetContainment *)self _fetchEdgeInfosToSmallNonMembersInPotentialAssetIDs:v8 error:a5];
  [v10 resignCurrent];
  if (v11)
  {
    [v10 becomeCurrentWithPendingUnitCount:1];
    uint64_t v12 = [(PLSocialGroupAssetContainment *)self _fetchEdgeInfosToMediumAndLargeNonMembersInPotentialAssetIDs:v8 edgeInfosToSmallNonMembers:v11 error:a5];
    [v10 resignCurrent];
    if (v12)
    {
      v31 = v12;
      id v32 = v11;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v38 != v16) {
              objc_enumerationMutation(v13);
            }
            id v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            uint64_t v19 = (void *)MEMORY[0x19F38D3B0]();
            uint64_t v20 = [v18 objectForKeyedSubscript:@"sourceAsset"];
            [v8 removeObject:v20];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
        }
        while (v15);
      }

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v21 = v32;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v34 != v24) {
              objc_enumerationMutation(v21);
            }
            id v26 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            uint64_t v27 = (void *)MEMORY[0x19F38D3B0]();
            v28 = [v26 objectForKeyedSubscript:@"sourceAsset"];
            if (([v9 containsObject:v28] & 1) == 0) {
              [v8 removeObject:v28];
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v23);
      }

      id v29 = v8;
      uint64_t v12 = v31;
      id v11 = v32;
    }
    else
    {
      id v29 = 0;
    }
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (id)_fetchEdgeInfosToMediumAndLargeNonMembersInPotentialAssetIDs:(id)a3 edgeInfosToSmallNonMembers:(id)a4 error:(id *)a5
{
  void v36[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  v10 = +[PLGraphEdge fetchRequest];
  [v10 setResultType:2];
  v36[0] = @"objectID";
  v36[1] = @"sourceAsset";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  [v10 setPropertiesToFetch:v11];

  uint64_t v12 = (void *)MEMORY[0x1E4F28F60];
  id v13 = [v8 valueForKey:@"objectID"];

  uint64_t v14 = [v12 predicateWithFormat:@"NOT (self in %@) AND NOT (%K in %@) AND ANY %K in %@", v13, @"targetPerson", self->_members, @"sourceAsset", v9];

  [v10 setPredicate:v14];
  uint64_t v15 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  if ([v15 isCancelled])
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F8C500];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    long long v33 = @"User cancelled progress before fetching edges for medium/large nonmembers";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    uint64_t v19 = [v16 errorWithDomain:v17 code:3072 userInfo:v18];
    uint64_t v20 = v19;
    if (a5) {
      *a5 = v19;
    }

    id v21 = 0;
    id v22 = 0;
  }
  else
  {
    context = self->_context;
    id v31 = 0;
    id v21 = [(NSManagedObjectContext *)context executeFetchRequest:v10 error:&v31];
    id v22 = v31;
    if (!v21)
    {
      uint64_t v24 = [NSString stringWithFormat:@"runAssetContainment: error fetching edges with non-member persons: %@", v22];
      long long v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F8C500];
      uint64_t v34 = *MEMORY[0x1E4F28228];
      long long v35 = v24;
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      v28 = [v25 errorWithDomain:v26 code:41003 userInfo:v27];
      id v29 = v28;
      if (a5) {
        *a5 = v28;
      }
    }
    objc_msgSend(v15, "setCompletedUnitCount:", objc_msgSend(v15, "completedUnitCount") + 1);
  }

  return v21;
}

- (id)_fetchEdgeInfosToSmallNonMembersInPotentialAssetIDs:(id)a3 error:(id *)a4
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSManagedObjectContext *)self->_context pl_graphCache];
  id v8 = [v7 objectIDForLabelWithCode:1200 inContext:self->_context];
  id v9 = +[PLGraphEdge fetchRequest];
  [v9 setResultType:2];
  v39[0] = @"sourceAsset";
  v39[1] = @"objectID";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  [v9 setPropertiesToFetch:v10];

  if (!v8)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F8C500];
    uint64_t v37 = *MEMORY[0x1E4F28228];
    long long v38 = @"runAssetContainment: error fetching small face label";
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    id v21 = [v19 errorWithDomain:v20 code:41003 userInfo:v18];
    id v12 = v21;
    if (a4)
    {
      id v12 = v21;
      id v22 = 0;
      *a4 = v12;
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K CONTAINS %@) AND NOT (%K in %@) AND ANY %K in %@", @"labels", v8, @"targetPerson", self->_members, @"sourceAsset", v6];
  [v9 setPredicate:v11];

  id v12 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  if ([v12 isCancelled])
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F8C500];
    uint64_t v33 = *MEMORY[0x1E4F28228];
    uint64_t v34 = @"User cancelled progress before fetching edges to small nonmembers";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    uint64_t v16 = [v13 errorWithDomain:v14 code:3072 userInfo:v15];
    uint64_t v17 = v16;
    if (a4) {
      *a4 = v16;
    }

    id v18 = 0;
LABEL_8:
    id v22 = 0;
    goto LABEL_14;
  }
  context = self->_context;
  id v32 = 0;
  id v22 = [(NSManagedObjectContext *)context executeFetchRequest:v9 error:&v32];
  id v18 = v32;
  if (!v22)
  {
    uint64_t v24 = [NSString stringWithFormat:@"runAssetContainment: error fetching edges with small non-member persons: %@", v18];
    id v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F8C500];
    uint64_t v35 = *MEMORY[0x1E4F28228];
    uint64_t v36 = v24;
    id v31 = (void *)v24;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    uint64_t v27 = [v30 errorWithDomain:v25 code:41003 userInfo:v26];
    v28 = v27;
    if (a4) {
      *a4 = v27;
    }
  }
  objc_msgSend(v12, "setCompletedUnitCount:", objc_msgSend(v12, "completedUnitCount") + 1);
LABEL_14:

  return v22;
}

- (id)_personIDsByAssetIDFromAssetPersonEdgeDictionaries:(id)a3 potentialAssetIDs:(id)a4 error:(id *)a5
{
  id v30 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  if ([v6 count])
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F28F90], "progressWithTotalUnitCount:", objc_msgSend(v6, "count"));
  }
  else
  {
    id v9 = 0;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v6;
  uint64_t v32 = [v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v32)
  {
    uint64_t v11 = *(void *)v35;
    uint64_t v31 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v10);
        }
        id v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v9, "isCancelled", v30))
        {
          uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v25 = *MEMORY[0x1E4F8C500];
          uint64_t v38 = *MEMORY[0x1E4F28568];
          long long v39 = @"User cancelled processing for personIDs by assetIDs";
          uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          uint64_t v27 = [v24 errorWithDomain:v25 code:3072 userInfo:v26];
          v28 = v27;
          if (v30) {
            *id v30 = v27;
          }

          id v23 = 0;
          goto LABEL_21;
        }
        context = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v14 = [v13 objectForKeyedSubscript:@"sourceAsset"];
        uint64_t v15 = [v13 objectForKeyedSubscript:@"targetPerson"];
        if ([v7 containsObject:v14])
        {
          uint64_t v16 = [v8 objectForKeyedSubscript:v14];
          if (v16)
          {
            [v8 objectForKeyedSubscript:v14];
            uint64_t v17 = v9;
            id v18 = v10;
            uint64_t v19 = v8;
            v21 = id v20 = v7;
            id v22 = (void *)[v21 mutableCopy];

            id v7 = v20;
            id v8 = v19;
            id v10 = v18;
            id v9 = v17;
            uint64_t v11 = v31;
          }
          else
          {
            id v22 = [MEMORY[0x1E4F1CA80] set];
          }

          [v22 addObject:v15];
          [v8 setObject:v22 forKeyedSubscript:v14];
        }
        objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v9, "completedUnitCount") + 1);
      }
      uint64_t v32 = [v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }

  id v23 = v8;
LABEL_21:

  return v23;
}

- (id)_assetIDsWithLargeMemberFacesFromAssetPersonEdgeDictionaries:(id)a3 containmentProgress:(id)a4 error:(id *)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = self->_context;
  uint64_t v11 = [(NSManagedObjectContext *)v10 pl_graphCache];
  id v12 = [v11 labelWithCode:1200 inContext:v10];
  id v13 = [v11 labelWithCode:1201 inContext:v10];
  v47 = [MEMORY[0x1E4F1CA80] set];
  v44 = [MEMORY[0x1E4F1CA80] set];
  if (v12) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F8C500];
    uint64_t v52 = *MEMORY[0x1E4F28228];
    v53 = @"_assetIDsWithLargeMemberFacesFromAssetPersonEdgeDictionaries: error fetching small/ large face label";
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    id v18 = [v15 errorWithDomain:v16 code:41003 userInfo:v17];
    uint64_t v19 = v18;
    if (a5) {
      *a5 = v18;
    }

    id v20 = 0;
  }
  else
  {
    uint64_t v43 = v8;
    id v21 = [(PLSocialGroupAssetContainment *)self _edgeIDSetFromAssetPersonEdgeDictionaries:v8];
    id v22 = [(PLSocialGroupAssetContainment *)self _fetchEdgeIDsWithLabel:v12 inEdgeIDSet:v21 containmentProgress:v9 error:a5];
    id v42 = v9;
    id v23 = [(PLSocialGroupAssetContainment *)self _fetchEdgeIDsWithLabel:v13 inEdgeIDSet:v21 containmentProgress:v9 error:a5];
    uint64_t v24 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v25 = [(NSSet *)self->_members valueForKey:@"objectID"];
    uint64_t v26 = [v24 setWithSet:v25];

    if (v23 && v22)
    {
      v45 = v22;
      long long v37 = v21;
      uint64_t v38 = v13;
      long long v39 = v12;
      long long v40 = v11;
      uint64_t v41 = v10;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      obuint64_t j = v43;
      uint64_t v27 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v49;
        do
        {
          uint64_t v30 = 0;
          do
          {
            if (*(void *)v49 != v29) {
              objc_enumerationMutation(obj);
            }
            uint64_t v31 = *(void **)(*((void *)&v48 + 1) + 8 * v30);
            uint64_t v32 = (void *)MEMORY[0x19F38D3B0](v27);
            uint64_t v33 = objc_msgSend(v31, "objectForKeyedSubscript:", @"targetPerson", v37);
            long long v34 = [v31 objectForKeyedSubscript:@"sourceAsset"];
            long long v35 = [v31 objectForKeyedSubscript:@"objectID"];
            if ([v26 containsObject:v33]
              && (([v45 containsObject:v35] & 1) != 0
               || ([v23 containsObject:v35] & 1) == 0))
            {
              [v47 addObject:v34];
              [v44 removeObject:v34];
            }
            else if ([v26 containsObject:v33] {
                   && [v23 containsObject:v35]
            }
                   && ([v47 containsObject:v34] & 1) == 0)
            {
              [v44 addObject:v34];
            }

            ++v30;
          }
          while (v28 != v30);
          uint64_t v27 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
          uint64_t v28 = v27;
        }
        while (v27);
      }

      id v20 = v44;
      id v9 = v42;
      id v8 = v43;
      uint64_t v11 = v40;
      id v10 = v41;
      id v13 = v38;
      id v12 = v39;
    }
    else
    {

      id v20 = 0;
      id v9 = v42;
      id v8 = v43;
    }
  }

  return v20;
}

- (id)_edgeIDSetFromAssetPersonEdgeDictionaries:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", @"objectID", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_fetchEdgeIDsWithLabel:(id)a3 inEdgeIDSet:(id)a4 containmentProgress:(id)a5 error:(id *)a6
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  long long v13 = +[PLGraphEdge fetchRequest];
  [v13 setResultType:1];
  long long v14 = (void *)MEMORY[0x1E4F28BA0];
  long long v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ IN %K", v12, @"labels"];

  v32[0] = v15;
  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v11];

  v32[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
  id v18 = [v14 andPredicateWithSubpredicates:v17];
  [v13 setPredicate:v18];

  if ([v10 isCancelled])
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F8C500];
    uint64_t v30 = *MEMORY[0x1E4F28228];
    uint64_t v31 = @"User cancelled progress before fetching edgeIDs with label";
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v22 = [v19 errorWithDomain:v20 code:3072 userInfo:v21];
    id v23 = v22;
    if (a6) {
      *a6 = v22;
    }

    uint64_t v24 = 0;
    uint64_t v25 = 0;
  }
  else
  {
    context = self->_context;
    id v29 = 0;
    id v21 = [(NSManagedObjectContext *)context executeFetchRequest:v13 error:&v29];
    id v27 = v29;
    uint64_t v25 = v27;
    if (!v21 && a6) {
      *a6 = v27;
    }
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
    uint64_t v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];
  }

  return v24;
}

- (id)_assetPersonEdgeDictionaries:(id *)a3 forAssetIDs:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(NSSet *)self->_members count] > 1)
  {
    id v9 = +[PLGraphEdge fetchRequest];
    long long v13 = [MEMORY[0x1E4F1CA48] array];
    members = self->_members;
    if (v6) {
      [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@ AND noindex:(%K) IN %@", @"sourceAsset", v6, @"targetPerson", members];
    }
    else {
    long long v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != nil AND %K IN %@", @"sourceAsset", @"targetPerson", members, v32];
    }
    [v13 addObject:v15];

    uint64_t v16 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];
    [v9 setPredicate:v16];

    [v9 setResultType:2];
    v39[0] = @"sourceAsset";
    v39[1] = @"targetPerson";
    v39[2] = @"objectID";
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
    [v9 setPropertiesToFetch:v17];

    id v18 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    if ([v18 isCancelled])
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F8C500];
      uint64_t v35 = *MEMORY[0x1E4F28228];
      long long v36 = @"User cancelled progress before fetching asset-person edges";
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      id v22 = [v19 errorWithDomain:v20 code:3072 userInfo:v21];
      id v23 = v22;
      if (a3) {
        *a3 = v22;
      }

      id v11 = 0;
      id v12 = 0;
    }
    else
    {
      context = self->_context;
      id v34 = 0;
      id v12 = [(NSManagedObjectContext *)context executeFetchRequest:v9 error:&v34];
      id v11 = v34;
      if (!v12)
      {
        uint64_t v25 = [NSString stringWithFormat:@"runAssetContainment: error fetching asset-person edges: %@", v11];
        uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v27 = *MEMORY[0x1E4F8C500];
        uint64_t v37 = *MEMORY[0x1E4F28228];
        uint64_t v38 = v25;
        uint64_t v33 = (void *)v25;
        uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v29 = [v26 errorWithDomain:v27 code:41003 userInfo:v28];
        uint64_t v30 = v29;
        if (a3) {
          *a3 = v29;
        }
      }
      objc_msgSend(v18, "setCompletedUnitCount:", objc_msgSend(v18, "completedUnitCount") + 1);
    }
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F8C500];
    uint64_t v40 = *MEMORY[0x1E4F28228];
    v41[0] = @"_assetPersonEdgeDictionaries: invalid member size";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    id v10 = [v7 errorWithDomain:v8 code:41003 userInfo:v9];
    id v11 = v10;
    if (a3)
    {
      id v11 = v10;
      id v12 = 0;
      *a3 = v11;
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

- (BOOL)_foundPersonIDsPassingContainmentRequirements:(id)a3
{
  members = self->_members;
  id v5 = a3;
  id v6 = [(NSSet *)members valueForKey:@"objectID"];
  uint64_t v7 = (void *)[v6 mutableCopy];

  [v7 intersectSet:v5];
  if ([(NSSet *)self->_members count])
  {
    unint64_t v8 = [v7 count];
    BOOL v9 = v8 >= [(NSSet *)self->_members count];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (PLSocialGroupAssetContainment)initWithSocialGroup:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLSocialGroupAssetContainment;
  id v6 = [(PLSocialGroupAssetContainment *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_socialGroup, a3);
    unint64_t v8 = [v5 sourceNode];
    uint64_t v9 = [v8 managedObjectContext];
    context = v7->_context;
    v7->_context = (NSManagedObjectContext *)v9;

    uint64_t v11 = [v5 members];
    members = v7->_members;
    v7->_members = (NSSet *)v11;

    long long v13 = v7;
  }

  return v7;
}

- (PLSocialGroupAssetContainment)initWithPersons:(id)a3 inContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLSocialGroupAssetContainment;
  uint64_t v9 = [(PLSocialGroupAssetContainment *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a4);
    objc_storeStrong((id *)&v10->_members, a3);
    uint64_t v11 = v10;
  }

  return v10;
}

+ (BOOL)updateAndSaveAssetPersonEdgesForAssetsWithIDs:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PLSocialGroupAssetContainment.m", 698, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 1;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__26462;
  uint64_t v30 = __Block_byref_object_dispose__26463;
  id v31 = 0;
  uint64_t v11 = [a1 _batchAssetIDs:v9];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __95__PLSocialGroupAssetContainment_updateAndSaveAssetPersonEdgesForAssetsWithIDs_inContext_error___block_invoke;
  v20[3] = &unk_1E586C338;
  id v12 = v11;
  id v21 = v12;
  id v25 = a1;
  id v13 = v10;
  id v22 = v13;
  id v23 = &v26;
  uint64_t v24 = &v32;
  objc_msgSend(v13, "pl_performBlockAndWait:", v20);
  int v14 = *((unsigned __int8 *)v33 + 24);
  id v15 = (id)v27[5];
  uint64_t v16 = v15;
  if (!v14 && a5) {
    *a5 = v15;
  }

  char v17 = *((unsigned char *)v33 + 24);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v17;
}

void __95__PLSocialGroupAssetContainment_updateAndSaveAssetPersonEdgesForAssetsWithIDs_inContext_error___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v8 = (void *)MEMORY[0x19F38D3B0]();
        id v9 = *(void **)(a1 + 64);
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
        obuint64_t j = *(id *)(v11 + 40);
        char v12 = [v9 _updateAssetPersonEdgesForAssetIDsInBatch:v7 inContext:v10 error:&obj];
        objc_storeStrong((id *)(v11 + 40), obj);
        id v13 = *(void **)(a1 + 40);
        id v17 = 0;
        LOBYTE(v11) = [v13 save:&v17];
        id v14 = v17;
        id v15 = v14;
        if ((v11 & 1) == 0)
        {
          uint64_t v16 = PLBackendGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v24 = v15;
            _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Error saving asset-person edges: %@", buf, 0xCu);
          }

LABEL_14:
          *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;

          goto LABEL_15;
        }
        if ((v12 & 1) == 0) {
          goto LABEL_14;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v25 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

+ (id)_batchAssetIDs:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:200];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __48__PLSocialGroupAssetContainment__batchAssetIDs___block_invoke;
  v12[3] = &unk_1E5867AA0;
  id v13 = v4;
  id v14 = v3;
  id v6 = v5;
  id v15 = v6;
  id v7 = v3;
  id v8 = v4;
  [v7 enumerateObjectsUsingBlock:v12];
  id v9 = v15;
  id v10 = v6;

  return v10;
}

uint64_t __48__PLSocialGroupAssetContainment__batchAssetIDs___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) addObject:a2];
  uint64_t v5 = [*(id *)(a1 + 40) count];
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result == 200 || v5 - 1 == a3)
  {
    id v8 = *(void **)(a1 + 48);
    id v9 = (void *)[*(id *)(a1 + 32) copy];
    [v8 addObject:v9];

    id v10 = *(void **)(a1 + 32);
    return [v10 removeAllObjects];
  }
  return result;
}

+ (BOOL)_updateAssetPersonEdgesForAssetIDsInBatch:(id)a3 inContext:(id)a4 error:(id *)a5
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v30 = v8;
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"PLSocialGroupAssetContainment.m", 601, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

    id v8 = v30;
    id v9 = 0;
  }
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2020000000;
  char v60 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__26462;
  uint64_t v55 = __Block_byref_object_dispose__26463;
  id v56 = 0;
  obuint64_t j = 0;
  id v32 = a1;
  char v35 = v8;
  long long v36 = v9;
  uint64_t v37 = [a1 _generateFaceSizesByPersonIDByAssetIDForAssetIDs:v8 inContext:v9 error:&obj];
  objc_storeStrong(&v56, obj);
  if (v37)
  {
    uint64_t v38 = +[PLGraphEdge fetchRequest];
    id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@ AND %K != nil", @"sourceAsset", v8, @"targetPerson"];
    [v38 setPredicate:v10];

    [v38 setResultType:0];
    [v38 setReturnsObjectsAsFaults:0];
    uint64_t v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sourceAsset" ascending:1];
    v62[0] = v11;
    char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
    [v38 setSortDescriptors:v12];

    id v13 = (id *)(v52 + 5);
    id v49 = (id)v52[5];
    uint64_t v34 = [v36 executeFetchRequest:v38 error:&v49];
    objc_storeStrong(v13, v49);
    if (v34)
    {
      id v14 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v15 = v34;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v61 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v46 != v17) {
              objc_enumerationMutation(v15);
            }
            long long v19 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            long long v20 = (void *)MEMORY[0x19F38D3B0]();
            long long v21 = [v19 objectIDsForRelationshipNamed:@"sourceAsset"];
            long long v22 = [v21 firstObject];

            if (v22)
            {
              id v23 = [v14 objectForKeyedSubscript:v22];
              if (!v23)
              {
                id v23 = [MEMORY[0x1E4F1CA80] set];
                [v14 setObject:v23 forKeyedSubscript:v22];
              }
              [v23 addObject:v19];
            }
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v61 count:16];
        }
        while (v16);
      }

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __91__PLSocialGroupAssetContainment__updateAssetPersonEdgesForAssetIDsInBatch_inContext_error___block_invoke;
      void v39[3] = &unk_1E5867A78;
      id v42 = &v57;
      id v44 = v32;
      id v24 = v14;
      id v40 = v24;
      id v41 = v36;
      uint64_t v43 = &v51;
      [v37 enumerateKeysAndObjectsUsingBlock:v39];
    }
  }
  int v25 = *((unsigned __int8 *)v58 + 24);
  id v26 = (id)v52[5];
  uint64_t v27 = v26;
  if (!v25 && a5) {
    *a5 = v26;
  }

  BOOL v28 = *((unsigned char *)v58 + 24) != 0;
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  return v28;
}

void __91__PLSocialGroupAssetContainment__updateAssetPersonEdgesForAssetIDsInBatch_inContext_error___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v5 = (void *)a1[8];
  id v6 = (void *)a1[4];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 objectForKeyedSubscript:v8];
  uint64_t v10 = a1[5];
  uint64_t v11 = *(void *)(a1[7] + 8);
  obuint64_t j = *(id *)(v11 + 40);
  LOBYTE(v5) = [v5 _updateAssetPersonEdgesForAssetWithID:v8 usingPersonFaceSizes:v7 existingEdges:v9 inContext:v10 error:&obj];

  objc_storeStrong((id *)(v11 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v5;
}

+ (id)_generateFaceSizesByPersonIDByAssetIDForAssetIDs:(id)a3 inContext:(id)a4 error:(id *)a5
{
  v78[6] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2, a1, @"PLSocialGroupAssetContainment.m", 527, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  uint64_t v10 = [v8 copy];
  uint64_t v11 = +[PLDetectedFace fetchRequest];
  [v11 setResultType:2];
  v78[0] = @"assetForFace";
  v78[1] = @"personForFace";
  v78[2] = @"size";
  v78[3] = @"bodyWidth";
  v78[4] = @"bodyHeight";
  v78[5] = @"objectID";
  char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:6];
  [v11 setPropertiesToFetch:v12];

  id v13 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v59 = (void *)v10;
  id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"assetForFace", v10];
  v77[0] = v14;
  id v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = YES", @"assetVisible");
  v77[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:2];
  uint64_t v17 = [v13 andPredicateWithSubpredicates:v16];
  [v11 setPredicate:v17];

  char v60 = v11;
  [v11 setFetchBatchSize:100];
  id v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  obuint64_t j = v8;
  uint64_t v19 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v72 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v71 + 1) + 8 * i);
        id v24 = [MEMORY[0x1E4F1CA60] dictionary];
        [v18 setObject:v24 forKeyedSubscript:v23];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
    }
    while (v20);
  }

  id v70 = 0;
  int v25 = [v9 executeFetchRequest:v60 error:&v70];
  id v26 = v70;
  uint64_t v27 = v26;
  if (v25)
  {
    id v57 = v26;
    id v58 = v9;
    SEL v55 = a2;
    id v56 = v25;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v64 = v25;
    uint64_t v28 = [v64 countByEnumeratingWithState:&v66 objects:v75 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v67;
      uint64_t v61 = *(void *)v67;
      do
      {
        uint64_t v31 = 0;
        uint64_t v63 = v29;
        do
        {
          if (*(void *)v67 != v30) {
            objc_enumerationMutation(v64);
          }
          id v32 = *(void **)(*((void *)&v66 + 1) + 8 * v31);
          uint64_t v33 = (void *)MEMORY[0x19F38D3B0]();
          uint64_t v34 = [v32 objectForKeyedSubscript:@"assetForFace"];
          uint64_t v35 = [v32 objectForKeyedSubscript:@"personForFace"];
          long long v36 = (void *)v35;
          if (v34) {
            BOOL v37 = v35 == 0;
          }
          else {
            BOOL v37 = 1;
          }
          if (!v37)
          {
            uint64_t v38 = [v18 objectForKeyedSubscript:v34];
            if (!v38)
            {
              uint64_t v51 = [MEMORY[0x1E4F28B00] currentHandler];
              [v51 handleFailureInMethod:v55 object:a1 file:@"PLSocialGroupAssetContainment.m" lineNumber:578 description:@"expected existing collection"];
            }
            long long v39 = [v32 objectForKeyedSubscript:@"bodyHeight"];
            [v39 doubleValue];
            double v41 = v40;
            id v42 = [v32 objectForKeyedSubscript:@"bodyWidth"];
            [v42 doubleValue];
            double v44 = v43;
            long long v45 = [v32 objectForKeyedSubscript:@"size"];
            [v45 doubleValue];
            uint64_t v47 = [a1 _detectedFaceSizeFromBodyHeight:v41 bodyWidth:v44 size:v46];

            long long v48 = [v38 objectForKeyedSubscript:v36];
            id v49 = v48;
            if (!v48 || (int)v47 > (int)[v48 integerValue])
            {
              long long v50 = [NSNumber numberWithInt:v47];
              [v38 setObject:v50 forKeyedSubscript:v36];
            }
            uint64_t v29 = v63;
            uint64_t v30 = v61;
          }

          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = [v64 countByEnumeratingWithState:&v66 objects:v75 count:16];
      }
      while (v29);
    }

    id v52 = v18;
    uint64_t v27 = v57;
    id v9 = v58;
    int v25 = v56;
  }
  else
  {
    id v52 = 0;
    if (a5) {
      *a5 = v26;
    }
  }

  return v52;
}

+ (BOOL)_updateAssetPersonEdgesForAssetWithID:(id)a3 usingPersonFaceSizes:(id)a4 existingEdges:(id)a5 inContext:(id)a6 error:(id *)a7
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v15)
  {
    double v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, a1, @"PLSocialGroupAssetContainment.m", 480, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  uint64_t v16 = objc_msgSend(v15, "pl_graphCache");
  uint64_t v17 = [v16 labelWithCode:1200 inContext:v15];
  double v46 = v16;
  uint64_t v18 = [v16 labelWithCode:1201 inContext:v15];
  uint64_t v19 = (void *)v18;
  if (v17) {
    BOOL v20 = v18 == 0;
  }
  else {
    BOOL v20 = 1;
  }
  char v21 = !v20;
  BOOL v42 = v21;
  if (v20)
  {
    id v22 = v12;
    id v23 = a1;
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F8C500];
    uint64_t v61 = *MEMORY[0x1E4F28228];
    v62[0] = @"_updateAssetPersonEdgesForAssetWithID: error getting small/ large face label";
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    uint64_t v27 = [v24 errorWithDomain:v25 code:41003 userInfo:v26];
    uint64_t v28 = v27;
    if (a7) {
      *a7 = v27;
    }

    a1 = v23;
    id v12 = v22;
  }
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __122__PLSocialGroupAssetContainment__updateAssetPersonEdgesForAssetWithID_usingPersonFaceSizes_existingEdges_inContext_error___block_invoke;
  v53[3] = &unk_1E5867A50;
  id v45 = v17;
  id v54 = v45;
  id v43 = v19;
  id v55 = v43;
  id v29 = v14;
  id v56 = v29;
  id v48 = v15;
  id v57 = v48;
  id v44 = v12;
  id v58 = v44;
  id v59 = a1;
  [v13 enumerateKeysAndObjectsUsingBlock:v53];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v30 = v29;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v50 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        long long v36 = (void *)MEMORY[0x19F38D3B0]();
        BOOL v37 = [v35 objectIDsForRelationshipNamed:@"targetPerson"];
        uint64_t v38 = [v37 firstObject];

        long long v39 = [v13 objectForKeyedSubscript:v38];

        if (!v39) {
          [v48 deleteObject:v35];
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v32);
  }

  return v42;
}

void __122__PLSocialGroupAssetContainment__updateAssetPersonEdgesForAssetWithID_usingPersonFaceSizes_existingEdges_inContext_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![v6 integerValue])
  {
    id v7 = (id *)(a1 + 32);
    goto LABEL_5;
  }
  if ([v6 integerValue] == 2)
  {
    id v7 = (id *)(a1 + 40);
LABEL_5:
    id v8 = *v7;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:
  id v9 = *(void **)(a1 + 48);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __122__PLSocialGroupAssetContainment__updateAssetPersonEdgesForAssetWithID_usingPersonFaceSizes_existingEdges_inContext_error___block_invoke_2;
  v14[3] = &unk_1E5867A28;
  id v10 = v5;
  id v15 = v10;
  uint64_t v11 = objc_msgSend(v9, "_pl_firstObjectPassingTest:", v14);
  if (!v11)
  {
    uint64_t v11 = +[PLManagedObject insertInManagedObjectContext:*(void *)(a1 + 56)];
    id v12 = [*(id *)(a1 + 56) objectWithID:*(void *)(a1 + 64)];
    [v11 setSourceAsset:v12];

    id v13 = [*(id *)(a1 + 56) objectWithID:v10];
    [v11 setTargetPerson:v13];
  }
  [*(id *)(a1 + 72) _updateEdgeLabelsIfNeededForEdge:v11 expectedLabel:v8];
}

uint64_t __122__PLSocialGroupAssetContainment__updateAssetPersonEdgesForAssetWithID_usingPersonFaceSizes_existingEdges_inContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 objectIDsForRelationshipNamed:@"targetPerson"];
  uint64_t v4 = [v3 firstObject];

  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];
  return v5;
}

+ (void)_updateEdgeLabelsIfNeededForEdge:(id)a3 expectedLabel:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  if (v5)
  {
    if ([v10 hasLabel:v5]) {
      goto LABEL_7;
    }
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
  }
  else
  {
    id v7 = [v10 labels];
    uint64_t v8 = [v7 count];

    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v9 = (void *)v6;
  [v10 setLabels:v6];

LABEL_7:
}

+ (int)_detectedFaceSizeFromBodyHeight:(double)a3 bodyWidth:(double)a4 size:(double)a5
{
  if (a5 == 0.0)
  {
    double v6 = a3 * a4;
    +[PLSocialGroupAssetContainment assetContainmentSmallTorsoThreshold];
    if (v6 < a3) {
      return 0;
    }
  }
  if (a5 <= 0.0) {
    return 1;
  }
  +[PLSocialGroupAssetContainment assetContainmentSmallFaceThreshold];
  if (v7 > a5) {
    return 0;
  }
  +[PLSocialGroupAssetContainment assetContainmentLargeFaceThreshold];
  if (v9 >= a5) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (double)assetContainmentMinPeopleInMomentRatio
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"PLAssetContainmentMinPeopleInMomentRatio"];

  if (v3)
  {
    [v2 doubleForKey:@"PLAssetContainmentMinPeopleInMomentRatio"];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.0;
  }

  return v5;
}

+ (void)setAssetContainmentSmallTorsoThreshold:(double)a3
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setDouble:@"PLAssetContainmentSmallTorsoThreshold" forKey:a3];
}

+ (double)assetContainmentSmallTorsoThreshold
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 floatForKey:@"PLAssetContainmentSmallTorsoThreshold"];
  float v4 = v3;
  double v5 = v3;

  double result = 0.008;
  if (v4 != 0.0) {
    return v5;
  }
  return result;
}

+ (void)setAssetContainmentLargeFaceThreshold:(double)a3
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setDouble:@"PLAssetContainmentLargeFaceThreshold" forKey:a3];
}

+ (double)assetContainmentLargeFaceThreshold
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 floatForKey:@"PLAssetContainmentLargeFaceThreshold"];
  float v4 = v3;
  double v5 = v3;

  double result = 0.07;
  if (v4 != 0.0) {
    return v5;
  }
  return result;
}

+ (void)setAssetContainmentSmallFaceThreshold:(double)a3
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setDouble:@"PLAssetContainmentSmallFaceThreshold" forKey:a3];
}

+ (double)assetContainmentSmallFaceThreshold
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 floatForKey:@"PLAssetContainmentSmallFaceThreshold"];
  float v4 = v3;
  double v5 = v3;

  double result = 0.02;
  if (v4 != 0.0) {
    return v5;
  }
  return result;
}

@end