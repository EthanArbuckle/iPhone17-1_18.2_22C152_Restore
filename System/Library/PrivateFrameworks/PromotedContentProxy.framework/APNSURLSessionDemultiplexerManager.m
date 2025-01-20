@interface APNSURLSessionDemultiplexerManager
- (APNSURLSessionDemultiplexerManager)initWithProxySessionConfigProvider:(id)a3;
- (APOrderedMutableDictionary)sessionDemultiplexerForIdentifier;
- (APProxySessionConfigurationProvider)sessionConfigProvider;
- (APUnfairRecursiveLock)lock;
- (NSOperationQueue)sessionSharedDelegateQueue;
- (id)_getSessionDemultiplexerForId:(id)a3 maximumRequestCount:(int64_t)a4;
- (id)sessionDemultiplexerForAdByIdentifier:(id)a3 maximumRequestCount:(int64_t)a4;
- (int64_t)pretapRequestCountForIdentifier:(id)a3;
- (void)_unregisterOldSessionIfRequired;
- (void)_unregisterSessionDemultiplexerWithIdentifier:(id)a3;
- (void)setLock:(id)a3;
- (void)setSessionConfigProvider:(id)a3;
- (void)setSessionDemultiplexerForIdentifier:(id)a3;
- (void)setSessionSharedDelegateQueue:(id)a3;
- (void)unregisterSessionDemultiplexerWithIdentifier:(id)a3;
@end

@implementation APNSURLSessionDemultiplexerManager

- (APNSURLSessionDemultiplexerManager)initWithProxySessionConfigProvider:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)APNSURLSessionDemultiplexerManager;
  v6 = [(APNSURLSessionDemultiplexerManager *)&v20 init];
  if (v6)
  {
    v7 = (APUnfairRecursiveLock *)objc_alloc_init(MEMORY[0x263F20B98]);
    lock = v6->_lock;
    v6->_lock = v7;

    v9 = (APOrderedMutableDictionary *)objc_alloc_init(MEMORY[0x263F20B70]);
    sessionDemultiplexerForIdentifier = v6->_sessionDemultiplexerForIdentifier;
    v6->_sessionDemultiplexerForIdentifier = v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    sessionSharedDelegateQueue = v6->_sessionSharedDelegateQueue;
    v6->_sessionSharedDelegateQueue = v11;

    objc_msgSend_setMaxConcurrentOperationCount_(v6->_sessionSharedDelegateQueue, v13, 1, v14, v15);
    objc_msgSend_setName_(v6->_sessionSharedDelegateQueue, v16, @"com.apple.ap.pc.proxy.session-shared-delegate", v17, v18);
    objc_storeStrong((id *)&v6->_sessionConfigProvider, a3);
  }

  return v6;
}

- (id)sessionDemultiplexerForAdByIdentifier:(id)a3 maximumRequestCount:(int64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    v11 = objc_msgSend_lock(self, v7, v8, v9, v10);
    objc_msgSend_lock(v11, v12, v13, v14, v15);
    uint64_t v18 = objc_msgSend__getSessionDemultiplexerForId_maximumRequestCount_(self, v16, (uint64_t)v6, a4, v17);

    objc_msgSend_unlock(v11, v19, v20, v21, v22);
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)_getSessionDemultiplexerForId:(id)a3 maximumRequestCount:(int64_t)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v11 = objc_msgSend_sessionDemultiplexerForIdentifier(self, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)v6, v13, v14);

  if (v15)
  {
    id v20 = v15;
  }
  else
  {
    uint64_t v21 = objc_msgSend_sessionConfigProvider(self, v16, v17, v18, v19);
    v26 = objc_msgSend_connectProxyConfig(v21, v22, v23, v24, v25);

    v27 = [APNSURLSessionDemultiplexer alloc];
    v32 = objc_msgSend_sessionSharedDelegateQueue(self, v28, v29, v30, v31);
    v34 = objc_msgSend_initWithConfiguration_forIdentifier_withMaximumRequestCount_delegateQueue_(v27, v33, (uint64_t)v26, (uint64_t)v6, a4, v32);

    v39 = objc_msgSend_sessionDemultiplexerForIdentifier(self, v35, v36, v37, v38);
    uint64_t v44 = objc_msgSend_count(v39, v40, v41, v42, v43);

    if (v44 == 49)
    {
      v49 = APLogForCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        int v74 = 134217984;
        uint64_t v75 = 50;
        _os_log_impl(&dword_2397A4000, v49, OS_LOG_TYPE_INFO, "Reached cap %lu of demultiplexer sessions.", (uint8_t *)&v74, 0xCu);
      }
    }
    v50 = objc_msgSend_sessionDemultiplexerForIdentifier(self, v45, v46, v47, v48);
    v55 = objc_msgSend_identifier(v34, v51, v52, v53, v54);
    objc_msgSend_setObject_forKeyedSubscript_(v50, v56, (uint64_t)v34, (uint64_t)v55, v57);

    v58 = APLogForCategory();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      v63 = objc_msgSend_sessionDemultiplexerForIdentifier(self, v59, v60, v61, v62);
      uint64_t v68 = objc_msgSend_count(v63, v64, v65, v66, v67);
      int v74 = 134217984;
      uint64_t v75 = v68;
      _os_log_impl(&dword_2397A4000, v58, OS_LOG_TYPE_DEBUG, "Current demultiplexers count is %lu.", (uint8_t *)&v74, 0xCu);
    }
    objc_msgSend__unregisterOldSessionIfRequired(self, v69, v70, v71, v72);
    id v20 = v34;
  }

  return v20;
}

- (void)_unregisterOldSessionIfRequired
{
  id v6 = objc_msgSend_sessionDemultiplexerForIdentifier(self, a2, v2, v3, v4);
  unint64_t v11 = objc_msgSend_count(v6, v7, v8, v9, v10);

  if (v11 >= 0x33)
  {
    objc_msgSend_sessionDemultiplexerForIdentifier(self, v12, v13, v14, v15);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    id v20 = objc_msgSend_firstKey(v24, v16, v17, v18, v19);
    objc_msgSend__unregisterSessionDemultiplexerWithIdentifier_(self, v21, (uint64_t)v20, v22, v23);
  }
}

- (void)_unregisterSessionDemultiplexerWithIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = objc_msgSend_sessionDemultiplexerForIdentifier(self, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);

  if (v13)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = sub_2397A5F34;
    v18[3] = &unk_264DA2D68;
    v18[4] = self;
    id v19 = v4;
    objc_msgSend_invalidateAndCancelSessionWithCompletionHandler_(v13, v14, (uint64_t)v18, v15, v16);
  }
  else
  {
    uint64_t v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v21 = v4;
      _os_log_impl(&dword_2397A4000, v17, OS_LOG_TYPE_INFO, "Demultiplexer session '%{public}@' was not found in a list of active sessions. Can't invalidate session.", buf, 0xCu);
    }
  }
}

- (void)unregisterSessionDemultiplexerWithIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    objc_msgSend_lock(self, v5, v6, v7, v8);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v20, v9, v10, v11, v12);
    objc_msgSend__unregisterSessionDemultiplexerWithIdentifier_(self, v13, (uint64_t)v4, v14, v15);

    objc_msgSend_unlock(v20, v16, v17, v18, v19);
  }
}

- (int64_t)pretapRequestCountForIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v9 = objc_msgSend_lock(self, v5, v6, v7, v8);
  objc_msgSend_lock(v9, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_sessionDemultiplexerForIdentifier(self, v14, v15, v16, v17);
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)v4, v20, v21);

  objc_msgSend_unlock(v9, v23, v24, v25, v26);
  if (v22) {
    int64_t v31 = objc_msgSend_requestCount(v22, v27, v28, v29, v30);
  }
  else {
    int64_t v31 = 0;
  }

  return v31;
}

- (APOrderedMutableDictionary)sessionDemultiplexerForIdentifier
{
  return self->_sessionDemultiplexerForIdentifier;
}

- (void)setSessionDemultiplexerForIdentifier:(id)a3
{
}

- (NSOperationQueue)sessionSharedDelegateQueue
{
  return self->_sessionSharedDelegateQueue;
}

- (void)setSessionSharedDelegateQueue:(id)a3
{
}

- (APProxySessionConfigurationProvider)sessionConfigProvider
{
  return self->_sessionConfigProvider;
}

- (void)setSessionConfigProvider:(id)a3
{
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_sessionConfigProvider, 0);
  objc_storeStrong((id *)&self->_sessionSharedDelegateQueue, 0);

  objc_storeStrong((id *)&self->_sessionDemultiplexerForIdentifier, 0);
}

@end