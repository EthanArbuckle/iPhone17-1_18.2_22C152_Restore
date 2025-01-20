@interface PFDContextManager
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedInstance;
- (BOOL)setContext:(id)a3 forArchive:(id)a4;
- (PFDContextManager)init;
- (id)contextForArchive:(id)a3;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)removeContextForArchive:(id)a3;
@end

@implementation PFDContextManager

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___PFDContextManager;
  return [super allocWithZone:0];
}

+ (id)sharedInstance
{
  id result = (id)qword_5737F0;
  if (!qword_5737F0)
  {
    objc_sync_enter(a1);
    if (!qword_5737F0)
    {
      id v4 = objc_msgSend(objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      qword_5737F0 = (uint64_t)v4;
      if (!v4) {
        [+[TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFDContextManager sharedInstance]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDContextManager.mm") lineNumber:30 description:@"Couldn't create singleton instance of %@", a1];
      }
    }
    objc_sync_exit(a1);
    return (id)qword_5737F0;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (PFDContextManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFDContextManager;
  v2 = [(PFDContextManager *)&v4 init];
  if (v2)
  {
    v2->mStorage = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mStorageLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFDContextManager;
  [(PFDContextManager *)&v3 dealloc];
}

- (id)contextForArchive:(id)a3
{
  p_mStorageLock = &self->mStorageLock;
  os_unfair_lock_lock(&self->mStorageLock);
  id v6 = [(NSMutableDictionary *)self->mStorage objectForKey:a3];
  os_unfair_lock_unlock(p_mStorageLock);
  return v6;
}

- (BOOL)setContext:(id)a3 forArchive:(id)a4
{
  p_mStorageLock = &self->mStorageLock;
  os_unfair_lock_lock(&self->mStorageLock);
  id v8 = [(NSMutableDictionary *)self->mStorage objectForKey:a4];
  if (!v8) {
    [(NSMutableDictionary *)self->mStorage setObject:a3 forKey:a4];
  }
  os_unfair_lock_unlock(p_mStorageLock);
  return v8 == 0;
}

- (void)removeContextForArchive:(id)a3
{
  p_mStorageLock = &self->mStorageLock;
  os_unfair_lock_lock(&self->mStorageLock);
  [self->mStorage objectForKey:a3] teardown
  [(NSMutableDictionary *)self->mStorage removeObjectForKey:a3];

  os_unfair_lock_unlock(p_mStorageLock);
}

@end