@interface PLLibraryServicesStateNode
+ (void)removeOperationCountObserver:(id)a3 fromObservedObject:(id)a4 context:(void *)a5;
- (BOOL)enqueueOperation:(id)a3 error:(id *)a4;
- (NSArray)operations;
- (NSString)logPrefix;
- (PLLibraryServicesStateNode)initWithLibraryServicesState:(int64_t)a3 qualityOfService:(unsigned int)a4 logPrefix:(id)a5;
- (id)addOperationCountObserver:(id)a3 context:(void *)a4;
- (id)description;
- (id)operationQueue;
- (int64_t)state;
- (unint64_t)operationCount;
- (unsigned)qos;
- (void)run;
- (void)setOperationQueue:(id)a3;
- (void)setQos:(unsigned int)a3;
- (void)terminate;
@end

@implementation PLLibraryServicesStateNode

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (NSString)logPrefix
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)qos
{
  return self->_qos;
}

- (BOOL)enqueueOperation:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLLibraryServicesStateNode *)self operationQueue];
  v8 = v7;
  if (v7)
  {
    [v7 addOperation:v6];
  }
  else
  {
    v9 = NSString;
    v10 = PLStringFromLibraryServicesState(self->_state);
    v11 = [v9 stringWithFormat:@"Attempt to enqueue operation in state %@", v10];

    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v23[0] = v11;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v14 = [v12 errorWithDomain:@"com.apple.photos.error" code:46502 userInfo:v13];

    if (a4)
    {
      *a4 = v14;
    }
    else
    {
      v15 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = [(PLLibraryServicesStateNode *)self logPrefix];
        *(_DWORD *)buf = 138543618;
        v19 = v16;
        __int16 v20 = 2112;
        v21 = v14;
        _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Unable to enqueue operation: %@", buf, 0x16u);
      }
    }
  }
  return v8 != 0;
}

- (id)addOperationCountObserver:(id)a3 context:(void *)a4
{
  id v6 = a3;
  v7 = [(PLLibraryServicesStateNode *)self operationQueue];
  v8 = v7;
  if (v7) {
    [v7 addObserver:v6 forKeyPath:@"operationCount" options:5 context:a4];
  }

  return v8;
}

- (NSArray)operations
{
  v2 = [(PLLibraryServicesStateNode *)self operationQueue];
  v3 = [v2 operations];

  return (NSArray *)v3;
}

- (unint64_t)operationCount
{
  v2 = [(PLLibraryServicesStateNode *)self operationQueue];
  unint64_t v3 = [v2 operationCount];

  return v3;
}

- (void)terminate
{
  unint64_t v3 = [(PLLibraryServicesStateNode *)self operationQueue];
  [v3 cancelAllOperations];

  [(PLLibraryServicesStateNode *)self setOperationQueue:0];
}

- (void)run
{
  id v2 = [(PLLibraryServicesStateNode *)self operationQueue];
  [v2 setSuspended:0];
}

- (id)description
{
  unint64_t v3 = [(PLLibraryServicesStateNode *)self operationQueue];
  v4 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)PLLibraryServicesStateNode;
  v5 = [(PLLibraryServicesStateNode *)&v11 description];
  uint64_t v6 = [v3 qualityOfService];
  if (v6 <= 16)
  {
    if (v6 == -1)
    {
      v7 = @"NSQualityOfServiceDefault";
      goto LABEL_13;
    }
    if (v6 == 9)
    {
      v7 = @"NSQualityOfServiceBackground";
      goto LABEL_13;
    }
  }
  else
  {
    switch(v6)
    {
      case 17:
        v7 = @"NSQualityOfServiceUtility";
        goto LABEL_13;
      case 33:
        v7 = @"NSQualityOfServiceUserInteractive";
        goto LABEL_13;
      case 25:
        v7 = @"NSQualityOfServiceUserInitiated";
        goto LABEL_13;
    }
  }
  v7 = @"Unknown";
LABEL_13:
  v8 = v7;
  v9 = [v4 stringWithFormat:@"%@ qos:%@ queue: %@", v5, v8, v3];

  return v9;
}

- (void)setQos:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_qos = a3;
  if ((int)a3 <= 20)
  {
    if (a3 && a3 != 17) {
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v4 = 0x11u;
    goto LABEL_11;
  }
  switch(a3)
  {
    case 0x15u:
      goto LABEL_8;
    case 0x19u:
      uint64_t v4 = 25;
      goto LABEL_11;
    case 0x21u:
      uint64_t v4 = 0x21u;
      goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 9u;
LABEL_11:
  v5 = PLLibraryServicesGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PLLibraryServicesStateNode *)self logPrefix];
    v7 = PLStringFromLibraryServicesState(self->_state);
    v8 = *(__CFString **)((char *)&off_1E58A2258[-1] + v4 - 1);
    int v10 = 138543874;
    objc_super v11 = v6;
    __int16 v12 = 2114;
    v13 = v7;
    __int16 v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting QoS of state node %{public}@ to %{public}@", (uint8_t *)&v10, 0x20u);
  }
  v9 = [(PLLibraryServicesStateNode *)self operationQueue];
  [v9 setQualityOfService:v4];
}

- (void)setOperationQueue:(id)a3
{
  uint64_t v4 = (NSOperationQueue *)a3;
  os_unfair_lock_lock(&self->_operationQueueLock);
  operationQueue = self->_operationQueue;
  self->_operationQueue = v4;

  os_unfair_lock_unlock(&self->_operationQueueLock);
}

- (id)operationQueue
{
  p_operationQueueLock = &self->_operationQueueLock;
  os_unfair_lock_lock(&self->_operationQueueLock);
  uint64_t v4 = self->_operationQueue;
  os_unfair_lock_unlock(p_operationQueueLock);
  return v4;
}

- (PLLibraryServicesStateNode)initWithLibraryServicesState:(int64_t)a3 qualityOfService:(unsigned int)a4 logPrefix:(id)a5
{
  id v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)PLLibraryServicesStateNode;
  v9 = [(PLLibraryServicesStateNode *)&v22 init];
  int v10 = v9;
  if (v9)
  {
    v9->_state = a3;
    v9->_qos = a4;
    uint64_t v11 = [v8 copy];
    logPrefix = v10->_logPrefix;
    v10->_logPrefix = (NSString *)v11;

    v10->_operationQueueLock._os_unfair_lock_opaque = 0;
    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v10->_operationQueue;
    v10->_operationQueue = v13;

    v15 = NSString;
    uint64_t v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = PLStringFromLibraryServicesState(a3);
    v19 = [v15 stringWithFormat:@"%@(%@: %@)", v17, v8, v18];
    [(NSOperationQueue *)v10->_operationQueue setName:v19];

    [(NSOperationQueue *)v10->_operationQueue setSuspended:1];
    [(NSOperationQueue *)v10->_operationQueue setMaxConcurrentOperationCount:1];
    if ((int)a4 <= 20)
    {
      if (a4 && a4 != 17) {
        goto LABEL_11;
      }
    }
    else if (a4 != 21)
    {
      if (a4 == 25)
      {
        uint64_t v20 = 25;
        goto LABEL_12;
      }
      if (a4 == 33)
      {
        uint64_t v20 = 33;
LABEL_12:
        [(NSOperationQueue *)v10->_operationQueue setQualityOfService:v20];
        goto LABEL_13;
      }
LABEL_11:
      uint64_t v20 = 9;
      goto LABEL_12;
    }
    uint64_t v20 = 17;
    goto LABEL_12;
  }
LABEL_13:

  return v10;
}

+ (void)removeOperationCountObserver:(id)a3 fromObservedObject:(id)a4 context:(void *)a5
{
}

@end