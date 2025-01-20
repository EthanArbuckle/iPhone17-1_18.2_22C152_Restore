@interface _UIDocumentURLChangeObserver
- (BOOL)isObserving;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (_UIDocumentURLChangeObserver)initWithFileURL:(id)a3;
- (id)changeHandler;
- (void)presentedItemDidChange;
- (void)presentedItemDidMoveToURL:(id)a3;
- (void)setChangeHandler:(id)a3;
- (void)startObservingWithChangeHandler:(id)a3;
- (void)stopObserving;
@end

@implementation _UIDocumentURLChangeObserver

- (_UIDocumentURLChangeObserver)initWithFileURL:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIDocumentURLChangeObserver.m", 26, @"Invalid parameter not satisfying: %@", @"fileURL != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIDocumentURLChangeObserver;
  v7 = [(_UIDocumentURLChangeObserver *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_presentedItemURL, a3);
    uint64_t v9 = [MEMORY[0x1E4F28F08] mainQueue];
    presentedItemOperationQueue = v8->_presentedItemOperationQueue;
    v8->_presentedItemOperationQueue = (NSOperationQueue *)v9;
  }
  return v8;
}

- (BOOL)isObserving
{
  v2 = [(_UIDocumentURLChangeObserver *)self changeHandler];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)startObservingWithChangeHandler:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"_UIDocumentURLChangeObserver.m", 42, @"Invalid parameter not satisfying: %@", @"changeHandler != NULL" object file lineNumber description];
  }
  if ([(_UIDocumentURLChangeObserver *)self isObserving])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UIDocumentURLChangeObserver.m" lineNumber:43 description:@"Already observing."];
  }
  [(_UIDocumentURLChangeObserver *)self setChangeHandler:v7];
  [MEMORY[0x1E4F28CA0] addFilePresenter:self];
}

- (void)stopObserving
{
  if (![(_UIDocumentURLChangeObserver *)self isObserving])
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"_UIDocumentURLChangeObserver.m" lineNumber:50 description:@"Not observing."];
  }
  [MEMORY[0x1E4F28CA0] removeFilePresenter:self];
  [(_UIDocumentURLChangeObserver *)self setChangeHandler:0];
}

- (void)presentedItemDidChange
{
  v2 = [(_UIDocumentURLChangeObserver *)self changeHandler];
  if (v2)
  {
    id v3 = v2;
    v2[2](v2, 0);
    v2 = (void (**)(void, void))v3;
  }
}

- (void)presentedItemDidMoveToURL:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_presentedItemURL, a3);
  uint64_t v5 = [(_UIDocumentURLChangeObserver *)self changeHandler];
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }
}

- (NSURL)presentedItemURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 16, 1);
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_presentedItemOperationQueue, 0);
  objc_storeStrong((id *)&self->_presentedItemURL, 0);
}

@end