@interface PLPhotosHighlight
+ (NSArray)sortByTimeSortDescriptors;
+ (id)_libraryScopePredicateForSharingConsideration:(int64_t)a3;
+ (id)_predicateForHighlightsOfKind:(unsigned __int16)a3;
+ (id)allPhotosHighlightsInManagedObjectContext:(id)a3 predicate:(id)a4 keyPathsForPrefetching:(id)a5 error:(id *)a6;
+ (id)allowedPropertiesForMomentList;
+ (id)batchFetchPhotosHighlightUUIDsByAssetUUIDsWithAssetUUIDs:(id)a3 library:(id)a4 error:(id *)a5;
+ (id)batchFetchPhotosHighlightUUIDsByMomentUUIDsWithMomentUUIDs:(id)a3 library:(id)a4 error:(id *)a5;
+ (id)batchFetchTripHighlightUUIDsByAssetUUIDsWithAssetUUIDs:(id)a3 library:(id)a4 error:(id *)a5;
+ (id)defaultPropertiesToFetchForMomentList;
+ (id)entityName;
+ (id)fetchHighlightsWithUUIDs:(id)a3 managedObjectContext:(id)a4;
+ (id)fetchRequest;
+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4 title:(id)a5;
+ (id)insertNewPhotosHighlightInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier:(int64_t)a3;
+ (id)predicateForAllAssetsInPhotosHighlight:(id)a3;
+ (id)predicateForAllTripHighlights;
+ (id)predicateForEmptyHighlightsOfKind:(unsigned __int16)a3;
+ (id)predicateForInvalidDayGroupHighlights;
+ (id)predicateForInvalidDayHighlights;
+ (id)predicateForInvalidHighlightsOfAllKinds;
+ (id)predicateForInvalidMonthOrYearHighlights;
+ (id)propertiesToFetch;
+ (id)relationshipKeyPathsToPrefetch;
+ (id)stringFromHighlightKind:(unsigned __int16)a3;
+ (signed)calculateSharingCompositionForPhotosHighlight:(id)a3;
- (BOOL)_needsRecalculateCollageAssets;
- (BOOL)isEligibleForSearchIndexing;
- (BOOL)isRecent;
- (BOOL)missingKeyAssetForKindPrivate;
- (BOOL)missingKeyAssetForKindShared;
- (NSArray)momentsSortedByTime;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (NSSet)assetsPrivate;
- (NSSet)assetsShared;
- (NSSet)dayGroupAssetsPrivate;
- (NSSet)dayGroupAssetsShared;
- (NSSet)dayGroupExtendedAssetsPrivate;
- (NSSet)dayGroupExtendedAssetsShared;
- (NSSet)dayGroupSummaryAssetsPrivate;
- (NSSet)dayGroupSummaryAssetsShared;
- (NSSet)extendedAssetsPrivate;
- (NSSet)extendedAssetsShared;
- (NSSet)summaryAssetsPrivate;
- (NSSet)summaryAssetsShared;
- (NSString)debugDescription;
- (NSString)description;
- (PLManagedAsset)keyAssetForKindPrivate;
- (PLManagedAsset)keyAssetForKindShared;
- (id)_extendedAssetsForSharingConsideration:(int64_t)a3;
- (id)_keyAssetForSharingConsideration:(int64_t)a3;
- (int)_cachedAssetCountForCountKey:(id)a3 collectionKey:(id)a4 isShared:(BOOL)a5;
- (int)_cachedSharedAssetContainerValueWithRecalcIfNeededForKey:(id)a3;
- (int)assetsCount;
- (int)assetsCountPrivate;
- (int)assetsCountShared;
- (int)dayGroupAssetsCount;
- (int)dayGroupAssetsCountPrivate;
- (int)dayGroupAssetsCountShared;
- (int)dayGroupExtendedAssetsCount;
- (int)dayGroupExtendedAssetsCountPrivate;
- (int)dayGroupExtendedAssetsCountShared;
- (int)dayGroupSummaryAssetsCount;
- (int)dayGroupSummaryAssetsCountPrivate;
- (int)dayGroupSummaryAssetsCountShared;
- (int)extendedCount;
- (int)extendedCountPrivate;
- (int)extendedCountShared;
- (int)photoAssetsSuggestedByPhotosCount;
- (int)summaryCount;
- (int)summaryCountPrivate;
- (int)summaryCountShared;
- (int)videoAssetsSuggestedByPhotosCount;
- (signed)sharingComposition;
- (unint64_t)numberOfAssetsInExtendedForSharingConsideration:(int64_t)a3;
- (void)_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:(int)a3 to:(int)a4 forKeyPath:(id)a5;
- (void)_notifyChildSharingCompositionDidChangeFrom:(signed __int16)a3 to:(signed __int16)a4;
- (void)_recalculateCollageAssetsForSharingConsideration:(int64_t)a3;
- (void)awakeFromInsert;
- (void)bumpHighlightVersion;
- (void)delete;
- (void)prepareForDeletion;
- (void)recalculateCollageAssets;
- (void)recalculateSharedAssetContainerCachedValues;
- (void)removeAssetData:(id)a3;
- (void)reportSharedAssetContainerIncrementalChange:(id)a3 forAllAssetsCountKey:(id)a4;
- (void)setAssets:(id)a3;
- (void)setDayGroupAssets:(id)a3;
- (void)setDayGroupExtendedAssets:(id)a3;
- (void)setDayGroupSummaryAssets:(id)a3;
- (void)setExtendedAssets:(id)a3;
- (void)setKeyAssetForKindPrivate:(id)a3;
- (void)setKeyAssetForKindShared:(id)a3;
- (void)setParentPhotosHighlight:(id)a3;
- (void)setSummaryAssets:(id)a3;
- (void)willSave;
@end

@implementation PLPhotosHighlight

+ (id)predicateForAllTripHighlights
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28BA0];
  v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %u OR %K = %u OR %K = %u", @"type", 1, @"type", 2, @"type", 4);
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = [v2 andPredicateWithSubpredicates:v4];

  return v5;
}

- (BOOL)isRecent
{
  return [(PLPhotosHighlight *)self category] == 1;
}

- (unint64_t)numberOfAssetsInExtendedForSharingConsideration:(int64_t)a3
{
  int v5 = [(PLPhotosHighlight *)self kind];
  if (v5 == 3)
  {
    switch(a3)
    {
      case 2:
        LODWORD(result) = [(PLPhotosHighlight *)self dayGroupExtendedAssetsCount];
        return (int)result;
      case 1:
        LODWORD(result) = [(PLPhotosHighlight *)self dayGroupExtendedAssetsCountShared];
        return (int)result;
      case 0:
        LODWORD(result) = [(PLPhotosHighlight *)self dayGroupExtendedAssetsCountPrivate];
        return (int)result;
    }
    return 0;
  }
  if (v5) {
    return 0;
  }
  if (a3 == 2)
  {
    LODWORD(result) = [(PLPhotosHighlight *)self extendedCount];
    return (int)result;
  }
  if (a3 == 1)
  {
    LODWORD(result) = [(PLPhotosHighlight *)self extendedCountShared];
    return (int)result;
  }
  if (a3) {
    return 0;
  }
  LODWORD(result) = [(PLPhotosHighlight *)self extendedCountPrivate];
  return (int)result;
}

- (NSSet)dayGroupSummaryAssetsShared
{
  v2 = [(PLPhotosHighlight *)self dayGroupSummaryAssets];
  v3 = [(id)objc_opt_class() _libraryScopePredicateForSharingConsideration:1];
  v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (NSSet)dayGroupExtendedAssetsShared
{
  v2 = [(PLPhotosHighlight *)self dayGroupExtendedAssets];
  v3 = [(id)objc_opt_class() _libraryScopePredicateForSharingConsideration:1];
  v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (NSSet)dayGroupAssetsShared
{
  v2 = [(PLPhotosHighlight *)self dayGroupAssets];
  v3 = [(id)objc_opt_class() _libraryScopePredicateForSharingConsideration:1];
  v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (NSSet)extendedAssetsShared
{
  v2 = [(PLPhotosHighlight *)self extendedAssets];
  v3 = [(id)objc_opt_class() _libraryScopePredicateForSharingConsideration:1];
  v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (NSSet)summaryAssetsShared
{
  v2 = [(PLPhotosHighlight *)self summaryAssets];
  v3 = [(id)objc_opt_class() _libraryScopePredicateForSharingConsideration:1];
  v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (NSSet)assetsShared
{
  v2 = [(PLPhotosHighlight *)self assets];
  v3 = [(id)objc_opt_class() _libraryScopePredicateForSharingConsideration:1];
  v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (void)setKeyAssetForKindShared:(id)a3
{
  id v4 = a3;
  switch([(PLPhotosHighlight *)self kind])
  {
    case 0u:
      [(PLPhotosHighlight *)self setKeyAssetShared:v4];
      break;
    case 1u:
      [(PLPhotosHighlight *)self setMonthKeyAssetShared:v4];
      break;
    case 2u:
      [(PLPhotosHighlight *)self setYearKeyAssetShared:v4];
      break;
    case 3u:
      [(PLPhotosHighlight *)self setDayGroupKeyAssetShared:v4];
      break;
    default:
      break;
  }
}

- (PLManagedAsset)keyAssetForKindShared
{
  switch([(PLPhotosHighlight *)self kind])
  {
    case 0u:
      v3 = [(PLPhotosHighlight *)self keyAssetShared];
      break;
    case 1u:
      v3 = [(PLPhotosHighlight *)self monthKeyAssetShared];
      break;
    case 2u:
      v3 = [(PLPhotosHighlight *)self yearKeyAssetShared];
      break;
    case 3u:
      v3 = [(PLPhotosHighlight *)self dayGroupKeyAssetShared];
      break;
    default:
      v3 = 0;
      break;
  }
  return (PLManagedAsset *)v3;
}

- (NSSet)dayGroupSummaryAssetsPrivate
{
  v2 = [(PLPhotosHighlight *)self dayGroupSummaryAssets];
  v3 = [(id)objc_opt_class() _libraryScopePredicateForSharingConsideration:0];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (NSSet)dayGroupExtendedAssetsPrivate
{
  v2 = [(PLPhotosHighlight *)self dayGroupExtendedAssets];
  v3 = [(id)objc_opt_class() _libraryScopePredicateForSharingConsideration:0];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (NSSet)dayGroupAssetsPrivate
{
  v2 = [(PLPhotosHighlight *)self dayGroupAssets];
  v3 = [(id)objc_opt_class() _libraryScopePredicateForSharingConsideration:0];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (NSSet)extendedAssetsPrivate
{
  v2 = [(PLPhotosHighlight *)self extendedAssets];
  v3 = [(id)objc_opt_class() _libraryScopePredicateForSharingConsideration:0];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (NSSet)summaryAssetsPrivate
{
  v2 = [(PLPhotosHighlight *)self summaryAssets];
  v3 = [(id)objc_opt_class() _libraryScopePredicateForSharingConsideration:0];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (NSSet)assetsPrivate
{
  v2 = [(PLPhotosHighlight *)self assets];
  v3 = [(id)objc_opt_class() _libraryScopePredicateForSharingConsideration:0];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (BOOL)missingKeyAssetForKindPrivate
{
  if ([(PLPhotosHighlight *)self sharingComposition] == 1) {
    return 0;
  }
  id v4 = [(PLPhotosHighlight *)self keyAssetForKindPrivate];
  BOOL v3 = v4 == 0;

  return v3;
}

- (BOOL)missingKeyAssetForKindShared
{
  if (![(PLPhotosHighlight *)self sharingComposition]) {
    return 0;
  }
  BOOL v3 = [(PLPhotosHighlight *)self keyAssetForKindShared];
  BOOL v4 = v3 == 0;

  return v4;
}

- (NSDate)localEndDate
{
  BOOL v3 = [(PLPhotosHighlight *)self endDate];
  BOOL v4 = objc_msgSend(v3, "dateByAddingTimeInterval:", (double)(int)-[PLPhotosHighlight endTimeZoneOffset](self, "endTimeZoneOffset"));

  return (NSDate *)v4;
}

- (NSDate)localStartDate
{
  BOOL v3 = [(PLPhotosHighlight *)self startDate];
  BOOL v4 = objc_msgSend(v3, "dateByAddingTimeInterval:", (double)(int)-[PLPhotosHighlight startTimeZoneOffset](self, "startTimeZoneOffset"));

  return (NSDate *)v4;
}

- (void)setKeyAssetForKindPrivate:(id)a3
{
  id v4 = a3;
  switch([(PLPhotosHighlight *)self kind])
  {
    case 0u:
      [(PLPhotosHighlight *)self setKeyAssetPrivate:v4];
      break;
    case 1u:
      [(PLPhotosHighlight *)self setMonthKeyAssetPrivate:v4];
      break;
    case 2u:
      [(PLPhotosHighlight *)self setYearKeyAssetPrivate:v4];
      break;
    case 3u:
      [(PLPhotosHighlight *)self setDayGroupKeyAssetPrivate:v4];
      break;
    default:
      break;
  }
}

- (PLManagedAsset)keyAssetForKindPrivate
{
  switch([(PLPhotosHighlight *)self kind])
  {
    case 0u:
      BOOL v3 = [(PLPhotosHighlight *)self keyAssetPrivate];
      break;
    case 1u:
      BOOL v3 = [(PLPhotosHighlight *)self monthKeyAssetPrivate];
      break;
    case 2u:
      BOOL v3 = [(PLPhotosHighlight *)self yearKeyAssetPrivate];
      break;
    case 3u:
      BOOL v3 = [(PLPhotosHighlight *)self dayGroupKeyAssetPrivate];
      break;
    default:
      BOOL v3 = 0;
      break;
  }
  return (PLManagedAsset *)v3;
}

- (NSArray)momentsSortedByTime
{
  v2 = [(PLPhotosHighlight *)self moments];
  BOOL v3 = +[PLMoment sortByTimeSortDescriptors];
  id v4 = [v2 sortedArrayUsingDescriptors:v3];

  return (NSArray *)v4;
}

- (void)delete
{
  id v3 = [(PLPhotosHighlight *)self managedObjectContext];
  [v3 deleteObject:self];
}

- (void)removeAssetData:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLPhotosHighlight.m", 1399, @"Incorrect class given in %s", "-[PLPhotosHighlight removeAssetData:]");
  }
  [(PLPhotosHighlight *)self willChangeValueForKey:@"assets"];
  int v5 = [(PLPhotosHighlight *)self primitiveAssets];
  [v5 removeObject:v7];

  [(PLPhotosHighlight *)self didChangeValueForKey:@"assets"];
}

- (void)bumpHighlightVersion
{
  if (![(PLPhotosHighlight *)self hasChanges]
    || ([(PLPhotosHighlight *)self changedValues],
        id v3 = objc_claimAutoreleasedReturnValue(),
        [v3 objectForKeyedSubscript:@"highlightVersion"],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    int v5 = [(PLPhotosHighlight *)self highlightVersion];
    if (v5 == 0x7FFF) {
      __int16 v6 = 0;
    }
    else {
      __int16 v6 = v5 + 1;
    }
    [(PLPhotosHighlight *)self setHighlightVersion:v6];
  }
}

- (id)_extendedAssetsForSharingConsideration:(int64_t)a3
{
  if (a3 == 2)
  {
    id v3 = [(PLPhotosHighlight *)self extendedAssets];
  }
  else if (a3 == 1)
  {
    id v3 = [(PLPhotosHighlight *)self extendedAssetsShared];
  }
  else
  {
    if (a3) {
      [MEMORY[0x1E4F1CAD0] set];
    }
    else {
    id v3 = [(PLPhotosHighlight *)self extendedAssetsPrivate];
    }
  }
  return v3;
}

- (id)_keyAssetForSharingConsideration:(int64_t)a3
{
  if (a3 != 2)
  {
    if (a3 != 1)
    {
      if (a3) {
        goto LABEL_9;
      }
LABEL_6:
      int v5 = [(PLPhotosHighlight *)self keyAssetForKindPrivate];
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  unsigned int v4 = [(PLPhotosHighlight *)self mixedSharingCompositionKeyAssetRelationship];
  if (v4 < 2) {
    goto LABEL_6;
  }
  if (v4 == 2)
  {
LABEL_8:
    int v5 = [(PLPhotosHighlight *)self keyAssetForKindShared];
    goto LABEL_10;
  }
LABEL_9:
  int v5 = 0;
LABEL_10:
  return v5;
}

- (void)_recalculateCollageAssetsForSharingConsideration:(int64_t)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  __int16 v6 = [(PLPhotosHighlight *)self _extendedAssetsForSharingConsideration:a3];
  if ((unint64_t)[v6 count] >= 4)
  {
    id v7 = [(PLPhotosHighlight *)self _keyAssetForSharingConsideration:a3];
    if (v7)
    {
      [v5 addObject:v7];
      v8 = (void *)[v6 mutableCopy];
      [v8 removeObject:v7];

      __int16 v6 = v8;
    }
    v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
    v22[0] = v9;
    v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"objectID" ascending:1];
    v22[1] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    v12 = [v6 sortedArrayUsingDescriptors:v11];

    unint64_t v13 = [v12 count];
    if (v13)
    {
      unint64_t v14 = v13;
      unint64_t v15 = 3;
      if (!v7) {
        unint64_t v15 = 4;
      }
      if (v13 <= v15)
      {
        [v5 addObjectsFromArray:v12];
      }
      else
      {
        v21 = self;
        uint64_t v16 = 0;
        unint64_t v17 = vcvtmd_u64_f64((double)v13 / ((double)v15 + -1.0));
        unint64_t v18 = v15 - 1;
        do
        {
          v19 = objc_msgSend(v12, "objectAtIndexedSubscript:", v16, v21);
          [v5 addObject:v19];

          v16 += v17;
          --v18;
        }
        while (v18);
        v20 = [v12 objectAtIndexedSubscript:v14 - 1];
        [v5 addObject:v20];

        self = v21;
      }
    }
  }
  if ((unint64_t)a3 <= 2) {
    [(PLManagedObject *)self pl_safeSetValue:v5 forKey:off_1E5863398[a3] valueDidChangeHandler:0];
  }
}

- (void)recalculateCollageAssets
{
  [(PLPhotosHighlight *)self _recalculateCollageAssetsForSharingConsideration:0];
  [(PLPhotosHighlight *)self _recalculateCollageAssetsForSharingConsideration:1];
  [(PLPhotosHighlight *)self _recalculateCollageAssetsForSharingConsideration:2];
}

- (BOOL)_needsRecalculateCollageAssets
{
  id v3 = [(PLPhotosHighlight *)self changedValues];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"collageAssetsPrivate"];
  if (v4
    || ([v3 objectForKeyedSubscript:@"collageAssetsShared"],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = (void *)v4;
    BOOL v6 = 0;
  }
  else
  {
    v8 = [v3 objectForKeyedSubscript:@"collageAssetsMixed"];

    if (v8 || ([(PLPhotosHighlight *)self isDeleted] & 1) != 0)
    {
      BOOL v6 = 0;
      goto LABEL_5;
    }
    id v5 = [v3 objectForKey:@"extendedAssets"];
    if (v5)
    {
      BOOL v6 = 1;
    }
    else
    {
      v9 = [v3 objectForKey:@"keyAssetPrivate"];
      if (v9)
      {
        BOOL v6 = 1;
      }
      else
      {
        v10 = [v3 objectForKey:@"keyAssetShared"];
        BOOL v6 = v10 != 0;
      }
    }
  }

LABEL_5:
  return v6;
}

- (void)willSave
{
  v5.receiver = self;
  v5.super_class = (Class)PLPhotosHighlight;
  [(PLManagedObject *)&v5 willSave];
  id v3 = [(PLPhotosHighlight *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (*((unsigned char *)&self->super._willSaveCallCount + 2) && ([(PLPhotosHighlight *)self isDeleted] & 1) == 0) {
      [(PLPhotosHighlight *)self recalculateSharedAssetContainerCachedValues];
    }
    if (PLPlatformSearchSupported())
    {
      uint64_t v4 = [v3 delayedSaveActions];
      [v4 recordHighlightForSearchIndexUpdate:self];
    }
    if (([(PLPhotosHighlight *)self isDeleted] & 1) == 0) {
      +[PLDelayedSearchIndexUpdates recordHighlightIfNeeded:self];
    }
    if (_os_feature_enabled_impl()
      && ![(PLPhotosHighlight *)self kind]
      && [(PLPhotosHighlight *)self _needsRecalculateCollageAssets])
    {
      [(PLPhotosHighlight *)self recalculateCollageAssets];
    }
  }
}

- (void)prepareForDeletion
{
  v5.receiver = self;
  v5.super_class = (Class)PLPhotosHighlight;
  [(PLManagedObject *)&v5 prepareForDeletion];
  objc_opt_class();
  id v3 = [(PLPhotosHighlight *)self managedObjectContext];
  if (objc_opt_isKindOfClass()) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }

  if (v4) {
    +[PLDelayedSearchIndexUpdates recordHighlightIfNeeded:self];
  }
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)PLPhotosHighlight;
  [(PLPhotosHighlight *)&v4 awakeFromInsert];
  id v3 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLPhotosHighlight *)self setUuid:v3];
}

- (void)setDayGroupExtendedAssets:(id)a3
{
  *((unsigned char *)&self->super._willSaveCallCount + 2) = 1;
  [(PLManagedObject *)self pl_safeSetValue:a3 forKey:@"dayGroupExtendedAssets" valueDidChangeHandler:0];
}

- (void)setDayGroupSummaryAssets:(id)a3
{
  *((unsigned char *)&self->super._willSaveCallCount + 2) = 1;
  [(PLManagedObject *)self pl_safeSetValue:a3 forKey:@"dayGroupSummaryAssets" valueDidChangeHandler:0];
}

- (void)setDayGroupAssets:(id)a3
{
  *((unsigned char *)&self->super._willSaveCallCount + 2) = 1;
  [(PLManagedObject *)self pl_safeSetValue:a3 forKey:@"dayGroupAssets" valueDidChangeHandler:0];
}

- (void)setExtendedAssets:(id)a3
{
  *((unsigned char *)&self->super._willSaveCallCount + 2) = 1;
  [(PLManagedObject *)self pl_safeSetValue:a3 forKey:@"extendedAssets" valueDidChangeHandler:0];
}

- (void)setSummaryAssets:(id)a3
{
  *((unsigned char *)&self->super._willSaveCallCount + 2) = 1;
  [(PLManagedObject *)self pl_safeSetValue:a3 forKey:@"summaryAssets" valueDidChangeHandler:0];
}

- (void)setAssets:(id)a3
{
  *((unsigned char *)&self->super._willSaveCallCount + 2) = 1;
  [(PLManagedObject *)self pl_safeSetValue:a3 forKey:@"assets" valueDidChangeHandler:0];
}

- (void)setParentPhotosHighlight:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqual:self])
  {
    objc_super v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_FAULT, "Attempt to set parentPhotosHighlight to self for highlight: %{public}@", buf, 0xCu);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __46__PLPhotosHighlight_setParentPhotosHighlight___block_invoke;
  v7[3] = &unk_1E5870818;
  id v8 = v4;
  id v6 = v4;
  [(PLManagedObject *)self pl_safeSetValue:v6 forKey:@"parentPhotosHighlight" valueDidChangeHandler:v7];
}

uint64_t __46__PLPhotosHighlight_setParentPhotosHighlight___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) recalculateSharedAssetContainerCachedValues];
}

- (int)dayGroupSummaryAssetsCountPrivate
{
  int v3 = [(PLPhotosHighlight *)self dayGroupSummaryAssetsCount];
  return v3 - [(PLPhotosHighlight *)self dayGroupSummaryAssetsCountShared];
}

- (int)dayGroupExtendedAssetsCountPrivate
{
  int v3 = [(PLPhotosHighlight *)self dayGroupExtendedAssetsCount];
  return v3 - [(PLPhotosHighlight *)self dayGroupExtendedAssetsCountShared];
}

- (int)dayGroupAssetsCountPrivate
{
  int v3 = [(PLPhotosHighlight *)self dayGroupAssetsCount];
  return v3 - [(PLPhotosHighlight *)self dayGroupAssetsCountShared];
}

- (int)extendedCountPrivate
{
  int v3 = [(PLPhotosHighlight *)self extendedCount];
  return v3 - [(PLPhotosHighlight *)self extendedCountShared];
}

- (int)summaryCountPrivate
{
  int v3 = [(PLPhotosHighlight *)self summaryCount];
  return v3 - [(PLPhotosHighlight *)self summaryCountShared];
}

- (int)videoAssetsSuggestedByPhotosCount
{
  return [(PLPhotosHighlight *)self _cachedSharedAssetContainerValueWithRecalcIfNeededForKey:@"videoAssetsSuggestedByPhotosCount"];
}

- (int)photoAssetsSuggestedByPhotosCount
{
  return [(PLPhotosHighlight *)self _cachedSharedAssetContainerValueWithRecalcIfNeededForKey:@"photoAssetsSuggestedByPhotosCount"];
}

- (signed)sharingComposition
{
  return [(PLPhotosHighlight *)self _cachedSharedAssetContainerValueWithRecalcIfNeededForKey:@"sharingComposition"];
}

- (int)dayGroupSummaryAssetsCountShared
{
  return [(PLPhotosHighlight *)self _cachedAssetCountForCountKey:@"dayGroupSummaryAssetsCountShared" collectionKey:@"dayGroupSummaryAssets" isShared:1];
}

- (int)dayGroupExtendedAssetsCountShared
{
  return [(PLPhotosHighlight *)self _cachedAssetCountForCountKey:@"dayGroupExtendedAssetsCountShared" collectionKey:@"dayGroupExtendedAssets" isShared:1];
}

- (int)dayGroupAssetsCountShared
{
  return [(PLPhotosHighlight *)self _cachedAssetCountForCountKey:@"dayGroupAssetsCountShared" collectionKey:@"dayGroupAssets" isShared:1];
}

- (int)summaryCountShared
{
  return [(PLPhotosHighlight *)self _cachedAssetCountForCountKey:@"summaryCountShared" collectionKey:@"summaryAssets" isShared:1];
}

- (int)extendedCountShared
{
  return [(PLPhotosHighlight *)self _cachedAssetCountForCountKey:@"extendedCountShared" collectionKey:@"extendedAssets" isShared:1];
}

- (int)assetsCountShared
{
  return [(PLPhotosHighlight *)self _cachedAssetCountForCountKey:@"assetsCountShared" collectionKey:@"assets" isShared:1];
}

- (int)dayGroupSummaryAssetsCount
{
  return [(PLPhotosHighlight *)self _cachedAssetCountForCountKey:@"dayGroupSummaryAssetsCount" collectionKey:@"dayGroupSummaryAssets" isShared:0];
}

- (int)dayGroupExtendedAssetsCount
{
  return [(PLPhotosHighlight *)self _cachedAssetCountForCountKey:@"dayGroupExtendedAssetsCount" collectionKey:@"dayGroupExtendedAssets" isShared:0];
}

- (int)dayGroupAssetsCount
{
  return [(PLPhotosHighlight *)self _cachedAssetCountForCountKey:@"dayGroupAssetsCount" collectionKey:@"dayGroupAssets" isShared:0];
}

- (int)summaryCount
{
  return [(PLPhotosHighlight *)self _cachedAssetCountForCountKey:@"summaryCount" collectionKey:@"summaryAssets" isShared:0];
}

- (int)extendedCount
{
  return [(PLPhotosHighlight *)self _cachedAssetCountForCountKey:@"extendedCount" collectionKey:@"extendedAssets" isShared:0];
}

- (int)assetsCount
{
  return [(PLPhotosHighlight *)self _cachedAssetCountForCountKey:@"assetsCount" collectionKey:@"assets" isShared:0];
}

- (int)_cachedSharedAssetContainerValueWithRecalcIfNeededForKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLPhotosHighlight.m", 820, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (*((unsigned char *)&self->super._willSaveCallCount + 2)) {
    [(PLPhotosHighlight *)self recalculateSharedAssetContainerCachedValues];
  }
  [(PLPhotosHighlight *)self willAccessValueForKey:v5];
  id v6 = [(PLPhotosHighlight *)self primitiveValueForKey:v5];
  int v7 = [v6 intValue];

  [(PLPhotosHighlight *)self didAccessValueForKey:v5];
  return v7;
}

- (int)_cachedAssetCountForCountKey:(id)a3 collectionKey:(id)a4 isShared:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(PLPhotosHighlight *)self hasFaultForRelationshipNamed:v9])
  {
    if (*((unsigned char *)&self->super._willSaveCallCount + 2)) {
      [(PLPhotosHighlight *)self recalculateSharedAssetContainerCachedValues];
    }
    [(PLPhotosHighlight *)self willAccessValueForKey:v8];
    id v10 = [(PLPhotosHighlight *)self primitiveValueForKey:v8];
    LODWORD(v11) = [v10 intValue];

    [(PLPhotosHighlight *)self didAccessValueForKey:v8];
  }
  else
  {
    if (v5)
    {
      v12 = [(PLPhotosHighlight *)self valueForKey:v9];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        LODWORD(v11) = 0;
        uint64_t v15 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v11 = v11
                + [*(id *)(*((void *)&v26 + 1) + 8 * i) hasLibraryScope];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v14);
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      v12 = [(PLPhotosHighlight *)self objectIDsForRelationshipNamed:v9];
      uint64_t v11 = [v12 count];
    }

    if (PLIsAssetsd())
    {
      unint64_t v17 = [(PLPhotosHighlight *)self objectID];
      unint64_t v18 = [NSNumber numberWithInt:v11];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __73__PLPhotosHighlight__cachedAssetCountForCountKey_collectionKey_isShared___block_invoke;
      v21[3] = &unk_1E5863258;
      id v22 = v17;
      int v25 = v11;
      id v23 = v8;
      v24 = self;
      id v19 = v17;
      [(PLManagedObject *)self pl_safeSetValue:v18 forKey:v23 valueDidChangeHandler:v21];
    }
  }

  return v11;
}

void __73__PLPhotosHighlight__cachedAssetCountForCountKey_collectionKey_isShared___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLMomentsGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
    int v8 = 138413058;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Fixing cached count for object: %@ on key: %@ from %@ to %@...", (uint8_t *)&v8, 0x2Au);
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 66) = 1;
}

- (void)reportSharedAssetContainerIncrementalChange:(id)a3 forAllAssetsCountKey:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 highlightContainerChanges];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2 object:self file:@"PLPhotosHighlight.m" lineNumber:650 description:@"unexpected change type."];
  }
  if (!*((unsigned char *)&self->super._willSaveCallCount + 2))
  {
    if ([(PLPhotosHighlight *)self isInserted])
    {
      uint64_t v11 = PLMomentsGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        __int16 v12 = [(PLPhotosHighlight *)self objectID];
        *(_DWORD *)buf = 138412290;
        v75 = v12;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "Marking highlight: %@ as waiting for recalc...", buf, 0xCu);
      }
      *((unsigned char *)&self->super._willSaveCallCount + 2) = 1;
      goto LABEL_44;
    }
    if ([(PLPhotosHighlight *)self isDeleted]) {
      goto LABEL_44;
    }
    id v13 = PLMomentsGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      __int16 v14 = [v7 debugDescription];
      uint64_t v15 = [(PLPhotosHighlight *)self objectID];
      *(_DWORD *)buf = 138412546;
      v75 = v14;
      __int16 v76 = 2112;
      v77 = v15;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Processing incremental change: %@ for highlight: %@...", buf, 0x16u);
    }
    uint64_t v16 = [v8 stringByAppendingString:@"Shared"];
    if ([v7 mediaType]) {
      unint64_t v17 = @"videoAssetsSuggestedByPhotosCount";
    }
    else {
      unint64_t v17 = @"photoAssetsSuggestedByPhotosCount";
    }
    unint64_t v18 = [(PLPhotosHighlight *)self primitiveValueForKey:v8];
    int v19 = [v18 intValue];

    v20 = [(PLPhotosHighlight *)self primitiveValueForKey:v16];
    int v21 = [v20 intValue];

    v47 = v17;
    id v22 = [(PLPhotosHighlight *)self primitiveValueForKey:v17];
    int v46 = [v22 intValue];

    id v23 = [(PLPhotosHighlight *)self parentPhotosHighlight];
    v48 = [(PLPhotosHighlight *)self parentDayGroupPhotosHighlight];
    int v24 = [v8 isEqual:@"assetsCount"];
    uint64_t v25 = [v7 collectionChangeType];
    if ((unint64_t)(v25 - 1) < 2)
    {
      if ([v7 collectionChangeType] == 1) {
        int v26 = 1;
      }
      else {
        int v26 = -1;
      }
      long long v27 = [NSNumber numberWithInt:(v26 + v19)];
      [(PLManagedObject *)self pl_safeSetValue:v27 forKey:v8 valueDidChangeHandler:0];

      if ([v7 sharingChange] == 1)
      {
        long long v28 = [NSNumber numberWithInt:(v26 + v21)];
        [(PLManagedObject *)self pl_safeSetValue:v28 forKey:v16 valueDidChangeHandler:0];
      }
      if (![v8 isEqual:@"assetsCount"]
        || [v7 suggestionStateChange] != 1)
      {
        goto LABEL_40;
      }
      long long v29 = [NSNumber numberWithInt:(v26 + v46)];
      uint64_t v53 = MEMORY[0x1E4F143A8];
      uint64_t v54 = 3221225472;
      v55 = __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke_3;
      v56 = &unk_1E5863208;
      v30 = &v57;
      id v31 = v23;
      int v59 = v26 + v46;
      v32 = (id *)&v58;
      id v57 = v31;
      v58 = v47;
      goto LABEL_39;
    }
    if (v25) {
      goto LABEL_40;
    }
    uint64_t v33 = [v7 sharingChange];
    if (v33 == 2)
    {
      v34 = NSNumber;
      if (v21 <= 1) {
        int v36 = 1;
      }
      else {
        int v36 = v21;
      }
      uint64_t v35 = (v36 - 1);
    }
    else
    {
      if (v33 != 1) {
        goto LABEL_32;
      }
      v34 = NSNumber;
      uint64_t v35 = (v21 + 1);
    }
    v37 = [v34 numberWithInt:v35];
    [(PLManagedObject *)self pl_safeSetValue:v37 forKey:v16 valueDidChangeHandler:0];

LABEL_32:
    if (!v24) {
      goto LABEL_40;
    }
    int v38 = [v7 suggestionStateChange];
    if (v38 == 2)
    {
      int v40 = v46;
      if (v46 <= 1) {
        int v40 = 1;
      }
      int v41 = v40 - 1;
      long long v29 = [NSNumber numberWithInt:(v40 - 1)];
      uint64_t v60 = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke_2;
      v63 = &unk_1E5863208;
      v30 = &v64;
      id v42 = v23;
      int v66 = v41;
      v32 = (id *)&v65;
      id v64 = v42;
      v65 = v47;
    }
    else
    {
      if (v38 != 1) {
        goto LABEL_40;
      }
      long long v29 = [NSNumber numberWithInt:(v46 + 1)];
      uint64_t v67 = MEMORY[0x1E4F143A8];
      uint64_t v68 = 3221225472;
      v69 = __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke;
      v70 = &unk_1E5863208;
      v30 = &v71;
      id v39 = v23;
      int v73 = v46 + 1;
      v32 = (id *)&v72;
      id v71 = v39;
      v72 = v47;
    }
LABEL_39:
    -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v29);

LABEL_40:
    if (([v8 isEqualToString:@"assetsCount"] & 1) != 0
      || [v8 isEqualToString:@"dayGroupAssetsCount"])
    {
      uint64_t v43 = [(id)objc_opt_class() calculateSharingCompositionForPhotosHighlight:self];
      v44 = [NSNumber numberWithShort:v43];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke_4;
      v49[3] = &unk_1E5863230;
      id v50 = v23;
      __int16 v52 = v43;
      id v51 = v48;
      [(PLManagedObject *)self pl_safeSetValue:v44 forKey:@"sharingComposition" valueDidChangeHandler:v49];
    }
  }
LABEL_44:
}

void __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) kind] == 1) {
    objc_msgSend(*(id *)(a1 + 32), "_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:to:forKeyPath:", objc_msgSend(v3, "intValue"), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
  }
}

void __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) kind] == 1) {
    objc_msgSend(*(id *)(a1 + 32), "_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:to:forKeyPath:", objc_msgSend(v3, "intValue"), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
  }
}

void __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) kind] == 1) {
    objc_msgSend(*(id *)(a1 + 32), "_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:to:forKeyPath:", objc_msgSend(v3, "intValue"), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
  }
}

uint64_t __86__PLPhotosHighlight_reportSharedAssetContainerIncrementalChange_forAllAssetsCountKey___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "_notifyChildSharingCompositionDidChangeFrom:to:", objc_msgSend(v4, "shortValue"), *(__int16 *)(a1 + 48));
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = [v4 shortValue];

  uint64_t v7 = *(__int16 *)(a1 + 48);
  return [v5 _notifyChildSharingCompositionDidChangeFrom:v6 to:v7];
}

- (void)recalculateSharedAssetContainerCachedValues
{
  v2 = self;
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  *((unsigned char *)&self->super._willSaveCallCount + 2) = 0;
  id v3 = [(PLPhotosHighlight *)self parentPhotosHighlight];
  id v4 = [(PLPhotosHighlight *)v2 parentDayGroupPhotosHighlight];
  uint64_t v5 = NSNumber;
  uint64_t v6 = [(PLPhotosHighlight *)v2 objectIDsForRelationshipNamed:@"assets"];
  uint64_t v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "count"));
  [(PLManagedObject *)v2 pl_safeSetValue:v7 forKey:@"assetsCount" valueDidChangeHandler:0];

  id v8 = NSNumber;
  uint64_t v9 = [(PLPhotosHighlight *)v2 objectIDsForRelationshipNamed:@"dayGroupAssets"];
  uint64_t v10 = objc_msgSend(v8, "numberWithInt:", objc_msgSend(v9, "count"));
  [(PLManagedObject *)v2 pl_safeSetValue:v10 forKey:@"dayGroupAssetsCount" valueDidChangeHandler:0];

  uint64_t v11 = NSNumber;
  __int16 v12 = [(PLPhotosHighlight *)v2 objectIDsForRelationshipNamed:@"dayGroupExtendedAssets"];
  id v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "count"));
  [(PLManagedObject *)v2 pl_safeSetValue:v13 forKey:@"dayGroupExtendedAssetsCount" valueDidChangeHandler:0];

  __int16 v14 = NSNumber;
  uint64_t v15 = [(PLPhotosHighlight *)v2 objectIDsForRelationshipNamed:@"dayGroupSummaryAssets"];
  uint64_t v16 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "count"));
  [(PLManagedObject *)v2 pl_safeSetValue:v16 forKey:@"dayGroupSummaryAssetsCount" valueDidChangeHandler:0];

  unint64_t v17 = NSNumber;
  unint64_t v18 = [(PLPhotosHighlight *)v2 objectIDsForRelationshipNamed:@"extendedAssets"];
  int v19 = objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "count"));
  [(PLManagedObject *)v2 pl_safeSetValue:v19 forKey:@"extendedCount" valueDidChangeHandler:0];

  v20 = NSNumber;
  int v21 = [(PLPhotosHighlight *)v2 objectIDsForRelationshipNamed:@"summaryAssets"];
  id v22 = objc_msgSend(v20, "numberWithInt:", objc_msgSend(v21, "count"));
  [(PLManagedObject *)v2 pl_safeSetValue:v22 forKey:@"summaryCount" valueDidChangeHandler:0];

  if (![(PLPhotosHighlight *)v2 kind])
  {
    v91 = v4;
    v92 = v3;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    v93 = v2;
    v32 = [(PLPhotosHighlight *)v2 assets];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v136 objects:v146 count:16];
    if (!v33)
    {
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      goto LABEL_47;
    }
    uint64_t v34 = v33;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    LODWORD(v37) = 0;
    uint64_t v38 = *(void *)v137;
    while (1)
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v137 != v38) {
          objc_enumerationMutation(v32);
        }
        int v40 = *(void **)(*((void *)&v136 + 1) + 8 * i);
        int v41 = [v40 hasLibraryScope];
        uint64_t v42 = [v40 libraryScopeShareState];
        if (v42 > 65537)
        {
          if (v42 == 65552 || v42 == 65538)
          {
LABEL_29:
            if ([v40 kind])
            {
              if ([v40 kind] == 1) {
                uint64_t v35 = (v35 + 1);
              }
              else {
                uint64_t v35 = v35;
              }
            }
            else
            {
              uint64_t v36 = (v36 + 1);
            }
          }
        }
        else if (v42 == 2 || v42 == 16)
        {
          goto LABEL_29;
        }
        uint64_t v37 = (v37 + v41);
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v136 objects:v146 count:16];
      if (!v34)
      {
LABEL_47:

        id v51 = [NSNumber numberWithInt:v37];
        v2 = v93;
        [(PLManagedObject *)v93 pl_safeSetValue:v51 forKey:@"assetsCountShared" valueDidChangeHandler:0];

        __int16 v52 = [NSNumber numberWithInt:v36];
        uint64_t v129 = MEMORY[0x1E4F143A8];
        uint64_t v130 = 3221225472;
        v131 = __64__PLPhotosHighlight_recalculateSharedAssetContainerCachedValues__block_invoke;
        v132 = &unk_1E5863208;
        id v3 = v92;
        id v53 = v92;
        int v135 = v36;
        id v133 = v53;
        v134 = @"photoAssetsSuggestedByPhotosCount";
        -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v93, "pl_safeSetValue:forKey:valueDidChangeHandler:", v52);

        uint64_t v54 = [NSNumber numberWithInt:v35];
        uint64_t v122 = MEMORY[0x1E4F143A8];
        uint64_t v123 = 3221225472;
        v124 = __64__PLPhotosHighlight_recalculateSharedAssetContainerCachedValues__block_invoke_2;
        v125 = &unk_1E5863208;
        int v128 = v35;
        id v126 = v53;
        v127 = @"videoAssetsSuggestedByPhotosCount";
        -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](v93, "pl_safeSetValue:forKey:valueDidChangeHandler:", v54);

        long long v120 = 0u;
        long long v121 = 0u;
        long long v118 = 0u;
        long long v119 = 0u;
        v55 = [(PLPhotosHighlight *)v93 extendedAssets];
        uint64_t v56 = [v55 countByEnumeratingWithState:&v118 objects:v145 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          LODWORD(v58) = 0;
          uint64_t v59 = *(void *)v119;
          id v4 = v91;
          do
          {
            for (uint64_t j = 0; j != v57; ++j)
            {
              if (*(void *)v119 != v59) {
                objc_enumerationMutation(v55);
              }
              uint64_t v58 = v58
                  + [*(id *)(*((void *)&v118 + 1) + 8 * j) hasLibraryScope];
            }
            uint64_t v57 = [v55 countByEnumeratingWithState:&v118 objects:v145 count:16];
          }
          while (v57);
        }
        else
        {
          uint64_t v58 = 0;
          id v4 = v91;
        }

        uint64_t v61 = [NSNumber numberWithInt:v58];
        [(PLManagedObject *)v93 pl_safeSetValue:v61 forKey:@"extendedCountShared" valueDidChangeHandler:0];

        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        v62 = [(PLPhotosHighlight *)v93 summaryAssets];
        uint64_t v63 = [v62 countByEnumeratingWithState:&v114 objects:v144 count:16];
        if (v63)
        {
          uint64_t v64 = v63;
          LODWORD(v65) = 0;
          uint64_t v66 = *(void *)v115;
          do
          {
            for (uint64_t k = 0; k != v64; ++k)
            {
              if (*(void *)v115 != v66) {
                objc_enumerationMutation(v62);
              }
              uint64_t v65 = v65
                  + [*(id *)(*((void *)&v114 + 1) + 8 * k) hasLibraryScope];
            }
            uint64_t v64 = [v62 countByEnumeratingWithState:&v114 objects:v144 count:16];
          }
          while (v64);
        }
        else
        {
          uint64_t v65 = 0;
        }

        uint64_t v68 = [NSNumber numberWithInt:v65];
        v69 = @"summaryCountShared";
LABEL_88:
        [(PLManagedObject *)v2 pl_safeSetValue:v68 forKey:v69 valueDidChangeHandler:0];
LABEL_89:

        goto LABEL_90;
      }
    }
  }
  if ([(PLPhotosHighlight *)v2 kind] == 1)
  {
    id v23 = v4;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    int v24 = [(PLPhotosHighlight *)v2 childPhotosHighlights];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v110 objects:v143 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = *(void *)v111;
      do
      {
        for (uint64_t m = 0; m != v26; ++m)
        {
          if (*(void *)v111 != v29) {
            objc_enumerationMutation(v24);
          }
          id v31 = *(void **)(*((void *)&v110 + 1) + 8 * m);
          if (![v31 kind])
          {
            uint64_t v28 = [v31 photoAssetsSuggestedByPhotosCount] + v28;
            uint64_t v27 = [v31 videoAssetsSuggestedByPhotosCount] + v27;
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v110 objects:v143 count:16];
      }
      while (v26);
    }
    else
    {
      uint64_t v27 = 0;
      uint64_t v28 = 0;
    }

    v70 = [NSNumber numberWithInt:v28];
    [(PLManagedObject *)v2 pl_safeSetValue:v70 forKey:@"photoAssetsSuggestedByPhotosCount" valueDidChangeHandler:0];

    uint64_t v68 = [NSNumber numberWithInt:v27];
    [(PLManagedObject *)v2 pl_safeSetValue:v68 forKey:@"videoAssetsSuggestedByPhotosCount" valueDidChangeHandler:0];
    id v4 = v23;
    goto LABEL_89;
  }
  if ([(PLPhotosHighlight *)v2 kind] == 3)
  {
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v45 = [(PLPhotosHighlight *)v2 dayGroupAssets];
    uint64_t v46 = [v45 countByEnumeratingWithState:&v106 objects:v142 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      LODWORD(v48) = 0;
      uint64_t v49 = *(void *)v107;
      do
      {
        for (uint64_t n = 0; n != v47; ++n)
        {
          if (*(void *)v107 != v49) {
            objc_enumerationMutation(v45);
          }
          uint64_t v48 = v48
              + [*(id *)(*((void *)&v106 + 1) + 8 * n) hasLibraryScope];
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v106 objects:v142 count:16];
      }
      while (v47);
    }
    else
    {
      uint64_t v48 = 0;
    }

    id v71 = [NSNumber numberWithInt:v48];
    [(PLManagedObject *)v2 pl_safeSetValue:v71 forKey:@"dayGroupAssetsCountShared" valueDidChangeHandler:0];

    long long v104 = 0u;
    long long v105 = 0u;
    long long v103 = 0u;
    long long v102 = 0u;
    v72 = [(PLPhotosHighlight *)v2 dayGroupExtendedAssets];
    uint64_t v73 = [v72 countByEnumeratingWithState:&v102 objects:v141 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      LODWORD(v75) = 0;
      uint64_t v76 = *(void *)v103;
      do
      {
        for (iuint64_t i = 0; ii != v74; ++ii)
        {
          if (*(void *)v103 != v76) {
            objc_enumerationMutation(v72);
          }
          uint64_t v75 = v75
              + [*(id *)(*((void *)&v102 + 1) + 8 * ii) hasLibraryScope];
        }
        uint64_t v74 = [v72 countByEnumeratingWithState:&v102 objects:v141 count:16];
      }
      while (v74);
    }
    else
    {
      uint64_t v75 = 0;
    }

    uint64_t v78 = [NSNumber numberWithInt:v75];
    [(PLManagedObject *)v2 pl_safeSetValue:v78 forKey:@"dayGroupExtendedAssetsCountShared" valueDidChangeHandler:0];

    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    v79 = [(PLPhotosHighlight *)v2 dayGroupSummaryAssets];
    uint64_t v80 = [v79 countByEnumeratingWithState:&v98 objects:v140 count:16];
    if (v80)
    {
      uint64_t v81 = v80;
      LODWORD(v82) = 0;
      uint64_t v83 = *(void *)v99;
      do
      {
        for (juint64_t j = 0; jj != v81; ++jj)
        {
          if (*(void *)v99 != v83) {
            objc_enumerationMutation(v79);
          }
          uint64_t v82 = v82
              + [*(id *)(*((void *)&v98 + 1) + 8 * jj) hasLibraryScope];
        }
        uint64_t v81 = [v79 countByEnumeratingWithState:&v98 objects:v140 count:16];
      }
      while (v81);
    }
    else
    {
      uint64_t v82 = 0;
    }

    uint64_t v68 = [NSNumber numberWithInt:v82];
    v69 = @"dayGroupSummaryAssetsCountShared";
    goto LABEL_88;
  }
LABEL_90:
  uint64_t v85 = [(id)objc_opt_class() calculateSharingCompositionForPhotosHighlight:v2];
  v86 = [NSNumber numberWithShort:v85];
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __64__PLPhotosHighlight_recalculateSharedAssetContainerCachedValues__block_invoke_3;
  v94[3] = &unk_1E5863230;
  __int16 v97 = v85;
  id v95 = v3;
  id v96 = v4;
  id v87 = v4;
  v88 = v3;
  id v89 = v87;
  id v90 = v88;
  [(PLManagedObject *)v2 pl_safeSetValue:v86 forKey:@"sharingComposition" valueDidChangeHandler:v94];
}

void __64__PLPhotosHighlight_recalculateSharedAssetContainerCachedValues__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) kind] == 1) {
    objc_msgSend(*(id *)(a1 + 32), "_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:to:forKeyPath:", objc_msgSend(v3, "intValue"), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
  }
}

void __64__PLPhotosHighlight_recalculateSharedAssetContainerCachedValues__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) kind] == 1) {
    objc_msgSend(*(id *)(a1 + 32), "_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:to:forKeyPath:", objc_msgSend(v3, "intValue"), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40));
  }
}

uint64_t __64__PLPhotosHighlight_recalculateSharedAssetContainerCachedValues__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "_notifyChildSharingCompositionDidChangeFrom:to:", objc_msgSend(v4, "shortValue"), *(__int16 *)(a1 + 48));
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = [v4 shortValue];

  uint64_t v7 = *(__int16 *)(a1 + 48);
  return [v5 _notifyChildSharingCompositionDidChangeFrom:v6 to:v7];
}

- (int)assetsCountPrivate
{
  int v3 = [(PLPhotosHighlight *)self assetsCount];
  return v3 - [(PLPhotosHighlight *)self assetsCountShared];
}

- (void)_notifyChildPhotoOrVideoAssetsSuggestedByPhotosCountDidChangeFrom:(int)a3 to:(int)a4 forKeyPath:(id)a5
{
  id v15 = a5;
  if (!v15)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PLPhotosHighlight.m", 494, @"Invalid parameter not satisfying: %@", @"suggestedAssetsCountKey" object file lineNumber description];
  }
  if ([(PLPhotosHighlight *)self kind] != 1)
  {
    __int16 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PLPhotosHighlight.m" lineNumber:495 description:@"only supported for month"];
  }
  int v9 = a4 - a3;
  uint64_t v10 = [(PLPhotosHighlight *)self valueForKey:v15];
  int v11 = [v10 intValue];

  __int16 v12 = [NSNumber numberWithInt:(v9 + v11)];
  [(PLManagedObject *)self pl_safeSetValue:v12 forKey:v15 valueDidChangeHandler:0];
}

- (void)_notifyChildSharingCompositionDidChangeFrom:(signed __int16)a3 to:(signed __int16)a4
{
  int v4 = a4;
  uint64_t v6 = [(PLPhotosHighlight *)self sharingComposition];
  if ([(PLPhotosHighlight *)self sharingComposition] != v4)
  {
    if (v4 == 2)
    {
      [(PLManagedObject *)self pl_safeSetValue:&unk_1EEBED248 forKey:@"sharingComposition" valueDidChangeHandler:0];
    }
    else
    {
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend((id)objc_opt_class(), "calculateSharingCompositionForPhotosHighlight:", self));
      [(PLManagedObject *)self pl_safeSetValue:v7 forKey:@"sharingComposition" valueDidChangeHandler:0];
    }
  }
  if ([(PLPhotosHighlight *)self kind] != 2
    && [(PLPhotosHighlight *)self sharingComposition] != v6)
  {
    id v8 = [(PLPhotosHighlight *)self parentPhotosHighlight];
    objc_msgSend(v8, "_notifyChildSharingCompositionDidChangeFrom:to:", v6, -[PLPhotosHighlight sharingComposition](self, "sharingComposition"));
  }
}

- (NSString)debugDescription
{
  int v3 = [[PLDescriptionBuilder alloc] initWithObject:self style:3 indent:1];
  int v4 = [(PLPhotosHighlight *)self uuid];
  [(PLDescriptionBuilder *)v3 appendName:@"uuid" object:v4];

  uint64_t v5 = [(PLPhotosHighlight *)self title];
  if (v5)
  {
    uint64_t v6 = [(PLPhotosHighlight *)self title];
    if ([v6 length])
    {
      uint64_t v7 = [(PLPhotosHighlight *)self title];
    }
    else
    {
      uint64_t v7 = @"No title";
    }
  }
  else
  {
    uint64_t v7 = @"No title";
  }

  id v8 = [(PLPhotosHighlight *)self subtitle];
  if (v8)
  {
    int v9 = [(PLPhotosHighlight *)self subtitle];
    if ([v9 length])
    {
      uint64_t v10 = [(PLPhotosHighlight *)self subtitle];
    }
    else
    {
      uint64_t v10 = @"No subtitle";
    }
  }
  else
  {
    uint64_t v10 = @"No subtitle";
  }

  int v11 = [(PLPhotosHighlight *)self verboseSmartDescription];
  if (v11)
  {
    __int16 v12 = [(PLPhotosHighlight *)self verboseSmartDescription];
    if ([v12 length])
    {
      id v13 = [(PLPhotosHighlight *)self verboseSmartDescription];
    }
    else
    {
      id v13 = @"No verboseSmartDescription";
    }
  }
  else
  {
    id v13 = @"No verboseSmartDescription";
  }

  [(PLDescriptionBuilder *)v3 appendName:@"title" object:v7];
  [(PLDescriptionBuilder *)v3 appendName:@"subtitle" object:v10];
  [(PLDescriptionBuilder *)v3 appendName:@"verboseSmartDescription" object:v13];
  __int16 v14 = objc_msgSend((id)objc_opt_class(), "stringFromHighlightKind:", -[PLPhotosHighlight kind](self, "kind"));
  [(PLDescriptionBuilder *)v3 appendName:@"kind" object:v14];

  id v15 = [(PLPhotosHighlight *)self startDate];
  uint64_t v16 = [(PLPhotosHighlight *)self endDate];
  [(PLDescriptionBuilder *)v3 appendName:@"start date (gmt)" object:v15];
  [(PLDescriptionBuilder *)v3 appendName:@"end date (gmt)" object:v16];
  uint64_t v17 = [(PLPhotosHighlight *)self localStartDate];
  uint64_t v18 = [(PLPhotosHighlight *)self localEndDate];
  [(PLDescriptionBuilder *)v3 appendName:@"start date (local)" object:v17];
  v77 = (void *)v18;
  [(PLDescriptionBuilder *)v3 appendName:@"end date (local)" object:v18];
  unsigned int v19 = [(PLPhotosHighlight *)self type];
  v20 = @"unknown";
  int v21 = @"unknown";
  if (v19 <= 7) {
    int v21 = off_1E58632D0[v19];
  }
  [(PLDescriptionBuilder *)v3 appendName:@"type" object:v21];
  int v22 = [(PLPhotosHighlight *)self category];
  id v23 = @"PLPhotosHighlightCategoryRecent";
  if (v22 != 1) {
    id v23 = @"unknown";
  }
  if (v22) {
    int v24 = v23;
  }
  else {
    int v24 = @"PLPhotosHighlightCategoryDefault";
  }
  [(PLDescriptionBuilder *)v3 appendName:@"category" object:v24];
  unsigned int v25 = [(PLPhotosHighlight *)self sharingComposition];
  if (v25 <= 2) {
    v20 = off_1E5863310[(unsigned __int16)v25];
  }
  [(PLDescriptionBuilder *)v3 appendName:@"sharingComposition" object:v20];
  uint64_t v26 = objc_msgSend(NSNumber, "numberWithInt:", -[PLPhotosHighlight assetsCount](self, "assetsCount"));
  [(PLDescriptionBuilder *)v3 appendName:@"assets count" object:v26];

  uint64_t v27 = objc_msgSend(NSNumber, "numberWithInt:", -[PLPhotosHighlight assetsCountShared](self, "assetsCountShared"));
  [(PLDescriptionBuilder *)v3 appendName:@"assets count (shared)" object:v27];

  uint64_t v28 = objc_msgSend(NSNumber, "numberWithInt:", -[PLPhotosHighlight assetsCountPrivate](self, "assetsCountPrivate"));
  [(PLDescriptionBuilder *)v3 appendName:@"assets count (private)" object:v28];

  unsigned int v29 = [(PLPhotosHighlight *)self visibilityState];
  if (v29 > 4) {
    v30 = @"unknown";
  }
  else {
    v30 = off_1E5863328[v29];
  }
  [(PLDescriptionBuilder *)v3 appendName:@"visibility private" object:v30];
  unsigned int v31 = [(PLPhotosHighlight *)self visibilityStateShared];
  if (v31 > 4) {
    v32 = @"unknown";
  }
  else {
    v32 = off_1E5863328[v31];
  }
  [(PLDescriptionBuilder *)v3 appendName:@"visibility shared" object:v32];
  unsigned int v33 = [(PLPhotosHighlight *)self visibilityStateMixed];
  if (v33 > 4) {
    uint64_t v34 = @"unknown";
  }
  else {
    uint64_t v34 = off_1E5863328[v33];
  }
  [(PLDescriptionBuilder *)v3 appendName:@"visibility mixed" object:v34];
  unsigned int v35 = [(PLPhotosHighlight *)self enrichmentState];
  if (v35 > 4) {
    uint64_t v36 = @"unknown";
  }
  else {
    uint64_t v36 = off_1E5863350[v35];
  }
  [(PLDescriptionBuilder *)v3 appendName:@"enrichment state" object:v36];
  uint64_t v78 = (void *)v17;
  int v37 = [(PLPhotosHighlight *)self kind];
  switch(v37)
  {
    case 0:
      uint64_t v76 = [(PLPhotosHighlight *)self keyAssetPrivate];
      uint64_t v38 = [v76 localID];
      [(PLDescriptionBuilder *)v3 appendName:@"key asset private id" object:v38];

      id v39 = [(PLPhotosHighlight *)self keyAssetShared];
      int v40 = [v39 localID];
      [(PLDescriptionBuilder *)v3 appendName:@"key asset shared id" object:v40];

      int v41 = [(PLPhotosHighlight *)self assets];
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", @"assets count", [v41 count]);

      if ([(PLPhotosHighlight *)self assetsCountShared] > 0) {
        [(PLDescriptionBuilder *)v3 appendName:@"assets count (shared)" unsignedIntegerValue:[(PLPhotosHighlight *)self assetsCountShared]];
      }
      uint64_t v42 = [(PLPhotosHighlight *)self summaryAssets];
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", @"summary count", [v42 count]);

      if ([(PLPhotosHighlight *)self summaryCountShared] >= 1) {
        [(PLDescriptionBuilder *)v3 appendName:@"summary count (shared)" unsignedIntegerValue:[(PLPhotosHighlight *)self summaryCountShared]];
      }
      uint64_t v43 = [(PLPhotosHighlight *)self extendedAssets];
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", @"extended count", [v43 count]);

      if ([(PLPhotosHighlight *)self extendedCountShared] >= 1) {
        [(PLDescriptionBuilder *)v3 appendName:@"extended count (shared)" unsignedIntegerValue:[(PLPhotosHighlight *)self extendedCountShared]];
      }
      v44 = [(PLPhotosHighlight *)self moments];
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", @"moments count", [v44 count]);
      goto LABEL_60;
    case 1:
      v72 = v16;
      uint64_t v74 = v15;
      id v71 = v13;
      uint64_t v46 = v10;
      uint64_t v47 = v7;
      uint64_t v76 = [(PLPhotosHighlight *)self monthKeyAssetPrivate];
      uint64_t v48 = [v76 localID];
      [(PLDescriptionBuilder *)v3 appendName:@"key asset private id" object:v48];

      uint64_t v49 = [(PLPhotosHighlight *)self monthKeyAssetShared];
      goto LABEL_51;
    case 2:
      v72 = v16;
      uint64_t v74 = v15;
      id v71 = v13;
      uint64_t v46 = v10;
      uint64_t v47 = v7;
      uint64_t v76 = [(PLPhotosHighlight *)self yearKeyAssetPrivate];
      id v50 = [v76 localID];
      [(PLDescriptionBuilder *)v3 appendName:@"key asset private id" object:v50];

      uint64_t v49 = [(PLPhotosHighlight *)self yearKeyAssetShared];
LABEL_51:
      id v39 = v49;
      id v51 = [v49 localID];
      [(PLDescriptionBuilder *)v3 appendName:@"key asset shared id" object:v51];

      __int16 v52 = [(PLPhotosHighlight *)self childPhotosHighlights];
      id v53 = [v52 valueForKey:@"uuid"];
      uint64_t v54 = [v53 allObjects];
      v55 = [v54 componentsJoinedByString:@"\n\t\t\t"];
      [(PLDescriptionBuilder *)v3 appendName:@"child uuids" object:v55];

      uint64_t v7 = v47;
      uint64_t v10 = v46;
      id v13 = v71;
      uint64_t v16 = v72;
      id v15 = v74;
      if (v37 == 2) {
        goto LABEL_62;
      }
      goto LABEL_61;
    case 3:
      uint64_t v76 = [(PLPhotosHighlight *)self dayGroupKeyAssetPrivate];
      uint64_t v56 = [v76 localID];
      [(PLDescriptionBuilder *)v3 appendName:@"key asset private id" object:v56];

      id v39 = [(PLPhotosHighlight *)self dayGroupKeyAssetShared];
      uint64_t v57 = [v39 localID];
      [(PLDescriptionBuilder *)v3 appendName:@"key asset shared id" object:v57];

      uint64_t v58 = [(PLPhotosHighlight *)self dayGroupAssets];
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", @"assets count", [v58 count]);

      if ([(PLPhotosHighlight *)self dayGroupAssetsCountShared] > 0) {
        [(PLDescriptionBuilder *)v3 appendName:@"assets count (shared)" unsignedIntegerValue:[(PLPhotosHighlight *)self dayGroupAssetsCountShared]];
      }
      uint64_t v59 = [(PLPhotosHighlight *)self dayGroupSummaryAssets];
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", @"summary count", [v59 count]);

      if ([(PLPhotosHighlight *)self dayGroupSummaryAssetsCountShared] >= 1) {
        [(PLDescriptionBuilder *)v3 appendName:@"summary count (shared)" unsignedIntegerValue:[(PLPhotosHighlight *)self dayGroupSummaryAssetsCountShared]];
      }
      uint64_t v73 = v16;
      uint64_t v75 = v15;
      uint64_t v60 = [(PLPhotosHighlight *)self dayGroupExtendedAssets];
      -[PLDescriptionBuilder appendName:unsignedIntegerValue:](v3, "appendName:unsignedIntegerValue:", @"extended count", [v60 count]);

      if ([(PLPhotosHighlight *)self dayGroupExtendedAssetsCountShared] >= 1) {
        [(PLDescriptionBuilder *)v3 appendName:@"extended count (shared)" unsignedIntegerValue:[(PLPhotosHighlight *)self dayGroupExtendedAssetsCountShared]];
      }
      v44 = [(PLPhotosHighlight *)self childDayGroupPhotosHighlights];
      uint64_t v61 = [v44 valueForKey:@"uuid"];
      v62 = [v61 allObjects];
      uint64_t v63 = [v62 componentsJoinedByString:@"\n\t\t\t"];
      [(PLDescriptionBuilder *)v3 appendName:@"child day uuids" object:v63];

      uint64_t v16 = v73;
      id v15 = v75;
      goto LABEL_60;
    default:
      v45 = [0 localID];
      [(PLDescriptionBuilder *)v3 appendName:@"key asset private id" object:v45];

      v44 = [0 localID];
      [(PLDescriptionBuilder *)v3 appendName:@"key asset shared id" object:v44];
      id v39 = 0;
      uint64_t v76 = 0;
LABEL_60:

LABEL_61:
      uint64_t v64 = [(PLPhotosHighlight *)self parentPhotosHighlight];
      uint64_t v65 = [v64 uuid];
      [(PLDescriptionBuilder *)v3 appendName:@"parent uuid" object:v65];

LABEL_62:
      [(PLPhotosHighlight *)self promotionScore];
      -[PLDescriptionBuilder appendName:doubleValue:](v3, "appendName:doubleValue:", @"promotion score");
      [(PLDescriptionBuilder *)v3 appendName:@"start time zone offset" integerValue:(int)[(PLPhotosHighlight *)self startTimeZoneOffset]];
      [(PLDescriptionBuilder *)v3 appendName:@"end time zone offset" integerValue:(int)[(PLPhotosHighlight *)self endTimeZoneOffset]];
      uint64_t v66 = PLDescriptionForMemoryMood([(PLPhotosHighlight *)self mood]);
      [(PLDescriptionBuilder *)v3 appendName:@"mood" object:v66];

      uint64_t v67 = [(PLPhotosHighlight *)self moments];
      uint64_t v68 = PLDebugDescriptionForAggregateProcessedLocationType(v67);
      [(PLDescriptionBuilder *)v3 appendName:@"processed location type" object:v68];

      [(PLDescriptionBuilder *)v3 appendName:@"highlight version" integerValue:(int)[(PLPhotosHighlight *)self highlightVersion]];
      [(PLDescriptionBuilder *)v3 appendName:@"enrichment version" integerValue:(int)[(PLPhotosHighlight *)self enrichmentVersion]];
      v69 = [(PLDescriptionBuilder *)v3 build];

      return (NSString *)v69;
  }
}

- (NSString)description
{
  int v3 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PLPhotosHighlight;
  int v4 = [(PLPhotosHighlight *)&v12 description];
  uint64_t v5 = [(PLPhotosHighlight *)self uuid];
  uint64_t v6 = [(PLPhotosHighlight *)self title];
  uint64_t v7 = objc_msgSend((id)objc_opt_class(), "stringFromHighlightKind:", -[PLPhotosHighlight kind](self, "kind"));
  id v8 = [(PLPhotosHighlight *)self startDate];
  int v9 = [(PLPhotosHighlight *)self endDate];
  uint64_t v10 = [v3 stringWithFormat:@"%@ (%@) - %@ (%@) (%@ - %@)", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

+ (id)_libraryScopePredicateForSharingConsideration:(int64_t)a3
{
  if (_libraryScopePredicateForSharingConsideration__sOnceToken != -1) {
    dispatch_once(&_libraryScopePredicateForSharingConsideration__sOnceToken, &__block_literal_global_4711);
  }
  int v4 = &_libraryScopePredicateForSharingConsideration__sPredicatePrivate;
  if (a3) {
    int v4 = &_libraryScopePredicateForSharingConsideration__sPredicateShared;
  }
  uint64_t v5 = (void *)*v4;
  return v5;
}

void __67__PLPhotosHighlight__libraryScopePredicateForSharingConsideration___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_489];
  v1 = (void *)_libraryScopePredicateForSharingConsideration__sPredicateShared;
  _libraryScopePredicateForSharingConsideration__sPredicateShared = v0;

  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_491];
  int v3 = (void *)_libraryScopePredicateForSharingConsideration__sPredicatePrivate;
  _libraryScopePredicateForSharingConsideration__sPredicatePrivate = v2;
}

uint64_t __67__PLPhotosHighlight__libraryScopePredicateForSharingConsideration___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 hasLibraryScope] ^ 1;
}

uint64_t __67__PLPhotosHighlight__libraryScopePredicateForSharingConsideration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hasLibraryScope];
}

+ (NSArray)sortByTimeSortDescriptors
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  int v3 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"endDate", 1, v2);
  v7[1] = v3;
  int v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
  void v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return (NSArray *)v5;
}

+ (id)batchFetchPhotosHighlightUUIDsByMomentUUIDsWithMomentUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"PLPhotosHighlight.m", 1362, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  int v11 = [v10 managedObjectContext];
  objc_super v12 = (void *)MEMORY[0x1E4F1C0D0];
  id v13 = +[PLMoment entityName];
  __int16 v14 = [v12 fetchRequestWithEntityName:v13];

  id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v9];
  [v14 setPredicate:v15];
  [v14 setResultType:2];
  v48[0] = @"uuid";
  v48[1] = @"highlight.uuid";
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  [v14 setPropertiesToFetch:v16];

  if (!a5)
  {
    uint64_t v42 = 0;
    a5 = (id *)&v42;
  }
  uint64_t v17 = [v11 executeFetchRequest:v14 error:a5];
  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    unsigned int v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      unsigned int v33 = v15;
      uint64_t v34 = v14;
      unsigned int v35 = v11;
      id v36 = v10;
      id v37 = v9;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          int v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          unsigned int v25 = [v24 objectForKeyedSubscript:@"highlight.uuid"];
          uint64_t v26 = [v24 objectForKeyedSubscript:@"uuid"];
          uint64_t v27 = (void *)v26;
          if (v25) {
            BOOL v28 = v26 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28)
          {
            unsigned int v29 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v44 = v27;
              __int16 v45 = 2112;
              uint64_t v46 = v25;
              _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Error fetching highlight UUID for moment UUID: %@, highlight UUID: %@", buf, 0x16u);
            }
          }
          else
          {
            [v18 setObject:v25 forKeyedSubscript:v26];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v21);
      id v10 = v36;
      id v9 = v37;
      __int16 v14 = v34;
      int v11 = v35;
      id v15 = v33;
    }
  }
  else
  {
    unsigned int v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v30 = *a5;
      *(_DWORD *)buf = 138412290;
      id v44 = v30;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Error fetching highlight UUID for moment UUID: %@", buf, 0xCu);
    }
    uint64_t v18 = 0;
  }

  return v18;
}

+ (id)batchFetchTripHighlightUUIDsByAssetUUIDsWithAssetUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  v56[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    id v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, a1, @"PLPhotosHighlight.m", 1322, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  int v11 = [v10 managedObjectContext];
  objc_super v12 = (void *)MEMORY[0x1E4F1C0D0];
  id v13 = +[PLManagedAsset entityName];
  __int16 v14 = [v12 fetchRequestWithEntityName:v13];

  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", v9];
  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K.%K IN %@", @"dayGroupHighlightBeingAssets", @"type", &unk_1EEBF1598];
  uint64_t v17 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v43 = (void *)v16;
  id v44 = (void *)v15;
  v56[0] = v15;
  v56[1] = v16;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  uint64_t v19 = [v17 andPredicateWithSubpredicates:v18];

  uint64_t v20 = (void *)v19;
  [v14 setPredicate:v19];
  [v14 setResultType:2];
  v55[0] = @"uuid";
  v55[1] = @"dayGroupHighlightBeingAssets.uuid";
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  [v14 setPropertiesToFetch:v21];

  if (!a5)
  {
    uint64_t v49 = 0;
    a5 = (id *)&v49;
  }
  uint64_t v22 = [v11 executeFetchRequest:v14 error:a5];
  if (v22)
  {
    uint64_t v42 = v14;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    int v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      long long v38 = v20;
      long long v39 = v11;
      id v40 = v10;
      id v41 = v9;
      uint64_t v27 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v46 != v27) {
            objc_enumerationMutation(v24);
          }
          unsigned int v29 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          id v30 = [v29 objectForKeyedSubscript:@"dayGroupHighlightBeingAssets.uuid"];
          uint64_t v31 = [v29 objectForKeyedSubscript:@"uuid"];
          v32 = (void *)v31;
          if (v30) {
            BOOL v33 = v31 == 0;
          }
          else {
            BOOL v33 = 1;
          }
          if (v33)
          {
            uint64_t v34 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v51 = v32;
              __int16 v52 = 2114;
              id v53 = v30;
              _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "Could not fetch trip highlight for asset UUID: %{public}@, trip highlight UUID:%{public}@", buf, 0x16u);
            }
          }
          else
          {
            [v23 setObject:v30 forKey:v31];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v26);
      id v10 = v40;
      id v9 = v41;
      uint64_t v20 = v38;
      int v11 = v39;
      __int16 v14 = v42;
    }
  }
  else
  {
    int v24 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v35 = *a5;
      *(_DWORD *)buf = 138412290;
      id v51 = v35;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Trip Highlight fetch using asset UUIDs failed with error: %@", buf, 0xCu);
    }
    id v23 = 0;
  }

  return v23;
}

+ (id)batchFetchPhotosHighlightUUIDsByAssetUUIDsWithAssetUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"PLPhotosHighlight.m", 1285, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  int v11 = [v10 managedObjectContext];
  objc_super v12 = (void *)MEMORY[0x1E4F1C0D0];
  id v13 = +[PLManagedAsset entityName];
  __int16 v14 = [v12 fetchRequestWithEntityName:v13];

  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v9];
  [v14 setPredicate:v15];
  [v14 setResultType:2];
  v46[0] = @"uuid";
  v46[1] = @"highlightBeingAssets.uuid";
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
  [v14 setPropertiesToFetch:v16];

  if (!a5)
  {
    uint64_t v42 = 0;
    a5 = (id *)&v42;
  }
  uint64_t v17 = [v11 executeFetchRequest:v14 error:a5];
  if (v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      BOOL v33 = v15;
      uint64_t v34 = v14;
      id v35 = v11;
      id v36 = v10;
      id v37 = v9;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v19);
          }
          int v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v25 = [v24 objectForKeyedSubscript:@"highlightBeingAssets.uuid"];
          uint64_t v26 = [v24 objectForKeyedSubscript:@"uuid"];
          uint64_t v27 = (void *)v26;
          if (v25) {
            BOOL v28 = v26 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28)
          {
            unsigned int v29 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v44 = v27;
              _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_INFO, "Couldn't fetch highlight for asset UUID: %@", buf, 0xCu);
            }
          }
          else
          {
            [v18 setObject:v25 forKeyedSubscript:v26];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v21);
      id v10 = v36;
      id v9 = v37;
      __int16 v14 = v34;
      int v11 = v35;
      uint64_t v15 = v33;
    }
  }
  else
  {
    uint64_t v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v30 = *a5;
      *(_DWORD *)buf = 138412290;
      id v44 = v30;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Highlight fetch using asset UUIDs failed with error: %@", buf, 0xCu);
    }
    uint64_t v18 = 0;
  }

  return v18;
}

+ (id)predicateForInvalidMonthOrYearHighlights
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"childPhotosHighlights.@count = 0"];
  int v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %u", 1);
  int v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %u", 2);
  uint64_t v5 = (void *)MEMORY[0x1E4F28BA0];
  v13[0] = v3;
  v13[1] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  uint64_t v7 = [v5 orPredicateWithSubpredicates:v6];

  id v8 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v2;
  v12[1] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v10 = [v8 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (id)predicateForInvalidDayGroupHighlights
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"childDayGroupPhotosHighlights.@count = 0"];
  int v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dayGroupAssets.@count = 0"];
  v12[0] = v2;
  v12[1] = v3;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v5 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v4];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %u", 3);
  uint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
  v11[0] = v5;
  v11[1] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v9 = [v7 andPredicateWithSubpredicates:v8];

  return v9;
}

+ (id)predicateForInvalidDayHighlights
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"moments.@count = 0"];
  int v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"assets.@count = 0"];
  v12[0] = v2;
  v12[1] = v3;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v5 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v4];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %u", 0);
  uint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
  v11[0] = v5;
  v11[1] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  id v9 = [v7 andPredicateWithSubpredicates:v8];

  return v9;
}

+ (id)predicateForInvalidHighlightsOfAllKinds
{
  v10[3] = *MEMORY[0x1E4F143B8];
  int v3 = (void *)MEMORY[0x1E4F28BA0];
  int v4 = [a1 predicateForInvalidDayHighlights];
  uint64_t v5 = objc_msgSend(a1, "predicateForInvalidDayGroupHighlights", v4);
  v10[1] = v5;
  uint64_t v6 = [a1 predicateForInvalidMonthOrYearHighlights];
  v10[2] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  id v8 = [v3 orPredicateWithSubpredicates:v7];

  return v8;
}

+ (id)predicateForEmptyHighlightsOfKind:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  v10[2] = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend(a1, "_predicateForHighlightsOfKind:");
  if (v3 > 3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:off_1E58633B0[v3]];
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
  v10[0] = v4;
  v10[1] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = [v6 andPredicateWithSubpredicates:v7];

  return v8;
}

+ (id)_predicateForHighlightsOfKind:(unsigned __int16)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind = %d", a3);
}

+ (id)predicateForAllAssetsInPhotosHighlight:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [v3 kind];
  int v5 = v4;
  if ((v4 - 1) < 2)
  {
    id v10 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = [v3 uuid];
      *(_DWORD *)buf = 67109378;
      int v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Error: kind %d not supported for fetching all assets - highlight UUID: %@", buf, 0x12u);
    }
    goto LABEL_8;
  }
  if (v4 == 3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v7 = [v3 objectID];
    id v8 = (void *)v7;
    id v9 = @"dayGroupHighlightBeingAssets";
    goto LABEL_10;
  }
  if (v4)
  {
LABEL_8:
    objc_super v12 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v7 = [v3 objectID];
  id v8 = (void *)v7;
  id v9 = @"highlightBeingAssets";
LABEL_10:
  objc_super v12 = [v6 predicateWithFormat:@"%K = %@", v9, v7];

LABEL_11:
  return v12;
}

+ (id)allPhotosHighlightsInManagedObjectContext:(id)a3 predicate:(id)a4 keyPathsForPrefetching:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1E4F1C0D0];
  __int16 v14 = [a1 entityName];
  int v15 = [v13 fetchRequestWithEntityName:v14];

  [v15 setFetchBatchSize:100];
  if (v11) {
    [v15 setPredicate:v11];
  }
  if (v12) {
    [v15 setRelationshipKeyPathsForPrefetching:v12];
  }
  __int16 v16 = [v10 executeFetchRequest:v15 error:a6];

  return v16;
}

+ (id)insertNewPhotosHighlightInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 entityName];
  id v8 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v7, (uint64_t)v6, a4);

  return v8;
}

+ (id)entityName
{
  return @"PhotosHighlight";
}

+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4 title:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [a3 managedObjectContext];
  id v11 = [a1 entityName];
  id v12 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v11, (uint64_t)v10, 0);

  if (v12)
  {
    [v12 setUuid:v8];
    [v12 setTitle:v9];
  }

  return v12;
}

+ (id)fetchRequest
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  int v4 = [a1 entityName];
  int v5 = (void *)[v3 initWithEntityName:v4];

  return v5;
}

+ (signed)calculateSharingCompositionForPhotosHighlight:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [v3 kind];
  if ((v4 - 1) >= 2)
  {
    if (v4 == 3 || !v4)
    {
      if ([v3 kind] == 3) {
        int v5 = [v3 dayGroupAssetsCountShared];
      }
      else {
        int v5 = [v3 assetsCountShared];
      }
      int v16 = v5;
      if ([v3 kind] == 3) {
        int v17 = [v3 dayGroupAssetsCountPrivate];
      }
      else {
        int v17 = [v3 assetsCountPrivate];
      }
      if (v17) {
        __int16 v18 = 2;
      }
      else {
        __int16 v18 = 1;
      }
      if (v16) {
        signed __int16 v15 = v18;
      }
      else {
        signed __int16 v15 = 0;
      }
      goto LABEL_41;
    }
LABEL_40:
    signed __int16 v15 = 0;
    goto LABEL_41;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = objc_msgSend(v3, "childPhotosHighlights", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v7)
  {

    goto LABEL_40;
  }
  uint64_t v8 = v7;
  char v9 = 0;
  char v10 = 0;
  uint64_t v11 = *(void *)v21;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v21 != v11) {
        objc_enumerationMutation(v6);
      }
      int v13 = [*(id *)(*((void *)&v20 + 1) + 8 * i) sharingComposition];
      if (v13 == 2)
      {
        char v9 = 1;
      }
      else if (v13 != 1)
      {
        if (!v13) {
          char v9 = 1;
        }
        if ((v10 & 1) == 0) {
          continue;
        }
        goto LABEL_19;
      }
      char v10 = 1;
LABEL_19:
      if (v9)
      {

        char v10 = 1;
        goto LABEL_25;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v8) {
      continue;
    }
    break;
  }

  if ((v9 & 1) == 0)
  {
    __int16 v14 = 1;
    goto LABEL_26;
  }
LABEL_25:
  __int16 v14 = 2;
LABEL_26:
  if (v10) {
    signed __int16 v15 = v14;
  }
  else {
    signed __int16 v15 = 0;
  }
LABEL_41:

  return v15;
}

+ (id)stringFromHighlightKind:(unsigned __int16)a3
{
  if (a3 > 3u) {
    return @"Unknown kind";
  }
  else {
    return off_1E5863378[a3];
  }
}

+ (id)defaultPropertiesToFetchForMomentList
{
  pl_dispatch_once();
  uint64_t v2 = (void *)defaultPropertiesToFetchForMomentList_pl_once_object_29;
  return v2;
}

void __80__PLPhotosHighlight_PLMomentList_Private__defaultPropertiesToFetchForMomentList__block_invoke()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[PLManagedObject objectIDDescription];
  v4[0] = v0;
  v4[1] = @"uuid";
  v4[2] = @"kind";
  v4[3] = @"endDate";
  v4[4] = @"startDate";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  uint64_t v2 = [v1 copy];
  id v3 = (void *)defaultPropertiesToFetchForMomentList_pl_once_object_29;
  defaultPropertiesToFetchForMomentList_pl_once_object_29 = v2;
}

+ (id)allowedPropertiesForMomentList
{
  pl_dispatch_once();
  uint64_t v2 = (void *)allowedPropertiesForMomentList_pl_once_object_28;
  return v2;
}

void __73__PLPhotosHighlight_PLMomentList_Private__allowedPropertiesForMomentList__block_invoke()
{
  v6[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v1 = +[PLManagedObject objectIDDescription];
  v6[0] = v1;
  v6[1] = @"objectID";
  v6[2] = @"uuid";
  v6[3] = @"kind";
  v6[4] = @"endDate";
  v6[5] = @"startDate";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:6];
  id v3 = [v0 setWithArray:v2];
  uint64_t v4 = [v3 copy];
  int v5 = (void *)allowedPropertiesForMomentList_pl_once_object_28;
  allowedPropertiesForMomentList_pl_once_object_28 = v4;
}

- (BOOL)isEligibleForSearchIndexing
{
  if ([(PLPhotosHighlight *)self isDeleted]) {
    return 0;
  }
  uint64_t v3 = [(PLPhotosHighlight *)self uuid];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = [(PLPhotosHighlight *)self startDate];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = [(PLPhotosHighlight *)self endDate];

    if (v7)
    {
      uint64_t v8 = [(PLPhotosHighlight *)self keyAssetForKindPrivate];
      char v9 = [v8 dateCreated];
      if (v9)
      {

LABEL_9:
        int v13 = objc_opt_class();
        uint64_t v4 = [(PLManagedObject *)self photoLibrary];
        __int16 v14 = objc_msgSend(v13, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", +[PLSpotlightDonationUtilities wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:](PLSpotlightDonationUtilities, "wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:", v4));
        char v10 = [v14 evaluateWithObject:self];

        goto LABEL_10;
      }
      uint64_t v11 = [(PLPhotosHighlight *)self keyAssetForKindShared];
      id v12 = [v11 dateCreated];

      if (v12) {
        goto LABEL_9;
      }
    }
    return 0;
  }
  char v10 = 0;
LABEL_10:

  return v10;
}

+ (id)fetchHighlightsWithUUIDs:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[PLPhotosHighlight fetchRequest];
  char v9 = [a1 propertiesToFetch];
  [v8 setPropertiesToFetch:v9];

  [v8 setIncludesPendingChanges:0];
  if ((unint64_t)[v6 count] >= 0x65) {
    [v8 setFetchBatchSize:100];
  }
  char v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v6];
  [v8 setPredicate:v10];

  objc_msgSend(v8, "setFetchLimit:", objc_msgSend(v6, "count"));
  id v15 = 0;
  uint64_t v11 = [v7 executeFetchRequest:v8 error:&v15];

  id v12 = v15;
  if (v11) {
    [MEMORY[0x1E4F8B9B8] successWithResult:v11];
  }
  else {
  int v13 = [MEMORY[0x1E4F8B9B8] failureWithError:v12];
  }

  return v13;
}

+ (id)relationshipKeyPathsToPrefetch
{
  return 0;
}

+ (id)propertiesToFetch
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"uuid";
  v4[1] = @"title";
  v4[2] = @"keyAssetPrivate";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];
  return v2;
}

+ (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier:(int64_t)a3
{
  return +[PLPhotosHighlight predicateForAllTripHighlights];
}

@end