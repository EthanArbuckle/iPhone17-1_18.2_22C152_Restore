@interface STConduit
- (BOOL)isInvalid;
- (BOOL)isResumed;
- (NSOperationQueue)operationQueue;
- (NSString)organizationIdentifier;
- (STConduit)initWithOrganizationIdentifier:(id)a3 transport:(id)a4 localTransport:(id)a5 persistenceController:(id)a6;
- (STConduitDelegate)delegate;
- (STPersistenceControllerProtocol)persistenceController;
- (STTransportPayloadManager)payloadManager;
- (void)_finishInvalidating;
- (void)dealloc;
- (void)enqueueTransportPayload:(id)a3;
- (void)invalidate;
- (void)payloadManager:(id)a3 didDeliverPayload:(id)a4;
- (void)payloadManager:(id)a3 didReceivePayload:(id)a4;
- (void)payloadManagerDidInvalidate:(id)a3;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setInvalid:(BOOL)a3;
- (void)setPayloadManager:(id)a3;
- (void)setResumed:(BOOL)a3;
@end

@implementation STConduit

- (STConduit)initWithOrganizationIdentifier:(id)a3 transport:(id)a4 localTransport:(id)a5 persistenceController:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)STConduit;
  v14 = [(STConduit *)&v23 init];
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    organizationIdentifier = v14->_organizationIdentifier;
    v14->_organizationIdentifier = v15;

    objc_storeStrong((id *)&v14->_persistenceController, a6);
    uint64_t v17 = objc_opt_new();
    operationQueue = v14->_operationQueue;
    v14->_operationQueue = (NSOperationQueue *)v17;

    [(NSOperationQueue *)v14->_operationQueue setMaxConcurrentOperationCount:1];
    v19 = +[NSString stringWithFormat:@"com.apple.ScreenTimeAgent.conduit (%@)", v10];
    [(NSOperationQueue *)v14->_operationQueue setName:v19];

    v20 = [[STTransportPayloadManager alloc] initWithTransport:v11 localTransport:v12 persistenceController:v13];
    payloadManager = v14->_payloadManager;
    v14->_payloadManager = v20;

    [(STTransportPayloadManager *)v14->_payloadManager setDelegate:v14];
  }

  return v14;
}

- (void)dealloc
{
  if (![(STConduit *)self isInvalid])
  {
    v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:a2, self, @"STConduit.m", 53, @"%@ must be invalidated before it's deallocated", self object file lineNumber description];
  }
  v5.receiver = self;
  v5.super_class = (Class)STConduit;
  [(STConduit *)&v5 dealloc];
}

- (void)resume
{
  if ([(STConduit *)self isInvalid])
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"STConduit.m", 59, @"Invalid parameter not satisfying: %@", @"!self.isInvalid" object file lineNumber description];
  }
  [(STConduit *)self setResumed:1];
  v4 = [(STConduit *)self operationQueue];
  [v4 setSuspended:0];

  objc_super v5 = [(STConduit *)self payloadManager];
  [v5 resume];

  v6 = +[STLog conduit];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ : Resumed", buf, 0xCu);
  }
}

- (void)invalidate
{
  v3 = +[STLog conduit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ : Invalidating", (uint8_t *)&v7, 0xCu);
  }

  [(STConduit *)self setInvalid:1];
  v4 = [(STConduit *)self operationQueue];
  [v4 setSuspended:1];

  objc_super v5 = [(STConduit *)self payloadManager];

  if (v5)
  {
    v6 = [(STConduit *)self payloadManager];
    [v6 invalidate];
  }
  else
  {
    [(STConduit *)self _finishInvalidating];
  }
}

- (void)enqueueTransportPayload:(id)a3
{
  id v4 = a3;
  id v5 = [(STConduit *)self payloadManager];
  [v5 enqueuePayload:v4];
}

- (void)_finishInvalidating
{
  v3 = +[STLog conduit];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidated: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(STConduit *)self delegate];
  [v4 conduitDidInvalidate:self];
}

- (void)payloadManager:(id)a3 didReceivePayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[STLog conduit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Payload manager “%{public}@” received payload “%{public}@”", (uint8_t *)&v10, 0x16u);
  }

  v9 = [(STConduit *)self delegate];
  [v9 conduit:self didReceiveTransportPayload:v7];
}

- (void)payloadManager:(id)a3 didDeliverPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[STLog conduit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 UUID];
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Payload manager “%{public}@” delivered payload “%{public}@”", (uint8_t *)&v11, 0x16u);
  }
  int v10 = [(STConduit *)self delegate];
  [v10 conduit:self didDeliverTransportPayload:v7];
}

- (void)payloadManagerDidInvalidate:(id)a3
{
  id v4 = a3;
  int v5 = +[STLog conduit];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Payload manager did invalidate: %@", (uint8_t *)&v6, 0xCu);
  }

  if ([(STConduit *)self isInvalid])
  {
    [(STConduit *)self setPayloadManager:0];
    [(STConduit *)self _finishInvalidating];
  }
}

- (STConduitDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STConduitDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (BOOL)isInvalid
{
  return self->_invalid;
}

- (void)setInvalid:(BOOL)a3
{
  self->_invalid = a3;
}

- (BOOL)isResumed
{
  return self->_resumed;
}

- (void)setResumed:(BOOL)a3
{
  self->_resumed = a3;
}

- (STPersistenceControllerProtocol)persistenceController
{
  return self->_persistenceController;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (STTransportPayloadManager)payloadManager
{
  return self->_payloadManager;
}

- (void)setPayloadManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadManager, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end