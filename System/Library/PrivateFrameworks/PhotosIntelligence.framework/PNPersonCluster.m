@interface PNPersonCluster
- (BOOL)favorite;
- (BOOL)hidden;
- (BOOL)highlyInteresting;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVerified;
- (BOOL)quarantined;
- (NSDate)firstSeenDate;
- (NSDate)lastSeenDate;
- (NSMutableDictionary)backingFaceIdentifiersByMomentIdentifiers;
- (NSMutableDictionary)representativeFaceByFaceIdentifiers;
- (NSMutableSet)backingAssetIdentifiers;
- (NSMutableSet)backingFaceIdentifiers;
- (NSMutableSet)backingMomentIdentifiers;
- (NSMutableSet)mergedPersonIdentifiers;
- (NSSet)sourcePersonBackingAssetIdentifiers;
- (NSString)anonymizedName;
- (NSString)description;
- (NSString)localIdentifier;
- (PNFaceGroupProtocol)sourceFaceGroup;
- (PNFaceProtocol)keyFace;
- (PNPersonCluster)initWithFaceGroup:(id)a3 inPhotoLibrary:(id)a4;
- (PNPersonCluster)initWithPerson:(id)a3 inPhotoLibrary:(id)a4;
- (PNPersonProtocol)sourcePerson;
- (PNPhotoLibraryProtocol)photoLibrary;
- (double)interestingScore;
- (double)libraryTimespan;
- (double)sideFaceRatio;
- (id)fetchAssets;
- (id)fetchFaces;
- (id)fetchMoments;
- (id)firstSeenDateWithoutOutliersForAgeType:(unsigned __int16)a3;
- (id)personLocalIdentifiers;
- (int64_t)manualOrder;
- (int64_t)verifiedType;
- (signed)detectionType;
- (unint64_t)faceCount;
- (unint64_t)hash;
- (void)_cacheDates;
- (void)_cacheDatesWithoutOutliersWithMaximumDistanceBetweenMoments:(double)a3;
- (void)invalidateCaches;
- (void)pn_addMergeCandidatePersons:(id)a3;
- (void)setBackingAssetIdentifiers:(id)a3;
- (void)setBackingFaceIdentifiers:(id)a3;
- (void)setBackingFaceIdentifiersByMomentIdentifiers:(id)a3;
- (void)setBackingMomentIdentifiers:(id)a3;
- (void)setFirstSeenDate:(id)a3;
- (void)setHighlyInteresting:(BOOL)a3;
- (void)setInterestingScore:(double)a3;
- (void)setIsVerified:(BOOL)a3;
- (void)setKeyFace:(id)a3;
- (void)setLastSeenDate:(id)a3;
- (void)setManualOrder:(int64_t)a3;
- (void)setMergedPersonIdentifiers:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setQuarantined:(BOOL)a3;
- (void)setRepresentativeFaceByFaceIdentifiers:(id)a3;
- (void)setSourceFaceGroup:(id)a3;
- (void)setSourcePerson:(id)a3;
- (void)setSourcePersonBackingAssetIdentifiers:(id)a3;
@end

@implementation PNPersonCluster

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_firstSeenDate, 0);
  objc_storeStrong((id *)&self->_representativeFaceByFaceIdentifiers, 0);
  objc_storeStrong((id *)&self->_backingFaceIdentifiersByMomentIdentifiers, 0);
  objc_storeStrong((id *)&self->_backingMomentIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourcePersonBackingAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_backingAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_backingFaceIdentifiers, 0);
  objc_storeStrong((id *)&self->_mergedPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceFaceGroup, 0);
  objc_storeStrong((id *)&self->_sourcePerson, 0);
  objc_destroyWeak((id *)&self->_photoLibrary);
  objc_storeStrong((id *)&self->_firstSeenDateWithoutOutliers, 0);
}

- (void)setLastSeenDate:(id)a3
{
}

- (void)setFirstSeenDate:(id)a3
{
}

- (void)setQuarantined:(BOOL)a3
{
  self->_quarantined = a3;
}

- (BOOL)quarantined
{
  return self->_quarantined;
}

- (void)setHighlyInteresting:(BOOL)a3
{
  self->_highlyInteresting = a3;
}

- (BOOL)highlyInteresting
{
  return self->_highlyInteresting;
}

- (void)setRepresentativeFaceByFaceIdentifiers:(id)a3
{
}

- (NSMutableDictionary)representativeFaceByFaceIdentifiers
{
  return self->_representativeFaceByFaceIdentifiers;
}

- (void)setBackingFaceIdentifiersByMomentIdentifiers:(id)a3
{
}

- (NSMutableDictionary)backingFaceIdentifiersByMomentIdentifiers
{
  return self->_backingFaceIdentifiersByMomentIdentifiers;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (void)setInterestingScore:(double)a3
{
  self->_interestingScore = a3;
}

- (double)interestingScore
{
  return self->_interestingScore;
}

- (void)setBackingMomentIdentifiers:(id)a3
{
}

- (void)setSourcePersonBackingAssetIdentifiers:(id)a3
{
}

- (NSSet)sourcePersonBackingAssetIdentifiers
{
  return self->_sourcePersonBackingAssetIdentifiers;
}

- (void)setBackingAssetIdentifiers:(id)a3
{
}

- (void)setBackingFaceIdentifiers:(id)a3
{
}

- (void)setMergedPersonIdentifiers:(id)a3
{
}

- (NSMutableSet)mergedPersonIdentifiers
{
  return self->_mergedPersonIdentifiers;
}

- (void)setSourceFaceGroup:(id)a3
{
}

- (PNFaceGroupProtocol)sourceFaceGroup
{
  return self->_sourceFaceGroup;
}

- (void)setSourcePerson:(id)a3
{
}

- (PNPersonProtocol)sourcePerson
{
  return self->_sourcePerson;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PNPhotoLibraryProtocol)photoLibrary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoLibrary);
  return (PNPhotoLibraryProtocol *)WeakRetained;
}

- (double)sideFaceRatio
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(PNPersonCluster *)self fetchFaces];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  double v4 = 0.0;
  if (v3)
  {
    uint64_t v5 = v3;
    unint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v2);
        }
        int v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) poseType];
        if (v10 == 4 || v10 == 2) {
          ++v7;
        }
      }
      v6 += v5;
      uint64_t v5 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
    if (v7 && v6) {
      double v4 = (double)v7 / (double)v6;
    }
  }

  return v4;
}

- (void)invalidateCaches
{
  firstSeenDate = self->_firstSeenDate;
  self->_firstSeenDate = 0;

  lastSeenDate = self->_lastSeenDate;
  self->_lastSeenDate = 0;

  self->_interestingScore = -1.79769313e308;
  firstSeenDateWithoutOutliers = self->_firstSeenDateWithoutOutliers;
  self->_firstSeenDateWithoutOutliers = 0;
}

- (void)_cacheDatesWithoutOutliersWithMaximumDistanceBetweenMoments:(double)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(PNPersonCluster *)self photoLibrary];
  v44 = self;
  unint64_t v6 = [(PNPersonCluster *)self backingMomentIdentifiers];
  unint64_t v7 = [v6 allObjects];
  uint64_t v8 = objc_msgSend(v5, "pn_fetchMomentsWithLocalIdentifiers:", v7);

  v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    long long v13 = 0;
    uint64_t v14 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v50 != v14) {
          objc_enumerationMutation(v10);
        }
        long long v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v17 = [v16 startDate];
        [v9 addObject:v17];

        uint64_t v18 = [v16 endDate];
        if (!v13 || [(NSDate *)v13 compare:v18] == NSOrderedAscending)
        {
          v19 = v18;

          long long v13 = v19;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v12);
  }
  else
  {
    long long v13 = 0;
  }
  v43 = v10;

  [v9 sortUsingSelector:sel_compare_];
  v20 = [v9 firstObject];
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v23 = v9;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v53 count:16];
  v42 = v20;
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v46;
    do
    {
      uint64_t v27 = 0;
      v28 = v20;
      do
      {
        if (*(void *)v46 != v26) {
          objc_enumerationMutation(v23);
        }
        v29 = *(void **)(*((void *)&v45 + 1) + 8 * v27);
        [v29 timeIntervalSinceDate:v28];
        if (v30 <= a3)
        {
          [v22 addObject:v29];
        }
        else
        {
          unint64_t v31 = [v22 count];
          if (v31 > [v21 count])
          {
            id v32 = v22;

            id v21 = v32;
          }
          uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v29, 0);

          id v22 = (id)v33;
        }
        v20 = v29;

        ++v27;
        v28 = v20;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v25);
  }

  unint64_t v34 = [v22 count];
  if (v34 > [v21 count])
  {
    id v35 = v22;

    id v21 = v35;
  }
  firstSeenDate = v44->_firstSeenDate;
  v44->_firstSeenDate = v42;
  v37 = v42;

  lastSeenDate = v44->_lastSeenDate;
  v44->_lastSeenDate = v13;
  v39 = v13;

  uint64_t v40 = [v21 firstObject];
  firstSeenDateWithoutOutliers = v44->_firstSeenDateWithoutOutliers;
  v44->_firstSeenDateWithoutOutliers = (NSDate *)v40;
}

- (void)_cacheDates
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PNPersonCluster *)self photoLibrary];
  double v4 = [(PNPersonCluster *)self backingMomentIdentifiers];
  uint64_t v5 = [v4 allObjects];
  unint64_t v6 = objc_msgSend(v3, "pn_fetchMomentsWithLocalIdentifiers:", v5);

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        long long v15 = objc_msgSend(v14, "startDate", (void)v23);
        if (!v11 || [(NSDate *)v11 compare:v15] == NSOrderedDescending)
        {
          long long v16 = v15;

          uint64_t v11 = v16;
        }
        v17 = [v14 endDate];
        if (!v10 || [(NSDate *)v10 compare:v17] == NSOrderedAscending)
        {
          uint64_t v18 = v17;

          id v10 = v18;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
    uint64_t v11 = 0;
  }

  firstSeenDate = self->_firstSeenDate;
  self->_firstSeenDate = v11;
  v20 = v11;

  lastSeenDate = self->_lastSeenDate;
  self->_lastSeenDate = v10;
  id v22 = v10;
}

- (id)firstSeenDateWithoutOutliersForAgeType:(unsigned __int16)a3
{
  firstSeenDateWithoutOutliers = self->_firstSeenDateWithoutOutliers;
  if (firstSeenDateWithoutOutliers) {
    goto LABEL_4;
  }
  if (a3 == 1)
  {
    [(PNPersonCluster *)self _cacheDatesWithoutOutliersWithMaximumDistanceBetweenMoments:15778800.0];
    firstSeenDateWithoutOutliers = self->_firstSeenDateWithoutOutliers;
LABEL_4:
    uint64_t v5 = firstSeenDateWithoutOutliers;
    goto LABEL_6;
  }
  uint64_t v5 = [(PNPersonCluster *)self firstSeenDate];
LABEL_6:
  return v5;
}

- (NSDate)lastSeenDate
{
  lastSeenDate = self->_lastSeenDate;
  if (!lastSeenDate)
  {
    [(PNPersonCluster *)self _cacheDates];
    lastSeenDate = self->_lastSeenDate;
  }
  return lastSeenDate;
}

- (NSDate)firstSeenDate
{
  firstSeenDate = self->_firstSeenDate;
  if (!firstSeenDate)
  {
    [(PNPersonCluster *)self _cacheDates];
    firstSeenDate = self->_firstSeenDate;
  }
  return firstSeenDate;
}

- (double)libraryTimespan
{
  firstSeenDate = self->_firstSeenDate;
  if (!firstSeenDate || (lastSeenDate = self->_lastSeenDate) == 0)
  {
    [(PNPersonCluster *)self _cacheDates];
    firstSeenDate = self->_firstSeenDate;
    lastSeenDate = self->_lastSeenDate;
  }
  [(NSDate *)lastSeenDate timeIntervalSinceDate:firstSeenDate];
  return result;
}

- (void)pn_addMergeCandidatePersons:(id)a3
{
  id v4 = a3;
  id v5 = [(PNPersonCluster *)self sourcePerson];
  objc_msgSend(v5, "pn_addMergeCandidatePersons:", v4);
}

- (NSString)anonymizedName
{
  uint64_t v3 = [(PNPersonCluster *)self sourcePerson];
  id v4 = [v3 anonymizedName];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(PNPersonCluster *)self localIdentifier];
  }
  id v7 = v6;

  return (NSString *)v7;
}

- (BOOL)hidden
{
  v2 = [(PNPersonCluster *)self sourcePerson];
  char v3 = [v2 hidden];

  return v3;
}

- (BOOL)favorite
{
  v2 = [(PNPersonCluster *)self sourcePerson];
  char v3 = [v2 favorite];

  return v3;
}

- (unint64_t)faceCount
{
  v2 = [(PNPersonCluster *)self backingFaceIdentifiers];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)setKeyFace:(id)a3
{
  id v4 = a3;
  id v5 = [(PNPersonCluster *)self sourcePerson];
  [v5 setKeyFace:v4];
}

- (PNFaceProtocol)keyFace
{
  v2 = [(PNPersonCluster *)self sourcePerson];
  unint64_t v3 = [v2 keyFace];

  return (PNFaceProtocol *)v3;
}

- (void)setManualOrder:(int64_t)a3
{
  id v4 = [(PNPersonCluster *)self sourcePerson];
  [v4 setManualOrder:a3];
}

- (int64_t)manualOrder
{
  v2 = [(PNPersonCluster *)self sourcePerson];
  int64_t v3 = [v2 manualOrder];

  return v3;
}

- (int64_t)verifiedType
{
  v2 = [(PNPersonCluster *)self sourcePerson];
  int64_t v3 = [v2 verifiedType];

  return v3;
}

- (void)setIsVerified:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PNPersonCluster *)self sourcePerson];
  [v4 setIsVerified:v3];
}

- (BOOL)isVerified
{
  v2 = [(PNPersonCluster *)self sourcePerson];
  char v3 = [v2 isVerified];

  return v3;
}

- (NSString)localIdentifier
{
  char v3 = [(PNPersonCluster *)self sourcePerson];
  id v4 = [v3 localIdentifier];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(PNPersonCluster *)self sourceFaceGroup];
    id v6 = [v7 localIdentifier];
  }
  return (NSString *)v6;
}

- (id)personLocalIdentifiers
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v3 = [(PNPersonCluster *)self sourceFaceGroup];

  if (v3)
  {
    context = (void *)MEMORY[0x25A2E0AC0]();
    id v4 = [(PNPersonCluster *)self fetchFaces];
    id v5 = [v4 fetchedObjectIDs];
    id v6 = [v4 photoLibrary];
    id v7 = [v6 librarySpecificFetchOptions];
    uint64_t v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"ANY detectedFaces in %@", v5];
    [v7 setInternalPredicate:v8];

    uint64_t v9 = [MEMORY[0x263F14E88] fetchPersonsWithOptions:v7];
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = [*(id *)(*((void *)&v23 + 1) + 8 * i) localIdentifier];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v13);
    }
  }
  else
  {
    v17 = [(PNPersonCluster *)self mergedPersonIdentifiers];
    if ([v17 count])
    {
      uint64_t v18 = [v17 allObjects];
      v19 = [(PNPersonCluster *)self localIdentifier];
      id v10 = [v18 arrayByAddingObject:v19];
    }
    else
    {
      v20 = [(PNPersonCluster *)self localIdentifier];
      uint64_t v27 = v20;
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
    }
  }
  return v10;
}

- (NSMutableSet)backingMomentIdentifiers
{
  backingMomentIdentifiers = self->_backingMomentIdentifiers;
  if (!backingMomentIdentifiers)
  {
    id v4 = (void *)MEMORY[0x25A2E0AC0](0, a2);
    id v5 = [(PNPersonCluster *)self fetchMoments];
    backingMomentIdentifiers = self->_backingMomentIdentifiers;
  }
  return backingMomentIdentifiers;
}

- (id)fetchMoments
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  char v3 = [(PNPersonCluster *)self photoLibrary];
  backingMomentIdentifiers = self->_backingMomentIdentifiers;
  if (backingMomentIdentifiers)
  {
    id v5 = [(NSMutableSet *)backingMomentIdentifiers allObjects];
    objc_msgSend(v3, "pn_fetchMomentsWithLocalIdentifiers:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = [(PNPersonCluster *)self backingAssetIdentifiers];
    uint64_t v8 = [v7 allObjects];

    uint64_t v9 = objc_msgSend(v3, "pn_fetchMomentsForAssetsWithLocalIdentifiers:", v8);
    id v10 = (NSMutableSet *)objc_opt_new();
    id v11 = self->_backingMomentIdentifiers;
    self->_backingMomentIdentifiers = v10;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v9;
    uint64_t v12 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v6);
          }
          long long v16 = self->_backingMomentIdentifiers;
          v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "localIdentifier", (void)v19);
          [(NSMutableSet *)v16 addObject:v17];
        }
        uint64_t v13 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
  return v6;
}

- (NSMutableSet)backingAssetIdentifiers
{
  backingAssetIdentifiers = self->_backingAssetIdentifiers;
  if (!backingAssetIdentifiers)
  {
    id v4 = (void *)MEMORY[0x25A2E0AC0](0, a2);
    id v5 = [(PNPersonCluster *)self fetchAssets];
    backingAssetIdentifiers = self->_backingAssetIdentifiers;
  }
  return backingAssetIdentifiers;
}

- (id)fetchAssets
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  char v3 = [(PNPersonCluster *)self photoLibrary];
  backingAssetIdentifiers = self->_backingAssetIdentifiers;
  if (backingAssetIdentifiers)
  {
    id v5 = [(NSMutableSet *)backingAssetIdentifiers allObjects];
    objc_msgSend(v3, "pn_fetchAssetsWithLocalIdentifiers:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = [(PNPersonCluster *)self backingFaceIdentifiers];
    uint64_t v8 = objc_msgSend(v3, "pn_fetchAssetsForFaceLocalIdentifiers:", v7);

    uint64_t v9 = (NSMutableSet *)objc_opt_new();
    id v10 = self->_backingAssetIdentifiers;
    self->_backingAssetIdentifiers = v9;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v8;
    uint64_t v11 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v6);
          }
          long long v15 = self->_backingAssetIdentifiers;
          long long v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "localIdentifier", (void)v20);
          [(NSMutableSet *)v15 addObject:v16];
        }
        uint64_t v12 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    v17 = (NSSet *)[(NSMutableSet *)self->_backingAssetIdentifiers copy];
    sourcePersonBackingAssetIdentifiers = self->_sourcePersonBackingAssetIdentifiers;
    self->_sourcePersonBackingAssetIdentifiers = v17;
  }
  return v6;
}

- (NSMutableSet)backingFaceIdentifiers
{
  backingFaceIdentifiers = self->_backingFaceIdentifiers;
  if (!backingFaceIdentifiers)
  {
    id v4 = (void *)MEMORY[0x25A2E0AC0](0, a2);
    id v5 = [(PNPersonCluster *)self fetchFaces];
    backingFaceIdentifiers = self->_backingFaceIdentifiers;
  }
  return backingFaceIdentifiers;
}

- (id)fetchFaces
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  char v3 = [(PNPersonCluster *)self photoLibrary];
  backingFaceIdentifiers = self->_backingFaceIdentifiers;
  if (backingFaceIdentifiers)
  {
    id v5 = [(NSMutableSet *)backingFaceIdentifiers allObjects];
    objc_msgSend(v3, "pn_fetchFacesWithLocalIdentifiers:", v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = [(PNPersonCluster *)self sourcePerson];
    if (v7)
    {
      uint64_t v8 = objc_msgSend(v3, "pn_fetchFacesForPerson:", v7);
    }
    else
    {
      uint64_t v9 = [(PNPersonCluster *)self sourceFaceGroup];
      uint64_t v8 = objc_msgSend(v3, "pn_fetchFacesForFaceGroup:", v9);
    }
    id v10 = (NSMutableSet *)objc_opt_new();
    uint64_t v11 = self->_backingFaceIdentifiers;
    self->_backingFaceIdentifiers = v10;

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v8;
    uint64_t v12 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v6);
          }
          long long v16 = self->_backingFaceIdentifiers;
          v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "localIdentifier", (void)v19);
          [(NSMutableSet *)v16 addObject:v17];
        }
        uint64_t v13 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }
  return v6;
}

- (NSString)description
{
  char v3 = (void *)MEMORY[0x263F089D8];
  id v4 = [(PNPersonCluster *)self localIdentifier];
  id v5 = [v3 stringWithFormat:@"[%@]", v4];

  id v6 = [(PNPersonCluster *)self sourcePerson];
  id v7 = [v6 anonymizedName];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    uint64_t v9 = [(PNPersonCluster *)self sourcePerson];
    id v10 = [v9 anonymizedName];
    [v5 appendFormat:@" Name: %@,", v10];
  }
  unint64_t v11 = [(PNPersonCluster *)self faceCount];
  uint64_t v12 = [(PNPersonCluster *)self backingMomentIdentifiers];
  uint64_t v13 = [v12 count];
  uint64_t v14 = [(PNPersonCluster *)self backingAssetIdentifiers];
  uint64_t v15 = [v14 count];
  long long v16 = [(PNPersonCluster *)self mergedPersonIdentifiers];
  [v5 appendFormat:@" Faces: %lu, Moments: %lu, Assets: %lu, Merges: %lu, VerifiedType: %d", v11, v13, v15, objc_msgSend(v16, "count"), -[PNPersonCluster verifiedType](self, "verifiedType")];

  v17 = [(PNPersonCluster *)self mergedPersonIdentifiers];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    long long v19 = [(PNPersonCluster *)self mergedPersonIdentifiers];
    long long v20 = [v19 allObjects];
    long long v21 = [v20 componentsJoinedByString:@", "];
    [v5 appendFormat:@", Merged Persons: [%@]", v21];
  }
  [(PNPersonCluster *)self interestingScore];
  if (v22 >= 0.0)
  {
    double v23 = v22;
    BOOL v24 = [(PNPersonCluster *)self highlyInteresting];
    uint64_t v25 = @"Interesting";
    if (v24) {
      uint64_t v25 = @"Highly Interesting";
    }
    [v5 appendFormat:@", %@: %.5f", v25, *(void *)&v23];
  }
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (PNPersonCluster *)a3;
  if (self == v6)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(PNPersonCluster *)self sourcePerson];
      if (v7)
      {
        char v3 = [(PNPersonCluster *)v6 sourcePerson];
        if (v3)
        {
          uint64_t v8 = [(PNPersonCluster *)self sourcePerson];
          id v4 = [(PNPersonCluster *)v6 sourcePerson];
          if ([v8 isEqual:v4])
          {

            char v9 = 1;
            goto LABEL_17;
          }
          uint64_t v18 = v8;
          int v10 = 1;
        }
        else
        {
          int v10 = 0;
        }
      }
      else
      {
        int v10 = 0;
      }
      uint64_t v11 = [(PNPersonCluster *)self sourceFaceGroup];
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        uint64_t v13 = [(PNPersonCluster *)v6 sourceFaceGroup];
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          uint64_t v15 = [(PNPersonCluster *)self sourceFaceGroup];
          long long v16 = [(PNPersonCluster *)v6 sourceFaceGroup];
          char v9 = [v15 isEqual:v16];

          if ((v10 & 1) == 0) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }

        char v9 = 0;
        if ((v10 & 1) == 0)
        {
LABEL_16:
          if (!v7)
          {
LABEL_18:

            goto LABEL_19;
          }
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
        char v9 = 0;
        if (!v10) {
          goto LABEL_16;
        }
      }
LABEL_15:

      goto LABEL_16;
    }
    char v9 = 0;
  }
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (PNPersonCluster)initWithFaceGroup:(id)a3 inPhotoLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PNPersonCluster;
  uint64_t v8 = [(PNPersonCluster *)&v13 init];
  char v9 = v8;
  if (v8)
  {
    [(PNPersonCluster *)v8 setSourceFaceGroup:v6];
    [(PNPersonCluster *)v9 setPhotoLibrary:v7];
    int v10 = [v6 localIdentifier];
    v9->_hash = [v10 hash];

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    [(PNPersonCluster *)v9 setBackingFaceIdentifiersByMomentIdentifiers:v11];

    v9->_detectionType = 1;
  }

  return v9;
}

- (PNPersonCluster)initWithPerson:(id)a3 inPhotoLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PNPersonCluster;
  char v9 = [(PNPersonCluster *)&v16 init];
  if (v9)
  {
    int v10 = objc_opt_class();
    if ([v10 isEqual:objc_opt_class()])
    {
      uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
      [v15 handleFailureInMethod:a2 object:v9 file:@"PNPersonCluster.m" lineNumber:64 description:@"Cannot create a person cluster with another person cluster"];
    }
    [(PNPersonCluster *)v9 setSourcePerson:v7];
    [(PNPersonCluster *)v9 setPhotoLibrary:v8];
    uint64_t v11 = [v7 localIdentifier];
    v9->_hash = [v11 hash];

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    [(PNPersonCluster *)v9 setBackingFaceIdentifiersByMomentIdentifiers:v12];

    objc_super v13 = [MEMORY[0x263EFF9A0] dictionary];
    [(PNPersonCluster *)v9 setRepresentativeFaceByFaceIdentifiers:v13];

    v9->_detectionType = [v7 detectionType];
    [(PNPersonCluster *)v9 invalidateCaches];
  }

  return v9;
}

@end