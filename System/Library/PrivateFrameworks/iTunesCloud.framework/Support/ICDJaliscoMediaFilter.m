@interface ICDJaliscoMediaFilter
- (ICDJaliscoMediaFilter)initWithKindsToExclude:(id)a3 supportedMediaKindsHandler:(id)a4;
- (NSArray)supportedMediaKinds;
- (NSString)daapQueryFilterString;
@end

@implementation ICDJaliscoMediaFilter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMediaKindsHandler, 0);
  objc_storeStrong((id *)&self->_supportedMediaKinds, 0);

  objc_storeStrong((id *)&self->_excludedKinds, 0);
}

- (ICDJaliscoMediaFilter)initWithKindsToExclude:(id)a3 supportedMediaKindsHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICDJaliscoMediaFilter;
  v8 = [(ICDJaliscoMediaFilter *)&v12 init];
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    excludedKinds = v8->_excludedKinds;
    v8->_excludedKinds = v9;

    objc_storeStrong((id *)&v8->_supportedMediaKindsHandler, a4);
  }

  return v8;
}

- (NSString)daapQueryFilterString
{
  v3 = [@"com.apple.itunes.extended-media-kind" stringByReplacingOccurrencesOfString:@"-" withString:@"\\-"];
  v4 = [(ICDJaliscoMediaFilter *)self supportedMediaKinds];
  v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(ICDJaliscoMediaFilter *)self supportedMediaKinds];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"'%@:%d'", v3, [*(id *)(*((void *)&v16 + 1) + 8 * i) intValue]);
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v8);
  }

  objc_super v12 = [v5 componentsJoinedByString:@","];
  v13 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ - Media importer query filter set to: %{public}@", buf, 0x16u);
  }

  v14 = +[NSString stringWithFormat:@"(%@)", v12];

  return (NSString *)v14;
}

- (NSArray)supportedMediaKinds
{
  supportedMediaKinds = self->_supportedMediaKinds;
  if (!supportedMediaKinds)
  {
    if (self->_excludedKinds) {
      +[NSSet setWithArray:](NSSet, "setWithArray:");
    }
    else {
    v4 = +[NSSet set];
    }
    v5 = +[NSMutableSet setWithObject:&off_1001CBFD8];
    if (ICSystemApplicationIsInstalled())
    {
      if (-[ICDJaliscoSupportedMediaKindsHandler shouldIncludeMediaKindSongForJaliscoImport](self->_supportedMediaKindsHandler, "shouldIncludeMediaKindSongForJaliscoImport"))[v5 addObject:&off_1001CBFF0]; {
      [v5 addObject:&off_1001CC008];
      }
      [v5 addObject:&off_1001CC020];
    }
    if (ICSystemApplicationIsInstalled())
    {
      [v5 addObject:&off_1001CC038];
      [v5 addObject:&off_1001CC050];
      [v5 addObject:&off_1001CC068];
    }
    if (ICSystemApplicationIsInstalled()) {
      [v5 addObject:&off_1001CC080];
    }
    [v5 minusSet:v4];
    id v6 = [v5 allObjects];
    id v7 = +[ML3MusicLibrary jaliscoGetSortedMediaKinds:v6];
    id v8 = self->_supportedMediaKinds;
    self->_supportedMediaKinds = v7;

    uint64_t v9 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_supportedMediaKinds;
      int v12 = 138543874;
      v13 = self;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2114;
      long long v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ - Supported media kinds=%{public}@, Disabled media kinds=%{public}@", (uint8_t *)&v12, 0x20u);
    }

    supportedMediaKinds = self->_supportedMediaKinds;
  }

  return supportedMediaKinds;
}

@end