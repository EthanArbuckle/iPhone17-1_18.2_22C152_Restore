@interface APNSURLSessionDemultiplexer
- (APNSURLSessionDemultiplexer)initWithConfiguration:(id)a3 forIdentifier:(id)a4 withMaximumRequestCount:(int64_t)a5 delegateQueue:(id)a6;
- (APUnfairLock)lock;
- (BOOL)sessionMarkedInvalid;
- (NSMutableDictionary)taskInfoByTaskIdentifier;
- (NSString)identifier;
- (NSURLSession)session;
- (NSURLSessionConfiguration)configuration;
- (id)dataTaskWithRequest:(id)a3 delegate:(id)a4 modes:(id)a5;
- (id)sessionInvalidated;
- (id)taskInfoForTask:(id)a3;
- (int64_t)maximumRequestCount;
- (int64_t)requestCount;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)dealloc;
- (void)invalidateAndCancelSessionWithCompletionHandler:(id)a3;
- (void)invalidateSession;
- (void)removeTask:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMaximumRequestCount:(int64_t)a3;
- (void)setSession:(id)a3;
- (void)setSessionInvalidated:(id)a3;
- (void)setSessionMarkedInvalid:(BOOL)a3;
- (void)setTaskInfoByTaskIdentifier:(id)a3;
@end

@implementation APNSURLSessionDemultiplexer

- (APNSURLSessionDemultiplexer)initWithConfiguration:(id)a3 forIdentifier:(id)a4 withMaximumRequestCount:(int64_t)a5 delegateQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v38.receiver = self;
  v38.super_class = (Class)APNSURLSessionDemultiplexer;
  id v13 = [(APNSURLSessionDemultiplexer *)&v38 init];
  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x263F20B90]);
    uint64_t v18 = objc_msgSend_initWithOptions_(v14, v15, 1, v16, v17);
    v19 = (void *)*((void *)v13 + 9);
    *((void *)v13 + 9) = v18;

    uint64_t v24 = objc_msgSend_copy(v10, v20, v21, v22, v23);
    v25 = (void *)*((void *)v13 + 5);
    *((void *)v13 + 5) = v24;

    uint64_t v30 = objc_msgSend_copy(v11, v26, v27, v28, v29);
    v31 = (void *)*((void *)v13 + 3);
    *((void *)v13 + 3) = v30;

    id v32 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v33 = (void *)*((void *)v13 + 4);
    *((void *)v13 + 4) = v32;

    atomic_store(0, (unint64_t *)v13 + 1);
    *((unsigned char *)v13 + 16) = 0;
    *((void *)v13 + 7) = a5;
    uint64_t v35 = objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(MEMORY[0x263EFC640], v34, *((void *)v13 + 5), (uint64_t)v13, (uint64_t)v12);
    v36 = (void *)*((void *)v13 + 6);
    *((void *)v13 + 6) = v35;
  }
  return (APNSURLSessionDemultiplexer *)v13;
}

- (void)dealloc
{
  objc_msgSend_invalidateAndCancel(self->_session, a2, v2, v3, v4);
  v6.receiver = self;
  v6.super_class = (Class)APNSURLSessionDemultiplexer;
  [(APNSURLSessionDemultiplexer *)&v6 dealloc];
}

- (int64_t)requestCount
{
  return atomic_load((unint64_t *)&self->_requestCount);
}

- (id)dataTaskWithRequest:(id)a3 delegate:(id)a4 modes:(id)a5
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_msgSend_sessionMarkedInvalid(self, v11, v12, v13, v14))
  {
    v19 = APLogForCategory();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
LABEL_5:
      uint64_t v23 = 0;
LABEL_11:

      goto LABEL_12;
    }
    *(_DWORD *)buf = 136642819;
    v92 = "-[APNSURLSessionDemultiplexer dataTaskWithRequest:delegate:modes:]";
    v20 = "%{sensitive}s -- The current session is already marked for invalidation. No further requests possible.";
    uint64_t v21 = v19;
    uint32_t v22 = 12;
LABEL_4:
    _os_log_impl(&dword_2397A4000, v21, OS_LOG_TYPE_INFO, v20, buf, v22);
    goto LABEL_5;
  }
  if (objc_msgSend_maximumRequestCount(self, v15, v16, v17, v18) < 1
    || (uint64_t v28 = objc_msgSend_requestCount(self, v24, v25, v26, v27),
        v28 < objc_msgSend_maximumRequestCount(self, v29, v30, v31, v32)))
  {
    atomic_fetch_add(&self->_requestCount, 1uLL);
    if (!objc_msgSend_count(v10, v24, v25, v26, v27))
    {
      uint64_t v90 = *MEMORY[0x263EFF478];
      uint64_t v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v33, (uint64_t)&v90, 1, v36);

      id v10 = (id)v37;
    }
    objc_super v38 = objc_msgSend_session(self, v33, v34, v35, v36);
    uint64_t v23 = objc_msgSend_dataTaskWithRequest_(v38, v39, (uint64_t)v8, v40, v41);

    v42 = [APNSURLSessionTaskInfo alloc];
    v19 = objc_msgSend_initWithTask_delegate_modes_(v42, v43, (uint64_t)v23, (uint64_t)v9, (uint64_t)v10);
    v48 = objc_msgSend_lock(self, v44, v45, v46, v47);
    objc_msgSend_lock(v48, v49, v50, v51, v52);
    v57 = objc_msgSend_taskInfoByTaskIdentifier(self, v53, v54, v55, v56);
    v58 = NSNumber;
    uint64_t v63 = objc_msgSend_taskIdentifier(v23, v59, v60, v61, v62);
    v67 = objc_msgSend_numberWithUnsignedInteger_(v58, v64, v63, v65, v66);
    objc_msgSend_setObject_forKeyedSubscript_(v57, v68, (uint64_t)v19, (uint64_t)v67, v69);

    objc_msgSend_unlock(v48, v70, v71, v72, v73);
    goto LABEL_11;
  }
  uint64_t v75 = objc_msgSend_requestCount(self, v24, v25, v26, v27);
  if (v75 == objc_msgSend_maximumRequestCount(self, v76, v77, v78, v79))
  {
    objc_msgSend_invalidateSession(self, v80, v81, v82, v83);
    v19 = APLogForCategory();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      goto LABEL_5;
    }
    uint64_t v88 = objc_msgSend_maximumRequestCount(self, v84, v85, v86, v87);
    identifier = self->_identifier;
    *(_DWORD *)buf = 136643331;
    v92 = "-[APNSURLSessionDemultiplexer dataTaskWithRequest:delegate:modes:]";
    __int16 v93 = 2048;
    uint64_t v94 = v88;
    __int16 v95 = 2112;
    v96 = identifier;
    v20 = "%{sensitive}s -- Maximum request count reached: %ld for creative: %@. Session will be invalidated.";
    uint64_t v21 = v19;
    uint32_t v22 = 32;
    goto LABEL_4;
  }
  uint64_t v23 = 0;
LABEL_12:

  return v23;
}

- (void)removeTask:(id)a3
{
  if (a3)
  {
    objc_super v6 = objc_msgSend_taskInfoForTask_(self, a2, (uint64_t)a3, v3, v4);
    if (v6)
    {
      id v47 = v6;
      id v11 = objc_msgSend_lock(self, v7, v8, v9, v10);
      objc_msgSend_lock(v11, v12, v13, v14, v15);
      v20 = objc_msgSend_taskInfoByTaskIdentifier(self, v16, v17, v18, v19);
      uint64_t v21 = NSNumber;
      uint64_t v26 = objc_msgSend_task(v47, v22, v23, v24, v25);
      uint64_t v31 = objc_msgSend_taskIdentifier(v26, v27, v28, v29, v30);
      uint64_t v35 = objc_msgSend_numberWithUnsignedInteger_(v21, v32, v31, v33, v34);
      objc_msgSend_removeObjectForKey_(v20, v36, (uint64_t)v35, v37, v38);

      objc_msgSend_unlock(v11, v39, v40, v41, v42);
      objc_msgSend_invalidate(v47, v43, v44, v45, v46);

      objc_super v6 = v47;
    }
  }
}

- (void)invalidateAndCancelSessionWithCompletionHandler:(id)a3
{
  uint64_t v24 = (void (**)(void))a3;
  objc_msgSend_setSessionMarkedInvalid_(self, v4, 1, v5, v6);
  id v11 = objc_msgSend_session(self, v7, v8, v9, v10);

  if (v11)
  {
    objc_msgSend_setSessionInvalidated_(self, v12, (uint64_t)v24, v13, v14);
    uint64_t v19 = objc_msgSend_session(self, v15, v16, v17, v18);
    objc_msgSend_invalidateAndCancel(v19, v20, v21, v22, v23);
  }
  else if (v24)
  {
    v24[2]();
  }
}

- (void)invalidateSession
{
  objc_msgSend_setSessionMarkedInvalid_(self, a2, 1, v2, v3);
  objc_msgSend_session(self, v5, v6, v7, v8);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_finishTasksAndInvalidate(v13, v9, v10, v11, v12);
}

- (id)taskInfoForTask:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_lock(self, v5, v6, v7, v8);
  objc_msgSend_lock(v9, v10, v11, v12, v13);
  uint64_t v18 = objc_msgSend_taskInfoByTaskIdentifier(self, v14, v15, v16, v17);
  uint64_t v19 = NSNumber;
  uint64_t v24 = objc_msgSend_taskIdentifier(v4, v20, v21, v22, v23);

  uint64_t v28 = objc_msgSend_numberWithUnsignedInteger_(v19, v25, v24, v26, v27);
  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v18, v29, (uint64_t)v28, v30, v31);

  objc_msgSend_unlock(v9, v33, v34, v35, v36);

  return v32;
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  objc_msgSend_setSession_(self, a2, 0, (uint64_t)a4, v4);
  objc_msgSend_setIdentifier_(self, v6, 0, v7, v8);
  objc_msgSend_setTaskInfoByTaskIdentifier_(self, v9, 0, v10, v11);
  uint64_t v16 = objc_msgSend_sessionInvalidated(self, v12, v13, v14, v15);

  if (v16)
  {
    objc_msgSend_sessionInvalidated(self, v17, v18, v19, v20);
    uint64_t v21 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v21[2]();

    objc_msgSend_setSessionInvalidated_(self, v22, 0, v23, v24);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = objc_msgSend_taskInfoForTask_(self, v14, (uint64_t)v11, v15, v16);
  uint64_t v22 = objc_msgSend_delegate(v17, v18, v19, v20, v21);
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = sub_2397A9A04;
    v27[3] = &unk_264DA2DB0;
    id v28 = v17;
    id v29 = v10;
    id v30 = v11;
    id v31 = v12;
    id v32 = v13;
    objc_msgSend_performBlock_(v28, v24, (uint64_t)v27, v25, v26);
  }
  else
  {
    (*((void (**)(id, uint64_t))v13 + 2))(v13, 1);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_taskInfoForTask_(self, v11, (uint64_t)v9, v12, v13);
  uint64_t v19 = objc_msgSend_delegate(v14, v15, v16, v17, v18);
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_2397A9B90;
    v24[3] = &unk_264DA2DD8;
    id v25 = v14;
    id v26 = v8;
    id v27 = v9;
    id v28 = v10;
    objc_msgSend_performBlock_(v25, v21, (uint64_t)v24, v22, v23);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_taskInfoForTask_(self, v11, (uint64_t)v9, v12, v13);
  uint64_t v19 = objc_msgSend_lock(self, v15, v16, v17, v18);
  objc_msgSend_lock(v19, v20, v21, v22, v23);
  id v28 = objc_msgSend_taskInfoByTaskIdentifier(self, v24, v25, v26, v27);
  id v29 = NSNumber;
  uint64_t v34 = objc_msgSend_task(v14, v30, v31, v32, v33);
  uint64_t v39 = objc_msgSend_taskIdentifier(v34, v35, v36, v37, v38);
  uint64_t v43 = objc_msgSend_numberWithUnsignedInteger_(v29, v40, v39, v41, v42);
  objc_msgSend_removeObjectForKey_(v28, v44, v43, v45, v46);

  objc_msgSend_unlock(v19, v47, v48, v49, v50);
  uint64_t v55 = objc_msgSend_delegate(v14, v51, v52, v53, v54);
  LOBYTE(v43) = objc_opt_respondsToSelector();

  if (v43)
  {
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = sub_2397A9DAC;
    v63[3] = &unk_264DA2DD8;
    id v64 = v14;
    id v65 = v8;
    id v66 = v9;
    id v67 = v10;
    objc_msgSend_performBlockAndWait_(v64, v60, (uint64_t)v63, v61, v62);
  }
  else
  {
    objc_msgSend_invalidate(v14, v56, v57, v58, v59);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  char v20 = objc_msgSend_taskInfoForTask_(self, v17, (uint64_t)v13, v18, v19);
  uint64_t v25 = objc_msgSend_delegate(v20, v21, v22, v23, v24);
  char v26 = objc_opt_respondsToSelector();

  if (v26)
  {
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_2397A9F94;
    v30[3] = &unk_264DA2E00;
    id v31 = v20;
    id v32 = v12;
    id v33 = v13;
    id v34 = v14;
    id v35 = v15;
    id v36 = v16;
    objc_msgSend_performBlock_(v31, v27, (uint64_t)v30, v28, v29);
  }
  else
  {
    (*((void (**)(id, id))v16 + 2))(v16, v15);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, uint64_t, void))a6;
  uint64_t v18 = objc_msgSend_failureResponse(v12, v14, v15, v16, v17);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v24 = objc_msgSend_failureResponse(v12, v20, v21, v22, v23);
    uint64_t v29 = objc_msgSend_statusCode(v24, v25, v26, v27, v28);

    BOOL v30 = v29 != 407;
  }
  else
  {
    BOOL v30 = 1;
  }
  id v31 = objc_msgSend_taskInfoForTask_(self, v20, (uint64_t)v11, v22, v23);
  id v36 = objc_msgSend_delegate(v31, v32, v33, v34, v35);
  char v37 = objc_opt_respondsToSelector();

  if (v30 || (v37 & 1) == 0)
  {
    v13[2](v13, 1, 0);
  }
  else
  {
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = sub_2397AA1D8;
    v41[3] = &unk_264DA2DB0;
    id v42 = v31;
    id v43 = v10;
    id v44 = v11;
    id v45 = v12;
    uint64_t v46 = v13;
    objc_msgSend_performBlock_(v42, v38, (uint64_t)v41, v39, v40);
  }
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableDictionary)taskInfoByTaskIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTaskInfoByTaskIdentifier:(id)a3
{
}

- (NSURLSessionConfiguration)configuration
{
  return (NSURLSessionConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSession:(id)a3
{
}

- (int64_t)maximumRequestCount
{
  return self->_maximumRequestCount;
}

- (void)setMaximumRequestCount:(int64_t)a3
{
  self->_maximumRequestCount = a3;
}

- (id)sessionInvalidated
{
  return self->_sessionInvalidated;
}

- (void)setSessionInvalidated:(id)a3
{
}

- (BOOL)sessionMarkedInvalid
{
  return self->_sessionMarkedInvalid;
}

- (void)setSessionMarkedInvalid:(BOOL)a3
{
  self->_sessionMarkedInvalid = a3;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_sessionInvalidated, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_taskInfoByTaskIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end