@interface ICQRemotePresentationManager
- (ICQRemoteContext)remoteContext;
- (ICQRemotePresentationManager)initWithRemoteContext:(id)a3;
- (id)presentationWasInvalidated;
- (void)presentHiddenFreshmintFlowWithEndpoint:(id)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)setPresentationWasInvalidated:(id)a3;
@end

@implementation ICQRemotePresentationManager

- (ICQRemotePresentationManager)initWithRemoteContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQRemotePresentationManager;
  v6 = [(ICQRemotePresentationManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_remoteContext, a3);
  }

  return v7;
}

- (void)presentHiddenFreshmintFlowWithEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Presenting freshmint flow with SB Remote Alert.", v11, 2u);
  }

  v6 = (void *)[objc_alloc(MEMORY[0x1E4FA6BB0]) initWithServiceName:@"com.apple.RemoteiCloudQuotaUI" viewControllerClassName:@"ICQRemoteViewController"];
  id v7 = objc_alloc_init(MEMORY[0x1E4FA6BA0]);
  v8 = [(ICQRemoteContext *)self->_remoteContext toDictionary];
  [v7 setUserInfo:v8];

  [v7 setXpcEndpoint:v4];
  objc_super v9 = (void *)[MEMORY[0x1E4FA6BC8] newHandleWithDefinition:v6 configurationContext:v7];
  [v9 registerObserver:self];
  id v10 = objc_alloc_init(MEMORY[0x1E4FA6B98]);
  [v9 activateWithContext:v10];
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "Remote alert was invalidated with error: %@", (uint8_t *)&v8, 0xCu);
  }

  presentationWasInvalidated = (void (**)(id, id))self->_presentationWasInvalidated;
  if (presentationWasInvalidated) {
    presentationWasInvalidated[2](presentationWasInvalidated, v5);
  }
}

- (ICQRemoteContext)remoteContext
{
  return self->_remoteContext;
}

- (id)presentationWasInvalidated
{
  return self->_presentationWasInvalidated;
}

- (void)setPresentationWasInvalidated:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentationWasInvalidated, 0);
  objc_storeStrong((id *)&self->_remoteContext, 0);
}

@end