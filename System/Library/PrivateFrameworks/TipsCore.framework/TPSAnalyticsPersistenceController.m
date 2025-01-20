@interface TPSAnalyticsPersistenceController
+ (id)asMutableDictionary;
+ (id)persistedObjectForKey:(id)a3;
+ (void)persistDictionary:(id)a3;
+ (void)persistObject:(id)a3 forKey:(id)a4;
@end

@implementation TPSAnalyticsPersistenceController

+ (id)persistedObjectForKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  v5 = [v3 standardUserDefaults];
  v6 = [v5 objectForKey:@"TPSAnalyticsStore"];
  v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

+ (void)persistObject:(id)a3 forKey:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CB18];
  id v6 = a4;
  id v7 = a3;
  id v10 = [v5 standardUserDefaults];
  v8 = [v10 objectForKey:@"TPSAnalyticsStore"];
  v9 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
  [v9 setObject:v7 forKeyedSubscript:v6];

  [v10 setObject:v9 forKey:@"TPSAnalyticsStore"];
  [v10 synchronize];
}

+ (id)asMutableDictionary
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 objectForKey:@"TPSAnalyticsStore"];
  id v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v7 = v6;

  return v7;
}

+ (void)persistDictionary:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"TPSAnalyticsStore"];

  [v5 synchronize];
}

@end