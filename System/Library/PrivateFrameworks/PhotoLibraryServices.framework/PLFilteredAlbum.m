@interface PLFilteredAlbum
+ (id)descriptionForAlbumFilter:(int)a3 parameters:(id)a4;
+ (id)filteredAlbum:(id)a3 filter:(int)a4;
+ (id)filteredAlbum:(id)a3 filter:(int)a4 parameters:(id)a5;
+ (id)filteredAlbum:(id)a3 intersectFilter:(int)a4;
+ (id)filteredAlbum:(id)a3 predicate:(id)a4;
+ (id)filteredIndexesInAlbum:(id)a3 predicate:(id)a4;
+ (id)predicateForAlbumFilter:(int)a3 parameters:(id)a4 photoLibrary:(id)a5;
+ (id)unfilteredAlbum:(id)a3;
- (BOOL)canContributeToCloudSharedAlbum;
- (BOOL)canPerformEditOperation:(unint64_t)a3;
- (BOOL)canShowAvalancheStacks;
- (BOOL)canShowComments;
- (BOOL)cloudNotificationsEnabled;
- (BOOL)cloudOwnerIsWhitelisted;
- (BOOL)hasUnseenContentBoolValue;
- (BOOL)isCameraAlbum;
- (BOOL)isCloudSharedAlbum;
- (BOOL)isEmpty;
- (BOOL)isFamilyCloudSharedAlbum;
- (BOOL)isFolder;
- (BOOL)isInTrash;
- (BOOL)isLibrary;
- (BOOL)isMultipleContributorCloudSharedAlbum;
- (BOOL)isObservingContextChanges;
- (BOOL)isOwnedCloudSharedAlbum;
- (BOOL)isPanoramasAlbum;
- (BOOL)isPendingPhotoStreamAlbum;
- (BOOL)isPhotoStreamAlbum;
- (BOOL)isProjectAlbum;
- (BOOL)isRecentlyAddedAlbum;
- (BOOL)isStandInAlbum;
- (BOOL)isUserLibraryAlbum;
- (BOOL)mappedDataSourceChanged:(id)a3 remoteNotificationData:(id)a4;
- (BOOL)shouldDeleteWhenEmpty;
- (BOOL)shouldIncludeObjectAtIndex:(unint64_t)a3;
- (Class)derivedChangeNotificationClass;
- (NSArray)filterParameters;
- (NSArray)localizedLocationNames;
- (NSDate)cloudCreationDate;
- (NSDate)cloudFirstRecentBatchDate;
- (NSDate)cloudLastContributionDate;
- (NSDate)cloudLastInterestingChangeDate;
- (NSDate)cloudSubscriptionDate;
- (NSDictionary)cloudMetadata;
- (NSIndexSet)filteredIndexes;
- (NSMutableOrderedSet)_assets;
- (NSMutableOrderedSet)mutableAssets;
- (NSMutableOrderedSet)userEditableAssets;
- (NSNumber)cloudMultipleContributorsEnabled;
- (NSNumber)cloudMultipleContributorsEnabledLocal;
- (NSNumber)cloudPublicURLEnabled;
- (NSNumber)cloudPublicURLEnabledLocal;
- (NSNumber)kind;
- (NSNumber)unseenAssetsCount;
- (NSObject)cachedIndexMapState;
- (NSObject)posterImage;
- (NSOrderedSet)cloudAlbumSubscriberRecords;
- (NSOrderedSet)invitationRecords;
- (NSPredicate)predicate;
- (NSString)cloudGUID;
- (NSString)cloudOwnerEmail;
- (NSString)cloudOwnerFirstName;
- (NSString)cloudOwnerFullName;
- (NSString)cloudOwnerHashedPersonID;
- (NSString)cloudOwnerLastName;
- (NSString)cloudPersonID;
- (NSString)description;
- (NSString)importSessionID;
- (NSString)localizedSharedWithLabel;
- (NSString)localizedTitle;
- (NSString)name;
- (NSString)publicURL;
- (NSString)title;
- (NSString)uuid;
- (NSURL)groupURL;
- (PLAlbumProtocol)backingAlbum;
- (PLFilteredAlbum)initWithBackingAlbum:(id)a3 filter:(int)a4 parameters:(id)a5;
- (PLFilteredAlbum)initWithBackingAlbum:(id)a3 predicate:(id)a4;
- (PLIndexMapper)indexMapper;
- (PLPhotoLibrary)photoLibrary;
- (id)_cloudSharedBackingAlbum;
- (id)_editableBackingAlbum;
- (id)cloudOwnerDisplayNameIncludingEmail:(BOOL)a3 allowsEmail:(BOOL)a4;
- (id)currentStateForChange;
- (id)filteredAssetsAtIndexes:(id)a3;
- (id)localizedSharedByLabelAllowsEmail:(BOOL)a3;
- (id)objectInFilteredAssetsAtIndex:(unint64_t)a3;
- (id)sortingComparator;
- (int)cloudRelationshipStateLocalValue;
- (int)cloudRelationshipStateValue;
- (int)filter;
- (int)kindValue;
- (int)pendingItemsCount;
- (int)pendingItemsType;
- (unint64_t)approximateCount;
- (unint64_t)assetsCount;
- (unint64_t)countOfFilteredAssets;
- (unint64_t)indexInFilteredAssetsOfObject:(id)a3;
- (unint64_t)photosCount;
- (unint64_t)unseenAssetsCountIntegerValue;
- (unint64_t)videosCount;
- (void)_commonInitWithBackingAlbum:(id)a3 predicate:(id)a4;
- (void)backingContextDidChange:(id)a3;
- (void)batchFetchAssets:(id)a3;
- (void)dealloc;
- (void)getUnseenStartMarkerIndex:(unint64_t *)a3 count:(unint64_t *)a4 showsProgress:(BOOL *)a5;
- (void)insertFilteredAssets:(id)a3 atIndexes:(id)a4;
- (void)insertObject:(id)a3 inFilteredAssetsAtIndex:(unint64_t)a4;
- (void)removeFilteredAssetsAtIndexes:(id)a3;
- (void)removeObjectFromFilteredAssetsAtIndex:(unint64_t)a3;
- (void)replaceFilteredAssetsAtIndexes:(id)a3 withFilteredValues:(id)a4;
- (void)replaceObjectInFilteredAssetsAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setBackingAlbum:(id)a3;
- (void)setCloudCreationDate:(id)a3;
- (void)setCloudGUID:(id)a3;
- (void)setCloudLastContributionDate:(id)a3;
- (void)setCloudLastInterestingChangeDate:(id)a3;
- (void)setCloudMetadata:(id)a3;
- (void)setCloudMultipleContributorsEnabled:(id)a3;
- (void)setCloudMultipleContributorsEnabledLocal:(id)a3;
- (void)setCloudNotificationsEnabled:(BOOL)a3;
- (void)setCloudOwnerEmail:(id)a3;
- (void)setCloudOwnerFirstName:(id)a3;
- (void)setCloudOwnerFullName:(id)a3;
- (void)setCloudOwnerHashedPersonID:(id)a3;
- (void)setCloudOwnerIsWhitelisted:(BOOL)a3;
- (void)setCloudOwnerLastName:(id)a3;
- (void)setCloudPersonID:(id)a3;
- (void)setCloudPublicURLEnabled:(id)a3;
- (void)setCloudPublicURLEnabledLocal:(id)a3;
- (void)setCloudSubscriptionDate:(id)a3;
- (void)setFilter:(int)a3;
- (void)setHasUnseenContentBoolValue:(BOOL)a3;
- (void)setImportSessionID:(id)a3;
- (void)setInvitationRecords:(id)a3;
- (void)setIsObservingContextChanges:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)setPublicURL:(id)a3;
- (void)setUnseenAssetsCount:(id)a3;
- (void)setUnseenAssetsCountIntegerValue:(unint64_t)a3;
- (void)set_assets:(id)a3;
- (void)updateCloudLastContributionDateWithDate:(id)a3;
- (void)updateCloudLastInterestingChangeDateWithDate:(id)a3;
- (void)userDeleteSubscriberRecord:(id)a3;
@end

@implementation PLFilteredAlbum

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterParameters, 0);
  objc_storeStrong((id *)&self->predicate, 0);
  objc_storeStrong((id *)&self->_backingAlbum, 0);
  objc_destroyWeak((id *)&self->_weak_assets);
  objc_storeStrong((id *)&self->_filteredIndexes, 0);
  objc_storeStrong((id *)&self->_indexMapper, 0);
}

- (NSArray)filterParameters
{
  return self->_filterParameters;
}

- (void)setIsObservingContextChanges:(BOOL)a3
{
  self->isObservingContextChanges = a3;
}

- (BOOL)isObservingContextChanges
{
  return self->isObservingContextChanges;
}

- (void)setPredicate:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->predicate;
}

- (void)setFilter:(int)a3
{
  self->filter = a3;
}

- (int)filter
{
  return self->filter;
}

- (PLAlbumProtocol)backingAlbum
{
  return self->_backingAlbum;
}

- (void)replaceFilteredAssetsAtIndexes:(id)a3 withFilteredValues:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(PLFilteredAlbum *)self _editableBackingAlbum];
  v8 = [v10 userEditableAssets];
  v9 = [(PLIndexMapper *)self->_indexMapper backingIndexesForIndexes:v7];

  [v8 replaceObjectsAtIndexes:v9 withObjects:v6];
}

- (void)replaceObjectInFilteredAssetsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  id v8 = [(PLFilteredAlbum *)self _editableBackingAlbum];
  id v7 = [v8 userEditableAssets];
  objc_msgSend(v7, "replaceObjectAtIndex:withObject:", -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a3), v6);
}

- (void)removeFilteredAssetsAtIndexes:(id)a3
{
  id v6 = [(PLIndexMapper *)self->_indexMapper backingIndexesForIndexes:a3];
  v4 = [(PLFilteredAlbum *)self _editableBackingAlbum];
  v5 = [v4 userEditableAssets];
  [v5 removeObjectsAtIndexes:v6];
}

- (void)insertFilteredAssets:(id)a3 atIndexes:(id)a4
{
  indexMapper = self->_indexMapper;
  id v7 = a3;
  id v10 = [(PLIndexMapper *)indexMapper backingIndexesForIndexes:a4];
  id v8 = [(PLFilteredAlbum *)self _editableBackingAlbum];
  v9 = [v8 userEditableAssets];
  [v9 insertObjects:v7 atIndexes:v10];
}

- (void)removeObjectFromFilteredAssetsAtIndex:(unint64_t)a3
{
  id v6 = [(PLFilteredAlbum *)self _editableBackingAlbum];
  v5 = [v6 userEditableAssets];
  objc_msgSend(v5, "removeObjectAtIndex:", -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a3));
}

- (void)insertObject:(id)a3 inFilteredAssetsAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v8 = [(PLFilteredAlbum *)self _editableBackingAlbum];
  id v7 = [v8 userEditableAssets];
  objc_msgSend(v7, "insertObject:atIndex:", v6, -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a4));
}

- (id)_editableBackingAlbum
{
  if (self->_backingAlbumSupportsEdits)
  {
    v2 = [(PLFilteredAlbum *)self backingAlbum];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)filteredAssetsAtIndexes:(id)a3
{
  id v4 = a3;
  v5 = [(PLFilteredAlbum *)self backingAlbum];
  id v6 = [v5 assets];
  id v7 = [(PLIndexMapper *)self->_indexMapper backingIndexesForIndexes:v4];

  id v8 = [v6 objectsAtIndexes:v7];

  return v8;
}

- (id)objectInFilteredAssetsAtIndex:(unint64_t)a3
{
  v5 = [(PLFilteredAlbum *)self backingAlbum];
  id v6 = [v5 assets];
  id v7 = objc_msgSend(v6, "objectAtIndex:", -[PLIndexMapper backingIndexForIndex:](self->_indexMapper, "backingIndexForIndex:", a3));

  return v7;
}

- (unint64_t)indexInFilteredAssetsOfObject:(id)a3
{
  id v4 = a3;
  v5 = [(PLFilteredAlbum *)self backingAlbum];
  id v6 = [v5 assets];
  uint64_t v7 = [v6 indexOfObject:v4];

  unint64_t v8 = [(PLIndexMapper *)self->_indexMapper indexForBackingIndex:v7];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v9 = v8;
  if (v7 != [(PLIndexMapper *)self->_indexMapper backingIndexForIndex:v8]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v9;
}

- (unint64_t)countOfFilteredAssets
{
  v2 = [(PLFilteredAlbum *)self filteredIndexes];
  unint64_t v3 = [v2 count];

  return v3;
}

- (Class)derivedChangeNotificationClass
{
  return (Class)objc_opt_class();
}

- (BOOL)mappedDataSourceChanged:(id)a3 remoteNotificationData:(id)a4
{
  id v5 = a3;
  [(PLFilteredAlbum *)self set_assets:0];
  BOOL v6 = [(PLIndexMapper *)self->_indexMapper applyContainerChangeNotification:v5 changeTypes:15 toFilteredIndexes:self->_filteredIndexes];

  if (!v6)
  {
    filteredIndexes = self->_filteredIndexes;
    self->_filteredIndexes = 0;
  }
  return 1;
}

- (BOOL)shouldIncludeObjectAtIndex:(unint64_t)a3
{
  id v5 = [(PLFilteredAlbum *)self backingAlbum];
  BOOL v6 = [v5 assets];
  uint64_t v7 = [v6 objectAtIndex:a3];

  unint64_t v8 = [(PLFilteredAlbum *)self predicate];
  LOBYTE(v5) = [v8 evaluateWithObject:v7];

  return (char)v5;
}

- (id)currentStateForChange
{
  v2 = (void *)[(NSMutableIndexSet *)self->_filteredIndexes copy];
  return v2;
}

- (NSObject)cachedIndexMapState
{
  return self->_filteredIndexes;
}

- (NSIndexSet)filteredIndexes
{
  filteredIndexes = self->_filteredIndexes;
  if (!filteredIndexes)
  {
    id v4 = (void *)MEMORY[0x19F38D3B0](0, a2);
    id v5 = objc_opt_class();
    BOOL v6 = [(PLFilteredAlbum *)self backingAlbum];
    uint64_t v7 = [(PLFilteredAlbum *)self predicate];
    unint64_t v8 = [v5 filteredIndexesInAlbum:v6 predicate:v7];

    unint64_t v9 = self->_filteredIndexes;
    self->_filteredIndexes = v8;

    filteredIndexes = self->_filteredIndexes;
  }
  id v10 = (void *)[(NSMutableIndexSet *)filteredIndexes copy];
  return (NSIndexSet *)v10;
}

- (PLIndexMapper)indexMapper
{
  return self->_indexMapper;
}

- (PLFilteredAlbum)initWithBackingAlbum:(id)a3 filter:(int)a4 parameters:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLFilteredAlbum;
  id v10 = [(PLFilteredAlbum *)&v15 init];
  if (v10)
  {
    v11 = objc_opt_class();
    v12 = [v8 photoLibrary];
    v13 = [v11 predicateForAlbumFilter:v6 parameters:v9 photoLibrary:v12];

    [(PLFilteredAlbum *)v10 _commonInitWithBackingAlbum:v8 predicate:v13];
    [(PLFilteredAlbum *)v10 setFilter:v6];
    objc_storeStrong((id *)&v10->_filterParameters, a5);
  }
  return v10;
}

- (PLFilteredAlbum)initWithBackingAlbum:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLFilteredAlbum;
  id v8 = [(PLFilteredAlbum *)&v11 init];
  id v9 = v8;
  if (v8) {
    [(PLFilteredAlbum *)v8 _commonInitWithBackingAlbum:v6 predicate:v7];
  }

  return v9;
}

- (void)_commonInitWithBackingAlbum:(id)a3 predicate:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x19F38D3B0]();
  [(PLFilteredAlbum *)self setBackingAlbum:v19];
  id v8 = [(PLFilteredAlbum *)self backingAlbum];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v10 = [(PLFilteredAlbum *)self backingAlbum];
    [v10 registerDerivedAlbum:self];
  }
  objc_super v11 = [[PLIndexMapper alloc] initWithDataSource:self];
  indexMapper = self->_indexMapper;
  self->_indexMapper = v11;

  v13 = [(PLFilteredAlbum *)self backingAlbum];
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  if (v14)
  {
    objc_super v15 = [(PLFilteredAlbum *)self backingAlbum];
    [(PLFilteredAlbum *)self setIsObservingContextChanges:1];
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v17 = *MEMORY[0x1E4F1BE30];
    v18 = [v15 managedObjectContext];
    [v16 addObserver:self selector:sel_backingContextDidChange_ name:v17 object:v18];
  }
  [(PLFilteredAlbum *)self setPredicate:v6];
}

- (int)pendingItemsType
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  int v3 = [v2 pendingItemsType];

  return v3;
}

- (int)pendingItemsCount
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  int v3 = [v2 pendingItemsCount];

  return v3;
}

- (void)backingContextDidChange:(id)a3
{
  id v10 = a3;
  id v4 = (void *)MEMORY[0x19F38D3B0]();
  id v5 = [v10 userInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F1BDC0]];

  id v7 = [(PLFilteredAlbum *)self backingAlbum];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    [(PLFilteredAlbum *)self setBackingAlbum:0];
    [(PLFilteredAlbum *)self setPredicate:0];
    [(PLFilteredAlbum *)self willChangeValueForKey:@"assets"];
    [(PLFilteredAlbum *)self set_assets:0];
    filteredIndexes = self->_filteredIndexes;
    self->_filteredIndexes = 0;

    [(PLFilteredAlbum *)self didChangeValueForKey:@"assets"];
  }
}

- (void)userDeleteSubscriberRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 userDeleteSubscriberRecord:v4];
}

- (void)getUnseenStartMarkerIndex:(unint64_t *)a3 count:(unint64_t *)a4 showsProgress:(BOOL *)a5
{
  unint64_t v16 = 0;
  unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  id v9 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v9 getUnseenStartMarkerIndex:&v17 count:&v16 showsProgress:a5];

  unint64_t v10 = [(PLFilteredAlbum *)self assetsCount];
  uint64_t v11 = v17;
  if (a3)
  {
    uint64_t v12 = v10 - 1;
    if (v17 < v10 - 1) {
      uint64_t v12 = v17;
    }
    if (v12 < 0) {
      unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      uint64_t v11 = v12;
    }
    *a3 = v13;
  }
  if (a4)
  {
    unint64_t v14 = v10 - v11;
    if (v16 < v10 - v11) {
      unint64_t v14 = v16;
    }
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v15 = v16;
    }
    else {
      unint64_t v15 = v14;
    }
    *a4 = v15;
  }
}

- (void)updateCloudLastContributionDateWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 updateCloudLastContributionDateWithDate:v4];
}

- (void)updateCloudLastInterestingChangeDateWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 updateCloudLastInterestingChangeDateWithDate:v4];
}

- (id)cloudOwnerDisplayNameIncludingEmail:(BOOL)a3 allowsEmail:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  id v7 = [v6 cloudOwnerDisplayNameIncludingEmail:v5 allowsEmail:v4];

  return v7;
}

- (NSOrderedSet)cloudAlbumSubscriberRecords
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  int v3 = [v2 cloudAlbumSubscriberRecords];

  return (NSOrderedSet *)v3;
}

- (void)setCloudNotificationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v4 setCloudNotificationsEnabled:v3];
}

- (BOOL)cloudNotificationsEnabled
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  char v3 = [v2 cloudNotificationsEnabled];

  return v3;
}

- (NSDate)cloudFirstRecentBatchDate
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  char v3 = [v2 cloudFirstRecentBatchDate];

  return (NSDate *)v3;
}

- (NSString)localizedSharedWithLabel
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  char v3 = [v2 localizedSharedWithLabel];

  return (NSString *)v3;
}

- (id)localizedSharedByLabelAllowsEmail:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  BOOL v5 = [v4 localizedSharedByLabelAllowsEmail:v3];

  return v5;
}

- (int)cloudRelationshipStateLocalValue
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  int v3 = [v2 cloudRelationshipStateLocalValue];

  return v3;
}

- (int)cloudRelationshipStateValue
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  int v3 = [v2 cloudRelationshipStateValue];

  return v3;
}

- (void)setCloudLastContributionDate:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudLastContributionDate:v4];
}

- (NSDate)cloudLastContributionDate
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  int v3 = [v2 cloudLastContributionDate];

  return (NSDate *)v3;
}

- (void)setCloudCreationDate:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudCreationDate:v4];
}

- (NSDate)cloudCreationDate
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  int v3 = [v2 cloudCreationDate];

  return (NSDate *)v3;
}

- (void)setCloudLastInterestingChangeDate:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudLastInterestingChangeDate:v4];
}

- (NSDate)cloudLastInterestingChangeDate
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  int v3 = [v2 cloudLastInterestingChangeDate];

  return (NSDate *)v3;
}

- (void)setCloudMultipleContributorsEnabledLocal:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudMultipleContributorsEnabledLocal:v4];
}

- (NSNumber)cloudMultipleContributorsEnabledLocal
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  int v3 = [v2 cloudMultipleContributorsEnabledLocal];

  return (NSNumber *)v3;
}

- (void)setCloudMultipleContributorsEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudMultipleContributorsEnabled:v4];
}

- (NSNumber)cloudMultipleContributorsEnabled
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  int v3 = [v2 cloudMultipleContributorsEnabled];

  return (NSNumber *)v3;
}

- (void)setCloudPublicURLEnabledLocal:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudPublicURLEnabledLocal:v4];
}

- (NSNumber)cloudPublicURLEnabledLocal
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  int v3 = [v2 cloudPublicURLEnabledLocal];

  return (NSNumber *)v3;
}

- (void)setCloudPublicURLEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudPublicURLEnabled:v4];
}

- (NSNumber)cloudPublicURLEnabled
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  int v3 = [v2 cloudPublicURLEnabled];

  return (NSNumber *)v3;
}

- (void)setUnseenAssetsCountIntegerValue:(unint64_t)a3
{
  id v4 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v4 setUnseenAssetsCountIntegerValue:a3];
}

- (unint64_t)unseenAssetsCountIntegerValue
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  unint64_t v3 = [v2 unseenAssetsCountIntegerValue];

  return v3;
}

- (void)setUnseenAssetsCount:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setUnseenAssetsCount:v4];
}

- (NSNumber)unseenAssetsCount
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  unint64_t v3 = [v2 unseenAssetsCount];

  return (NSNumber *)v3;
}

- (void)setInvitationRecords:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setInvitationRecords:v4];
}

- (NSOrderedSet)invitationRecords
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  unint64_t v3 = [v2 invitationRecords];

  return (NSOrderedSet *)v3;
}

- (void)setCloudPersonID:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudPersonID:v4];
}

- (NSString)cloudPersonID
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  unint64_t v3 = [v2 cloudPersonID];

  return (NSString *)v3;
}

- (void)setPublicURL:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setPublicURL:v4];
}

- (NSString)publicURL
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  unint64_t v3 = [v2 publicURL];

  return (NSString *)v3;
}

- (void)setCloudSubscriptionDate:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudSubscriptionDate:v4];
}

- (NSDate)cloudSubscriptionDate
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  unint64_t v3 = [v2 cloudSubscriptionDate];

  return (NSDate *)v3;
}

- (void)setCloudOwnerIsWhitelisted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v4 setCloudOwnerIsWhitelisted:v3];
}

- (BOOL)cloudOwnerIsWhitelisted
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  char v3 = [v2 cloudOwnerIsWhitelisted];

  return v3;
}

- (void)setCloudOwnerHashedPersonID:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudOwnerHashedPersonID:v4];
}

- (NSString)cloudOwnerHashedPersonID
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  char v3 = [v2 cloudOwnerHashedPersonID];

  return (NSString *)v3;
}

- (void)setCloudOwnerEmail:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudOwnerEmail:v4];
}

- (NSString)cloudOwnerEmail
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  char v3 = [v2 cloudOwnerEmail];

  return (NSString *)v3;
}

- (void)setCloudOwnerFullName:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudOwnerFullName:v4];
}

- (NSString)cloudOwnerFullName
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  char v3 = [v2 cloudOwnerFullName];

  return (NSString *)v3;
}

- (void)setCloudOwnerLastName:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudOwnerLastName:v4];
}

- (NSString)cloudOwnerLastName
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  char v3 = [v2 cloudOwnerLastName];

  return (NSString *)v3;
}

- (void)setCloudOwnerFirstName:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudOwnerFirstName:v4];
}

- (NSString)cloudOwnerFirstName
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  char v3 = [v2 cloudOwnerFirstName];

  return (NSString *)v3;
}

- (void)setCloudMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudMetadata:v4];
}

- (NSDictionary)cloudMetadata
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  char v3 = [v2 cloudMetadata];

  return (NSDictionary *)v3;
}

- (void)setCloudGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  [v5 setCloudGUID:v4];
}

- (NSString)cloudGUID
{
  v2 = [(PLFilteredAlbum *)self _cloudSharedBackingAlbum];
  char v3 = [v2 cloudGUID];

  return (NSString *)v3;
}

- (id)_cloudSharedBackingAlbum
{
  if (self->_backingAlbumSupportsCloudShared)
  {
    v2 = [(PLFilteredAlbum *)self backingAlbum];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)batchFetchAssets:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self backingAlbum];
  [v5 batchFetchAssets:v4];
}

- (id)sortingComparator
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 sortingComparator];

  return v3;
}

- (NSURL)groupURL
{
  char v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = NSString;
  id v5 = [(PLFilteredAlbum *)self backingAlbum];
  id v6 = [v5 uuid];
  id v7 = [v4 stringWithFormat:@"%@://%@/?%@=%@&%@=%d", @"assets-library", @"group", @"id", v6, @"filter", -[PLFilteredAlbum filter](self, "filter")];
  int v8 = [v3 URLWithString:v7];

  return (NSURL *)v8;
}

- (void)setImportSessionID:(id)a3
{
  id v4 = a3;
  id v5 = [(PLFilteredAlbum *)self backingAlbum];
  [v5 setImportSessionID:v4];
}

- (NSString)importSessionID
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 importSessionID];

  return (NSString *)v3;
}

- (BOOL)shouldDeleteWhenEmpty
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 shouldDeleteWhenEmpty];

  return v3;
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  id v4 = [(PLFilteredAlbum *)self backingAlbum];
  LOBYTE(a3) = [v4 canPerformEditOperation:a3];

  return a3;
}

- (NSArray)localizedLocationNames
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 localizedLocationNames];

  return (NSArray *)v3;
}

- (BOOL)canShowAvalancheStacks
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 canShowAvalancheStacks];

  return v3;
}

- (BOOL)canShowComments
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 canShowComments];

  return v3;
}

- (BOOL)canContributeToCloudSharedAlbum
{
  char v3 = [(PLFilteredAlbum *)self backingAlbum];
  if ([v3 isOwnedCloudSharedAlbum])
  {
    char v4 = 1;
  }
  else
  {
    id v5 = [(PLFilteredAlbum *)self backingAlbum];
    char v4 = [v5 isMultipleContributorCloudSharedAlbum];
  }
  return v4;
}

- (BOOL)isProjectAlbum
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isProjectAlbum];

  return v3;
}

- (BOOL)isUserLibraryAlbum
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isUserLibraryAlbum];

  return v3;
}

- (BOOL)isRecentlyAddedAlbum
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isRecentlyAddedAlbum];

  return v3;
}

- (BOOL)isMultipleContributorCloudSharedAlbum
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isMultipleContributorCloudSharedAlbum];

  return v3;
}

- (BOOL)isFamilyCloudSharedAlbum
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isFamilyCloudSharedAlbum];

  return v3;
}

- (BOOL)isOwnedCloudSharedAlbum
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isOwnedCloudSharedAlbum];

  return v3;
}

- (BOOL)isInTrash
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isInTrash];

  return v3;
}

- (BOOL)isFolder
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isFolder];

  return v3;
}

- (BOOL)isStandInAlbum
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isStandInAlbum];

  return v3;
}

- (BOOL)isPendingPhotoStreamAlbum
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isPendingPhotoStreamAlbum];

  return v3;
}

- (BOOL)isCloudSharedAlbum
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isCloudSharedAlbum];

  return v3;
}

- (BOOL)isPhotoStreamAlbum
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isPhotoStreamAlbum];

  return v3;
}

- (BOOL)isPanoramasAlbum
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isPanoramasAlbum];

  return v3;
}

- (BOOL)isCameraAlbum
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isCameraAlbum];

  return v3;
}

- (BOOL)isLibrary
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 isLibrary];

  return v3;
}

- (NSObject)posterImage
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 posterImage];

  return v3;
}

- (NSString)name
{
  NSLog(&cfstr_WarningTheName.isa, a2, self);
  PLPrintSymbolicStackTrace();
  return [(PLFilteredAlbum *)self localizedTitle];
}

- (NSString)localizedTitle
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 localizedTitle];

  return (NSString *)v3;
}

- (unint64_t)videosCount
{
  int v3 = [(PLFilteredAlbum *)self filter];
  if (v3 == 2)
  {
    return [(PLFilteredAlbum *)self approximateCount];
  }
  else if ((v3 & 2) != 0 || (v3 & 5) == 0)
  {
    id v5 = (void *)MEMORY[0x19F38D3B0]();
    id v6 = [(PLFilteredAlbum *)self assets];
    id v7 = [v6 array];
    int v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 1);
    id v9 = [v7 filteredArrayUsingPredicate:v8];

    unint64_t v10 = [v9 count];
    return v10;
  }
  else
  {
    return 0;
  }
}

- (unint64_t)photosCount
{
  int v3 = [(PLFilteredAlbum *)self filter];
  if (v3 == 1)
  {
    return [(PLFilteredAlbum *)self approximateCount];
  }
  else if ((v3 & 1) != 0 || (v3 & 6) == 0)
  {
    id v5 = (void *)MEMORY[0x19F38D3B0]();
    id v6 = [(PLFilteredAlbum *)self assets];
    id v7 = [v6 array];
    int v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 0);
    id v9 = [v7 filteredArrayUsingPredicate:v8];

    unint64_t v10 = [v9 count];
    return v10;
  }
  else
  {
    return 0;
  }
}

- (BOOL)isEmpty
{
  return [(PLFilteredAlbum *)self assetsCount] == 0;
}

- (void)setHasUnseenContentBoolValue:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PLFilteredAlbum *)self backingAlbum];
  [v4 setHasUnseenContentBoolValue:v3];
}

- (BOOL)hasUnseenContentBoolValue
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  char v3 = [v2 hasUnseenContentBoolValue];

  return v3;
}

- (unint64_t)assetsCount
{
  v2 = [(PLFilteredAlbum *)self filteredIndexes];
  unint64_t v3 = [v2 count];

  return v3;
}

- (unint64_t)approximateCount
{
  v2 = [(PLFilteredAlbum *)self filteredIndexes];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSMutableOrderedSet)userEditableAssets
{
  unint64_t v3 = [(PLFilteredAlbum *)self _assets];

  if (!v3)
  {
    id v4 = [(PLFilteredAlbum *)self mutableOrderedSetValueForKey:@"filteredAssets"];
    [(PLFilteredAlbum *)self set_assets:v4];
  }
  return [(PLFilteredAlbum *)self _assets];
}

- (NSMutableOrderedSet)mutableAssets
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"PLFilteredAlbum.m", 179, @"This album does not support mutations via mutableAssets: %@", self object file lineNumber description];

  return 0;
}

- (int)kindValue
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  int v3 = [v2 kindValue];

  return v3;
}

- (NSNumber)kind
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  int v3 = [v2 kind];

  return (NSNumber *)v3;
}

- (NSString)title
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  int v3 = [v2 title];

  return (NSString *)v3;
}

- (NSString)uuid
{
  v2 = [(PLFilteredAlbum *)self backingAlbum];
  int v3 = [v2 uuid];

  return (NSString *)v3;
}

- (void)set_assets:(id)a3
{
}

- (NSMutableOrderedSet)_assets
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weak_assets);
  return (NSMutableOrderedSet *)WeakRetained;
}

- (void)setBackingAlbum:(id)a3
{
  id v5 = (PLAlbumProtocol *)a3;
  if (self->_backingAlbum != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_backingAlbum, a3);
    self->_backingAlbumSupportsEdits = [(PLAlbumProtocol *)self->_backingAlbum conformsToProtocol:&unk_1EEC1C268];
    char v6 = [(PLAlbumProtocol *)self->_backingAlbum conformsToProtocol:&unk_1EEC33B20];
    id v5 = v7;
    self->_backingAlbumSupportsCloudShared = v6;
  }
}

- (NSString)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(PLFilteredAlbum *)self backingAlbum];
  uint64_t v6 = objc_opt_class();
  id v7 = [(PLFilteredAlbum *)self backingAlbum];
  int v8 = objc_msgSend((id)objc_opt_class(), "descriptionForAlbumFilter:parameters:", -[PLFilteredAlbum filter](self, "filter"), self->_filterParameters);
  id v9 = [v3 stringWithFormat:@"<%@ %p> album: <%@ %p> filter: %@", v4, self, v6, v7, v8];

  return (NSString *)v9;
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PLFilteredAlbum *)self setBackingAlbum:0];
  [(PLFilteredAlbum *)self set_assets:0];
  filteredIndexes = self->_filteredIndexes;
  self->_filteredIndexes = 0;

  v5.receiver = self;
  v5.super_class = (Class)PLFilteredAlbum;
  [(PLFilteredAlbum *)&v5 dealloc];
}

- (PLPhotoLibrary)photoLibrary
{
  return (PLPhotoLibrary *)[(PLAlbumProtocol *)self->_backingAlbum photoLibrary];
}

+ (id)filteredIndexesInAlbum:(id)a3 predicate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (id v9 = (void *)MEMORY[0x19F38D3B0](),
        [v7 filteredIndexesForPredicate:v8],
        id v10 = (id)objc_claimAutoreleasedReturnValue(),
        !v10))
  {
    uint64_t v11 = [v7 assets];
    uint64_t v12 = [v11 array];

    unint64_t v13 = [v12 filteredArrayUsingPredicate:v8];
    unint64_t v14 = [MEMORY[0x1E4F28E60] indexSet];
    uint64_t v15 = [v12 count];
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__PLFilteredAlbum_filteredIndexesInAlbum_predicate___block_invoke;
    v20[3] = &unk_1E58660E8;
    v23 = v27;
    uint64_t v24 = v15;
    id v16 = v12;
    id v21 = v16;
    SEL v25 = a2;
    id v26 = a1;
    id v17 = v14;
    id v22 = v17;
    [v13 enumerateObjectsUsingBlock:v20];
    v18 = v22;
    id v10 = v17;

    _Block_object_dispose(v27, 8);
  }

  return v10;
}

uint64_t __52__PLFilteredAlbum_filteredIndexesInAlbum_predicate___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "indexOfObjectIdenticalTo:inRange:", a2, v3, *(void *)(a1 + 56) - v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 72) file:@"PLFilteredAlbum.m" lineNumber:946 description:&stru_1EEB2EB80];
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  objc_super v5 = *(void **)(a1 + 40);
  return [v5 addIndex:v4];
}

+ (id)descriptionForAlbumFilter:(int)a3 parameters:(id)a4
{
  __int16 v4 = a3;
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  id v7 = v6;
  if (v4)
  {
    [v6 addObject:@"Photos"];
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v7 addObject:@"Videos"];
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v7 addObject:@"Audio"];
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v7 addObject:@"Unknown"];
  if ((v4 & 0x20) == 0)
  {
LABEL_6:
    if ((v4 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v7 addObject:@"HidePlaceholders"];
  if ((v4 & 0x40) == 0)
  {
LABEL_7:
    if ((v4 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v7 addObject:@"HideNonRecentCloudAssets"];
  if ((v4 & 0x100) == 0)
  {
LABEL_8:
    if ((v4 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v7 addObject:@"HideAssetsWithoutLegacyRequiredResourcesLocallyAvailable"];
  if ((v4 & 0x200) == 0)
  {
LABEL_9:
    if ((v4 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v7 addObject:@"PLAlbumFilterHideTrashed"];
  if ((v4 & 8) == 0)
  {
LABEL_10:
    if ((v4 & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v7 addObject:@"PLAlbumFilterShowPhotoBooth"];
  if ((v4 & 0x800) == 0)
  {
LABEL_11:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_25:
  [v7 addObject:@"PLAlbumFilterHidePhotoStream"];
  if ((v4 & 0x1000) != 0) {
LABEL_12:
  }
    [v7 addObject:@"PLAlbumFilterHideMomentShared"];
LABEL_13:
  if ([v7 count])
  {
    id v8 = [v7 componentsJoinedByString:@"+"];
    id v9 = v8;
    if (v5)
    {
      uint64_t v10 = [(__CFString *)v8 stringByAppendingFormat:@" params: %@", v5];

      id v9 = (__CFString *)v10;
    }
  }
  else
  {
    id v9 = @"{none}";
  }

  return v9;
}

+ (id)predicateForAlbumFilter:(int)a3 parameters:(id)a4 photoLibrary:(id)a5
{
  __int16 v6 = a3;
  v41[2] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  if (v6)
  {
    v29 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 0);
    [v11 addObject:v29];

    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_3;
  }
  v30 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 1);
  [v11 addObject:v30];

  if ((v6 & 4) != 0)
  {
LABEL_4:
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 2);
    [v11 addObject:v12];
  }
LABEL_5:
  if ((v6 & 8) != 0)
  {
    unint64_t v13 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPhotoBoothAsset"), 1);
    [v11 addObject:v13];
  }
  if ((v6 & 0x10) != 0)
  {
    unint64_t v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 3);
    [v11 addObject:v14];
  }
  uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
  if ((v6 & 0x20) != 0)
  {
    id v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"cloudPlaceholderKind != %d AND cloudPlaceholderKind != %d", 2, 3);
    [v15 addObject:v16];
  }
  if ((v6 & 0x40) != 0 && [v9 count])
  {
    id v17 = [v9 objectAtIndex:0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:a2, a1, @"PLFilteredAlbum.m", 791, @"Parameter for PLAlbumFilterHideNonRecentCloudAssets must be a date but it's %@", v17 object file lineNumber description];
    }
    v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"cloudHasUnseenComments = YES || cloudBatchPublishDate >= %@", v17];
    [v15 addObject:v18];
  }
  if ((v6 & 0x100) != 0)
  {
    v31 = +[PLManagedAsset fetchPredicateForLegacyRequiredResourcesLocallyAvailable:0 photoLibrary:v10];
    [v15 addObject:v31];

    if ((v6 & 0x200) == 0)
    {
LABEL_18:
      if ((v6 & 0x400) == 0) {
        goto LABEL_19;
      }
      goto LABEL_35;
    }
  }
  else if ((v6 & 0x200) == 0)
  {
    goto LABEL_18;
  }
  v32 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(trashedState) == %d", 0);
  [v15 addObject:v32];

  if ((v6 & 0x400) == 0)
  {
LABEL_19:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_35:
  v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"noindex:(hidden) == 0"];
  [v15 addObject:v33];

  if ((v6 & 0x2000) != 0)
  {
LABEL_20:
    id v19 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPlaceholderAsset"), 1);
    [v15 addObject:v19];
  }
LABEL_21:
  if ((v6 & 0x800) != 0)
  {
    v20 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForPhotoStreamAsset"), 1);
    [v15 addObject:v20];
  }
  if ((v6 & 0x1000) != 0)
  {
    id v21 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForMomentSharedAsset"), 1);
    [v15 addObject:v21];
  }
  if ((v6 & 0x80) != 0)
  {
    id v22 = (void *)MEMORY[0x1E4F28BA0];
    v23 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"kind", 1);
    v41[0] = v23;
    uint64_t v24 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForCloudSharedAsset"), 1);
    v41[1] = v24;
    SEL v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
    id v26 = [v22 orPredicateWithSubpredicates:v25];
    [v15 addObject:v26];
  }
  id v27 = (id)[v11 count];
  uint64_t v28 = [v15 count];
  if (v27)
  {
    if (v27 == (id)1) {
      [v11 objectAtIndex:0];
    }
    else {
    id v27 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v11];
    }
  }
  if (v28)
  {
    v34 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v15];
    v35 = v34;
    if (v27)
    {
      v36 = (void *)MEMORY[0x1E4F28BA0];
      v37 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v27, v34, 0);
      uint64_t v38 = [v36 andPredicateWithSubpredicates:v37];

      id v27 = (id)v38;
    }
    else
    {
      id v27 = v34;
    }
  }
  return v27;
}

+ (id)unfilteredAlbum:(id)a3
{
  return (id)[a1 filteredAlbum:a3 filter:0 parameters:0];
}

+ (id)filteredAlbum:(id)a3 intersectFilter:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v4 = [v7 filter] & v4;
    id v8 = [v7 filterParameters];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [a1 filteredAlbum:v6 filter:v4 parameters:v8];

  return v9;
}

+ (id)filteredAlbum:(id)a3 predicate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithBackingAlbum:v7 predicate:v6];

  return v8;
}

+ (id)filteredAlbum:(id)a3 filter:(int)a4 parameters:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v8;
    if ([v8 filter] == v6)
    {
      uint64_t v10 = [v8 filterParameters];
      if (!v10
        || (uint64_t v11 = (void *)v10,
            [v8 filterParameters],
            uint64_t v12 = objc_claimAutoreleasedReturnValue(),
            char v13 = [v12 isEqualToArray:v9],
            v12,
            v11,
            (v13 & 1) != 0))
      {
        unint64_t v14 = v8;
        goto LABEL_12;
      }
    }
    uint64_t v15 = [v8 backingAlbum];

    id v8 = (id)v15;
  }
  if (v6 && v8)
  {
    id v16 = (id)[objc_alloc((Class)a1) initWithBackingAlbum:v8 filter:v6 parameters:v9];
  }
  else
  {
    id v16 = v8;
    id v8 = v16;
  }
  unint64_t v14 = v16;
LABEL_12:

  return v14;
}

+ (id)filteredAlbum:(id)a3 filter:(int)a4
{
  return (id)[a1 filteredAlbum:a3 filter:*(void *)&a4 parameters:0];
}

@end