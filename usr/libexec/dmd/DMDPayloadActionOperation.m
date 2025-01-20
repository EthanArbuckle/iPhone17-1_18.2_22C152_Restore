@interface DMDPayloadActionOperation
+ (id)sharedDeclarationOperationQueue;
- (BOOL)isAsynchronous;
- (BOOL)isReady;
- (BOOL)requiresNetworkTether;
- (BOOL)requiresUnlockedKeychain;
- (DMDConfigurationDatabase)database;
- (DMDDeviceStateProvider)deviceStateProvider;
- (DMDPayloadActionOperation)init;
- (DMDPayloadActionOperation)initWithDatabase:(id)a3 payloadMetadataObjectID:(id)a4 payloadIdentifier:(id)a5;
- (DMDPayloadContext)payloadContext;
- (DMDTaskOperationProvider)taskOperationProvider;
- (NSManagedObjectID)payloadMetadataObjectID;
- (NSMutableArray)subOperations;
- (NSMutableDictionary)stateDictionary;
- (NSString)payloadIdentifier;
- (OS_os_transaction)transaction;
- (void)addStatusEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)endOperationMarkingPayloadMetadata:(id)a3 failedWithError:(id)a4;
- (void)endOperationWithPayloadMetadata:(id)a3;
- (void)enqueueOperation:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)operationWillStart;
- (void)performBackgroundContextBlock:(id)a3;
- (void)setDeviceStateProvider:(id)a3;
- (void)setPayloadContext:(id)a3;
- (void)setRequiresNetworkTether:(BOOL)a3;
- (void)setRequiresUnlockedKeychain:(BOOL)a3;
- (void)setStateDictionary:(id)a3;
- (void)setSubOperations:(id)a3;
- (void)setTaskOperationProvider:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation DMDPayloadActionOperation

+ (id)sharedDeclarationOperationQueue
{
  if (qword_1000FBC60 != -1) {
    dispatch_once(&qword_1000FBC60, &stru_1000CBA98);
  }
  v2 = (void *)qword_1000FBC58;

  return v2;
}

- (void)dealloc
{
  [(DMDDeviceStateProvider *)self->_deviceStateProvider removeObserver:self forKeyPath:@"isNetworkTethered"];
  [(DMDDeviceStateProvider *)self->_deviceStateProvider removeObserver:self forKeyPath:@"isKeychainUnlocked"];
  v3 = self->_transaction;
  dispatch_time_t v4 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = nullsub_3;
  block[3] = &unk_1000CA508;
  v8 = v3;
  v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

  v6.receiver = self;
  v6.super_class = (Class)DMDPayloadActionOperation;
  [(DMDPayloadActionOperation *)&v6 dealloc];
}

- (DMDPayloadActionOperation)init
{
  v8.receiver = self;
  v8.super_class = (Class)DMDPayloadActionOperation;
  v2 = [(DMDPayloadActionOperation *)&v8 init];
  v3 = v2;
  if (v2)
  {
    id v4 = [(DMDPayloadActionOperation *)v2 description];
    [v4 UTF8String];
    uint64_t v5 = os_transaction_create();
    transaction = v3->_transaction;
    v3->_transaction = (OS_os_transaction *)v5;
  }
  return v3;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isReady
{
  v8.receiver = self;
  v8.super_class = (Class)DMDPayloadActionOperation;
  if (![(DMDPayloadActionOperation *)&v8 isReady]) {
    return 0;
  }
  if ([(DMDPayloadActionOperation *)self requiresUnlockedKeychain])
  {
    v3 = [(DMDPayloadActionOperation *)self deviceStateProvider];
    unsigned int v4 = [v3 isKeychainUnlocked];

    if (!v4) {
      return 0;
    }
  }
  if (![(DMDPayloadActionOperation *)self requiresNetworkTether]) {
    return 1;
  }
  uint64_t v5 = [(DMDPayloadActionOperation *)self deviceStateProvider];
  unsigned __int8 v6 = [v5 isNetworkTethered];

  return v6;
}

- (void)operationWillStart
{
  [(DMDPayloadActionOperation *)self setDeviceStateProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)DMDPayloadActionOperation;
  [(DMDPayloadActionOperation *)&v3 operationWillStart];
}

- (void)setDeviceStateProvider:(id)a3
{
  unsigned int v4 = (DMDDeviceStateProvider *)a3;
  [(DMDDeviceStateProvider *)self->_deviceStateProvider removeObserver:self forKeyPath:@"isNetworkTethered"];
  [(DMDDeviceStateProvider *)self->_deviceStateProvider removeObserver:self forKeyPath:@"isKeychainUnlocked"];
  deviceStateProvider = self->_deviceStateProvider;
  self->_deviceStateProvider = v4;
  unsigned __int8 v6 = v4;

  [(DMDDeviceStateProvider *)self->_deviceStateProvider addObserver:self forKeyPath:@"isKeychainUnlocked" options:0 context:"DMDPayloadActionOperationObservationContext"];
  [(DMDDeviceStateProvider *)self->_deviceStateProvider addObserver:self forKeyPath:@"isNetworkTethered" options:0 context:"DMDPayloadActionOperationObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == "DMDPayloadActionOperationObservationContext")
  {
    [(DMDPayloadActionOperation *)self willChangeValueForKey:@"isReady", a4, a5];
    [(DMDPayloadActionOperation *)self didChangeValueForKey:@"isReady"];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DMDPayloadActionOperation;
    -[DMDPayloadActionOperation observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (DMDPayloadActionOperation)initWithDatabase:(id)a3 payloadMetadataObjectID:(id)a4 payloadIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)DMDPayloadActionOperation;
  v12 = [(DMDPayloadActionOperation *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_database, a3);
    v14 = (NSManagedObjectID *)[v10 copy];
    payloadMetadataObjectID = v13->_payloadMetadataObjectID;
    v13->_payloadMetadataObjectID = v14;

    v16 = (NSString *)[v11 copy];
    payloadIdentifier = v13->_payloadIdentifier;
    v13->_payloadIdentifier = v16;

    uint64_t v18 = objc_opt_new();
    stateDictionary = v13->_stateDictionary;
    v13->_stateDictionary = (NSMutableDictionary *)v18;
  }
  return v13;
}

- (DMDPayloadContext)payloadContext
{
  payloadContext = self->_payloadContext;
  if (!payloadContext)
  {
    unsigned int v4 = (DMDPayloadContext *)objc_opt_new();
    uint64_t v5 = self->_payloadContext;
    self->_payloadContext = v4;

    payloadContext = self->_payloadContext;
  }

  return payloadContext;
}

- (void)performBackgroundContextBlock:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2, self, @"DMDPayloadActionOperation.m", 123, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  unsigned __int8 v6 = [(DMDPayloadActionOperation *)self database];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10005FEE4;
  v9[3] = &unk_1000CA778;
  id v10 = v5;
  id v7 = v5;
  [v6 performBackgroundTask:v9];
}

- (void)enqueueOperation:(id)a3
{
  id v4 = a3;
  id v5 = [(DMDPayloadActionOperation *)self subOperations];

  if (!v5)
  {
    unsigned __int8 v6 = objc_opt_new();
    [(DMDPayloadActionOperation *)self setSubOperations:v6];
  }
  id v7 = [(DMDPayloadActionOperation *)self subOperations];
  [v7 addObject:v4];

  id v8 = [(id)objc_opt_class() sharedDeclarationOperationQueue];
  [v8 addOperation:v4];
}

- (void)addStatusEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(DMDPayloadActionOperation *)self stateDictionary];
  [v5 addEntriesFromDictionary:v4];
}

- (void)endOperationMarkingPayloadMetadata:(id)a3 failedWithError:(id)a4
{
  id v7 = +[NSAssertionHandler currentHandler];
  unsigned __int8 v6 = NSStringFromSelector(a2);
  [v7 handleFailureInMethod:a2, self, @"DMDPayloadActionOperation.m", 142, @"%@ must be implemented by subclasses", v6 object file lineNumber description];
}

- (void)endOperationWithPayloadMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(DMDPayloadActionOperation *)self stateDictionary];
  [v4 setStateDictionary:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned __int8 v6 = [v4 incomingPayloadMetadataReferences];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v11 updateStateDictionaryIfNeeded];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v12 = [v4 managedObjectContext];
  id v15 = 0;
  unsigned __int8 v13 = [v12 save:&v15];
  id v14 = v15;

  if (v13) {
    [(DMDPayloadActionOperation *)self endOperationWithResultObject:0];
  }
  else {
    [(DMDPayloadActionOperation *)self endOperationWithError:v14];
  }
}

- (BOOL)requiresNetworkTether
{
  return self->_requiresNetworkTether;
}

- (void)setRequiresNetworkTether:(BOOL)a3
{
  self->_requiresNetworkTether = a3;
}

- (BOOL)requiresUnlockedKeychain
{
  return self->_requiresUnlockedKeychain;
}

- (void)setRequiresUnlockedKeychain:(BOOL)a3
{
  self->_requiresUnlockedKeychain = a3;
}

- (DMDDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (DMDTaskOperationProvider)taskOperationProvider
{
  return self->_taskOperationProvider;
}

- (void)setTaskOperationProvider:(id)a3
{
}

- (DMDConfigurationDatabase)database
{
  return self->_database;
}

- (NSManagedObjectID)payloadMetadataObjectID
{
  return self->_payloadMetadataObjectID;
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadContext:(id)a3
{
}

- (NSMutableArray)subOperations
{
  return self->_subOperations;
}

- (void)setSubOperations:(id)a3
{
}

- (NSMutableDictionary)stateDictionary
{
  return self->_stateDictionary;
}

- (void)setStateDictionary:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_stateDictionary, 0);
  objc_storeStrong((id *)&self->_subOperations, 0);
  objc_storeStrong((id *)&self->_payloadContext, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_payloadMetadataObjectID, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_taskOperationProvider, 0);

  objc_storeStrong((id *)&self->_deviceStateProvider, 0);
}

@end