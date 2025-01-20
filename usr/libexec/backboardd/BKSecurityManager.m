@interface BKSecurityManager
+ (BOOL)hasEntitlement:(id)a3 forAuditToken:(id *)a4;
+ (BOOL)hasEntitlement:(id)a3 forConnection:(id)a4;
+ (id)sharedInstance;
- (BKSecurityManager)init;
- (BOOL)_lock_hasEntitlement:(id)a3 usingCacheForAuditToken:(id *)a4;
- (BOOL)hasEntitlement:(id)a3 forAuditToken:(id *)a4;
- (void)_processDidTerminate:(int64_t)a3;
@end

@implementation BKSecurityManager

+ (BOOL)hasEntitlement:(id)a3 forAuditToken:(id *)a4
{
  id v5 = a3;
  v6 = +[BKSecurityManager sharedInstance];
  LOBYTE(a4) = [v6 hasEntitlement:v5 forAuditToken:a4];

  return (char)a4;
}

- (BOOL)hasEntitlement:(id)a3 forAuditToken:(id *)a4
{
  p_lock = &self->_lock;
  id v7 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(a4) = [(BKSecurityManager *)self _lock_hasEntitlement:v7 usingCacheForAuditToken:a4];

  os_unfair_lock_unlock(p_lock);
  return (char)a4;
}

+ (id)sharedInstance
{
  if (qword_100122ED0 != -1) {
    dispatch_once(&qword_100122ED0, &stru_1000F6BC0);
  }
  v2 = (void *)qword_100122EC8;

  return v2;
}

- (BOOL)_lock_hasEntitlement:(id)a3 usingCacheForAuditToken:(id *)a4
{
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v7 = *(_OWORD *)&a4->var0[4];
  v23[0] = *(_OWORD *)a4->var0;
  v23[1] = v7;
  v8 = +[BSAuditToken tokenFromAuditToken:v23];
  id v9 = [v8 versionedPID];
  lock_vpidToCacheEntry = self->_lock_vpidToCacheEntry;
  v11 = +[NSNumber numberWithLongLong:v9];
  v12 = [(NSMutableDictionary *)lock_vpidToCacheEntry objectForKey:v11];

  if (!v12)
  {
    v12 = objc_opt_new();
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100049A64;
    v22[3] = &unk_1000F8C30;
    v22[4] = self;
    v22[5] = v9;
    id v13 = [objc_alloc((Class)BSProcessDeathWatcher) initWithPID:[v8 pid] queue:&_dispatch_main_q deathHandler:v22];
    [v12 setDeathWatcher:v13];

    v14 = self->_lock_vpidToCacheEntry;
    v15 = +[NSNumber numberWithLongLong:v9];
    [(NSMutableDictionary *)v14 setObject:v12 forKey:v15];
  }
  v16 = [v12 entitlementCache];
  if (!v16)
  {
    v16 = objc_opt_new();
    [v12 setEntitlementCache:v16];
  }
  v17 = [v16 objectForKey:v6];
  v18 = v17;
  if (v17)
  {
    LOBYTE(v19) = [v17 BOOLValue];
  }
  else
  {
    id v19 = [v8 hasEntitlement:v6];
    v20 = +[NSNumber numberWithBool:v19];
    [v16 setObject:v20 forKey:v6];
  }
  return (char)v19;
}

- (void).cxx_destruct
{
}

- (void)_processDidTerminate:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  lock_vpidToCacheEntry = self->_lock_vpidToCacheEntry;
  long long v7 = +[NSNumber numberWithLongLong:a3];
  id v11 = [(NSMutableDictionary *)lock_vpidToCacheEntry objectForKey:v7];

  if (v11)
  {
    v8 = [v11 deathWatcher];
    [v8 invalidate];

    id v9 = self->_lock_vpidToCacheEntry;
    v10 = +[NSNumber numberWithLongLong:a3];
    [(NSMutableDictionary *)v9 removeObjectForKey:v10];
  }
  os_unfair_lock_unlock(p_lock);
}

- (BKSecurityManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)BKSecurityManager;
  v2 = [(BKSecurityManager *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    lock_vpidToCacheEntry = v3->_lock_vpidToCacheEntry;
    v3->_lock_vpidToCacheEntry = v4;
  }
  return v3;
}

+ (BOOL)hasEntitlement:(id)a3 forConnection:(id)a4
{
  memset(v8, 0, sizeof(v8));
  id v5 = a3;
  xpc_connection_get_audit_token();
  unsigned __int8 v6 = [a1 hasEntitlement:v5 forAuditToken:v8];

  return v6;
}

@end