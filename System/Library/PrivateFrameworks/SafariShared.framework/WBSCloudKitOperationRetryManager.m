@interface WBSCloudKitOperationRetryManager
- (BOOL)_shouldRetryOperationWithError:(id)a3 isItemPartialError:(BOOL)a4 getRetryInterval:(double *)a5 underlyingError:(id *)a6;
- (CKOperationGroup)operationGroup;
- (OS_dispatch_queue)scheduleQueue;
- (OS_os_log)log;
- (WBSCloudKitOperationRetryManager)init;
- (WBSCloudKitOperationRetryManager)initWithLog:(id)a3;
- (double)timeout;
- (id)_logStringForOperationGroup;
- (int64_t)scheduleRetryIfNeededForError:(id)a3 usingBlock:(id)a4;
- (unint64_t)numberOfRetries;
- (void)setLog:(id)a3;
- (void)setOperationGroup:(id)a3;
- (void)setScheduleQueue:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation WBSCloudKitOperationRetryManager

- (WBSCloudKitOperationRetryManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSCloudKitOperationRetryManager;
  v2 = [(WBSCloudKitOperationRetryManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_timeout = 3600.0;
    objc_storeStrong((id *)&v2->_scheduleQueue, MEMORY[0x1E4F14428]);
    v4 = v3;
  }

  return v3;
}

- (WBSCloudKitOperationRetryManager)initWithLog:(id)a3
{
  id v5 = a3;
  objc_super v6 = [(WBSCloudKitOperationRetryManager *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_log, a3);
    v8 = v7;
  }

  return v7;
}

- (OS_os_log)log
{
  if (self->_log) {
    return self->_log;
  }
  else {
    return (OS_os_log *)MEMORY[0x1E4F14500];
  }
}

- (void)setScheduleQueue:(id)a3
{
  v4 = (OS_dispatch_queue *)a3;
  if (!v4)
  {
    id v5 = MEMORY[0x1E4F14428];
    v4 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
  }
  scheduleQueue = self->_scheduleQueue;
  p_scheduleQueue = &self->_scheduleQueue;
  if (scheduleQueue != v4)
  {
    v8 = v4;
    objc_storeStrong((id *)p_scheduleQueue, v4);
    v4 = v8;
  }
}

- (BOOL)_shouldRetryOperationWithError:(id)a3 isItemPartialError:(BOOL)a4 getRetryInterval:(double *)a5 underlyingError:(id *)a6
{
  id v10 = a3;
  if (objc_msgSend(v10, "safari_isInCloudKitErrorDomain"))
  {
    id v11 = v10;
    *a6 = v11;
    uint64_t v12 = [v11 code];
    switch(v12)
    {
      case 1:
      case 5:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 35:
      case 36:
        goto LABEL_8;
      case 2:
        uint64_t v36 = 0;
        v37 = &v36;
        uint64_t v38 = 0x2020000000;
        char v39 = 1;
        uint64_t v32 = 0;
        v33 = (double *)&v32;
        uint64_t v34 = 0x2020000000;
        uint64_t v35 = 0;
        uint64_t v26 = 0;
        v27 = &v26;
        uint64_t v28 = 0x3032000000;
        v29 = __Block_byref_object_copy__5;
        v30 = __Block_byref_object_dispose__5;
        id v31 = 0;
        v18 = [v11 userInfo];
        v19 = [v18 objectForKeyedSubscript:*MEMORY[0x1E4F19CD0]];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __119__WBSCloudKitOperationRetryManager__shouldRetryOperationWithError_isItemPartialError_getRetryInterval_underlyingError___block_invoke;
        v21[3] = &unk_1E5C8E088;
        v21[4] = self;
        v23 = &v32;
        v24 = &v26;
        id v22 = v11;
        v25 = &v36;
        [v19 enumerateKeysAndObjectsUsingBlock:v21];

        *a6 = (id) v27[5];
        *a5 = v33[3];
        a4 = *((unsigned char *)v37 + 24) != 0;

        _Block_object_dispose(&v26, 8);
        _Block_object_dispose(&v32, 8);
        _Block_object_dispose(&v36, 8);
        break;
      case 3:
      case 4:
      case 6:
      case 7:
      case 23:
      case 34:
        v13 = [v11 userInfo];
        v14 = objc_msgSend(v13, "safari_numberForKey:", *MEMORY[0x1E4F19C58]);

        if (v14) {
          [v14 doubleValue];
        }
        else {
          double v15 = 5.0;
        }
        *a5 = v15;

        a4 = 1;
        break;
      case 22:
        break;
      default:
        char v16 = v12 - 100;
        if ((unint64_t)(v12 - 100) > 0x3D
          || ((1 << v16) & 0x30040001C1F06001) == 0 && ((1 << v16) & 0x10000009C00) == 0)
        {
          v20 = [(WBSCloudKitOperationRetryManager *)self log];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
            -[WBSCloudKitOperationRetryManager _shouldRetryOperationWithError:isItemPartialError:getRetryInterval:underlyingError:](v11, v20);
          }
        }
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    a4 = 0;
  }

  return a4;
}

void __119__WBSCloudKitOperationRetryManager__shouldRetryOperationWithError_isItemPartialError_getRetryInterval_underlyingError___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v19 = 0;
  double v20 = 0.0;
  int v9 = [*(id *)(a1 + 32) _shouldRetryOperationWithError:v8 isItemPartialError:1 getRetryInterval:&v20 underlyingError:&v19];
  id v10 = v19;
  id v11 = v19;
  if (v9)
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    if (v20 > *(double *)(v12 + 24))
    {
      *(double *)(v12 + 24) = v20;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v10);
    }
  }
  else
  {
    v13 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(v8, "safari_privacyPreservingError");
      double v15 = [v7 ckShortDescription];
      char v16 = objc_msgSend(*(id *)(a1 + 40), "safari_privacyPreservingError");
      [*(id *)(a1 + 32) _logStringForOperationGroup];
      v17 = v18 = a4;
      *(_DWORD *)buf = 138544130;
      id v22 = v14;
      __int16 v23 = 2114;
      v24 = v15;
      __int16 v25 = 2114;
      uint64_t v26 = v16;
      __int16 v27 = 2114;
      uint64_t v28 = v17;
      _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_INFO, "Error %{public}@ for item ID %{public}@ blocks retry of partial error %{public}@%{public}@", buf, 0x2Au);

      a4 = v18;
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v10);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (int64_t)scheduleRetryIfNeededForError:(id)a3 usingBlock:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_dateRetryWasFirstRequested)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F1C9C8] date];
    dateRetryWasFirstRequested = self->_dateRetryWasFirstRequested;
    self->_dateRetryWasFirstRequested = v21;

    if (v6)
    {
LABEL_3:
      id v36 = 0;
      double v37 = 0.0;
      BOOL v8 = [(WBSCloudKitOperationRetryManager *)self _shouldRetryOperationWithError:v6 isItemPartialError:0 getRetryInterval:&v37 underlyingError:&v36];
      id v9 = v36;
      if (!v8)
      {
        int64_t v23 = 3;
LABEL_22:

        goto LABEL_23;
      }
      unint64_t numberOfRetries = self->_numberOfRetries;
      double v11 = exp2((double)numberOfRetries) * 5.0;
      if (v11 <= v37) {
        double v12 = v37;
      }
      else {
        double v12 = v11;
      }
      double v37 = v12;
      self->_unint64_t numberOfRetries = numberOfRetries + 1;
      [(NSDate *)self->_dateRetryWasFirstRequested timeIntervalSinceNow];
      if (v12 - v13 > self->_timeout)
      {
        v14 = [(WBSCloudKitOperationRetryManager *)self log];
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        if (v9 == v6)
        {
          if (v15)
          {
            char v16 = objc_msgSend(v6, "safari_privacyPreservingDescription");
            double v31 = v37;
            double timeout = self->_timeout;
            double v33 = [(WBSCloudKitOperationRetryManager *)self _logStringForOperationGroup];
            *(_DWORD *)buf = 138544130;
            double v39 = *(double *)&v16;
            __int16 v40 = 2048;
            double v41 = v31;
            __int16 v42 = 2048;
            double v43 = timeout;
            __int16 v44 = 2114;
            double v45 = v33;
            _os_log_error_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_ERROR, "Operation failed due to error %{public}@; not retrying because retry interval (%f seconds) exceeds timeout"
              " (%f seconds)%{public}@",
              buf,
              0x2Au);

            goto LABEL_25;
          }
        }
        else if (v15)
        {
          char v16 = objc_msgSend(v9, "safari_privacyPreservingDescription");
          v17 = objc_msgSend(v6, "safari_privacyPreservingDescription");
          double v18 = v37;
          double v19 = self->_timeout;
          double v20 = [(WBSCloudKitOperationRetryManager *)self _logStringForOperationGroup];
          *(_DWORD *)buf = 138544386;
          double v39 = *(double *)&v16;
          __int16 v40 = 2114;
          double v41 = *(double *)&v17;
          __int16 v42 = 2048;
          double v43 = v18;
          __int16 v44 = 2048;
          double v45 = v19;
          __int16 v46 = 2114;
          v47 = v20;
          _os_log_error_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_ERROR, "Operation failed due to error %{public}@, underlying error %{public}@; not retrying because retry interval ("
            "%f seconds) exceeds timeout (%f seconds)%{public}@",
            buf,
            0x34u);

LABEL_25:
        }
        int64_t v23 = 2;
LABEL_21:

        goto LABEL_22;
      }
      dispatch_time_t v24 = dispatch_time(0, (uint64_t)(v37 * 1000000000.0));
      dispatch_after(v24, (dispatch_queue_t)self->_scheduleQueue, v7);
      v14 = [(WBSCloudKitOperationRetryManager *)self log];
      BOOL v25 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (v9 == v6)
      {
        if (v25)
        {
          double v34 = v37;
          __int16 v27 = objc_msgSend(v6, "safari_privacyPreservingDescription");
          double v35 = [(WBSCloudKitOperationRetryManager *)self _logStringForOperationGroup];
          *(_DWORD *)buf = 134218498;
          double v39 = v34;
          __int16 v40 = 2114;
          double v41 = *(double *)&v27;
          __int16 v42 = 2114;
          double v43 = v35;
          _os_log_error_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_ERROR, "Will retry operation in %f seconds due to error %{public}@%{public}@", buf, 0x20u);

          goto LABEL_27;
        }
      }
      else if (v25)
      {
        double v26 = v37;
        __int16 v27 = objc_msgSend(v9, "safari_privacyPreservingDescription");
        objc_msgSend(v6, "safari_privacyPreservingDescription");
        double v28 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        double v29 = [(WBSCloudKitOperationRetryManager *)self _logStringForOperationGroup];
        *(_DWORD *)buf = 134218754;
        double v39 = v26;
        __int16 v40 = 2114;
        double v41 = *(double *)&v27;
        __int16 v42 = 2114;
        double v43 = v28;
        __int16 v44 = 2114;
        double v45 = v29;
        _os_log_error_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_ERROR, "Will retry operation in %f seconds due to error %{public}@, underlying error %{public}@%{public}@", buf, 0x2Au);

LABEL_27:
      }
      int64_t v23 = 1;
      goto LABEL_21;
    }
  }
  int64_t v23 = 0;
LABEL_23:

  return v23;
}

- (id)_logStringForOperationGroup
{
  operationGroup = self->_operationGroup;
  if (operationGroup)
  {
    v3 = NSString;
    v4 = [(CKOperationGroup *)operationGroup safari_logDescription];
    id v5 = [v3 stringWithFormat:@" with %@", v4];
  }
  else
  {
    id v5 = &stru_1EFBE3CF8;
  }
  return v5;
}

- (void)setLog:(id)a3
{
}

- (CKOperationGroup)operationGroup
{
  return self->_operationGroup;
}

- (void)setOperationGroup:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_double timeout = a3;
}

- (unint64_t)numberOfRetries
{
  return self->_numberOfRetries;
}

- (OS_dispatch_queue)scheduleQueue
{
  return self->_scheduleQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleQueue, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_dateRetryWasFirstRequested, 0);
}

- (void)_shouldRetryOperationWithError:(void *)a1 isItemPartialError:(NSObject *)a2 getRetryInterval:underlyingError:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(a1, "safari_privacyPreservingError");
  int v4 = 138543362;
  id v5 = v3;
  _os_log_fault_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_FAULT, "CKError %{public}@ is not handled, add the new value to the switch", (uint8_t *)&v4, 0xCu);
}

@end