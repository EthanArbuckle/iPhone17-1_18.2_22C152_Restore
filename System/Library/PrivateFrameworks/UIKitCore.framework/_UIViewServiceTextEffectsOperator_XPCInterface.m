@interface _UIViewServiceTextEffectsOperator_XPCInterface
- (SEL)connectionSelector;
- (id)connectionInvocation;
- (id)connectionProtocol;
- (id)exportedInterface;
- (id)hostObjectInterface;
@end

@implementation _UIViewServiceTextEffectsOperator_XPCInterface

- (id)exportedInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED6871E0];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel___setHostAllowedNotifications_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)hostObjectInterface
{
  return 0;
}

- (id)connectionProtocol
{
  return &unk_1ED701960;
}

- (SEL)connectionSelector
{
  return sel___connectToTextEffectsOperatorFromRemoteViewController_replyHandler_;
}

- (id)connectionInvocation
{
  return +[_UIViewServiceDeputyXPCInterfaceInvocationFactory invocationForConnectionSelector:self];
}

@end