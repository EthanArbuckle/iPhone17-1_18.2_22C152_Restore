@interface EPMassUnpairer
- (BOOL)finished;
- (EPMassUnpairer)initWithDelegate:(id)a3 UUIDs:(id)a4;
- (NSSet)requestedUUIDs;
- (id)initBase;
- (void)dealloc;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)setTimerDuration:(double)a3 withBlock:(id)a4;
- (void)update;
@end

@implementation EPMassUnpairer

- (void)setTimerDuration:(double)a3 withBlock:(id)a4
{
  id v6 = a4;
  currentTimer = self->_currentTimer;
  if (currentTimer)
  {
    dispatch_source_cancel(currentTimer);
    v8 = self->_currentTimer;
    self->_currentTimer = 0;
  }
  if (v6)
  {
    v9 = +[EPFactory queue];
    v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v9);

    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10009AB54;
    v14[3] = &unk_100166210;
    v14[4] = self;
    id v15 = v6;
    dispatch_source_set_event_handler(v10, v14);
    dispatch_resume(v10);
    v12 = self->_currentTimer;
    self->_currentTimer = (OS_dispatch_source *)v10;
    v13 = v10;
  }
}

- (id)initBase
{
  v13.receiver = self;
  v13.super_class = (Class)EPMassUnpairer;
  v2 = [(EPMassUnpairer *)&v13 init];
  if (v2)
  {
    v3 = sub_1000A3C58();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      v5 = sub_1000A3C58();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = (objc_class *)objc_opt_class();
        v7 = NSStringFromClass(v6);
        *(_DWORD *)buf = 138412546;
        id v15 = v7;
        __int16 v16 = 2048;
        v17 = v2;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "init %@[%p]", buf, 0x16u);
      }
    }
    uint64_t v8 = +[NSMutableArray array];
    peersToUnpair = v2->_peersToUnpair;
    v2->_peersToUnpair = (NSMutableArray *)v8;

    uint64_t v10 = +[NSMutableSet set];
    devicesUnpaired = v2->_devicesUnpaired;
    v2->_devicesUnpaired = (NSMutableSet *)v10;
  }
  return v2;
}

- (void)dealloc
{
  v3 = sub_1000A3C58();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = sub_1000A3C58();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = v7;
      __int16 v11 = 2048;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "dealloc %@[%p]", buf, 0x16u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)EPMassUnpairer;
  [(EPMassUnpairer *)&v8 dealloc];
}

- (EPMassUnpairer)initWithDelegate:(id)a3 UUIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(EPMassUnpairer *)self initBase];
  v9 = (EPMassUnpairer *)v8;
  if (v8)
  {
    objc_storeWeak(v8 + 5, v6);
    objc_storeStrong((id *)&v9->_requestedUUIDs, a4);
    uint64_t v10 = +[EPFactory sharedFactory];
    __int16 v11 = [v10 agentManager];
    v12 = (EPPairingAgent *)[v11 newAgentWithDelegate:v9 fromCentral:1];
    agent = v9->_agent;
    v9->_agent = v12;

    objc_storeStrong((id *)&v9->me, v9);
    objc_initWeak(&location, v9);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10009AFD8;
    v18[3] = &unk_100165E68;
    objc_copyWeak(&v19, &location);
    [(EPMassUnpairer *)v9 setTimerDuration:v18 withBlock:2.0];
    v14 = +[EPFactory queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009B1BC;
    block[3] = &unk_1001655F8;
    v17 = v9;
    dispatch_async(v14, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)update
{
  agent = self->_agent;
  if (!agent) {
    goto LABEL_44;
  }
  if ((id)[(EPResource *)agent availability] != (id)1)
  {
    [(NSMutableArray *)self->_peersToUnpair removeAllObjects];
    char v46 = 0;
    uint64_t v47 = 32;
LABEL_43:
    *((unsigned char *)&self->super.isa + v47) = v46;
    goto LABEL_44;
  }
  if (self->_unpairing) {
    goto LABEL_48;
  }
  self->_unpairing = 1;
  BOOL v4 = sub_1000A3BC0();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    id v6 = sub_1000A3BC0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Calling CBPairingAgent retrievePairedPeers", buf, 2u);
    }
  }
  id v7 = [(EPPairingAgent *)self->_agent agent];
  objc_super v8 = [v7 retrievePairedPeers];
  id v9 = [v8 mutableCopy];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v55;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        requestedUUIDs = self->_requestedUUIDs;
        if (requestedUUIDs)
        {
          v17 = [*(id *)(*((void *)&v54 + 1) + 8 * i) identifier];
          unsigned int v18 = [(NSSet *)requestedUUIDs containsObject:v17];

          if (!v18) {
            continue;
          }
        }
        [(NSMutableArray *)self->_peersToUnpair addObject:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v12);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v19 = self->_peersToUnpair;
  id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v20)
  {
    id v22 = v20;
    uint64_t v23 = *(void *)v51;
    *(void *)&long long v21 = 138412290;
    long long v49 = v21;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v51 != v23) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
        v26 = sub_1000A3BC0();
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

        if (v27)
        {
          v28 = sub_1000A3BC0();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = [v25 identifier];
            v30 = [v29 UUIDString];
            *(_DWORD *)buf = v49;
            v59 = v30;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Calling CBPairingAgent unpairPeer: %@", buf, 0xCu);
          }
        }
        v31 = [(EPPairingAgent *)self->_agent agent];
        [v31 unpairPeer:v25];
      }
      id v22 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v22);
  }

  if (self->_unpairing)
  {
LABEL_48:
    if (![(NSMutableArray *)self->_peersToUnpair count])
    {
      [(EPMassUnpairer *)self setTimerDuration:0 withBlock:0.0];
      v32 = sub_1000A3BC0();
      BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);

      if (v33)
      {
        v34 = sub_1000A3BC0();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "All peers unpaired!", buf, 2u);
        }
      }
      v35 = self->_agent;
      self->_agent = 0;

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v37 = objc_opt_respondsToSelector();

      if (v37)
      {
        v38 = sub_1000A3BC0();
        BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);

        if (v39)
        {
          v40 = sub_1000A3BC0();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            id v41 = objc_loadWeakRetained((id *)&self->_delegate);
            v42 = (objc_class *)objc_opt_class();
            v43 = NSStringFromClass(v42);
            id v44 = objc_loadWeakRetained((id *)&self->_delegate);
            *(_DWORD *)buf = 138412546;
            v59 = v43;
            __int16 v60 = 2048;
            id v61 = v44;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Calling unpairerDidFinishUnpairing: on %@[%p]", buf, 0x16u);
          }
        }
        id v45 = objc_loadWeakRetained((id *)&self->_delegate);
        [v45 unpairer:self didFinishUnpairingDevices:self->_devicesUnpaired];
      }
      char v46 = 1;
      uint64_t v47 = 33;
      goto LABEL_43;
    }
  }
LABEL_44:
  if (self->_finishedUnpairing)
  {
    me = self->me;
    self->me = 0;
  }
}

- (BOOL)finished
{
  return self->_agent == 0;
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v5 = a4;
  id v6 = sub_1000A3BC0();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    objc_super v8 = sub_1000A3BC0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v5 identifier];
      id v10 = [v9 UUIDString];
      int v13 = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CBPairingAgentDelegate pairingAgent:peerDidUnpair %@", (uint8_t *)&v13, 0xCu);
    }
  }
  [(NSMutableArray *)self->_peersToUnpair removeObject:v5];
  devicesUnpaired = self->_devicesUnpaired;
  id v12 = [v5 identifier];
  [(NSMutableSet *)devicesUnpaired addObject:v12];

  [(EPMassUnpairer *)self update];
}

- (NSSet)requestedUUIDs
{
  return self->_requestedUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedUUIDs, 0);
  objc_storeStrong((id *)&self->me, 0);
  objc_storeStrong((id *)&self->_currentTimer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_peersToUnpair, 0);
  objc_storeStrong((id *)&self->_devicesUnpaired, 0);

  objc_storeStrong((id *)&self->_agent, 0);
}

@end