@interface TSKCountedObserver
- (TSKCountedObserver)initWithObserver:(id)a3;
- (id)observer;
- (unint64_t)decrementCount;
- (unint64_t)incrementCount;
- (void)dealloc;
@end

@implementation TSKCountedObserver

- (TSKCountedObserver)initWithObserver:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSKCountedObserver;
  v4 = [(TSKCountedObserver *)&v6 init];
  if (v4)
  {
    v4->mWeakObserver = (TSUWeakReference *)[objc_alloc(MEMORY[0x263F7C8E0]) initWithObject:a3];
    v4->mCount = 1;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKCountedObserver;
  [(TSKCountedObserver *)&v3 dealloc];
}

- (id)observer
{
  return (id)[(TSUWeakReference *)self->mWeakObserver object];
}

- (unint64_t)incrementCount
{
  unint64_t v2 = self->mCount + 1;
  self->mCount = v2;
  return v2;
}

- (unint64_t)decrementCount
{
  unint64_t mCount = self->mCount;
  if (!mCount)
  {
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSKCountedObserver decrementCount]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKChangeNotifier.m"), 68, @"TSKCountedObserver - attempted to decrement past 0!");
    unint64_t mCount = self->mCount;
  }
  unint64_t result = mCount - 1;
  self->unint64_t mCount = mCount - 1;
  return result;
}

@end