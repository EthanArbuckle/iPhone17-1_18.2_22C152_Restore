@interface WFRemoteActionUserInterface
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NSString)userInterfaceType;
- (NSXPCConnection)connection;
- (WFActionRemoteUserInterface)remoteUserInterface;
- (WFRemoteActionUserInterface)initWithUserInterfaceType:(id)a3 listenerEndpoint:(id)a4 interface:(id)a5;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)onInterfaceInterruption;
- (void)setOnInterfaceInterruption:(id)a3;
@end

@implementation WFRemoteActionUserInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteUserInterface, 0);
  objc_storeStrong(&self->_onInterfaceInterruption, 0);
  objc_storeStrong((id *)&self->_userInterfaceType, 0);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (WFActionRemoteUserInterface)remoteUserInterface
{
  return self->_remoteUserInterface;
}

- (void)setOnInterfaceInterruption:(id)a3
{
}

- (id)onInterfaceInterruption
{
  return self->_onInterfaceInterruption;
}

- (NSString)userInterfaceType
{
  return self->_userInterfaceType;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFRemoteActionUserInterface;
  if (-[WFRemoteActionUserInterface respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    char v4 = 1;
  }
  else
  {
    v5 = [(WFRemoteActionUserInterface *)self remoteUserInterface];
    char v4 = objc_opt_respondsToSelector();
  }
  return v4 & 1;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  v5 = [(WFRemoteActionUserInterface *)self remoteUserInterface];
  char v6 = [v5 conformsToProtocol:v4];

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFRemoteActionUserInterface;
  if ([(WFRemoteActionUserInterface *)&v6 respondsToSelector:a3])
  {
    id v4 = self;
  }
  else
  {
    id v4 = [(WFRemoteActionUserInterface *)self remoteUserInterface];
  }
  return v4;
}

- (WFRemoteActionUserInterface)initWithUserInterfaceType:(id)a3 listenerEndpoint:(id)a4 interface:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"WFRemoteActionUserInterface.m", 27, @"Invalid parameter not satisfying: %@", @"listenerEndpoint" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"WFRemoteActionUserInterface.m", 26, @"Invalid parameter not satisfying: %@", @"userInterfaceType" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"WFRemoteActionUserInterface.m", 28, @"Invalid parameter not satisfying: %@", @"interface" object file lineNumber description];

LABEL_4:
  v26.receiver = self;
  v26.super_class = (Class)WFRemoteActionUserInterface;
  v13 = [(WFRemoteActionUserInterface *)&v26 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_userInterfaceType, a3);
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v11];
    [v15 setRemoteObjectInterface:v12];
    objc_initWeak(&location, v14);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __84__WFRemoteActionUserInterface_initWithUserInterfaceType_listenerEndpoint_interface___block_invoke;
    v23[3] = &unk_1E6555640;
    objc_copyWeak(&v24, &location);
    [v15 setInterruptionHandler:v23];
    [v15 resume];
    objc_storeStrong((id *)&v14->_connection, v15);
    uint64_t v16 = [v15 remoteObjectProxy];
    remoteUserInterface = v14->_remoteUserInterface;
    v14->_remoteUserInterface = (WFActionRemoteUserInterface *)v16;

    v18 = v14;
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v14;
}

void __84__WFRemoteActionUserInterface_initWithUserInterfaceType_listenerEndpoint_interface___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained onInterfaceInterruption];

  if (v1)
  {
    v2 = [WeakRetained onInterfaceInterruption];
    v2[2]();
  }
}

@end