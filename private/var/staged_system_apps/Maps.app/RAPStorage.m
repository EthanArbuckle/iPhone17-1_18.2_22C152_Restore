@interface RAPStorage
+ (double)standardTimeToLive;
- (BOOL)_removeItemWithIdentifier:(id)a3 triggeringGarbageCollection:(BOOL)a4 error:(id *)a5;
- (BOOL)containsItems;
- (BOOL)removeItemWithIdentifier:(id)a3 error:(id *)a4;
- (NSArray)allItemIdentifiersByDescendingCreationDate;
- (RAPStorage)init;
- (RAPStorage)initWithStorageDirectoryURL:(id)a3;
- (RAPStorage)initWithStorageDirectoryURL:(id)a3 pathExtension:(id)a4;
- (double)itemTimeToLive;
- (id)_allItemIdentifiersByCreationDateSortedAscending:(BOOL)a3 dates:(id *)a4;
- (id)_itemURLForIdentifier:(id)a3;
- (id)creationDateForItemWithIdentifier:(id)a3 error:(id *)a4;
- (id)dataForItemWithIdentifier:(id)a3 error:(id *)a4;
- (id)initByUsingOrCreatingStorageDirectoryAtURL:(id)a3 error:(id *)a4;
- (void)_iterateAllItemIdentifiersIncludingURLPropertiesForKeys:(id)a3 usingBlock:(id)a4;
- (void)_iterateAllItemIdentifiersUsingBlock:(id)a3;
- (void)garbageCollectIfNeeded;
- (void)removeAllItems;
- (void)removeItemsPassingTest:(id)a3;
- (void)saveItemWithData:(id)a3 forIdentifier:(id)a4 completion:(id)a5;
- (void)setItemTimeToLive:(double)a3;
@end

@implementation RAPStorage

+ (double)standardTimeToLive
{
  GEOConfigGetDouble();
  return result;
}

- (RAPStorage)init
{
  double result = (RAPStorage *)+[NSException raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (id)initByUsingOrCreatingStorageDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(RAPStorage *)self initWithStorageDirectoryURL:v6];
  if (!v7
    || (+[NSFileManager defaultManager],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:a4], v8, v10 = 0, v9))
  {
    v10 = v7;
  }

  return v10;
}

- (RAPStorage)initWithStorageDirectoryURL:(id)a3
{
  return [(RAPStorage *)self initWithStorageDirectoryURL:a3 pathExtension:0];
}

- (RAPStorage)initWithStorageDirectoryURL:(id)a3 pathExtension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPStorage;
  v8 = [(RAPStorage *)&v15 init];
  unsigned int v9 = v8;
  if (v8)
  {
    v8->_itemTimeToLive = 1.79769313e308;
    v10 = (NSURL *)[v6 copy];
    directoryURL = v9->_directoryURL;
    v9->_directoryURL = v10;

    v12 = (NSString *)[v7 copy];
    pathExtension = v9->_pathExtension;
    v9->_pathExtension = v12;
  }
  return v9;
}

- (id)_itemURLForIdentifier:(id)a3
{
  directoryURL = self->_directoryURL;
  v5 = [a3 UUIDString];
  id v6 = [(NSURL *)directoryURL URLByAppendingPathComponent:v5];

  if (self->_pathExtension)
  {
    uint64_t v7 = [v6 URLByAppendingPathExtension:];

    id v6 = (void *)v7;
  }

  return v6;
}

- (void)saveItemWithData:(id)a3 forIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = dispatch_get_global_queue(-32768, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100515FF4;
  v15[3] = &unk_1012EDA50;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (id)dataForItemWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(RAPStorage *)self garbageCollectIfNeeded];
  uint64_t v7 = [(RAPStorage *)self _itemURLForIdentifier:v6];

  id v8 = +[NSData dataWithContentsOfURL:v7 options:1 error:a4];

  return v8;
}

- (BOOL)removeItemWithIdentifier:(id)a3 error:(id *)a4
{
  return [(RAPStorage *)self _removeItemWithIdentifier:a3 triggeringGarbageCollection:1 error:a4];
}

- (BOOL)_removeItemWithIdentifier:(id)a3 triggeringGarbageCollection:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6) {
    [(RAPStorage *)self garbageCollectIfNeeded];
  }
  id v9 = [(RAPStorage *)self _itemURLForIdentifier:v8];
  id v10 = +[NSFileManager defaultManager];
  unsigned __int8 v11 = [v10 removeItemAtURL:v9 error:a5];

  return v11;
}

- (void)_iterateAllItemIdentifiersUsingBlock:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100516400;
  v5[3] = &unk_1012EDA78;
  id v6 = a3;
  id v4 = v6;
  [(RAPStorage *)self _iterateAllItemIdentifiersIncludingURLPropertiesForKeys:&__NSArray0__struct usingBlock:v5];
}

- (void)_iterateAllItemIdentifiersIncludingURLPropertiesForKeys:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *, unsigned char *))a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = +[NSFileManager defaultManager];
  v20 = v6;
  id v9 = [v8 contentsOfDirectoryAtURL:self->_directoryURL includingPropertiesForKeys:v6 options:0 error:0];

  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v10) {
    goto LABEL_17;
  }
  id v11 = v10;
  uint64_t v12 = *(void *)v23;
  while (2)
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      if (self->_pathExtension)
      {
        objc_super v15 = [*(id *)(*((void *)&v22 + 1) + 8 * i) pathExtension];
        unsigned int v16 = [v15 isEqual:self->_pathExtension];

        if (!v16) {
          continue;
        }
        id v17 = [v14 lastPathComponent];
        id v18 = [v17 stringByDeletingPathExtension];
      }
      else
      {
        id v18 = [*(id *)(*((void *)&v22 + 1) + 8 * i) lastPathComponent];
      }
      v19 = +[NSUUID _maps_UUIDWithUUIDString:v18];
      if (v19)
      {
        char v21 = 0;
        v7[2](v7, v19, v14, &v21);
        if (v21)
        {

          goto LABEL_17;
        }
      }
    }
    id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_17:
}

- (void)removeItemsPassingTest:(id)a3
{
  id v4 = a3;
  [(RAPStorage *)self garbageCollectIfNeeded];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005166B8;
  v6[3] = &unk_1012EDAA0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(RAPStorage *)self _iterateAllItemIdentifiersUsingBlock:v6];
}

- (void)removeAllItems
{
  [(RAPStorage *)self garbageCollectIfNeeded];

  [(RAPStorage *)self removeItemsPassingTest:&stru_1012EDAE0];
}

- (NSArray)allItemIdentifiersByDescendingCreationDate
{
  return (NSArray *)[(RAPStorage *)self _allItemIdentifiersByCreationDateSortedAscending:0 dates:0];
}

- (id)_allItemIdentifiersByCreationDateSortedAscending:(BOOL)a3 dates:(id *)a4
{
  BOOL v5 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  NSURLResourceKey v25 = NSURLCreationDateKey;
  id v9 = +[NSArray arrayWithObjects:&v25 count:1];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1005169E4;
  v21[3] = &unk_1012EDB08;
  id v10 = v7;
  id v22 = v10;
  id v11 = v8;
  id v23 = v11;
  [(RAPStorage *)self _iterateAllItemIdentifiersIncludingURLPropertiesForKeys:v9 usingBlock:v21];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100516A78;
  v19[3] = &unk_1012EDB30;
  id v12 = v11;
  id v20 = v12;
  id v13 = +[NSSortDescriptor sortDescriptorWithKey:0 ascending:v5 comparator:v19];
  long long v24 = v13;
  id v14 = +[NSArray arrayWithObjects:&v24 count:1];
  [v10 sortUsingDescriptors:v14];

  if (a4)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100516AF8;
    v17[3] = &unk_1012EDB58;
    id v18 = v12;
    sub_100099700(v10, v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v15 = v10;

  return v15;
}

- (BOOL)containsItems
{
  v2 = self;
  [(RAPStorage *)self garbageCollectIfNeeded];
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100516BCC;
  v4[3] = &unk_1012EDB80;
  v4[4] = &v5;
  [(RAPStorage *)v2 _iterateAllItemIdentifiersUsingBlock:v4];
  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (id)creationDateForItemWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(RAPStorage *)self garbageCollectIfNeeded];
  uint64_t v7 = [(RAPStorage *)self _itemURLForIdentifier:v6];

  id v13 = 0;
  unsigned int v8 = [v7 getResourceValue:&v13 forKey:NSURLCreationDateKey error:a4];
  id v9 = v13;
  id v10 = v9;
  id v11 = 0;
  if (v8) {
    id v11 = v9;
  }

  return v11;
}

- (void)garbageCollectIfNeeded
{
  [(RAPStorage *)self itemTimeToLive];
  if (v3 != 1.79769313e308)
  {
    id v4 = +[NSDate dateWithTimeIntervalSinceNow:-v3];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v14 = 0;
    uint64_t v5 = [(RAPStorage *)self _allItemIdentifiersByCreationDateSortedAscending:1 dates:&v14];
    id v6 = v14;
    id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          id v13 = [v6 objectAtIndexedSubscript:(char *)i + v9];
          if ([v13 compare:v4] == (id)-1) {
            [(RAPStorage *)self _removeItemWithIdentifier:v12 triggeringGarbageCollection:0 error:0];
          }
        }
        id v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        v9 += (uint64_t)i;
      }
      while (v8);
    }
  }
}

- (void)setItemTimeToLive:(double)a3
{
  if (self->_itemTimeToLive != a3)
  {
    self->_itemTimeToLive = a3;
    [(RAPStorage *)self garbageCollectIfNeeded];
  }
}

- (double)itemTimeToLive
{
  return self->_itemTimeToLive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathExtension, 0);

  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end