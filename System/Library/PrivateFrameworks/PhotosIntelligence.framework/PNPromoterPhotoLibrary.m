@interface PNPromoterPhotoLibrary
+ (id)_defaultAssetPropertySets;
+ (id)_defaultFacePropertySets;
+ (id)_phFaceSortDescriptors;
+ (id)_phPeopleSortDescriptors;
- (BOOL)includesPets;
- (BOOL)pn_performChangesAndWait:(id)a3 error:(id *)a4;
- (NSDictionary)rawClusters;
- (PHPhotoLibrary)photoLibrary;
- (PNPromoterPhotoLibrary)initWithPhotoLibrary:(id)a3;
- (PNPromoterPhotoLibrary)initWithPhotoLibrary:(id)a3 rawClusters:(id)a4 includesPets:(BOOL)a5;
- (double)_progressFromWorkerStatesDictionary:(id)a3;
- (float)pn_faceProcessingProgress;
- (id)_defaultAssetFetchOptions;
- (id)_defaultFetchOptions;
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
- (unint64_t)pn_numberOfFacesWithFaceprints;
- (void)setPhotoLibrary:(id)a3;
- (void)setRawClusters:(id)a3;
@end

@implementation PNPromoterPhotoLibrary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawClusters, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (BOOL)includesPets
{
  return self->_includesPets;
}

- (void)setRawClusters:(id)a3
{
}

- (NSDictionary)rawClusters
{
  return self->_rawClusters;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (id)pn_fetchAssetsForFaceLocalIdentifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [MEMORY[0x263F14E78] uuidFromLocalIdentifier:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v12 = [(PNPromoterPhotoLibrary *)self _defaultAssetFetchOptions];
  v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"ANY detectedFaces.uuid IN %@", v5];
  [v12 setInternalPredicate:v13];

  v14 = [MEMORY[0x263F14D18] fetchAssetsWithOptions:v12];

  return v14;
}

- (id)pn_lastAssetDate
{
  v9[1] = *MEMORY[0x263EF8340];
  v2 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"creationDate" ascending:0];
  v9[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [v2 setSortDescriptors:v4];

  [v2 setFetchLimit:1];
  [v2 setIncludeAssetSourceTypes:5];
  id v5 = [MEMORY[0x263F14D18] fetchAssetsWithOptions:v2];
  id v6 = [v5 firstObject];
  uint64_t v7 = [v6 creationDate];

  return v7;
}

- (id)pn_fetchInvalidAssetIdentifiersForCommonComparison
{
  v33[1] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v4 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  v33[0] = *MEMORY[0x263F14FE0];
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  [v4 setFetchPropertySets:v5];

  v22 = [MEMORY[0x263F14D28] fetchAssetCollectionsWithType:2 subtype:211 options:v4];
  uint64_t v21 = [v22 firstObject];
  id v6 = objc_msgSend(MEMORY[0x263F14D18], "fetchAssetsInAssetCollection:options:");
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v27 + 1) + 8 * i) localIdentifier];
        [v3 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }
  v12 = [MEMORY[0x263F14D28] fetchAssetCollectionsWithType:2 subtype:201 options:v4];
  v13 = [v12 firstObject];
  v14 = [MEMORY[0x263F14D18] fetchAssetsInAssetCollection:v13 options:v4];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = [*(id *)(*((void *)&v23 + 1) + 8 * j) localIdentifier];
        [v3 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  return v3;
}

- (float)pn_faceProcessingProgress
{
  v2 = [(PNPromoterPhotoLibrary *)self photoLibrary];
  [v2 ratioOfAssetsWithFacesProcessed];
  float v4 = v3;

  return v4;
}

- (double)_progressFromWorkerStatesDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  float v4 = [v3 objectForKeyedSubscript:@"total-allowed"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToString:", @"total-allowed", (void)v16) & 1) == 0)
        {
          v13 = [v6 objectForKeyedSubscript:v12];
          v9 += [v13 unsignedIntegerValue];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
  }

  if (v5)
  {
    if ((double)v9 / (double)v5 <= 1.0) {
      double v14 = (double)v9 / (double)v5;
    }
    else {
      double v14 = 1.0;
    }
  }
  else
  {
    double v14 = -1.0;
  }

  return v14;
}

- (id)pn_fetchFaceGroupsForPerson:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  id v6 = [MEMORY[0x263F14E08] fetchFaceGroupsForPerson:v4 options:v5];

  return v6;
}

- (id)pn_fetchFaceGroups
{
  if ([(NSDictionary *)self->_rawClusters count])
  {
    id v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSDictionary count](self->_rawClusters, "count"));
    rawClusters = self->_rawClusters;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __44__PNPromoterPhotoLibrary_pn_fetchFaceGroups__block_invoke;
    v8[3] = &unk_26544EBA8;
    id v9 = v3;
    id v5 = v3;
    [(NSDictionary *)rawClusters enumerateKeysAndObjectsUsingBlock:v8];
    id v6 = [[PNPromoterFaceGroupFetchResult alloc] initWithFaceGroups:v5];
  }
  else
  {
    id v5 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
    id v6 = [MEMORY[0x263F14E08] fetchFaceGroupsWithOptions:v5];
  }

  return v6;
}

void __44__PNPromoterPhotoLibrary_pn_fetchFaceGroups__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v7 = [a2 stringValue];
  id v6 = [[PNPromoterFaceGroup alloc] initWithGroupIdentifier:v7 andFaceIdentifiers:v5];

  [*(id *)(a1 + 32) addObject:v6];
}

- (id)pn_fetchAssetsForFaceGroup:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PNPromoterPhotoLibrary *)self _defaultAssetFetchOptions];
  id v6 = (void *)MEMORY[0x263F14D18];
  v10[0] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  uint64_t v8 = [v6 fetchAssetsForFaceGroups:v7 options:v5];

  return v8;
}

- (id)pn_fetchAssetsForPerson:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PNPromoterPhotoLibrary *)self _defaultAssetFetchOptions];
  id v6 = (void *)MEMORY[0x263F14D18];
  v10[0] = v4;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  uint64_t v8 = [v6 fetchAssetsForPersons:v7 options:v5];

  return v8;
}

- (id)pn_fetchAssetsInMoment:(id)a3
{
  id v4 = a3;
  id v5 = [(PNPromoterPhotoLibrary *)self _defaultAssetFetchOptions];
  id v6 = [MEMORY[0x263F14D18] fetchAssetsInAssetCollection:v4 options:v5];

  return v6;
}

- (id)pn_fetchAssetsWithLocalIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(PNPromoterPhotoLibrary *)self _defaultAssetFetchOptions];
  id v6 = [MEMORY[0x263F14D18] fetchAssetsWithLocalIdentifiers:v4 options:v5];

  return v6;
}

- (id)pn_fetchMomentsForAssetsWithLocalIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  id v6 = +[PNPersonClusterManager momentSortDescriptors];
  [v5 setSortDescriptors:v6];

  id v7 = [MEMORY[0x263F14D28] fetchMomentsForAssetsWithLocalIdentifiers:v4 options:v5];

  return v7;
}

- (id)pn_fetchMomentsForPerson:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PNPromoterPhotoLibrary.m", 377, @"%s not implemented", "-[PNPromoterPhotoLibrary pn_fetchMomentsForPerson:]");

  abort();
}

- (id)pn_fetchMomentsWithLocalIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  id v6 = +[PNPersonClusterManager momentSortDescriptors];
  [v5 setSortDescriptors:v6];

  id v7 = [MEMORY[0x263F14D28] fetchAssetCollectionsWithLocalIdentifiers:v4 options:v5];

  return v7;
}

- (id)pn_fetchMoments
{
  v2 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  id v3 = +[PNPersonClusterManager momentSortDescriptors];
  [v2 setSortDescriptors:v3];

  id v4 = [MEMORY[0x263F14D28] fetchMomentsWithOptions:v2];

  return v4;
}

- (id)pn_fetchFacesGroupedByAssetLocalIdentifierForAssets:(id)a3
{
  id v4 = a3;
  id v5 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  id v6 = [(id)objc_opt_class() _defaultFacePropertySets];
  [v5 setFetchPropertySets:v6];

  id v7 = [(id)objc_opt_class() _phFaceSortDescriptors];
  [v5 setSortDescriptors:v7];

  [v5 setIncludeTorsoAndFaceDetectionData:1];
  uint64_t v8 = [MEMORY[0x263F14DF0] fetchFacesGroupedByAssetLocalIdentifierForAssets:v4 options:v5];

  return v8;
}

- (id)pn_fetchFacesForFaceGroup:(id)a3
{
  id v5 = a3;
  id v6 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  id v7 = [(id)objc_opt_class() _defaultFacePropertySets];
  [v6 setFetchPropertySets:v7];

  uint64_t v8 = [(id)objc_opt_class() _phFaceSortDescriptors];
  [v6 setSortDescriptors:v8];

  [v6 setIncludeTorsoAndFaceDetectionData:1];
  id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"faceCrop == nil"];
  [v6 setInternalPredicate:v9];

  if ([(NSDictionary *)self->_rawClusters count])
  {
    uint64_t v10 = NSNumber;
    v11 = [v5 localIdentifier];
    v12 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "integerValue"));

    v13 = [(NSDictionary *)self->_rawClusters objectForKeyedSubscript:v12];
    if (![v13 count])
    {
      long long v16 = [MEMORY[0x263F08690] currentHandler];
      long long v17 = [v5 localIdentifier];
      [v16 handleFailureInMethod:a2, self, @"PNPromoterPhotoLibrary.m", 333, @"No vuFaces for %@", v17 object file lineNumber description];
    }
    double v14 = [MEMORY[0x263F14DF0] fetchFacesWithVuObservationIDs:v13 options:v6];
  }
  else
  {
    double v14 = [MEMORY[0x263F14DF0] fetchFacesInFaceGroup:v5 options:v6];
  }

  return v14;
}

- (id)pn_fetchFacesForPersonLocalIdentifiers:(id)a3 inMoment:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PNPromoterPhotoLibrary *)self photoLibrary];
  id v9 = [v8 fetchFacesForMediaProcessingWithPersonLocalIdentifiers:v7 inMoment:v6];

  if ([v9 count]) {
    id v10 = v9;
  }
  else {
    id v10 = (id)MEMORY[0x263EFFA68];
  }

  return v10;
}

- (id)pn_fetchFacesForPerson:(id)a3 inMoment:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [a3 localIdentifier];
  v11[0] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v9 = [(PNPromoterPhotoLibrary *)self pn_fetchFacesForPersonLocalIdentifiers:v8 inMoment:v6];

  return v9;
}

- (id)pn_fetchFacesForPerson:(id)a3
{
  id v4 = a3;
  id v5 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  [v5 setIncludeOnlyFacesWithFaceprints:1];
  id v6 = [(id)objc_opt_class() _defaultFacePropertySets];
  [v5 setFetchPropertySets:v6];

  id v7 = [(id)objc_opt_class() _phFaceSortDescriptors];
  [v5 setSortDescriptors:v7];

  [v5 setIncludeTorsoAndFaceDetectionData:1];
  uint64_t v8 = [MEMORY[0x263F14DF0] fetchFacesForPerson:v4 options:v5];

  return v8;
}

- (id)pn_fetchFacesWithLocalIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  id v6 = [(id)objc_opt_class() _defaultFacePropertySets];
  [v5 setFetchPropertySets:v6];

  id v7 = [(id)objc_opt_class() _phFaceSortDescriptors];
  [v5 setSortDescriptors:v7];

  [v5 setIncludeTorsoAndFaceDetectionData:1];
  uint64_t v8 = [MEMORY[0x263F14DF0] fetchFacesWithLocalIdentifiers:v4 options:v5];

  return v8;
}

- (unint64_t)pn_numberOfFacesWithFaceprints
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  [v2 setIncludeOnlyFacesWithFaceprints:1];
  v7[0] = *MEMORY[0x263F15088];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  [v2 setFetchPropertySets:v3];

  [v2 setShouldPrefetchCount:1];
  [v2 setIncludeTorsoAndFaceDetectionData:1];
  id v4 = [MEMORY[0x263F14DF0] fetchFacesWithOptions:v2];
  unint64_t v5 = [v4 count];

  return v5;
}

- (id)pn_fetchPersonsGroupedByAssetLocalIdentifierForAssets:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  [v5 setMinimumVerifiedFaceCount:1];
  [v5 setMinimumUnverifiedFaceCount:1];
  id v6 = [(id)objc_opt_class() _phPeopleSortDescriptors];
  [v5 setSortDescriptors:v6];

  [v5 setIncludeTorsoOnlyPerson:1];
  id v7 = [MEMORY[0x263F14E88] fetchPersonsGroupedByAssetLocalIdentifierForAssets:v4 options:v5];

  return v7;
}

- (id)pn_fetchInvalidCandidatePersonsForPerson:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  id v6 = [(id)objc_opt_class() _phPeopleSortDescriptors];
  [v5 setSortDescriptors:v6];

  [v5 setIncludeTorsoOnlyPerson:1];
  id v7 = [MEMORY[0x263F14E88] fetchInvalidMergeCandidatePersonsForPerson:v4 options:v5];

  return v7;
}

- (id)pn_fetchCandidatePersonsForPerson:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  id v6 = [(id)objc_opt_class() _phPeopleSortDescriptors];
  [v5 setSortDescriptors:v6];

  [v5 setIncludeTorsoOnlyPerson:1];
  id v7 = [MEMORY[0x263F14E88] fetchMergeCandidatePersonsForPerson:v4 options:v5];

  return v7;
}

- (id)pn_fetchPersonsInMoment:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  [v5 setMinimumVerifiedFaceCount:1];
  [v5 setMinimumUnverifiedFaceCount:1];
  id v6 = [(id)objc_opt_class() _phPeopleSortDescriptors];
  [v5 setSortDescriptors:v6];

  [v5 setIncludeTorsoOnlyPerson:1];
  id v7 = [MEMORY[0x263F14E88] fetchPersonsForAssetCollection:v4 options:v5];

  return v7;
}

- (id)pn_fetchPersonsWithType:(unint64_t)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v6 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  id v7 = [(id)objc_opt_class() _phPeopleSortDescriptors];
  [v6 setSortDescriptors:v7];

  [v6 setIncludeTorsoOnlyPerson:1];
  switch(a3)
  {
    case 0uLL:
      uint64_t v21 = [MEMORY[0x263F08690] currentHandler];
      [v21 handleFailureInMethod:a2 object:self file:@"PNPromoterPhotoLibrary.m" lineNumber:213 description:@"PNPhotoLibraryProtocolPeopleTypeFaceGroup cannot be used on PH objects"];

      abort();
    case 1uLL:
      uint64_t v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"verifiedType = %@ OR verifiedType = %@", &unk_27076A308, &unk_27076A320];
      [v6 setPredicate:v8];

      goto LABEL_7;
    case 2uLL:
      [v6 setMinimumVerifiedFaceCount:2];
      [v6 setMinimumUnverifiedFaceCount:2];
      id v10 = [MEMORY[0x263F14E88] fetchPersonsWithOptions:v6];
      v11 = [(PNPromoterPhotoLibrary *)self photoLibrary];
      v12 = [v11 librarySpecificFetchOptions];

      v13 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"creationDate" ascending:0];
      v24[0] = v13;
      double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
      [v12 setSortDescriptors:v14];

      uint64_t v15 = [v10 fetchedObjects];
      long long v16 = (void *)MEMORY[0x263F08A98];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __50__PNPromoterPhotoLibrary_pn_fetchPersonsWithType___block_invoke;
      v22[3] = &unk_26544EB80;
      id v23 = v12;
      id v17 = v12;
      long long v18 = [v16 predicateWithBlock:v22];
      long long v19 = [v15 filteredArrayUsingPredicate:v18];

      goto LABEL_9;
    case 3uLL:
      [v6 setPersonContext:0];
      goto LABEL_7;
    case 4uLL:
      [v6 setMinimumVerifiedFaceCount:1];
      [v6 setMinimumUnverifiedFaceCount:1];
LABEL_7:
      id v9 = [MEMORY[0x263F14E88] fetchPersonsWithOptions:v6];
      break;
    default:
      id v9 = 0;
      break;
  }
  id v10 = v9;
  long long v19 = v10;
LABEL_9:

  return v19;
}

BOOL __50__PNPromoterPhotoLibrary_pn_fetchPersonsWithType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F14D18];
  uint64_t v15 = a2;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:&v15 count:1];
  id v7 = objc_msgSend(v3, "fetchAssetsForPersons:options:", v6, *(void *)(a1 + 32), v15, v16);

  uint64_t v8 = [v7 firstObject];
  id v9 = [v8 creationDate];
  id v10 = [v7 lastObject];
  v11 = [v10 creationDate];
  [v9 timeIntervalSinceDate:v11];
  double v13 = v12;

  return v13 > 86400.0;
}

- (id)pn_fetchPersonsWithLocalIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  [v5 setMinimumVerifiedFaceCount:1];
  [v5 setMinimumUnverifiedFaceCount:1];
  id v6 = [(id)objc_opt_class() _phPeopleSortDescriptors];
  [v5 setSortDescriptors:v6];

  [v5 setIncludeTorsoOnlyPerson:1];
  id v7 = [MEMORY[0x263F14E88] fetchPersonsWithLocalIdentifiers:v4 options:v5];

  return v7;
}

- (id)pn_persistentStorageDirectoryURL
{
  id v3 = [MEMORY[0x263F08AB0] processInfo];
  id v4 = [v3 processName];

  if (![v4 isEqualToString:@"mediaanalysisd"])
  {
    id v8 = objc_alloc_init(MEMORY[0x263F08850]);
    id v21 = 0;
    id v10 = [v8 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v21];
    id v11 = v21;
    if (v11)
    {
      id v12 = v11;
      id v9 = 0;
LABEL_6:
      double v13 = NSURL;
      double v14 = NSTemporaryDirectory();
      uint64_t v15 = [v13 fileURLWithPath:v14];

      id v9 = (void *)v15;
      goto LABEL_14;
    }
    id v9 = [v10 URLByAppendingPathComponent:v4];
    char v20 = 0;
    uint64_t v16 = [v9 path];
    char v17 = [v8 fileExistsAtPath:v16 isDirectory:&v20];

    if (v17)
    {
      if (!v20)
      {

        id v9 = 0;
        id v12 = 0;
        goto LABEL_6;
      }
      id v12 = 0;
    }
    else
    {
      id v19 = 0;
      [v8 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v19];
      id v12 = v19;
    }
    if (v9 && !v12) {
      goto LABEL_14;
    }
    goto LABEL_6;
  }
  id v5 = [(PNPromoterPhotoLibrary *)self photoLibrary];
  int v6 = [v5 isSystemPhotoLibrary];

  id v7 = [(PNPromoterPhotoLibrary *)self photoLibrary];
  id v8 = v7;
  if (v6)
  {
    id v9 = [v7 urlForApplicationDataFolderIdentifier:2];
    goto LABEL_15;
  }
  id v10 = [v7 photoLibraryURL];
  id v9 = [v10 URLByAppendingPathComponent:@"private/com.apple.mediaanalysisd/caches/vision"];
LABEL_14:

LABEL_15:
  return v9;
}

- (id)_defaultAssetFetchOptions
{
  id v3 = [(PNPromoterPhotoLibrary *)self _defaultFetchOptions];
  id v4 = [(id)objc_opt_class() _defaultAssetPropertySets];
  [v3 setFetchPropertySets:v4];

  if ([(PNPromoterPhotoLibrary *)self includesPets]) {
    [v3 setIncludedDetectionTypes:&unk_27076A580];
  }
  return v3;
}

- (id)_defaultFetchOptions
{
  id v3 = [(PNPromoterPhotoLibrary *)self photoLibrary];
  id v4 = [v3 librarySpecificFetchOptions];

  [v4 setWantsIncrementalChangeDetails:0];
  if ([(PNPromoterPhotoLibrary *)self includesPets]) {
    [v4 setIncludedDetectionTypes:&unk_27076A568];
  }
  return v4;
}

- (BOOL)pn_performChangesAndWait:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PNPromoterPhotoLibrary *)self photoLibrary];
  LOBYTE(a4) = [v7 performChangesAndWait:v6 error:a4];

  return (char)a4;
}

- (PNPromoterPhotoLibrary)initWithPhotoLibrary:(id)a3 rawClusters:(id)a4 includesPets:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PNPromoterPhotoLibrary;
  id v11 = [(PNPromoterPhotoLibrary *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_photoLibrary, a3);
    objc_storeStrong((id *)&v12->_rawClusters, a4);
    v12->_includesPets = a5;
  }

  return v12;
}

- (PNPromoterPhotoLibrary)initWithPhotoLibrary:(id)a3
{
  return [(PNPromoterPhotoLibrary *)self initWithPhotoLibrary:a3 rawClusters:MEMORY[0x263EFFA78] includesPets:0];
}

+ (id)_defaultFacePropertySets
{
  v5[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F15080];
  v5[0] = *MEMORY[0x263F15088];
  v5[1] = v2;
  v5[2] = *MEMORY[0x263F15078];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  return v3;
}

+ (id)_defaultAssetPropertySets
{
  v5[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F15020];
  v5[0] = *MEMORY[0x263F14FB8];
  v5[1] = v2;
  v5[2] = *MEMORY[0x263F14FF8];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  return v3;
}

+ (id)_phPeopleSortDescriptors
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"uuid" ascending:1];
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)_phFaceSortDescriptors
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"uuid" ascending:1];
  v5[0] = v2;
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

@end