@interface SSObservable
+ (BOOL)_errorIsCanceledError:(id)a3;
+ (id)observableWithObserver:(id)a3;
+ (id)observableWithObservers:(id)a3;
- (BOOL)_isComplete;
- (BOOL)cancel;
- (BOOL)isCancelled;
- (BOOL)isComplete;
- (BOOL)sendCompletion;
- (BOOL)sendFailure:(id)a3;
- (BOOL)sendResult:(id)a3;
- (NSConditionLock)stateLock;
- (NSError)failureError;
- (NSMutableArray)observers;
- (NSMutableArray)queuedResults;
- (NSString)logKey;
- (OS_dispatch_queue)sendMessageQueue;
- (SSObservable)init;
- (void)setFailureError:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueuedResults:(id)a3;
- (void)setSendMessageQueue:(id)a3;
- (void)setStateLock:(id)a3;
- (void)subscribe:(id)a3;
@end

@implementation SSObservable

- (SSObservable)init
{
  v14.receiver = self;
  v14.super_class = (Class)SSObservable;
  v2 = [(SSObservable *)&v14 init];
  if (v2)
  {
    uint64_t v3 = SSGenerateLogCorrelationString();
    logKey = v2->_logKey;
    v2->_logKey = (NSString *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v2->_observers;
    v2->_observers = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    queuedResults = v2->_queuedResults;
    v2->_queuedResults = v7;

    dispatch_queue_t v9 = dispatch_queue_create("coma.apple.StoreServices.SSObservable.sendMessage", MEMORY[0x1E4F14430]);
    sendMessageQueue = v2->_sendMessageQueue;
    v2->_sendMessageQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    stateLock = v2->_stateLock;
    v2->_stateLock = (NSConditionLock *)v11;
  }
  return v2;
}

+ (id)observableWithObserver:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 subscribe:v3];

  return v4;
}

+ (id)observableWithObservers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "subscribe:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isCancelled
{
  id v3 = [(SSObservable *)self stateLock];
  [v3 lock];

  if ([(SSObservable *)self _isComplete])
  {
    id v4 = objc_opt_class();
    id v5 = [(SSObservable *)self failureError];
    char v6 = [v4 _errorIsCanceledError:v5];
  }
  else
  {
    char v6 = 0;
  }
  uint64_t v7 = [(SSObservable *)self stateLock];
  [v7 unlock];

  return v6;
}

- (BOOL)isComplete
{
  id v3 = [(SSObservable *)self stateLock];
  [v3 lock];

  LOBYTE(v3) = [(SSObservable *)self _isComplete];
  id v4 = [(SSObservable *)self stateLock];
  [v4 unlock];

  return (char)v3;
}

- (BOOL)cancel
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  LOBYTE(self) = [(SSObservable *)self sendFailure:v3];

  return (char)self;
}

- (BOOL)sendCompletion
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = [(SSObservable *)self stateLock];
  [v3 lock];

  id v4 = [(SSObservable *)self stateLock];
  uint64_t v5 = [v4 condition];

  if (v5 == 1)
  {
    uint64_t v16 = SSObservableLogConfig();
    if (!v16)
    {
      uint64_t v16 = +[SSLogConfig sharedConfig];
    }
    int v17 = [v16 shouldLog];
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    v19 = [v16 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      v18 &= 2u;
    }
    if (v18)
    {
      v20 = objc_opt_class();
      id v21 = v20;
      [(SSObservable *)self logKey];
      int v36 = 138543618;
      v37 = v20;
      __int16 v38 = 2114;
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = 22;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_21:

        id v9 = [(SSObservable *)self stateLock];
        [v9 unlock];
        goto LABEL_22;
      }
      v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v22, 4, &v36, v30);
      free(v22);
      SSFileLog(v16, @"%@", v23, v24, v25, v26, v27, v28, (uint64_t)v19);
    }

    goto LABEL_21;
  }
  char v6 = [(SSObservable *)self observers];
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = [(SSObservable *)self stateLock];
  [v8 unlockWithCondition:1];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v15 = [(SSObservable *)self sendMessageQueue];
        [v14 _sendCompletionUsingQueue:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }

LABEL_22:
  return v5 != 1;
}

- (BOOL)sendFailure:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SSObservable *)self stateLock];
  [v5 lock];

  char v6 = [(SSObservable *)self stateLock];
  uint64_t v7 = [v6 condition];

  if (v7 == 1)
  {
    int v18 = SSObservableLogConfig();
    if (!v18)
    {
      int v18 = +[SSLogConfig sharedConfig];
    }
    int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    id v21 = [v18 OSLogObject];
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      v20 &= 2u;
    }
    if (v20)
    {
      v22 = objc_opt_class();
      id v23 = v22;
      [(SSObservable *)self logKey];
      int v38 = 138543618;
      id v39 = v22;
      __int16 v40 = 2114;
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v32) = 22;
      uint64_t v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_21:

        id v11 = [(SSObservable *)self stateLock];
        [v11 unlock];
        goto LABEL_22;
      }
      id v21 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v38, v32);
      free(v24);
      SSFileLog(v18, @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v21);
    }

    goto LABEL_21;
  }
  [(SSObservable *)self setFailureError:v4];
  uint64_t v8 = [(SSObservable *)self observers];
  id v9 = (void *)[v8 copy];

  uint64_t v10 = [(SSObservable *)self stateLock];
  [v10 unlockWithCondition:1];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v34 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        int v17 = [(SSObservable *)self sendMessageQueue];
        [v16 _sendFailure:v4 usingQueue:v17];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v13);
  }

LABEL_22:
  return v7 != 1;
}

- (BOOL)sendResult:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SSObservable *)self stateLock];
  [v5 lock];

  char v6 = [(SSObservable *)self stateLock];
  uint64_t v7 = [v6 condition];

  if (v7 == 1)
  {
    uint64_t v8 = SSObservableLogConfig();
    if (!v8)
    {
      uint64_t v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      v10 &= 2u;
    }
    if (v10)
    {
      uint64_t v12 = objc_opt_class();
      id v13 = v12;
      [(SSObservable *)self logKey];
      int v94 = 138543618;
      v95 = v12;
      __int16 v96 = 2114;
      id v97 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v77) = 22;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        id v21 = [(SSObservable *)self stateLock];
        [v21 unlock];
        BOOL v22 = 0;
        goto LABEL_58;
      }
      id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v94, v77);
      free(v14);
      SSFileLog(v8, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    }

    goto LABEL_13;
  }
  id v23 = [(SSObservable *)self queuedResults];
  [v23 addObject:v4];

  uint64_t v24 = [(SSObservable *)self queuedResults];
  id v21 = (void *)[v24 copy];

  uint64_t v25 = [(SSObservable *)self observers];
  uint64_t v26 = (void *)[v25 copy];

  v82 = v26;
  uint64_t v27 = [v26 count];
  uint64_t v28 = SSObservableLogConfig();
  uint64_t v29 = (void *)v28;
  if (!v27)
  {
    if (!v28)
    {
      uint64_t v29 = +[SSLogConfig sharedConfig];
    }
    int v46 = [v29 shouldLog];
    if ([v29 shouldLogToDisk]) {
      int v47 = v46 | 2;
    }
    else {
      int v47 = v46;
    }
    v48 = [v29 OSLogObject];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
      int v49 = v47;
    }
    else {
      int v49 = v47 & 2;
    }
    if (v49)
    {
      v50 = v21;
      id v51 = v4;
      v52 = objc_opt_class();
      id v53 = v52;
      v54 = [(SSObservable *)self logKey];
      int v94 = 138543618;
      v95 = v52;
      __int16 v96 = 2114;
      id v97 = v54;
      LODWORD(v77) = 22;
      v76 = &v94;
      v55 = (void *)_os_log_send_and_compose_impl();

      if (v55)
      {
        v56 = objc_msgSend(NSString, "stringWithCString:encoding:", v55, 4, &v94, v77);
        free(v55);
        SSFileLog(v29, @"%@", v57, v58, v59, v60, v61, v62, (uint64_t)v56);
      }
      id v4 = v51;
      id v21 = v50;
    }
    else
    {
    }
    goto LABEL_41;
  }
  if (!v28)
  {
    uint64_t v29 = +[SSLogConfig sharedConfig];
  }
  int v30 = [v29 shouldLog];
  if ([v29 shouldLogToDisk]) {
    int v31 = v30 | 2;
  }
  else {
    int v31 = v30;
  }
  uint64_t v32 = [v29 OSLogObject];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
    int v33 = v31;
  }
  else {
    int v33 = v31 & 2;
  }
  if (!v33) {
    goto LABEL_26;
  }
  long long v34 = v21;
  long long v35 = objc_opt_class();
  id v36 = v4;
  id v37 = v35;
  int v38 = [(SSObservable *)self logKey];
  int v94 = 138543618;
  v95 = v35;
  id v21 = v34;
  __int16 v96 = 2114;
  id v97 = v38;
  LODWORD(v77) = 22;
  v76 = &v94;
  id v39 = (void *)_os_log_send_and_compose_impl();

  id v4 = v36;
  if (v39)
  {
    uint64_t v32 = objc_msgSend(NSString, "stringWithCString:encoding:", v39, 4, &v94, v77);
    free(v39);
    SSFileLog(v29, @"%@", v40, v41, v42, v43, v44, v45, (uint64_t)v32);
LABEL_26:
  }
  uint64_t v29 = [(SSObservable *)self queuedResults];
  [v29 removeAllObjects];
LABEL_41:

  v63 = [(SSObservable *)self stateLock];
  [v63 unlock];

  uint64_t v64 = [v82 count];
  BOOL v22 = v64 != 0;
  if (v64)
  {
    v78 = v21;
    id v79 = v4;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obuint64_t j = v21;
    uint64_t v83 = [obj countByEnumeratingWithState:&v88 objects:v93 count:16];
    if (v83)
    {
      uint64_t v81 = *(void *)v89;
      do
      {
        for (uint64_t i = 0; i != v83; ++i)
        {
          if (*(void *)v89 != v81) {
            objc_enumerationMutation(obj);
          }
          v66 = *(void **)(*((void *)&v88 + 1) + 8 * i);
          long long v84 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id v67 = v82;
          uint64_t v68 = [v67 countByEnumeratingWithState:&v84 objects:v92 count:16];
          if (v68)
          {
            uint64_t v69 = v68;
            uint64_t v70 = *(void *)v85;
            do
            {
              for (uint64_t j = 0; j != v69; ++j)
              {
                if (*(void *)v85 != v70) {
                  objc_enumerationMutation(v67);
                }
                v72 = *(void **)(*((void *)&v84 + 1) + 8 * j);
                v73 = objc_msgSend(v66, "copy", v76);
                v74 = [(SSObservable *)self sendMessageQueue];
                [v72 _sendResult:v73 usingQueue:v74];
              }
              uint64_t v69 = [v67 countByEnumeratingWithState:&v84 objects:v92 count:16];
            }
            while (v69);
          }
        }
        uint64_t v83 = [obj countByEnumeratingWithState:&v88 objects:v93 count:16];
      }
      while (v83);
    }

    id v21 = v78;
    id v4 = v79;
    BOOL v22 = 1;
  }

LABEL_58:
  return v22;
}

- (void)subscribe:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SSObservable *)self stateLock];
  [v5 lock];

  char v6 = [(SSObservable *)self stateLock];
  uint64_t v7 = [v6 condition];

  if (v7 == 1)
  {
    uint64_t v8 = SSObservableLogConfig();
    if (!v8)
    {
      uint64_t v8 = +[SSLogConfig sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      v10 &= 2u;
    }
    if (!v10) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  uint64_t v12 = [(SSObservable *)self observers];
  int v13 = [v12 containsObject:v4];

  if (v13)
  {
    uint64_t v8 = SSObservableLogConfig();
    if (!v8)
    {
      uint64_t v8 = +[SSLogConfig sharedConfig];
    }
    int v14 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    id v11 = [v8 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      v15 &= 2u;
    }
    if (!v15) {
      goto LABEL_22;
    }
LABEL_20:
    uint64_t v16 = objc_opt_class();
    id v17 = v16;
    [(SSObservable *)self logKey];
    int v73 = 138543618;
    v74 = v16;
    __int16 v75 = 2114;
    id v76 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v57) = 22;
    uint64_t v18 = (void *)_os_log_send_and_compose_impl();

    if (!v18)
    {
LABEL_23:

      id v25 = [(SSObservable *)self stateLock];
      [v25 unlock];
      goto LABEL_53;
    }
    id v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v73, v57);
    free(v18);
    SSFileLog(v8, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v11);
LABEL_22:

    goto LABEL_23;
  }
  uint64_t v26 = [(SSObservable *)self observers];
  [v26 addObject:v4];

  uint64_t v27 = [(SSObservable *)self queuedResults];
  uint64_t v28 = (void *)[v27 copy];

  uint64_t v29 = [(SSObservable *)self queuedResults];
  [v29 removeAllObjects];

  id v58 = v4;
  if (![v28 count])
  {
    uint64_t v61 = 0;
    goto LABEL_38;
  }
  int v30 = SSObservableLogConfig();
  if (!v30)
  {
    int v30 = +[SSLogConfig sharedConfig];
  }
  int v31 = [v30 shouldLog];
  if ([v30 shouldLogToDisk]) {
    int v32 = v31 | 2;
  }
  else {
    int v32 = v31;
  }
  int v33 = [v30 OSLogObject];
  if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    v32 &= 2u;
  }
  if (!v32) {
    goto LABEL_35;
  }
  long long v34 = objc_opt_class();
  id v35 = v34;
  id v36 = [(SSObservable *)self logKey];
  int v73 = 138543618;
  v74 = v34;
  __int16 v75 = 2114;
  id v76 = v36;
  LODWORD(v57) = 22;
  v56 = &v73;
  id v37 = (void *)_os_log_send_and_compose_impl();

  if (v37)
  {
    int v33 = objc_msgSend(NSString, "stringWithCString:encoding:", v37, 4, &v73, v57);
    free(v37);
    SSFileLog(v30, @"%@", v38, v39, v40, v41, v42, v43, (uint64_t)v33);
LABEL_35:
  }
  uint64_t v44 = [(SSObservable *)self observers];
  uint64_t v61 = (void *)[v44 copy];

LABEL_38:
  uint64_t v45 = [(SSObservable *)self stateLock];
  [v45 unlock];

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v25 = v28;
  uint64_t v62 = [v25 countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v62)
  {
    obuint64_t j = v25;
    uint64_t v60 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v62; ++i)
      {
        if (*(void *)v68 != v60) {
          objc_enumerationMutation(obj);
        }
        int v47 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v48 = v61;
        uint64_t v49 = [v48 countByEnumeratingWithState:&v63 objects:v71 count:16];
        if (v49)
        {
          uint64_t v50 = v49;
          uint64_t v51 = *(void *)v64;
          do
          {
            for (uint64_t j = 0; j != v50; ++j)
            {
              if (*(void *)v64 != v51) {
                objc_enumerationMutation(v48);
              }
              id v53 = *(void **)(*((void *)&v63 + 1) + 8 * j);
              v54 = (void *)[v47 copy];
              v55 = [(SSObservable *)self sendMessageQueue];
              [v53 _sendResult:v54 usingQueue:v55];
            }
            uint64_t v50 = [v48 countByEnumeratingWithState:&v63 objects:v71 count:16];
          }
          while (v50);
        }
      }
      id v25 = obj;
      uint64_t v62 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v62);
  }

  id v4 = v58;
LABEL_53:
}

+ (BOOL)_errorIsCanceledError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:*MEMORY[0x1E4F281F8]]) {
    BOOL v5 = [v3 code] == 3072;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isComplete
{
  v2 = [(SSObservable *)self stateLock];
  BOOL v3 = [v2 condition] == 1;

  return v3;
}

- (NSError)failureError
{
  return self->_failureError;
}

- (void)setFailureError:(id)a3
{
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (NSMutableArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableArray)queuedResults
{
  return self->_queuedResults;
}

- (void)setQueuedResults:(id)a3
{
}

- (OS_dispatch_queue)sendMessageQueue
{
  return self->_sendMessageQueue;
}

- (void)setSendMessageQueue:(id)a3
{
}

- (NSConditionLock)stateLock
{
  return self->_stateLock;
}

- (void)setStateLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_sendMessageQueue, 0);
  objc_storeStrong((id *)&self->_queuedResults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_failureError, 0);
}

@end