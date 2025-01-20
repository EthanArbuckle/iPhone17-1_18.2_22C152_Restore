@interface TSUSharedResourceController
- (BOOL)canWaitOnMainThread;
- (BOOL)performSynchronousAccessIfResourceIsAvailable:(BOOL)a3 usingBlock:(id)a4;
- (BOOL)performSynchronousAccessIfResourceIsAvailableUsingBlock:(id)a3;
- (NSString)UUID;
- (TSUSharedResourceController)init;
- (TSUSharedResourceController)initWithName:(id)a3 delegate:(id)a4;
- (id)description;
- (void)acquireResourceWithLockAndPerformSynchronousAccessUsingBlock:(id)a3;
- (void)dealloc;
- (void)didBeginAccessToResource:(id)a3;
- (void)didBeginAccessToResource:(id)a3 isFromThreadWaitingToAcquireResource:(BOOL)a4;
- (void)performSynchronousAccessUsingBlock:(id)a3;
- (void)setCanWaitOnMainThread:(BOOL)a3;
- (void)waitForResourceWithLockAndPerformSynchronousAccessUsingBlock:(id)a3;
- (void)wakeUpAllThreadsWaitingForResourceWithLock;
- (void)willEndAccessToResource;
- (void)willEndAccessToResourceForcingToWaitForPendingAccesses:(BOOL)a3;
@end

@implementation TSUSharedResourceController

- (TSUSharedResourceController)init
{
  v2 = +[TSUAssertionHandler currentHandler];
  v3 = [NSString stringWithUTF8String:"-[TSUSharedResourceController init]"];
  v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:54 description:@"Do not call method"];

  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[TSUSharedResourceController init]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (TSUSharedResourceController)initWithName:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    v9 = [NSString stringWithUTF8String:"-[TSUSharedResourceController initWithName:delegate:]"];
    v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 59, @"invalid nil value for '%s'", "delegate");
  }
  v30.receiver = self;
  v30.super_class = (Class)TSUSharedResourceController;
  v11 = [(TSUSharedResourceController *)&v30 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v7);
    v13 = [MEMORY[0x263F08C38] UUID];
    uint64_t v14 = [v13 UUIDString];
    UUID = v12->_UUID;
    v12->_UUID = (NSString *)v14;

    uint64_t v16 = [NSString stringWithFormat:@"TSUSharedResourceController.Resource.%@", v12->_UUID];
    resourceForThreadKey = v12->_resourceForThreadKey;
    v12->_resourceForThreadKey = (NSString *)v16;

    uint64_t v18 = [NSString stringWithFormat:@"TSUSharedResourceController.HasResource.%@", v12->_UUID];
    hasResourceForThreadKey = v12->_hasResourceForThreadKey;
    v12->_hasResourceForThreadKey = (NSString *)v18;

    v20 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    resourceLock = v12->_resourceLock;
    v12->_resourceLock = v20;

    [(NSCondition *)v12->_resourceLock setName:v6];
    if (objc_opt_respondsToSelector())
    {
      if ([v7 acquiresResourceAsynchronouslyForSharedResourceController:v12]) {
        char v22 = 2;
      }
      else {
        char v22 = 0;
      }
    }
    else
    {
      char v22 = 0;
    }
    *(unsigned char *)&v12->_flags = *(unsigned char *)&v12->_flags & 0xFD | v22;
    v23 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    waitLock = v12->_waitLock;
    v12->_waitLock = v23;

    dispatch_group_t v25 = dispatch_group_create();
    accessInProgressGroup = v12->_accessInProgressGroup;
    v12->_accessInProgressGroup = (OS_dispatch_group *)v25;

    dispatch_group_t v27 = dispatch_group_create();
    willEndAccessGroup = v12->_willEndAccessGroup;
    v12->_willEndAccessGroup = (OS_dispatch_group *)v27;
  }
  return v12;
}

- (void)dealloc
{
  if (self->_acquirerCount)
  {
    v3 = +[TSUAssertionHandler currentHandler];
    v4 = [NSString stringWithUTF8String:"-[TSUSharedResourceController dealloc]"];
    v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:84 description:@"Unbalanced calls to |-didBeginAccessToResource:| and |-willEndAccessToResource|"];
  }
  if (self->_threadsAcquiringResourceCount)
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    id v7 = [NSString stringWithUTF8String:"-[TSUSharedResourceController dealloc]"];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:85 description:@"Unbalanced increments and decrements of number of threads acquiring the resource."];
  }
  v9.receiver = self;
  v9.super_class = (Class)TSUSharedResourceController;
  [(TSUSharedResourceController *)&v9 dealloc];
}

- (BOOL)canWaitOnMainThread
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)setCanWaitOnMainThread:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (void)didBeginAccessToResource:(id)a3
{
}

- (void)didBeginAccessToResource:(id)a3 isFromThreadWaitingToAcquireResource:(BOOL)a4
{
  BOOL v4 = a4;
  id v17 = a3;
  [(NSCondition *)self->_resourceLock lock];
  if (atomic_fetch_add(&self->_acquirerCount, 1u))
  {
    id resource = self->_resource;
    BOOL v8 = resource == v17 || resource == 0;
    if (!v8 && ([resource isEqual:v17] & 1) == 0)
    {
      objc_super v9 = +[TSUAssertionHandler currentHandler];
      v10 = [NSString stringWithUTF8String:"-[TSUSharedResourceController didBeginAccessToResource:isFromThreadWaitingToAcquireResource:]"];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m"];
      v12 = [(NSCondition *)self->_resourceLock name];
      [v9 handleFailureInFunction:v10, v11, 108, @"%@ changed during coordinated access: current (%@), new (%@)", v12, self->_resource, v17 file lineNumber description];
    }
  }
  objc_storeStrong(&self->_resource, a3);
  *(unsigned char *)&self->_flags |= 4u;
  if (v4)
  {
    int threadsAcquiringResourceCount = self->_threadsAcquiringResourceCount;
    self->_int threadsAcquiringResourceCount = threadsAcquiringResourceCount - 1;
    if (threadsAcquiringResourceCount <= 0)
    {
      uint64_t v14 = +[TSUAssertionHandler currentHandler];
      v15 = [NSString stringWithUTF8String:"-[TSUSharedResourceController didBeginAccessToResource:isFromThreadWaitingToAcquireResource:]"];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m"];
      [v14 handleFailureInFunction:v15 file:v16 lineNumber:116 description:@"Unbalanced increments and decrements of number of threads acquiring the resource."];
    }
  }
  __dmb(0xBu);
  [(NSCondition *)self->_resourceLock broadcast];
  [(NSCondition *)self->_resourceLock unlock];
}

- (void)wakeUpAllThreadsWaitingForResourceWithLock
{
  [(NSCondition *)self->_waitLock lock];
  if (self->_waitCount < 1)
  {
LABEL_4:
    waitLock = self->_waitLock;
    [(NSCondition *)waitLock unlock];
  }
  else
  {
    while (1)
    {
      [(NSCondition *)self->_resourceLock broadcast];
      [(NSCondition *)self->_resourceLock unlock];
      [(NSCondition *)self->_waitLock wait];
      int waitCount = self->_waitCount;
      [(NSCondition *)self->_waitLock unlock];
      [(NSCondition *)self->_resourceLock lock];
      if (waitCount < 1) {
        break;
      }
      [(NSCondition *)self->_waitLock lock];
      if (self->_waitCount <= 0) {
        goto LABEL_4;
      }
    }
  }
}

- (void)willEndAccessToResource
{
}

- (void)willEndAccessToResourceForcingToWaitForPendingAccesses:(BOOL)a3
{
  int add = atomic_fetch_add(&self->_acquirerCount, 0xFFFFFFFF);
  if (add != 1 && !a3)
  {
    if (add <= 0)
    {
      id v10 = +[TSUAssertionHandler currentHandler];
      BOOL v8 = [NSString stringWithUTF8String:"-[TSUSharedResourceController willEndAccessToResourceForcingToWaitForPendingAccesses:]"];
      objc_super v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m"];
      [v10 handleFailureInFunction:v8 file:v9 lineNumber:195 description:@"Unbalanced calls to |-didBeginAccessToResource:| and |-willEndAccessToResource|"];
    }
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_willEndAccessGroup);
    [(NSCondition *)self->_resourceLock lock];
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      [(TSUSharedResourceController *)self wakeUpAllThreadsWaitingForResourceWithLock];
    }
    id resource = self->_resource;
    self->_id resource = 0;

    *(unsigned char *)&self->_flags &= ~4u;
    __dmb(0xBu);
    [(NSCondition *)self->_resourceLock unlock];
    dispatch_group_wait((dispatch_group_t)self->_accessInProgressGroup, 0xFFFFFFFFFFFFFFFFLL);
    willEndAccessGroup = self->_willEndAccessGroup;
    dispatch_group_leave(willEndAccessGroup);
  }
}

- (void)performSynchronousAccessUsingBlock:(id)a3
{
}

- (BOOL)performSynchronousAccessIfResourceIsAvailableUsingBlock:(id)a3
{
  return [(TSUSharedResourceController *)self performSynchronousAccessIfResourceIsAvailable:1 usingBlock:a3];
}

- (BOOL)performSynchronousAccessIfResourceIsAvailable:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F08B88] currentThread];
  BOOL v8 = [v7 threadDictionary];

  objc_super v9 = [v8 objectForKeyedSubscript:self->_hasResourceForThreadKey];
  int v10 = [v9 BOOLValue];

  if (!v10)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__TSUSharedResourceController_performSynchronousAccessIfResourceIsAvailable_usingBlock___block_invoke;
    aBlock[3] = &unk_26462ABD0;
    id v19 = v8;
    v20 = self;
    id v21 = v6;
    v13 = (void (**)(void *, id))_Block_copy(aBlock);
    dispatch_group_wait((dispatch_group_t)self->_willEndAccessGroup, 0xFFFFFFFFFFFFFFFFLL);
    [(NSCondition *)self->_resourceLock lock];
    dispatch_group_enter((dispatch_group_t)self->_accessInProgressGroup);
    id v14 = self->_resource;
    $B78C53DA64D405E895D3E1BDADA0F7B1 flags = self->_flags;
    if ((*(unsigned char *)&flags & 4) != 0 || v4)
    {
      BOOL v12 = (*(unsigned int *)&flags >> 2) & 1;
      [(NSCondition *)self->_resourceLock unlock];
      if ((*(unsigned char *)&flags & 4) != 0) {
        v13[2](v13, v14);
      }
      dispatch_group_leave((dispatch_group_t)self->_accessInProgressGroup);
      goto LABEL_16;
    }
    if (self->_threadsAcquiringResourceCount)
    {
      if ((*(unsigned char *)&flags & 1) != 0 || ![MEMORY[0x263F08B88] isMainThread])
      {
        [(NSCondition *)self->_waitLock lock];
        ++self->_waitCount;
        __dmb(0xBu);
        [(NSCondition *)self->_waitLock unlock];
        [(TSUSharedResourceController *)self waitForResourceWithLockAndPerformSynchronousAccessUsingBlock:v13];
LABEL_15:
        LOBYTE(v12) = 1;
LABEL_16:

        goto LABEL_17;
      }
      int v16 = self->_threadsAcquiringResourceCount + 1;
    }
    else
    {
      int v16 = 1;
    }
    self->_int threadsAcquiringResourceCount = v16;
    __dmb(0xBu);
    [(TSUSharedResourceController *)self acquireResourceWithLockAndPerformSynchronousAccessUsingBlock:v13];
    goto LABEL_15;
  }
  v11 = [v8 objectForKeyedSubscript:self->_resourceForThreadKey];
  (*((void (**)(id, void *))v6 + 2))(v6, v11);

  LOBYTE(v12) = 1;
LABEL_17:

  return v12;
}

uint64_t __88__TSUSharedResourceController_performSynchronousAccessIfResourceIsAvailable_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 32);
  id v5 = a2;
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v4];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  if (v5) {
    [v6 setObject:v5 forKeyedSubscript:*(void *)(v7 + 24)];
  }
  else {
    [v6 removeObjectForKey:*(void *)(v7 + 24)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  [*(id *)(a1 + 32) removeObjectForKey:*(void *)(*(void *)(a1 + 40) + 32)];
  BOOL v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 24);
  return [v8 removeObjectForKey:v9];
}

- (void)acquireResourceWithLockAndPerformSynchronousAccessUsingBlock:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSUSharedResourceController acquireResourceWithLockAndPerformSynchronousAccessUsingBlock:]"];
    BOOL v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSharedResourceController.m"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 293, @"invalid nil value for '%s'", "delegate");
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__TSUSharedResourceController_acquireResourceWithLockAndPerformSynchronousAccessUsingBlock___block_invoke;
  aBlock[3] = &unk_26462AC20;
  id v9 = WeakRetained;
  id v17 = v9;
  uint64_t v18 = self;
  int v10 = _Block_copy(aBlock);
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    [(NSCondition *)self->_waitLock lock];
    ++self->_waitCount;
    __dmb(0xBu);
    [(NSCondition *)self->_waitLock unlock];
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __92__TSUSharedResourceController_acquireResourceWithLockAndPerformSynchronousAccessUsingBlock___block_invoke_3;
    v14[3] = &unk_26462AC48;
    dispatch_semaphore_t v15 = v11;
    BOOL v12 = (void (*)(void *, void *))v10[2];
    v13 = v11;
    v12(v10, v14);
    [(TSUSharedResourceController *)self waitForResourceWithLockAndPerformSynchronousAccessUsingBlock:v4];
    dispatch_semaphore_signal(v13);
  }
  else
  {
    [(NSCondition *)self->_resourceLock unlock];
    dispatch_group_leave((dispatch_group_t)self->_accessInProgressGroup);
    ((void (*)(void *, id))v10[2])(v10, v4);
  }
}

void __92__TSUSharedResourceController_acquireResourceWithLockAndPerformSynchronousAccessUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __92__TSUSharedResourceController_acquireResourceWithLockAndPerformSynchronousAccessUsingBlock___block_invoke_2;
  v7[3] = &unk_26462ABF8;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  [v5 acquireResourceForSharedResourceController:v4 usingSetResourceBlock:v7];
}

uint64_t __92__TSUSharedResourceController_acquireResourceWithLockAndPerformSynchronousAccessUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 didBeginAccessToResource:v4 isFromThreadWaitingToAcquireResource:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  id v5 = *(void **)(a1 + 32);
  return [v5 willEndAccessToResource];
}

intptr_t __92__TSUSharedResourceController_acquireResourceWithLockAndPerformSynchronousAccessUsingBlock___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
}

- (void)waitForResourceWithLockAndPerformSynchronousAccessUsingBlock:(id)a3
{
  uint64_t v7 = (void (**)(id, id))a3;
  id v4 = 0;
  do
  {
    id v5 = v4;
    dispatch_group_leave((dispatch_group_t)self->_accessInProgressGroup);
    [(NSCondition *)self->_resourceLock wait];
    dispatch_group_enter((dispatch_group_t)self->_accessInProgressGroup);
    id v4 = self->_resource;
  }
  while ((*(unsigned char *)&self->_flags & 4) == 0);
  [(NSCondition *)self->_waitLock lock];
  int v6 = self->_waitCount - 1;
  self->_int waitCount = v6;
  __dmb(0xBu);
  if (!v6) {
    [(NSCondition *)self->_waitLock broadcast];
  }
  [(NSCondition *)self->_waitLock unlock];
  [(NSCondition *)self->_resourceLock unlock];
  v7[2](v7, v4);
  dispatch_group_leave((dispatch_group_t)self->_accessInProgressGroup);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TSUSharedResourceController;
  id v4 = [(TSUSharedResourceController *)&v8 description];
  id v5 = [(NSCondition *)self->_resourceLock name];
  int v6 = [v3 stringWithFormat:@"%@ \"%@\"", v4, v5];

  return v6;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_willEndAccessGroup, 0);
  objc_storeStrong((id *)&self->_accessInProgressGroup, 0);
  objc_storeStrong((id *)&self->_waitLock, 0);
  objc_storeStrong(&self->_resource, 0);
  objc_storeStrong((id *)&self->_resourceLock, 0);
  objc_storeStrong((id *)&self->_hasResourceForThreadKey, 0);
  objc_storeStrong((id *)&self->_resourceForThreadKey, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end