@interface AccessoryAction
- (AccessoryAction)initWithAccount:(id)a3 accessory:(id)a4 requiresConnectivity:(BOOL)a5 serverInteractionController:(id)a6;
- (BOOL)accessoryIsConnected:(id)a3;
- (BOOL)enqueuedQC;
- (BOOL)requiresConnectivity;
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDAccount)account;
- (FMDInternalAccessory)accessory;
- (FMDServerInteractionController)serverInteractionController;
- (OS_dispatch_queue)serialQueue;
- (id)actionType;
- (id)completion;
- (void)_enqueueQCAction;
- (void)_performAction:(id)a3 waitForConnection:(BOOL)a4;
- (void)accessoryDidPair:(id)a3;
- (void)accessoryDidUnpair:(id)a3;
- (void)accessoryDidUpdate:(id)a3;
- (void)runWithCompletion:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setAccount:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setEnqueuedQC:(BOOL)a3;
- (void)setRequiresConnectivity:(BOOL)a3;
- (void)setSerialQueue:(id)a3;
- (void)setServerInteractionController:(id)a3;
- (void)terminate;
- (void)willCancelAction;
@end

@implementation AccessoryAction

- (AccessoryAction)initWithAccount:(id)a3 accessory:(id)a4 requiresConnectivity:(BOOL)a5 serverInteractionController:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AccessoryAction;
  v13 = [(AccessoryAction *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(AccessoryAction *)v13 setEnqueuedQC:0];
    [(AccessoryAction *)v14 setAccount:v10];
    [(AccessoryAction *)v14 setAccessory:v11];
    [(AccessoryAction *)v14 setRequiresConnectivity:v7];
    [(AccessoryAction *)v14 setServerInteractionController:v12];
    dispatch_queue_t v15 = dispatch_queue_create("AccessoryActionSerialQueue", 0);
    [(AccessoryAction *)v14 setSerialQueue:v15];
  }
  return v14;
}

- (id)actionType
{
  return @"AccessoryAction";
}

- (void)willCancelAction
{
  objc_initWeak(&location, self);
  v3 = [(AccessoryAction *)self serialQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001FFF8;
  v4[3] = &unk_1002D93C8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)terminate
{
  uint64_t v4 = [(AccessoryAction *)self completion];
  [(AccessoryAction *)self setCompletion:0];
  v3 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    v3 = (void *)v4;
  }
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(AccessoryAction *)self accessory];
    v6 = [v5 accessoryIdentifier];
    BOOL v7 = [v4 accessory];
    v8 = [v7 accessoryIdentifier];
    unsigned __int8 v9 = [v6 isEqual:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(AccessoryAction *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020288;
  block[3] = &unk_1002D9DD0;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  id v9 = v6;
  dispatch_async(v5, block);

  BOOL v7 = [(AccessoryAction *)self accessory];
  [(AccessoryAction *)self _performAction:v7 waitForConnection:[(AccessoryAction *)self requiresConnectivity]];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (void)_enqueueQCAction
{
  v3 = [(AccessoryAction *)self accessory];
  id v4 = [(AccessoryAction *)self account];
  id v5 = [FMDActingRequestDecorator alloc];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000204B4;
  v17[3] = &unk_1002D9458;
  id v18 = v3;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100020568;
  v14[3] = &unk_1002D9DF8;
  id v15 = v4;
  id v16 = v18;
  id v6 = v18;
  id v7 = v4;
  v8 = [(FMDActingRequestDecorator *)v5 initWithDeviceContextGenerator:v17 deviceInfoGenerator:v14 serverContextGenerator:0 requestHeaderGenerator:0];
  id v9 = [(AccessoryAction *)self serverInteractionController];
  id v10 = [[QCAction alloc] initWithAccount:v7 shutdownActivityPending:0 serverInteractionController:v9];
  id v11 = [v6 commandContext];
  [(QCAction *)v10 setCommandContext:v11];

  [(QCAction *)v10 setRequestDecorator:v8];
  id v12 = +[ActionManager sharedManager];
  id v13 = [v12 enqueueAction:v10];
}

- (void)_performAction:(id)a3 waitForConnection:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  id v7 = [(AccessoryAction *)self serialQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000206C0;
  v9[3] = &unk_1002D9E20;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BOOL)accessoryIsConnected:(id)a3
{
  return [a3 connectionState] == (id)1;
}

- (void)accessoryDidUpdate:(id)a3
{
  id v4 = a3;
  [(AccessoryAction *)self _performAction:v4 waitForConnection:[(AccessoryAction *)self requiresConnectivity]];
}

- (void)accessoryDidPair:(id)a3
{
  id v4 = a3;
  [(AccessoryAction *)self _performAction:v4 waitForConnection:[(AccessoryAction *)self requiresConnectivity]];
}

- (void)accessoryDidUnpair:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(AccessoryAction *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020A18;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (FMDInternalAccessory)accessory
{
  return (FMDInternalAccessory *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccessory:(id)a3
{
}

- (BOOL)requiresConnectivity
{
  return self->_requiresConnectivity;
}

- (void)setRequiresConnectivity:(BOOL)a3
{
  self->_requiresConnectivity = a3;
}

- (FMDServerInteractionController)serverInteractionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serverInteractionController);

  return (FMDServerInteractionController *)WeakRetained;
}

- (void)setServerInteractionController:(id)a3
{
}

- (BOOL)enqueuedQC
{
  return self->_enqueuedQC;
}

- (void)setEnqueuedQC:(BOOL)a3
{
  self->_enqueuedQC = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serverInteractionController);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end