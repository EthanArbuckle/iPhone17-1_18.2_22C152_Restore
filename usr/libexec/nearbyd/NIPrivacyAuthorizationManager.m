@interface NIPrivacyAuthorizationManager
- (AuthorizationState)presentUserAuthorizationPrompt:(SEL)a3 forAuditToken:(id)a4 withBundleRecord:(id *)a5;
- (NIPrivacyAuthorizationManager)init;
- (id).cxx_construct;
- (int)authorizationStatusForSession:(id)a3 promptUserIfUndetermined:(BOOL)a4;
- (void)clearStateForPid:(int)a3;
@end

@implementation NIPrivacyAuthorizationManager

- (NIPrivacyAuthorizationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)NIPrivacyAuthorizationManager;
  return [(NIPrivacyAuthorizationManager *)&v3 init];
}

- (void)clearStateForPid:(int)a3
{
  int v5 = a3;
  v4 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  sub_10002A590((void *)self + 9, &v5);
  std::mutex::unlock(v4);
}

- (int)authorizationStatusForSession:(id)a3 promptUserIfUndetermined:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v26 = [v6 pid];
  std::mutex::lock((std::mutex *)((char *)self + 8));
  v7 = sub_10002A5C8((void *)self + 9, (int *)&v26);
  if (v7)
  {
    int v8 = *((_DWORD *)v7 + 6);
    std::mutex::unlock((std::mutex *)((char *)self + 8));
  }
  else
  {
    std::mutex::unlock((std::mutex *)((char *)self + 8));
    v9 = [v6 displayName];
    BOOL v10 = v9 == 0;

    if (v10)
    {
      v13 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10040E588(v13);
      }
      int v8 = 0;
    }
    else
    {
      v11 = [v6 connection];
      v12 = v11;
      if (v11) {
        [v11 auditToken];
      }
      else {
        memset(v25, 0, sizeof(v25));
      }
      id v24 = 0;
      v14 = +[LSBundleRecord bundleRecordForAuditToken:v25 error:&v24];
      id v15 = v24;

      if (!v14 || v15)
      {
        v19 = (id)qword_1008ABDE0;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = [v6 displayName];
          sub_10040E5CC(v20, (uint64_t)v15, (uint8_t *)&buf, v19);
        }

        int v8 = 0;
      }
      else if (v4)
      {
        v16 = [v6 displayName];
        v17 = [v6 connection];
        v18 = v17;
        if (v17) {
          [v17 auditToken];
        }
        else {
          memset(v23, 0, sizeof(v23));
        }
        [(NIPrivacyAuthorizationManager *)self presentUserAuthorizationPrompt:v16 forAuditToken:v23 withBundleRecord:v14];

        std::mutex::lock((std::mutex *)((char *)self + 8));
        v27 = &v26;
        v21 = sub_10002A7F4((uint64_t)self + 72, (int *)&v26, (uint64_t)&unk_1004BC2F8, &v27);
        *(_OWORD *)(v21 + 3) = buf;
        v21[5] = v29;
        std::mutex::unlock((std::mutex *)((char *)self + 8));
        AnalyticsSendEventLazy();
        int v8 = buf;
      }
      else
      {
        int v8 = 2;
      }
    }
  }

  return v8;
}

- (AuthorizationState)presentUserAuthorizationPrompt:(SEL)a3 forAuditToken:(id)a4 withBundleRecord:(id *)a5
{
  id v7 = a6;
  retstr->var0 = 2;
  retstr->var1.var0.__null_state_ = 0;
  retstr->var1.__engaged_ = 0;
  uint64_t v17 = kTCCAccessCheckOptionPrompt;
  v18 = &__kCFBooleanTrue;
  int v8 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  int v9 = TCCAccessCheckAuditToken();
  BOOL v10 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"YES";
    if (!v9) {
      CFStringRef v11 = @"NO";
    }
    *(_DWORD *)long long buf = 138412546;
    id v14 = v7;
    __int16 v15 = 2112;
    CFStringRef v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#bundle Application: %@, hasAccessToNearbyInteraction: %@", buf, 0x16u);
  }
  if (v9) {
    retstr->var0 = 3;
  }
  else {
    retstr->var0 = 4;
  }
  retstr->var1.var0.__val_ = sub_100006C38();
  retstr->var1.__engaged_ = 1;

  return result;
}

- (void).cxx_destruct
{
  sub_10002AC70((uint64_t)self + 72);

  std::mutex::~mutex((std::mutex *)((char *)self + 8));
}

- (id).cxx_construct
{
  *((void *)self + 1) = 850045863;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((void *)self + 12) = 0;
  *((_DWORD *)self + 26) = 1065353216;
  return self;
}

@end