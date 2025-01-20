@interface PNPersonClusterManager
+ (id)assetSortDescriptors;
+ (id)faceGroupSortDescriptors;
+ (id)faceSortDescriptors;
+ (id)momentSortDescriptors;
+ (id)nodeSortDescriptors;
+ (id)peopleSortDescriptors;
+ (id)personProcessingSortDescriptors;
- (BOOL)pn_performChangesAndWait:(id)a3 error:(id *)a4;
- (NSMutableDictionary)personClusters;
- (NSSet)assetsToIgnore;
- (PNPersonClusterManager)initWithPhotoLibrary:(id)a3;
- (PNPersonClusterManager)initWithPhotoLibrary:(id)a3 detectionType:(signed __int16)a4 promoterDelegate:(id)a5;
- (PNPhotoLibraryProtocol)photoLibrary;
- (PNVisionHelper)visionHelper;
- (float)_adjustDistanceFactorForPerson:(id)a3 andPerson:(id)a4 forAgeType:(unsigned __int16)a5 andAgeType:(unsigned __int16)a6;
- (float)_minimiumDistanceRequiredForCommonAssetDistanceForAgeType:(unsigned __int16)a3;
- (float)animalprintBasedDistanceBetweenPetFaces:(id)a3 andPetFaces:(id)a4;
- (float)distanceBetweenHuman:(id)a3 andHuman:(id)a4 useCommonMoments:(BOOL)a5 minAgeType:(unsigned __int16 *)a6 updateBlock:(id)a7 error:(id *)a8;
- (float)distanceBetweenPerson:(id)a3 andPerson:(id)a4 useCommonMoments:(BOOL)a5 minAgeType:(unsigned __int16 *)a6 updateBlock:(id)a7 error:(id *)a8;
- (float)distanceBetweenPet:(id)a3 andPet:(id)a4 useCommonMoments:(BOOL)a5;
- (float)distanceBetweenPetFaces:(id)a3 andPetFaces:(id)a4;
- (float)distanceWithOverlapCheckBetweenPerson:(id)a3 andPerson:(id)a4 useCommonMoments:(BOOL)a5 minAgeType:(unsigned __int16 *)a6 updateBlock:(id)a7 error:(id *)a8;
- (float)mergeConfidenceBetweenPersonLocalIdentifier:(id)a3 andCandidateLocalIdentifiers:(id)a4;
- (float)momentBasedDistanceBetweenPet:(id)a3 andPet:(id)a4;
- (float)pn_faceProcessingProgress;
- (id)_mapPersonClustersToFaceGroups:(id)a3;
- (id)_mapPersonClustersToPersons:(id)a3;
- (id)_representativeFaceObservationForPerson:(id)a3 ageType:(unsigned __int16 *)a4 inAssetCollections:(id)a5;
- (id)pn_fetchAssetsForFaceGroup:(id)a3;
- (id)pn_fetchAssetsForFaceLocalIdentifiers:(id)a3;
- (id)pn_fetchAssetsForPerson:(id)a3;
- (id)pn_fetchAssetsInMoment:(id)a3;
- (id)pn_fetchAssetsWithLocalIdentifiers:(id)a3;
- (id)pn_fetchCandidatePersonsForPerson:(id)a3;
- (id)pn_fetchFaceGroups;
- (id)pn_fetchFaceGroupsForPerson:(id)a3;
- (id)pn_fetchFacesForFaceGroup:(id)a3;
- (id)pn_fetchFacesForPerson:(id)a3;
- (id)pn_fetchFacesForPerson:(id)a3 inMoment:(id)a4;
- (id)pn_fetchFacesForPersonLocalIdentifiers:(id)a3 inMoment:(id)a4;
- (id)pn_fetchFacesGroupedByAssetLocalIdentifierForAssets:(id)a3;
- (id)pn_fetchFacesWithLocalIdentifiers:(id)a3;
- (id)pn_fetchInvalidAssetIdentifiersForCommonComparison;
- (id)pn_fetchInvalidCandidatePersonsForPerson:(id)a3;
- (id)pn_fetchMoments;
- (id)pn_fetchMomentsForAssetsWithLocalIdentifiers:(id)a3;
- (id)pn_fetchMomentsForPerson:(id)a3;
- (id)pn_fetchMomentsWithLocalIdentifiers:(id)a3;
- (id)pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets:(id)a3;
- (id)pn_fetchPersonsInMoment:(id)a3;
- (id)pn_fetchPersonsWithLocalIdentifiers:(id)a3;
- (id)pn_fetchPersonsWithType:(unint64_t)a3;
- (id)pn_lastAssetDate;
- (id)pn_persistentStorageDirectoryURL;
- (id)representativeFaceObservationForFaces:(id)a3 ageType:(unsigned __int16 *)a4 inPerson:(id)a5;
- (id)representativeFaceObservationForPerson:(id)a3 ageType:(unsigned __int16 *)a4;
- (int64_t)assetsOverlapBetweenPerson:(id)a3 andPerson:(id)a4;
- (int64_t)assetsOverlapBetweenPersonAssetIdentifiers:(id)a3 andPersonAssetIdentifiers:(id)a4;
- (signed)detectionType;
- (unint64_t)numberOfAssetsInCommonBetweenPerson:(id)a3 andPerson:(id)a4;
- (unint64_t)numberOfAssetsInCommonBetweenPersonAssetIdentifiers:(id)a3 andPersonAssetIdentifiers:(id)a4;
- (unint64_t)numberOfMomentsInCommonBetweenPerson:(id)a3 andPerson:(id)a4;
- (unint64_t)pn_numberOfFacesWithFaceprints;
- (unsigned)minAgeTypeForFaceAgeType:(unsigned __int16)a3 andFaceAgeType:(unsigned __int16)a4;
- (void)clearCaches;
- (void)invalidateCachesForPerson:(id)a3;
- (void)mergePersons:(id)a3 withPerson:(id)a4;
- (void)setAssetsToIgnore:(id)a3;
- (void)setDetectionType:(signed __int16)a3;
- (void)setPersonClusters:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setVisionHelper:(id)a3;
- (void)updateConfidenceCacheBetweenPersonLocalIdentifier:(id)a3 andOtherPersonLocalIdentifier:(id)a4 withDistance:(double)a5;
@end

@implementation PNPersonClusterManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsToIgnore, 0);
  objc_storeStrong((id *)&self->_personClusters, 0);
  objc_storeStrong((id *)&self->_visionHelper, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_promoterDelegate, 0);
  objc_storeStrong((id *)&self->_confidencesForMergedPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_distancesInCommonMomentsForPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_distancesForPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_representativeFaceObservationForPersonIdentifier, 0);
}

- (void)setAssetsToIgnore:(id)a3
{
}

- (NSSet)assetsToIgnore
{
  return self->_assetsToIgnore;
}

- (void)setPersonClusters:(id)a3
{
}

- (NSMutableDictionary)personClusters
{
  return self->_personClusters;
}

- (void)setVisionHelper:(id)a3
{
}

- (PNVisionHelper)visionHelper
{
  return self->_visionHelper;
}

- (void)setDetectionType:(signed __int16)a3
{
  self->_detectionType = a3;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PNPhotoLibraryProtocol)photoLibrary
{
  return self->_photoLibrary;
}

- (id)pn_lastAssetDate
{
  v2 = [(PNPersonClusterManager *)self photoLibrary];
  v3 = objc_msgSend(v2, "pn_lastAssetDate");

  return v3;
}

- (float)pn_faceProcessingProgress
{
  v2 = [(PNPersonClusterManager *)self photoLibrary];
  objc_msgSend(v2, "pn_faceProcessingProgress");
  float v4 = v3;

  return v4;
}

- (id)pn_fetchInvalidAssetIdentifiersForCommonComparison
{
  v2 = [(PNPersonClusterManager *)self photoLibrary];
  float v3 = objc_msgSend(v2, "pn_fetchInvalidAssetIdentifiersForCommonComparison");

  return v3;
}

- (id)pn_fetchFaceGroupsForPerson:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  v6 = [v4 sourcePerson];

  v7 = objc_msgSend(v5, "pn_fetchFaceGroupsForPerson:", v6);

  return v7;
}

- (id)pn_fetchFaceGroups
{
  v2 = [(PNPersonClusterManager *)self photoLibrary];
  float v3 = objc_msgSend(v2, "pn_fetchFaceGroups");

  return v3;
}

- (id)pn_fetchAssetsForFaceGroup:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  v6 = objc_msgSend(v5, "pn_fetchAssetsForFaceGroup:", v4);

  return v6;
}

- (id)pn_fetchAssetsForPerson:(id)a3
{
  return (id)[a3 fetchAssets];
}

- (id)pn_fetchAssetsInMoment:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  v6 = objc_msgSend(v5, "pn_fetchAssetsInMoment:", v4);

  return v6;
}

- (id)pn_fetchAssetsWithLocalIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  v6 = objc_msgSend(v5, "pn_fetchAssetsWithLocalIdentifiers:", v4);

  return v6;
}

- (id)pn_fetchMomentsForAssetsWithLocalIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  v6 = objc_msgSend(v5, "pn_fetchMomentsForAssetsWithLocalIdentifiers:", v4);

  return v6;
}

- (id)pn_fetchMomentsForPerson:(id)a3
{
  return (id)[a3 fetchMoments];
}

- (id)pn_fetchMomentsWithLocalIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  v6 = objc_msgSend(v5, "pn_fetchMomentsWithLocalIdentifiers:", v4);

  return v6;
}

- (id)pn_fetchMoments
{
  v2 = [(PNPersonClusterManager *)self photoLibrary];
  float v3 = objc_msgSend(v2, "pn_fetchMoments");

  return v3;
}

- (id)pn_fetchAssetsForFaceLocalIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  v6 = objc_msgSend(v5, "pn_fetchAssetsForFaceLocalIdentifiers:", v4);

  return v6;
}

- (id)pn_fetchFacesGroupedByAssetLocalIdentifierForAssets:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  v6 = objc_msgSend(v5, "pn_fetchFacesGroupedByAssetLocalIdentifierForAssets:", v4);

  return v6;
}

- (id)pn_fetchFacesForFaceGroup:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  v6 = objc_msgSend(v5, "pn_fetchFacesForFaceGroup:", v4);

  return v6;
}

- (id)pn_fetchFacesForPersonLocalIdentifiers:(id)a3 inMoment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PNPersonClusterManager *)self photoLibrary];
  v9 = objc_msgSend(v8, "pn_fetchFacesForPersonLocalIdentifiers:inMoment:", v7, v6);

  return v9;
}

- (id)pn_fetchFacesForPerson:(id)a3 inMoment:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [v6 backingFaceIdentifiersByMomentIdentifiers];
    v9 = [v7 localIdentifier];
    v10 = [v8 objectForKeyedSubscript:v9];

    v11 = [(PNPersonClusterManager *)self photoLibrary];
    if (v10)
    {
      v12 = [v10 allObjects];
      objc_msgSend(v11, "pn_fetchFacesWithLocalIdentifiers:", v12);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = [v6 personLocalIdentifiers];
      v17 = objc_msgSend(v11, "pn_fetchFacesForPersonLocalIdentifiers:inMoment:", v16, v7);

      v18 = objc_opt_new();
      v33 = v17;
      v19 = [v17 fetchedObjects];
      v20 = [v6 sourceFaceGroup];
      v34 = v6;
      if (v20)
      {
        v21 = [v6 backingFaceIdentifiers];
      }
      else
      {
        v21 = 0;
      }

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v13 = v19;
      uint64_t v22 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(v13);
            }
            v26 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if (v21)
            {
              v27 = [*(id *)(*((void *)&v35 + 1) + 8 * i) localIdentifier];
              int v28 = [v21 containsObject:v27];

              if (!v28) {
                continue;
              }
            }
            v29 = [v26 localIdentifier];
            [v18 addObject:v29];
          }
          uint64_t v23 = [v13 countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v23);
      }

      id v6 = v34;
      v30 = [v34 backingFaceIdentifiersByMomentIdentifiers];
      v31 = [v7 localIdentifier];
      [v30 setObject:v18 forKeyedSubscript:v31];

      v10 = 0;
    }
  }
  else
  {
    v10 = [(PNPersonClusterManager *)self photoLibrary];
    v14 = [v6 backingFaceIdentifiers];
    v15 = [v14 allObjects];
    objc_msgSend(v10, "pn_fetchFacesWithLocalIdentifiers:", v15);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (id)pn_fetchFacesForPerson:(id)a3
{
  return (id)[a3 fetchFaces];
}

- (id)pn_fetchFacesWithLocalIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  id v6 = objc_msgSend(v5, "pn_fetchFacesWithLocalIdentifiers:", v4);

  return v6;
}

- (unint64_t)pn_numberOfFacesWithFaceprints
{
  v2 = [(PNPersonClusterManager *)self photoLibrary];
  unint64_t v3 = objc_msgSend(v2, "pn_numberOfFacesWithFaceprints");

  return v3;
}

- (id)pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  id v6 = objc_msgSend(v5, "pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets:", v4);

  id v7 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__PNPersonClusterManager_pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets___block_invoke;
  v11[3] = &unk_26544F300;
  id v8 = v7;
  id v12 = v8;
  id v13 = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v11];
  id v9 = v8;

  return v9;
}

void __80__PNPersonClusterManager_pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 40);
  id v6 = a2;
  id v7 = [v5 _mapPersonClustersToPersons:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)pn_fetchInvalidCandidatePersonsForPerson:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  id v6 = [v4 sourcePerson];

  id v7 = objc_msgSend(v5, "pn_fetchInvalidCandidatePersonsForPerson:", v6);

  id v8 = [(PNPersonClusterManager *)self _mapPersonClustersToPersons:v7];

  return v8;
}

- (id)pn_fetchCandidatePersonsForPerson:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  id v6 = [v4 sourcePerson];

  id v7 = objc_msgSend(v5, "pn_fetchCandidatePersonsForPerson:", v6);

  id v8 = [(PNPersonClusterManager *)self _mapPersonClustersToPersons:v7];

  return v8;
}

- (id)pn_fetchPersonsInMoment:(id)a3
{
  id v4 = a3;
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  id v6 = objc_msgSend(v5, "pn_fetchPersonsInMoment:", v4);

  id v7 = [(PNPersonClusterManager *)self _mapPersonClustersToPersons:v6];

  return v7;
}

- (id)pn_fetchPersonsWithType:(unint64_t)a3
{
  v5 = [(PNPersonClusterManager *)self photoLibrary];
  id v6 = v5;
  if (a3)
  {
    id v7 = objc_msgSend(v5, "pn_fetchPersonsWithType:", a3);

    [(PNPersonClusterManager *)self _mapPersonClustersToPersons:v7];
  }
  else
  {
    id v7 = objc_msgSend(v5, "pn_fetchFaceGroups");

    [(PNPersonClusterManager *)self _mapPersonClustersToFaceGroups:v7];
  id v8 = };

  return v8;
}

- (id)pn_fetchPersonsWithLocalIdentifiers:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_personClusters, "objectForKeyedSubscript:", v12, (void)v20);
        if (v13)
        {
          v14 = v5;
          v15 = v13;
        }
        else
        {
          v14 = v6;
          v15 = v12;
        }
        [v14 addObject:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    v16 = [(PNPersonClusterManager *)self photoLibrary];
    v17 = objc_msgSend(v16, "pn_fetchPersonsWithLocalIdentifiers:", v6);

    v18 = [(PNPersonClusterManager *)self _mapPersonClustersToPersons:v17];
    [v5 unionSet:v18];
  }
  return v5;
}

- (BOOL)pn_performChangesAndWait:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PNPersonClusterManager *)self photoLibrary];
  LOBYTE(a4) = objc_msgSend(v7, "pn_performChangesAndWait:error:", v6, a4);

  return (char)a4;
}

- (id)pn_persistentStorageDirectoryURL
{
  v2 = [(PNPersonClusterManager *)self photoLibrary];
  unint64_t v3 = objc_msgSend(v2, "pn_persistentStorageDirectoryURL");

  return v3;
}

- (float)momentBasedDistanceBetweenPet:(id)a3 andPet:(id)a4
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 localIdentifier];
  *(double *)&uint64_t v8 = [v6 localIdentifier];
  uint64_t v9 = [v5 backingMomentIdentifiers];
  uint64_t v10 = [v6 backingMomentIdentifiers];
  if ((unint64_t)[v9 count] >= 2 && (unint64_t)objc_msgSend(v10, "count") > 1)
  {
    id v12 = (void *)[v9 mutableCopy];
    [v12 intersectSet:v10];
    uint64_t v13 = [v12 count];
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v59 = v13;
      __int16 v60 = 2112;
      uint64_t v61 = (uint64_t)v7;
      __int16 v62 = 2112;
      uint64_t v63 = v8;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Found %lu common moments between %@ and %@", buf, 0x20u);
    }
    if (!v13)
    {
      float v11 = 1.0;
LABEL_38:

      goto LABEL_39;
    }
    if (v13 == 1)
    {
      v14 = [v5 backingAssetIdentifiers];
      v15 = [v6 backingAssetIdentifiers];
      v52 = v14;
      v16 = (void *)[v14 mutableCopy];
      [v16 intersectSet:v15];
      uint64_t v17 = [v16 count];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v59 = v17;
        __int16 v60 = 2112;
        uint64_t v61 = (uint64_t)v7;
        __int16 v62 = 2112;
        uint64_t v63 = v8;
        _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Found %lu common assets between %@ and %@", buf, 0x20u);
      }
      if (v17)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v59 = v17;
          __int16 v60 = 2048;
          uint64_t v61 = 1;
          _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] %lu > 0 common assets in %lu common moments under the minimum common moments threshold, returning a distance of 1.0", buf, 0x16u);
        }

        float v11 = 1.0;
        id v18 = v52;
        goto LABEL_37;
      }
    }
    v46 = v12;
    v47 = v10;
    v19 = [v12 allObjects];
    long long v20 = self;
    long long v21 = [(PNPersonClusterManager *)self pn_fetchMomentsWithLocalIdentifiers:v19];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v18 = v21;
    uint64_t v22 = [v18 countByEnumeratingWithState:&v54 objects:v68 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      v45 = v9;
      v48 = (void *)v8;
      v49 = v7;
      uint64_t v24 = *(void *)v55;
      float v25 = 0.0;
      float v26 = 0.0;
      uint64_t v50 = *(void *)v55;
      do
      {
        uint64_t v27 = 0;
        uint64_t v53 = v23;
        do
        {
          if (*(void *)v55 != v24) {
            objc_enumerationMutation(v18);
          }
          uint64_t v28 = *(void *)(*((void *)&v54 + 1) + 8 * v27);
          v29 = (void *)MEMORY[0x25A2E0AC0]();
          v30 = [(PNPersonClusterManager *)v20 pn_fetchFacesForPerson:v5 inMoment:v28];
          if ((unint64_t)[v30 count] >= 2)
          {
            v31 = [(PNPersonClusterManager *)v20 pn_fetchFacesForPerson:v6 inMoment:v28];
            if ((unint64_t)[v31 count] >= 2)
            {
              id v32 = v18;
              id v33 = v5;
              id v34 = v6;
              long long v35 = [v30 fetchedObjects];
              long long v36 = [v31 fetchedObjects];
              [(PNPersonClusterManager *)v20 distanceBetweenPetFaces:v35 andPetFaces:v36];
              float v38 = v37;

              float v25 = v25 + v38;
              float v26 = v26 + 1.0;
              v39 = &_os_log_internal;
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
              {
                uint64_t v40 = [v30 count];
                uint64_t v41 = [v31 count];
                *(_DWORD *)buf = 138413314;
                uint64_t v59 = (uint64_t)v49;
                __int16 v60 = 2048;
                uint64_t v61 = v40;
                __int16 v62 = 2112;
                uint64_t v63 = (uint64_t)v48;
                __int16 v64 = 2048;
                uint64_t v65 = v41;
                __int16 v66 = 2048;
                double v67 = v38;
                _os_log_impl(&dword_25934C000, v39, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Distance between %@ (%lu faces) and %@ (%lu faces) is %lf", buf, 0x34u);
              }
              id v6 = v34;
              id v5 = v33;
              id v18 = v32;
              uint64_t v24 = v50;
              long long v20 = self;
              uint64_t v23 = v53;
            }
          }
          ++v27;
        }
        while (v23 != v27);
        uint64_t v23 = [v18 countByEnumeratingWithState:&v54 objects:v68 count:16];
      }
      while (v23);

      uint64_t v8 = (uint64_t)v48;
      id v7 = v49;
      uint64_t v9 = v45;
      if (v26 != 0.0)
      {
        float v11 = v25 / v26;
        id v12 = v46;
        uint64_t v10 = v47;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v59 = (uint64_t)v49;
          __int16 v60 = 2112;
          uint64_t v61 = (uint64_t)v48;
          __int16 v62 = 2048;
          *(double *)&uint64_t v63 = v11;
          v42 = &_os_log_internal;
          v43 = "[PNPersonClusterManager] The average distance across moments between %@ and %@ is %lf";
LABEL_36:
          _os_log_impl(&dword_25934C000, v42, OS_LOG_TYPE_INFO, v43, buf, 0x20u);
          goto LABEL_37;
        }
        goto LABEL_37;
      }
    }
    else
    {
    }
    float v11 = 1.0;
    id v12 = v46;
    uint64_t v10 = v47;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v59 = (uint64_t)v7;
      __int16 v60 = 2112;
      uint64_t v61 = v8;
      __int16 v62 = 2048;
      uint64_t v63 = 2;
      v42 = &_os_log_internal;
      v43 = "[PNPersonClusterManager] No common moments between %@ and %@ where the pets both have more than %lu faces, returning...";
      goto LABEL_36;
    }
LABEL_37:

    goto LABEL_38;
  }
  float v11 = 1.0;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    uint64_t v59 = (uint64_t)v7;
    __int16 v60 = 2048;
    uint64_t v61 = [v9 count];
    __int16 v62 = 2112;
    uint64_t v63 = v8;
    __int16 v64 = 2048;
    uint64_t v65 = [v10 count];
    _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Pet %@ has %lu moments and pet %@ has %lu moments, returning a distance of 1.0 because a pet has too few moments", buf, 0x2Au);
  }
LABEL_39:

  return v11;
}

- (float)animalprintBasedDistanceBetweenPetFaces:(id)a3 andPetFaces:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v28 = v5;
  v29 = v6;
  if ([v5 count] && objc_msgSend(v6, "count"))
  {
    *(void *)buf = 0;
    float v38 = buf;
    uint64_t v39 = 0x3032000000;
    uint64_t v40 = __Block_byref_object_copy__2593;
    uint64_t v41 = __Block_byref_object_dispose__2594;
    id v42 = 0;
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __78__PNPersonClusterManager_animalprintBasedDistanceBetweenPetFaces_andPetFaces___block_invoke;
    v34[3] = &unk_26544F2B8;
    long long v36 = buf;
    id v8 = v7;
    id v35 = v8;
    [v5 enumerateObjectsUsingBlock:v34];
    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __78__PNPersonClusterManager_animalprintBasedDistanceBetweenPetFaces_andPetFaces___block_invoke_268;
    v31[3] = &unk_26544F2B8;
    id v33 = buf;
    id v10 = v9;
    id v32 = v10;
    [v6 enumerateObjectsUsingBlock:v31];
    unint64_t v11 = [v8 count];
    if (v11 >= [v10 count]) {
      id v12 = v8;
    }
    else {
      id v12 = v10;
    }
    id v13 = v12;
    unint64_t v14 = [v8 count];
    if (v14 >= [v10 count]) {
      v15 = v10;
    }
    else {
      v15 = v8;
    }
    id v16 = v15;
    if ([v16 count])
    {
      [v13 sortUsingComparator:&__block_literal_global_2596];
      [v16 sortUsingComparator:&__block_literal_global_272_2597];
      unint64_t v17 = [v16 count];
      unint64_t v18 = 0;
      float v19 = 0.0;
      while ([v13 count] > v18)
      {
        long long v20 = [v13 objectAtIndexedSubscript:v18];
        long long v21 = [v16 objectAtIndexedSubscript:v18 % v17];
        uint64_t v22 = (id *)(v38 + 40);
        id obj = (id)*((void *)v38 + 5);
        uint64_t v23 = [v20 computeDistance:v21 withDistanceFunction:0 error:&obj];
        objc_storeStrong(v22, obj);
        [v23 floatValue];
        float v25 = v24;

        float v19 = v19 + v25;
        ++v18;
      }
      float v26 = v19 / (float)(unint64_t)[v13 count];
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v43 = 134217984;
        double v44 = v26;
        _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Found an average distance of %lf for the two pets.", v43, 0xCu);
      }
    }
    else
    {
      float v26 = 1.0;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v43 = 0;
        _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[PNPersonClusterManager] Error: Couldn't extract animalprint from any pet faces for one of the pets", v43, 2u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    float v26 = 1.0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] One pet has zero faces, bailing and returning a distance of 1!", buf, 2u);
    }
  }

  return v26;
}

void __78__PNPersonClusterManager_animalprintBasedDistanceBetweenPetFaces_andPetFaces___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x263F1EDF8]);
  id v5 = [v3 faceprintData];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = (void *)[v4 initWithState:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v3 localIdentifier];
      *(_DWORD *)buf = 138412290;
      unint64_t v11 = v8;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[PNPersonClusterManager] Error: Couldn't extract animalprint from pet face %@", buf, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

void __78__PNPersonClusterManager_animalprintBasedDistanceBetweenPetFaces_andPetFaces___block_invoke_268(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x263F1EDF8]);
  id v5 = [v3 faceprintData];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = (void *)[v4 initWithState:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v3 localIdentifier];
      *(_DWORD *)buf = 138412290;
      unint64_t v11 = v8;
      _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "[PNPersonClusterManager] Error: Couldn't extract animalprint from pet face %@", buf, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

uint64_t __78__PNPersonClusterManager_animalprintBasedDistanceBetweenPetFaces_andPetFaces___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  float v7 = v6;
  [v5 confidence];
  if (v7 < v8
    || ([v4 confidence], float v10 = v9, objc_msgSend(v5, "confidence"), v10 == v11)
    && (unint64_t v12 = [v4 hash], v12 < objc_msgSend(v5, "hash")))
  {
    uint64_t v13 = -1;
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

uint64_t __78__PNPersonClusterManager_animalprintBasedDistanceBetweenPetFaces_andPetFaces___block_invoke_269(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  float v7 = v6;
  [v5 confidence];
  if (v7 < v8
    || ([v4 confidence], float v10 = v9, objc_msgSend(v5, "confidence"), v10 == v11)
    && (unint64_t v12 = [v4 hash], v12 < objc_msgSend(v5, "hash")))
  {
    uint64_t v13 = -1;
  }
  else
  {
    uint64_t v13 = 1;
  }

  return v13;
}

- (float)distanceBetweenPetFaces:(id)a3 andPetFaces:(id)a4
{
  if (self->_vuDistanceSPIEnabled)
  {
    float v6 = (objc_class *)MEMORY[0x263EFF980];
    id v7 = a4;
    id v8 = a3;
    float v9 = objc_msgSend([v6 alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
    float v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __62__PNPersonClusterManager_distanceBetweenPetFaces_andPetFaces___block_invoke;
    v22[3] = &unk_26544F290;
    id v23 = v9;
    id v11 = v9;
    [v8 enumerateObjectsUsingBlock:v22];

    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    float v19 = __62__PNPersonClusterManager_distanceBetweenPetFaces_andPetFaces___block_invoke_2;
    long long v20 = &unk_26544F290;
    id v21 = v10;
    id v12 = v10;
    [v7 enumerateObjectsUsingBlock:&v17];

    -[PNPersonPromoterDelegate similarityBetweenFacesWithVUIdentifiers:andOtherFacesWithVUIdentifiers:](self->_promoterDelegate, "similarityBetweenFacesWithVUIdentifiers:andOtherFacesWithVUIdentifiers:", v11, v12, v17, v18, v19, v20);
    float v14 = 1.0 - v13;
  }
  else
  {
    id v12 = a4;
    id v11 = a3;
    [(PNPersonClusterManager *)self animalprintBasedDistanceBetweenPetFaces:v11 andPetFaces:v12];
    float v14 = v15;
  }

  return v14;
}

void __62__PNPersonClusterManager_distanceBetweenPetFaces_andPetFaces___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "vuObservationID"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __62__PNPersonClusterManager_distanceBetweenPetFaces_andPetFaces___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a2, "vuObservationID"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (float)distanceBetweenPet:(id)a3 andPet:(id)a4 useCommonMoments:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int v10 = [v8 detectionType];
  float v11 = 1.0;
  if (v10 == [v9 detectionType])
  {
    uint64_t v12 = 16;
    if (v5) {
      uint64_t v12 = 24;
    }
    id v13 = *(id *)((char *)&self->super.isa + v12);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PNPersonClusterManager_distanceBetweenPet_andPet_useCommonMoments___block_invoke;
    aBlock[3] = &unk_26544F240;
    id v33 = v13;
    id v36 = v33;
    float v14 = (void (**)(void *, void *, void *, void *, void *))_Block_copy(aBlock);
    float v15 = [v8 localIdentifier];
    double v16 = [v9 localIdentifier];
    uint64_t v17 = [(PNPersonClusterManager *)self pn_fetchFacesForPerson:v8];
    uint64_t v18 = [(PNPersonClusterManager *)self pn_fetchFacesForPerson:v9];
    id v34 = v17;
    float v19 = [v17 fetchedObjects];
    long long v20 = [v18 fetchedObjects];
    [(PNPersonClusterManager *)self distanceBetweenPetFaces:v19 andPetFaces:v20];
    float v22 = v21;

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [v34 count];
      uint64_t v25 = [v18 count];
      *(_DWORD *)buf = 138413314;
      float v38 = v15;
      __int16 v39 = 2048;
      uint64_t v40 = v24;
      __int16 v41 = 2112;
      double v42 = v16;
      __int16 v43 = 2048;
      uint64_t v44 = v25;
      __int16 v45 = 2048;
      double v46 = v22;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] The overall distance between %@ (%lu faces) and %@ (%lu faces) is %lf", buf, 0x34u);
    }
    float v11 = v22;
    if (v5)
    {
      [(PNPersonClusterManager *)self momentBasedDistanceBetweenPet:v8 andPet:v9];
      float v27 = v26;
      BOOL v28 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
      float v11 = 1.0;
      if (v27 == 1.0)
      {
        if (v28)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Common moments distance is 1.0, setting distance to 1.0...", buf, 2u);
        }
      }
      else
      {
        if (v28)
        {
          *(_DWORD *)buf = 138412802;
          float v38 = v15;
          __int16 v39 = 2112;
          uint64_t v40 = *(void *)&v16;
          __int16 v41 = 2048;
          double v42 = v27;
          _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] The common moments distance between %@ and %@ is %lf", buf, 0x20u);
        }
        if (v22 >= v27) {
          float v11 = v27;
        }
        else {
          float v11 = v22;
        }
      }
    }
    *(float *)&double v23 = v11;
    v29 = [NSNumber numberWithFloat:v23];
    ((void (*)(void (**)(void *, void *, void *, void *, void *), void *, double, void *, void *))v14[2])(v14, v15, COERCE_DOUBLE(*(void *)&v16), v29, &unk_27076A470);

    *(float *)&double v30 = v11;
    v31 = [NSNumber numberWithFloat:v30];
    ((void (*)(void (**)(void *, void *, void *, void *, void *), double, void *, void *, void *))v14[2])(v14, COERCE_DOUBLE(*(void *)&v16), v15, v31, &unk_27076A470);
  }
  return v11;
}

void __69__PNPersonClusterManager_distanceBetweenPet_andPet_useCommonMoments___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v18[2] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = *(void **)(a1 + 32);
  id v13 = a3;
  float v14 = [v12 objectForKeyedSubscript:v9];
  v17[0] = @"distance";
  v17[1] = @"minAgeType";
  v18[0] = v10;
  v18[1] = v11;
  float v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  if (v14)
  {
    [v14 setObject:v15 forKeyedSubscript:v13];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v15 forKey:v13];

    [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v9];
    id v13 = (id)v16;
  }
}

- (id)representativeFaceObservationForFaces:(id)a3 ageType:(unsigned __int16 *)a4 inPerson:(id)a5
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v37 = a5;
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x3032000000;
  uint64_t v61 = __Block_byref_object_copy__2593;
  __int16 v62 = __Block_byref_object_dispose__2594;
  id v63 = 0;
  uint64_t v40 = objc_opt_new();
  id v36 = a4;
  __int16 v39 = objc_opt_new();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v54 objects:v69 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x25A2E0AC0]();
        float v14 = [(PNVisionHelper *)self->_visionHelper faceObservationFromFace:v12];
        if (v14)
        {
          float v15 = [v12 localIdentifier];
          [v40 setObject:v14 forKeyedSubscript:v15];
          uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v12, "ageType"));
          [v39 setObject:v16 forKeyedSubscript:v15];
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v12;
          _os_log_debug_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Error: VNFaceObservation nil for %@", buf, 0xCu);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v54 objects:v69 count:16];
    }
    while (v9);
  }

  if ([v40 count])
  {
    visionHelper = self->_visionHelper;
    uint64_t v18 = [v40 allValues];
    id v53 = 0;
    float v19 = [(PNVisionHelper *)visionHelper representativenessFromFaceObservations:v18 error:&v53];
    id v20 = v53;

    if (v20 || !v19)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v19;
        _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error while calling -[PNVisionHelper representativenessFromFaceObservations:error:]: %@, result: %@.", buf, 0x16u);
      }
      id v34 = 0;
    }
    else
    {
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      int v52 = 0;
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      __int16 v66 = __Block_byref_object_copy__2593;
      double v67 = __Block_byref_object_dispose__2594;
      id v68 = 0;
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __81__PNPersonClusterManager_representativeFaceObservationForFaces_ageType_inPerson___block_invoke;
      v46[3] = &unk_26544F268;
      id v47 = v19;
      v48 = v51;
      v49 = &v58;
      uint64_t v50 = buf;
      [v40 enumerateKeysAndObjectsUsingBlock:v46];
      if (v59[5])
      {
        if (v37)
        {
          float v21 = [v37 representativeFaceByFaceIdentifiers];
          BOOL v22 = (unint64_t)[v21 count] > 1;

          if (v22)
          {
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            double v23 = [v37 representativeFaceByFaceIdentifiers];
            uint64_t v24 = [v23 keyEnumerator];

            uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v64 count:16];
            if (v25)
            {
              uint64_t v26 = *(void *)v42;
              do
              {
                for (uint64_t j = 0; j != v25; ++j)
                {
                  if (*(void *)v42 != v26) {
                    objc_enumerationMutation(v24);
                  }
                  BOOL v28 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                  if ([v28 containsObject:*(void *)(*(void *)&buf[8] + 40)])
                  {
                    v29 = [v37 representativeFaceByFaceIdentifiers];
                    uint64_t v30 = [v29 objectForKeyedSubscript:v28];
                    v31 = (void *)v59[5];
                    v59[5] = v30;
                  }
                }
                uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v64 count:16];
              }
              while (v25);
            }
          }
        }
        id v32 = [v39 objectForKeyedSubscript:*(void *)(*(void *)&buf[8] + 40)];
        unsigned __int16 v33 = [v32 unsignedShortValue];

        if (v36) {
          *id v36 = v33;
        }
        id v34 = (id)v59[5];
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)__int16 v45 = 0;
          _os_log_error_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error: No valid face representativeness found.", v45, 2u);
        }
        id v34 = 0;
      }

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(v51, 8);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "Error: No valid face observations when calling -[PNVisionHelper faceObservationFromFace:]", buf, 2u);
    }
    id v34 = 0;
  }

  _Block_object_dispose(&v58, 8);
  return v34;
}

void __81__PNPersonClusterManager_representativeFaceObservationForFaces_ageType_inPerson___block_invoke(void *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = a3;
  id v7 = (void *)a1[4];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "faceId"));
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (v9)
  {
    [v9 floatValue];
    uint64_t v11 = *(void *)(a1[5] + 8);
    if (v10 > *(float *)(v11 + 24))
    {
      *(float *)(v11 + 24) = v10;
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
      objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
    }
  }
}

- (id)_representativeFaceObservationForPerson:(id)a3 ageType:(unsigned __int16 *)a4 inAssetCollections:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  unsigned __int16 v47 = 0;
  float v38 = v7;
  uint64_t v9 = [v7 localIdentifier];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v44;
    do
    {
      uint64_t v14 = 0;
      float v15 = v9;
      do
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = [*(id *)(*((void *)&v43 + 1) + 8 * v14) localIdentifier];
        uint64_t v9 = [v15 stringByAppendingString:v16];

        ++v14;
        float v15 = v9;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v12);
  }

  uint64_t v17 = [(NSMutableDictionary *)self->_representativeFaceObservationForPersonIdentifier objectForKeyedSubscript:v9];
  if (v17)
  {
    uint64_t v18 = v17;
    float v19 = [v17 objectForKeyedSubscript:@"distance"];
    id v20 = [v18 objectForKeyedSubscript:@"minAgeType"];
    unsigned __int16 v47 = [v20 unsignedShortValue];
  }
  else
  {
    context = (void *)MEMORY[0x25A2E0AC0]();
    float v21 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v22 = v10;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v40 != v25) {
            objc_enumerationMutation(v22);
          }
          float v27 = [(PNPersonClusterManager *)self pn_fetchFacesForPerson:v38 inMoment:*(void *)(*((void *)&v39 + 1) + 8 * i)];
          BOOL v28 = [v27 fetchedObjects];
          [v21 addObjectsFromArray:v28];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v24);
    }

    if (v22 && (unint64_t)[v21 count] > 1)
    {
      id v29 = v21;
      uint64_t v30 = self;
      id v31 = v29;
      id v32 = 0;
    }
    else
    {
      id v29 = [(PNPersonClusterManager *)self pn_fetchFacesForPerson:v38];
      uint64_t v30 = self;
      id v31 = v29;
      id v32 = v38;
    }
    uint64_t v33 = [(PNPersonClusterManager *)v30 representativeFaceObservationForFaces:v31 ageType:&v47 inPerson:v32];
    float v19 = (void *)v33;
    if (v33)
    {
      v50[1] = @"minAgeType";
      v51[0] = v33;
      v50[0] = @"distance";
      id v34 = [NSNumber numberWithUnsignedShort:v47];
      v51[1] = v34;
      uint64_t v18 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v38;
        _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PersonPromoter] Quarantine %@: VNFaceObservation nil", buf, 0xCu);
      }
      [v38 setQuarantined:1];
      uint64_t v18 = 0;
    }
    [(NSMutableDictionary *)self->_representativeFaceObservationForPersonIdentifier setObject:v18 forKeyedSubscript:v9];
  }
  if (a4) {
    *a4 = v47;
  }

  return v19;
}

- (id)representativeFaceObservationForPerson:(id)a3 ageType:(unsigned __int16 *)a4
{
  return [(PNPersonClusterManager *)self _representativeFaceObservationForPerson:a3 ageType:a4 inAssetCollections:0];
}

- (float)_adjustDistanceFactorForPerson:(id)a3 andPerson:(id)a4 forAgeType:(unsigned __int16)a5 andAgeType:(unsigned __int16)a6
{
  int v6 = a6;
  int v7 = a5;
  id v9 = a3;
  id v10 = a4;
  float v11 = 1.0;
  if (v6 | v7)
  {
    if ((v6 | v7) == 1)
    {
      uint64_t v12 = [v9 firstSeenDateWithoutOutliersForAgeType:1];
      uint64_t v13 = [v10 firstSeenDateWithoutOutliersForAgeType:1];
      [v12 timeIntervalSinceDate:v13];
      if (v14 < 0.0) {
        double v14 = -v14;
      }
      double v15 = v14 / 2629800.0;
      double v16 = 0.00800000038;
    }
    else
    {
      if ((v7 | 2) != 2 || (v6 | 2) != 2) {
        goto LABEL_15;
      }
      uint64_t v12 = [v9 firstSeenDateWithoutOutliersForAgeType:2];
      uint64_t v13 = [v10 firstSeenDateWithoutOutliersForAgeType:2];
      [v12 timeIntervalSinceDate:v13];
      if (v17 < 0.0) {
        double v17 = -v17;
      }
      double v15 = v17 / 2629800.0;
      double v16 = 0.00100000005;
    }
    float v18 = v15 * v16 + 1.0;
    if (v15 <= 12.0) {
      float v11 = 1.0;
    }
    else {
      float v11 = v18;
    }
  }
LABEL_15:

  return v11;
}

- (float)_minimiumDistanceRequiredForCommonAssetDistanceForAgeType:(unsigned __int16)a3
{
  return flt_259898350[(a3 - 1) < 2];
}

- (float)mergeConfidenceBetweenPersonLocalIdentifier:(id)a3 andCandidateLocalIdentifiers:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = [(NSMutableDictionary *)self->_confidencesForMergedPersonLocalIdentifier objectForKeyedSubscript:a3];
  if (v7)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      float v12 = -1.0;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          double v14 = objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
          double v15 = v14;
          if (v14)
          {
            double v16 = [v14 objectForKeyedSubscript:@"confidence"];
            [v16 floatValue];
            float v18 = v17;

            if (v12 < v18) {
              float v12 = v18;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
    else
    {
      float v12 = -1.0;
    }
  }
  else
  {
    float v12 = -1.0;
  }

  return v12;
}

- (float)distanceBetweenHuman:(id)a3 andHuman:(id)a4 useCommonMoments:(BOOL)a5 minAgeType:(unsigned __int16 *)a6 updateBlock:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v83 = a3;
  id v82 = a4;
  char v92 = 0;
  v81 = (void (**)(id, unsigned char *, float))a7;
  v81[2](v81, &v92, 0.2);
  float v14 = 1.0;
  if (!v92)
  {
    v75 = a6;
    uint64_t v15 = 16;
    if (v11) {
      uint64_t v15 = 24;
    }
    id v16 = *(id *)((char *)&self->super.isa + v15);
    uint64_t v17 = [v83 localIdentifier];
    double v18 = [v82 localIdentifier];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__PNPersonClusterManager_distanceBetweenHuman_andHuman_useCommonMoments_minAgeType_updateBlock_error___block_invoke;
    aBlock[3] = &unk_26544F240;
    id v19 = v16;
    id v91 = v19;
    v78 = (void (**)(void *, void *, void, void *, void *))_Block_copy(aBlock);
    id v76 = v19;
    v80 = (void *)v17;
    long long v20 = [v19 objectForKeyedSubscript:v17];
    v77 = v20;
    if (v20
      && ([v20 objectForKeyedSubscript:*(void *)&v18],
          (long long v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      long long v22 = v21;
      long long v23 = [v21 objectForKeyedSubscript:@"minAgeType"];
      unsigned __int16 v24 = [v23 unsignedShortValue];

      uint64_t v25 = [v22 objectForKeyedSubscript:@"distance"];
      [v25 floatValue];
      float v14 = v26;

      if (v75) {
        unsigned __int16 *v75 = v24;
      }

      float v27 = v76;
    }
    else
    {
      int v89 = 0;
      uint64_t v28 = [(PNPersonClusterManager *)self representativeFaceObservationForPerson:v83 ageType:(char *)&v89 + 2];
      uint64_t v29 = [(PNPersonClusterManager *)self representativeFaceObservationForPerson:v82 ageType:&v89];
      unsigned int v68 = [(PNPersonClusterManager *)self minAgeTypeForFaceAgeType:HIWORD(v89) andFaceAgeType:(unsigned __int16)v89];
      __int16 v66 = (void *)v29;
      double v67 = (void *)v28;
      [(PNVisionHelper *)self->_visionHelper distanceBetweenFaceObservation:v28 andFaceObservation:v29 error:a8];
      float v31 = v30;
      [(PNPersonClusterManager *)self _adjustDistanceFactorForPerson:v83 andPerson:v82 forAgeType:HIWORD(v89) andAgeType:(unsigned __int16)v89];
      float v33 = v32;
      if (v32 == 1.0)
      {
        float v14 = v31;
      }
      else
      {
        float v14 = v31 * v32;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          uint64_t v94 = v17;
          __int16 v95 = 2112;
          double v96 = v18;
          __int16 v97 = 2048;
          double v98 = v31;
          __int16 v99 = 2048;
          double v100 = v14;
          _os_log_impl(&dword_25934C000, &_os_log_internal, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Adjusting best distance between %@ and %@ from %.3f to %.3f", buf, 0x2Au);
        }
      }
      v81[2](v81, &v92, 0.9);
      double v79 = v18;
      if (v11)
      {
        [(PNPersonClusterManager *)self _minimiumDistanceRequiredForCommonAssetDistanceForAgeType:v68];
        if (v14 <= *(float *)&v34)
        {
          id v35 = [v83 backingMomentIdentifiers];
          id v36 = (void *)[v35 mutableCopy];

          id v37 = [v82 backingMomentIdentifiers];
          [v36 intersectSet:v37];

          if ([v36 count])
          {
            float v38 = [v36 allObjects];
            v71 = self;
            long long v39 = [(PNPersonClusterManager *)self pn_fetchMomentsWithLocalIdentifiers:v38];

            unint64_t v40 = [v39 count];
            long long v85 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            id obj = v39;
            uint64_t v74 = [obj countByEnumeratingWithState:&v85 objects:v105 count:16];
            if (v74)
            {
              uint64_t v73 = *(void *)v86;
              double v72 = (float)v40;
              float v41 = 0.0;
              long long v42 = &_os_log_internal;
              uint64_t v64 = 138413058;
              uint64_t v69 = v36;
              uint64_t v70 = a8;
              while (2)
              {
                for (uint64_t i = 0; i != v74; ++i)
                {
                  if (*(void *)v86 != v73) {
                    objc_enumerationMutation(obj);
                  }
                  long long v44 = *(void **)(*((void *)&v85 + 1) + 8 * i);
                  long long v45 = (void *)MEMORY[0x25A2E0AC0]();
                  float v46 = (v41 + 0.3) * 0.5 / v72 + 0.2;
                  v81[2](v81, &v92, v46);
                  if (v92)
                  {

                    float v14 = 1.0;
                    goto LABEL_39;
                  }
                  int v89 = 0;
                  v104 = v44;
                  unsigned __int16 v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v104 count:1];
                  v48 = [(PNPersonClusterManager *)v71 _representativeFaceObservationForPerson:v83 ageType:(char *)&v89 + 2 inAssetCollections:v47];

                  v103 = v44;
                  v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v103 count:1];
                  uint64_t v50 = [(PNPersonClusterManager *)v71 _representativeFaceObservationForPerson:v82 ageType:&v89 inAssetCollections:v49];

                  visionHelper = v71->_visionHelper;
                  id v84 = 0;
                  [(PNVisionHelper *)visionHelper distanceBetweenFaceObservation:v48 andFaceObservation:v50 error:&v84];
                  float v53 = v52;
                  id v54 = v84;
                  if (v33 == 1.0)
                  {
                    float v55 = v53;
                  }
                  else
                  {
                    float v55 = v33 * v53;
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                    {
                      long long v56 = [v44 localIdentifier];
                      *(_DWORD *)buf = 138413314;
                      uint64_t v94 = (uint64_t)v56;
                      __int16 v95 = 2112;
                      double v96 = *(double *)&v80;
                      __int16 v97 = 2112;
                      double v98 = v79;
                      __int16 v99 = 2048;
                      double v100 = v53;
                      __int16 v101 = 2048;
                      double v102 = v55;
                      _os_log_impl(&dword_25934C000, v42, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Common moment %@ between %@ and %@: adjust distance from %.3f to %.3f", buf, 0x34u);

                      double v18 = v79;
                    }
                  }
                  if (v55 < v14)
                  {
                    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                    {
                      long long v57 = [v44 localIdentifier];
                      *(_DWORD *)buf = 138413058;
                      uint64_t v94 = (uint64_t)v57;
                      __int16 v95 = 2112;
                      double v96 = *(double *)&v80;
                      __int16 v97 = 2112;
                      double v98 = v18;
                      __int16 v99 = 2048;
                      double v100 = v55;
                      _os_log_impl(&dword_25934C000, v42, OS_LOG_TYPE_INFO, "[PNPersonClusterManager] Common moment %@ between %@ and %@: new best distance %.3f", buf, 0x2Au);
                    }
                    float v14 = v55;
                  }

                  if (v70) {
                    *uint64_t v70 = v54;
                  }
                  float v41 = v41 + 1.0;

                  id v36 = v69;
                }
                uint64_t v74 = [obj countByEnumeratingWithState:&v85 objects:v105 count:16];
                if (v74) {
                  continue;
                }
                break;
              }
            }
          }
        }
      }
      *(float *)&double v34 = v14;
      uint64_t v58 = objc_msgSend(NSNumber, "numberWithFloat:", v34, v64);
      uint64_t v59 = [NSNumber numberWithUnsignedShort:v68];
      v78[2](v78, v80, *(void *)&v79, v58, v59);

      *(float *)&double v60 = v14;
      uint64_t v61 = [NSNumber numberWithFloat:v60];
      __int16 v62 = [NSNumber numberWithUnsignedShort:v68];
      ((void (**)(void *, void *, void *, void *, void *))v78)[2](v78, *(void **)&v79, v80, v61, v62);

      if (v75) {
        unsigned __int16 *v75 = v68;
      }
      double v18 = v79;
LABEL_39:
      float v27 = v76;
    }
  }

  return v14;
}

void __102__PNPersonClusterManager_distanceBetweenHuman_andHuman_useCommonMoments_minAgeType_updateBlock_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v18[2] = *MEMORY[0x263EF8340];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  float v12 = *(void **)(a1 + 32);
  id v13 = a3;
  float v14 = [v12 objectForKeyedSubscript:v9];
  v17[0] = @"distance";
  v17[1] = @"minAgeType";
  v18[0] = v10;
  v18[1] = v11;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  if (v14)
  {
    [v14 setObject:v15 forKeyedSubscript:v13];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v15 forKey:v13];

    [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v9];
    id v13 = (id)v16;
  }
}

- (float)distanceBetweenPerson:(id)a3 andPerson:(id)a4 useCommonMoments:(BOOL)a5 minAgeType:(unsigned __int16 *)a6 updateBlock:(id)a7 error:(id *)a8
{
  BOOL v10 = a5;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  if ([(PNPersonClusterManager *)self detectionType] == 1) {
    [(PNPersonClusterManager *)self distanceBetweenHuman:v16 andHuman:v15 useCommonMoments:v10 minAgeType:a6 updateBlock:v14 error:a8];
  }
  else {
    [(PNPersonClusterManager *)self distanceBetweenPet:v16 andPet:v15 useCommonMoments:v10];
  }
  float v18 = v17;

  return v18;
}

- (float)distanceWithOverlapCheckBetweenPerson:(id)a3 andPerson:(id)a4 useCommonMoments:(BOOL)a5 minAgeType:(unsigned __int16 *)a6 updateBlock:(id)a7 error:(id *)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  int64_t v17 = [(PNPersonClusterManager *)self assetsOverlapBetweenPerson:v14 andPerson:v15];
  float v18 = 1.0;
  if (v17 != 2)
  {
    int64_t v19 = v17;
    [(PNPersonClusterManager *)self distanceBetweenPerson:v14 andPerson:v15 useCommonMoments:v11 minAgeType:a6 updateBlock:v16 error:a8];
    if (v20 > 0.15 && v19 == 1) {
      float v18 = 1.0;
    }
    else {
      float v18 = v20;
    }
  }

  return v18;
}

- (unint64_t)numberOfMomentsInCommonBetweenPerson:(id)a3 andPerson:(id)a4
{
  id v5 = a4;
  id v6 = [a3 backingMomentIdentifiers];
  int v7 = (void *)[v6 mutableCopy];

  id v8 = [v5 backingMomentIdentifiers];

  [v7 intersectSet:v8];
  unint64_t v9 = [v7 count];

  return v9;
}

- (unint64_t)numberOfAssetsInCommonBetweenPersonAssetIdentifiers:(id)a3 andPersonAssetIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 intersectsSet:v7])
  {
    id v8 = (void *)[v6 mutableCopy];
    [v8 intersectSet:v7];
    [v8 minusSet:self->_assetsToIgnore];
    unint64_t v9 = [v8 count];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (unint64_t)numberOfAssetsInCommonBetweenPerson:(id)a3 andPerson:(id)a4
{
  id v6 = a4;
  id v7 = [a3 backingAssetIdentifiers];
  id v8 = [v6 backingAssetIdentifiers];

  unint64_t v9 = [(PNPersonClusterManager *)self numberOfAssetsInCommonBetweenPersonAssetIdentifiers:v7 andPersonAssetIdentifiers:v8];
  return v9;
}

- (int64_t)assetsOverlapBetweenPersonAssetIdentifiers:(id)a3 andPersonAssetIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v7 count];
  unint64_t v9 = [v6 count];
  if (v8 >= v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v8;
  }
  unint64_t v11 = [(PNPersonClusterManager *)self numberOfAssetsInCommonBetweenPersonAssetIdentifiers:v7 andPersonAssetIdentifiers:v6];

  if (v10 < 0xF) {
    return 2 * (v11 != 0);
  }
  if (v11 <= (unint64_t)fmaxf((float)v10 * 0.01, 1.0)) {
    return 0;
  }
  if (v11 <= (unint64_t)fmaxf((float)v10 * 0.05, 1.0)) {
    return 1;
  }
  return 2;
}

- (int64_t)assetsOverlapBetweenPerson:(id)a3 andPerson:(id)a4
{
  id v6 = a4;
  id v7 = [a3 backingAssetIdentifiers];
  unint64_t v8 = [v6 backingAssetIdentifiers];

  int64_t v9 = [(PNPersonClusterManager *)self assetsOverlapBetweenPersonAssetIdentifiers:v7 andPersonAssetIdentifiers:v8];
  return v9;
}

- (unsigned)minAgeTypeForFaceAgeType:(unsigned __int16)a3 andFaceAgeType:(unsigned __int16)a4
{
  if (a3 >= a4) {
    unsigned __int16 v4 = a4;
  }
  else {
    unsigned __int16 v4 = a3;
  }
  if (!a4) {
    unsigned __int16 v4 = a3;
  }
  if (a3) {
    return v4;
  }
  else {
    return a4;
  }
}

- (void)updateConfidenceCacheBetweenPersonLocalIdentifier:(id)a3 andOtherPersonLocalIdentifier:(id)a4 withDistance:(double)a5
{
  unint64_t v8 = self->_confidencesForMergedPersonLocalIdentifier;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __119__PNPersonClusterManager_updateConfidenceCacheBetweenPersonLocalIdentifier_andOtherPersonLocalIdentifier_withDistance___block_invoke;
  aBlock[3] = &unk_26544F218;
  float v18 = v8;
  int64_t v9 = v8;
  id v10 = a4;
  id v11 = a3;
  float v12 = (void (**)(void *, id, id, void *))_Block_copy(aBlock);
  double v13 = 1.0 - a5;
  *(float *)&a5 = 1.0 - a5;
  LODWORD(v13) = LODWORD(a5);
  id v14 = [NSNumber numberWithFloat:v13];
  v12[2](v12, v11, v10, v14);

  LODWORD(v15) = LODWORD(a5);
  id v16 = [NSNumber numberWithFloat:v15];
  v12[2](v12, v10, v11, v16);
}

void __119__PNPersonClusterManager_updateConfidenceCacheBetweenPersonLocalIdentifier_andOtherPersonLocalIdentifier_withDistance___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  double v15 = @"confidence";
  v16[0] = v8;
  int64_t v9 = NSDictionary;
  id v10 = a3;
  id v11 = [v9 dictionaryWithObjects:v16 forKeys:&v15 count:1];
  float v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  double v13 = v12;
  if (v12)
  {
    [v12 setObject:v11 forKeyedSubscript:v10];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v11 forKey:v10];

    [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v7];
    id v10 = (id)v14;
  }
}

- (void)mergePersons:(id)a3 withPerson:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 detectionType] == 1)
  {
    id v8 = [v7 representativeFaceByFaceIdentifiers];
    uint64_t v9 = [v8 count];

    if (!v9)
    {
      id v10 = [(PNPersonClusterManager *)self representativeFaceObservationForPerson:v7 ageType:0];
      if (v10)
      {
        id v11 = [v7 representativeFaceByFaceIdentifiers];
        float v12 = [v7 backingFaceIdentifiers];
        [v11 setObject:v10 forKeyedSubscript:v12];
      }
    }
  }
  float v52 = [v7 mergedPersonIdentifiers];
  if (!v52)
  {
    double v13 = objc_opt_new();
    [v7 setMergedPersonIdentifiers:v13];

    float v52 = [v7 mergedPersonIdentifiers];
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v14 = v6;
  uint64_t v53 = [v14 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v53)
  {
    uint64_t v15 = 0;
    uint64_t v49 = *(void *)v67;
    uint64_t v50 = v14;
    v51 = self;
    do
    {
      uint64_t v16 = 0;
      do
      {
        uint64_t v57 = v15;
        if (*(void *)v67 != v49) {
          objc_enumerationMutation(v14);
        }
        uint64_t v56 = v16;
        int64_t v17 = *(void **)(*((void *)&v66 + 1) + 8 * v16);
        context = (void *)MEMORY[0x25A2E0AC0]();
        uint64_t v54 = [v17 faceCount];
        [(PNPersonClusterManager *)self invalidateCachesForPerson:v17];
        float v18 = [v17 mergedPersonIdentifiers];
        [v52 unionSet:v18];

        int64_t v19 = [v17 localIdentifier];
        [v52 addObject:v19];

        float v20 = [v7 backingFaceIdentifiers];
        long long v21 = [v17 backingFaceIdentifiers];
        [v20 unionSet:v21];

        long long v22 = [v7 backingAssetIdentifiers];
        long long v23 = [v17 backingAssetIdentifiers];
        [v22 unionSet:v23];

        unsigned __int16 v24 = [v7 backingMomentIdentifiers];
        uint64_t v25 = [v17 backingMomentIdentifiers];
        [v24 unionSet:v25];

        if ([v17 detectionType] == 1)
        {
          float v26 = [v17 representativeFaceByFaceIdentifiers];
          uint64_t v27 = [v26 count];

          if (!v27)
          {
            uint64_t v28 = [(PNPersonClusterManager *)self representativeFaceObservationForPerson:v17 ageType:0];
            if (v28)
            {
              uint64_t v29 = [v17 representativeFaceByFaceIdentifiers];
              float v30 = [v17 backingFaceIdentifiers];
              [v29 setObject:v28 forKeyedSubscript:v30];
            }
          }
        }
        float v31 = [v7 representativeFaceByFaceIdentifiers];
        float v32 = [v17 representativeFaceByFaceIdentifiers];
        [v31 addEntriesFromDictionary:v32];

        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        float v33 = [v17 backingFaceIdentifiersByMomentIdentifiers];
        uint64_t v34 = [v33 countByEnumeratingWithState:&v62 objects:v71 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v63;
          do
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v63 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = *(void *)(*((void *)&v62 + 1) + 8 * i);
              long long v39 = [v17 backingFaceIdentifiersByMomentIdentifiers];
              unint64_t v40 = [v39 objectForKeyedSubscript:v38];

              float v41 = [v7 backingFaceIdentifiersByMomentIdentifiers];
              long long v42 = [v41 objectForKeyedSubscript:v38];

              if (v42)
              {
                [v42 unionSet:v40];
              }
              else
              {
                long long v43 = [v7 backingFaceIdentifiersByMomentIdentifiers];
                [v43 setObject:v40 forKeyedSubscript:v38];
              }
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v62 objects:v71 count:16];
          }
          while (v35);
        }

        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v44 = [v17 mergedPersonIdentifiers];
        uint64_t v45 = [v44 countByEnumeratingWithState:&v58 objects:v70 count:16];
        self = v51;
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v59;
          do
          {
            for (uint64_t j = 0; j != v46; ++j)
            {
              if (*(void *)v59 != v47) {
                objc_enumerationMutation(v44);
              }
              [(NSMutableDictionary *)v51->_personClusters setObject:v7 forKeyedSubscript:*(void *)(*((void *)&v58 + 1) + 8 * j)];
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v58 objects:v70 count:16];
          }
          while (v46);
        }
        uint64_t v15 = v54 + v57;

        uint64_t v16 = v56 + 1;
        id v14 = v50;
      }
      while (v56 + 1 != v53);
      uint64_t v53 = [v50 countByEnumeratingWithState:&v66 objects:v72 count:16];
    }
    while (v53);

    if (v15)
    {
      [(PNPersonClusterManager *)v51 invalidateCachesForPerson:v7];
      [v7 invalidateCaches];
    }
  }
  else
  {
  }
}

- (id)_mapPersonClustersToFaceGroups:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        float v12 = objc_msgSend(v11, "localIdentifier", (void)v17);
        double v13 = [(NSMutableDictionary *)self->_personClusters objectForKeyedSubscript:v12];
        if (!v13)
        {
          id v14 = [PNPersonCluster alloc];
          uint64_t v15 = [(PNPersonClusterManager *)self photoLibrary];
          double v13 = [(PNPersonCluster *)v14 initWithFaceGroup:v11 inPhotoLibrary:v15];

          [(NSMutableDictionary *)self->_personClusters setObject:v13 forKeyedSubscript:v12];
        }
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_mapPersonClustersToPersons:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(PNPersonClusterManager *)self photoLibrary];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        float v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v13 = objc_msgSend(v12, "localIdentifier", (void)v16);
        id v14 = [(NSMutableDictionary *)self->_personClusters objectForKeyedSubscript:v13];
        if (!v14)
        {
          id v14 = [[PNPersonCluster alloc] initWithPerson:v12 inPhotoLibrary:v6];
          [(NSMutableDictionary *)self->_personClusters setObject:v14 forKeyedSubscript:v13];
        }
        [v5 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v5;
}

- (void)invalidateCachesForPerson:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = [a3 localIdentifier];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PNPersonClusterManager_invalidateCachesForPerson___block_invoke;
  aBlock[3] = &unk_26544F1F0;
  id v5 = v4;
  id v19 = v5;
  id v6 = (void (**)(void *, NSMutableDictionary *))_Block_copy(aBlock);
  v6[2](v6, self->_distancesForPersonLocalIdentifier);
  v6[2](v6, self->_distancesInCommonMomentsForPersonLocalIdentifier);
  id v7 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [(NSMutableDictionary *)self->_representativeFaceObservationForPersonIdentifier allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v13 containsString:v5]) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v10);
  }

  [(NSMutableDictionary *)self->_representativeFaceObservationForPersonIdentifier removeObjectsForKeys:v7];
}

void __52__PNPersonClusterManager_invalidateCachesForPerson___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (v4)
  {
    id v5 = objc_opt_new();
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__PNPersonClusterManager_invalidateCachesForPerson___block_invoke_2;
    v7[3] = &unk_26544F1C8;
    id v8 = v5;
    id v9 = v3;
    id v10 = *(id *)(a1 + 32);
    id v6 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v7];
    [v4 removeObjectsForKeys:v6];
  }
}

void __52__PNPersonClusterManager_invalidateCachesForPerson___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = [a3 objectForKeyedSubscript:@"distance"];
  [v5 floatValue];
  if (v6 < 0.3)
  {
    [*(id *)(a1 + 32) addObject:v9];
    id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];
    id v8 = v7;
    if (v7) {
      [v7 removeObjectForKey:*(void *)(a1 + 48)];
    }
  }
}

- (void)clearCaches
{
  [(NSMutableDictionary *)self->_personClusters removeAllObjects];
  [(NSMutableDictionary *)self->_representativeFaceObservationForPersonIdentifier removeAllObjects];
  [(NSMutableDictionary *)self->_distancesForPersonLocalIdentifier removeAllObjects];
  [(NSMutableDictionary *)self->_distancesInCommonMomentsForPersonLocalIdentifier removeAllObjects];
  confidencesForMergedPersonLocalIdentifier = self->_confidencesForMergedPersonLocalIdentifier;
  [(NSMutableDictionary *)confidencesForMergedPersonLocalIdentifier removeAllObjects];
}

- (PNPersonClusterManager)initWithPhotoLibrary:(id)a3 detectionType:(signed __int16)a4 promoterDelegate:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)PNPersonClusterManager;
  id v10 = [(PNPersonClusterManager *)&v31 init];
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_10;
  }
  [(PNPersonClusterManager *)v10 setPhotoLibrary:v8];
  [(PNPersonClusterManager *)v11 setDetectionType:v6];
  float v12 = objc_alloc_init(PNVisionHelper);
  visionHelper = v11->_visionHelper;
  v11->_visionHelper = v12;

  uint64_t v14 = objc_opt_new();
  personClusters = v11->_personClusters;
  v11->_personClusters = (NSMutableDictionary *)v14;

  uint64_t v16 = objc_opt_new();
  representativeFaceObservationForPersonIdentifier = v11->_representativeFaceObservationForPersonIdentifier;
  v11->_representativeFaceObservationForPersonIdentifier = (NSMutableDictionary *)v16;

  uint64_t v18 = objc_opt_new();
  distancesForPersonLocalIdentifier = v11->_distancesForPersonLocalIdentifier;
  v11->_distancesForPersonLocalIdentifier = (NSMutableDictionary *)v18;

  uint64_t v20 = objc_opt_new();
  distancesInCommonMomentsForPersonLocalIdentifier = v11->_distancesInCommonMomentsForPersonLocalIdentifier;
  v11->_distancesInCommonMomentsForPersonLocalIdentifier = (NSMutableDictionary *)v20;

  uint64_t v22 = objc_opt_new();
  confidencesForMergedPersonLocalIdentifier = v11->_confidencesForMergedPersonLocalIdentifier;
  v11->_confidencesForMergedPersonLocalIdentifier = (NSMutableDictionary *)v22;

  uint64_t v24 = objc_msgSend(v8, "pn_fetchInvalidAssetIdentifiersForCommonComparison");
  assetsToIgnore = v11->_assetsToIgnore;
  v11->_assetsToIgnore = (NSSet *)v24;

  objc_storeStrong((id *)&v11->_promoterDelegate, a5);
  if (v11->_promoterDelegate)
  {
    char v26 = objc_opt_respondsToSelector();
    v11->_vuDistanceSPIEnabled = v26 & 1;
    if (v26)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)float v30 = 0;
        uint64_t v27 = &_os_log_internal;
        uint64_t v28 = "[PNPersonClusterManager] Using VU distance SPI for pet deduper distance";
LABEL_9:
        _os_log_impl(&dword_25934C000, v27, OS_LOG_TYPE_INFO, v28, v30, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
  }
  else
  {
    v11->_vuDistanceSPIEnabled = 0;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)float v30 = 0;
    uint64_t v27 = &_os_log_internal;
    uint64_t v28 = "[PNPersonClusterManager] Using Photos average animalprint distance SPI for pet deduper distance";
    goto LABEL_9;
  }
LABEL_10:

  return v11;
}

- (PNPersonClusterManager)initWithPhotoLibrary:(id)a3
{
  return [(PNPersonClusterManager *)self initWithPhotoLibrary:a3 detectionType:1 promoterDelegate:0];
}

+ (id)nodeSortDescriptors
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"UUID" ascending:1];
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)faceGroupSortDescriptors
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"localIdentifier" ascending:1];
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)peopleSortDescriptors
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"localIdentifier" ascending:1];
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)faceSortDescriptors
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"localIdentifier" ascending:1];
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)assetSortDescriptors
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v6[0] = v2;
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"filename" ascending:1];
  v6[1] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)momentSortDescriptors
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startDate" ascending:1];
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)personProcessingSortDescriptors
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"faceCount" ascending:0];
  v6[0] = v2;
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"localIdentifier" ascending:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

@end