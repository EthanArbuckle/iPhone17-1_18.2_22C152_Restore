@interface GraphRenderer
+ (id)sharedRenderer;
+ (void)clearSharedRenderer;
- (GraphRenderer)init;
- (void)performRenderOperation:(id)a3;
@end

@implementation GraphRenderer

+ (id)sharedRenderer
{
  v2 = (void *)__sharedInstance_0;
  if (!__sharedInstance_0)
  {
    v3 = objc_alloc_init(GraphRenderer);
    v4 = (void *)__sharedInstance_0;
    __sharedInstance_0 = (uint64_t)v3;

    v2 = (void *)__sharedInstance_0;
  }

  return v2;
}

+ (void)clearSharedRenderer
{
  v2 = (void *)__sharedInstance_0;
  __sharedInstance_0 = 0;
}

- (GraphRenderer)init
{
  v6.receiver = self;
  v6.super_class = (Class)GraphRenderer;
  v2 = [(GraphRenderer *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.stocks.graph_renderer", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)performRenderOperation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__GraphRenderer_performRenderOperation___block_invoke;
  block[3] = &unk_26467D130;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

uint64_t __40__GraphRenderer_performRenderOperation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) render];
}

- (void).cxx_destruct
{
}

@end