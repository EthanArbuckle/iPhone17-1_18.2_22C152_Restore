@interface BICCoreDataPersistentStoring
+ (id)_imageEntryFetchRequest;
+ (id)_imageSetFetchRequest;
+ (id)_predicateForImageEntriesMatchingAddedEntries:(id)a3;
+ (id)_predicateForImageSetWithID:(id)a3;
+ (id)_predicateForImageSetsWithIDs:(id)a3;
+ (id)_predicateForToBeDeletedImageEntriesInLevelID:(signed __int16)a3;
- (BICCoreDataPersistentStoring)initWithURL:(id)a3;
- (BUCoalescingCallBlock)coalescingSaves;
- (NSManagedObjectContext)backgroundContext;
- (NSPersistentContainer)container;
- (NSURL)url;
- (id)addNewImageEntryToSet:(id)a3;
- (id)addNewImageSetWithIdentifier:(id)a3;
- (id)fetchAllImageSets;
- (id)fetchImageEntriesMatchingAddedEntries:(id)a3;
- (id)fetchImageEntriesWithLocations:(id)a3;
- (id)fetchImageSetsWithDescribedImages:(id)a3;
- (id)fetchImageSetsWithIDs:(id)a3;
- (id)fetchToBeDeletedImageEntriesInLevelID:(signed __int16)a3;
- (id)imageSetForIdentifier:(id)a3;
- (int64_t)onceToken;
- (void)_commonInit;
- (void)clean:(id)a3;
- (void)deleteObject:(id)a3;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)processPendingChanges;
- (void)removeImageSets:(id)a3;
- (void)saveIfNeeded;
- (void)setBackgroundContext:(id)a3;
- (void)setCoalescingSaves:(id)a3;
- (void)setContainer:(id)a3;
- (void)setOnceToken:(int64_t)a3;
- (void)setUrl:(id)a3;
@end

@implementation BICCoreDataPersistentStoring

+ (id)_imageSetFetchRequest
{
  return +[BICImageSet fetchRequest];
}

+ (id)_imageEntryFetchRequest
{
  return +[BICImageEntry fetchRequest];
}

+ (id)_predicateForToBeDeletedImageEntriesInLevelID:(signed __int16)a3
{
  v3 = +[NSNumber numberWithShort:a3];
  v4 = +[NSPredicate predicateWithFormat:@"state = %@ AND level = %@", &off_2E15F0, v3];

  return v4;
}

+ (id)_predicateForImageSetWithID:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"identifier = %@", a3];
}

+ (id)_predicateForImageSetsWithIDs:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"identifier in %@", a3];
}

+ (id)_predicateForImageEntriesMatchingAddedEntries:(id)a3
{
  v3 = [a3 valueForKey:@"entryLocation"];
  v4 = +[NSPredicate predicateWithFormat:@"entryLocation IN %@", v3];

  return v4;
}

- (BICCoreDataPersistentStoring)initWithURL:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BICCoreDataPersistentStoring;
  v6 = [(BICCoreDataPersistentStoring *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    id v8 = objc_alloc((Class)BUCoalescingCallBlock);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_C6588;
    v13[3] = &unk_2C3A18;
    v9 = v7;
    v14 = v9;
    id v10 = [v8 initWithNotifyBlock:v13 blockDescription:@"CoreData Saves"];
    id v11 = v9[5];
    v9[5] = v10;

    [v9[5] setCoalescingDelay:5.0];
  }

  return v7;
}

- (void)_commonInit
{
  int64_t onceToken = self->_onceToken;
  p_int64_t onceToken = &self->_onceToken;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C67C4;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (onceToken != -1) {
    dispatch_once(p_onceToken, block);
  }
}

- (id)imageSetForIdentifier:(id)a3
{
  id v4 = a3;
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v5 = +[BICCoreDataPersistentStoring _imageSetFetchRequest];
  [v5 setIncludesPendingChanges:1];
  [v5 setReturnsObjectsAsFaults:0];
  v6 = +[BICCoreDataPersistentStoring _predicateForImageSetWithID:v4];
  [v5 setPredicate:v6];

  v7 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  id v14 = 0;
  id v8 = [v7 executeFetchRequest:v5 error:&v14];
  id v9 = v14;

  if ((unint64_t)[v8 count] >= 2)
  {
    id v10 = BCImageCacheLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1ED2A4();
    }
  }
  if (v9)
  {
    id v11 = BCImageCacheLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1ED23C();
    }
  }
  if ([v8 count])
  {
    v12 = [v8 objectAtIndexedSubscript:0];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)addNewImageSetWithIdentifier:(id)a3
{
  id v4 = a3;
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v5 = [BICImageSet alloc];
  v6 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  v7 = [(BICImageSet *)v5 initWithContext:v6];

  [(BICImageSet *)v7 setIdentifier:v4];

  return v7;
}

- (id)addNewImageEntryToSet:(id)a3
{
  id v4 = a3;
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v5 = [BICImageEntry alloc];
  v6 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  v7 = [(BICImageEntry *)v5 initWithContext:v6];

  [(BICImageEntry *)v7 setImageSet:v4];

  return v7;
}

- (void)performBlock:(id)a3
{
  id v4 = a3;
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v5 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  [v5 performBlock:v4];
}

- (void)performBlockAndWait:(id)a3
{
  id v4 = a3;
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v5 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  [v5 performBlockAndWait:v4];
}

- (void)deleteObject:(id)a3
{
  id v4 = a3;
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v5 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  [v5 deleteObject:v4];
}

- (void)processPendingChanges
{
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v3 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  [v3 processPendingChanges];
}

- (void)saveIfNeeded
{
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v3 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  unsigned int v4 = [v3 hasChanges];

  if (v4)
  {
    id v5 = [(BICCoreDataPersistentStoring *)self coalescingSaves];
    [v5 signalWithCompletion:&stru_2C8958];
  }
}

- (id)fetchAllImageSets
{
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v3 = +[BICCoreDataPersistentStoring _imageSetFetchRequest];
  [v3 setIncludesPendingChanges:1];
  [v3 setReturnsObjectsAsFaults:0];
  [v3 setFetchBatchSize:64];
  unsigned int v4 = +[NSPredicate predicateWithValue:1];
  [v3 setPredicate:v4];

  id v5 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  id v10 = 0;
  v6 = [v5 executeFetchRequest:v3 error:&v10];
  id v7 = v10;

  if (v7)
  {
    id v8 = BCImageCacheLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1ED30C();
    }
  }

  return v6;
}

- (id)fetchImageSetsWithIDs:(id)a3
{
  id v4 = a3;
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v5 = +[BICCoreDataPersistentStoring _imageSetFetchRequest];
  [v5 setIncludesPendingChanges:1];
  [v5 setReturnsObjectsAsFaults:0];
  objc_msgSend(v5, "setFetchBatchSize:", 32 * ((unint64_t)objc_msgSend(v4, "count") > 0x40));
  v6 = +[BICCoreDataPersistentStoring _predicateForImageSetsWithIDs:v4];

  [v5 setPredicate:v6];
  id v7 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  id v12 = 0;
  id v8 = [v7 executeFetchRequest:v5 error:&v12];
  id v9 = v12;

  if (v9)
  {
    id v10 = BCImageCacheLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1ED374();
    }
  }

  return v8;
}

- (id)fetchImageSetsWithDescribedImages:(id)a3
{
  id v4 = [a3 valueForKey:@"identifier"];
  id v5 = [(BICCoreDataPersistentStoring *)self fetchImageSetsWithIDs:v4];

  return v5;
}

- (void)removeImageSets:(id)a3
{
  id v4 = a3;
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v5 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_C72C0;
  v7[3] = &unk_2C3AF8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (id)fetchToBeDeletedImageEntriesInLevelID:(signed __int16)a3
{
  uint64_t v3 = a3;
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v5 = +[BICCoreDataPersistentStoring _imageEntryFetchRequest];
  [v5 setIncludesPendingChanges:1];
  id v6 = +[BICCoreDataPersistentStoring _predicateForToBeDeletedImageEntriesInLevelID:v3];
  [v5 setPredicate:v6];

  id v7 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  id v12 = 0;
  id v8 = [v7 executeFetchRequest:v5 error:&v12];
  id v9 = v12;

  if (v9)
  {
    id v10 = BCImageCacheLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1ED444();
    }
  }

  return v8;
}

- (id)fetchImageEntriesMatchingAddedEntries:(id)a3
{
  id v4 = a3;
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v5 = +[BICCoreDataPersistentStoring _imageEntryFetchRequest];
  [v5 setIncludesPendingChanges:1];
  [v5 setReturnsObjectsAsFaults:0];
  [v5 setFetchBatchSize:32];
  id v6 = +[BICCoreDataPersistentStoring _predicateForImageEntriesMatchingAddedEntries:v4];

  [v5 setPredicate:v6];
  id v7 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  id v12 = 0;
  id v8 = [v7 executeFetchRequest:v5 error:&v12];
  id v9 = v12;

  if (v9)
  {
    id v10 = BCImageCacheLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1ED4AC();
    }
  }

  return v8;
}

- (id)fetchImageEntriesWithLocations:(id)a3
{
  id v4 = a3;
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v5 = +[BICCoreDataPersistentStoring _imageEntryFetchRequest];
  [v5 setIncludesPendingChanges:1];
  [v5 setReturnsObjectsAsFaults:0];
  id v6 = +[NSPredicate predicateWithFormat:@"entryLocation in %@", v4];

  [v5 setPredicate:v6];
  id v7 = [(BICCoreDataPersistentStoring *)self backgroundContext];
  id v12 = 0;
  id v8 = [v7 executeFetchRequest:v5 error:&v12];
  id v9 = v12;

  if (v9)
  {
    id v10 = BCImageCacheLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1ED514();
    }
  }

  return v8;
}

- (void)clean:(id)a3
{
  id v4 = a3;
  [(BICCoreDataPersistentStoring *)self _commonInit];
  id v5 = [(BICCoreDataPersistentStoring *)self url];

  if (v5)
  {
    id v6 = +[BICCoreDataPersistentStoring _imageSetFetchRequest];
    [v6 setIncludesPendingChanges:1];
    id v7 = +[NSPredicate predicateWithValue:1];
    [v6 setPredicate:v7];

    id v8 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v6];
    id v9 = [(BICCoreDataPersistentStoring *)self backgroundContext];
    id v10 = [v9 executeRequest:v8 error:0];

    id v11 = objc_retainBlock(v4);
    id v12 = v11;
    if (v11) {
      (*((void (**)(id))v11 + 2))(v11);
    }
  }
  else
  {
    v13 = [(BICCoreDataPersistentStoring *)self backgroundContext];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_C7954;
    v14[3] = &unk_2C4370;
    v14[4] = self;
    id v15 = v4;
    [v13 performBlock:v14];
  }
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSManagedObjectContext)backgroundContext
{
  return self->_backgroundContext;
}

- (void)setBackgroundContext:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (int64_t)onceToken
{
  return self->_onceToken;
}

- (void)setOnceToken:(int64_t)a3
{
  self->_int64_t onceToken = a3;
}

- (BUCoalescingCallBlock)coalescingSaves
{
  return self->_coalescingSaves;
}

- (void)setCoalescingSaves:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingSaves, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_backgroundContext, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end