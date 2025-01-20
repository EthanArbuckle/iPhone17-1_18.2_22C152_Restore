@interface SDNetworkOperation
- (NSMutableArray)activities;
- (NSString)description;
- (NSString)kind;
- (NSString)objectKey;
- (OS_xpc_object)boostMessage;
- (OS_xpc_object)connection;
- (SDNetworkOperation)initWithKind:(id)a3;
- (SDNetworkOperationDelegate)delegate;
- (void)airDropConnection:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)airDropController:(id)a3 didChange:(id)a4;
- (void)airDropInformation:(id)a3 didChange:(id)a4;
- (void)airDropServer:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)airDropSession:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)airDropStatus:(id)a3 didChange:(id)a4;
- (void)copyPropertyForKey:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)networkEjecter:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)networkResolver:(id)a3 event:(int64_t)a4 withResults:(id)a5;
- (void)notifyClientWithPosixError:(int64_t)a3;
- (void)resume;
- (void)setActivities:(id)a3;
- (void)setBoostMessage:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setObjectKey:(id)a3;
- (void)setProperty:(void *)a3 forKey:(id)a4;
@end

@implementation SDNetworkOperation

- (SDNetworkOperation)initWithKind:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SDNetworkOperation;
  v6 = [(SDNetworkOperation *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_kind, a3);
    id operation = v7->_operation;
    v7->_id operation = 0;

    connection = v7->_connection;
    v7->_connection = 0;

    v7->_connectionScheduled = 0;
    uint64_t v10 = objc_opt_new();
    activities = v7->_activities;
    v7->_activities = (NSMutableArray *)v10;

    uint64_t v12 = objc_opt_new();
    properties = v7->_properties;
    v7->_properties = (NSMutableDictionary *)v12;

    v7->_sandboxExtensionHandle = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(SDNetworkOperation *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SDNetworkOperation;
  [(SDNetworkOperation *)&v3 dealloc];
}

- (void)setProperty:(void *)a3 forKey:(id)a4
{
  id v7 = a4;
  if (([v7 isEqual:kSFOperationKindKey] & 1) == 0)
  {
    if (([(NSString *)self->_kind isEqual:kSFOperationKindController] & 1) != 0
      || [(NSString *)self->_kind isEqual:kSFOperationKindInformation])
    {
      [self->_operation setProperty:a3 forKey:v7];
    }
    properties = self->_properties;
    if (a3) {
      [(NSMutableDictionary *)properties setObject:a3 forKeyedSubscript:v7];
    }
    else {
      [(NSMutableDictionary *)properties removeObjectForKey:v7];
    }
  }
}

- (void)copyPropertyForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:kSFOperationKindKey])
  {
    id v5 = self->_kind;
  }
  else
  {
    id v5 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:v4];
  }
  v6 = v5;

  return v6;
}

- (void)airDropStatus:(id)a3 didChange:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:12 withResults:v6];
}

- (void)airDropInformation:(id)a3 didChange:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:12 withResults:v6];
}

- (void)airDropController:(id)a3 didChange:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:12 withResults:v6];
}

- (void)airDropSession:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:a4 withResults:v8];
}

- (void)airDropServer:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:a4 withResults:v8];
}

- (void)networkEjecter:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:a4 withResults:v8];
}

- (void)networkResolver:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:a4 withResults:v8];
}

- (void)airDropConnection:(id)a3 event:(int64_t)a4 withResults:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained networkOperation:self event:a4 withResults:v8];
}

- (void)notifyClientWithPosixError:(int64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000F6304;
  v3[3] = &unk_1008CBF30;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)resume
{
  if (![(NSString *)self->_kind isEqual:kSFOperationKindSender])
  {
    if ([(NSString *)self->_kind isEqual:kSFOperationKindListener])
    {
      id v6 = objc_alloc_init(SDAirDropServer);
      id operation = self->_operation;
      self->_id operation = v6;

      connection = self->_connection;
      if (connection)
      {
        [self->_operation setClientPid:xpc_connection_get_pid(connection)];
        v9 = sub_1001B3F50(self->_connection);
        [self->_operation setClientBundleID:v9];
      }
      [self->_operation setDelegate:self];
      id v10 = self->_operation;
      [v10 activate];
      return;
    }
    if ([(NSString *)self->_kind isEqual:kSFOperationKindReceiver])
    {
      id v11 = self->_operation;
      if (v11)
      {
        if (self->_connectionScheduled)
        {
          if ([v11 accept]) {
            return;
          }
          id v4 = self;
          uint64_t v5 = 1;
          goto LABEL_5;
        }
        self->_connectionScheduled = 1;
        _[v11 schedule];
        return;
      }
      Value = CFDictionaryGetValue((CFDictionaryRef)self->_properties, kSFOperationHTTPServerConnectionKey);
      if (Value)
      {
        v41 = Value;
        CFTypeID v42 = CFGetTypeID(Value);
        if (v42 == _CFHTTPServerConnectionGetTypeID())
        {
          id v57 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSessionIDKey];
          v43 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationContactsOnlyKey];
          v44 = [[SDAirDropConnection alloc] initWithConnection:v41];
          id v45 = self->_operation;
          self->_id operation = v44;

          [self->_operation setContactsOnly:[v43 BOOLValue]];
          [self->_operation setSessionID:v57];
          [self->_operation setDelegate:self];
          [self->_operation start];
LABEL_63:

          goto LABEL_64;
        }
        v49 = airdrop_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_1000F6F88(v49);
        }
      }
      else
      {
        v49 = airdrop_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_1000F6F44(v49);
        }
      }

      return;
    }
    if ([(NSString *)self->_kind isEqual:kSFOperationKindController])
    {
      v18 = SDAirDropController;
LABEL_43:
      id v46 = objc_alloc_init(v18);
      id v47 = self->_operation;
      self->_id operation = v46;

      [self->_operation setDelegate:self];
      id v48 = self->_operation;
      [v48 start];
      return;
    }
    if ([(NSString *)self->_kind isEqual:kSFOperationKindInformation])
    {
      v18 = SDAirDropInformation;
      goto LABEL_43;
    }
    if ([(NSString *)self->_kind isEqual:kSFOperationKindStatus])
    {
      ++dword_1009942C8;
      v18 = SDAirDropStatus;
      goto LABEL_43;
    }
    if ([(NSString *)self->_kind isEqual:kSFOperationKindLogger])
    {
      v50 = objc_alloc_init(SDAirDropLogger);
      id v51 = self->_operation;
      self->_id operation = v50;

      id v57 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSessionIDKey];
      v52 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationProtocolKey];
      [self->_operation logActivityType:v52 sessionID:v57];

LABEL_64:

      return;
    }
    if ([(NSString *)self->_kind isEqual:kSFOperationKindResolver])
    {
      v53 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationNodeKey];

      if (v53)
      {
        id v57 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFlagsKey];
        v43 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationProtocolKey];
        v54 = SDNetworkResolver;
LABEL_62:
        id v55 = [[v54 alloc] initWithNode:v53];
        id v56 = self->_operation;
        self->_id operation = v55;

        [self->_operation setProtocol:v43];
        [self->_operation setDelegate:self];
        [self->_operation setFlags:v57];
        [self->_operation start];
        goto LABEL_63;
      }
    }
    else if ([(NSString *)self->_kind isEqual:kSFOperationKindEjecter])
    {
      v53 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationNodeKey];

      if (v53)
      {
        id v57 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFlagsKey];
        v43 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationProtocolKey];
        v54 = SDNetworkEjecter;
        goto LABEL_62;
      }
    }
    id v4 = self;
    uint64_t v5 = 22;
LABEL_5:
    [(SDNetworkOperation *)v4 notifyClientWithPosixError:v5];
    return;
  }
  id v3 = self->_operation;
  if (v3)
  {
    if ([v3 send]) {
      return;
    }
    id v4 = self;
    uint64_t v5 = 37;
    goto LABEL_5;
  }
  uint64_t v12 = kSFOperationItemsKey;
  v13 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationItemsKey];
  v14 = v13;
  if (v13)
  {
    objc_super v15 = [v13 objectForKeyedSubscript:v12];
    v16 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationNodeKey];

    if (v15) {
      BOOL v17 = v16 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    if (v17)
    {
      [(SDNetworkOperation *)self notifyClientWithPosixError:22];
    }
    else
    {
      id v19 = [v14 mutableCopy];
      [v19 removeObjectForKey:v12];
      v20 = [[SDAirDropSession alloc] initWithPerson:v16 items:v15 sandboxExtensions:v19];
      id v21 = self->_operation;
      self->_id operation = v20;

      id v22 = self->_operation;
      uint64_t v23 = kSFOperationFileIconKey;
      v24 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFileIconKey];
      [v22 setProperty:v24 forKey:v23];

      id v25 = self->_operation;
      uint64_t v26 = kSFOperationSessionIDKey;
      v27 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSessionIDKey];
      [v25 setProperty:v27 forKey:v26];

      id v28 = self->_operation;
      uint64_t v29 = kSFOperationSmallFileIconKey;
      v30 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationSmallFileIconKey];
      [v28 setProperty:v30 forKey:v29];

      id v31 = self->_operation;
      uint64_t v32 = kSFOperationItemsDescriptionKey;
      v33 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationItemsDescriptionKey];
      [v31 setProperty:v33 forKey:v32];

      v34 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationBundleIDKey];
      [self->_operation setClientBundleID:v34];

      id v35 = self->_operation;
      uint64_t v36 = kSFOperationFromShareSheet;
      v37 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:kSFOperationFromShareSheet];
      [v35 setProperty:v37 forKey:v36];

      if (self->_connection)
      {
        xpc_connection_get_audit_token();
        memset(v58, 0, sizeof(v58));
        [self->_operation setAuditToken:v58];
        [self->_operation setClientPid:xpc_connection_get_pid(self->_connection)];
        v38 = [self->_operation clientBundleID];

        if (!v38)
        {
          v39 = sub_1001B3F50(self->_connection);
          [self->_operation setClientBundleID:v39];
        }
      }
      [self->_operation setDelegate:self];
      [self->_operation start];
    }
  }
  else
  {
    [(SDNetworkOperation *)self notifyClientWithPosixError:22];
  }
}

- (void)invalidate
{
  if (self->_operation)
  {
    if ([(NSString *)self->_kind isEqual:kSFOperationKindSender]) {
      goto LABEL_13;
    }
    if ([(NSString *)self->_kind isEqual:kSFOperationKindListener])
    {
      [self->_operation setDelegate:0];
      [self->_operation invalidate];
LABEL_14:
      id operation = self->_operation;
      self->_id operation = 0;

      goto LABEL_15;
    }
    if ([(NSString *)self->_kind isEqual:kSFOperationKindReceiver]
      || [(NSString *)self->_kind isEqual:kSFOperationKindController])
    {
      goto LABEL_13;
    }
    if ([(NSString *)self->_kind isEqual:kSFOperationKindStatus])
    {
      [self->_operation setDelegate:0];
      [self->_operation stop];
      --dword_1009942C8;
      goto LABEL_14;
    }
    if ([(NSString *)self->_kind isEqual:kSFOperationKindInformation]) {
      goto LABEL_13;
    }
    if ([(NSString *)self->_kind isEqual:kSFOperationKindLogger]) {
      goto LABEL_14;
    }
    if ([(NSString *)self->_kind isEqual:kSFOperationKindEjecter]
      || [(NSString *)self->_kind isEqual:kSFOperationKindResolver])
    {
LABEL_13:
      [self->_operation setDelegate:0];
      [self->_operation stop];
      goto LABEL_14;
    }
  }
LABEL_15:
  if (self->_sandboxExtensionHandle)
  {
    sandbox_extension_release();
  }
}

- (NSString)description
{
  if (self->_operation && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = [self->_operation description];
    NSAppendPrintF();
    id v3 = 0;
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)kind
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)objectKey
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setObjectKey:(id)a3
{
}

- (OS_xpc_object)boostMessage
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBoostMessage:(id)a3
{
}

- (NSMutableArray)activities
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setActivities:(id)a3
{
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnection:(id)a3
{
}

- (SDNetworkOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SDNetworkOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_boostMessage, 0);
  objc_storeStrong((id *)&self->_objectKey, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong(&self->_operation, 0);
}

@end