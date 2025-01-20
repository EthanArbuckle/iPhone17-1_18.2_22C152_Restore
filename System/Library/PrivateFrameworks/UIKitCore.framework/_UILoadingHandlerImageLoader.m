@interface _UILoadingHandlerImageLoader
- (_UILoadingHandlerImageLoader)initWithLoadingQueue:(id)a3 handler:(id)a4;
- (void)_really_loadImage:(id)a3;
@end

@implementation _UILoadingHandlerImageLoader

- (_UILoadingHandlerImageLoader)initWithLoadingQueue:(id)a3 handler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UIImageLoader.m", 233, @"Invalid parameter not satisfying: %@", @"loadingHandler != nil" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)_UILoadingHandlerImageLoader;
  v10 = [(_UIImageLoader *)&v16 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_loadingQueue, a3);
    v12 = _Block_copy(v9);
    id loadingHandler = v11->_loadingHandler;
    v11->_id loadingHandler = v12;
  }
  return v11;
}

- (void)_really_loadImage:(id)a3
{
  id v4 = a3;
  loadingQueue = self->_loadingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50___UILoadingHandlerImageLoader__really_loadImage___block_invoke;
  v7[3] = &unk_1E52DA160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(loadingQueue, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadingHandler, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
}

@end