@interface _UIActivityResourceLoader
- (_UIActivityResourceLoader)initWithQueue:(id)a3 loadBlock:(id)a4;
- (void)_getResourceWithBlock:(id)a3;
- (void)_loadResourceWithBlock:(id)a3;
- (void)getResourceWithBlock:(id)a3;
- (void)loadResourceIfNeeded;
@end

@implementation _UIActivityResourceLoader

- (_UIActivityResourceLoader)initWithQueue:(id)a3 loadBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIActivityResourceLoader;
  v9 = [(_UIActivityResourceLoader *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = MEMORY[0x1A6229A90](v8);
    id loadBlock = v10->_loadBlock;
    v10->_id loadBlock = (id)v11;

    dispatch_group_t v13 = dispatch_group_create();
    group = v10->_group;
    v10->_group = (OS_dispatch_group *)v13;

    id resource = v10->_resource;
    v10->_id resource = 0;
  }
  return v10;
}

- (void)_loadResourceWithBlock:(id)a3
{
  v4 = (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  id resource = self->_resource;
  self->_id resource = v4;
  MEMORY[0x1F41817F8](v4, resource);
}

- (void)loadResourceIfNeeded
{
  id loadBlock = self->_loadBlock;
  if (loadBlock)
  {
    v4 = (void *)MEMORY[0x1A6229A90](loadBlock, a2);
    id v5 = self->_loadBlock;
    self->_id loadBlock = 0;

    id location = 0;
    objc_initWeak(&location, self);
    group = self->_group;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49___UIActivityResourceLoader_loadResourceIfNeeded__block_invoke;
    block[3] = &unk_1E5A22878;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    id v8 = v4;
    dispatch_group_async(group, queue, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_getResourceWithBlock:(id)a3
{
}

- (void)getResourceWithBlock:(id)a3
{
  v4 = (void (**)(id, id))a3;
  if (self->_loadBlock)
  {
    [(_UIActivityResourceLoader *)self loadResourceIfNeeded];
  }
  else if (!dispatch_group_wait((dispatch_group_t)self->_group, 0))
  {
    v4[2](v4, self->_resource);
    goto LABEL_5;
  }
  id location = 0;
  objc_initWeak(&location, self);
  group = self->_group;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___UIActivityResourceLoader_getResourceWithBlock___block_invoke;
  block[3] = &unk_1E5A22878;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
LABEL_5:
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resource, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong(&self->_loadBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end