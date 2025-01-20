@interface SUUIOffscreenRenderOperation
+ (void)preheatOffscreenRenderOperations;
- (SUUIOffscreenRenderOperation)init;
- (UIImage)outputImage;
- (id)createLayerBlock;
- (void)main;
- (void)setCreateLayerBlock:(id)a3;
@end

@implementation SUUIOffscreenRenderOperation

- (SUUIOffscreenRenderOperation)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUUIOffscreenRenderOperation;
  v2 = [(SUUIOffscreenRenderOperation *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.iTunesStoreUI.SUUIOffscreenRenderOperation.accessQueu", MEMORY[0x263EF83A8]);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)main
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void _SUUIglDeleteTextures(GLsizei, const GLuint *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SUUIOffscreenRenderOperation.m", 39, @"%s", dlerror());

  __break(1u);
}

void __36__SUUIOffscreenRenderOperation_main__block_invoke(uint64_t a1)
{
}

- (id)createLayerBlock
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__49;
  v10 = __Block_byref_object_dispose__49;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__SUUIOffscreenRenderOperation_createLayerBlock__block_invoke;
  v5[3] = &unk_2654008E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  dispatch_queue_t v3 = _Block_copy((const void *)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __48__SUUIOffscreenRenderOperation_createLayerBlock__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 256) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (UIImage)outputImage
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__15;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__SUUIOffscreenRenderOperation_outputImage__block_invoke;
  v5[3] = &unk_2654008E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (UIImage *)v3;
}

void __43__SUUIOffscreenRenderOperation_outputImage__block_invoke(uint64_t a1)
{
}

- (void)setCreateLayerBlock:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SUUIOffscreenRenderOperation_setCreateLayerBlock___block_invoke;
  v7[3] = &unk_265400DC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(accessQueue, v7);
}

uint64_t __52__SUUIOffscreenRenderOperation_setCreateLayerBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 256);
  *(void *)(v3 + 256) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

+ (void)preheatOffscreenRenderOperations
{
  uint64_t v2 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v2, &__block_literal_global_34);
}

void __64__SUUIOffscreenRenderOperation_preheatOffscreenRenderOperations__block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
  NSLog(&cfstr_Suuioffscreenr_2.isa, 2);
  char v1 = 1;
  double v2 = CACurrentMediaTime();
  do
  {
    char v3 = v1;
    id v12 = 0;
    id v13 = 0;
    _SUUIOffscreenRenderOperationPopRenderingContext(&v13, &v12);
    id v4 = v13;
    id v5 = v12;
    if (v5) {
      BOOL v6 = v4 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      [v0 addObject:v4];
      [v0 addObject:v5];
    }

    char v1 = 0;
  }
  while ((v3 & 1) != 0);
  if ((unint64_t)[v0 count] >= 2)
  {
    unint64_t v7 = 1;
    do
    {
      id v8 = [v0 objectAtIndex:v7 - 1];
      v9 = [v0 objectAtIndex:v7];
      _SUUIOffscreenRenderOperationPushRenderingContext(v8, v9);

      v7 += 2;
    }
    while (v7 < [v0 count]);
  }
  CFTimeInterval v10 = CACurrentMediaTime();
  NSLog(&cfstr_Suuioffscreenr_3.isa, 2, v10 - v2);
  id v11 = dispatch_get_global_queue(0, 0);
  dispatch_async(v11, &__block_literal_global_24_0);
}

void __64__SUUIOffscreenRenderOperation_preheatOffscreenRenderOperations__block_invoke_2()
{
  NSLog(&cfstr_Suuioffscreenr_4.isa);
  double v0 = CACurrentMediaTime();
  IOSurfaceLibrary();
  OpenGLESLibrary();
  CFTimeInterval v1 = CACurrentMediaTime();
  NSLog(&cfstr_Suuioffscreenr_5.isa, v1 - v0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputImage, 0);
  objc_storeStrong(&self->_createLayerBlock, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end