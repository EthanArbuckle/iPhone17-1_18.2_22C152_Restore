@interface TSKAccessController
- (BOOL)p_hasRead;
- (BOOL)p_hasWrite;
- (BOOL)p_waitWithCondition:(id)a3 untilDate:(id)a4;
- (BOOL)waitOnIdentifier:(id)a3 untilDate:(id)a4 releaseReadWhileWaiting:(BOOL)a5;
- (TSKAccessController)init;
- (TSKAccessController)initWithDelegate:(id)a3;
- (id)p_threadIdentifier;
- (void)dealloc;
- (void)p_asyncPerformSelectorOnMainThread:(SEL)a3 withTarget:(id)a4 argument:(void *)a5;
- (void)p_dequeueWrite;
- (void)p_enqueueWriteAndBlock;
- (void)p_flushPendingMainThreadBlocksQueueAcquiringLock:(BOOL)a3;
- (void)p_performReadOnMainThread:(id)a3;
- (void)p_readLock;
- (void)p_readUnlock;
- (void)p_scheduleMainThreadRead:(id)a3;
- (void)p_signalThread:(id)a3;
- (void)p_writeLockAndBlockMainThread:(BOOL)a3;
- (void)p_writeUnlock;
- (void)p_writeUnlockAndPerformWithMainThreadBlocked:(id)a3;
- (void)performRead:(SEL)a3 thenReadOnMainThread:(SEL)a4 withTarget:(id)a5 argument:(void *)a6;
- (void)performRead:(SEL)a3 thenWrite:(SEL)a4 thenReadOnMainThread:(SEL)a5 withTarget:(id)a6 argument:(void *)a7;
- (void)performRead:(SEL)a3 thenWrite:(SEL)a4 thenReadOnMainThread:(SEL)a5 withTarget:(id)a6 argument:(void *)a7 passReadResultToMainThreadRead:(BOOL)a8;
- (void)performRead:(SEL)a3 withTarget:(id)a4 argument:(void *)a5;
- (void)performRead:(SEL)a3 withTarget:(id)a4 argument:(void *)a5 argument2:(void *)a6;
- (void)performRead:(id)a3;
- (void)performWrite:(SEL)a3 withTarget:(id)a4 argument:(void *)a5;
- (void)performWrite:(id)a3;
- (void)performWrite:(id)a3 blockMainThread:(BOOL)a4;
- (void)signalIdentifier:(id)a3;
- (void)spinMainThreadRunLoopUntil:(SEL)a3 onTarget:(id)a4;
- (void)waitOnIdentifier:(id)a3;
@end

@implementation TSKAccessController

- (TSKAccessController)initWithDelegate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSKAccessController;
  v4 = [(TSKAccessController *)&v8 init];
  if (v4)
  {
    v4->_delegate = (TSUWeakReference *)[objc_alloc(MEMORY[0x263F7C8E0]) initWithObject:a3];
    v4->_writerQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v4->_cond = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    pthread_rwlock_init(&v4->_rwLock, 0);
    v4->_waitIdentifiers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4->_signalIdentifiers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v7.version = 0;
    v7.info = v4;
    memset(&v7.retain, 0, 24);
    v7.equal = (Boolean (__cdecl *)(const void *, const void *))TSKMainThreadRunLoopEqual;
    v7.schedule = 0;
    v7.cancel = 0;
    v7.hash = (CFHashCode (__cdecl *)(const void *))TSKMainThreadRunLoopHash;
    v7.perform = (void (__cdecl *)(void *))TSKMainThreadRunLoopPerform;
    v4->_mainThreadPingSource = CFRunLoopSourceCreate(0, 0, &v7);
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v4->_mainThreadPingSource, (CFRunLoopMode)*MEMORY[0x263EFF588]);
    v4->_pendingMainThreadInvocations = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v4;
}

- (TSKAccessController)init
{
  return [(TSKAccessController *)self initWithDelegate:0];
}

- (void)dealloc
{
  if ([(NSMutableDictionary *)self->_waitIdentifiers count])
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAccessController dealloc]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 147, @"access controller being deallocated when it is still in use");
  }

  if ([(NSMutableDictionary *)self->_signalIdentifiers count])
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKAccessController dealloc]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 150, @"access controller being deallocated when it is still in use");
  }

  CFRunLoopSourceInvalidate(self->_mainThreadPingSource);
  pthread_rwlock_destroy(&self->_rwLock);
  CFRelease(self->_mainThreadPingSource);

  v7.receiver = self;
  v7.super_class = (Class)TSKAccessController;
  [(TSKAccessController *)&v7 dealloc];
}

- (void)waitOnIdentifier:(id)a3
{
  uint64_t v5 = [MEMORY[0x263EFF910] distantFuture];

  [(TSKAccessController *)self waitOnIdentifier:a3 untilDate:v5 releaseReadWhileWaiting:0];
}

- (BOOL)waitOnIdentifier:(id)a3 untilDate:(id)a4 releaseReadWhileWaiting:(BOOL)a5
{
  if (a5)
  {
    if (![(TSKAccessController *)self p_hasRead])
    {
      objc_super v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v9 = [NSString stringWithUTF8String:"-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]"];
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 179, @"shoulnd't set releaseRead when we're not holding a read lock");
    }
    if ([(TSKAccessController *)self p_hasRead])
    {
      if (![MEMORY[0x263F08B88] isMainThread])
      {
        [(TSKAccessController *)self p_readUnlock];
        if ([(TSKAccessController *)self p_hasRead])
        {
          v24 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v25 = [NSString stringWithUTF8String:"-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]"];
          objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 189, @"failed to release read privs");
        }
        int v12 = 1;
        goto LABEL_9;
      }
      if (self->_secondaryThreadWriting)
      {
        v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v11 = [NSString stringWithUTF8String:"-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]"];
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 184, @"we shouldn't have read privs if a secondary thread is writing");
      }
    }
  }
  int v12 = 0;
LABEL_9:
  if ([(TSKAccessController *)self p_hasWrite])
  {
    v13 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v14 = [NSString stringWithUTF8String:"-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]"];
    [v13 handleFailureInFunction:v14, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 195, @"waiting on an identifier with write lock held, deadlock likely in our future" file lineNumber description];
  }
  [(NSCondition *)self->_cond lock];
  if ([(NSMutableDictionary *)self->_waitIdentifiers objectForKey:a3])
  {
    v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v16 = [NSString stringWithUTF8String:"-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 200, @"multiple threads cannot wait on the same identifier simultaneously");
  }
  -[NSMutableDictionary setObject:forKey:](self->_waitIdentifiers, "setObject:forKey:", [MEMORY[0x263F08B88] currentThread], a3);
  while (1)
  {
    uint64_t v17 = [(NSMutableDictionary *)self->_signalIdentifiers objectForKey:a3];
    if (v17) {
      break;
    }
    if (![(TSKAccessController *)self p_waitWithCondition:self->_cond untilDate:a4]) {
      goto LABEL_20;
    }
  }
  uint64_t v18 = [(NSMutableDictionary *)self->_signalIdentifiers objectForKey:a3];
  if (!v18)
  {
    v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 213, @"expect to have a signaling thread if we were signaled");
  }
  [(NSMutableDictionary *)self->_signalIdentifiers removeObjectForKey:a3];
  [(TSKAccessController *)self p_signalThread:v18];
LABEL_20:
  [(NSMutableDictionary *)self->_waitIdentifiers removeObjectForKey:a3];
  [(NSCondition *)self->_cond broadcast];
  [(NSCondition *)self->_cond unlock];
  if (v12)
  {
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v21 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v22 = [NSString stringWithUTF8String:"-[TSKAccessController waitOnIdentifier:untilDate:releaseReadWhileWaiting:]"];
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 226, @"should only reacquire read for secondary threads");
    }
    [(TSKAccessController *)self p_readLock];
  }
  return v17 != 0;
}

- (void)signalIdentifier:(id)a3
{
  [(NSCondition *)self->_cond lock];
  if ([(NSMutableDictionary *)self->_signalIdentifiers objectForKey:a3])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKAccessController signalIdentifier:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 237, @"multiple threads cannot signal the same identifier simultaneously");
  }
  -[NSMutableDictionary setObject:forKey:](self->_signalIdentifiers, "setObject:forKey:", [MEMORY[0x263F08B88] currentThread], a3);
  uint64_t v7 = [(NSMutableDictionary *)self->_waitIdentifiers objectForKey:a3];
  if (v7) {
    [(TSKAccessController *)self p_signalThread:v7];
  }
  while ([(NSMutableDictionary *)self->_signalIdentifiers objectForKey:a3])
    -[TSKAccessController p_waitWithCondition:untilDate:](self, "p_waitWithCondition:untilDate:", self->_cond, [MEMORY[0x263EFF910] distantFuture]);
  cond = self->_cond;

  [(NSCondition *)cond unlock];
}

- (void)spinMainThreadRunLoopUntil:(SEL)a3 onTarget:(id)a4
{
  [(NSCondition *)self->_cond lock];
  while (![a4 performSelector:a3])
  {
    if (!-[TSKAccessController p_waitWithCondition:untilDate:](self, "p_waitWithCondition:untilDate:", self->_cond, [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.5]))
    {
      uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSKAccessController spinMainThreadRunLoopUntil:onTarget:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 279, @"we should never timeout in -spinMainThreadRunLoopUntil:onTarget:");
    }
  }
  cond = self->_cond;

  [(NSCondition *)cond unlock];
}

- (void)performRead:(id)a3
{
}

- (void)performRead:(SEL)a3 withTarget:(id)a4 argument:(void *)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__TSKAccessController_performRead_withTarget_argument___block_invoke;
  v5[3] = &unk_2646B0700;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = a5;
  [(TSKAccessController *)self performRead:v5];
}

uint64_t __55__TSKAccessController_performRead_withTarget_argument___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 40) withObject:*(void *)(a1 + 48)];
}

- (void)performRead:(SEL)a3 withTarget:(id)a4 argument:(void *)a5 argument2:(void *)a6
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__TSKAccessController_performRead_withTarget_argument_argument2___block_invoke;
  v6[3] = &unk_2646B0728;
  v6[4] = a4;
  v6[5] = a3;
  v6[6] = a5;
  v6[7] = a6;
  [(TSKAccessController *)self performRead:v6];
}

uint64_t __65__TSKAccessController_performRead_withTarget_argument_argument2___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 40) withObject:*(void *)(a1 + 48) withObject:*(void *)(a1 + 56)];
}

- (void)performWrite:(id)a3
{
}

- (void)performWrite:(id)a3 blockMainThread:(BOOL)a4
{
  BOOL v4 = a4;
  [(TSKAccessController *)self p_enqueueWriteAndBlock];
  [(TSKAccessController *)self p_writeLockAndBlockMainThread:v4];
  (*((void (**)(id))a3 + 2))(a3);
  [(TSKAccessController *)self p_writeUnlock];
  [(TSKAccessController *)self p_dequeueWrite];
}

- (void)performWrite:(SEL)a3 withTarget:(id)a4 argument:(void *)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__TSKAccessController_performWrite_withTarget_argument___block_invoke;
  v5[3] = &unk_2646B0700;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = a5;
  [(TSKAccessController *)self performWrite:v5];
}

uint64_t __56__TSKAccessController_performWrite_withTarget_argument___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 40) withObject:*(void *)(a1 + 48)];
}

- (void)performRead:(SEL)a3 thenReadOnMainThread:(SEL)a4 withTarget:(id)a5 argument:(void *)a6
{
  [(TSKAccessController *)self p_enqueueWriteAndBlock];
  [(TSKAccessController *)self p_readLock];
  if (a3) {
    [a5 performSelector:a3 withObject:a6];
  }
  uint64_t v11 = [[TSKACReadArguments alloc] initWithSelector:a4 target:a5 argument:a6];
  [(TSKAccessController *)self p_scheduleMainThreadRead:v11];

  [(TSKAccessController *)self p_readUnlock];
  [(TSKAccessController *)self p_dequeueWrite];
}

- (void)performRead:(SEL)a3 thenWrite:(SEL)a4 thenReadOnMainThread:(SEL)a5 withTarget:(id)a6 argument:(void *)a7
{
}

- (void)performRead:(SEL)a3 thenWrite:(SEL)a4 thenReadOnMainThread:(SEL)a5 withTarget:(id)a6 argument:(void *)a7 passReadResultToMainThreadRead:(BOOL)a8
{
  BOOL v8 = a8;
  [(TSKAccessController *)self p_enqueueWriteAndBlock];
  if (a3)
  {
    if (strcmp((const char *)objc_msgSend((id)objc_msgSend(a6, "methodSignatureForSelector:", a3), "methodReturnType"), "B"))
    {
      v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"-[TSKAccessController performRead:thenWrite:thenReadOnMainThread:withTarget:argument:passReadResultToMainThreadRead:]"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 393, @"Expected method that returns a BOOL for readSelector");
    }
    [(TSKAccessController *)self p_readLock];
    uint64_t v17 = (uint64_t)objc_msgSend(a6, a3, a7);
    [(TSKAccessController *)self p_readUnlock];
    if (a5) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v17 = 1;
    if (a5)
    {
LABEL_5:
      if (v8)
      {
        uint64_t v18 = [TSKACReadArguments alloc];
        v19 = -[TSKACReadArguments initWithSelector:target:argument:argument2:](v18, "initWithSelector:target:argument:argument2:", a5, a6, a7, [NSNumber numberWithBool:v17]);
      }
      else
      {
        v19 = [[TSKACReadArguments alloc] initWithSelector:a5 target:a6 argument:a7];
      }
      v21 = v19;
      if (a4) {
        char v22 = v17;
      }
      else {
        char v22 = 0;
      }
      if (v22) {
        goto LABEL_17;
      }
      if (v19)
      {
        [(TSKAccessController *)self p_scheduleMainThreadRead:v19];
      }
      goto LABEL_22;
    }
  }
  char v20 = v17 ^ 1;
  if (!a4) {
    char v20 = 1;
  }
  if ((v20 & 1) == 0)
  {
    v21 = 0;
LABEL_17:
    [(TSKAccessController *)self p_writeLockAndBlockMainThread:1];
    [a6 performSelector:a4 withObject:a7];
    if (v21)
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __117__TSKAccessController_performRead_thenWrite_thenReadOnMainThread_withTarget_argument_passReadResultToMainThreadRead___block_invoke;
      v23[3] = &unk_2646B0750;
      v23[4] = self;
      v23[5] = v21;
      [(TSKAccessController *)self p_writeUnlockAndPerformWithMainThreadBlocked:v23];
    }
  }
LABEL_22:
  [(TSKAccessController *)self p_dequeueWrite];
}

void __117__TSKAccessController_performRead_thenWrite_thenReadOnMainThread_withTarget_argument_passReadResultToMainThreadRead___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "p_scheduleMainThreadRead:", *(void *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
}

- (void)p_readLock
{
  if ([(TSKAccessController *)self p_hasWrite])
  {
    v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAccessController p_readLock]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 489, @"can't acquire a read lock if we already have a write lock");
  }
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if (self->_secondaryThreadWriting)
    {
      uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v6 = [NSString stringWithUTF8String:"-[TSKAccessController p_readLock]"];
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 493, @"trying to acquire read from MT while a secondary thread is writing");
    }
  }
  else
  {
    [(NSCondition *)self->_cond lock];
    pthread_t v7 = pthread_self();
    pthread_t v8 = v7;
    unsigned int readerCount = self->_readerCount;
    if (readerCount)
    {
      p_count = &self->_readerInfo[0].count;
      unsigned int v11 = self->_readerCount;
      do
      {
        if (*((pthread_t *)p_count - 1) == v7)
        {
          int v15 = 0;
          ++*p_count;
          goto LABEL_14;
        }
        p_count += 4;
        --v11;
      }
      while (v11);
      if (readerCount >= 0x40)
      {
        int v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v13 = [NSString stringWithUTF8String:"-[TSKAccessController p_readLock]"];
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 517, @"Maximum number of readers reached");
        unsigned int readerCount = self->_readerCount;
      }
    }
    self->_unsigned int readerCount = readerCount + 1;
    uint64_t v14 = (char *)self + 16 * readerCount;
    *((void *)v14 + 32) = v8;
    int v15 = 1;
    *((_DWORD *)v14 + 66) = 1;
LABEL_14:
    [(NSCondition *)self->_cond unlock];
    if (v15) {
      pthread_rwlock_rdlock(&self->_rwLock);
    }
  }
  uint64_t v16 = (void *)[(TSUWeakReference *)self->_delegate object];
  if (objc_opt_respondsToSelector())
  {
    [v16 didAcquireReadLock];
  }
}

- (BOOL)p_hasRead
{
  if ([MEMORY[0x263F08B88] isMainThread]) {
    return !self->_secondaryThreadWriting;
  }
  [(NSCondition *)self->_cond lock];
  pthread_t v4 = pthread_self();
  unint64_t readerCount = self->_readerCount;
  if (readerCount)
  {
    readerInfo = self->_readerInfo;
    unint64_t v7 = 1;
    do
    {
      threadId = readerInfo->threadId;
      ++readerInfo;
      pthread_t v8 = threadId;
      BOOL v3 = threadId == v4;
      if (v7 >= readerCount) {
        break;
      }
      ++v7;
    }
    while (v8 != v4);
  }
  else
  {
    BOOL v3 = 0;
  }
  [(NSCondition *)self->_cond unlock];
  return v3;
}

- (BOOL)p_hasWrite
{
  [(NSCondition *)self->_cond lock];
  BOOL v4 = [(NSMutableArray *)self->_writerQueue count]
    && (BOOL v3 = (void *)[(NSMutableArray *)self->_writerQueue objectAtIndex:0],
        v3 == [(TSKAccessController *)self p_threadIdentifier])
    && self->_writeHeld;
  [(NSCondition *)self->_cond unlock];
  return v4;
}

- (void)p_readUnlock
{
  BOOL v3 = (void *)[(TSUWeakReference *)self->_delegate object];
  if (objc_opt_respondsToSelector()) {
    [v3 willRelinquishReadLock];
  }
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if (self->_secondaryThreadWriting)
    {
      BOOL v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSKAccessController p_readUnlock]"];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"];
      [v4 handleFailureInFunction:v5 file:v6 lineNumber:609 description:@"releasing read from MT when a secondary thread is writing"];
    }
  }
  else
  {
    [(NSCondition *)self->_cond lock];
    pthread_t v7 = pthread_self();
    unsigned int readerCount = self->_readerCount;
    if (readerCount)
    {
      int v9 = 0;
      readerInfo = self->_readerInfo;
      while (readerInfo->threadId != v7)
      {
        ++v9;
        ++readerInfo;
        if (readerCount == v9) {
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      unsigned int v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[TSKAccessController p_readUnlock]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 627, @"Trying to unlock read for a reader that doesn't hold read lock");
      int v9 = -1;
    }
    uint64_t v13 = &self->_readerInfo[v9];
    p_unsigned int count = &v13->count;
    unsigned int count = v13->count;
    if (!count)
    {
      uint64_t v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v17 = [NSString stringWithUTF8String:"-[TSKAccessController p_readUnlock]"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 629, @"Reader is in the list of readers but doesn't have any read locks held");
      unsigned int count = *p_count;
    }
    unsigned int v18 = count - 1;
    unsigned int *p_count = v18;
    if (!v18)
    {
      unsigned int v19 = self->_readerCount - 1;
      self->_unsigned int readerCount = v19;
      _TSKThreadInfo *v13 = self->_readerInfo[v19];
      pthread_rwlock_unlock(&self->_rwLock);
    }
    [(NSCondition *)self->_cond unlock];
  }
}

- (void)p_asyncPerformSelectorOnMainThread:(SEL)a3 withTarget:(id)a4 argument:(void *)a5
{
  unsigned int v11 = a5;
  pthread_t v8 = objc_msgSend(a4, "methodSignatureForSelector:");
  int v9 = (void *)[MEMORY[0x263EFF958] invocationWithMethodSignature:v8];
  [v9 setTarget:a4];
  [v9 setSelector:a3];
  if ((unint64_t)[v8 numberOfArguments] >= 3) {
    [v9 setArgument:&v11 atIndex:2];
  }
  [(NSCondition *)self->_cond lock];
  [(NSMutableArray *)self->_pendingMainThreadInvocations addObject:v9];
  CFRunLoopSourceSignal(self->_mainThreadPingSource);
  Main = CFRunLoopGetMain();
  CFRunLoopWakeUp(Main);
  [(NSCondition *)self->_cond broadcast];
  [(NSCondition *)self->_cond unlock];
}

- (void)p_writeLockAndBlockMainThread:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0
    && [(TSKAccessController *)self p_hasRead])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKAccessController p_writeLockAndBlockMainThread:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 695, @"shouldn't have read while waiting on write");
  }
  pthread_rwlock_wrlock(&self->_rwLock);
  if (self->_writeHeld)
  {
    pthread_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSKAccessController p_writeLockAndBlockMainThread:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 700, @"Write mutex should be available; we are holding the write lock");
  }
  if (v3 && ([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    [(TSKAccessController *)self p_asyncPerformSelectorOnMainThread:sel_p_blockMainThreadForWrite withTarget:self argument:0];
    [(TSKAccessController *)self waitOnIdentifier:@"kTSKMainThreadBlockedIdentifier"];
    self->_writeBlockedMainThread = 1;
  }
  self->_writeHeld = 1;
}

- (void)p_writeUnlock
{
}

- (void)p_writeUnlockAndPerformWithMainThreadBlocked:(id)a3
{
  if (![(TSKAccessController *)self p_hasWrite])
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKAccessController p_writeUnlockAndPerformWithMainThreadBlocked:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 719, @"Must already be holding the write mutex when unlocking write");
  }
  pthread_rwlock_unlock(&self->_rwLock);
  if (self->_writeBlockedMainThread) {
    [(TSKAccessController *)self signalIdentifier:@"kTSKWriteCompleteIdentifier"];
  }
  self->_writeHeld = 0;
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
  if (self->_writeBlockedMainThread) {
    [(TSKAccessController *)self signalIdentifier:@"kTSKPostWriteCompleteIdentifier"];
  }
  self->_writeBlockedMainThread = 0;
}

- (id)p_threadIdentifier
{
  return (id)[MEMORY[0x263F08B88] currentThread];
}

- (void)p_enqueueWriteAndBlock
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if (!self->_secondaryThreadWriting) {
      goto LABEL_7;
    }
    uint64_t v3 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSKAccessController p_enqueueWriteAndBlock]"];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"];
    uint64_t v6 = @"main thread should be locked out while a secondary thread is writing";
    pthread_t v7 = (void *)v3;
    uint64_t v8 = v4;
    uint64_t v9 = 753;
  }
  else
  {
    if (![(TSKAccessController *)self p_hasRead]) {
      goto LABEL_7;
    }
    uint64_t v10 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSKAccessController p_enqueueWriteAndBlock]"];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"];
    uint64_t v6 = @"shouldn't have read while waiting on write";
    pthread_t v7 = (void *)v10;
    uint64_t v8 = v11;
    uint64_t v9 = 757;
  }
  [v7 handleFailureInFunction:v8 file:v5 lineNumber:v9 description:v6];
LABEL_7:
  [(NSCondition *)self->_cond lock];
  id v12 = [(TSKAccessController *)self p_threadIdentifier];
  uint64_t v13 = [(NSMutableArray *)self->_writerQueue indexOfObjectIdenticalTo:v12];
  writerQueue = self->_writerQueue;
  if (v13)
  {
    [(NSMutableArray *)writerQueue addObject:v12];
    while ((id)[(NSMutableArray *)self->_writerQueue objectAtIndex:0] != v12)
      -[TSKAccessController p_waitWithCondition:untilDate:](self, "p_waitWithCondition:untilDate:", self->_cond, [MEMORY[0x263EFF910] distantFuture]);
    if ((id)[(NSMutableArray *)self->_writerQueue objectAtIndex:0] != v12)
    {
      int v15 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"-[TSKAccessController p_enqueueWriteAndBlock]"];
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 787, @"Expected to block until correct thread was at queue head");
    }
  }
  else
  {
    [(NSMutableArray *)writerQueue insertObject:v12 atIndex:0];
  }
  [(NSCondition *)self->_cond unlock];
}

- (void)p_dequeueWrite
{
  [(NSCondition *)self->_cond lock];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_writerQueue objectAtIndex:0];
  if (v3 != [(TSKAccessController *)self p_threadIdentifier])
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSKAccessController p_dequeueWrite]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 802, @"Dequeueing write for wrong thread");
  }
  [(NSMutableArray *)self->_writerQueue removeObjectAtIndex:0];
  if ([(NSMutableArray *)self->_writerQueue count]) {
    [(TSKAccessController *)self p_signalThread:[(NSMutableArray *)self->_writerQueue objectAtIndex:0]];
  }
  [(NSCondition *)self->_cond unlock];
}

- (void)p_scheduleMainThreadRead:(id)a3
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    uint64_t v5 = [a3 selector];
    uint64_t v6 = [a3 target];
    uint64_t v7 = [a3 argument];
    uint64_t v8 = [a3 argument2];
    [(TSKAccessController *)self performRead:v5 withTarget:v6 argument:v7 argument2:v8];
  }
  else
  {
    [(TSKAccessController *)self p_asyncPerformSelectorOnMainThread:sel_p_performReadOnMainThread_ withTarget:self argument:a3];
    [(TSKAccessController *)self waitOnIdentifier:@"kTSKMainThreadReadCompletedIdentifier"];
  }
}

- (void)p_performReadOnMainThread:(id)a3
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSKAccessController p_performReadOnMainThread:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 838, @"p_performReadOnMainThread may only be called from main thread");
  }
  if (![(TSKAccessController *)self p_hasRead])
  {
    uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSKAccessController p_performReadOnMainThread:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKAccessController.m"), 839, @"should have read privs on the main thread");
  }
  objc_msgSend((id)objc_msgSend(a3, "target"), "performSelector:withObject:withObject:", objc_msgSend(a3, "selector"), objc_msgSend(a3, "argument"), objc_msgSend(a3, "argument2"));
  [(TSKAccessController *)self signalIdentifier:@"kTSKMainThreadReadCompletedIdentifier"];
}

- (void)p_flushPendingMainThreadBlocksQueueAcquiringLock:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  if (v3) {
    [(NSCondition *)self->_cond lock];
  }
  while ([(NSMutableArray *)self->_pendingMainThreadInvocations count])
  {
    id v5 = (id)[(NSMutableArray *)self->_pendingMainThreadInvocations objectAtIndex:0];
    [(NSMutableArray *)self->_pendingMainThreadInvocations removeObjectAtIndex:0];
    [(NSCondition *)self->_cond unlock];
    [v5 invoke];
    [(NSCondition *)self->_cond lock];
  }
  if (v3) {
    [(NSCondition *)self->_cond unlock];
  }
}

- (BOOL)p_waitWithCondition:(id)a3 untilDate:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "isMainThread")
    && [(NSMutableArray *)self->_pendingMainThreadInvocations count])
  {
    [(TSKAccessController *)self p_flushPendingMainThreadBlocksQueueAcquiringLock:0];
    return 1;
  }
  else
  {
    char v7 = [a3 waitUntilDate:a4];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "isMainThread")) {
      [(TSKAccessController *)self p_flushPendingMainThreadBlocksQueueAcquiringLock:0];
    }
  }
  return v7;
}

- (void)p_signalThread:(id)a3
{
  if (a3) {
    [(NSCondition *)self->_cond broadcast];
  }
}

@end