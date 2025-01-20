@interface CSDClient
- (BOOL)hasVoIPNetworkExtensionEntitlement;
- (BOOL)isEntitledForCapability:(id)a3;
- (BOOL)isProcessSuspended;
- (BOOL)isRemote;
- (BOOL)supportsMessagesGroupProviding;
- (CSDClient)initWithObject:(id)a3 queue:(id)a4;
- (NSMutableDictionary)blockToExecuteAfterPendingCoalescingBlocksByIdentifier;
- (NSMutableSet)identifiersWithPendingCoalescingBlocks;
- (NSString)processBundleIdentifier;
- (NSString)processName;
- (NSString)propertiesDescription;
- (OS_dispatch_queue)queue;
- (RBSProcessHandle)processHandle;
- (TUCallServicesClientCapabilities)capabilities;
- (id)description;
- (id)object;
- (id)valueForEntitlement:(id)a3;
- (int)processIdentifier;
- (void)performBlock:(id)a3;
- (void)performBlock:(id)a3 coalescedByIdentifier:(id)a4;
- (void)performBlockAfterCoalescing:(id)a3;
- (void)setBlockToExecuteAfterPendingCoalescingBlocksByIdentifier:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setIdentifiersWithPendingCoalescingBlocks:(id)a3;
- (void)setObject:(id)a3;
- (void)setProcessHandle:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSupportsMessagesGroupProviding:(BOOL)a3;
@end

@implementation CSDClient

- (id)object
{
  return self->_object;
}

- (CSDClient)initWithObject:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CSDClient;
  v9 = [(CSDClient *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_object, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    uint64_t v11 = +[NSMutableSet set];
    identifiersWithPendingCoalescingBlocks = v10->_identifiersWithPendingCoalescingBlocks;
    v10->_identifiersWithPendingCoalescingBlocks = (NSMutableSet *)v11;

    uint64_t v13 = +[NSMutableDictionary dictionary];
    blockToExecuteAfterPendingCoalescingBlocksByIdentifier = v10->_blockToExecuteAfterPendingCoalescingBlocksByIdentifier;
    v10->_blockToExecuteAfterPendingCoalescingBlocksByIdentifier = (NSMutableDictionary *)v13;
  }
  return v10;
}

- (BOOL)hasVoIPNetworkExtensionEntitlement
{
  v2 = [(CSDClient *)self valueForEntitlement:@"com.apple.developer.networking.networkextension"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v3 = [v2 containsObject:@"app-push-provider"];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CSDClient *)self propertiesDescription];
  v5 = +[NSString stringWithFormat:@"<%@: %p %@>", v3, self, v4];

  return v5;
}

- (NSString)propertiesDescription
{
  uint64_t v3 = [(CSDClient *)self object];
  uint64_t v4 = [(CSDClient *)self processIdentifier];
  v5 = [(CSDClient *)self processName];
  v6 = [(CSDClient *)self processBundleIdentifier];
  id v7 = +[NSNumber numberWithBool:[(CSDClient *)self isProcessSuspended]];
  id v8 = +[NSString stringWithFormat:@"object=%@ processIdentifier=%d processName=%@ processBundleIdentifier=%@ isProcessSuspended=%@", v3, v4, v5, v6, v7];

  return (NSString *)v8;
}

- (void)performBlock:(id)a3
{
  id v5 = a3;
  id v6 = [(CSDClient *)self objectForBlock];
  (*((void (**)(id, CSDClient *, id))a3 + 2))(v5, self, v6);
}

- (void)performBlock:(id)a3 coalescedByIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDClient *)self identifiersWithPendingCoalescingBlocks];
  unsigned __int8 v9 = [v8 containsObject:v7];

  if (v9)
  {
    id v10 = objc_retainBlock(v6);
    uint64_t v11 = [(CSDClient *)self blockToExecuteAfterPendingCoalescingBlocksByIdentifier];
    [v11 setObject:v10 forKeyedSubscript:v7];
  }
  else
  {
    v12 = [(CSDClient *)self identifiersWithPendingCoalescingBlocks];
    [v12 addObject:v7];

    uint64_t v13 = [(CSDClient *)self objectForBlock];
    (*((void (**)(id, CSDClient *, void *))v6 + 2))(v6, self, v13);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100174CB0;
    v14[3] = &unk_100504F10;
    v14[4] = self;
    id v15 = v7;
    [(CSDClient *)self performBlockAfterCoalescing:v14];
  }
}

- (void)performBlockAfterCoalescing:(id)a3
{
}

- (int)processIdentifier
{
  v2 = +[NSProcessInfo processInfo];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (NSString)processName
{
  v2 = +[NSProcessInfo processInfo];
  int v3 = [v2 processName];

  return (NSString *)v3;
}

- (NSString)processBundleIdentifier
{
  v2 = +[NSBundle mainBundle];
  int v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (BOOL)isRemote
{
  return 0;
}

- (BOOL)isEntitledForCapability:(id)a3
{
  return 1;
}

- (id)valueForEntitlement:(id)a3
{
  return 0;
}

- (BOOL)isProcessSuspended
{
  int v3 = [(CSDClient *)self processHandle];

  if (!v3)
  {
    uint64_t v4 = +[RBSProcessIdentifier identifierWithPid:[(CSDClient *)self processIdentifier]];
    id v5 = +[RBSProcessHandle handleForIdentifier:v4 error:0];
    [(CSDClient *)self setProcessHandle:v5];
  }
  id v6 = [(CSDClient *)self processHandle];
  id v7 = [v6 currentState];
  BOOL v8 = [v7 taskState] == 3;

  return v8;
}

- (void)setObject:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (TUCallServicesClientCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BOOL)supportsMessagesGroupProviding
{
  return self->_supportsMessagesGroupProviding;
}

- (void)setSupportsMessagesGroupProviding:(BOOL)a3
{
  self->_supportsMessagesGroupProviding = a3;
}

- (NSMutableSet)identifiersWithPendingCoalescingBlocks
{
  return self->_identifiersWithPendingCoalescingBlocks;
}

- (void)setIdentifiersWithPendingCoalescingBlocks:(id)a3
{
}

- (NSMutableDictionary)blockToExecuteAfterPendingCoalescingBlocksByIdentifier
{
  return self->_blockToExecuteAfterPendingCoalescingBlocksByIdentifier;
}

- (void)setBlockToExecuteAfterPendingCoalescingBlocksByIdentifier:(id)a3
{
}

- (RBSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (void)setProcessHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_blockToExecuteAfterPendingCoalescingBlocksByIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiersWithPendingCoalescingBlocks, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong(&self->_object, 0);
}

@end