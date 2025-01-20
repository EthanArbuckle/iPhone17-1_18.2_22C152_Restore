@interface CLKUIMetalResourcePool
+ (id)bufferPoolWithLength:(unint64_t)a3 andOptions:(unint64_t)a4 expectedCountPerFrame:(unint64_t)a5;
+ (id)texturePoolWithDescriptor:(id)a3 expectedCountPerFrame:(unint64_t)a4;
- (CLKUIMetalResourcePool)initWithCreationBlock:(id)a3 expectedCountPerFrame:(unint64_t)a4;
- (id)dequeueReusableResource;
- (id)dequeueReusableResourceForUseOnCommandBuffer:(id)a3;
- (void)returnReusableResource:(id)a3;
@end

@implementation CLKUIMetalResourcePool

+ (id)bufferPoolWithLength:(unint64_t)a3 andOptions:(unint64_t)a4 expectedCountPerFrame:(unint64_t)a5
{
  v8 = [CLKUIMetalResourcePool alloc];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__CLKUIMetalResourcePool_bufferPoolWithLength_andOptions_expectedCountPerFrame___block_invoke;
  v11[3] = &__block_descriptor_48_e5__8__0l;
  v11[4] = a3;
  v11[5] = a4;
  v9 = [(CLKUIMetalResourcePool *)v8 initWithCreationBlock:v11 expectedCountPerFrame:a5];
  return v9;
}

id __80__CLKUIMetalResourcePool_bufferPoolWithLength_andOptions_expectedCountPerFrame___block_invoke(uint64_t a1)
{
  v2 = +[CLKUIMetalResourceManager sharedDevice];
  v3 = (void *)[v2 newBufferWithLength:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];

  return v3;
}

+ (id)texturePoolWithDescriptor:(id)a3 expectedCountPerFrame:(unint64_t)a4
{
  id v5 = a3;
  v6 = [CLKUIMetalResourcePool alloc];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__CLKUIMetalResourcePool_texturePoolWithDescriptor_expectedCountPerFrame___block_invoke;
  v10[3] = &unk_1E609E3C8;
  id v11 = v5;
  id v7 = v5;
  v8 = [(CLKUIMetalResourcePool *)v6 initWithCreationBlock:v10 expectedCountPerFrame:a4];

  return v8;
}

id __74__CLKUIMetalResourcePool_texturePoolWithDescriptor_expectedCountPerFrame___block_invoke(uint64_t a1)
{
  v2 = +[CLKUIMetalResourceManager sharedDevice];
  v3 = (void *)[v2 newTextureWithDescriptor:*(void *)(a1 + 32)];

  return v3;
}

- (CLKUIMetalResourcePool)initWithCreationBlock:(id)a3 expectedCountPerFrame:(unint64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLKUIMetalResourcePool;
  id v7 = [(CLKUIMetalResourcePool *)&v15 init];
  if (v7)
  {
    v8 = _Block_copy(v6);
    id creationBlock = v7->_creationBlock;
    v7->_id creationBlock = v8;

    dispatch_queue_t v10 = dispatch_queue_create("CLKUIMetalResourcePoolQueue", 0);
    buffersQueue = v7->_buffersQueue;
    v7->_buffersQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = objc_opt_new();
    resourcePool = v7->_resourcePool;
    v7->_resourcePool = (NSMutableArray *)v12;

    v7->_expectedCountPerFrame = a4;
  }

  return v7;
}

- (id)dequeueReusableResourceForUseOnCommandBuffer:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  buffersQueue = self->_buffersQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__CLKUIMetalResourcePool_dequeueReusableResourceForUseOnCommandBuffer___block_invoke;
  block[3] = &unk_1E609E3F0;
  block[4] = self;
  block[5] = &v12;
  dispatch_sync(buffersQueue, block);
  if (!v13[5])
  {
    uint64_t v6 = (*((void (**)(void))self->_creationBlock + 2))();
    id v7 = (void *)v13[5];
    v13[5] = v6;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__CLKUIMetalResourcePool_dequeueReusableResourceForUseOnCommandBuffer___block_invoke_2;
  v10[3] = &unk_1E609E418;
  void v10[4] = self;
  v10[5] = &v12;
  [v4 addCompletedHandler:v10];
  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

uint64_t __71__CLKUIMetalResourcePool_dequeueReusableResourceForUseOnCommandBuffer___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  if (result)
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) lastObject];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16);
    return [v6 removeLastObject];
  }
  return result;
}

uint64_t __71__CLKUIMetalResourcePool_dequeueReusableResourceForUseOnCommandBuffer___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) returnReusableResource:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (id)dequeueReusableResource
{
  return [(CLKUIMetalResourcePool *)self dequeueReusableResourceForUseOnCommandBuffer:0];
}

- (void)returnReusableResource:(id)a3
{
  id v4 = a3;
  buffersQueue = self->_buffersQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CLKUIMetalResourcePool_returnReusableResource___block_invoke;
  v7[3] = &unk_1E609DE10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(buffersQueue, v7);
}

unint64_t __49__CLKUIMetalResourcePool_returnReusableResource___block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  uint64_t v3 = *(void *)(a1 + 32);
  if (result < *(void *)(v3 + 24))
  {
    id v4 = *(void **)(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v4 addObject:v5];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_creationBlock, 0);
  objc_storeStrong((id *)&self->_resourcePool, 0);
  objc_storeStrong((id *)&self->_buffersQueue, 0);
}

@end