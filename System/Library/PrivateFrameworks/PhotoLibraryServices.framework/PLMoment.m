@interface PLMoment
+ (NSArray)sortByTimeSortDescriptors;
+ (id)allAssetsInManagedObjectContext:(id)a3 predicate:(id)a4 IDsOnly:(BOOL)a5 error:(id *)a6;
+ (id)allAssetsIncludedInMomentsInLibrary:(id)a3;
+ (id)allAssetsIncludedInMomentsInManagedObjectContext:(id)a3 IDsOnly:(BOOL)a4 error:(id *)a5;
+ (id)allInvalidAssetsInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)allInvalidMomentsInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)allMomentIDsInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)allMomentsInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)allMomentsInManagedObjectContext:(id)a3 predicate:(id)a4 idsOnly:(BOOL)a5 error:(id *)a6;
+ (id)allMomentsRequiringAnalysisInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:(id)a3 andAssetPredicate:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6;
+ (id)batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5;
+ (id)batchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs:(id)a3 library:(id)a4 error:(id *)a5;
+ (id)entityName;
+ (id)fetchPredicateForExcludingOriginatorState:(signed __int16)a3;
+ (id)insertNewMomentInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)momentIDsWithPersonIDs:(id)a3 inContext:(id)a4;
+ (id)momentsRequiringLocationProcessingWhenCoreRoutineIsAvailableInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)momentsRequiringLocationProcessingWhenFrequentLocationsAreAvailableInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)momentsRequiringLocationProcessingWhenFrequentLocationsChangedInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)momentsWithLocationOfInterestInManagedObjectContext:(id)a3 error:(id *)a4;
+ (id)predicateForAssetsIncludedInMoments;
+ (id)predicateForInvalidAssets;
+ (id)predicateForInvalidMoments;
+ (void)_recalculateAssetCountsForMoment:(id)a3;
+ (void)batchFetchMomentUUIDsByAssetUUIDsWithAssetUUIDs:(id)a3 library:(id)a4 completion:(id)a5;
+ (void)enumerateAssetUUIDsForSearchIndexingWithMomentUUID:(id)a3 managedObjectContext:(id)a4 libraryIdentifier:(int64_t)a5 assetUUIDHandler:(id)a6;
- (BOOL)didRegisteredWithUserInterfaceContext;
- (BOOL)isCloudSharedAlbum;
- (BOOL)isRegisteredForChanges;
- (CGImage)posterImage;
- (CLLocation)approximateLocation;
- (CLLocationCoordinate2D)pl_coordinate;
- (NSArray)batchedAssets;
- (NSDate)localEndDate;
- (NSDate)localStartDate;
- (id)bestAsset;
- (id)edgesIn;
- (id)edgesOut;
- (id)groupURL;
- (int)_cachedSharedAssetContainerValueWithRecalcIfNeededForKey:(id)a3;
- (int)assetsCount;
- (int)assetsCountPrivate;
- (int)assetsCountShared;
- (signed)sharingComposition;
- (unint64_t)countForAssetsOfKind:(signed __int16)a3;
- (unint64_t)fetchedAssetsCount;
- (unint64_t)pl_numberOfAssets;
- (void)awakeFromFetch;
- (void)awakeFromInsert;
- (void)dealloc;
- (void)delete;
- (void)didTurnIntoFault;
- (void)enumerateAssetSearchEntitiesWithBlock:(id)a3;
- (void)implementsPLGraphEdgeReferenceObjectRecipient;
- (void)insertAssetData:(id)a3;
- (void)prepareForDeletion;
- (void)recalculateSharedAssetContainerCachedValues;
- (void)registerForChanges;
- (void)removeAssetData:(id)a3;
- (void)removeAssetsObject:(id)a3;
- (void)replaceObjectInAssets:(id)a3 withObject:(id)a4;
- (void)reportSharedAssetContainerIncrementalChange:(id)a3 forAllAssetsCountKey:(id)a4;
- (void)setApproximateLocation:(id)a3;
- (void)setDidRegisteredWithUserInterfaceContext:(BOOL)a3;
- (void)setIsRegisteredForChanges:(BOOL)a3;
- (void)unregisterForChanges;
- (void)willSave;
- (void)willTurnIntoFault;
@end

@implementation PLMoment

+ (id)entityName
{
  return @"Moment";
}

+ (void)enumerateAssetUUIDsForSearchIndexingWithMomentUUID:(id)a3 managedObjectContext:(id)a4 libraryIdentifier:(int64_t)a5 assetUUIDHandler:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [v9 length];
  if (v11 && v10 && v12)
  {
    v13 = +[PLMoment fetchRequest];
    [v13 setResultType:1];
    v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"uuid", v9];
    [v13 setPredicate:v14];

    id v58 = 0;
    v15 = [v10 executeFetchRequest:v13 error:&v58];
    id v16 = v58;
    uint64_t v17 = [v15 firstObject];
    v18 = (void *)v17;
    if (v17)
    {
      int64_t v43 = a5;
      v44 = (void *)v17;
      id v45 = v16;
      v46 = v15;
      v47 = v13;
      v48 = v11;
      v49 = v10;
      v19 = [v10 deletedObjects];
      v50 = [MEMORY[0x1E4F1CA80] set];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v54 objects:v61 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v55 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            v26 = [v25 entity];
            v27 = [v26 name];
            v28 = +[PLManagedAsset entityName];
            int v29 = [v27 isEqualToString:v28];

            if (v29)
            {
              id v30 = v25;
              v31 = [v30 uuid];
              if (v31) {
                [v50 addObject:v31];
              }
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v54 objects:v61 count:16];
        }
        while (v22);
      }

      v18 = v44;
      v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K == %@", @"moment", v44];
      v33 = +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:v43];
      v34 = (void *)MEMORY[0x1E4F1C0D0];
      v35 = +[PLManagedAsset entityName];
      v36 = [v34 fetchRequestWithEntityName:v35];

      [v36 setResultType:2];
      v60[0] = @"objectID";
      v60[1] = @"uuid";
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
      [v36 setPropertiesToFetch:v37];

      v38 = (void *)MEMORY[0x1E4F28BA0];
      v59[0] = v32;
      v59[1] = v33;
      v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
      v40 = [v38 andPredicateWithSubpredicates:v39];
      [v36 setPredicate:v40];

      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __135__PLMoment_SearchIndexing__enumerateAssetUUIDsForSearchIndexingWithMomentUUID_managedObjectContext_libraryIdentifier_assetUUIDHandler___block_invoke;
      v51[3] = &unk_1E586E608;
      id v52 = v50;
      id v11 = v48;
      id v53 = v48;
      id v41 = v50;
      id v10 = v49;
      id v42 = (id)[v49 enumerateObjectsFromFetchRequest:v36 count:0 usingDefaultBatchSizeWithBlock:v51];

      v15 = v46;
      v13 = v47;
      id v16 = v45;
    }
    else
    {
      v20 = PLSearchBackendPhotosDatabaseFetchGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v63 = v9;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Cannot find moment with uuid: %{public}@", buf, 0xCu);
      }
    }
  }
}

void __135__PLMoment_SearchIndexing__enumerateAssetUUIDsForSearchIndexingWithMomentUUID_managedObjectContext_libraryIdentifier_assetUUIDHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKey:@"uuid"];
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void).cxx_destruct
{
}

- (void)setDidRegisteredWithUserInterfaceContext:(BOOL)a3
{
  self->didRegisteredWithUserInterfaceContext = a3;
}

- (BOOL)didRegisteredWithUserInterfaceContext
{
  return self->didRegisteredWithUserInterfaceContext;
}

- (void)setIsRegisteredForChanges:(BOOL)a3
{
  self->isRegisteredForChanges = a3;
}

- (BOOL)isRegisteredForChanges
{
  return self->isRegisteredForChanges;
}

- (unint64_t)pl_numberOfAssets
{
  return (int)[(PLMoment *)self cachedCount];
}

- (CLLocationCoordinate2D)pl_coordinate
{
  if (!self->_didCacheCoordinate)
  {
    [(PLMoment *)self approximateLongitude];
    CLLocationDegrees v4 = v3;
    [(PLMoment *)self approximateLatitude];
    p_cachedCoordinate = &self->_cachedCoordinate;
    if (v5 == 0.0 && v4 == 0.0)
    {
      CLLocationCoordinate2D *p_cachedCoordinate = *(CLLocationCoordinate2D *)MEMORY[0x1E4F1E750];
    }
    else
    {
      CLLocationCoordinate2D v7 = CLLocationCoordinate2DMake(v5, v4);
      p_cachedCoordinate->double latitude = v7.latitude;
      self->_cachedCoordinate.double longitude = v7.longitude;
    }
    self->_didCacheCoordinate = 1;
  }
  double latitude = self->_cachedCoordinate.latitude;
  double longitude = self->_cachedCoordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)implementsPLGraphEdgeReferenceObjectRecipient
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
}

- (id)edgesOut
{
  return +[PLGraphEdge edgesOutFromObject:self];
}

- (id)edgesIn
{
  return +[PLGraphEdge edgesInToObject:self];
}

- (NSDate)localEndDate
{
  double v3 = [(PLMoment *)self endDate];
  id v4 = objc_msgSend(v3, "dateByAddingTimeInterval:", (double)(int)-[PLMoment timeZoneOffset](self, "timeZoneOffset"));

  return (NSDate *)v4;
}

- (NSDate)localStartDate
{
  double v3 = [(PLMoment *)self startDate];
  id v4 = objc_msgSend(v3, "dateByAddingTimeInterval:", (double)(int)-[PLMoment timeZoneOffset](self, "timeZoneOffset"));

  return (NSDate *)v4;
}

- (unint64_t)fetchedAssetsCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = +[PLManagedAsset entityName];
  CLLocationDegrees v5 = [v3 fetchRequestWithEntityName:v4];

  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"moment", self];
  [v5 setPredicate:v6];

  CLLocationCoordinate2D v7 = [(PLMoment *)self managedObjectContext];
  id v12 = 0;
  unint64_t v8 = [v7 countForFetchRequest:v5 error:&v12];
  id v9 = v12;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Unable to fetch assets count: %@", buf, 0xCu);
    }

    unint64_t v8 = 0;
  }

  return v8;
}

- (NSArray)batchedAssets
{
  v21[1] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = +[PLManagedAsset entityName];
  CLLocationDegrees v5 = [v3 fetchRequestWithEntityName:v4];

  [v5 setFetchBatchSize:100];
  [v5 setReturnsObjectsAsFaults:0];
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"moment", self];
  [v5 setPredicate:v6];

  v21[0] = @"additionalAttributes";
  CLLocationCoordinate2D v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  [v5 setRelationshipKeyPathsForPrefetching:v7];

  unint64_t v8 = [(PLMoment *)self managedObjectContext];
  id v16 = 0;
  id v9 = [v8 executeFetchRequest:v5 error:&v16];
  id v10 = v16;
  if (!v9)
  {
    id v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = (uint64_t)v10;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Unable to fetch batchedAssets: %@", buf, 0xCu);
    }
  }
  id v12 = PLBackendGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [v9 count];
    id v14 = [(PLManagedObject *)self shortObjectIDURI];
    *(_DWORD *)buf = 134218242;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "Batch fetched %lu assets from moment %@", buf, 0x16u);
  }
  return (NSArray *)v9;
}

- (void)removeAssetsObject:(id)a3
{
  id v4 = a3;
  [(PLMoment *)self willChangeValueForKey:@"assets"];
  CLLocationDegrees v5 = [(PLMoment *)self primitiveAssets];
  [v5 removeObject:v4];

  [(PLMoment *)self didChangeValueForKey:@"assets"];
  [(PLMoment *)self willChangeValueForKey:@"sharingComposition"];
  [(PLMoment *)self setPrimitiveValue:&unk_1EEBF0818 forKey:@"sharingComposition"];
  [(PLMoment *)self didChangeValueForKey:@"sharingComposition"];
}

- (void)replaceObjectInAssets:(id)a3 withObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PLMoment *)self willChangeValueForKey:@"assets"];
  unint64_t v8 = [(PLMoment *)self primitiveAssets];
  [v8 removeObject:v7];

  id v9 = [(PLMoment *)self primitiveAssets];
  [v9 addObject:v6];

  [(PLMoment *)self didChangeValueForKey:@"assets"];
}

- (void)didTurnIntoFault
{
  cachedApproximateLocation = self->_cachedApproximateLocation;
  self->_cachedApproximateLocation = 0;

  self->_didCacheApproximateLocation = 0;
  v4.receiver = self;
  v4.super_class = (Class)PLMoment;
  [(PLMoment *)&v4 didTurnIntoFault];
}

- (void)willSave
{
  v11.receiver = self;
  v11.super_class = (Class)PLMoment;
  [(PLManagedObject *)&v11 willSave];
  double v3 = [(PLMoment *)self managedObjectContext];
  if ([(PLMoment *)self isDeleted]
    && ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19F38C0C0]()))
  {
    +[PLGraphEdge cleanupDanglingReferencesInManagedObjectContext:v3];
  }
  objc_super v4 = [(PLMoment *)self changedValues];
  int v5 = PLPlatformMomentsSupported();
  if (v5)
  {
    if (([(PLMoment *)self isDeleted] & 1) == 0)
    {
      if (+[PLMomentGenerationDataManager isManagedObjectContextMomentarilyBlessed:v3])
      {
        id v6 = [v4 objectForKeyedSubscript:@"modificationDate"];

        if (!v6)
        {
          id v7 = [MEMORY[0x1E4F1C9C8] date];
          [(PLMoment *)self setModificationDate:v7];
        }
      }
    }
  }
  if (self->_waitingForSharedAssetContainerRecalc && ([(PLMoment *)self isDeleted] & 1) == 0) {
    [(PLMoment *)self recalculateSharedAssetContainerCachedValues];
  }
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v8 = [v4 objectForKeyedSubscript:@"processedLocation"];
      if (v8)
      {

LABEL_17:
        id v9 = [v3 delayedSaveActions];
        [v9 recordMomentForHighlightUpdate:self];

        goto LABEL_20;
      }
      if (+[PLAggregationProcessor isEnabled])
      {
        id v10 = [v4 objectForKeyedSubscript:@"aggregationScore"];

        if (v10) {
          goto LABEL_17;
        }
      }
    }
  }
LABEL_20:
}

- (void)insertAssetData:(id)a3
{
  id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  [(PLMoment *)self willChangeValueForKey:@"assets" withSetMutation:1 usingObjects:v5];
  objc_super v4 = [(PLMoment *)self primitiveAssets];
  [v4 minusSet:v5];

  [(PLMoment *)self didChangeValueForKey:@"assets" withSetMutation:2 usingObjects:v5];
}

- (void)removeAssetData:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 setWithObject:v5];
  [(PLMoment *)self willChangeValueForKey:@"assets" withSetMutation:2 usingObjects:v6];

  id v7 = [(PLMoment *)self primitiveAssets];
  unint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];
  [v7 minusSet:v8];

  id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v5];

  [(PLMoment *)self didChangeValueForKey:@"assets" withSetMutation:2 usingObjects:v9];
}

- (void)delete
{
  id v3 = [(PLMoment *)self managedObjectContext];
  [v3 deleteObject:self];
}

- (void)prepareForDeletion
{
  v3.receiver = self;
  v3.super_class = (Class)PLMoment;
  [(PLManagedObject *)&v3 prepareForDeletion];
  if ((PLIsAssetsd() & 1) != 0 || MEMORY[0x19F38C0C0]()) {
    +[PLGraphEdge registerDeletedObjectForDanglingReferenceCleanup:self];
  }
}

- (void)enumerateAssetSearchEntitiesWithBlock:(id)a3
{
}

- (id)bestAsset
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(PLMoment *)self assets];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v15;
    double v7 = 0.0;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v2);
      }
      id v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
      [v9 curationScore];
      double v11 = v10;
      if (!v5 || v10 > v7)
      {
        id v12 = v9;

        double v7 = v11;
        id v5 = v12;
        if (v11 == 1.0) {
          break;
        }
      }
      if (v4 == ++v8)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
        id v12 = v5;
        if (v4) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)unregisterForChanges
{
  if ([(PLMoment *)self isRegisteredForChanges])
  {
    if ([(PLMoment *)self didRegisteredWithUserInterfaceContext])
    {
      uint64_t v3 = +[PLChangeNotificationCenter defaultCenter];
      [(PLMoment *)self removeObserver:v3 forKeyPath:@"assets" context:&PLChangeNotificationCenterKVOContext];

      [(PLMoment *)self setDidRegisteredWithUserInterfaceContext:0];
    }
    [(PLMoment *)self setIsRegisteredForChanges:0];
  }
}

- (void)registerForChanges
{
  if (![(PLMoment *)self isRegisteredForChanges])
  {
    if ([(PLManagedObject *)self isRegisteredWithUserInterfaceContext])
    {
      [(PLMoment *)self setDidRegisteredWithUserInterfaceContext:1];
      uint64_t v3 = +[PLChangeNotificationCenter defaultCenter];
      [(PLMoment *)self addObserver:v3 forKeyPath:@"assets" options:8 context:&PLChangeNotificationCenterKVOContext];
    }
    [(PLMoment *)self setIsRegisteredForChanges:1];
  }
}

- (void)setApproximateLocation:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_cachedApproximateLocation, a3);
  self->_didCacheApproximateLocation = 1;
  if (v8)
  {
    [v8 coordinate];
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1E750];
    double v7 = *(double *)(MEMORY[0x1E4F1E750] + 8);
  }
  [(PLMoment *)self setApproximateLatitude:v5];
  [(PLMoment *)self setApproximateLongitude:v7];
}

- (CLLocation)approximateLocation
{
  if (!self->_didCacheApproximateLocation)
  {
    [(PLMoment *)self approximateLongitude];
    CLLocationDegrees v4 = v3;
    [(PLMoment *)self approximateLatitude];
    CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(v5, v4);
    if (+[PLLocationUtils canUseCoordinate:](PLLocationUtils, "canUseCoordinate:"))
    {
      double v7 = (CLLocation *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:v6.latitude longitude:v6.longitude];
      cachedApproximateLocation = self->_cachedApproximateLocation;
      self->_cachedApproximateLocation = v7;
    }
    else
    {
      cachedApproximateLocation = self->_cachedApproximateLocation;
      self->_cachedApproximateLocation = 0;
    }

    self->_didCacheApproximateLocation = 1;
  }
  id v9 = self->_cachedApproximateLocation;
  return v9;
}

- (void)recalculateSharedAssetContainerCachedValues
{
  self->_waitingForSharedAssetContainerRecalc = 0;
  [(id)objc_opt_class() _recalculateAssetCountsForMoment:self];
  int v3 = [(PLMoment *)self assetsCount];
  int v4 = [(PLMoment *)self assetsCountShared];
  if (v3 == v4) {
    unsigned int v5 = 1;
  }
  else {
    unsigned int v5 = 2;
  }
  if (v4) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = [NSNumber numberWithShort:v6];
  [(PLManagedObject *)self pl_safeSetValue:v7 forKey:@"sharingComposition" valueDidChangeHandler:0];
}

- (void)reportSharedAssetContainerIncrementalChange:(id)a3 forAllAssetsCountKey:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 highlightContainerChanges];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"PLMoment.m" lineNumber:268 description:@"unexpected change type."];
  }
  if (!self->_waitingForSharedAssetContainerRecalc)
  {
    if ([(PLMoment *)self isInserted])
    {
      id v9 = PLMomentsGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        double v10 = [(PLMoment *)self objectID];
        int v25 = 138412290;
        v26 = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Marking moment: %@ as waiting for recalc...", (uint8_t *)&v25, 0xCu);
      }
      self->_waitingForSharedAssetContainerRecalc = 1;
      goto LABEL_30;
    }
    if ([(PLMoment *)self isDeleted]) {
      goto LABEL_30;
    }
    double v11 = PLMomentsGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = [v6 debugDescription];
      uint64_t v13 = [(PLMoment *)self objectID];
      int v25 = 138412546;
      v26 = v12;
      __int16 v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEBUG, "Processing incremental change: %@ for moment: %@...", (uint8_t *)&v25, 0x16u);
    }
    uint64_t v14 = [v6 collectionChangeType];
    if ((unint64_t)(v14 - 1) < 2)
    {
      if ([v6 collectionChangeType] == 1) {
        int v15 = 1;
      }
      else {
        int v15 = -1;
      }
      long long v16 = objc_msgSend(NSNumber, "numberWithInt:", -[PLMoment cachedCount](self, "cachedCount") + v15);
      [(PLManagedObject *)self pl_safeSetValue:v16 forKey:@"cachedCount" valueDidChangeHandler:0];

      if ([v6 sharingChange] != 1) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    if (!v14)
    {
      uint64_t v17 = [v6 sharingChange];
      if (v17 == 1)
      {
        int v15 = 1;
        goto LABEL_22;
      }
      if (v17 == 2)
      {
        int v15 = -1;
LABEL_22:
        uint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", -[PLMoment cachedCountShared](self, "cachedCountShared") + v15);
        [(PLManagedObject *)self pl_safeSetValue:v18 forKey:@"cachedCountShared" valueDidChangeHandler:0];
      }
    }
LABEL_23:
    int v19 = [(PLMoment *)self assetsCount];
    int v20 = [(PLMoment *)self assetsCountShared];
    if (v19 == v20) {
      unsigned int v21 = 1;
    }
    else {
      unsigned int v21 = 2;
    }
    if (v20) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v23 = [NSNumber numberWithShort:v22];
    [(PLManagedObject *)self pl_safeSetValue:v23 forKey:@"sharingComposition" valueDidChangeHandler:0];
  }
LABEL_30:
}

- (int)assetsCountPrivate
{
  int v3 = [(PLMoment *)self assetsCount];
  return v3 - [(PLMoment *)self assetsCountShared];
}

- (signed)sharingComposition
{
  return [(PLMoment *)self _cachedSharedAssetContainerValueWithRecalcIfNeededForKey:@"sharingComposition"];
}

- (int)assetsCountShared
{
  return [(PLMoment *)self _cachedSharedAssetContainerValueWithRecalcIfNeededForKey:@"cachedCountShared"];
}

- (int)assetsCount
{
  return [(PLMoment *)self _cachedSharedAssetContainerValueWithRecalcIfNeededForKey:@"cachedCount"];
}

- (int)_cachedSharedAssetContainerValueWithRecalcIfNeededForKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PLMoment.m", 238, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (self->_waitingForSharedAssetContainerRecalc) {
    [(PLMoment *)self recalculateSharedAssetContainerCachedValues];
  }
  [(PLMoment *)self willAccessValueForKey:v5];
  id v6 = [(PLMoment *)self primitiveValueForKey:v5];
  int v7 = [v6 intValue];

  [(PLMoment *)self didAccessValueForKey:v5];
  return v7;
}

- (void)dealloc
{
  [(PLMoment *)self unregisterForChanges];
  cachedApproximateLocation = self->_cachedApproximateLocation;
  self->_cachedApproximateLocation = 0;

  v4.receiver = self;
  v4.super_class = (Class)PLMoment;
  [(PLMoment *)&v4 dealloc];
}

- (void)willTurnIntoFault
{
  [(PLMoment *)self unregisterForChanges];
  v3.receiver = self;
  v3.super_class = (Class)PLMoment;
  [(PLMoment *)&v3 willTurnIntoFault];
}

- (void)awakeFromFetch
{
  v3.receiver = self;
  v3.super_class = (Class)PLMoment;
  [(PLMoment *)&v3 awakeFromFetch];
  [(PLMoment *)self registerForChanges];
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)PLMoment;
  [(PLMoment *)&v4 awakeFromInsert];
  objc_super v3 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLMoment *)self setUuid:v3];

  [(PLMoment *)self registerForChanges];
}

- (unint64_t)countForAssetsOfKind:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [(PLMoment *)self managedObjectContext];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  int v7 = +[PLManagedObject entityInManagedObjectContext:v5];
  if (v7)
  {
    [v6 setEntity:v7];
    uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
    id v9 = [(PLMoment *)self objectID];
    double v10 = [v8 predicateWithFormat:@"kind = %d AND moment = %@", v3, v9];
    [v6 setPredicate:v10];

    id v15 = 0;
    unint64_t v11 = [v5 countForFetchRequest:v6 error:&v15];
    id v12 = v15;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v13 = PLBackendGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        int v17 = v3;
        __int16 v18 = 2112;
        id v19 = v12;
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "_countForAssetsOfKind:%d fetch request failed: %@", buf, 0x12u);
      }

      unint64_t v11 = 0;
    }
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

+ (NSArray)sortByTimeSortDescriptors
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
  int v3 = objc_msgSend(MEMORY[0x1E4F29008], "sortDescriptorWithKey:ascending:", @"endDate", 1, v2);
  v7[1] = v3;
  objc_super v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:1];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return (NSArray *)v5;
}

+ (id)momentIDsWithPersonIDs:(id)a3 inContext:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    int v7 = +[PLGraphEdge fetchRequest];
    uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != nil AND %K IN %@", @"sourceAsset", @"targetPerson", v5];
    [v7 setPredicate:v8];

    v18[0] = @"sourceAsset.moment";
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v7 setPropertiesToFetch:v9];

    [v7 setReturnsDistinctResults:1];
    [v7 setResultType:2];
    id v15 = 0;
    double v10 = [v6 executeFetchRequest:v7 error:&v15];
    id v11 = v15;
    if (v10)
    {
      id v12 = objc_msgSend(v10, "_pl_map:", &__block_literal_global_102751);
      uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v12];
    }
    else
    {
      id v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Unable to fetch momentIDsWithPersonIDs: %@", buf, 0xCu);
      }
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v13;
}

uint64_t __45__PLMoment_momentIDsWithPersonIDs_inContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"sourceAsset.moment"];
}

+ (void)_recalculateAssetCountsForMoment:(id)a3
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasFaultForRelationshipNamed:@"assets"])
  {
    id v5 = (void *)MEMORY[0x1E4F1C0D0];
    id v6 = +[PLManagedAsset entityName];
    int v7 = [v5 fetchRequestWithEntityName:v6];

    v64[0] = @"libraryScope";
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
    [v7 setPropertiesToGroupBy:v8];

    [v7 setIncludesPendingChanges:1];
    id v9 = (void *)MEMORY[0x1E4F28C68];
    double v10 = [MEMORY[0x1E4F28C68] expressionForEvaluatedObject];
    id v63 = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
    id v12 = [v9 expressionForFunction:@"count:" arguments:v11];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v13 setName:@"count"];
    [v13 setExpression:v12];
    [v13 setExpressionResultType:200];
    v62[0] = @"libraryScope";
    v62[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
    [v7 setPropertiesToFetch:v14];

    [v7 setResultType:2];
    id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"moment", v4];
    [v7 setPredicate:v15];

    long long v16 = [v4 managedObjectContext];
    id v53 = 0;
    id v17 = [v16 executeFetchRequest:v7 error:&v53];
    id v18 = v53;

    if (v17)
    {
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v19 = v17;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v49 objects:v61 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        id v44 = v4;
        id v40 = v18;
        id v41 = v17;
        id v42 = v13;
        int64_t v43 = v7;
        uint64_t v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v50 != v24) {
              objc_enumerationMutation(v19);
            }
            v26 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            __int16 v27 = [v26 objectForKeyedSubscript:@"count"];
            unsigned int v28 = [v27 intValue];

            uint64_t v29 = [v26 objectForKeyedSubscript:@"libraryScope"];

            if (v29) {
              uint64_t v30 = v28;
            }
            else {
              uint64_t v30 = 0;
            }
            v22 += v30;
            if (!v29) {
              unsigned int v23 = v28;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v49 objects:v61 count:16];
        }
        while (v21);
        int v7 = v43;
        id v4 = v44;
        id v13 = v42;
        id v18 = v40;
        id v17 = v41;
LABEL_20:

        if (v17) {
          goto LABEL_33;
        }
        goto LABEL_21;
      }
    }
    else
    {
      id v19 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        long long v56 = v7;
        __int16 v57 = 2112;
        id v58 = a1;
        __int16 v59 = 2112;
        id v60 = v18;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Error executing count of collections fetch %@ for %@: %@", buf, 0x20u);
      }
    }
    uint64_t v22 = 0;
    unsigned int v23 = 0;
    goto LABEL_20;
  }
  uint64_t v22 = 0;
LABEL_21:
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v31 = [v4 assets];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    int v34 = 0;
    uint64_t v35 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(v31);
        }
        v37 = *(void **)(*((void *)&v45 + 1) + 8 * j);
        if (([v37 isDeleted] & 1) == 0)
        {
          ++v34;
          v22 += [v37 hasLibraryScope];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v33);
  }
  else
  {
    int v34 = 0;
  }

  unsigned int v23 = v34 - v22;
LABEL_33:
  v38 = [NSNumber numberWithInt:v23 + v22];
  objc_msgSend(v4, "pl_safeSetValue:forKey:valueDidChangeHandler:", v38, @"cachedCount", 0);

  v39 = [NSNumber numberWithInt:v22];
  objc_msgSend(v4, "pl_safeSetValue:forKey:valueDidChangeHandler:", v39, @"cachedCountShared", 0);
}

+ (id)fetchPredicateForExcludingOriginatorState:(signed __int16)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(%K & %i) == 0", @"originatorState", a3);
}

+ (id)allAssetsIncludedInMomentsInLibrary:(id)a3
{
  id v4 = [a3 managedObjectContext];
  uint64_t v7 = 0;
  id v5 = [a1 allAssetsIncludedInMomentsInManagedObjectContext:v4 IDsOnly:0 error:&v7];

  return v5;
}

- (CGImage)posterImage
{
  return 0;
}

- (id)groupURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  int v3 = NSString;
  id v4 = [(PLMoment *)self uuid];
  id v5 = [v3 stringWithFormat:@"%@://%@/?%@=%@", @"assets-library", @"group", @"id", v4];
  id v6 = [v2 URLWithString:v5];

  return v6;
}

- (BOOL)isCloudSharedAlbum
{
  return 0;
}

+ (id)allAssetsInManagedObjectContext:(id)a3 predicate:(id)a4 IDsOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v20[3] = *MEMORY[0x1E4F143B8];
  id v9 = (void *)MEMORY[0x1E4F1C0D0];
  id v10 = a4;
  id v11 = a3;
  id v12 = +[PLManagedAsset entityName];
  id v13 = [v9 fetchRequestWithEntityName:v12];

  [v13 setPredicate:v10];
  [v13 setFetchBatchSize:100];
  if (v7)
  {
    [v13 setResultType:1];
    [v13 setIncludesPropertyValues:0];
  }
  [v13 setRelationshipKeyPathsForPrefetching:&unk_1EEBF2390];
  uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  id v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
  long long v16 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"additionalAttributes.originalFilename" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  v20[0] = v14;
  v20[1] = v15;
  v20[2] = v16;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  [v13 setSortDescriptors:v17];

  id v18 = [v11 executeFetchRequest:v13 error:a6];

  return v18;
}

+ (id)allInvalidAssetsInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [a1 predicateForInvalidAssets];
  uint64_t v8 = [a1 allAssetsInManagedObjectContext:v6 predicate:v7 IDsOnly:0 error:a4];

  return v8;
}

+ (id)allAssetsIncludedInMomentsInManagedObjectContext:(id)a3 IDsOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [a1 predicateForAssetsIncludedInMoments];
  id v10 = [a1 allAssetsInManagedObjectContext:v8 predicate:v9 IDsOnly:v6 error:a5];

  return v10;
}

+ (id)batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:(id)a3 andAssetPredicate:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v13)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"PLMoment.m", 880, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F1C0D0];
  id v15 = +[PLManagedAsset entityName];
  long long v16 = [v14 fetchRequestWithEntityName:v15];

  uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v11];
  id v18 = (void *)v17;
  if (v12)
  {
    id v19 = (void *)MEMORY[0x1E4F28BA0];
    v35[0] = v17;
    v35[1] = v12;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    uint64_t v21 = [v19 andPredicateWithSubpredicates:v20];

    [v16 setPredicate:v21];
  }
  else
  {
    [v16 setPredicate:v17];
  }
  int v34 = @"moment";
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  [v16 setRelationshipKeyPathsForPrefetching:v22];

  [v16 setIncludesPropertyValues:0];
  id v33 = 0;
  unsigned int v23 = [v13 executeFetchRequest:v16 error:&v33];
  id v24 = v33;
  int v25 = v24;
  if (v23)
  {
    v26 = [MEMORY[0x1E4F1CA60] dictionary];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __137__PLMoment_PLMoment_Private__batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs_andAssetPredicate_inManagedObjectContext_error___block_invoke;
    v31[3] = &unk_1E5872990;
    id v27 = v26;
    id v32 = v27;
    id v28 = (id)[v13 enumerateObjectsFromFetchRequest:v16 count:0 usingDefaultBatchSizeWithBlock:v31];
  }
  else
  {
    id v27 = 0;
    if (a6) {
      *a6 = v24;
    }
  }

  return v27;
}

void __137__PLMoment_PLMoment_Private__batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs_andAssetPredicate_inManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 moment];
  id v5 = [v4 objectID];

  BOOL v6 = [v3 objectID];

  if (v5 && v6)
  {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
  else
  {
    BOOL v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Error fetching moment for asset objectID: %@, moment objectID: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

+ (id)batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  return (id)[a1 batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:a3 andAssetPredicate:0 inManagedObjectContext:a4 error:a5];
}

+ (id)batchMomentUUIDsByPhotosHighlightUUIDForPhotosHighlightUUIDs:(id)a3 library:(id)a4 error:(id *)a5
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    id v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, a1, @"PLMoment.m", 836, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  id v11 = [v10 managedObjectContext];
  uint64_t v12 = (void *)MEMORY[0x1E4F1C0D0];
  id v13 = +[PLMoment entityName];
  uint64_t v14 = [v12 fetchRequestWithEntityName:v13];

  id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"highlight.uuid", v9];
  [v14 setPredicate:v15];
  [v14 setResultType:2];
  v49[0] = @"uuid";
  v49[1] = @"highlight.uuid";
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  [v14 setPropertiesToFetch:v16];

  if (!a5)
  {
    uint64_t v43 = 0;
    a5 = (id *)&v43;
  }
  uint64_t v17 = [v11 executeFetchRequest:v14 error:a5];
  if (v17)
  {
    id v18 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      int v34 = v15;
      uint64_t v35 = v14;
      v36 = v11;
      id v37 = v10;
      id v38 = v9;
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          int v25 = [v24 objectForKeyedSubscript:@"highlight.uuid"];
          uint64_t v26 = [v24 objectForKeyedSubscript:@"uuid"];
          id v27 = (void *)v26;
          if (v25) {
            BOOL v28 = v26 == 0;
          }
          else {
            BOOL v28 = 1;
          }
          if (v28)
          {
            uint64_t v29 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v45 = v27;
              __int16 v46 = 2112;
              long long v47 = v25;
              _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_ERROR, "Error fetching highlight UUID for moment UUID: %@, highlight UUID: %@", buf, 0x16u);
            }
          }
          else
          {
            uint64_t v30 = [v18 objectForKeyedSubscript:v25];
            uint64_t v29 = v30;
            if (!v30)
            {
              uint64_t v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              [v18 setObject:v29 forKeyedSubscript:v25];
            }
            [v29 addObject:v27];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v21);
      id v10 = v37;
      id v9 = v38;
      uint64_t v14 = v35;
      id v11 = v36;
      id v15 = v34;
    }
  }
  else
  {
    id v19 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v31 = *a5;
      *(_DWORD *)buf = 138412290;
      id v45 = v31;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Error fetching momentUUID by highlightUUID: %@", buf, 0xCu);
    }
    id v18 = 0;
  }

  return v18;
}

+ (void)batchFetchMomentUUIDsByAssetUUIDsWithAssetUUIDs:(id)a3 library:(id)a4 completion:(id)a5
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void, id))a5;
  if (v11)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    id v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:a1 file:@"PLMoment.m" lineNumber:802 description:@"Completion handler is mandatory"];

    if (v10) {
      goto LABEL_3;
    }
  }
  id v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, a1, @"PLMoment.m", 803, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];

LABEL_3:
  uint64_t v12 = [v10 managedObjectContext];
  id v13 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v14 = +[PLManagedAsset entityName];
  id v15 = [v13 fetchRequestWithEntityName:v14];

  long long v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v9];
  [v15 setPredicate:v16];
  [v15 setResultType:2];
  v49[0] = @"uuid";
  v49[1] = @"moment.uuid";
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  [v15 setPropertiesToFetch:v17];

  id v43 = 0;
  id v18 = [v12 executeFetchRequest:v15 error:&v43];
  id v19 = v43;
  if (v19)
  {
    v11[2](v11, 0, v19);
  }
  else
  {
    int v34 = v16;
    uint64_t v35 = v15;
    v36 = v12;
    id v37 = v11;
    id v38 = v9;
    uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v21 = v18;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v27 = [v26 objectForKeyedSubscript:@"moment.uuid"];
          uint64_t v28 = [v26 objectForKeyedSubscript:@"uuid"];
          uint64_t v29 = (void *)v28;
          if (v27) {
            BOOL v30 = v28 == 0;
          }
          else {
            BOOL v30 = 1;
          }
          if (v30)
          {
            id v31 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              id v45 = v29;
              __int16 v46 = 2114;
              long long v47 = v27;
              _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_DEFAULT, "Could not fetch moment for asset UUID: %{public}@, moment UUID: %{public}@", buf, 0x16u);
            }
          }
          else
          {
            [v20 setObject:v27 forKey:v28];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v23);
    }

    id v11 = v37;
    ((void (**)(id, void *, id))v37)[2](v37, v20, 0);

    id v9 = v38;
    id v15 = v35;
    uint64_t v12 = v36;
    long long v16 = v34;
    id v19 = 0;
  }
}

+ (id)predicateForInvalidAssets
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"highlightBeingAssets = nil"];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"moment = nil"];
  v13[0] = v3;
  v13[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  BOOL v6 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v5];
  BOOL v7 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v6;
  int v8 = [a1 predicateForAssetsIncludedInMoments];
  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  id v10 = [v7 andPredicateWithSubpredicates:v9];

  return v10;
}

+ (id)predicateForInvalidMoments
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"highlight = nil"];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"assets.@count = 0"];
  v7[0] = v2;
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v4];

  return v5;
}

+ (id)predicateForAssetsIncludedInMoments
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28BA0];
  id v3 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForAssetsIncludedInMoments"), 1);
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d AND %K == NO AND %K == %d", @"visibilityState", 0, @"hidden", @"trashedState", 0, v3);
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  BOOL v6 = [v2 andPredicateWithSubpredicates:v5];

  return v6;
}

+ (id)momentsWithLocationOfInterestInManagedObjectContext:(id)a3 error:(id *)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  int v8 = [a1 entityName];
  id v9 = [v6 fetchRequestWithEntityName:v8];

  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d OR %K == %d", @"processedLocation", 3, @"processedLocation", 4);
  [v9 setPredicate:v10];
  id v11 = [v7 executeFetchRequest:v9 error:a4];

  return v11;
}

+ (id)momentsRequiringLocationProcessingWhenFrequentLocationsChangedInManagedObjectContext:(id)a3 error:(id *)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  int v8 = [a1 entityName];
  id v9 = [v6 fetchRequestWithEntityName:v8];

  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d OR %K == %d OR %K == %d OR %K == %d OR %K == %d OR %K == %d", @"processedLocation", 0, @"processedLocation", 8, @"processedLocation", 9, @"processedLocation", 5, @"processedLocation", 1, @"processedLocation", 6);
  [v9 setPredicate:v10];
  id v11 = [v7 executeFetchRequest:v9 error:a4];

  return v11;
}

+ (id)momentsRequiringLocationProcessingWhenFrequentLocationsAreAvailableInManagedObjectContext:(id)a3 error:(id *)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  int v8 = [a1 entityName];
  id v9 = [v6 fetchRequestWithEntityName:v8];

  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d OR %K == %d", @"processedLocation", 0, @"processedLocation", 9);
  [v9 setPredicate:v10];
  id v11 = [v7 executeFetchRequest:v9 error:a4];

  return v11;
}

+ (id)momentsRequiringLocationProcessingWhenCoreRoutineIsAvailableInManagedObjectContext:(id)a3 error:(id *)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  int v8 = [a1 entityName];
  id v9 = [v6 fetchRequestWithEntityName:v8];

  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d OR %K == %d OR %K == %d", @"processedLocation", 0, @"processedLocation", 8, @"processedLocation", 1);
  [v9 setPredicate:v10];
  id v11 = [v7 executeFetchRequest:v9 error:a4];

  return v11;
}

+ (id)allMomentsRequiringAnalysisInManagedObjectContext:(id)a3 error:(id *)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  int v8 = [a1 entityName];
  id v9 = [v6 fetchRequestWithEntityName:v8];

  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY assets.additionalAttributes.reverseLocationDataIsValid == NO"];
  [v9 setPredicate:v10];
  id v11 = [v7 executeFetchRequest:v9 error:a4];

  return v11;
}

+ (id)allMomentsInManagedObjectContext:(id)a3 predicate:(id)a4 idsOnly:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (void *)MEMORY[0x1E4F1C0D0];
  id v12 = a4;
  id v13 = [a1 entityName];
  uint64_t v14 = [v11 fetchRequestWithEntityName:v13];

  [v14 setPredicate:v12];
  id v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"representativeDate" ascending:1];
  v19[0] = v15;
  long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v14 setSortDescriptors:v16];

  [v14 setFetchBatchSize:100];
  if (v7)
  {
    [v14 setResultType:1];
    [v14 setIncludesPropertyValues:0];
  }
  uint64_t v17 = [v10 executeFetchRequest:v14 error:a6];

  return v17;
}

+ (id)allInvalidMomentsInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[PLMoment predicateForInvalidMoments];
  int v8 = [a1 allMomentsInManagedObjectContext:v6 predicate:v7 idsOnly:0 error:a4];

  return v8;
}

+ (id)allMomentIDsInManagedObjectContext:(id)a3 error:(id *)a4
{
  return (id)[a1 allMomentsInManagedObjectContext:a3 predicate:0 idsOnly:1 error:a4];
}

+ (id)allMomentsInManagedObjectContext:(id)a3 error:(id *)a4
{
  return (id)[a1 allMomentsInManagedObjectContext:a3 predicate:0 idsOnly:0 error:a4];
}

+ (id)insertNewMomentInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [a1 entityName];
  int v8 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v7, (uint64_t)v6, a4);

  return v8;
}

@end