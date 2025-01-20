@interface SDAirDropTransferManager
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (NSArray)kvoObservingKeys;
- (NSMutableDictionary)transferIdentifierToHandler;
- (NSMutableDictionary)transferIdentifierToTransfer;
- (SDAirDropAlertManagerDelegate)classroomDelegate;
- (SDAirDropAlertManagerDelegate)delegate;
- (SDAirDropTransferManager)init;
- (id)exportedInterface;
- (id)itemTypesForTransfer:(id)a3;
- (id)machServiceName;
- (id)remoteObjectInterface;
- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3;
- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4;
- (void)activate;
- (void)askEventForRecordID:(id)a3 withResults:(id)a4;
- (void)cancelEventForRecordID:(id)a3 withResults:(id)a4;
- (void)cleanUpTransfer:(id)a3;
- (void)cleanUpURL:(id)a3;
- (void)connectionEstablished:(id)a3;
- (void)connectionInvalidated:(id)a3;
- (void)errorEventForRecordID:(id)a3 withResults:(id)a4;
- (void)failTransfer:(id)a3 withState:(unint64_t)a4 failureReason:(unint64_t)a5;
- (void)finishedEventForRecordID:(id)a3 withResults:(id)a4;
- (void)handlerFailedForTransfer:(id)a3;
- (void)invalidate;
- (void)loadAllPersistedTransfers;
- (void)notifyObserversOfRemovedTransfer:(id)a3;
- (void)notifyObserversOfUpdatedTransfer:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)progressEventForRecordID:(id)a3 withResults:(id)a4;
- (void)removeTransfer:(id)a3 shouldCleanup:(BOOL)a4;
- (void)setClassroomDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandler:(id)a3 forTransfer:(id)a4;
- (void)setKvoObservingKeys:(id)a3;
- (void)setTransferIdentifierToHandler:(id)a3;
- (void)setTransferIdentifierToTransfer:(id)a3;
- (void)setTransferState:(unint64_t)a3 forTransfer:(id)a4 shouldNotify:(BOOL)a5;
- (void)setTransferState:(unint64_t)a3 forTransfer:(id)a4 shouldNotify:(BOOL)a5 shouldCleanup:(BOOL)a6;
- (void)transfer:(id)a3 actionTriggeredForAction:(id)a4;
- (void)transferUserResponseUpdated:(id)a3;
@end

@implementation SDAirDropTransferManager

- (SDAirDropTransferManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)SDAirDropTransferManager;
  v2 = [(SDXPCDaemon *)&v12 init];
  if (v2)
  {
    v3 = NSStringFromSelector("userResponse");
    v13[0] = v3;
    v4 = NSStringFromSelector("needsAction");
    v13[1] = v4;
    uint64_t v5 = +[NSArray arrayWithObjects:v13 count:2];
    kvoObservingKeys = v2->_kvoObservingKeys;
    v2->_kvoObservingKeys = (NSArray *)v5;

    uint64_t v7 = objc_opt_new();
    transferIdentifierToTransfer = v2->_transferIdentifierToTransfer;
    v2->_transferIdentifierToTransfer = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    transferIdentifierToHandler = v2->_transferIdentifierToHandler;
    v2->_transferIdentifierToHandler = (NSMutableDictionary *)v9;

    [(SDAirDropTransferManager *)v2 loadAllPersistedTransfers];
  }
  return v2;
}

- (void)activate
{
  v2.receiver = self;
  v2.super_class = (Class)SDAirDropTransferManager;
  [(SDXPCDaemon *)&v2 _activate];
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)SDAirDropTransferManager;
  [(SDXPCDaemon *)&v2 _invalidate];
}

- (void)_remoteObjectProxyForConnection:(id)a3 usingBlock:(id)a4
{
}

- (void)_enumerateRemoteObjectProxiesUsingBlock:(id)a3
{
}

- (void)notifyObserversOfUpdatedTransfer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100089174;
    v6[3] = &unk_1008CBAE0;
    id v7 = v4;
    [(SDAirDropTransferManager *)self _enumerateRemoteObjectProxiesUsingBlock:v6];
  }
}

- (void)notifyObserversOfRemovedTransfer:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100089218;
  v5[3] = &unk_1008CBAE0;
  id v6 = [a3 copy];
  id v4 = v6;
  [(SDAirDropTransferManager *)self _enumerateRemoteObjectProxiesUsingBlock:v5];
}

- (void)removeTransfer:(id)a3 shouldCleanup:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = airdrop_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 identifier];
    int v14 = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing transfer with id %@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v9 = [(SDAirDropTransferManager *)self transferIdentifierToHandler];
  v10 = [v6 identifier];
  [v9 setObject:0 forKeyedSubscript:v10];

  v11 = [(SDAirDropTransferManager *)self transferIdentifierToTransfer];
  objc_super v12 = [v6 identifier];
  [v11 setObject:0 forKeyedSubscript:v12];

  v13 = [(SDAirDropTransferManager *)self kvoObservingKeys];
  [v6 removeObserver:self forKeyPaths:v13 context:off_100966B08];

  [(SDAirDropTransferManager *)self notifyObserversOfRemovedTransfer:v6];
  if (v4) {
    [(SDAirDropTransferManager *)self cleanUpTransfer:v6];
  }
}

- (void)cleanUpTransfer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cleaning up transfer with id %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = +[SDAirDropHandler transferURLForTransfer:v4];
  [(SDAirDropTransferManager *)self cleanUpURL:v7];
}

- (void)askEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)SFAirDropTransfer) initWithIdentifier:v6 initialInformation:v7];
  [v8 updateWithInformation:v7];
  uint64_t v9 = [(SDAirDropTransferManager *)self itemTypesForTransfer:v8];
  v10 = [v8 metaData];
  [v10 setItems:v9];

  v11 = airdrop_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = [v8 identifier];
    v13 = [v8 metaData];
    int v14 = [v13 items];
    int v25 = 138543874;
    v26 = v12;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Transfer: %{public}@]: New incoming transfer %@ with items: %@", (uint8_t *)&v25, 0x20u);
  }
  id v15 = +[SFAirDropTransferTestingSnapshot writeSnapshotForTransfer:v8 initialInfo:v7 name:@"before_handler" error:0];
  v16 = [(SDAirDropTransferManager *)self transferIdentifierToTransfer];
  [v16 setObject:v8 forKeyedSubscript:v6];

  v17 = +[SDAirDropHandlerFactory handlerForTransfer:v8];
  v18 = [(SDAirDropTransferManager *)self kvoObservingKeys];
  [v8 addObserver:self forKeyPaths:v18 options:0 context:off_100966B08];

  if (v17)
  {
    [(SDAirDropTransferManager *)self setHandler:v17 forTransfer:v8];
    v19 = [v8 metaData];
    if ([v19 canAutoAccept])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v21 = [v8 metaData];
        [v21 setDidAutoAccept:1];

        [(SDAirDropTransferManager *)self setTransferState:1 forTransfer:v8 shouldNotify:0];
        v22 = [v8 possibleActions];
        v23 = [v22 firstObject];
        [(SDAirDropTransferManager *)self transfer:v8 actionTriggeredForAction:v23];

LABEL_10:
        id v24 = +[SFAirDropTransferTestingSnapshot writeSnapshotForTransfer:v8 initialInfo:v7 name:@"after_handler" error:0];
        goto LABEL_11;
      }
    }
    else
    {
    }
    [(SDAirDropTransferManager *)self setTransferState:1 forTransfer:v8 shouldNotify:1];
    goto LABEL_10;
  }
  [(SDAirDropTransferManager *)self failTransfer:v8 withState:9 failureReason:2];
LABEL_11:
}

- (void)progressEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SDAirDropTransferManager *)self transferIdentifierToTransfer];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    [v9 updateWithInformation:v7];
    if ([v9 transferState] == (id)1) {
      [(SDAirDropTransferManager *)self setTransferState:2 forTransfer:v9 shouldNotify:1];
    }
  }
  else
  {
    v10 = airdrop_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10008B734();
    }
  }
}

- (void)cancelEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SDAirDropTransferManager *)self transferIdentifierToTransfer];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    [v9 updateWithInformation:v7];
    [(SDAirDropTransferManager *)self failTransfer:v9 withState:3 failureReason:1];
  }
  else
  {
    v10 = airdrop_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10008B79C();
    }
  }
}

- (void)errorEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SDAirDropTransferManager *)self transferIdentifierToTransfer];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  v10 = airdrop_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v9)
  {
    if (v11) {
      sub_10008B86C();
    }

    [v9 updateWithInformation:v7];
    [(SDAirDropTransferManager *)self failTransfer:v9 withState:9 failureReason:1];
  }
  else
  {
    if (v11) {
      sub_10008B804();
    }
  }
}

- (void)finishedEventForRecordID:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SDAirDropTransferManager *)self transferIdentifierToTransfer];
  uint64_t v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    [v9 updateWithInformation:v7];
    [(SDAirDropTransferManager *)self setTransferState:4 forTransfer:v9 shouldNotify:1];
  }
  else
  {
    v10 = airdrop_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10008B914();
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  objc_super v12 = v11;
  if (off_100966B08 == a6)
  {
    id v13 = v11;
    int v14 = NSStringFromSelector("userResponse");
    unsigned int v15 = [v10 isEqual:v14];

    if (v15)
    {
      [(SDAirDropTransferManager *)self transferUserResponseUpdated:v13];
    }
    else
    {
      v16 = NSStringFromSelector("needsAction");
      unsigned int v17 = [v10 isEqual:v16];

      if (v17) {
        [(SDAirDropTransferManager *)self notifyObserversOfUpdatedTransfer:v13];
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SDAirDropTransferManager;
    [(SDAirDropTransferManager *)&v18 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
  }
}

- (void)transferUserResponseUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userResponse];
  id v6 = airdrop_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = SFAirDropTransferUserResponseToString();
    id v8 = [v4 identifier];
    *(_DWORD *)buf = 138412546;
    v32 = v7;
    __int16 v33 = 2112;
    v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User response: %@ for transfer with id %@", buf, 0x16u);
  }
  switch((unint64_t)v5)
  {
    case 0uLL:
      break;
    case 1uLL:
      uint64_t v9 = [(SDAirDropTransferManager *)self transferIdentifierToHandler];
      id v10 = [v4 identifier];
      id v11 = [v9 objectForKeyedSubscript:v10];

      objc_super v12 = [v4 customDestinationURL];
      if (objc_opt_respondsToSelector()) {
        id v13 = [v11 shouldExtractMediaFromPhotosBundles];
      }
      else {
        id v13 = 0;
      }
      v19 = [(SDAirDropTransferManager *)self delegate];
      v20 = [v4 identifier];
      [v19 alertManager:self acceptingTransferWithRecordID:v20 withDestinationURL:v12 shouldExtractMediaFromPhotosBundlesForRecordID:v13];

      v21 = [(SDAirDropTransferManager *)self classroomDelegate];
      v22 = [v4 identifier];
      [v21 alertManager:self acceptingTransferWithRecordID:v22 withDestinationURL:v12 shouldExtractMediaFromPhotosBundlesForRecordID:v13];

      [(SDAirDropTransferManager *)self notifyObserversOfUpdatedTransfer:v4];
      break;
    case 2uLL:
      unsigned int v15 = [(SDAirDropTransferManager *)self delegate];
      v16 = [v4 identifier];
      [v15 alertManager:self cancelingTransferWithRecordID:v16 withFailureReason:[v4 failureReason]];

      unsigned int v17 = [(SDAirDropTransferManager *)self classroomDelegate];
      objc_super v18 = [v4 identifier];
      [v17 alertManager:self cancelingTransferWithRecordID:v18 withFailureReason:[v4 failureReason]];

      [(SDAirDropTransferManager *)self removeTransfer:v4 shouldCleanup:1];
      break;
    case 3uLL:
      if ([v4 transferState] == (id)7) {
        [(SDAirDropTransferManager *)self setTransferState:8 forTransfer:v4 shouldNotify:1 shouldCleanup:1];
      }
      break;
    default:
      int v14 = airdrop_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10008B97C(v14);
      }

      break;
  }
  uint64_t v23 = [v4 metaData];
  if (v23)
  {
    id v24 = (void *)v23;
    int v25 = [v4 metaData];
    unsigned int v26 = [v25 transferTypes];

    if ((v26 & 0x40000) != 0)
    {
      if ([v4 userResponse])
      {
        __int16 v27 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 userResponse:@"response"]);
        v30 = v27;
        id v28 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

        SFMetricsLog();
      }
    }
  }
}

- (void)transfer:(id)a3 actionTriggeredForAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SDAirDropTransferManager *)self transferIdentifierToHandler];
  uint64_t v9 = [v6 identifier];
  id v10 = [v8 objectForKeyedSubscript:v9];

  if (v10)
  {
    [v10 actionSelected:v7];
  }
  else
  {
    id v11 = airdrop_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10008B9C0();
    }
  }
}

- (id)machServiceName
{
  return @"com.apple.sharing.transfer-observer";
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SDAirDropTransferManagerProtocol];
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SFAirDropTransferObserverProtocol];
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  return 1;
}

- (void)connectionEstablished:(id)a3
{
  id v4 = a3;
  id v5 = airdrop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 sd_description];
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "New connection established %@", buf, 0xCu);
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008A268;
  v7[3] = &unk_1008CBB08;
  v7[4] = self;
  [(SDAirDropTransferManager *)self _remoteObjectProxyForConnection:v4 usingBlock:v7];
}

- (void)connectionInvalidated:(id)a3
{
  id v3 = a3;
  id v4 = airdrop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 sd_description];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Connection invalidated %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)setHandler:(id)a3 forTransfer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = airdrop_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 identifier];
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    *(_DWORD *)buf = 138543618;
    int v25 = v9;
    __int16 v26 = 2112;
    __int16 v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Transfer: %{public}@] Setting handler of class %@", buf, 0x16u);
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10008A65C;
  v22[3] = &unk_1008CBB58;
  v22[4] = self;
  id v12 = v7;
  id v23 = v12;
  [v6 setUpdateTransferStateHandler:v22];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  objc_super v18 = sub_10008A724;
  v19 = &unk_1008CBBD0;
  v20 = self;
  id v21 = v12;
  id v13 = v12;
  [v6 setCompletionHandler:&v16];
  [v6 activate:v16, v17, v18, v19, v20];
  int v14 = [(SDAirDropTransferManager *)self transferIdentifierToHandler];
  unsigned int v15 = [v13 identifier];
  [v14 setObject:v6 forKeyedSubscript:v15];
}

- (void)handlerFailedForTransfer:(id)a3
{
  id v4 = a3;
  id v5 = [(SDAirDropTransferManager *)self transferIdentifierToHandler];
  id v6 = [v4 identifier];
  id v7 = [v5 objectForKeyedSubscript:v6];

  id v8 = airdrop_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10008BA4C((uint64_t)v7, v4);
  }

  uint64_t v9 = [[SDAirDropHandleriCloudDrive alloc] initWithTransfer:v4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || ![(SDAirDropHandleriCloudDrive *)v9 canHandleTransfer])
  {
    [(SDAirDropTransferManager *)self failTransfer:v4 withState:9 failureReason:3];
  }
  else
  {
    [(SDAirDropTransferManager *)self setHandler:v9 forTransfer:v4];
    id v10 = [(SDAirDropTransferManager *)self transferIdentifierToHandler];
    id v11 = [v4 identifier];
    id v12 = [v10 objectForKeyedSubscript:v11];
    [v12 transferUpdated];

    [(SDAirDropTransferManager *)self notifyObserversOfUpdatedTransfer:v4];
  }
}

- (void)failTransfer:(id)a3 withState:(unint64_t)a4 failureReason:(unint64_t)a5
{
  id v9 = a3;
  if (a4 != 3 && a4 != 9)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    id v11 = SFAirDropTransferStateToString();
    [v10 handleFailureInMethod:a2, self, @"SDAirDropTransferManager.m", 364, @"Failing transfer with invalid state: %@", v11 object file lineNumber description];
  }
  id v12 = airdrop_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10008BAF0();
  }

  [v9 setFailureReason:a5];
  id v13 = off_1008C68D0;
  if (a5 != 2) {
    id v13 = off_1008C68C8;
  }
  id v14 = [objc_alloc(*v13) initWithTransfer:v9];
  [(SDAirDropTransferManager *)self setHandler:v14 forTransfer:v9];
  [v14 setCompletionHandler:&stru_1008CBC10];
  [(SDAirDropTransferManager *)self setTransferState:a4 forTransfer:v9 shouldNotify:1];
}

- (void)setTransferState:(unint64_t)a3 forTransfer:(id)a4 shouldNotify:(BOOL)a5
{
}

- (void)setTransferState:(unint64_t)a3 forTransfer:(id)a4 shouldNotify:(BOOL)a5 shouldCleanup:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = airdrop_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10008BBA0();
  }

  [v10 setTransferState:a3];
  id v12 = [(SDAirDropTransferManager *)self transferIdentifierToHandler];
  id v13 = [v10 identifier];
  id v14 = [v12 objectForKeyedSubscript:v13];
  [v14 transferUpdated];

  if (v7) {
    [(SDAirDropTransferManager *)self notifyObserversOfUpdatedTransfer:v10];
  }
  if (v6) {
    [(SDAirDropTransferManager *)self removeTransfer:v10 shouldCleanup:1];
  }
}

- (void)cleanUpURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = airdrop_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 path];
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cleaning up URL %@", buf, 0xCu);
    }
    BOOL v6 = +[NSFileManager defaultManager];
    id v10 = 0;
    unsigned __int8 v7 = [v6 removeItemAtURL:v3 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0)
    {
      id v9 = airdrop_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10008BC84();
      }
    }
  }
}

- (void)loadAllPersistedTransfers
{
  objc_super v2 = airdrop_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Loading all persisted transfers", buf, 2u);
  }

  id v3 = +[NSFileManager defaultManager];
  id v4 = +[SDAirDropHandler persistedTransfersBaseURL];
  if (v4)
  {
    v28[0] = NSURLIsDirectoryKey;
    v28[1] = NSURLIsReadableKey;
    id v5 = +[NSArray arrayWithObjects:v28 count:2];
    v16 = v4;
    uint64_t v17 = v3;
    BOOL v6 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:v5 options:7 errorHandler:0];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v11);
          id v20 = 0;
          [v12 getResourceValue:&v20 forKey:NSURLIsDirectoryKey error:0];
          id v13 = v20;
          id v19 = 0;
          [v12 getResourceValue:&v19 forKey:NSURLIsReadableKey error:0];
          id v14 = v19;
          if ([v13 BOOLValue] && objc_msgSend(v14, "BOOLValue"))
          {
            unsigned int v15 = airdrop_log();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              __int16 v26 = v12;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Receive data at %@ is not valid", buf, 0xCu);
            }

            [(SDAirDropTransferManager *)self cleanUpURL:v12];
          }

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v9);
    }

    id v4 = v16;
    id v3 = v17;
  }
}

- (id)itemTypesForTransfer:(id)a3
{
  id v3 = a3;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10008B4A8;
  v42[3] = &unk_1008CBC38;
  id v31 = (id)objc_opt_new();
  id v43 = v31;
  id v4 = objc_retainBlock(v42);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v32 = v3;
  id v5 = [v3 metaData];
  BOOL v6 = [v5 rawFiles];

  id v7 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v39;
    uint64_t v10 = kSFOperationFileTypeKey;
    uint64_t v11 = kSFOperationtFileSubTypeKey;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v14 = [v13 objectForKeyedSubscript:v10];
        unsigned int v15 = [v13 objectForKeyedSubscript:v11];
        ((void (*)(void *, void *, void *, uint64_t))v4[2])(v4, v14, v15, 1);
      }
      id v8 = [v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v8);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [v32 completedURLs];
  id v16 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v35;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
        if (([v20 isFileURL] & 1) == 0)
        {
          long long v21 = +[LSApplicationWorkspace defaultWorkspace];
          long long v22 = [v21 URLOverrideForURL:v20];

          long long v23 = +[LSApplicationWorkspace defaultWorkspace];
          long long v24 = [v23 applicationsAvailableForOpeningURL:v20];

          int v25 = [v24 firstObject];
          __int16 v26 = [v25 applicationIdentifier];

          if (v26)
          {
            ((void (*)(void *, void *, void, void))v4[2])(v4, v26, 0, 0);
          }
          else
          {
            __int16 v27 = [v22 scheme];
            ((void (*)(void *, void *, void, void))v4[2])(v4, v27, 0, 0);
          }
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v17);
  }

  id v28 = [v31 allValues];
  uint64_t v29 = +[NSSet setWithArray:v28];

  return v29;
}

- (SDAirDropAlertManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (SDAirDropAlertManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SDAirDropAlertManagerDelegate)classroomDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_classroomDelegate);

  return (SDAirDropAlertManagerDelegate *)WeakRetained;
}

- (void)setClassroomDelegate:(id)a3
{
}

- (NSMutableDictionary)transferIdentifierToTransfer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTransferIdentifierToTransfer:(id)a3
{
}

- (NSMutableDictionary)transferIdentifierToHandler
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTransferIdentifierToHandler:(id)a3
{
}

- (NSArray)kvoObservingKeys
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKvoObservingKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvoObservingKeys, 0);
  objc_storeStrong((id *)&self->_transferIdentifierToHandler, 0);
  objc_storeStrong((id *)&self->_transferIdentifierToTransfer, 0);
  objc_destroyWeak((id *)&self->_classroomDelegate);

  objc_destroyWeak((id *)&self->delegate);
}

@end