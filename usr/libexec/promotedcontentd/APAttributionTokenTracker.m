@interface APAttributionTokenTracker
+ (id)defaultTracker;
- (APAttributionTokenTracker)init;
- (APUnfairLock)tokensLock;
- (BOOL)isTokenUsed:(id)a3;
- (BOOL)isTokenUsedByOtherBundle:(id)a3 bundleID:(id)a4;
- (NSMutableDictionary)bundles;
- (void)addToken:(id)a3 bundleID:(id)a4;
- (void)setBundles:(id)a3;
- (void)setTokensLock:(id)a3;
@end

@implementation APAttributionTokenTracker

- (APAttributionTokenTracker)init
{
  v8.receiver = self;
  v8.super_class = (Class)APAttributionTokenTracker;
  v2 = [(APAttributionTokenTracker *)&v8 init];
  if (v2)
  {
    v3 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
    tokensLock = v2->_tokensLock;
    v2->_tokensLock = v3;

    uint64_t v5 = +[NSMutableDictionary dictionaryWithCapacity:10];
    bundles = v2->_bundles;
    v2->_bundles = (NSMutableDictionary *)v5;
  }
  return v2;
}

+ (id)defaultTracker
{
  if (qword_100288998 != -1) {
    dispatch_once(&qword_100288998, &stru_1002341D8);
  }
  v2 = (void *)qword_100288990;

  return v2;
}

- (void)addToken:(id)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(APAttributionTokenTracker *)self tokensLock];
  [v8 lock];

  v9 = [(APAttributionTokenTracker *)self bundles];
  [v9 setObject:v7 forKey:v6];

  id v10 = [(APAttributionTokenTracker *)self tokensLock];
  [v10 unlock];
}

- (BOOL)isTokenUsedByOtherBundle:(id)a3 bundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(APAttributionTokenTracker *)self tokensLock];
  [v8 lock];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = [(APAttributionTokenTracker *)self bundles];
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v14 = [(APAttributionTokenTracker *)self bundles];
        v15 = [v14 objectForKeyedSubscript:v13];
        if ([v6 isEqualToString:v15])
        {
          unsigned __int8 v16 = [v7 isEqualToString:v13];

          if ((v16 & 1) == 0)
          {
            LOBYTE(v10) = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
LABEL_12:

  v17 = [(APAttributionTokenTracker *)self tokensLock];
  [v17 unlock];

  return (char)v10;
}

- (BOOL)isTokenUsed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APAttributionTokenTracker *)self tokensLock];
  [v5 lock];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(APAttributionTokenTracker *)self bundles];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [(APAttributionTokenTracker *)self bundles];
        v12 = [v11 objectForKeyedSubscript:v10];
        unsigned __int8 v13 = [v4 isEqualToString:v12];

        if (v13)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v14 = [(APAttributionTokenTracker *)self tokensLock];
  [v14 unlock];

  return (char)v7;
}

- (APUnfairLock)tokensLock
{
  return self->_tokensLock;
}

- (void)setTokensLock:(id)a3
{
}

- (NSMutableDictionary)bundles
{
  return self->_bundles;
}

- (void)setBundles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundles, 0);

  objc_storeStrong((id *)&self->_tokensLock, 0);
}

@end