@interface APNotificationsDataAdaptor
+ (id)identifier;
- (BOOL)_validateParameters:(id *)a3;
- (NSMutableDictionary)foundBundleIDs;
- (NSNumber)minCount;
- (NSSet)bundleIDs;
- (id)_biomeStream;
- (id)calculateResultFromEvents;
- (void)_incrementBundleIDCount:(id)a3;
- (void)eventReceived:(id)a3;
- (void)setBundleIDs:(id)a3;
- (void)setFoundBundleIDs:(id)a3;
- (void)setMinCount:(id)a3;
@end

@implementation APNotificationsDataAdaptor

+ (id)identifier
{
  return @"com.apple.ap.notifications";
}

- (BOOL)_validateParameters:(id *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)APNotificationsDataAdaptor;
  if (-[APBiomeDataAdaptor _validateParameters:](&v15, "_validateParameters:"))
  {
    v5 = [(APDataAdaptor *)self parameters];
    v6 = [v5 objectForKeyedSubscript:@"bundleIDs"];
    BOOL v7 = [(APDataAdaptor *)self _requireClassType:v6 name:@"bundleIDs" expectedClass:objc_opt_class() error:a3];
    if (!v7)
    {

      goto LABEL_7;
    }
    v8 = [(APDataAdaptor *)self parameters];
    v9 = [v8 objectForKeyedSubscript:@"minCount"];
    unsigned int v10 = [(APDataAdaptor *)self _checkClassType:v9 name:@"minCount" expectedClass:objc_opt_class() error:a3];

    if (v10)
    {
      v11 = [(APDataAdaptor *)self parameters];
      v12 = [v11 objectForKeyedSubscript:@"bundleIDs"];
      v13 = +[NSSet setWithArray:v12];
      [(APNotificationsDataAdaptor *)self setBundleIDs:v13];

      v5 = +[NSMutableDictionary dictionary];
      [(APNotificationsDataAdaptor *)self setFoundBundleIDs:v5];
LABEL_7:

      return v7;
    }
  }
  return 0;
}

- (id)_biomeStream
{
  v2 = BiomeLibrary();
  v3 = [v2 Notification];
  v4 = [v3 Usage];

  return v4;
}

- (id)calculateResultFromEvents
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(APNotificationsDataAdaptor *)self foundBundleIDs];
  v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        int v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) intValue];
        v11 = [(APNotificationsDataAdaptor *)self minCount];
        v7 |= v10 > (int)[v11 intValue];
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  v12 = +[NSNumber numberWithBool:v7 & 1];

  return v12;
}

- (void)eventReceived:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([v4 eventBody],
        id v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    id v7 = v4;
    uint64_t v8 = [(APNotificationsDataAdaptor *)self bundleIDs];
    v9 = [v7 eventBody];
    int v10 = [v9 bundleID];
    unsigned int v11 = [v8 containsObject:v10];

    if (v11)
    {
      v12 = [v7 eventBody];
      v13 = [v12 bundleID];
      [(APNotificationsDataAdaptor *)self _incrementBundleIDCount:v13];
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005E9B0;
    block[3] = &unk_100233D50;
    id v15 = v4;
    if (qword_100288900 != -1) {
      dispatch_once(&qword_100288900, block);
    }
  }
}

- (void)_incrementBundleIDCount:(id)a3
{
  id v9 = a3;
  id v4 = [(APNotificationsDataAdaptor *)self foundBundleIDs];
  id v5 = [v4 objectForKeyedSubscript:v9];

  if (!v5)
  {
    id v5 = +[NSNumber numberWithInt:0];
    id v6 = [(APNotificationsDataAdaptor *)self foundBundleIDs];
    [v6 setObject:v5 forKey:v9];
  }
  id v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 intValue] + 1);

  uint64_t v8 = [(APNotificationsDataAdaptor *)self foundBundleIDs];
  [v8 setObject:v7 forKey:v9];
}

- (NSSet)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (NSNumber)minCount
{
  return self->_minCount;
}

- (void)setMinCount:(id)a3
{
}

- (NSMutableDictionary)foundBundleIDs
{
  return self->_foundBundleIDs;
}

- (void)setFoundBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundBundleIDs, 0);
  objc_storeStrong((id *)&self->_minCount, 0);

  objc_storeStrong((id *)&self->_bundleIDs, 0);
}

@end