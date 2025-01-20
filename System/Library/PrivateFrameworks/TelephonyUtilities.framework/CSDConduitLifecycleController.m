@interface CSDConduitLifecycleController
- (BOOL)shouldKeepConduitAlive;
- (CSDConduitLifecycleController)initWithConversationManager:(id)a3 delegate:(id)a4;
- (RPRemoteDisplayDiscovery)remoteDisplayDiscovery;
- (TUConduitLifecycleControllerDelegate)delegate;
- (TUConversationManager)conversationManager;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation CSDConduitLifecycleController

- (CSDConduitLifecycleController)initWithConversationManager:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CSDConduitLifecycleController;
  v9 = [(CSDConduitLifecycleController *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conversationManager, a3);
    objc_storeStrong((id *)&v10->_delegate, a4);
    v11 = (RPRemoteDisplayDiscovery *)objc_alloc_init((Class)RPRemoteDisplayDiscovery);
    remoteDisplayDiscovery = v10->_remoteDisplayDiscovery;
    v10->_remoteDisplayDiscovery = v11;

    [(RPRemoteDisplayDiscovery *)v10->_remoteDisplayDiscovery activateWithCompletion:&stru_100508148];
    objc_initWeak(&location, v10);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100137984;
    v15[3] = &unk_100508170;
    objc_copyWeak(&v16, &location);
    [(RPRemoteDisplayDiscovery *)v10->_remoteDisplayDiscovery setDiscoverySessionStateChangedHandler:v15];
    v13 = v10;
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)dealloc
{
  [(RPRemoteDisplayDiscovery *)self->_remoteDisplayDiscovery invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSDConduitLifecycleController;
  [(CSDConduitLifecycleController *)&v3 dealloc];
}

- (BOOL)shouldKeepConduitAlive
{
  objc_super v3 = [(TUConversationManager *)self->_conversationManager activeConversations];
  if ([v3 count]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [(RPRemoteDisplayDiscovery *)self->_remoteDisplayDiscovery currentState] == 1;
  }

  return v4;
}

- (TUConduitLifecycleControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (TUConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (RPRemoteDisplayDiscovery)remoteDisplayDiscovery
{
  return self->_remoteDisplayDiscovery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteDisplayDiscovery, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);

  objc_storeStrong((id *)&self->_delegate, 0);
}

@end