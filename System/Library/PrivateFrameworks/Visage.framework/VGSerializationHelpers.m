@interface VGSerializationHelpers
+ (__CVBuffer)createPixelBufferFromData:(id)a3;
+ (id)cgRectToDict:(const CGRect *)a3;
+ (id)createDataFromPixelBuffer:(__CVBuffer *)a3;
@end

@implementation VGSerializationHelpers

+ (id)createDataFromPixelBuffer:(__CVBuffer *)a3
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  id v8 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:BytesPerRow * Height + 32];
  uint64_t v9 = [v8 mutableBytes];
  *(_DWORD *)uint64_t v9 = 1;
  *(void *)(v9 + 4) = Width;
  *(void *)(v9 + 12) = Height;
  *(void *)(v9 + 20) = BytesPerRow;
  *(_DWORD *)(v9 + 28) = PixelFormatType;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  if (Height)
  {
    v11 = BaseAddress;
    uint64_t v12 = 0;
    uint64_t v13 = v9 + 32;
    do
    {
      memcpy((void *)(v13 + v12), &v11[v12], BytesPerRow);
      v12 += BytesPerRow;
      --Height;
    }
    while (Height);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);

  return v8;
}

+ (__CVBuffer)createPixelBufferFromData:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 bytes];
  size_t v4 = *(void *)(v3 + 4);
  size_t v5 = *(void *)(v3 + 12);
  size_t v6 = *(void *)(v3 + 20);
  OSType v7 = *(_DWORD *)(v3 + 28);
  CVPixelBufferRef pixelBuffer = 0;
  uint64_t v16 = *MEMORY[0x263F04130];
  v17[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  if (CVPixelBufferCreate(0, v4, v5, v7, v8, &pixelBuffer))
  {
    uint64_t v9 = 0;
  }
  else
  {
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    if (v5)
    {
      uint64_t v12 = BaseAddress;
      uint64_t v13 = (char *)(v3 + 32);
      do
      {
        memcpy(v12, v13, v6);
        v12 += BytesPerRow;
        v13 += v6;
        --v5;
      }
      while (v5);
    }
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    uint64_t v9 = pixelBuffer;
  }

  return v9;
}

+ (id)cgRectToDict:(const CGRect *)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  v14[0] = @"origin";
  size_t v4 = [NSNumber numberWithDouble:a3->origin.x];
  v13[0] = v4;
  size_t v5 = [NSNumber numberWithDouble:a3->origin.y];
  v13[1] = v5;
  size_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  v14[1] = @"size";
  v15[0] = v6;
  OSType v7 = [NSNumber numberWithDouble:a3->size.width];
  v12[0] = v7;
  CFDictionaryRef v8 = [NSNumber numberWithDouble:a3->size.height];
  v12[1] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v15[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v10;
}

@end