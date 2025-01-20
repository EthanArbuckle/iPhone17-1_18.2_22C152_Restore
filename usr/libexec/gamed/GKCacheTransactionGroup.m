@interface GKCacheTransactionGroup
+ (id)dispatchGroupWithName:(id)a3;
+ (id)transactionGroupWithName:(id)a3 context:(id)a4 client:(id)a5;
- (GKCacheTransactionGroup)initWithName:(id)a3;
- (GKCacheTransactionGroup)initWithName:(id)a3 context:(id)a4 client:(id)a5;
- (GKCacheTransactionGroup)transactionGroupWithName:(id)a3;
- (GKClientProxy)client;
- (NSManagedObjectContext)context;
- (void)dealloc;
- (void)notifyOnMainQueueWithBlock:(id)a3;
- (void)notifyOnQueue:(id)a3 block:(id)a4;
- (void)performOnManagedObjectContext:(id)a3;
- (void)performOnQueue:(id)a3 block:(id)a4;
- (void)setClient:(id)a3;
- (void)setContext:(id)a3;
- (void)stripGKPlayerInternalPIIs;
@end

@implementation GKCacheTransactionGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)performOnManagedObjectContext:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FC460(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001316C;
  v16[3] = &unk_1002DA448;
  v16[4] = self;
  id v17 = v4;
  v15.receiver = self;
  v15.super_class = (Class)GKCacheTransactionGroup;
  id v14 = v4;
  [(GKCacheTransactionGroup *)&v15 perform:v16];
}

- (void)notifyOnQueue:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100012294;
  v10[3] = &unk_1002DA498;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v11 = v8;
  v9.receiver = self;
  v9.super_class = (Class)GKCacheTransactionGroup;
  [(GKCacheTransactionGroup *)&v9 notifyOnQueue:v6 block:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)stripGKPlayerInternalPIIs
{
  v3 = [(GKCacheTransactionGroup *)self client];
  unsigned __int8 v4 = [v3 clientHasAnyPrivateEntitlement];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = OBJC_IVAR___GKDispatchGroup__result;
    if (*(void *)&self->GKDispatchGroup_opaque[OBJC_IVAR___GKDispatchGroup__result])
    {
      objc_opt_class();
      uint64_t isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        id v7 = *(void **)&self->GKDispatchGroup_opaque[v5];
        sub_1000FC10C(isKindOfClass, v7);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = [*(id *)&self->GKDispatchGroup_opaque[v5] allValues];
          sub_1000FC10C((uint64_t)v9, v9);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v8 = *(void **)&self->GKDispatchGroup_opaque[v5];
            [v8 sanitize];
          }
        }
      }
    }
  }
}

- (GKClientProxy)client
{
  return self->_client;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)dealloc
{
  v3 = self->_context;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000F5D4;
  v6[3] = &unk_1002DA3F8;
  id v7 = v3;
  unsigned __int8 v4 = v3;
  GKIncrementContextTransactionCount(v4, -1, v6);

  v5.receiver = self;
  v5.super_class = (Class)GKCacheTransactionGroup;
  [(GKCacheTransactionGroup *)&v5 dealloc];
}

+ (id)transactionGroupWithName:(id)a3 context:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  id v12 = os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FC374(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  id v20 = [objc_alloc((Class)a1) initWithName:v8 context:v9 client:v10];

  return v20;
}

- (GKCacheTransactionGroup)initWithName:(id)a3 context:(id)a4 client:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = (id)GKOSLoggers();
  }
  id v12 = os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG)) {
    sub_1000FC3AC(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  v26.receiver = self;
  v26.super_class = (Class)GKCacheTransactionGroup;
  id v20 = [(GKCacheTransactionGroup *)&v26 initWithName:v8];
  if (v20)
  {
    if (!v9)
    {
      v21 = +[NSString stringWithFormat:@"Assertion failed"];
      v22 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheTransactionGroup.m"];
      id v23 = [v22 lastPathComponent];
      v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (context != ((void *)0))\n[%s (%s:%d)]", v21, "-[GKCacheTransactionGroup initWithName:context:client:]", [v23 UTF8String], 93);

      +[NSException raise:@"GameKit Exception", @"%@", v24 format];
    }
    [(GKCacheTransactionGroup *)v20 setContext:v9];
    [(GKCacheTransactionGroup *)v20 setClient:v10];
    GKIncrementContextTransactionCount(v20->_context, 1, 0);
  }

  return v20;
}

- (void)setContext:(id)a3
{
}

- (void)setClient:(id)a3
{
}

- (void)performOnQueue:(id)a3 block:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000CD14;
  v8[3] = &unk_1002DA448;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  [(GKCacheTransactionGroup *)self perform:v8];
}

+ (id)dispatchGroupWithName:(id)a3
{
  v3 = +[NSString stringWithFormat:@"Cannot use dispatchGroupWithName with GKCacheTransactionGroup"];
  unsigned __int8 v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheTransactionGroup.m"];
  id v5 = [v4 lastPathComponent];
  id v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (NO)\n[%s (%s:%d)]", v3, "+[GKCacheTransactionGroup dispatchGroupWithName:]", [v5 UTF8String], 58);

  +[NSException raise:@"GameKit Exception", @"%@", v6 format];
  return 0;
}

- (GKCacheTransactionGroup)transactionGroupWithName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(GKCacheTransactionGroup *)self context];
  id v7 = [(GKCacheTransactionGroup *)self client];
  id v8 = [v5 initWithName:v4 context:v6 client:v7];

  return (GKCacheTransactionGroup *)v8;
}

- (GKCacheTransactionGroup)initWithName:(id)a3
{
  id v4 = +[NSString stringWithFormat:@"Cannot use initWithName: with GKCacheTransactionGroup"];
  id v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheTransactionGroup.m"];
  id v6 = [v5 lastPathComponent];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@ (NO)\n[%s (%s:%d)]", v4, "-[GKCacheTransactionGroup initWithName:]", [v6 UTF8String], 81);

  +[NSException raise:@"GameKit Exception", @"%@", v7 format];
  return 0;
}

- (void)notifyOnMainQueueWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FC318;
  v7[3] = &unk_1002DA498;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)GKCacheTransactionGroup;
  [(GKCacheTransactionGroup *)&v6 notifyOnMainQueueWithBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

@end