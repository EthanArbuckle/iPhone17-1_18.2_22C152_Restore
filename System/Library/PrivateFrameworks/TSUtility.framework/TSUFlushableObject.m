@interface TSUFlushableObject
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)hasFlushableContent;
- (TSUFlushableObject)init;
- (TSUFlushableObject)retain;
- (id)ownerAutoreleasedAccess;
- (id)ownerRetain;
- (unint64_t)retainCount;
- (void)addOwner;
- (void)dealloc;
- (void)flush;
- (void)ownerRelease;
- (void)ownerWillAccess;
- (void)release;
@end

@implementation TSUFlushableObject

+ (id)allocWithZone:(_NSZone *)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___TSUFlushableObject;
  id result = objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  if (result) {
    *((_DWORD *)result + 2) = 1;
  }
  return result;
}

- (TSUFlushableObject)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSUFlushableObject;
  v2 = [(TSUFlushableObject *)&v4 init];
  if (v2) {
    v2->_flushingManagerIvarLock = (NSLocking *)objc_alloc_init(MEMORY[0x263F08AE0]);
  }
  return v2;
}

- (void)dealloc
{
  self->_flushingManagerIvarLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUFlushableObject;
  [(TSUFlushableObject *)&v3 dealloc];
}

- (id)ownerRetain
{
  return self;
}

- (void)ownerRelease
{
  int add = atomic_fetch_add(&self->_ownerCount, 0xFFFFFFFF);
  if (add <= 0)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSUFlushableObject ownerRelease]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushableObject.m"), 68, @"-ownerRelease called too many times");
  }
  else if (add == 1)
  {
    [(NSLocking *)self->_flushingManagerIvarLock lock];
    flushingManager = self->_flushingManager;
    if (flushingManager)
    {
      [(TSUFlushingManager *)flushingManager removeObject:self];
      self->_flushingManager = 0;
    }
    [(NSLocking *)self->_flushingManagerIvarLock unlock];
  }
  if (atomic_fetch_add(&self->_retainCount, 0xFFFFFFFF) == 1)
  {
    [(TSUFlushableObject *)self dealloc];
  }
}

- (id)ownerAutoreleasedAccess
{
  if (self->_retainCount < self->_ownerCount)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSUFlushableObject ownerAutoreleasedAccess]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushableObject.m"), 92, @"Bad retain count");
  }
  id v5 = self;
  [(NSLocking *)self->_flushingManagerIvarLock lock];
  flushingManager = self->_flushingManager;
  if (flushingManager) {
    [(TSUFlushingManager *)flushingManager unsafeToFlush:self];
  }
  [(NSLocking *)self->_flushingManagerIvarLock unlock];
  return self;
}

- (void)ownerWillAccess
{
  if (self->_retainCount < self->_ownerCount)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSUFlushableObject ownerWillAccess]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushableObject.m"), 112, @"Bad retain count");
  }
  id v5 = self;
  [(NSLocking *)self->_flushingManagerIvarLock lock];
  flushingManager = self->_flushingManager;
  if (flushingManager) {
    [(TSUFlushingManager *)flushingManager unsafeToFlush:self];
  }
  flushingManagerIvarLock = self->_flushingManagerIvarLock;
  [(NSLocking *)flushingManagerIvarLock unlock];
}

- (TSUFlushableObject)retain
{
  return self;
}

- (void)release
{
  unsigned int add = atomic_fetch_add(&self->_retainCount, 0xFFFFFFFF);
  unsigned int v4 = add - 1;
  if (add == 1)
  {
    [(TSUFlushableObject *)self dealloc];
  }
  else if (v4 == self->_ownerCount && [(TSUFlushableObject *)self hasFlushableContent])
  {
    objc_sync_enter(self);
    if (v4 == self->_ownerCount)
    {
      BOOL v5 = [(TSUFlushableObject *)self hasFlushableContent];
      objc_sync_exit(self);
      if (v5)
      {
        [(NSLocking *)self->_flushingManagerIvarLock lock];
        flushingManager = self->_flushingManager;
        if (flushingManager)
        {
          [(TSUFlushingManager *)flushingManager safeToFlush:self wasAccessed:1];
        }
        else
        {
          objc_msgSend(+[TSUFlushingManager sharedManager](TSUFlushingManager, "sharedManager"), "addObject:", self);
          self->_flushingManager = (TSUFlushingManager *)+[TSUFlushingManager sharedManager];
        }
        flushingManagerIvarLock = self->_flushingManagerIvarLock;
        [(NSLocking *)flushingManagerIvarLock unlock];
      }
    }
    else
    {
      objc_sync_exit(self);
    }
  }
}

- (unint64_t)retainCount
{
  return self->_retainCount;
}

- (void)addOwner
{
}

- (BOOL)hasFlushableContent
{
  return 0;
}

- (void)flush
{
  objc_sync_enter(self);
  [(TSUFlushableObject *)self unload];
  self->_flushingManager = 0;
  objc_sync_exit(self);
}

@end