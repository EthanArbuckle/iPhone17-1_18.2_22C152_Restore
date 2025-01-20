@interface PFMutualExclusionAssertion
- (void)enterCriticalSection;
- (void)leaveCriticalSection;
- (void)performCriticalSection:(id)a3;
@end

@implementation PFMutualExclusionAssertion

- (void)performCriticalSection:(id)a3
{
  v4 = (void (**)(void))a3;
  [(PFMutualExclusionAssertion *)self enterCriticalSection];
  v4[2](v4);

  [(PFMutualExclusionAssertion *)self leaveCriticalSection];
}

- (void)leaveCriticalSection
{
  obj = self;
  objc_sync_enter(obj);
  if (!obj->_inCriticalSection) {
    _PFAssertFailHandler((uint64_t)"-[PFMutualExclusionAssertion leaveCriticalSection]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoFoundation/Source/PFAssert.m", 488, @"Leave while not in critical section", v2, v3, v4, v5, v6);
  }
  obj->_inCriticalSection = 0;
  objc_sync_exit(obj);
}

- (void)enterCriticalSection
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_inCriticalSection) {
    _PFAssertFailHandler((uint64_t)"-[PFMutualExclusionAssertion enterCriticalSection]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoFoundation/Source/PFAssert.m", 480, @"Enter while already in critical section", v2, v3, v4, v5, v6);
  }
  obj->_inCriticalSection = 1;
  objc_sync_exit(obj);
}

@end