@interface RTPersistenceMirroringRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMirroringRequest:(id)a3;
- (BOOL)isReady;
- (NSCloudKitMirroringRequest)request;
- (NSDate)enqueueDate;
- (NSDate)startDate;
- (NSMutableArray)completionHandlers;
- (NSUUID)identifier;
- (OS_os_transaction)mirroringTransaction;
- (RTPersistenceMirroringPolicy)mirroringPolicy;
- (RTPersistenceMirroringRequest)init;
- (RTPersistenceMirroringRequest)initWithQueue:(id)a3 requestType:(int64_t)a4 mirroringPolicy:(id)a5 affectedStores:(id)a6 options:(id)a7 completionHandler:(id)a8;
- (RTPersistenceMirroringRequestDelegate)delegate;
- (RTPowerAssertion)mirroringAssertion;
- (double)duration;
- (id)description;
- (id)requestTypeToString:(int64_t)a3;
- (int64_t)requestType;
- (unint64_t)attemptCount;
- (unint64_t)hash;
- (unint64_t)maxRetryCount;
- (void)_completeRequestWithError:(id)a3;
- (void)_createMirroringRequestWithRequestType:(int64_t)a3 affectedStores:(id)a4 options:(id)a5;
- (void)_dispatchAllHandlersWithError:(id)a3;
- (void)_handleMirroringRequestResult:(id)a3;
- (void)_prepareMirroringRequestForRetry:(id)a3;
- (void)completeRequestWithError:(id)a3;
- (void)dealloc;
- (void)executeMirroringRequestWithContext:(id)a3;
- (void)handleMirroringRequestResult:(id)a3;
- (void)mergeRequest:(id)a3;
- (void)setAttemptCount:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEnqueueDate:(id)a3;
- (void)setMaxRetryCount:(unint64_t)a3;
- (void)setMirroringAssertion:(id)a3;
- (void)setMirroringPolicy:(id)a3;
- (void)setMirroringTransaction:(id)a3;
- (void)setRequestType:(int64_t)a3;
- (void)setStartDate:(id)a3;
@end

@implementation RTPersistenceMirroringRequest

- (RTPersistenceMirroringRequest)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_requestType_mirroringPolicy_affectedStores_options_completionHandler_);
}

- (RTPersistenceMirroringRequest)initWithQueue:(id)a3 requestType:(int64_t)a4 mirroringPolicy:(id)a5 affectedStores:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!v16)
  {
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
LABEL_12:

      v30 = 0;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: mirroringPolicy";
LABEL_15:
    _os_log_error_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_ERROR, v32, buf, 2u);
    goto LABEL_12;
  }
  if (![v17 count])
  {
    v31 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v32 = "Invalid parameter not satisfying: affectedStores.count >= 1";
    goto LABEL_15;
  }
  v34.receiver = self;
  v34.super_class = (Class)RTPersistenceMirroringRequest;
  v20 = [(RTPersistenceMirroringRequest *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
    identifier = v20->_identifier;
    v20->_identifier = (NSUUID *)v21;

    objc_storeStrong((id *)&v20->_queue, a3);
    uint64_t v23 = objc_opt_new();
    completionHandlers = v20->_completionHandlers;
    v20->_completionHandlers = (NSMutableArray *)v23;

    v20->_requestType = a4;
    v25 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v20->_sid = os_signpost_id_generate(v25);

    [(RTPersistenceMirroringRequest *)v20 _createMirroringRequestWithRequestType:a4 affectedStores:v17 options:v18];
    if (v19 && v20->_request)
    {
      v26 = v20->_completionHandlers;
      v27 = (void *)MEMORY[0x1E016DB00](v19);
      [(NSMutableArray *)v26 addObject:v27];
    }
    uint64_t v28 = [MEMORY[0x1E4F1C9C8] date];
    enqueueDate = v20->_enqueueDate;
    v20->_enqueueDate = (NSDate *)v28;

    objc_storeStrong((id *)&v20->_mirroringPolicy, a5);
  }
  self = v20;
  v30 = self;
LABEL_13:

  return v30;
}

- (void)dealloc
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_completionHandlers count])
  {
    uint64_t v6 = *MEMORY[0x1E4F28568];
    v7[0] = @"Pending mirroring operation failed.";
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:0 userInfo:v3];
    [(RTPersistenceMirroringRequest *)self _dispatchAllHandlersWithError:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)RTPersistenceMirroringRequest;
  [(RTPersistenceMirroringRequest *)&v5 dealloc];
}

- (void)_createMirroringRequestWithRequestType:(int64_t)a3 affectedStores:(id)a4 options:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __95__RTPersistenceMirroringRequest__createMirroringRequestWithRequestType_affectedStores_options___block_invoke;
  id v19 = &unk_1E6B92FD8;
  objc_copyWeak(&v20, &location);
  v10 = (void *)MEMORY[0x1E016DB00](&v16);
  switch(a3)
  {
    case 2:
      id v13 = objc_alloc(MEMORY[0x1E4F1C098]);
      v12 = (NSCloudKitMirroringRequest *)[v13 initWithOptions:v9 completionBlock:v10, v16, v17, v18, v19];
      goto LABEL_7;
    case 1:
      id v14 = objc_alloc(MEMORY[0x1E4F1C070]);
      v12 = (NSCloudKitMirroringRequest *)[v14 initWithOptions:v9 completionBlock:v10, v16, v17, v18, v19];
      goto LABEL_7;
    case 0:
      id v11 = objc_alloc(MEMORY[0x1E4F1C080]);
      v12 = (NSCloudKitMirroringRequest *)[v11 initWithOptions:v9 completionBlock:v10, v16, v17, v18, v19];
LABEL_7:
      request = self->_request;
      self->_request = v12;
      goto LABEL_10;
  }
  request = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(request, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v23 = a3;
    __int16 v24 = 2080;
    v25 = "-[RTPersistenceMirroringRequest _createMirroringRequestWithRequestType:affectedStores:options:]";
    __int16 v26 = 1024;
    int v27 = 113;
    _os_log_error_impl(&dword_1D9BFA000, request, OS_LOG_TYPE_ERROR, "unhandled mirroring request type, %ld (in %s:%d)", buf, 0x1Cu);
  }
LABEL_10:

  [(NSCloudKitMirroringRequest *)self->_request setAffectedStores:v8];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __95__RTPersistenceMirroringRequest__createMirroringRequestWithRequestType_affectedStores_options___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained handleMirroringRequestResult:v5];
  }
}

- (void)_prepareMirroringRequestForRetry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 requestType];
  id v9 = [v4 request];
  uint64_t v6 = [v9 affectedStores];
  v7 = [v4 request];

  id v8 = [v7 options];
  [(RTPersistenceMirroringRequest *)self _createMirroringRequestWithRequestType:v5 affectedStores:v6 options:v8];
}

- (void)handleMirroringRequestResult:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __62__RTPersistenceMirroringRequest_handleMirroringRequestResult___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __62__RTPersistenceMirroringRequest_handleMirroringRequestResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleMirroringRequestResult:*(void *)(a1 + 40)];
}

- (void)_handleMirroringRequestResult:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(NSUUID *)self->_identifier UUIDString];
    v7 = [v4 request];
    id v8 = [v7 requestIdentifier];
    id v9 = [v8 UUIDString];
    *(_DWORD *)buf = 138412802;
    *(void *)v57 = v6;
    *(_WORD *)&v57[8] = 2112;
    v58 = v9;
    __int16 v59 = 1024;
    int v60 = [v4 madeChanges];
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "request identifier, %@, CD request identifier, %@, made changes, %d", buf, 0x1Cu);
  }
  v10 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [(NSUUID *)self->_identifier UUIDString];
    v12 = [v4 request];
    id v13 = [v12 requestIdentifier];
    int v14 = [v4 success];
    id v15 = [v4 error];
    *(_DWORD *)buf = 138413058;
    *(void *)v57 = v11;
    *(_WORD *)&v57[8] = 2112;
    v58 = v13;
    __int16 v59 = 1024;
    int v60 = v14;
    __int16 v61 = 2112;
    v62 = v15;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "request identifier, %@, CD request identifier, %@, success, %d, error, %@", buf, 0x26u);
  }
  uint64_t v16 = [v4 error];

  if (v16)
  {
    uint64_t v17 = [v4 error];
    id v18 = [v17 userInfo];
    uint64_t v19 = *MEMORY[0x1E4F28A50];
    id v20 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    int v21 = CKCanRetryForError();
    v22 = [v4 error];
    uint64_t v23 = [v22 code];

    if ((v21 & 1) != 0 || v23 == 134409)
    {
      v35 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v57 = v21;
        *(_WORD *)&v57[4] = 1024;
        *(_DWORD *)&v57[6] = v23 == 134409;
        _os_log_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_INFO, "shouldRetryFromCKError, %d, mirroringDelegateRecoveredFromError, %d", buf, 0xEu);
      }

      v36 = [v4 error];
      v37 = [v36 localizedDescription];
      v38 = v37;
      if (v37)
      {
        __int16 v24 = v37;
      }
      else
      {
        v39 = [v4 error];
        __int16 v24 = [v39 description];
      }
      v40 = @"no description";
      uint64_t v41 = *MEMORY[0x1E4F28568];
      if (v24) {
        v40 = v24;
      }
      v55[0] = v40;
      v54[0] = v41;
      v54[1] = v19;
      v42 = [v4 error];
      v55[1] = v42;
      v54[2] = @"Retry-After";
      v43 = NSNumber;
      CKRetryAfterSecondsForError();
      v44 = [v43 numberWithDouble:x0];
      v55[2] = v44;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];

      v45 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = 0;
    }
    else
    {
      __int16 v24 = [v4 error];
      v25 = [(__CFString *)v24 domain];
      uint64_t v26 = *MEMORY[0x1E4F281F8];
      if (![v25 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        objc_super v34 = 0;
LABEL_27:

LABEL_28:
LABEL_29:

        goto LABEL_30;
      }
      int v27 = [v4 error];
      uint64_t v28 = [v27 code];

      if (v28 != 134410)
      {
        objc_super v34 = 0;
        goto LABEL_29;
      }
      __int16 v24 = [v20 domain];
      if (![(__CFString *)v24 isEqualToString:v26])
      {
        objc_super v34 = 0;
        goto LABEL_28;
      }
      uint64_t v29 = [v20 code];

      if (v29 != 134408)
      {
        objc_super v34 = 0;
        goto LABEL_29;
      }
      v30 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, "mirroring request failed to exceeding maximum memory threshold", buf, 2u);
      }

      v31 = [v4 error];
      v32 = [v31 localizedDescription];
      v33 = v32;
      if (v32)
      {
        __int16 v24 = v32;
      }
      else
      {
        v48 = [v4 error];
        __int16 v24 = [v48 description];
      }
      v49 = @"no description";
      uint64_t v50 = *MEMORY[0x1E4F28568];
      if (v24) {
        v49 = v24;
      }
      v52[1] = v19;
      v53[0] = v49;
      v52[0] = v50;
      v51 = [v4 error];
      v53[1] = v51;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];

      v45 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = 8;
    }
    objc_super v34 = [v45 errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:v46 userInfo:v25];
    goto LABEL_27;
  }
  objc_super v34 = 0;
LABEL_30:
  v47 = [v4 error];

  if (v47 && !v34)
  {
    objc_super v34 = [v4 error];
  }
  [(RTPersistenceMirroringRequest *)self _completeRequestWithError:v34];
}

- (BOOL)isEqualToMirroringRequest:(id)a3
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  id v8 = [v6 request];
  if (v7 == objc_opt_class())
  {
    v10 = [(NSCloudKitMirroringRequest *)self->_request affectedStores];
    if (v10
      || ([v6 request],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v3 affectedStores],
          (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v11 = [(NSCloudKitMirroringRequest *)self->_request affectedStores];
      v12 = [v6 request];
      id v13 = [v12 affectedStores];
      char v9 = [v11 isEqual:v13];

      if (v10)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      char v9 = 1;
    }

    goto LABEL_9;
  }
  char v9 = 0;
LABEL_10:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTPersistenceMirroringRequest *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTPersistenceMirroringRequest *)self isEqualToMirroringRequest:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  id v4 = [(NSCloudKitMirroringRequest *)self->_request affectedStores];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (void)mergeRequest:(id)a3
{
  BOOL v6 = (RTPersistenceMirroringRequest *)a3;
  if (v6)
  {
    v30 = v6;
    BOOL v7 = [(RTPersistenceMirroringRequest *)self isEqual:v6];
    if (self != v30 && v7)
    {
      id v8 = [(NSCloudKitMirroringRequest *)self->_request options];
      char v9 = (void *)[v8 copy];

      v10 = [(RTPersistenceMirroringRequest *)v30 request];
      id v11 = [v10 options];
      v12 = [v11 operationConfiguration];
      char v13 = [v12 allowsCellularAccess];
      if (v13)
      {
        uint64_t v14 = 1;
      }
      else
      {
        uint64_t v3 = [(NSCloudKitMirroringRequest *)self->_request options];
        id v4 = [v3 operationConfiguration];
        uint64_t v14 = [v4 allowsCellularAccess];
      }
      id v15 = [v9 operationConfiguration];
      [v15 setAllowsCellularAccess:v14];

      if ((v13 & 1) == 0)
      {
      }
      completionHandlers = self->_completionHandlers;
      uint64_t v17 = [(RTPersistenceMirroringRequest *)v30 completionHandlers];
      [(NSMutableArray *)completionHandlers addObjectsFromArray:v17];

      id v18 = [(RTPersistenceMirroringRequest *)v30 completionHandlers];
      [v18 removeAllObjects];

      int64_t requestType = self->_requestType;
      id v20 = [(NSCloudKitMirroringRequest *)self->_request affectedStores];
      [(RTPersistenceMirroringRequest *)self _createMirroringRequestWithRequestType:requestType affectedStores:v20 options:v9];

      int v21 = [(RTPersistenceMirroringRequest *)v30 mirroringPolicy];
      uint64_t v22 = [v21 qualityOfService];
      uint64_t v23 = [(RTPersistenceMirroringRequest *)self mirroringPolicy];
      uint64_t v24 = [v23 qualityOfService];

      if (v22 > v24)
      {
        v25 = [(RTPersistenceMirroringRequest *)v30 mirroringPolicy];
        [(RTPersistenceMirroringRequest *)self setMirroringPolicy:v25];
      }
      enqueueDate = self->_enqueueDate;
      int v27 = [(RTPersistenceMirroringRequest *)v30 enqueueDate];
      uint64_t v28 = [(NSDate *)enqueueDate earlierDate:v27];
      uint64_t v29 = self->_enqueueDate;
      self->_enqueueDate = v28;
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)completeRequestWithError:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __58__RTPersistenceMirroringRequest_completeRequestWithError___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __58__RTPersistenceMirroringRequest_completeRequestWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithError:*(void *)(a1 + 40)];
}

- (void)_dispatchAllHandlersWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = self->_completionHandlers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(NSMutableArray *)self->_completionHandlers removeAllObjects];
}

- (void)_completeRequestWithError:(id)a3
{
  id v4 = a3;
  mirroringTransaction = self->_mirroringTransaction;
  self->_mirroringTransaction = 0;

  mirroringAssertion = self->_mirroringAssertion;
  self->_mirroringAssertion = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([WeakRetained mirroringRequest:self didFailWithError:v4] & 1) != 0)
    {
      goto LABEL_11;
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [WeakRetained mirroringRequestDidSucceed:self];
  }
  [(RTPersistenceMirroringRequest *)self _dispatchAllHandlersWithError:v4];
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  uint64_t v9 = v8;
  os_signpost_id_t sid = self->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)long long v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v9, OS_SIGNPOST_INTERVAL_END, sid, "MirroringRequest", "", v13, 2u);
  }

  long long v11 = [MEMORY[0x1E4F1C9C8] date];
  [v11 timeIntervalSinceDate:self->_startDate];
  self->_duration = v12;

LABEL_11:
}

- (void)executeMirroringRequestWithContext:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self->_attemptCount >= RTPersistenceMirroringRequestRetryCountMax)
  {
    uint64_t v45 = *MEMORY[0x1E4F28568];
    v46[0] = @"The maximum number of retry attempts for this request have been exceeded.";
    id WeakRetained = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:4 userInfo:WeakRetained];
    v32 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
LABEL_18:

      [(RTPersistenceMirroringRequest *)self completeRequestWithError:v31];
      goto LABEL_19;
    }
    *(_DWORD *)buf = 138412290;
    v42 = v31;
LABEL_21:
    _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "error executing request, %@", buf, 0xCu);
    goto LABEL_18;
  }
  if (!self->_startDate)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    startDate = self->_startDate;
    self->_startDate = v6;
  }
  uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  uint64_t v9 = v8;
  os_signpost_id_t sid = self->_sid;
  if (sid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    long long v11 = [(NSCloudKitMirroringRequest *)self->_request requestIdentifier];
    double v12 = [v11 UUIDString];
    int64_t requestType = self->_requestType;
    *(_DWORD *)buf = 138412546;
    v42 = v12;
    __int16 v43 = 2048;
    int64_t v44 = requestType;
    _os_signpost_emit_with_name_impl(&dword_1D9BFA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, sid, "MirroringRequest", "id: %@, type:, %ld", buf, 0x16u);
  }
  uint64_t v14 = NSString;
  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  uint64_t v17 = NSStringFromSelector(a2);
  id v18 = [v14 stringWithFormat:@"%@-%@", v16, v17];
  [v18 UTF8String];
  uint64_t v19 = (OS_os_transaction *)os_transaction_create();
  mirroringTransaction = self->_mirroringTransaction;
  self->_mirroringTransaction = v19;

  int v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    objc_super v34 = (RTPersistenceMirroringRequest *)objc_claimAutoreleasedReturnValue();
    v35 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v42 = v34;
    __int16 v43 = 2112;
    int64_t v44 = (int64_t)v35;
    _os_log_debug_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_DEBUG, "creating os_transaction, %@, %@", buf, 0x16u);
  }
  uint64_t v22 = [RTPowerAssertion alloc];
  uint64_t v23 = NSString;
  uint64_t v24 = [(NSCloudKitMirroringRequest *)self->_request requestIdentifier];
  v25 = [v24 UUIDString];
  uint64_t v26 = [v23 stringWithFormat:@"MirroringRequest-%@", v25];
  int v27 = [(RTPowerAssertion *)v22 initWithIdentifier:v26 timeout:300.0];
  mirroringAssertion = self->_mirroringAssertion;
  self->_mirroringAssertion = v27;

  if (!v5)
  {
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40 = @"Request requires managed object context.";
    id WeakRetained = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RTPersistenceMirroringManagerErrorDomain" code:1 userInfo:WeakRetained];
    v32 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138412290;
    v42 = v31;
    goto LABEL_21;
  }
  uint64_t v29 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v42 = self;
    _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "starting mirroring request, %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained mirroringRequestDidBegin:self];
  }
  ++self->_attemptCount;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __68__RTPersistenceMirroringRequest_executeMirroringRequestWithContext___block_invoke;
  v36[3] = &unk_1E6B90BF0;
  v37 = (RTPersistenceMirroringRequest *)v5;
  v38 = self;
  [(RTPersistenceMirroringRequest *)v37 performBlockAndWait:v36];
  v31 = v37;
LABEL_19:
}

void __68__RTPersistenceMirroringRequest_executeMirroringRequestWithContext___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 24);
  id v7 = 0;
  id v4 = (id)[v2 executeRequest:v3 error:&v7];
  id v5 = v7;
  if (v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "error executing request, %@", buf, 0xCu);
    }

    [*(id *)(a1 + 40) completeRequestWithError:v5];
  }
}

- (id)description
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(NSCloudKitMirroringRequest *)self->_request affectedStores];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v21 + 1) + 8 * i) URL];
        uint64_t v10 = [v9 lastPathComponent];
        [v3 appendFormat:@"%@, ", v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  long long v11 = NSString;
  double v12 = [(NSUUID *)self->_identifier UUIDString];
  long long v13 = [(RTPersistenceMirroringRequest *)self requestTypeToString:self->_requestType];
  unint64_t attemptCount = self->_attemptCount;
  double duration = self->_duration;
  uint64_t v16 = [(NSDate *)self->_enqueueDate stringFromDate];
  mirroringPolicy = self->_mirroringPolicy;
  id v18 = [(NSDate *)self->_startDate stringFromDate];
  uint64_t v19 = [v11 stringWithFormat:@"request id, %@, type, %@, affected stores, %@ attempt count, %lu, duration, %f, enqueue date, %@, mirroring policy, %@, state date, %@, handler count, %lu", v12, v13, v3, attemptCount, *(void *)&duration, v16, mirroringPolicy, v18, -[NSMutableArray count](self->_completionHandlers, "count")];

  return v19;
}

- (id)requestTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E6B92FF8[a3];
  }
}

- (BOOL)isReady
{
  mirroringPolicy = self->_mirroringPolicy;
  if (mirroringPolicy) {
    LOBYTE(mirroringPolicy) = [(RTPersistenceMirroringPolicy *)mirroringPolicy mirroringOperationAllowed];
  }
  return (char)mirroringPolicy;
}

- (NSCloudKitMirroringRequest)request
{
  return self->_request;
}

- (RTPersistenceMirroringRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RTPersistenceMirroringRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)enqueueDate
{
  return self->_enqueueDate;
}

- (void)setEnqueueDate:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_double duration = a3;
}

- (unint64_t)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(unint64_t)a3
{
  self->_unint64_t attemptCount = a3;
}

- (unint64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setMaxRetryCount:(unint64_t)a3
{
  self->_maxRetryCount = a3;
}

- (RTPersistenceMirroringPolicy)mirroringPolicy
{
  return self->_mirroringPolicy;
}

- (void)setMirroringPolicy:(id)a3
{
}

- (OS_os_transaction)mirroringTransaction
{
  return self->_mirroringTransaction;
}

- (void)setMirroringTransaction:(id)a3
{
}

- (RTPowerAssertion)mirroringAssertion
{
  return self->_mirroringAssertion;
}

- (void)setMirroringAssertion:(id)a3
{
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_int64_t requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroringAssertion, 0);
  objc_storeStrong((id *)&self->_mirroringTransaction, 0);
  objc_storeStrong((id *)&self->_mirroringPolicy, 0);
  objc_storeStrong((id *)&self->_enqueueDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end