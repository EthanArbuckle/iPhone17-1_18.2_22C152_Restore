@interface APTargetingExpressionResults
+ (APUnfairRecursiveLock)lock;
+ (NSDictionary)results;
+ (NSMutableDictionary)mutableResults;
+ (void)addResult:(id)a3 result:(BOOL)a4;
+ (void)clearResults;
+ (void)setLock:(id)a3;
@end

@implementation APTargetingExpressionResults

+ (NSMutableDictionary)mutableResults
{
  v2 = (void *)qword_100288920;
  if (!qword_100288920)
  {
    id v3 = objc_alloc_init((Class)APUnfairRecursiveLock);
    +[APTargetingExpressionResults setLock:v3];

    v4 = +[APTargetingExpressionResults lock];
    [v4 lock];

    uint64_t v5 = +[NSMutableDictionary dictionary];
    v6 = (void *)qword_100288920;
    qword_100288920 = v5;

    v7 = +[APTargetingExpressionResults lock];
    [v7 unlock];

    v2 = (void *)qword_100288920;
  }

  return (NSMutableDictionary *)v2;
}

+ (APUnfairRecursiveLock)lock
{
  return (APUnfairRecursiveLock *)(id)qword_100288918;
}

+ (void)setLock:(id)a3
{
}

+ (NSDictionary)results
{
  v2 = +[APTargetingExpressionResults mutableResults];
  id v3 = [v2 copy];

  return (NSDictionary *)v3;
}

+ (void)addResult:(id)a3 result:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v9 = +[APTargetingExpressionResults mutableResults];
  v6 = +[APTargetingExpressionResults lock];
  [v6 lock];

  v7 = +[NSNumber numberWithBool:v4];
  [v9 setObject:v7 forKey:v5];

  v8 = +[APTargetingExpressionResults lock];
  [v8 unlock];
}

+ (void)clearResults
{
  v2 = +[APTargetingExpressionResults lock];
  [v2 lock];

  id v3 = +[APTargetingExpressionResults mutableResults];
  [v3 removeAllObjects];

  id v4 = +[APTargetingExpressionResults lock];
  [v4 unlock];
}

@end