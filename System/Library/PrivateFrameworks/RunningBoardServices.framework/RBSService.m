@interface RBSService
+ (BOOL)saveEndowment:(id)a3 forKey:(id)a4 withError:(id *)a5;
- (RBSService)init;
- (id)inheritances;
- (id)managedEndpointByLaunchIdentifier;
- (void)_init;
- (void)dealloc;
- (void)didLoseInheritances:(id)a3;
- (void)didReceiveInheritances:(id)a3;
@end

@implementation RBSService

uint64_t __37__RBSService_didReceiveInheritances___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) service:*(void *)(a1 + 32) didReceiveInheritances:*(void *)(a1 + 40)];
}

- (void)didReceiveInheritances:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_inheritances unionSet:v4];
  calloutQueue = self->_calloutQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__RBSService_didReceiveInheritances___block_invoke;
  v8[3] = &unk_1E57413D0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(calloutQueue, v8);
  os_unfair_lock_unlock(p_lock);
}

- (void)didLoseInheritances:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableSet *)self->_inheritances minusSet:v4];
  calloutQueue = self->_calloutQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__RBSService_didLoseInheritances___block_invoke;
  v8[3] = &unk_1E57413D0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(calloutQueue, v8);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __34__RBSService_didLoseInheritances___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) service:*(void *)(a1 + 32) didLoseInheritances:*(void *)(a1 + 40)];
}

- (void)_init
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)RBSService;
  v1 = objc_msgSendSuper2(&v10, sel_init);
  v2 = v1;
  if (v1)
  {
    *((_DWORD *)v1 + 4) = 0;
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    id v4 = (void *)v2[3];
    v2[3] = v3;

    uint64_t v5 = +[RBSConnection sharedInstance];
    v6 = (void *)v2[4];
    v2[4] = v5;

    dispatch_queue_t v7 = +[RBSWorkloop createCalloutQueue:@"com.apple.runningboard.service.callout"];
    v8 = (void *)v2[5];
    v2[5] = v7;
  }
  return v2;
}

- (RBSService)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBSService.m" lineNumber:52 description:@"cannot call -init on RBSService"];

  return 0;
}

- (void)dealloc
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"RBSService.m" lineNumber:68 description:@"RBSService must not dealloc"];

  v5.receiver = self;
  v5.super_class = (Class)RBSService;
  [(RBSService *)&v5 dealloc];
}

+ (BOOL)saveEndowment:(id)a3 forKey:(id)a4 withError:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"RBSService.m", 74, @"Invalid parameter not satisfying: %@", @"endowment" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"RBSService.m", 75, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v12 = +[RBSConnection sharedInstance];
  v13 = +[RBSSavedEndowment savedEndowment:v9 withKey:v11];
  char v14 = [v12 saveEndowment:v13 withError:a5];

  return v14;
}

- (id)inheritances
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableSet *)self->_inheritances copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)managedEndpointByLaunchIdentifier
{
  v2 = +[RBSConnection sharedInstance];
  uint64_t v3 = -[RBSConnection managedEndpointByLaunchIdentifier]((uint64_t)v2);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_inheritances, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end