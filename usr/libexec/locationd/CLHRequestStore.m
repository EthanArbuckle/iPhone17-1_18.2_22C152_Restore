@interface CLHRequestStore
- (CLHRequestStore)initWithRootDirectory:(id)a3 classifier:(id)a4;
- (id)allArchiveURLs;
- (id)archiveForHarvester:(int)a3;
- (id)archiveForHarvester:(int)a3 withSuffix:(id)a4;
- (id)archiveWithIdentifier:(id)a3;
- (id)classifyingStoreForHarvester:(int)a3;
- (id)classifyingStoreForHarvester:(int)a3 enableSubArchiving:(BOOL)a4 itemCountThresholdForAutoCleanUp:(int)a5;
- (id)classifyingStoreForHarvesterWithSubArchiving:(int)a3 itemCountThresholdForAutoCleanUp:(int)a4;
- (id)jsonObject;
- (id)requestArchivesForHarvester:(int)a3;
- (unint64_t)pointCountForHarvester:(int)a3;
- (void)clearDataForHarvester:(int)a3;
- (void)pruneSecondaryDataOlderThan:(double)a3 forHarvester:(int)a4;
@end

@implementation CLHRequestStore

- (CLHRequestStore)initWithRootDirectory:(id)a3 classifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLHRequestStore;
  v6 = [(CLHRequestStore *)&v8 init];
  if (v6)
  {
    v6->_rootDir = (NSURL *)a3;
    v6->_classifier = (CLHLocationClassifier *)a4;
  }
  return v6;
}

- (id)archiveWithIdentifier:(id)a3
{
  v3 = [[CLHRequestArchive alloc] initWithDirectory:[(NSString *)[(NSURL *)self->_rootDir path] stringByAppendingPathComponent:a3]];

  return v3;
}

- (id)archiveForHarvester:(int)a3
{
  uint64_t v5 = sub_100BA5C28(a3);
  v6 = [[CLHRequestArchive alloc] initWithDirectory:[(NSString *)[(NSURL *)self->_rootDir path] stringByAppendingPathComponent:sub_100BA5C48(a3)] requestCode:v5];

  return v6;
}

- (id)archiveForHarvester:(int)a3 withSuffix:(id)a4
{
  uint64_t v7 = sub_100BA5C28(a3);
  objc_super v8 = [[CLHRequestArchive alloc] initWithDirectory:[(NSString *)[(NSURL *)self->_rootDir path] stringByAppendingPathComponent:+[NSString stringWithFormat:@"%@-%@", sub_100BA5C48(a3), a4]] requestCode:v7];

  return v8;
}

- (id)classifyingStoreForHarvester:(int)a3 enableSubArchiving:(BOOL)a4 itemCountThresholdForAutoCleanUp:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  CFStringRef v9 = sub_100BA5C48(a3);
  v10 = [[CLHLocationAwareRequestArchive alloc] initWithClassifier:self->_classifier rootDirectory:self->_rootDir basename:v9 requestCode:sub_100BA5C28(a3) itemCountThresholdForAutoCleanUp:v5];
  v11 = v10;
  if (v6)
  {
    [(CLHRequestArchive *)[(CLHLocationAwareRequestArchive *)v10 homeArchive] generateNewSubArchive];
    [(CLHRequestArchive *)[(CLHLocationAwareRequestArchive *)v11 workArchive] generateNewSubArchive];
    [(CLHRequestArchive *)[(CLHLocationAwareRequestArchive *)v11 mainArchive] generateNewSubArchive];
  }

  return v11;
}

- (id)classifyingStoreForHarvester:(int)a3
{
  return [(CLHRequestStore *)self classifyingStoreForHarvester:*(void *)&a3 enableSubArchiving:0 itemCountThresholdForAutoCleanUp:0xFFFFFFFFLL];
}

- (id)classifyingStoreForHarvesterWithSubArchiving:(int)a3 itemCountThresholdForAutoCleanUp:(int)a4
{
  return [(CLHRequestStore *)self classifyingStoreForHarvester:*(void *)&a3 enableSubArchiving:1 itemCountThresholdForAutoCleanUp:*(void *)&a4];
}

- (void)clearDataForHarvester:(int)a3
{
  id v3 = [(CLHRequestStore *)self requestArchivesForHarvester:*(void *)&a3];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) eraseAllData];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)pruneSecondaryDataOlderThan:(double)a3 forHarvester:(int)a4
{
  id v5 = [(CLHRequestStore *)self requestArchivesForHarvester:*(void *)&a4];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) pruneSecondaryDataOlderThan:a3];
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)pointCountForHarvester:(int)a3
{
  id v3 = [(CLHRequestStore *)self requestArchivesForHarvester:*(void *)&a3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  unint64_t v6 = 0;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v3);
      }
      v6 += (unint64_t)[*(id *)(*((void *)&v10 + 1) + 8 * i) count];
    }
    id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v5);
  return v6;
}

- (id)requestArchivesForHarvester:(int)a3
{
  id v3 = [[-[CLHRequestStore allArchiveURLs](self, "allArchiveURLs") filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"self.lastPathComponent BEGINSWITH %@", sub_100BA5C48(a3))];
  id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v3 count]];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v9 = -[CLHRequestArchive initWithDirectory:]([CLHRequestArchive alloc], "initWithDirectory:", [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) path]);
        [v4 addObject:v9];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v4;
}

- (id)allArchiveURLs
{
  NSUInteger v12 = 0;
  id v3 = [+[NSFileManager defaultManager] contentsOfDirectoryAtURL:self->_rootDir includingPropertiesForKeys:0 options:0 error:&v12];
  if (v12)
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    id v4 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_FAULT))
    {
      rootDir = self->_rootDir;
      *(_DWORD *)buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      v16 = "";
      __int16 v17 = 2113;
      v18 = rootDir;
      __int16 v19 = 2113;
      NSUInteger v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"failed to find contents of rootDir\", \"url\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_10231EDF0);
      }
    }
    id v6 = qword_102419568;
    if (os_signpost_enabled((os_log_t)qword_102419568))
    {
      uint64_t v7 = self->_rootDir;
      *(_DWORD *)buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      v16 = "";
      __int16 v17 = 2113;
      v18 = v7;
      __int16 v19 = 2113;
      NSUInteger v20 = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "failed to find contents of rootDir", "{\"msg%{public}.0s\":\"failed to find contents of rootDir\", \"url\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x26u);
    }
  }
  else
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_10231EDF0);
    }
    uint64_t v8 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      long long v9 = self->_rootDir;
      NSUInteger v10 = [(NSArray *)v3 count];
      *(_DWORD *)buf = 68289539;
      int v14 = 0;
      __int16 v15 = 2082;
      v16 = "";
      __int16 v17 = 2113;
      v18 = v9;
      __int16 v19 = 2049;
      NSUInteger v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"found contents of rootDir\", \"url\":%{private, location:escape_only}@, \"count\":%{private}lu}", buf, 0x26u);
    }
  }
  return v3;
}

- (id)jsonObject
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(CLHRequestStore *)self allArchiveURLs];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = -[CLHRequestArchive initWithDirectory:]([CLHRequestArchive alloc], "initWithDirectory:", [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) path]);
        [v3 addObject:-[CLHRequestArchive jsonObject](v9, "jsonObject")];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

@end