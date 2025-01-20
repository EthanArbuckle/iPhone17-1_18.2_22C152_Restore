@interface _UIImageLoader
+ (id)_imageLoaderWithDataFromItemProvider:(id)a3 typeIdentifier:(id)a4;
+ (id)_imageLoaderWithLoadingQueue:(id)a3 handler:(id)a4;
+ (id)_imageLoaderWithURLRequest:(id)a3 session:(id)a4;
- (BOOL)_isCancelled;
- (BOOL)_isFinished;
- (BOOL)_really_cancel;
- (NSError)_error;
- (UIImage)_image;
- (_UIImageLoader)init;
- (void)_cancel;
- (void)_loadImageWithCompletionQueue:(id)a3 handler:(id)a4;
- (void)_really_loadImage:(id)a3;
@end

@implementation _UIImageLoader

+ (id)_imageLoaderWithLoadingQueue:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_UILoadingHandlerImageLoader alloc] initWithLoadingQueue:v6 handler:v5];

  return v7;
}

+ (id)_imageLoaderWithURLRequest:(id)a3 session:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_UINSURLRequestImageLoader alloc] initWithURLRequest:v6 session:v5];

  return v7;
}

+ (id)_imageLoaderWithDataFromItemProvider:(id)a3 typeIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_UINSItemProviderImageLoader alloc] initWithItemProvider:v6 typeIdentifier:v5];

  return v7;
}

- (_UIImageLoader)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIImageLoader;
  result = [(_UIImageLoader *)&v3 init];
  if (result)
  {
    atomic_store(0, (unsigned __int8 *)&result->_started);
    atomic_store(0, (unsigned __int8 *)&result->_finished);
    atomic_store(0, (unsigned __int8 *)&result->_cancelled);
    result->_trampolineLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (BOOL)_isFinished
{
  return atomic_load_explicit((atomic_uchar *volatile)&self->_finished, memory_order_acquire) & 1;
}

- (BOOL)_isCancelled
{
  return atomic_load_explicit((atomic_uchar *volatile)&self->_cancelled, memory_order_acquire) & 1;
}

- (UIImage)_image
{
  if (atomic_load_explicit((atomic_uchar *volatile)&self->_finished, memory_order_acquire)) {
    return self->_image;
  }
  else {
    return (UIImage *)0;
  }
}

- (NSError)_error
{
  if (atomic_load_explicit((atomic_uchar *volatile)&self->_finished, memory_order_acquire)) {
    return self->_error;
  }
  else {
    return (NSError *)0;
  }
}

- (void)_loadImageWithCompletionQueue:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (atomic_exchange(&self->_started._Value, 1u))
  {
    p_trampolineLock = &self->_trampolineLock;
    os_unfair_lock_lock(&self->_trampolineLock);
    v9 = self;
    v10 = v6;
    id v11 = v7;
    os_unfair_lock_assert_owner(p_trampolineLock);
    if (atomic_load_explicit((atomic_uchar *volatile)&v9->_finished, memory_order_acquire))
    {
      dispatch_async(v10, v11);
    }
    else
    {
      v12 = v9->_completionTrampolines;
      if (!v12)
      {
        v12 = (NSMutableArray *)objc_opt_new();
        objc_storeStrong((id *)&v9->_completionTrampolines, v12);
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = ___addTrampoline_block_invoke;
      aBlock[3] = &unk_1E52DA160;
      v18 = v10;
      id v19 = v11;
      v13 = _Block_copy(aBlock);
      [(NSMutableArray *)v12 addObject:v13];
    }
    os_unfair_lock_unlock(p_trampolineLock);
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56___UIImageLoader__loadImageWithCompletionQueue_handler___block_invoke;
    v14[3] = &unk_1E52E3298;
    v14[4] = self;
    id v15 = v6;
    id v16 = v7;
    [(_UIImageLoader *)self _really_loadImage:v14];
  }
}

- (void)_cancel
{
  if (atomic_exchange(&self->_started._Value, 1u))
  {
    if ((atomic_load_explicit((atomic_uchar *volatile)&self->_finished, memory_order_acquire) & 1) != 0
      || [(_UIImageLoader *)self _isCancelled]
      || ![(_UIImageLoader *)self _really_cancel]
      || (atomic_exchange((atomic_uchar *volatile)&self->_cancelled, 1u) & 1) != 0)
    {
      return;
    }
  }
  else
  {
    [(_UIImageLoader *)self _really_cancel];
    atomic_store(1u, (unsigned __int8 *)&self->_cancelled);
    atomic_store(1u, (unsigned __int8 *)&self->_finished);
  }
  os_unfair_lock_lock(&self->_trampolineLock);
  atomic_store(1u, (unsigned __int8 *)&self->_finished);
  _drainTrampolines(self);
  os_unfair_lock_unlock(&self->_trampolineLock);
}

- (void)_really_loadImage:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
}

- (BOOL)_really_cancel
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionTrampolines, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end