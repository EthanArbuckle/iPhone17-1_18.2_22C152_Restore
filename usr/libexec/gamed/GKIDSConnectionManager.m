@interface GKIDSConnectionManager
+ (id)sharedManager;
- (BOOL)isReady;
- (GKIDSConnectionManager)init;
- (GKIDSConnectionManagerDelegate)delegate;
- (IDSAccountController)gcArcadeAccountController;
- (OS_dispatch_queue)idsDelegateQueue;
- (void)accountController:(id)a3 accountAdded:(id)a4;
- (void)dealloc;
- (void)fetchIDSDataForHandles:(id)a3 service:(id)a4 infoTypes:(unint64_t)a5 performingBlockPerBatch:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setGcArcadeAccountController:(id)a3;
- (void)setIdsDelegateQueue:(id)a3;
@end

@implementation GKIDSConnectionManager

+ (id)sharedManager
{
  if (qword_100329718 != -1) {
    dispatch_once(&qword_100329718, &stru_1002D91C8);
  }
  v2 = (void *)qword_100329720;

  return v2;
}

- (GKIDSConnectionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)GKIDSConnectionManager;
  v2 = [(GKIDSConnectionManager *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.gamed.idsConnectionManager.idsDelegateQueue", 0);
    idsDelegateQueue = v2->_idsDelegateQueue;
    v2->_idsDelegateQueue = (OS_dispatch_queue *)v3;

    v5 = (IDSAccountController *)[objc_alloc((Class)IDSAccountController) initWithService:@"com.apple.private.alloy.arcade"];
    gcArcadeAccountController = v2->_gcArcadeAccountController;
    v2->_gcArcadeAccountController = v5;

    v7 = v2->_gcArcadeAccountController;
    v8 = [(GKIDSConnectionManager *)v2 idsDelegateQueue];
    [(IDSAccountController *)v7 addDelegate:v2 queue:v8];
  }
  return v2;
}

- (void)dealloc
{
  [(IDSAccountController *)self->_gcArcadeAccountController removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)GKIDSConnectionManager;
  [(GKIDSConnectionManager *)&v3 dealloc];
}

- (BOOL)isReady
{
  v2 = [(GKIDSConnectionManager *)self gcArcadeAccountController];
  unsigned __int8 v3 = [v2 _gkIsReadyForService:@"com.apple.private.alloy.arcade"];

  return v3;
}

- (void)fetchIDSDataForHandles:(id)a3 service:(id)a4 infoTypes:(unint64_t)a5 performingBlockPerBatch:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [(GKIDSConnectionManager *)self idsDelegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CBB30;
  block[3] = &unk_1002D91F0;
  id v18 = v10;
  id v19 = v11;
  id v21 = v12;
  unint64_t v22 = a5;
  v20 = self;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(GKIDSConnectionManager *)self idsDelegateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000CBCFC;
  v7[3] = &unk_1002D3B38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = (id)GKOSLoggers();
  }
  v9 = (void *)os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = [v7 serviceName];
    int v13 = 138412290;
    id v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Account added: %@", (uint8_t *)&v13, 0xCu);
  }
  if ([(GKIDSConnectionManager *)self isReady])
  {
    id v12 = [(GKIDSConnectionManager *)self delegate];
    [v12 connectionManagerReady:self];
  }
}

- (GKIDSConnectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKIDSConnectionManagerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)idsDelegateQueue
{
  return self->_idsDelegateQueue;
}

- (void)setIdsDelegateQueue:(id)a3
{
}

- (IDSAccountController)gcArcadeAccountController
{
  return self->_gcArcadeAccountController;
}

- (void)setGcArcadeAccountController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gcArcadeAccountController, 0);
  objc_storeStrong((id *)&self->_idsDelegateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end