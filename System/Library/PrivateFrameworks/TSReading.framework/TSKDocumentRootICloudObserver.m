@interface TSKDocumentRootICloudObserver
- (TSKDocumentRootICloudObserver)initWithBlock:(id)a3;
- (int64_t)identifer;
- (void)dealloc;
- (void)invokeWithDocumentRoot:(id)a3;
@end

@implementation TSKDocumentRootICloudObserver

- (TSKDocumentRootICloudObserver)initWithBlock:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSKDocumentRootICloudObserver;
  v4 = [(TSKDocumentRootICloudObserver *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [a3 copy];
    unint64_t v6 = atomic_fetch_add_explicit(&nextICloudObserverID, 1uLL, memory_order_relaxed) + 1;
    v4->_block = (id)v5;
    v4->_identifer = v6;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKDocumentRootICloudObserver;
  [(TSKDocumentRootICloudObserver *)&v3 dealloc];
}

- (void)invokeWithDocumentRoot:(id)a3
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSKDocumentRootICloudObserver invokeWithDocumentRoot:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKDocumentRoot.mm"), 112, @"This operation must only be performed on the main thread.");
  }
  unint64_t v6 = (void (*)(void))*((void *)self->_block + 2);
  v6();
}

- (int64_t)identifer
{
  return self->_identifer;
}

@end