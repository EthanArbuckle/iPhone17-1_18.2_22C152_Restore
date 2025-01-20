@interface NIServerSystemConfigurator
+ (id)sharedInstance;
- (id).cxx_construct;
- (id)_initInternal;
- (id)_internalPrintableState;
- (id)printableState;
- (void)_relayBlockToClients:(id)a3;
- (void)_updateAggregatedClientInfo;
- (void)activate;
- (void)addClient:(id)a3 identifier:(id)a4;
- (void)clientWithIdentifier:(id)a3 notifiedPassiveAccessIntent:(unsigned int)a4;
- (void)clientWithIdentifier:(id)a3 notifiedResourceUsageLimitExceeded:(BOOL)a4 forSessionConfigurationType:(Class)a5;
- (void)clientWithIdentifier:(id)a3 requestedPrewarmUWB:(BOOL)a4 prewarmSecureElementChannel:(BOOL)a5;
- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4;
- (void)removeClientWithIdentifier:(id)a3;
@end

@implementation NIServerSystemConfigurator

+ (id)sharedInstance
{
  if (qword_1008A6E00 != -1) {
    dispatch_once(&qword_1008A6E00, &stru_10085CCC0);
  }
  v2 = (void *)qword_1008A6DF8;

  return v2;
}

- (id)_initInternal
{
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#configurator,_initInternal", buf, 2u);
  }
  v12.receiver = self;
  v12.super_class = (Class)NIServerSystemConfigurator;
  v4 = [(NIServerSystemConfigurator *)&v12 init];
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.nearbyd.system.configurator", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    v8 = v4->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100285B78;
    block[3] = &unk_1008473B0;
    v11 = v4;
    dispatch_sync(v8, block);
  }
  return v4;
}

- (void)activate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100285DA4;
  block[3] = &unk_1008473B0;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)addClient:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100285FBC;
  block[3] = &unk_100855EB0;
  void block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)removeClientWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100286280;
  v7[3] = &unk_100846588;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

- (void)clientWithIdentifier:(id)a3 requestedPrewarmUWB:(BOOL)a4 prewarmSecureElementChannel:(BOOL)a5
{
  id v8 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100286488;
  block[3] = &unk_10085A510;
  void block[4] = self;
  id v12 = v8;
  BOOL v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)clientWithIdentifier:(id)a3 notifiedResourceUsageLimitExceeded:(BOOL)a4 forSessionConfigurationType:(Class)a5
{
  id v8 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002867E4;
  v11[3] = &unk_10085CCE8;
  v11[4] = self;
  id v12 = v8;
  Class v13 = a5;
  BOOL v14 = a4;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)queue, v11);
}

- (void)clientWithIdentifier:(id)a3 notifiedPassiveAccessIntent:(unsigned int)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100286BB0;
  block[3] = &unk_10085B8F8;
  void block[4] = self;
  id v10 = v6;
  unsigned int v11 = a4;
  id v8 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (id)printableState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100286ED0;
  id v10 = sub_100286EE0;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100286EE8;
  v5[3] = &unk_100856C00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_internalPrintableState
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100286ED0;
  v18 = sub_100286EE0;
  id v19 = (id)objc_opt_new();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = (void *)v15[5];
  BOOL activated = self->_activated;
  uint64_t v6 = [(NISystemState *)self->_systemState descriptionInternal];
  id v7 = +[NSString stringWithFormat:@"Activated: %d. System state: %@", activated, v6];
  [v4 addObject:v7];

  uint64_t v8 = (void *)v15[5];
  id v9 = +[NSString stringWithFormat:@"Aggregated info from %d clients: %@", [(NSMutableDictionary *)self->_clientInfo count], self->_aggregatedClientInfo];
  [v8 addObject:v9];

  clientInfo = self->_clientInfo;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100287144;
  v13[3] = &unk_10085CD10;
  v13[4] = &v14;
  [(NSMutableDictionary *)clientInfo enumerateKeysAndObjectsUsingBlock:v13];
  id v11 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (void)_updateAggregatedClientInfo
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = [(ConfiguratorClientInfo *)self->_aggregatedClientInfo copy];
  id v4 = (ConfiguratorClientInfo *)objc_opt_new();
  aggregatedClientInfo = self->_aggregatedClientInfo;
  self->_aggregatedClientInfo = v4;

  clientInfo = self->_clientInfo;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1002876D0;
  v30[3] = &unk_10085CD38;
  v30[4] = self;
  [(NSMutableDictionary *)clientInfo enumerateKeysAndObjectsUsingBlock:v30];
  id v7 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = self->_aggregatedClientInfo;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#configurator,Aggregated info - new: %@", (uint8_t *)&buf, 0xCu);
  }
  id v9 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#configurator,Aggregated info - old: %@", (uint8_t *)&buf, 0xCu);
  }
  unsigned int v10 = [(NSMutableDictionary *)self->_clientInfo count];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  id v11 = self->_clientInfo;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1002876DC;
  v28[3] = &unk_10085CD60;
  v28[4] = &buf;
  unsigned int v29 = v10;
  [(NSMutableDictionary *)v11 enumerateKeysAndObjectsUsingBlock:v28];
  if (+[NIPlatformInfo supportsUWB])
  {
    [(ConfiguratorClientInfo *)self->_aggregatedClientInfo prewarmUWB];
    [v3 prewarmUWB];
  }
  if (+[NIPlatformInfo supportsUWB]
    && [(ConfiguratorClientInfo *)self->_aggregatedClientInfo prewarmSecureElementChannel]
    && ([v3 prewarmSecureElementChannel] & 1) == 0)
  {
    unint64_t v12 = [(NISystemState *)self->_systemState uwbPreciseDistanceAvailability];
    Class v13 = qword_1008ABDE0;
    BOOL v14 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#configurator,Prewarm UWB-SE secure channel will be deferred until UWB is available", v26, 2u);
      }
    }
    else
    {
      if (v14)
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#configurator,Prewarming UWB-SE secure channel...", v26, 2u);
      }
      v15 = sub_1002F6464();
      int v16 = sub_1002F66C8((uint64_t)v15);
      v17 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        sub_100333FC8(v16, v26);
        v18 = v27 >= 0 ? v26 : *(uint8_t **)v26;
        *(_DWORD *)v31 = 136315138;
        v32 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#configurator,Prewarming UWB-SE secure channel... DONE. Status: %s", v31, 0xCu);
        if (v27 < 0) {
          operator delete(*(void **)v26);
        }
      }
    }
  }
  unsigned int v19 = [(ConfiguratorClientInfo *)self->_aggregatedClientInfo carKeyRangingLimitExceeded];
  if (v19 != [v3 carKeyRangingLimitExceeded])
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1002877DC;
    v25[3] = &unk_10085CD88;
    v25[4] = self;
    [(NIServerSystemConfigurator *)self _relayBlockToClients:v25];
  }
  unsigned int v20 = [(ConfiguratorClientInfo *)self->_aggregatedClientInfo acwgRangingLimitExceeded];
  if (v20 != [v3 acwgRangingLimitExceeded])
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100287860;
    v24[3] = &unk_10085CD88;
    v24[4] = self;
    [(NIServerSystemConfigurator *)self _relayBlockToClients:v24];
  }
  unsigned int v21 = [(ConfiguratorClientInfo *)self->_aggregatedClientInfo passiveAccessIntent];
  if (v21 != [v3 passiveAccessIntent])
  {
    v22 = sub_1002F6464();
    sub_1002F66D8((uint64_t)v22, [(ConfiguratorClientInfo *)self->_aggregatedClientInfo passiveAccessIntent]);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1002878E4;
    v23[3] = &unk_10085CD88;
    v23[4] = self;
    [(NIServerSystemConfigurator *)self _relayBlockToClients:v23];
  }
  _Block_object_dispose(&buf, 8);
}

- (void)_relayBlockToClients:(id)a3
{
  id v7 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = [(NSMapTable *)self->_clients keyEnumerator];
  while (1)
  {
    v5 = [v4 nextObject];
    if (!v5) {
      break;
    }
    uint64_t v6 = [(NSMapTable *)self->_clients objectForKey:v5];
    if (v6) {
      v7[2](v7, v6);
    }
  }
}

- (void)rangingServiceDidUpdateState:(int)a3 cause:(int)a4
{
  id v7 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    sub_100004950(v18, off_10085CE88[a3]);
    int v8 = v19;
    id v9 = (void **)v18[0];
    sub_100004950(__p, off_10085CEB0[a4]);
    unsigned int v10 = v18;
    if (v8 < 0) {
      unsigned int v10 = v9;
    }
    if (v17 >= 0) {
      id v11 = __p;
    }
    else {
      id v11 = (void **)__p[0];
    }
    *(_DWORD *)long long buf = 136315394;
    unsigned int v21 = v10;
    __int16 v22 = 2080;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#configurator,Ranging service updated state: %s. Cause: %s", buf, 0x16u);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    if (v19 < 0) {
      operator delete(v18[0]);
    }
  }

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100287C20;
  v13[3] = &unk_100855ED8;
  v13[4] = self;
  int v14 = a3;
  int v15 = a4;
  dispatch_async((dispatch_queue_t)queue, v13);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemState, 0);
  cntrl = (std::__shared_weak_count *)self->_uwbSystemListener.__cntrl_;
  if (cntrl) {
    sub_10001A970(cntrl);
  }
  objc_storeStrong((id *)&self->_aggregatedClientInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clients, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end