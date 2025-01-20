@interface NIServerFindingServicePool
+ (id)sharedInstance;
- (NIServerFindingServicePool)init;
- (id).cxx_construct;
- (id)printableState;
- (id)serviceForToken:(id)a3 createIfNotExists:(BOOL)a4;
- (void)logSessionEvent:(id)a3;
- (void)logSessionSummary:(id)a3;
- (void)setService:(id)a3 forToken:(id)a4;
@end

@implementation NIServerFindingServicePool

- (NIServerFindingServicePool)init
{
  v9.receiver = self;
  v9.super_class = (Class)NIServerFindingServicePool;
  v2 = [(NIServerFindingServicePool *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    sub_1001E6AF8((void *)v2 + 2, 0x32uLL);
    sub_1001E6AF8((void *)v2 + 8, 6uLL);
    *((_DWORD *)v2 + 60) = 0;
    if (+[NIPlatformInfo isInternalBuild]
      || (+[NSUserDefaults standardUserDefaults],
          v5 = objc_claimAutoreleasedReturnValue(),
          unsigned int v6 = [v5 BOOLForKey:@"EnableStateDump"],
          v5,
          v6))
    {
      v8 = v2;
      os_state_add_handler();
    }
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1008A56E8 != -1) {
    dispatch_once(&qword_1008A56E8, &stru_10085A4C0);
  }
  v2 = (void *)qword_1008A56E0;

  return v2;
}

- (void)setService:(id)a3 forToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    std::mutex::lock((std::mutex *)((char *)self + 112));
    if (!v6)
    {
      v11 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#find-ses,FindingServicePool remove service for token: %{public}@", (uint8_t *)&v13, 0xCu);
      }
      [*((id *)self + 1) removeObjectForKey:v7];
      goto LABEL_13;
    }
    v8 = [*((id *)self + 1) objectForKeyedSubscript:v7];

    if (v8)
    {
      objc_super v9 = [*((id *)self + 1) objectForKeyedSubscript:v7];
      unsigned __int8 v10 = [v9 isEqual:v6];

      if (v10)
      {
LABEL_13:
        std::mutex::unlock((std::mutex *)((char *)self + 112));
        goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_10041F954();
      }
    }
    else
    {
      v12 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        id v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#find-ses,FindingServicePool replace nil service for token: %{public}@. Race condition (OK)", (uint8_t *)&v13, 0xCu);
      }
    }
    [*((id *)self + 1) setObject:v6 forKey:v7];
    goto LABEL_13;
  }
LABEL_14:
}

- (id)serviceForToken:(id)a3 createIfNotExists:(BOOL)a4
{
  id v6 = a3;
  id v7 = (std::mutex *)((char *)self + 112);
  std::mutex::lock((std::mutex *)((char *)self + 112));
  if (a4)
  {
    v8 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#find-ses,FindingServicePool provide service for token: %{public}@", buf, 0xCu);
    }
    objc_super v9 = (id *)((char *)self + 8);
    unsigned __int8 v10 = [*((id *)self + 1) objectForKeyedSubscript:v6];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      uint64_t v12 = *((unsigned int *)self + 60);
      *((_DWORD *)self + 60) = v12 + 1;
      int v13 = +[NSString stringWithFormat:@"com.apple.nearbyd.finding.service-%d", v12];
      if (*((int *)self + 60) >= 100) {
        *((_DWORD *)self + 60) = 0;
      }
      id v14 = [[NIServerFindingService alloc] initWithLabel:v13];
      [*v9 setObject:v14 forKeyedSubscript:v6];
    }
  }
  else
  {
    objc_super v9 = (id *)((char *)self + 8);
  }
  v15 = [*v9 objectForKeyedSubscript:v6];
  std::mutex::unlock(v7);

  return v15;
}

- (void)logSessionEvent:(id)a3
{
  id v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 176));
  sub_1002E11D4(v4, (void *)self + 2);
  std::mutex::unlock((std::mutex *)((char *)self + 176));
}

- (void)logSessionSummary:(id)a3
{
  id v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 176));
  sub_1002E11D4(v4, (void *)self + 8);
  std::mutex::unlock((std::mutex *)((char *)self + 176));
}

- (id)printableState
{
  uint64_t v3 = objc_opt_new();
  std::mutex::lock((std::mutex *)((char *)self + 112));
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Active sessions (%d)", [*((id *)self + 1) count]);
  [v3 addObject:v4];

  v5 = [*((id *)self + 1) allKeys];
  id v6 = sub_1002E15E0(v5, 10, 1);
  [v3 addObjectsFromArray:v6];

  std::mutex::unlock((std::mutex *)((char *)self + 112));
  id v7 = +[NIServerFindingServiceObserverRelay sharedInstance];
  v8 = [v7 observerTokens];

  v35 = v8;
  objc_super v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Observers (%d)", [v8 count]);
  [v3 addObject:v9];

  unsigned __int8 v10 = sub_1002E15E0(v8, 10, 1);
  [v3 addObjectsFromArray:v10];

  std::mutex::lock((std::mutex *)((char *)self + 176));
  BOOL v11 = +[NSString stringWithFormat:@"Session summaries (max %d)", *((void *)self + 13)];
  [v3 addObject:v11];

  uint64_t v12 = *((void *)self + 9);
  if (*((void *)self + 10) != v12)
  {
    unint64_t v13 = *((void *)self + 12);
    unint64_t v14 = *(void *)(v12 + 8 * (v13 / 0xAA)) + 24 * (v13 % 0xAA);
    unint64_t v15 = *(void *)(v12 + 8 * ((*((void *)self + 13) + v13) / 0xAA)) + 24 * ((*((void *)self + 13) + v13) % 0xAA);
    if (v14 != v15)
    {
      char v16 = 0;
      v17 = (void *)(v12 + 8 * (v13 / 0xAA));
      do
      {
        if (*(char *)(v14 + 23) < 0)
        {
          sub_100002DE4(__p, *(void **)v14, *(void *)(v14 + 8));
        }
        else
        {
          long long v18 = *(_OWORD *)v14;
          uint64_t v37 = *(void *)(v14 + 16);
          *(_OWORD *)__p = v18;
        }
        v19 = (void *)HIBYTE(v37);
        char v20 = HIBYTE(v37);
        if (v37 < 0) {
          v19 = __p[1];
        }
        if (v19)
        {
          [v3 addObject:@"-----"];
          if (v37 >= 0) {
            v21 = __p;
          }
          else {
            v21 = (void **)__p[0];
          }
          v22 = +[NSString stringWithFormat:@"%s", v21];
          [v3 addObject:v22];

          char v16 = 1;
          char v20 = HIBYTE(v37);
        }
        if (v20 < 0) {
          operator delete(__p[0]);
        }
        v14 += 24;
        if (v14 - *v17 == 4080)
        {
          unint64_t v23 = v17[1];
          ++v17;
          unint64_t v14 = v23;
        }
      }
      while (v14 != v15);
      if (v16) {
        [v3 addObject:@"-----"];
      }
    }
  }
  v24 = +[NSString stringWithFormat:@"Session events (max %d)", *((void *)self + 7)];
  [v3 addObject:v24];

  uint64_t v25 = *((void *)self + 3);
  if (*((void *)self + 4) != v25)
  {
    unint64_t v26 = *((void *)self + 6);
    unint64_t v27 = *(void *)(v25 + 8 * (v26 / 0xAA)) + 24 * (v26 % 0xAA);
    unint64_t v28 = *(void *)(v25 + 8 * ((*((void *)self + 7) + v26) / 0xAA)) + 24 * ((*((void *)self + 7) + v26) % 0xAA);
    if (v27 != v28)
    {
      v29 = (void *)(v25 + 8 * (v26 / 0xAA));
      do
      {
        if (*(char *)(v27 + 23) < 0)
        {
          sub_100002DE4(__p, *(void **)v27, *(void *)(v27 + 8));
        }
        else
        {
          long long v30 = *(_OWORD *)v27;
          uint64_t v37 = *(void *)(v27 + 16);
          *(_OWORD *)__p = v30;
        }
        if (SHIBYTE(v37) < 0)
        {
          if (!__p[1]) {
            goto LABEL_33;
          }
          v31 = (void **)__p[0];
        }
        else
        {
          if (!HIBYTE(v37)) {
            goto LABEL_34;
          }
          v31 = __p;
        }
        v32 = +[NSString stringWithFormat:@"    %s", v31];
        [v3 addObject:v32];

        if (SHIBYTE(v37) < 0) {
LABEL_33:
        }
          operator delete(__p[0]);
LABEL_34:
        v27 += 24;
        if (v27 - *v29 == 4080)
        {
          unint64_t v33 = v29[1];
          ++v29;
          unint64_t v27 = v33;
        }
      }
      while (v27 != v28);
    }
  }
  std::mutex::unlock((std::mutex *)((char *)self + 176));

  return v3;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 176));
  std::mutex::~mutex((std::mutex *)((char *)self + 112));
  sub_1001EF240((void *)self + 8);
  sub_1001EF240((void *)self + 2);

  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((void *)self + 14) = 850045863;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 850045863;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *((void *)self + 29) = 0;
  return self;
}

@end