@interface RoutingAppLaunchRecord
+ (BOOL)supportsSecureCoding;
- (NSMutableArray)recentlyLaunchedApps;
- (RoutingAppLaunchRecord)init;
- (RoutingAppLaunchRecord)initWithCoder:(id)a3;
- (RoutingAppLaunchRecord)initWithRecentlyLaunchedApps:(id)a3;
- (id)appIDsSortedByMostRecentLaunch:(id)a3;
- (id)rankedRoutingAppProxiesWithProxies:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)recordAppLaunch:(id)a3;
- (void)setRecentlyLaunchedApps:(id)a3;
@end

@implementation RoutingAppLaunchRecord

- (id)rankedRoutingAppProxiesWithProxies:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[v4 count]];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v13 = [v12 bundleIdentifier];
        [v5 addObject:v13];
        [v6 setObject:v12 forKeyedSubscript:v13];
      }
      id v9 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v9);
  }

  v14 = [(RoutingAppLaunchRecord *)self appIDsSortedByMostRecentLaunch:v5];
  id v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * (void)j) v23];
        [v15 addObject:v21];
      }
      id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return v15;
}

- (RoutingAppLaunchRecord)init
{
  return [(RoutingAppLaunchRecord *)self initWithRecentlyLaunchedApps:&__NSArray0__struct];
}

- (RoutingAppLaunchRecord)initWithRecentlyLaunchedApps:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutingAppLaunchRecord;
  id v5 = [(RoutingAppLaunchRecord *)&v9 init];
  if (v5)
  {
    id v6 = [v4 mutableCopy];
    [(RoutingAppLaunchRecord *)v5 setRecentlyLaunchedApps:v6];
    id v7 = v5;
  }
  return v5;
}

- (id)appIDsSortedByMostRecentLaunch:(id)a3
{
  id v4 = a3;
  id v5 = malloc_type_malloc(8 * (void)[v4 count], 0x100004000313F17uLL);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = [(NSMutableArray *)self->_recentlyLaunchedApps indexOfObject:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        if (v12 == (id)0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v13 = -1;
        }
        else {
          uint64_t v13 = (uint64_t)v12;
        }
        v5[v9 + (void)i] = v13;
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      v9 += (uint64_t)i;
    }
    while (v8);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100ADD950;
  v17[3] = &unk_101316EE8;
  id v18 = v6;
  uint64_t v19 = v5;
  id v14 = v6;
  id v15 = [v14 sortedArrayUsingComparator:v17];
  free(v5);

  return v15;
}

- (void)recordAppLaunch:(id)a3
{
  id v4 = a3;
  recentlyLaunchedApps = self->_recentlyLaunchedApps;
  id v8 = v4;
  if (!recentlyLaunchedApps)
  {
    id v6 = +[NSMutableArray arrayWithCapacity:1];
    id v7 = self->_recentlyLaunchedApps;
    self->_recentlyLaunchedApps = v6;

    id v4 = v8;
    recentlyLaunchedApps = self->_recentlyLaunchedApps;
  }
  [(NSMutableArray *)recentlyLaunchedApps removeObject:v4];
  [(NSMutableArray *)self->_recentlyLaunchedApps insertObject:v8 atIndex:0];
}

- (NSMutableArray)recentlyLaunchedApps
{
  id v2 = [(NSMutableArray *)self->_recentlyLaunchedApps copy];

  return (NSMutableArray *)v2;
}

- (void)encodeWithCoder:(id)a3
{
}

- (RoutingAppLaunchRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_recentlyLaunchedApps"];

  id v6 = &__NSArray0__struct;
  if (v5) {
    id v6 = v5;
  }
  id v7 = v6;

  id v8 = [(RoutingAppLaunchRecord *)self initWithRecentlyLaunchedApps:v7];
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setRecentlyLaunchedApps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end