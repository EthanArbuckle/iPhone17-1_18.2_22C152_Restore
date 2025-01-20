@interface BKCollection
+ (BKCollection)collectionWithID:(id)a3 inManagedObjectContext:(id)a4;
+ (BOOL)allowsManualAdditionToCollectionWithID:(id)a3;
+ (BOOL)isDefaultCollection:(id)a3;
+ (BOOL)isSelectableDefaultCollectionID:(id)a3;
+ (BOOL)isSeriesCollectionID:(id)a3;
+ (BOOL)isValidForDeserialization:(id)a3;
+ (BOOL)shouldSyncCollectionID:(id)a3;
+ (id)availableDefaultCollectionIDs;
+ (id)availableDefaultCollectionIDsForOS;
+ (id)availableSelectableDefaultCollectionIDsForOS;
+ (id)contentTypesForDefaultCollectionWithID:(id)a3;
+ (id)insertNewCollectionWithCollectionID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)keyPathsForValuesAffectingLocalizedTitle;
+ (id)mapContentTypeToDefaultCollectionIDForOS;
+ (id)predicateForAllDefaultCollections;
+ (id)predicateForCollectionWithCollectionIDInList:(id)a3;
+ (id)predicateForDeletedDefaultCollections;
+ (id)predicateForNonDeletedUserCollections;
+ (id)predicateForSelectableDefaultCollections;
+ (id)seriesCollectionIDForSeriesID:(id)a3;
+ (id)seriesIDFromSeriesCollectionID:(id)a3;
+ (unint64_t)defaultSortModeForCollectionID:(id)a3;
+ (unint64_t)defaultViewModeForCollectionID:(id)a3;
+ (unint64_t)sortModeForSeriesCollections;
+ (void)addCollections:(id)a3 moc:(id)a4;
+ (void)cleanupDefaultCollections:(id)a3;
+ (void)setSortModeForSeriesCollections:(unint64_t)a3;
- (BKLibraryManagedObjectContext)managedObjectContext;
- (BOOL)acceptsContentType:(signed __int16)a3;
- (BOOL)allowsManualAddition;
- (BOOL)canDeleteCollection;
- (BOOL)canDeleteLibraryAsset:(id)a3;
- (BOOL)deleteRemovesFromCollection;
- (BOOL)isDefaultCollection;
- (BOOL)isEqualToCollection:(id)a3;
- (BOOL)isSeriesCollection;
- (BOOL)isValidForSerialization;
- (BOOL)shouldSyncCollectionMembers;
- (NSNumber)maxSortKey;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)seriesID;
- (OS_dispatch_queue)sortKeyQueue;
- (id)addCollectionMemberAvoidingDupesWithAsset:(id)a3 assetID:(id)a4 temporaryAssetID:(id)a5 sortKey:(id)a6 forceToTop:(BOOL)a7;
- (id)addCollectionMemberAvoidingDupesWithAssetID:(id)a3 sortKey:(id)a4 forceToTop:(BOOL)a5;
- (id)collectionDetailRepresentation;
- (id)contentTypePredicate;
- (unint64_t)resolvedSortMode;
- (unint64_t)resolvedViewMode;
- (void)addCollectionMemberDictionaries:(id)a3 forceToTop:(BOOL)a4;
- (void)addLibraryAssets:(id)a3;
- (void)addLibraryAssets:(id)a3 hideAssets:(BOOL)a4 inManagedObjectContext:(id)a5 forceToTop:(BOOL)a6;
- (void)awakeFromInsert;
- (void)clearMaxSortKey;
- (void)configureFromBackupSummary:(id)a3;
- (void)configureFromCollectionDetail:(id)a3 shouldCompareModificationDate:(BOOL)a4;
- (void)configureFromDictionary:(id)a3;
- (void)mergeWithDictionaryRepresentation:(id)a3;
- (void)setDeletedFlag:(id)a3;
- (void)setHidden:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setMaxSortKey:(id)a3;
- (void)setSortKey:(id)a3;
- (void)setSortMode:(id)a3;
- (void)setTitle:(id)a3;
- (void)setViewMode:(id)a3;
- (void)updateLastModification;
- (void)updateMaxSortKeyWithMember:(id)a3;
@end

@implementation BKCollection

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)BKCollection;
  [(BKCollection *)&v4 awakeFromInsert];
  v3 = +[NSDate date];
  [(BKCollection *)self setLastModification:v3];
}

+ (id)keyPathsForValuesAffectingLocalizedTitle
{
  return +[NSSet setWithObject:@"title"];
}

+ (id)insertNewCollectionWithCollectionID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 libraryManager];
  v8 = +[NSEntityDescription insertNewObjectForEntityForName:@"BKCollection" inManagedObjectContext:v6];
  if (!v5)
  {
    id v5 = +[NSString UUID];
  }
  id v9 = [v7 copyNextCollectionSortKey:v6];
  [v8 setSortKey:v9];
  [v8 setCollectionID:v5];
  v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 resolvedSortMode]);
  [v8 setSortMode:v10];

  [v8 setLocalModDate:0];

  return v8;
}

+ (unint64_t)sortModeForSeriesCollections
{
  v2 = +[BKLibraryManager defaultManager];
  v3 = [v2 metadataObjectForKey:@"BKCollectionSeriesSortMode"];
  signed int v4 = [v3 intValue];

  if ((v4 - 11) >= 0xFFFFFFFE) {
    return v4;
  }
  else {
    return 10;
  }
}

+ (void)setSortModeForSeriesCollections:(unint64_t)a3
{
  if (a3 - 9 <= 1)
  {
    id v6 = +[BKLibraryManager defaultManager];
    id v5 = +[NSNumber numberWithUnsignedInteger:a3];
    [v6 setMetadataObject:v5 forKey:@"BKCollectionSeriesSortMode"];

    [v6 saveMetaData];
  }
}

+ (BKCollection)collectionWithID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = (char *)a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSFetchRequest) initWithEntityName:@"BKCollection"];
  [v7 setFetchLimit:1];
  v23 = v5;
  v8 = +[NSArray arrayWithObjects:&v23 count:1];
  id v9 = +[BKCollection predicateForCollectionWithCollectionIDInList:v8];
  [v7 setPredicate:v9];

  id v16 = 0;
  v10 = [v6 executeFetchRequest:v7 error:&v16];

  v11 = (char *)v16;
  if (v10)
  {
    v12 = [v10 lastObject];
  }
  else
  {
    v13 = BCIMLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "+[BKCollection collectionWithID:inManagedObjectContext:]";
      __int16 v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BKLibrary/Source/BKCollection.m";
      __int16 v21 = 1024;
      int v22 = 171;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v14 = BCIMLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "@\"Failed to fetch LibraryAsset with AssetID {%@}{%@}\"", buf, 0x16u);
    }

    v12 = 0;
  }

  return (BKCollection *)v12;
}

- (void)addLibraryAssets:(id)a3 hideAssets:(BOOL)a4 inManagedObjectContext:(id)a5 forceToTop:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = [(BKCollection *)self collectionID];
  unsigned int v13 = [v12 isEqualToString:kBKCollectionDefaultIDWantToRead];

  if (v13)
  {
    v14 = +[NSNotificationCenter defaultCenter];
    [v14 postNotificationName:@"BKLibraryAssetAddToWTRCollectionNotification" object:self userInfo:0];
  }
  [v11 setSaveContext:2];
  if (v11 && [v10 count])
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_53894;
    v15[3] = &unk_D29F8;
    id v16 = v11;
    BOOL v19 = a4;
    id v17 = v10;
    v18 = self;
    BOOL v20 = a6;
    _os_activity_initiate(&dword_0, "Collection add library assets", OS_ACTIVITY_FLAG_DEFAULT, v15);
  }
}

- (void)addLibraryAssets:(id)a3
{
  id v8 = a3;
  signed int v4 = [(BKCollection *)self collectionID];
  unsigned int v5 = [v4 isEqualToString:kBKCollectionDefaultIDWantToRead];

  if (v5)
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:@"BKLibraryAssetAddToWTRCollectionNotification" object:self userInfo:0];
  }
  if ([v8 count])
  {
    id v7 = [(BKCollection *)self managedObjectContext];
    [(BKCollection *)self addLibraryAssets:v8 hideAssets:0 inManagedObjectContext:v7 forceToTop:0];
    if ([v7 hasChanges]) {
      [v7 saveLibrary];
    }
  }
}

- (OS_dispatch_queue)sortKeyQueue
{
  if (qword_EE608 != -1) {
    dispatch_once(&qword_EE608, &stru_D2F18);
  }
  v2 = (void *)qword_EE600;

  return (OS_dispatch_queue *)v2;
}

- (NSNumber)maxSortKey
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_53EE4;
  id v11 = sub_53EF4;
  id v12 = 0;
  uint64_t v3 = [(BKCollection *)self sortKeyQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_53EFC;
  v6[3] = &unk_D2430;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSNumber *)v4;
}

- (void)clearMaxSortKey
{
  uint64_t v3 = [(BKCollection *)self sortKeyQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_54108;
  block[3] = &unk_D1520;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)updateMaxSortKeyWithMember:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BKCollection *)self sortKeyQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_541D4;
  v7[3] = &unk_D1418;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (BOOL)isSeriesCollection
{
  return 0;
}

- (NSString)seriesID
{
  return 0;
}

- (id)addCollectionMemberAvoidingDupesWithAssetID:(id)a3 sortKey:(id)a4 forceToTop:(BOOL)a5
{
  return [(BKCollection *)self addCollectionMemberAvoidingDupesWithAsset:0 assetID:a3 temporaryAssetID:0 sortKey:a4 forceToTop:a5];
}

- (id)addCollectionMemberAvoidingDupesWithAsset:(id)a3 assetID:(id)a4 temporaryAssetID:(id)a5 sortKey:(id)a6 forceToTop:(BOOL)a7
{
  BOOL v56 = a7;
  id v11 = a3;
  id v12 = (__CFString *)a4;
  unsigned int v13 = (__CFString *)a5;
  id v14 = a6;
  v15 = +[BULogUtilities shared];
  unsigned int v16 = [v15 verboseLoggingEnabled];

  if (v16)
  {
    id v17 = BKLibraryCollectionDevelopmentLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(BKCollection *)self collectionID];
      uint64_t v19 = [v11 assetID];
      BOOL v20 = self;
      __int16 v21 = (void *)v19;
      CFStringRef v22 = @"null";
      if (v19) {
        CFStringRef v23 = (const __CFString *)v19;
      }
      else {
        CFStringRef v23 = @"null";
      }
      *(_DWORD *)buf = 138412802;
      v64 = v18;
      __int16 v65 = 2112;
      if (v12) {
        CFStringRef v22 = v12;
      }
      CFStringRef v66 = v23;
      __int16 v67 = 2112;
      CFStringRef v68 = v22;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "\"\\\"addCollectionMemberAvoidingDupesWithAsset for collectionID: %@ asset.assetID: %@ assetID: %@\\\"\"", buf, 0x20u);

      self = v20;
    }
  }
  if (![(__CFString *)v12 length])
  {
    v33 = [v11 permlink];
    if ([v33 length])
    {
      id v34 = [(__CFString *)v13 length];

      if (v34) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v35 = 0;
    goto LABEL_49;
  }
LABEL_11:
  id v57 = v14;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v24 = [(BKCollection *)self members];
  id v25 = [v24 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v59;
    v54 = self;
    id v55 = v11;
LABEL_13:
    uint64_t v28 = 0;
    while (1)
    {
      if (*(void *)v59 != v27) {
        objc_enumerationMutation(v24);
      }
      v29 = *(void **)(*((void *)&v58 + 1) + 8 * v28);
      v30 = [v29 assetID:v54, v55];
      if ([v30 isEqualToString:v12]) {
        break;
      }
      v31 = [v29 temporaryAssetID];
      unsigned __int8 v32 = [v31 isEqualToString:v13];

      if (v32) {
        goto LABEL_25;
      }
      if (v26 == (id)++v28)
      {
        id v26 = [v24 countByEnumeratingWithState:&v58 objects:v62 count:16];
        self = v54;
        id v11 = v55;
        if (v26) {
          goto LABEL_13;
        }
        goto LABEL_20;
      }
    }

LABEL_25:
    id v35 = v29;

    self = v54;
    id v11 = v55;
    if (v35) {
      goto LABEL_29;
    }
  }
  else
  {
LABEL_20:
  }
  v36 = [(BKCollection *)self managedObjectContext];
  id v35 = +[NSEntityDescription insertNewObjectForEntityForName:@"BKCollectionMember" inManagedObjectContext:v36];

  [v35 setCollection:self];
  [v35 setAssetID:v12];
  [v35 setTemporaryAssetID:v13];
  v37 = BKLibraryCollectionLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = [(BKCollection *)self collectionID];
    *(_DWORD *)buf = 138412546;
    v64 = v38;
    __int16 v65 = 2112;
    CFStringRef v66 = v12;
    _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Collection Member Inserted.  Creating BKCollectionMember for collectionID: %@ assetID: %@", buf, 0x16u);
  }
LABEL_29:
  v39 = [v35 asset];
  if (v39)
  {

    id v14 = v57;
    if (!v35) {
      goto LABEL_48;
    }
LABEL_40:
    uint64_t v42 = [v35 sortKey];
    if (!v42
      || (v43 = (void *)v42,
          [v35 sortKey],
          v44 = objc_claimAutoreleasedReturnValue(),
          id v45 = [v44 unsignedLongValue],
          v44,
          v43,
          !v45)
      || v56)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v14 unsignedLongValue] || v56)
      {
        uint64_t v46 = +[BKUserSortOrderManager nextSortKeyForCollection:self];

        id v14 = (id)v46;
      }
      [v35 setDifferentNumber:v14 forKey:@"sortKey"];
    }
    goto LABEL_48;
  }
  v40 = [v35 assetID];
  id v14 = v57;
  if (v40)
  {
  }
  else
  {
    v41 = [v35 temporaryAssetID];

    if (!v41) {
      goto LABEL_39;
    }
  }
  if (!v11)
  {
    v48 = [(BKCollection *)self managedObjectContext];
    v49 = [v48 libraryManager];
    if (v12) {
      v50 = v12;
    }
    else {
      v50 = v13;
    }
    [(BKCollection *)self managedObjectContext];
    v52 = v51 = self;
    v53 = [v49 libraryMutableAssetWithPermanentOrTemporaryAssetID:v50 inManagedObjectContext:v52];
    [v35 setAsset:v53];

    self = v51;
    if (!v35) {
      goto LABEL_48;
    }
    goto LABEL_40;
  }
  [v35 setAsset:v11];
LABEL_39:
  if (v35) {
    goto LABEL_40;
  }
LABEL_48:
  [(BKCollection *)self updateMaxSortKeyWithMember:v35];
LABEL_49:
  [v35 setLocalModDate:0];

  return v35;
}

- (void)addCollectionMemberDictionaries:(id)a3 forceToTop:(BOOL)a4
{
  BOOL v4 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [a3 reverseObjectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 objectForKey:@"assetID"];
        unsigned int v13 = [v11 objectForKey:@"sortKey"];
        id v14 = [(BKCollection *)self addCollectionMemberAvoidingDupesWithAssetID:v12 sortKey:v13 forceToTop:v4];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (BOOL)acceptsContentType:(signed __int16)a3
{
  int v3 = (unsigned __int16)a3;
  BOOL v4 = [(BKCollection *)self collectionID];
  if ([v4 isEqualToString:kBKCollectionDefaultIDBooks])
  {
    char v6 = v3 == 4 || (v3 - 1) < 2;
  }
  else if ([v4 isEqualToString:kBKCollectionDefaultIDPDFs])
  {
    char v6 = v3 == 3;
  }
  else
  {
    unsigned int v7 = [v4 isEqualToString:kBKCollectionDefaultIDAudiobooks] ^ 1;
    if (v3 == 6) {
      char v6 = 1;
    }
    else {
      char v6 = v7;
    }
  }

  return v6;
}

- (BOOL)isEqualToCollection:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(BKCollection *)self collectionID];
  char v6 = [v4 collectionID];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (void)updateLastModification
{
  int v3 = +[NSDate date];
  [(BKCollection *)self setLastModification:v3];

  id v4 = +[NSDate date];
  [(BKCollection *)self setLocalModDate:v4];
}

+ (id)predicateForCollectionWithCollectionIDInList:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"(%K in %@) AND deletedFlag == 0", @"collectionID", a3];
}

+ (id)predicateForAllDefaultCollections
{
  int v3 = [a1 availableDefaultCollectionIDsForOS];
  id v4 = [a1 predicateForCollectionWithCollectionIDInList:v3];

  return v4;
}

+ (id)predicateForSelectableDefaultCollections
{
  int v3 = [a1 availableSelectableDefaultCollectionIDsForOS];
  id v4 = [a1 predicateForCollectionWithCollectionIDInList:v3];

  return v4;
}

+ (id)predicateForNonDeletedUserCollections
{
  return +[NSPredicate predicateWithFormat:@"%K == 0 AND (%K == NULL OR %K > %i) AND (placeholder == NULL OR placeholder == NO)", @"deletedFlag", @"sortKey", @"sortKey", kBKCollectionMinUserCollectionSortOrder];
}

+ (id)predicateForDeletedDefaultCollections
{
  v2 = [a1 availableDefaultCollectionIDsForOS];
  int v3 = +[NSPredicate predicateWithFormat:@"(%K in %@) AND %K == 1", @"collectionID", v2, @"deletedFlag"];

  return v3;
}

+ (unint64_t)defaultSortModeForCollectionID:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kBKCollectionDefaultIDFinished])
  {
    unint64_t v5 = 8;
  }
  else if (([v4 isEqualToString:kBKCollectionDefaultIDWantToRead] & 1) != 0 {
         || ([v4 isEqualToString:kBKCollectionDefaultIDSamples] & 1) != 0)
  }
  {
    unint64_t v5 = 6;
  }
  else if ([a1 isSeriesCollectionID:v4])
  {
    unint64_t v5 = 7;
  }
  else
  {
    unint64_t v5 = 6;
  }

  return v5;
}

+ (unint64_t)defaultViewModeForCollectionID:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:kBKCollectionDefaultIDFinished] & 1) != 0
    || ([v3 isEqualToString:kBKCollectionDefaultIDWantToRead] & 1) != 0
    || [v3 isEqualToString:kBKCollectionDefaultIDSamples])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

- (void)setSortKey:(id)a3
{
  id v4 = a3;
  [(BKCollection *)self willChangeValueForKey:@"sortKey"];
  [(BKCollection *)self setPrimitiveValue:v4 forKey:@"sortKey"];

  [(BKCollection *)self updateLastModification];

  [(BKCollection *)self didChangeValueForKey:@"sortKey"];
}

- (void)setSortMode:(id)a3
{
  id v4 = a3;
  [(BKCollection *)self willChangeValueForKey:@"sortMode"];
  [(BKCollection *)self setPrimitiveValue:v4 forKey:@"sortMode"];

  [(BKCollection *)self updateLastModification];

  [(BKCollection *)self didChangeValueForKey:@"sortMode"];
}

- (void)setViewMode:(id)a3
{
  id v4 = a3;
  [(BKCollection *)self willChangeValueForKey:@"viewMode"];
  [(BKCollection *)self setPrimitiveValue:v4 forKey:@"viewMode"];

  [(BKCollection *)self updateLastModification];

  [(BKCollection *)self didChangeValueForKey:@"viewMode"];
}

- (unint64_t)resolvedSortMode
{
  id v3 = [(BKCollection *)self sortMode];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = (int)[v3 intValue];
  }
  else
  {
    char v6 = [(BKCollection *)self collectionID];
    unint64_t v5 = +[BKCollection defaultSortModeForCollectionID:v6];
  }
  return v5;
}

- (unint64_t)resolvedViewMode
{
  id v3 = [(BKCollection *)self viewMode];
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = (int)[v3 intValue];
  }
  else
  {
    char v6 = [(BKCollection *)self collectionID];
    unint64_t v5 = +[BKCollection defaultViewModeForCollectionID:v6];
  }
  return v5;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  [(BKCollection *)self willChangeValueForKey:@"title"];
  [(BKCollection *)self willChangeValueForKey:@"localizedTitle"];
  [(BKCollection *)self setPrimitiveValue:v4 forKey:@"title"];

  [(BKCollection *)self updateLastModification];
  [(BKCollection *)self didChangeValueForKey:@"localizedTitle"];

  [(BKCollection *)self didChangeValueForKey:@"title"];
}

- (void)setDeletedFlag:(id)a3
{
  id v4 = a3;
  [(BKCollection *)self willChangeValueForKey:@"deletedFlag"];
  [(BKCollection *)self setPrimitiveValue:v4 forKey:@"deletedFlag"];

  [(BKCollection *)self updateLastModification];

  [(BKCollection *)self didChangeValueForKey:@"deletedFlag"];
}

- (void)setHidden:(id)a3
{
  id v4 = a3;
  [(BKCollection *)self willChangeValueForKey:@"hidden"];
  [(BKCollection *)self setPrimitiveValue:v4 forKey:@"hidden"];

  [(BKCollection *)self updateLastModification];

  [(BKCollection *)self didChangeValueForKey:@"hidden"];
}

- (void)setLocalizedTitle:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_55244;
  v4[3] = &unk_D1418;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  _os_activity_initiate(&dword_0, "Set Collection Title", OS_ACTIVITY_FLAG_DEFAULT, v4);
}

- (BKLibraryManagedObjectContext)managedObjectContext
{
  v4.receiver = self;
  v4.super_class = (Class)BKCollection;
  v2 = [(BKCollection *)&v4 managedObjectContext];

  return (BKLibraryManagedObjectContext *)v2;
}

- (BOOL)isValidForSerialization
{
  id v3 = [(BKCollection *)self deletedFlag];
  if ([v3 BOOLValue])
  {
    objc_super v4 = [(BKCollection *)self lastModification];
    [v4 timeIntervalSince1970];
    unint64_t v6 = (unint64_t)v5;

    unsigned __int8 v7 = +[IMUserDataCull isTimestampNewerThanMaxDeletedAge:v6];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

+ (BOOL)isDefaultCollection:(id)a3
{
  id v3 = [a3 objectForKey:@"serverSyncUniqueId"];
  if (v3)
  {
    objc_super v4 = [(id)objc_opt_class() availableDefaultCollectionIDs];
    unsigned __int8 v5 = [v4 containsObject:v3];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)isValidForDeserialization:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  unsigned __int8 v5 = [v4 objectForKey:@"deletedFlag"];
  unint64_t v6 = BUDynamicCast();

  if ([v6 BOOLValue])
  {
    unsigned __int8 v7 = [v4 objectForKey:@"lastModification_Since1970"];
    id v8 = [v7 unsignedLongLongValue];

    if (+[IMUserDataCull isTimestampNewerThanMaxDeletedAge:](IMUserDataCull, "isTimestampNewerThanMaxDeletedAge:", v8))unsigned int v9 = [a1 isDefaultCollection:v4] ^ 1; {
    else
    }
      LOBYTE(v9) = 0;
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (void)mergeWithDictionaryRepresentation:(id)a3
{
  id v11 = a3;
  [(BKCollection *)self clearMaxSortKey];
  id v4 = [v11 objectForKey:@"lastModification_Since1970"];
  unsigned __int8 v5 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v4 unsignedLongLongValue]);

  unint64_t v6 = [v11 objectForKey:@"deletedFlag"];
  unsigned __int8 v7 = [(BKCollection *)self deletedFlag];
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) == 0)
  {
    if ([v6 BOOLValue])
    {
      +[BKCollection isDefaultCollection:v11];
    }
    else
    {
      unsigned int v9 = [(BKCollection *)self lastModification];
      id v10 = (char *)[v5 compare:v9];

      if (v10 == (unsigned char *)&dword_0 + 1) {
        [(BKCollection *)self configureFromDictionary:v11];
      }
    }
  }
}

+ (void)cleanupDefaultCollections:(id)a3
{
  id v3 = a3;
  id v4 = +[BKCollection predicateForDeletedDefaultCollections];
  [v3 batchDeleteEntity:@"BKCollection" matching:v4 prefetchRelationships:0];
}

- (void)configureFromDictionary:(id)a3
{
  id v9 = a3;
  -[BKCollection configureFromBackupSummary:](self, "configureFromBackupSummary:");
  id v4 = [(BKCollection *)self deletedFlag];
  if ([v4 BOOLValue])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    unsigned __int8 v5 = [v9 objectForKey:@"databaseKeys"];
  }

  if ([v5 count])
  {
    unint64_t v6 = +[BKCollectionMember collectionMemberDictionariesWithAssetIDs:v5];
    [(BKCollection *)self addCollectionMemberDictionaries:v6 forceToTop:0];
  }
  unsigned __int8 v7 = [v9 objectForKey:@"lastModification_Since1970"];
  unsigned __int8 v8 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v7 unsignedLongLongValue]);
  [(BKCollection *)self setLastModification:v8];
}

- (id)collectionDetailRepresentation
{
  id v3 = [(BKCollection *)self collectionID];
  id v4 = [objc_alloc((Class)BCMutableCollectionDetail) initWithCollectionID:v3];
  unsigned __int8 v5 = [(BKCollection *)self title];
  [v4 setName:v5];

  unint64_t v6 = [(BKCollection *)self details];
  [v4 setCollectionDescription:v6];

  unsigned __int8 v7 = [(BKCollection *)self hidden];
  [v4 setHidden:[v7 BOOLValue]];

  unsigned __int8 v8 = [(BKCollection *)self sortKey];
  [v4 setSortOrder:[v8 intValue]];

  id v9 = +[NSNumber numberWithUnsignedInteger:[(BKCollection *)self resolvedSortMode]];
  [v4 setSortMode:[v9 intValue]];

  id v10 = [(BKCollection *)self deletedFlag];
  [v4 setDeletedFlag:[v10 BOOLValue]];

  id v11 = [(BKCollection *)self localModDate];
  [v4 setModificationDate:v11];

  return v4;
}

- (void)configureFromCollectionDetail:(id)a3 shouldCompareModificationDate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(BKCollection *)self localModDate];
  uint64_t v8 = [v6 modificationDate];
  id v9 = (void *)v8;
  if (v7 | v8)
  {
    if (!v7 && v8)
    {
      id v10 = +[BULogUtilities shared];
      unsigned int v11 = [v10 verboseLoggingEnabled];

      if (v11)
      {
        id v12 = BKLibraryCollectionDevelopmentLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v13 = [(BKCollection *)self title];
          *(_DWORD *)v47 = 138412546;
          *(void *)&v47[4] = v9;
          *(_WORD *)&v47[12] = 2112;
          *(void *)&v47[14] = v13;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "\"\\\"No local modDate, collectionDetail has modDate:%@  for collectionDetail %@ \\\"\"", v47, 0x16u);
        }
      }
      goto LABEL_23;
    }
    if (v7 && v8)
    {
      long long v18 = +[BULogUtilities shared];
      unsigned int v19 = [v18 verboseLoggingEnabled];

      if (v19)
      {
        BOOL v20 = BKLibraryCollectionDevelopmentLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v21 = [(BKCollection *)self title];
          *(_DWORD *)v47 = 138412802;
          *(void *)&v47[4] = v7;
          *(_WORD *)&v47[12] = 2112;
          *(void *)&v47[14] = v9;
          *(_WORD *)&v47[22] = 2112;
          v48 = v21;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "\"\\\"local has modDate:%@, collectionDetail has modDate:%@ for collectionDetail %@\\\"\"", v47, 0x20u);
        }
      }
      goto LABEL_20;
    }
  }
  else
  {
    id v14 = +[BULogUtilities shared];
    unsigned int v15 = [v14 verboseLoggingEnabled];

    if (v15)
    {
      long long v16 = BKLibraryCollectionDevelopmentLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        long long v17 = [(BKCollection *)self title];
        *(_DWORD *)v47 = 138412290;
        *(void *)&v47[4] = v17;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "\"\\\"configureFromCollectionDetail No local modDate, No collectionDetail modDate for collectionDetail %@\\\"\"", v47, 0xCu);
      }
    }
  }
  if (v4 && !v9) {
    goto LABEL_38;
  }
LABEL_20:
  if (v7)
  {
    if (v4)
    {
      [v9 timeIntervalSinceReferenceDate];
      double v23 = v22;
      [(id)v7 timeIntervalSinceReferenceDate];
      if (v23 <= v24)
      {
        [v9 timeIntervalSinceReferenceDate];
        double v43 = v42;
        [(id)v7 timeIntervalSinceReferenceDate];
        if (v43 >= v44) {
          goto LABEL_33;
        }
        id v45 = +[BULogUtilities shared];
        unsigned int v46 = [v45 verboseLoggingEnabled];

        if (!v46) {
          goto LABEL_33;
        }
        id v34 = BKLibraryCollectionDevelopmentLog();
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        id v35 = [(BKCollection *)self title];
        v36 = [(BKCollection *)self collectionID];
        *(_DWORD *)v47 = 138412546;
        *(void *)&v47[4] = v35;
        *(_WORD *)&v47[12] = 2112;
        *(void *)&v47[14] = v36;
        v37 = "\"\\\"BKCollection Not Taking changes from collectiond detail as my mod date is > detail mod date for coll"
              "ectionTitle: %@ collectionID:%@\\\"\"";
        goto LABEL_30;
      }
    }
  }
LABEL_23:
  id v25 = [v6 name];
  [(BKCollection *)self setDifferentString:v25 forKey:@"title"];

  id v26 = [v6 collectionDescription];
  [(BKCollection *)self setDifferentString:v26 forKey:@"details"];

  uint64_t v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 hidden]);
  [(BKCollection *)self setDifferentNumber:v27 forKey:@"hidden"];

  uint64_t v28 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v6 sortOrder]);
  [(BKCollection *)self setDifferentNumber:v28 forKey:@"sortKey"];

  v29 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)[v6 sortMode]);
  [(BKCollection *)self setDifferentNumber:v29 forKey:@"sortMode"];

  v30 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 deletedFlag]);
  [(BKCollection *)self setDifferentNumber:v30 forKey:@"deletedFlag"];

  unsigned int v31 = [(BKCollection *)self hasChanges];
  [(BKCollection *)self setDifferentDate:v9 forKey:@"localModDate"];
  unsigned __int8 v32 = +[BULogUtilities shared];
  unsigned int v33 = [v32 verboseLoggingEnabled];

  if (!v31)
  {
    if (!v33) {
      goto LABEL_33;
    }
    id v34 = BKLibraryCollectionDevelopmentLog();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_32;
    }
    id v35 = [(BKCollection *)self title];
    v36 = [(BKCollection *)self collectionID];
    *(_DWORD *)v47 = 138412546;
    *(void *)&v47[4] = v35;
    *(_WORD *)&v47[12] = 2112;
    *(void *)&v47[14] = v36;
    v37 = "\"\\\"BKCollection No changes besides date for collectionTitle: %@ collectionID:%@\\\"\"";
LABEL_30:
    _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, v37, v47, 0x16u);

    goto LABEL_31;
  }
  if (v33)
  {
    id v34 = BKLibraryCollectionDevelopmentLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      id v35 = [(BKCollection *)self description];
      *(_DWORD *)v47 = 138412290;
      *(void *)&v47[4] = v35;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "\"\\\"BKCollection configured with changes: %@\\\"\"", v47, 0xCu);
LABEL_31:
    }
LABEL_32:
  }
LABEL_33:
  v38 = [(BKCollection *)self placeholder];
  unsigned int v39 = [v38 BOOLValue];

  if (v39)
  {
    v40 = BKLibraryCollectionLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = [(BKCollection *)self collectionID];
      *(_DWORD *)v47 = 138412290;
      *(void *)&v47[4] = v41;
      _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "Un-hiding user collection BKCollection: %@", v47, 0xCu);
    }
  }
  [(BKCollection *)self setDifferentNumber:&__kCFBooleanFalse forKey:@"placeholder"];
LABEL_38:
}

- (id)contentTypePredicate
{
  v2 = [(BKCollection *)self sortKey];
  unsigned int v3 = [v2 intValue];

  switch(v3)
  {
    case 0xFFFFFFFC:
      uint64_t v4 = 6;
LABEL_7:
      +[NSPredicate predicateWithFormat:@"(%K == %d)", @"contentType", v4, v7, v8];
      goto LABEL_8;
    case 0xFFFFFFFD:
      uint64_t v4 = 3;
      goto LABEL_7;
    case 0xFFFFFFFF:
      +[NSPredicate predicateWithFormat:@"((%K == %d) OR (%K == %d))", @"contentType", 1, @"contentType", 4];
      unsigned __int8 v5 = LABEL_8:;
      goto LABEL_10;
  }
  unsigned __int8 v5 = 0;
LABEL_10:

  return v5;
}

- (BOOL)canDeleteCollection
{
  return ![(BKCollection *)self isDefaultCollection];
}

- (BOOL)isDefaultCollection
{
  unsigned int v3 = [(id)objc_opt_class() availableDefaultCollectionIDsForOS];
  uint64_t v4 = [(BKCollection *)self collectionID];
  unsigned __int8 v5 = [v3 containsObject:v4];

  return v5;
}

- (BOOL)allowsManualAddition
{
  unsigned int v3 = objc_opt_class();
  uint64_t v4 = [(BKCollection *)self collectionID];
  LOBYTE(v3) = [v3 allowsManualAdditionToCollectionWithID:v4];

  return (char)v3;
}

+ (BOOL)allowsManualAdditionToCollectionWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned __int8 v5 = [a1 availableDefaultCollectionIDs];
    if ([v5 containsObject:v4]
      && ([v4 isEqualToString:kBKCollectionDefaultIDWantToRead] & 1) == 0)
    {
      unsigned __int8 v6 = [v4 isEqualToString:kBKCollectionDefaultIDFinished];
    }
    else
    {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)shouldSyncCollectionMembers
{
  v2 = [(BKCollection *)self collectionID];
  BOOL v3 = +[BKCollection shouldSyncCollectionID:v2];

  return v3;
}

+ (BOOL)shouldSyncCollectionID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kBKCollectionDefaultIDDownloaded]) {
    LOBYTE(v4) = 0;
  }
  else {
    unsigned int v4 = [v3 isEqualToString:kBKCollectionDefaultIDFinished] ^ 1;
  }

  return v4;
}

- (BOOL)canDeleteLibraryAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = ![(BKCollection *)self isDefaultCollection]
    || ([v4 isSeriesItem] & 1) == 0
    && (![v4 isCloud]
     || ([v4 iTunesU] & 1) != 0
     || [v4 isUbiquitousBook]);

  return v5;
}

- (BOOL)deleteRemovesFromCollection
{
  if (![(BKCollection *)self isDefaultCollection]) {
    return 1;
  }
  id v3 = [(BKCollection *)self collectionID];
  if ([v3 isEqualToString:kBKCollectionDefaultIDFinished])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    BOOL v5 = [(BKCollection *)self collectionID];
    if ([v5 isEqualToString:kBKCollectionDefaultIDWantToRead])
    {
      unsigned __int8 v4 = 1;
    }
    else
    {
      unsigned __int8 v6 = [(BKCollection *)self collectionID];
      unsigned __int8 v4 = [v6 isEqualToString:kBKCollectionDefaultIDSamples];
    }
  }

  return v4;
}

+ (void)addCollections:(id)a3 moc:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v15 = [v6 libraryManager];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (+[BKCollection isValidForDeserialization:v12])
        {
          unsigned int v13 = [v12 objectForKeyedSubscript:@"serverSyncUniqueId"];
          id v14 = +[BKCollection insertNewCollectionWithCollectionID:v13 inManagedObjectContext:v6];
          [v14 configureFromDictionary:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  [v15 resetNextCollectionSort];
}

- (void)configureFromBackupSummary:(id)a3
{
  id v20 = a3;
  unsigned __int8 v4 = [v20 objectForKey:@"serverSyncUniqueId"];
  [(BKCollection *)self setCollectionID:v4];
  uint64_t v5 = [v20 objectForKey:@"title"];
  id v6 = (void *)v5;
  if (v5) {
    CFStringRef v7 = (const __CFString *)v5;
  }
  else {
    CFStringRef v7 = &stru_D4160;
  }
  [(BKCollection *)self setTitle:v7];

  id v8 = [v20 objectForKey:@"sortKey"];
  [(BKCollection *)self setSortKey:v8];

  id v9 = [v20 objectForKey:@"sortMode"];
  if (v9) {
    [(BKCollection *)self setSortMode:v9];
  }
  uint64_t v10 = [v20 objectForKey:@"viewMode"];
  if (v10) {
    [(BKCollection *)self setViewMode:v10];
  }
  [(BKCollection *)self clearMaxSortKey];
  unsigned int v11 = [v20 objectForKey:@"deletedFlag"];
  if (v11)
  {
    [(BKCollection *)self setDeletedFlag:v11];
  }
  else
  {
    id v12 = +[NSNumber numberWithBool:0];
    [(BKCollection *)self setDeletedFlag:v12];
  }
  unsigned int v13 = [(BKCollection *)self deletedFlag];
  if ([v13 BOOLValue])
  {
  }
  else
  {
    id v14 = [(BKCollection *)self sortKey];

    if (v14) {
      goto LABEL_15;
    }
  }
  unsigned int v15 = +[NSNumber numberWithInt:0];
  [(BKCollection *)self setSortKey:v15];

LABEL_15:
  long long v16 = [(BKCollection *)self title];

  if (!v16) {
    [(BKCollection *)self setTitle:&stru_D4160];
  }
  long long v17 = [v20 objectForKey:@"lastModification"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(BKCollection *)self setLastModification:v17];
  }
  long long v18 = [(BKCollection *)self lastModification];

  if (!v18)
  {
    long long v19 = +[NSDate dateWithTimeIntervalSince1970:0.0];
    [(BKCollection *)self setLastModification:v19];
  }
}

+ (BOOL)isSelectableDefaultCollectionID:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [a1 availableSelectableDefaultCollectionIDsForOS];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)availableDefaultCollectionIDsForOS
{
  v4[0] = kBKCollectionDefaultAll;
  v4[1] = kBKCollectionDefaultIDBooks;
  v4[2] = kBKCollectionDefaultIDWantToRead;
  v4[3] = kBKCollectionDefaultIDAudiobooks;
  v4[4] = kBKCollectionDefaultIDDownloaded;
  void v4[5] = kBKCollectionDefaultIDFinished;
  v4[6] = kBKCollectionDefaultIDSamples;
  v4[7] = kBKCollectionDefaultIDPDFs;
  v2 = +[NSArray arrayWithObjects:v4 count:8];

  return v2;
}

+ (id)availableSelectableDefaultCollectionIDsForOS
{
  v4[0] = kBKCollectionDefaultIDBooks;
  v4[1] = kBKCollectionDefaultIDWantToRead;
  v4[2] = kBKCollectionDefaultIDAudiobooks;
  v4[3] = kBKCollectionDefaultIDDownloaded;
  v4[4] = kBKCollectionDefaultIDFinished;
  void v4[5] = kBKCollectionDefaultIDSamples;
  v4[6] = kBKCollectionDefaultIDPDFs;
  v2 = +[NSArray arrayWithObjects:v4 count:7];

  return v2;
}

+ (id)availableDefaultCollectionIDs
{
  v4[0] = kBKCollectionDefaultAll;
  v4[1] = kBKCollectionDefaultIDBooks;
  v4[2] = kBKCollectionDefaultIDWantToRead;
  v4[3] = kBKCollectionDefaultIDAudiobooks;
  v4[4] = kBKCollectionDefaultIDDownloaded;
  void v4[5] = kBKCollectionDefaultIDFinished;
  v4[6] = kBKCollectionDefaultIDSamples;
  void v4[7] = kBKCollectionDefaultIDPDFs;
  v2 = +[NSArray arrayWithObjects:v4 count:8];

  return v2;
}

+ (id)mapContentTypeToDefaultCollectionIDForOS
{
  if (qword_EE610 != -1) {
    dispatch_once(&qword_EE610, &stru_D2F38);
  }
  v2 = (void *)qword_EE618;

  return v2;
}

+ (id)contentTypesForDefaultCollectionWithID:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kBKCollectionDefaultIDBooks])
  {
    id v4 = &off_DA130;
  }
  else if ([v3 isEqualToString:kBKCollectionDefaultIDPDFs])
  {
    id v4 = &off_DA148;
  }
  else if ([v3 isEqualToString:kBKCollectionDefaultIDAudiobooks])
  {
    id v4 = &off_DA160;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)isSeriesCollectionID:(id)a3
{
  return [a3 hasPrefix:@"iBooks_Series_"];
}

+ (id)seriesCollectionIDForSeriesID:(id)a3
{
  return +[NSString stringWithFormat:@"%@%@", @"iBooks_Series_", a3];
}

+ (id)seriesIDFromSeriesCollectionID:(id)a3
{
  id v3 = a3;
  if (+[BKCollection isSeriesCollectionID:v3])
  {
    id v4 = [v3 substringFromIndex:[@"iBooks_Series_" length]];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  id v3 = [(BKCollection *)self collectionID];
  id v4 = [(BKCollection *)self title];
  uint64_t v5 = +[NSString stringWithFormat:@"<%@ (%p) collectionID=%@ title=%@>", @"self", self, v3, v4];

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  long long v19 = [(BKCollection *)self title];
  long long v18 = [(BKCollection *)self details];
  id v20 = [(BKCollection *)self collectionID];
  long long v17 = [(BKCollection *)self sortKey];
  id v3 = [(BKCollection *)self sortMode];
  id v4 = [(BKCollection *)self viewMode];
  unsigned int v5 = [(BKCollection *)self isDefaultCollection];
  CFStringRef v6 = @"NO";
  if (v5) {
    CFStringRef v6 = @"YES";
  }
  CFStringRef v16 = v6;
  CFStringRef v7 = [(BKCollection *)self deletedFlag];
  unsigned int v15 = [(BKCollection *)self hidden];
  id v8 = [(BKCollection *)self placeholder];
  id v9 = [(BKCollection *)self lastModification];
  uint64_t v10 = [(BKCollection *)self members];
  unsigned int v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 count]);
  id v12 = [(BKCollection *)self seriesID];
  unsigned int v13 = +[NSString stringWithFormat:@"   %@ (%p) \n title: %@\n details:%@ collectionID: %@\n sortKey: %@\n sortMode: %@\n viewMode: %@\n isDefault: %@\n deletedFlag: %@\n hidden: %@\n placeholder: %@ lastModification: %@\n member count: %@\n seriesID: %@", @"self", self, v19, v18, v20, v17, v3, v4, v16, v7, v15, v8, v9, v11, v12];

  return (NSString *)v13;
}

- (void)setMaxSortKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end