@interface PRBeaconRangingClientProxy
- (BOOL)createBeaconListenerJob:(id *)a3;
- (NSDictionary)clientInfo;
- (PRBeaconRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4;
- (id).cxx_construct;
- (unsigned)pointToShareInitiatorServiceId;
- (void)activate;
- (void)clearBeaconAllowlist:(id)a3;
- (void)connectWithClientInfo:(id)a3;
- (void)dealloc;
- (void)didFailWithError:(id)a3;
- (void)didReceiveNewSolutions:(id)a3;
- (void)disablePTSInitiating:(id)a3;
- (void)enablePTSInitiating:(id)a3 reply:(id)a4;
- (void)pushBeaconAllowlist:(id)a3 reply:(id)a4;
- (void)rangingRequestDidUpdateStatus:(unint64_t)a3;
- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4;
- (void)setPointToShareInitiatorServiceId:(unsigned __int16)a3;
- (void)startBeaconing:(int64_t)a3 options:(id)a4 reply:(id)a5;
- (void)stopBeaconing:(int64_t)a3 reply:(id)a4;
- (void)terminate;
@end

@implementation PRBeaconRangingClientProxy

- (PRBeaconRangingClientProxy)initWithConnection:(id)a3 queue:(id)a4
{
  v22 = self;
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PRBeaconRangingClientProxy.mm", 43, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)PRBeaconRangingClientProxy;
  v22 = 0;
  v9 = [(PRBeaconRangingClientProxy *)&v21 init];
  v10 = v9;
  v22 = v9;
  if (v9)
  {
    *((unsigned char *)v9 + 44) = 0;
    v11 = (void *)*((void *)v9 + 4);
    *((void *)v9 + 4) = 0;

    v12 = [[PRNSXPCConnection alloc] initWithConnection:v7];
    v13 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v12;

    sub_10003E3E8((void **)&v22, buf);
    long long v14 = *(_OWORD *)buf;
    memset(buf, 0, sizeof(buf));
    v15 = (std::__shared_weak_count *)*((void *)v22 + 3);
    *((_OWORD *)v22 + 1) = v14;
    if (v15)
    {
      sub_10001A970(v15);
      if (*(void *)&buf[8]) {
        sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
      }
    }
    *((_DWORD *)v22 + 10) = 0;
  }
  v16 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PRBeaconRangingClientProxy init", buf, 2u);
  }
  v17 = v22;

  return v17;
}

- (void)connectWithClientInfo:(id)a3
{
  id v5 = a3;
  v6 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 objectForKey:PRProcessNameKey];
    id v8 = [v5 objectForKey:PRProcessIdentifierKey];
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 1024;
    unsigned int v12 = [v8 intValue];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PRBeaconRanging: XPC connection created. Process name: %@, pid: %d", (uint8_t *)&v9, 0x12u);
  }
  objc_storeStrong((id *)self + 4, a3);
  [(PRBeaconRangingClientProxy *)self activate];
}

- (void)dealloc
{
  if (!*((unsigned char *)self + 44)) {
    [(PRBeaconRangingClientProxy *)self terminate];
  }
  [*((id *)self + 1) invalidate];
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PRBeaconRangingClientProxy dealloc", buf, 2u);
  }
  v4.receiver = self;
  v4.super_class = (Class)PRBeaconRangingClientProxy;
  [(PRBeaconRangingClientProxy *)&v4 dealloc];
}

- (void)activate
{
  v3 = sub_1002F6464();
  sub_10001A8A4(&v6, (void *)(*((void *)self + 2) + 8));
  long long v7 = v6;
  long long v6 = 0uLL;
  sub_1002FA4B8((uint64_t)v3, (unint64_t *)&v7);
  if (*((void *)&v7 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v7 + 1));
  }
  if (*((void *)&v6 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v6 + 1));
  }
  objc_super v4 = sub_1002F6464();
  sub_10001A8A4(&v6, (void *)(*((void *)self + 2) + 8));
  long long v5 = v6;
  if (*((void *)&v6 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v6 + 1) + 16), 1uLL, memory_order_relaxed);
  }
  sub_1002F6B1C((uint64_t)v4, (uint64_t *)&v5);
  if (*((void *)&v5 + 1)) {
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v5 + 1));
  }
  if (*((void *)&v6 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v6 + 1));
  }
}

- (void)terminate
{
  v3 = sub_1002F6464();
  objc_super v4 = (std::__shared_weak_count *)*((void *)self + 3);
  unint64_t v6 = *((void *)self + 2);
  long long v7 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_1002FA594((uint64_t)v3, &v6);
  if (v7) {
    sub_10001A970(v7);
  }
  *((unsigned char *)self + 44) = 1;
  long long v5 = (void *)*((void *)self + 18);
  *((void *)self + 18) = 0;
}

- (void)didFailWithError:(id)a3
{
  id v4 = a3;
  long long v5 = (void *)*((void *)self + 1);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003BE38;
  v7[3] = &unk_100846378;
  id v8 = v4;
  id v6 = v4;
  [v5 actOnRemoteObjectAndScheduleBarrierBlock:v7];
}

- (void)didReceiveNewSolutions:(id)a3
{
  id v19 = a3;
  id v4 = (void *)*((void *)self + 18);
  v26[0] = (char *)self + 144;
  id v5 = v4;
  v26[1] = voucher_adopt();
  if (*((_WORD *)self + 20))
  {
    double v6 = sub_100006C38();
    double v7 = *((double *)self + 6);
    std::mutex::lock((std::mutex *)((char *)self + 80));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = v19;
    id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v9)
    {
      double v10 = v6 - v7;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          *(void *)buf = [v13 mac_addr];
          *(double *)&buf[8] = v10;
          sub_10003E4BC((uint64_t **)self + 7, (unint64_t *)buf, (uint64_t *)buf);
          if (v14)
          {
            v15 = (id)qword_1008ABDE0;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              id v16 = [v13 mac_addr];
              *(_DWORD *)buf = 134283777;
              *(void *)&buf[4] = v16;
              *(_WORD *)&buf[12] = 2050;
              *(double *)&buf[14] = v10;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PtsSession, responder, %{private}llx, latency, %{public}0.3f", buf, 0x16u);
            }
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v9);
    }

    std::mutex::unlock((std::mutex *)((char *)self + 80));
  }
  v17 = (void *)*((void *)self + 1);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003C1A0;
  v20[3] = &unk_100846378;
  id v18 = v19;
  id v21 = v18;
  [v17 actOnRemoteObjectAndScheduleBarrierBlock:v20];

  sub_10001A934((uint64_t)v26);
}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  id v4 = (void *)*((void *)self + 1);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003C2A0;
  v5[3] = &unk_1008463C0;
  v5[4] = a3;
  v5[5] = a4;
  [v4 actOnRemoteObjectAndScheduleBarrierBlock:v5];
}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  id v5 = (char *)self + 144;
  id v4 = (void *)*((void *)self + 18);
  v9[0] = (char *)self + 144;
  id v6 = v4;
  v9[1] = voucher_adopt();
  double v7 = (void *)*((void *)v5 - 17);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10003C3E0;
  v8[3] = &unk_1008463E0;
  v8[4] = a3;
  [v7 actOnRemoteObjectAndScheduleBarrierBlock:v8];
  sub_10001A934((uint64_t)v9);
}

- (void)startBeaconing:(int64_t)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  double v10 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [*((id *)self + 4) objectForKey:PRProcessNameKey];
    unsigned int v12 = [*((id *)self + 4) objectForKey:PRProcessIdentifierKey];
    *(_DWORD *)buf = 138412546;
    id v19 = v11;
    __int16 v20 = 1024;
    unsigned int v21 = [v12 intValue];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PRBeaconRanging: XPC command - startBeaconing. Process name: %@, pid: %d", buf, 0x12u);
  }
  if (a3 == 1)
  {
    [(PRBeaconRangingClientProxy *)self enablePTSInitiating:v8 reply:v9];
    uint64_t v13 = voucher_copy();
    char v14 = (void *)*((void *)self + 18);
    *((void *)self + 18) = v13;
  }
  else
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    CFStringRef v17 = @"Asked to enable unsupported ranging subtype.";
    v15 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    char v14 = PRErrorWithCodeAndUserInfo(100, v15);

    v9[2](v9, 0, v14);
  }
}

- (void)stopBeaconing:(int64_t)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void, void *))a4;
  double v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*((id *)self + 4) objectForKey:PRProcessNameKey];
    id v9 = [*((id *)self + 4) objectForKey:PRProcessIdentifierKey];
    *(_DWORD *)buf = 138412546;
    id v16 = v8;
    __int16 v17 = 1024;
    unsigned int v18 = [v9 intValue];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PRBeaconRanging: XPC command - stopBeaconing. Process name: %@, pid: %d", buf, 0x12u);
  }
  double v10 = (void *)*((void *)self + 18);
  *((void *)self + 18) = 0;

  if (a3 == 1)
  {
    [(PRBeaconRangingClientProxy *)self disablePTSInitiating:v6];
  }
  else
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    CFStringRef v14 = @"Asked to disable unsupported ranging subtype.";
    id v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    unsigned int v12 = PRErrorWithCodeAndUserInfo(100, v11);

    v6[2](v6, 0, v12);
  }
}

- (void)pushBeaconAllowlist:(id)a3 reply:(id)a4
{
  id v36 = a3;
  v35 = (void (**)(id, void, void *))a4;
  id v44 = v35;
  id v6 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [*((id *)self + 4) objectForKey:PRProcessNameKey];
    id v8 = [*((id *)self + 4) objectForKey:PRProcessIdentifierKey];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v8 intValue];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PRBeaconRanging: XPC command - pushBeaconAllowlist. Process name: %@, pid: %d", buf, 0x12u);
  }
  if (![v36 count])
  {
    NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
    CFStringRef v51 = @"Must provide at least one beacon to allowlist.";
    v30 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    v31 = PRErrorWithCodeAndUserInfo(106, v30);
    v35[2](v35, 0, v31);

    goto LABEL_32;
  }
  id v9 = self;
  objc_sync_enter(v9);
  if (!*((_WORD *)v9 + 21))
  {
    double v10 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No beacon listener job defined. Creating.", buf, 2u);
    }
    id v43 = 0;
    unsigned __int8 v11 = [(PRBeaconRangingClientProxy *)v9 createBeaconListenerJob:&v43];
    id v12 = v43;
    NSErrorUserInfoKey v13 = v12;
    if (v11)
    {

      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040E9A4();
    }
    v35[2](v35, 0, v13);

    objc_sync_exit(v9);
LABEL_32:
    v34 = v35;
    goto LABEL_33;
  }
LABEL_9:
  objc_sync_exit(v9);

  CFStringRef v14 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v36;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "PRBeaconClient: allowlist the following devices: %@", buf, 0xCu);
  }
  memset(buf, 0, sizeof(buf));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v15 = v36;
  id v16 = [v15 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v40;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = *(id *)(*((void *)&v39 + 1) + 8 * i);
        __int16 v20 = [v19 btAdvAddress];
        if (!v20
          || ([v19 btAdvAddress],
              unsigned int v21 = objc_claimAutoreleasedReturnValue(),
              BOOL v22 = [v21 length] == (id)6,
              v21,
              v20,
              !v22))
        {
          NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
          CFStringRef v47 = @"Beacon has invalid BT Adv Address.";
          v32 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1, v9);
          v33 = PRErrorWithCodeAndUserInfo(106, v32);
          v35[2](v35, 0, v33);

          goto LABEL_26;
        }
        long long v23 = [v19 btAdvAddress];
        [v23 getBytes:&v37 length:6];

        long long v24 = (char *)&v37 + 1;
        long long v25 = &v38;
        do
        {
          char v26 = *(v24 - 1);
          *(v24 - 1) = *v25;
          *v25-- = v26;
        }
        while (v24++ < v25);
        sub_10003CECC((void **)buf, &v37);
      }
      id v16 = [v15 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  v28 = sub_1002F6464();
  v45[0] = off_100846E38;
  v45[1] = &v44;
  v45[3] = v45;
  sub_1002F8C2C((uint64_t)v28, (uint64_t)buf, (uint64_t)v45);
  sub_10003E780(v45);
  uint64_t v29 = voucher_copy();
  id v15 = (id)*((void *)v9 + 18);
  *((void *)v9 + 18) = v29;
LABEL_26:

  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
  v34 = v44;
LABEL_33:
}

- (void)clearBeaconAllowlist:(id)a3
{
  id v9 = a3;
  id v4 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*((id *)self + 4) objectForKey:PRProcessNameKey];
    id v6 = [*((id *)self + 4) objectForKey:PRProcessIdentifierKey];
    *(_DWORD *)buf = 138412546;
    id v12 = v5;
    __int16 v13 = 1024;
    unsigned int v14 = [v6 intValue];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PRBeaconRanging: XPC command - clearBeaconAllowlist. Process name: %@, pid: %d", buf, 0x12u);
  }
  id v7 = (void *)*((void *)self + 18);
  *((void *)self + 18) = 0;

  id v8 = sub_1002F6464();
  v10[0] = off_100846EC8;
  v10[1] = &v9;
  v10[3] = v10;
  sub_1002F8E80((uint64_t)v8, (uint64_t)v10);
  sub_10003E780(v10);
}

- (void)enablePTSInitiating:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, void, void *))a4;
  id v6 = sub_1002F6464();
  uint64_t v7 = *((void *)v6 + 406);
  id v8 = (std::__shared_weak_count *)*((void *)v6 + 407);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v7)
  {
    NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
    CFStringRef v43 = @"Configuration Manager Error.";
    long long v25 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    char v26 = PRErrorWithCodeAndUserInfo(999, v25);
    v5[2](v5, 0, v26);

    goto LABEL_30;
  }
  __int16 v34 = 0;
  if (!sub_1002CE2DC(v7, &v33, (unsigned __int8 *)&v34, 0))
  {
    NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
    CFStringRef v41 = @"Failed to prepare service request.";
    v27 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    v28 = PRErrorWithCodeAndUserInfo(101, v27);
    v5[2](v5, 0, v28);

    goto LABEL_30;
  }
  sub_10017E730(&v33, (uint64_t)v38);
  id v9 = +[NSUserDefaults standardUserDefaults];
  double v10 = [v9 URLForKey:@"P2SConfigPlistPath"];
  unsigned __int8 v11 = +[NSDictionary dictionaryWithContentsOfURL:v10];

  if (v11)
  {
    id v12 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "============================================", (uint8_t *)&buf, 2u);
    }
    __int16 v13 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = [v11 description];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PRBeaconRangingClientProxy options dict:\n%@", (uint8_t *)&buf, 0xCu);
    }
    id v15 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "============================================", (uint8_t *)&buf, 2u);
    }
    id v32 = 0;
    char v16 = sub_1000105DC(v11, v39, &v32);
    id v17 = v32;
    unsigned int v18 = v17;
    if ((v16 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040E9D8();
      }
      v5[2](v5, 0, v18);

      goto LABEL_29;
    }
  }
  id v19 = sub_1002F6464();
  sub_10001A8A4(&buf, (void *)(*((void *)self + 2) + 8));
  long long v31 = buf;
  if (*((void *)&buf + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&buf + 1) + 16), 1uLL, memory_order_relaxed);
  }
  int v20 = sub_1002F6CB4((uint64_t)v19, (uint64_t *)&v31);
  if (*((void *)&v31 + 1)) {
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v31 + 1));
  }
  if (*((void *)&buf + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&buf + 1));
  }
  if ((v20 & 0xFF0000) != 0)
  {
    *((double *)self + 6) = sub_100006C38();
    unsigned int v21 = (std::mutex *)((char *)self + 80);
    std::mutex::lock((std::mutex *)((char *)self + 80));
    long long v23 = (void *)*((void *)self + 8);
    BOOL v22 = (void *)((char *)self + 64);
    sub_10003E96C((uint64_t)(v22 - 1), v23);
    *(v22 - 1) = v22;
    void *v22 = 0;
    v22[1] = 0;
    std::mutex::unlock(v21);
    *((_WORD *)v22 - 12) = v20;
    v5[2](v5, 1, 0);
    long long v24 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "PtsSession, start", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
    CFStringRef v36 = @"Register for service failed";
    uint64_t v29 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1, (void)v31);
    v30 = PRErrorWithCodeAndUserInfo(101, v29);
    v5[2](v5, 0, v30);
  }
LABEL_29:

LABEL_30:
  if (v8) {
    sub_10001A970(v8);
  }
}

- (void)disablePTSInitiating:(id)a3
{
  id v22 = a3;
  double v4 = sub_100006C38();
  double v5 = *((double *)self + 6);
  std::mutex::lock((std::mutex *)((char *)self + 80));
  double v6 = v4 - v5;
  int v7 = *((_DWORD *)self + 18);
  id v8 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[8] = 2048;
    *(double *)&buf[10] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PtsMetric, session, numOfResponders, %d, sessionDuration, %0.3f", buf, 0x12u);
  }
  long long v31 = _NSConcreteStackBlock;
  uint64_t v32 = 3221225472;
  char v33 = sub_10003DC1C;
  __int16 v34 = &unk_100846E08;
  int v36 = v7;
  double v35 = v6;
  AnalyticsSendEventLazy();
  id v9 = (PRBeaconRangingClientProxy *)*((void *)self + 7);
  if (v9 != (PRBeaconRangingClientProxy *)((char *)self + 64))
  {
    do
    {
      double v10 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *((void *)v9 + 5);
        *(_DWORD *)long long buf = 134218240;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PtsMetric, responderLatency, %0.3f, numOfResponders, %d", buf, 0x12u);
      }
      uint64_t v12 = *((void *)v9 + 5);
      long long v25 = _NSConcreteStackBlock;
      uint64_t v26 = 3221225472;
      v27 = sub_10003DD24;
      v28 = &unk_100846E08;
      uint64_t v29 = v12;
      int v30 = v7;
      AnalyticsSendEventLazy();
      __int16 v13 = (PRBeaconRangingClientProxy *)*((void *)v9 + 1);
      if (v13)
      {
        do
        {
          unsigned int v14 = v13;
          __int16 v13 = *(PRBeaconRangingClientProxy **)v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          unsigned int v14 = (PRBeaconRangingClientProxy *)*((void *)v9 + 2);
          BOOL v15 = *(void *)v14 == (void)v9;
          id v9 = v14;
        }
        while (!v15);
      }
      id v9 = v14;
    }
    while (v14 != (PRBeaconRangingClientProxy *)((char *)self + 64));
  }
  std::mutex::unlock((std::mutex *)((char *)self + 80));
  if (!*((_WORD *)self + 20))
  {
    char v16 = v22;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EA40();
    }
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    CFStringRef v40 = @"Asked to cancel, but no point to share initiator job defined";
    id v19 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    int v20 = PRErrorWithCodeAndUserInfo(999, v19);

    (*((void (**)(id, void, void *))v22 + 2))(v22, 0, v20);
    goto LABEL_25;
  }
  char v16 = v22;
  id v17 = sub_1002F6464();
  sub_10001A8A4(buf, (void *)(*((void *)self + 2) + 8));
  uint64_t v23 = *(void *)buf;
  long long v24 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
  }
  BOOL v18 = sub_1002F7308((uint64_t)v17, &v23, *((unsigned __int16 *)self + 20));
  if (v24) {
    std::__shared_weak_count::__release_weak(v24);
  }
  if (*(void *)&buf[8]) {
    sub_10001A970(*(std::__shared_weak_count **)&buf[8]);
  }
  if (!v18)
  {
    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    CFStringRef v38 = @"Unregistering for service failed";
    int v20 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    unsigned int v21 = PRErrorWithCodeAndUserInfo(999, v20);
    (*((void (**)(id, void, void *))v22 + 2))(v22, 0, v21);

LABEL_25:
    goto LABEL_26;
  }
  *((_WORD *)self + 20) = 0;
  (*((void (**)(id, uint64_t, void))v22 + 2))(v22, 1, 0);
LABEL_26:
}

- (BOOL)createBeaconListenerJob:(id *)a3
{
  double v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PRBeaconRangingClientProxy::createBeaconListenerJob", buf, 2u);
  }
  double v6 = sub_1002F6464();
  uint64_t v7 = *((void *)v6 + 406);
  id v8 = (std::__shared_weak_count *)*((void *)v6 + 407);
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v7)
  {
    if (!a3) {
      goto LABEL_38;
    }
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    CFStringRef v33 = @"Configuration Manager Error.";
    BOOL v18 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    PRErrorWithCodeAndUserInfo(999, v18);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EA74();
    }
LABEL_29:
    LOBYTE(a3) = 0;
    goto LABEL_38;
  }
  __int16 v24 = 0;
  if (!sub_1002CE2DC(v7, &v23, (unsigned __int8 *)&v24, 0))
  {
    if (!a3) {
      goto LABEL_38;
    }
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    CFStringRef v31 = @"Failed to prepare service request.";
    id v19 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    PRErrorWithCodeAndUserInfo(101, v19);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EA74();
    }
    goto LABEL_29;
  }
  sub_10017EB80(&v23, (uint64_t)buf);
  id v9 = +[NSUserDefaults standardUserDefaults];
  double v10 = [v9 URLForKey:@"P2SConfigPlistPath"];
  uint64_t v11 = +[NSDictionary dictionaryWithContentsOfURL:v10];

  if (v11)
  {
    uint64_t v12 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "============================================", (uint8_t *)&v27, 2u);
    }
    __int16 v13 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = [v11 description];
      LODWORD(v27) = 138412290;
      *(void *)((char *)&v27 + 4) = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PRBeaconRangingClientProxy responder options dict:\n%@", (uint8_t *)&v27, 0xCu);
    }
    BOOL v15 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "============================================", (uint8_t *)&v27, 2u);
    }
    if ((sub_1000105DC(v11, v29, a3) & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10040EADC();
      }
LABEL_36:
      LOBYTE(a3) = 0;
      goto LABEL_37;
    }
  }
  char v16 = sub_1002F6464();
  sub_10001A8A4(&v27, (void *)(*((void *)self + 2) + 8));
  long long v22 = v27;
  if (*((void *)&v27 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v27 + 1) + 16), 1uLL, memory_order_relaxed);
  }
  int v17 = sub_1002F6CB4((uint64_t)v16, (uint64_t *)&v22);
  if (*((void *)&v22 + 1)) {
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v22 + 1));
  }
  if (*((void *)&v27 + 1)) {
    sub_10001A970(*((std::__shared_weak_count **)&v27 + 1));
  }
  if ((v17 & 0xFF0000) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10040EAA8();
    }
    if (!a3) {
      goto LABEL_37;
    }
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"Failed to register for job: point to share responder";
    int v20 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    PRErrorWithCodeAndUserInfo(101, v20);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_36;
  }
  *((_WORD *)self + 21) = v17;
  LOBYTE(a3) = 1;
LABEL_37:

LABEL_38:
  if (v8) {
    sub_10001A970(v8);
  }
  return (char)a3;
}

- (NSDictionary)clientInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (unsigned)pointToShareInitiatorServiceId
{
  return *((_WORD *)self + 76);
}

- (void)setPointToShareInitiatorServiceId:(unsigned __int16)a3
{
  *((_WORD *)self + 76) = a3;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 80));
  sub_10003E96C((uint64_t)self + 56, *((void **)self + 8));
  objc_storeStrong((id *)self + 4, 0);
  v3 = (std::__shared_weak_count *)*((void *)self + 3);
  if (v3) {
    sub_10001A970(v3);
  }

  objc_storeStrong((id *)self + 1, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 7) = (char *)self + 64;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 850045863;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  return self;
}

@end