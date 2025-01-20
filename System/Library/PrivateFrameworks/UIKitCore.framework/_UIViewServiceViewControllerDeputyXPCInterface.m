@interface _UIViewServiceViewControllerDeputyXPCInterface
+ (id)interfaceWithExportedInterface:(id)a3 remoteViewControllerInterface:(id)a4;
- (SEL)connectionSelector;
- (id)connectionInvocation;
- (id)connectionProtocol;
- (id)exportedInterface;
- (id)hostObjectInterface;
@end

@implementation _UIViewServiceViewControllerDeputyXPCInterface

+ (id)interfaceWithExportedInterface:(id)a3 remoteViewControllerInterface:(id)a4
{
  v5 = (NSXPCInterface *)a3;
  v6 = (NSXPCInterface *)a4;
  v7 = objc_alloc_init(_UIViewServiceViewControllerDeputyXPCInterface);
  exportedInterface = v7->_exportedInterface;
  v7->_exportedInterface = v5;
  v9 = v5;

  remoteViewControllerInterface = v7->_remoteViewControllerInterface;
  v7->_remoteViewControllerInterface = v6;

  return v7;
}

- (id)exportedInterface
{
  return self->_exportedInterface;
}

- (id)hostObjectInterface
{
  return self->_remoteViewControllerInterface;
}

- (id)connectionProtocol
{
  return &unk_1ED701A80;
}

- (SEL)connectionSelector
{
  return sel___connectToViewControllerFromRemoteViewController_replyHandler_;
}

- (id)connectionInvocation
{
  return +[_UIViewServiceDeputyXPCInterfaceInvocationFactory invocationForConnectionSelector:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteViewControllerInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
}

@end