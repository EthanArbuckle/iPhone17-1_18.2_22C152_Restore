@interface TVRDIRSessionManager
- (BOOL)hasStarted;
- (IRServiceToken)serviceToken;
- (IRSession)irSession;
- (NSArray)suggestedDevices;
- (NSMutableDictionary)identifierToCandidateMap;
- (NSMutableDictionary)identifierToDeviceMap;
- (TVRDIRSessionManager)init;
- (TVRXDeviceQuery)query;
- (id)_candidateForDevice:(id)a3;
- (id)filteredDeviceListHandler;
- (int64_t)_deviceClassificationFromIRClassification:(int64_t)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_donateEventWithEventType:(int64_t)a3 forDevice:(id)a4;
- (void)_fetchServiceTokenWithCompletionHandler:(id)a3;
- (void)_invalidate;
- (void)_restartIRSession;
- (void)_setupSession;
- (void)didInteractWithDevice:(id)a3;
- (void)invalidate;
- (void)pause;
- (void)processNewDevices:(id)a3;
- (void)removeDevice:(id)a3;
- (void)requestCurrentRecommendedDevices;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateContext:(id)a4;
- (void)setFilteredDeviceListHandler:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setIdentifierToCandidateMap:(id)a3;
- (void)setIdentifierToDeviceMap:(id)a3;
- (void)setIrSession:(id)a3;
- (void)setQuery:(id)a3;
- (void)setServiceToken:(id)a3;
- (void)setSuggestedDevices:(id)a3;
- (void)updateDevice:(id)a3 withConnectionContext:(int64_t)a4;
@end

@implementation TVRDIRSessionManager

- (TVRDIRSessionManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)TVRDIRSessionManager;
  v2 = [(TVRDIRSessionManager *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(TVRDIRSessionManager *)v2 _setupSession];
    uint64_t v4 = +[NSMutableDictionary dictionary];
    identifierToCandidateMap = v3->_identifierToCandidateMap;
    v3->_identifierToCandidateMap = (NSMutableDictionary *)v4;

    uint64_t v6 = +[NSMutableDictionary dictionary];
    identifierToDeviceMap = v3->_identifierToDeviceMap;
    v3->_identifierToDeviceMap = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (void)_setupSession
{
  if (!self->_irSession)
  {
    v3 = (IRSession *)objc_alloc_init((Class)IRSession);
    irSession = self->_irSession;
    self->_irSession = v3;

    v5 = self->_irSession;
    [(IRSession *)v5 setDelegate:self];
  }
}

- (void)_fetchServiceTokenWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  serviceToken = self->_serviceToken;
  if (serviceToken)
  {
    (*((void (**)(id, IRServiceToken *, void))v4 + 2))(v4, serviceToken, 0);
  }
  else
  {
    v7 = +[NSUserDefaults standardUserDefaults];
    v8 = [v7 dataForKey:@"irServiceToken"];
    if (v8)
    {
      id v19 = 0;
      objc_super v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v19];
      id v10 = v19;
      v11 = self->_serviceToken;
      self->_serviceToken = v9;

      v12 = _TVRDIRLog();
      v13 = v12;
      if (v10)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[TVRDIRSessionManager _fetchServiceTokenWithCompletionHandler:]();
        }

        ((void (**)(void, void, id))v5)[2](v5, 0, v10);
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v14 = self->_serviceToken;
          *(_DWORD *)buf = 138412290;
          v21 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Found token %@", buf, 0xCu);
        }

        v15 = [(TVRDIRSessionManager *)self serviceToken];
        ((void (**)(void, void *, void))v5)[2](v5, v15, 0);
      }
    }
    else
    {
      id v10 = [objc_alloc((Class)IRServiceParameters) initWithServicePackage:1];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke;
      v16[3] = &unk_10001C670;
      v18 = v5;
      id v17 = v7;
      +[IRSession createServiceWithParameters:v10 reply:v16];
    }
  }
}

void __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_10001C648;
  id v9 = a3;
  id v12 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = *(id *)(a1 + 32);
  id v6 = v5;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

void __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    v3 = _TVRDIRLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke_2_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else if (*(void *)(a1 + 40))
  {
    id v10 = _TVRDIRLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Obtained new token %@", buf, 0xCu);
    }

    uint64_t v12 = *(void *)(a1 + 40);
    id v16 = 0;
    v13 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v16];
    id v14 = v16;
    if (v14)
    {
      v15 = _TVRDIRLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke_2_cold_1();
      }
    }
    else
    {
      [*(id *)(a1 + 48) setObject:v13 forKey:@"irServiceToken"];
      v15 = _TVRDIRLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Stored token in user defaults", buf, 2u);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)pause
{
  v3 = [(TVRDIRSessionManager *)self irSession];
  if (v3)
  {
    unsigned int v4 = [(TVRDIRSessionManager *)self hasStarted];

    if (v4)
    {
      uint64_t v5 = _TVRDIRLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [(TVRDIRSessionManager *)self irSession];
        *(_DWORD *)buf = 138543362;
        id v10 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Pausing %{public}@", buf, 0xCu);
      }
      objc_initWeak((id *)buf, self);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = __29__TVRDIRSessionManager_pause__block_invoke;
      v7[3] = &unk_10001C698;
      objc_copyWeak(&v8, (id *)buf);
      [(TVRDIRSessionManager *)self _fetchServiceTokenWithCompletionHandler:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __29__TVRDIRSessionManager_pause__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    WeakRetained = _TVRDIRLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      __29__TVRDIRSessionManager_pause__block_invoke_cold_1();
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v8 = [objc_alloc((Class)IRConfiguration) initWithServiceToken:v5];
      [v8 setMode:0];
      uint64_t v9 = [WeakRetained irSession];
      [v9 runWithConfiguration:v8];

      id v10 = _TVRDIRLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updated config mode to paused", v11, 2u);
      }
    }
  }
}

- (void)invalidate
{
  v3 = _TVRDIRLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(TVRDIRSessionManager *)self irSession];
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [(TVRDIRSessionManager *)self _invalidate];
}

- (id)_candidateForDevice:(id)a3
{
  id v4 = a3;
  int v5 = [v4 identifier];
  id v6 = [(TVRDIRSessionManager *)self identifierToCandidateMap];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (!v7)
  {
    id v7 = [objc_alloc((Class)IRCandidate) initWithCandidateIdentifier:v5];
    id v8 = objc_alloc_init((Class)IRNode);
    uint64_t v9 = [v4 alternateIdentifiers];
    id v10 = [v9 objectForKeyedSubscript:TVRCAirplayIDKey];
    [v8 setAvOutpuDeviceIdentifier:v10];

    uint64_t v11 = [v4 idsIdentifier];
    [v8 setIdsIdentifier:v11];

    if ([v4 connectionType] == (id)1)
    {
      uint64_t v12 = [v4 identifier];
      [v8 setRapportIdentifier:v12];
    }
    v13 = +[NSSet setWithObject:v8];
    [v7 updateNodes:v13];

    id v14 = [(TVRDIRSessionManager *)self identifierToCandidateMap];
    [v14 setObject:v7 forKeyedSubscript:v5];
  }

  return v7;
}

- (void)processNewDevices:(id)a3
{
  id v4 = a3;
  int v5 = [(TVRDIRSessionManager *)self identifierToDeviceMap];
  id v6 = [v5 allValues];
  uint64_t v7 = +[NSSet setWithArray:v6];

  v36 = v4;
  id v8 = [v4 mutableCopy];
  v35 = (void *)v7;
  [v8 minusSet:v7];
  uint64_t v9 = _TVRDIRLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New devices %@", buf, 0xCu);
  }

  id v10 = +[NSMutableSet set];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v17 = [(TVRDIRSessionManager *)self _candidateForDevice:v16];
        [v10 addObject:v17];
        uint64_t v18 = [(TVRDIRSessionManager *)self identifierToDeviceMap];
        id v19 = [v16 identifier];
        [v18 setValue:v16 forKey:v19];
      }
      id v13 = [v11 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v13);
  }

  v20 = _TVRDIRLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v10;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Updating candidates %@", buf, 0xCu);
  }

  v21 = [(TVRDIRSessionManager *)self irSession];
  [v21 updateCandidates:v10];

  id v22 = [v35 mutableCopy];
  [v22 minusSet:v36];
  v23 = _TVRDIRLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Devices to be removed %@", buf, 0xCu);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v24 = v22;
  id v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v38;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        v30 = [(TVRDIRSessionManager *)self _candidateForDevice:v29];
        if (v30)
        {
          v31 = _TVRDIRLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v48 = v30;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Removing candidate %@", buf, 0xCu);
          }

          v32 = [(TVRDIRSessionManager *)self irSession];
          [v32 deleteCandidate:v30];
        }
        v33 = [(TVRDIRSessionManager *)self identifierToDeviceMap];
        v34 = [v29 identifier];
        [v33 removeObjectForKey:v34];
      }
      id v26 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v26);
  }
}

- (void)removeDevice:(id)a3
{
  id v4 = a3;
  int v5 = _TVRDIRLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Delete candidate %@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [(TVRDIRSessionManager *)self _candidateForDevice:v4];
  uint64_t v7 = [(TVRDIRSessionManager *)self irSession];
  [v7 deleteCandidate:v6];

  id v8 = [(TVRDIRSessionManager *)self identifierToCandidateMap];
  uint64_t v9 = [v4 identifier];
  [v8 removeObjectForKey:v9];
}

- (void)updateDevice:(id)a3 withConnectionContext:(int64_t)a4
{
  if (a4 == 2) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2 * (a4 == 3);
  }
  [(TVRDIRSessionManager *)self _donateEventWithEventType:v5 forDevice:a3];
}

- (void)didInteractWithDevice:(id)a3
{
}

- (void)_donateEventWithEventType:(int64_t)a3 forDevice:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)IRAppleTVControlEvent) initWithEventType:a3 eventSubType:0];
  id v8 = [(TVRDIRSessionManager *)self identifierToCandidateMap];
  uint64_t v9 = [v6 identifier];

  int v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    id v11 = IRAppleTVControlEventTypeToString();
    if ([v11 hasPrefix:@"AppleTVControl"])
    {
      uint64_t v12 = [v11 substringFromIndex:14];

      id v11 = (void *)v12;
    }
    id v13 = _TVRDIRLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Donating %@ for %@", (uint8_t *)&v15, 0x16u);
    }

    uint64_t v14 = [(TVRDIRSessionManager *)self irSession];
    [v14 addEvent:v7 forCandidate:v10];
  }
}

- (void)requestCurrentRecommendedDevices
{
  v3 = _TVRDIRLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(TVRDIRSessionManager *)self irSession];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Requesting current context from IRSession: %@", (uint8_t *)&v6, 0xCu);
  }
  uint64_t v5 = [(TVRDIRSessionManager *)self irSession];
  [v5 requestCurrentContext];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if ([(TVRDIRSessionManager *)self hasStarted])
  {
    uint64_t v5 = _TVRDIRLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "IRSession is already active. Setting Configuration mode to OnEvents.", buf, 2u);
    }

    [(TVRDIRSessionManager *)self setSuggestedDevices:0];
    int v6 = [(TVRDIRSessionManager *)self identifierToDeviceMap];
    [v6 removeAllObjects];

    id v7 = [(TVRDIRSessionManager *)self identifierToCandidateMap];
    [v7 removeAllObjects];

    id v8 = v13;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __48__TVRDIRSessionManager__activateWithCompletion___block_invoke;
    v13[3] = &unk_10001C6C0;
    v13[4] = v4;
    uint64_t v9 = &v14;
    objc_copyWeak(&v14, &location);
    [(TVRDIRSessionManager *)self _fetchServiceTokenWithCompletionHandler:v13];
  }
  else
  {
    int v10 = _TVRDIRLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Starting IRSession", buf, 2u);
    }

    [(TVRDIRSessionManager *)self _setupSession];
    id v8 = v11;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __48__TVRDIRSessionManager__activateWithCompletion___block_invoke_18;
    v11[3] = &unk_10001C6C0;
    v11[4] = v4;
    uint64_t v9 = &v12;
    objc_copyWeak(&v12, &location);
    [(TVRDIRSessionManager *)self _fetchServiceTokenWithCompletionHandler:v11];
  }
  objc_destroyWeak(v9);

  objc_destroyWeak(&location);
}

void __48__TVRDIRSessionManager__activateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v7 = [objc_alloc((Class)IRConfiguration) initWithServiceToken:v5];
      [v7 setMode:1];
      id v8 = [WeakRetained irSession];
      [v8 runWithConfiguration:v7];

      uint64_t v9 = _TVRDIRLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updated config mode to OnEvents", v10, 2u);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __48__TVRDIRSessionManager__activateWithCompletion___block_invoke_18(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = [objc_alloc((Class)IRConfiguration) initWithServiceToken:v5];
    [v6 setMode:1];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v9 = [WeakRetained irSession];
      [v9 runWithConfiguration:v6];

      [v8 setHasStarted:1];
      int v10 = _TVRDIRLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = [v8 irSession];
        int v12 = 138412290;
        id v13 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Started %@", (uint8_t *)&v12, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)_invalidate
{
  [(IRSession *)self->_irSession invalidate];
  [(IRSession *)self->_irSession setDelegate:0];
  irSession = self->_irSession;
  self->_irSession = 0;

  serviceToken = self->_serviceToken;
  self->_serviceToken = 0;

  query = self->_query;
  self->_query = 0;

  id filteredDeviceListHandler = self->_filteredDeviceListHandler;
  self->_id filteredDeviceListHandler = 0;

  self->_hasStarted = 0;
  [(NSMutableDictionary *)self->_identifierToCandidateMap removeAllObjects];
  identifierToDeviceMap = self->_identifierToDeviceMap;

  [(NSMutableDictionary *)identifierToDeviceMap removeAllObjects];
}

- (void)_restartIRSession
{
  id v3 = objc_retainBlock(self->_filteredDeviceListHandler);
  [(TVRDIRSessionManager *)self _invalidate];
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __41__TVRDIRSessionManager__restartIRSession__block_invoke;
  v5[3] = &unk_10001C6E8;
  objc_copyWeak(&v7, &location);
  id v4 = v3;
  id v6 = v4;
  [(TVRDIRSessionManager *)self _activateWithCompletion:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __41__TVRDIRSessionManager__restartIRSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = _TVRDIRLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __41__TVRDIRSessionManager__restartIRSession__block_invoke_cold_1();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained setFilteredDeviceListHandler:*(void *)(a1 + 32)];
  }
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = _TVRDIRLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[TVRDIRSessionManager session:didFailWithError:]();
  }

  [(TVRDIRSessionManager *)self _restartIRSession];
}

- (void)session:(id)a3 didUpdateContext:(id)a4
{
  id v5 = a4;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__TVRDIRSessionManager_session_didUpdateContext___block_invoke;
  block[3] = &unk_10001C4E0;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__TVRDIRSessionManager_session_didUpdateContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:IRContextAppleTVControlKey];
    id v4 = _TVRDIRLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __49__TVRDIRSessionManager_session_didUpdateContext___block_invoke_cold_1(v3, v4);
    }

    v32 = +[NSMutableArray array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v28 = v3;
    id obj = [v3 candidateResults];
    id v5 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v34;
      CFStringRef v8 = @"OneTapSuggestion";
      id v29 = WeakRetained;
      do
      {
        id v9 = 0;
        id v30 = v6;
        do
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(obj);
          }
          int v10 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v9);
          id v11 = [v10 candidate];
          int v12 = [WeakRetained identifierToDeviceMap];
          id v13 = [v11 candidateIdentifier];
          id v14 = [v12 objectForKeyedSubscript:v13];

          if (v14)
          {
            [v14 setClassification:[WeakRetained _deviceClassificationFromIRClassification:[v10 classification]]];
            [v10 classification];
            int v15 = IRCandidateClassificationToString();
            if ([v15 isEqualToString:v8])
            {

              int v15 = @"OneTap";
            }
            id v16 = _TVRDIRLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v17 = [v14 name];
              [v14 identifier];
              CFStringRef v18 = v8;
              v20 = uint64_t v19 = v7;
              *(_DWORD *)buf = 138412802;
              long long v38 = v15;
              __int16 v39 = 2112;
              long long v40 = v17;
              __int16 v41 = 2114;
              long long v42 = v20;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Update context: %10@, %22@, %{public}@", buf, 0x20u);

              uint64_t v7 = v19;
              CFStringRef v8 = v18;

              id WeakRetained = v29;
              id v6 = v30;
            }

            if ([v10 classification] == (id)2
              || [v10 classification] == (id)3
              || [v10 classification] == (id)4)
            {
              [v32 addObject:v14];
            }
          }
          else
          {
            int v15 = _TVRDIRLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v38 = v11;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No device found for candidate: %@", buf, 0xCu);
            }
          }

          id v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        id v6 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      }
      while (v6);
    }

    [v32 sortUsingComparator:&__block_literal_global_2];
    [WeakRetained setSuggestedDevices:v32];
    v21 = [WeakRetained suggestedDevices];
    id v22 = [v21 count];

    if (v22)
    {
      v23 = _TVRDIRLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [WeakRetained suggestedDevices];
        *(_DWORD *)buf = 138543362;
        long long v38 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Suggested devices: %{public}@", buf, 0xCu);
      }
    }
    id v25 = [WeakRetained filteredDeviceListHandler];

    if (v25)
    {
      id v26 = [WeakRetained filteredDeviceListHandler];
      uint64_t v27 = [WeakRetained suggestedDevices];
      ((void (**)(void, void *))v26)[2](v26, v27);
    }
  }
}

int64_t __49__TVRDIRSessionManager_session_didUpdateContext___block_invoke_27(id a1, TVRXDevice *a2, TVRXDevice *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([(TVRXDevice *)v4 classification])
  {
    if ([(TVRXDevice *)v5 classification]
      && (id v6 = [(TVRXDevice *)v4 classification],
          (uint64_t)v6 >= (uint64_t)[(TVRXDevice *)v5 classification]))
    {
      id v8 = [(TVRXDevice *)v4 classification];
      int64_t v7 = (uint64_t)v8 > (uint64_t)[(TVRXDevice *)v5 classification];
    }
    else
    {
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

- (int64_t)_deviceClassificationFromIRClassification:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 5;
  }
  else {
    return qword_100014F78[a3];
  }
}

- (IRSession)irSession
{
  return self->_irSession;
}

- (void)setIrSession:(id)a3
{
}

- (NSArray)suggestedDevices
{
  return self->_suggestedDevices;
}

- (void)setSuggestedDevices:(id)a3
{
}

- (id)filteredDeviceListHandler
{
  return self->_filteredDeviceListHandler;
}

- (void)setFilteredDeviceListHandler:(id)a3
{
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (IRServiceToken)serviceToken
{
  return self->_serviceToken;
}

- (void)setServiceToken:(id)a3
{
}

- (TVRXDeviceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSMutableDictionary)identifierToCandidateMap
{
  return self->_identifierToCandidateMap;
}

- (void)setIdentifierToCandidateMap:(id)a3
{
}

- (NSMutableDictionary)identifierToDeviceMap
{
  return self->_identifierToDeviceMap;
}

- (void)setIdentifierToDeviceMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToDeviceMap, 0);
  objc_storeStrong((id *)&self->_identifierToCandidateMap, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_serviceToken, 0);
  objc_storeStrong(&self->_filteredDeviceListHandler, 0);
  objc_storeStrong((id *)&self->_suggestedDevices, 0);

  objc_storeStrong((id *)&self->_irSession, 0);
}

- (void)_fetchServiceTokenWithCompletionHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Failed to unarchive service token %@", v2, v3, v4, v5, v6);
}

void __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Failed to archive service token %@", v2, v3, v4, v5, v6);
}

void __64__TVRDIRSessionManager__fetchServiceTokenWithCompletionHandler___block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __29__TVRDIRSessionManager_pause__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Error fetching service token to update configuration mode: %{public}@", v2, v3, v4, v5, v6);
}

void __41__TVRDIRSessionManager__restartIRSession__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "IRSessionManager activate failed %@", v2, v3, v4, v5, v6);
}

- (void)session:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "IRSession didFailWithError %@", v2, v3, v4, v5, v6);
}

void __49__TVRDIRSessionManager_session_didUpdateContext___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 candidateResults];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Found potential candidates %@", v4, 0xCu);
}

@end