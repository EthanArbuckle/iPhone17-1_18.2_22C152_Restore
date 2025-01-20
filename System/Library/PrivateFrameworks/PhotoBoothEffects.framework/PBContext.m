@interface PBContext
+ (id)openCLContext;
+ (id)openGLContext;
+ (id)openGLContext:(id)a3;
- (PBContext)init;
- (_CAImageQueue)outputImageQueue;
- (__CVBuffer)createCVPixelBufferForFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4;
- (__CVBuffer)createCVPixelBufferForFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 mirrored:(BOOL)a5;
- (__CVPixelBufferPool)largePool;
- (__CVPixelBufferPool)smallPool;
- (void)applyFilter:(id)a3 toSurface:(__IOSurface *)a4 mirrored:(BOOL)a5 resultHandler:(id)a6;
- (void)applyFilter:(id)a3 toSurface:(__IOSurface *)a4 mirrored:(BOOL)a5 surfaceResultHandler:(id)a6;
@end

@implementation PBContext

+ (id)openGLContext
{
  v2 = NSDictionary;
  uint64_t v3 = [NSNumber numberWithBool:0];
  v4 = -[PBCoreImageContext initWithOptions:]([PBCoreImageContext alloc], "initWithOptions:", [v2 dictionaryWithObject:v3 forKey:*MEMORY[0x263F00850]]);

  return v4;
}

+ (id)openGLContext:(id)a3
{
  if (a3) {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  }
  else {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v5 = (void *)v4;
  uint64_t v6 = [NSNumber numberWithBool:0];
  [v5 setValue:v6 forKey:*MEMORY[0x263F00850]];
  v7 = [[PBCoreImageContext alloc] initWithOptions:a3];

  return v7;
}

+ (id)openCLContext
{
  v2 = NSDictionary;
  uint64_t v3 = [NSNumber numberWithBool:1];
  uint64_t v4 = -[PBCoreImageContext initWithOptions:]([PBCoreImageContext alloc], "initWithOptions:", [v2 dictionaryWithObject:v3 forKey:*MEMORY[0x263F00850]]);

  return v4;
}

- (PBContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)PBContext;
  v2 = [(PBContext *)&v5 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    if (v3 == objc_opt_class())
    {

      return (PBContext *)[[PBCoreImageContext alloc] initWithOptions:0];
    }
  }
  return v2;
}

- (__CVBuffer)createCVPixelBufferForFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4
{
  NSLog(&cfstr_WarningUsePbco.isa, a2);

  return [(PBContext *)self createCVPixelBufferForFilter:a3 inputPixelBuffer:a4 mirrored:0];
}

- (__CVBuffer)createCVPixelBufferForFilter:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 mirrored:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v9 = dispatch_semaphore_create(0);
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a4);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__PBContext_createCVPixelBufferForFilter_inputPixelBuffer_mirrored___block_invoke;
  v13[3] = &unk_264E71BC8;
  v13[4] = v9;
  v13[5] = &v14;
  [(PBContext *)self applyFilter:a3 toSurface:IOSurface mirrored:v5 resultHandler:v13];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v9);
  v11 = (__CVBuffer *)v15[3];
  _Block_object_dispose(&v14, 8);
  return v11;
}

intptr_t __68__PBContext_createCVPixelBufferForFilter_inputPixelBuffer_mirrored___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (_CAImageQueue)outputImageQueue
{
  return 0;
}

- (__CVPixelBufferPool)largePool
{
  return 0;
}

- (__CVPixelBufferPool)smallPool
{
  return 0;
}

- (void)applyFilter:(id)a3 toSurface:(__IOSurface *)a4 mirrored:(BOOL)a5 surfaceResultHandler:(id)a6
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__PBContext_applyFilter_toSurface_mirrored_surfaceResultHandler___block_invoke;
  block[3] = &unk_264E71BF0;
  block[4] = a6;
  dispatch_async(global_queue, block);
}

uint64_t __65__PBContext_applyFilter_toSurface_mirrored_surfaceResultHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)applyFilter:(id)a3 toSurface:(__IOSurface *)a4 mirrored:(BOOL)a5 resultHandler:(id)a6
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__PBContext_applyFilter_toSurface_mirrored_resultHandler___block_invoke;
  v6[3] = &unk_264E71C18;
  v6[4] = a6;
  [(PBContext *)self applyFilter:a3 toSurface:a4 mirrored:a5 surfaceResultHandler:v6];
}

uint64_t __58__PBContext_applyFilter_toSurface_mirrored_resultHandler___block_invoke(uint64_t result, __IOSurface *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    CVPixelBufferRef pixelBufferOut = 0;
    CVReturn v4 = CVPixelBufferCreateWithIOSurface(0, a2, 0, &pixelBufferOut);
    CFRelease(a2);
    if (v4) {
      NSLog(&cfstr_FailedToCreate.isa);
    }
    return (*(uint64_t (**)(void))(*(void *)(v3 + 32) + 16))();
  }
  return result;
}

@end