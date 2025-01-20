@interface UIOldCGImageDecompressor
@end

@implementation UIOldCGImageDecompressor

void __89___UIOldCGImageDecompressor_initWithData_immediateLoadWithMaxSize_renderingIntent_cache___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.UIKit.UIOldCGImageDecompressor queue", 0);
  v1 = (void *)_MergedGlobals_3_30;
  _MergedGlobals_3_30 = (uint64_t)v0;
}

void __89___UIOldCGImageDecompressor_initWithData_immediateLoadWithMaxSize_renderingIntent_cache___block_invoke_2(uint64_t a1)
{
}

void __48___UIOldCGImageDecompressor__decompressEagerly___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIOldCGImageDecompressor _waitForMetadata]((uint64_t)WeakRetained);
}

uint64_t __48___UIOldCGImageDecompressor__decompressEagerly___block_invoke_2()
{
  uint64_t result = CMPhotoJPEGDecodeSessionCreate();
  atomic_store(0, &jpegDecodeSessionRef);
  return result;
}

intptr_t __48___UIOldCGImageDecompressor__decompressEagerly___block_invoke_3(uint64_t a1, int a2, int a3, int a4, CGImageRef image)
{
  if ((a4 + 16075) > 3 || a4 == -16074)
  {
    if (a4) {
      goto LABEL_9;
    }
    CGImageRef v8 = CGImageRetain(image);
    uint64_t v7 = a1 + 32;
    *(void *)(*(void *)(a1 + 32) + 32) = v8;
  }
  else
  {
    uint64_t v7 = a1 + 32;
  }
  *(unsigned char *)(*(void *)v7 + 64) |= 0x10u;
LABEL_9:
  v9 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v9);
}

@end