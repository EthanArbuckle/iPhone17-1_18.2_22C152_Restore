@interface _UIViewControllerControlMessageDeputyXPCInterface
- (SEL)connectionSelector;
- (id)connectionInvocation;
- (id)connectionProtocol;
- (id)exportedInterface;
- (id)hostObjectInterface;
@end

@implementation _UIViewControllerControlMessageDeputyXPCInterface

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED686F68];
}

- (id)hostObjectInterface
{
  return 0;
}

- (id)connectionProtocol
{
  return &unk_1ED701AE0;
}

- (SEL)connectionSelector
{
  return sel___connectToViewControllerControlMessageDeputyFromRemoteViewController_replyHandler_;
}

- (id)connectionInvocation
{
  return +[_UIViewServiceDeputyXPCInterfaceInvocationFactory invocationForConnectionSelector:self];
}

@end