@interface _UIViewServiceViewControllerOperator_XPCInterface
- (SEL)connectionSelector;
- (id)connectionInvocation;
- (id)connectionProtocol;
- (id)exportedInterface;
- (id)hostObjectInterface;
@end

@implementation _UIViewServiceViewControllerOperator_XPCInterface

- (id)exportedInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED688B38];
  v3 = self;
  [v2 setClass:v3 forSelector:sel___createViewControllerWithOptions_completionBlock_ argumentIndex:0 ofReply:0];

  v4 = self;
  [v2 setClass:v4 forSelector:sel___createViewControllerWithOptions_completionBlock_ argumentIndex:0 ofReply:1];

  uint64_t v5 = MEMORY[0x1E4F14590];
  [v2 setXPCType:MEMORY[0x1E4F14590] forSelector:sel___hostSceneDidUpdateWithDiff_ argumentIndex:0 ofReply:0];
  [v2 setXPCType:v5 forSelector:sel___hostDidMoveToParentSceneWithSettings_ argumentIndex:0 ofReply:0];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel___timelinesForDateInterval_completion_ argumentIndex:0 ofReply:1];

  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", +[_UIApplicationIntelligenceSupport remoteContextWrapperClass](_UIApplicationIntelligenceSupport, "remoteContextWrapperClass"), sel___intelligenceCollectRemoteContentInVisibleRect_withRemoteContextWrapper_, 1, 0);
  return v2;
}

- (id)hostObjectInterface
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED531B60];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  uint64_t v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel___viewServiceDidUpdateMultitaskingDragExclusionRects_ argumentIndex:0 ofReply:0];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v8 = [v6 setWithArray:v7];
  [v2 setClasses:v8 forSelector:sel___viewServiceAddSceneForwardingLayersForOwners_ argumentIndex:0 ofReply:0];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v11 = [v9 setWithArray:v10];
  [v2 setClasses:v11 forSelector:sel___viewServiceRemoveSceneForwardingLayersForOwners_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)connectionProtocol
{
  return &unk_1ED7019C0;
}

- (SEL)connectionSelector
{
  return sel___connectToViewControllerOperatorFromRemoteViewController_replyHandler_;
}

- (id)connectionInvocation
{
  return +[_UIViewServiceDeputyXPCInterfaceInvocationFactory invocationForConnectionSelector:self];
}

@end