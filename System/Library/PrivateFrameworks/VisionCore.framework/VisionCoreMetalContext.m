@interface VisionCoreMetalContext
+ (id)metalContextAndReturnError:(id *)a3;
+ (unint64_t)bytesPerPixelForTextureFormat:(unint64_t)a3;
- (BOOL)writeMetalTextureToData:(void *)a3 texture:(id)a4 mipmapLevel:(int)a5;
- (BOOL)writeMetalTextureToFile:(const char *)a3 texture:(id)a4;
- (BOOL)writeMetalTextureToFile:(const char *)a3 texture:(id)a4 mipmapLevel:(int)a5;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLLibrary)library;
- (VisionCoreMetalContext)initWithLibrary:(id)a3 device:(id)a4 commandQueue:(id)a5;
- (id)bindIOSurfaceToMTL2DTexture:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 plane:(unint64_t)a7;
- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 plane:(unint64_t)a5;
- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 textureSize:(CGSize)a5 plane:(unint64_t)a6;
- (id)newBufferWithPixelFormat:(unint64_t)a3 width:(int)a4 data:(const void *)a5;
- (id)newTextureWithPixelFormat:(unint64_t)a3 width:(int)a4 height:(int)a5;
- (id)readBufferFromFile:(const char *)a3 width:(int)a4 pixelFormat:(unint64_t)a5;
- (id)readTextureFromFile:(const char *)a3 width:(int)a4 height:(int)a5 pixelFormat:(unint64_t)a6;
- (int)writeMetalBufferToFile:(const char *)a3 buffer:(id)a4;
- (unint64_t)textureBytesPerRow:(int)a3 format:(unint64_t)a4;
- (void)copyMTLBufferToMTLTexture:(id)a3 bytesPerRow:(unint64_t)a4 texture:(id)a5;
@end

@implementation VisionCoreMetalContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (MTLLibrary)library
{
  return self->_library;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)textureBytesPerRow:(int)a3 format:(unint64_t)a4
{
  unint64_t v6 = [(MTLDevice *)self->_device minimumLinearTextureAlignmentForPixelFormat:a4];
  return (v6
        + +[VisionCoreMetalContext bytesPerPixelForTextureFormat:a4]* a3- 1)/ v6* v6;
}

- (void)copyMTLBufferToMTLTexture:(id)a3 bytesPerRow:(unint64_t)a4 texture:(id)a5
{
  commandQueue = self->_commandQueue;
  id v8 = a5;
  id v9 = a3;
  v10 = [(MTLCommandQueue *)commandQueue commandBuffer];
  v11 = [v10 blitCommandEncoder];
  unint64_t v12 = [v8 height] * a4;
  v14[0] = [v8 width];
  v14[1] = [v8 height];
  v14[2] = [v8 depth];
  memset(v13, 0, sizeof(v13));
  [v11 copyFromBuffer:v9 sourceOffset:0 sourceBytesPerRow:a4 sourceBytesPerImage:v12 sourceSize:v14 toTexture:v8 destinationSlice:0 destinationLevel:0 destinationOrigin:v13];

  [v11 endEncoding];
  [v10 addCompletedHandler:&__block_literal_global_2529];
  [v10 commit];
  [v10 waitUntilCompleted];
}

- (id)bindIOSurfaceToMTL2DTexture:(__IOSurface *)a3 pixelFormat:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 plane:(unint64_t)a7
{
  v10 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:a4 width:a5 height:a6 mipmapped:0];
  v11 = v10;
  if (v10)
  {
    [v10 setUsage:23];
    uint64_t v12 = [(MTLDevice *)self->_device newTextureWithDescriptor:v11 iosurface:a3 plane:a7];
    if (v12) {
      v13 = (void *)v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 textureSize:(CGSize)a5 plane:(unint64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    uint64_t v12 = IOSurface;
    size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(IOSurface, a6);
    double HeightOfPlane = (double)IOSurfaceGetHeightOfPlane(v12, a6);
    if (width > (double)WidthOfPlane || height > HeightOfPlane)
    {
      IOSurface = 0;
    }
    else
    {
      IOSurface = [(VisionCoreMetalContext *)self bindIOSurfaceToMTL2DTexture:v12 pixelFormat:a4 width:(unint64_t)width height:(unint64_t)height plane:a6];
    }
  }
  return IOSurface;
}

- (id)bindPixelBufferToMTL2DTexture:(__CVBuffer *)a3 pixelFormat:(unint64_t)a4 plane:(unint64_t)a5
{
  IOSurface = CVPixelBufferGetIOSurface(a3);
  if (IOSurface)
  {
    id v9 = IOSurface;
    size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(IOSurface, a5);
    IOSurface = [(VisionCoreMetalContext *)self bindIOSurfaceToMTL2DTexture:v9 pixelFormat:a4 width:WidthOfPlane height:IOSurfaceGetHeightOfPlane(v9, a5) plane:a5];
  }
  return IOSurface;
}

- (id)readBufferFromFile:(const char *)a3 width:(int)a4 pixelFormat:(unint64_t)a5
{
  size_t v7 = +[VisionCoreMetalContext bytesPerPixelForTextureFormat:a5]* a4;
  id v8 = malloc_type_malloc(v7, 0x371C6B97uLL);
  if (v8)
  {
    v15 = v8;
    v16 = fopen(a3, "rb");
    if (v16)
    {
      v23 = v16;
      fread(v15, v7, 1uLL, v16);
      v24 = (void *)[(MTLDevice *)self->_device newBufferWithBytes:v15 length:v7 options:0];
      free(v15);
      fclose(v23);
      goto LABEL_7;
    }
    VisionCoreValidatedLog(4, @"Unable to fopen(\"%s\") for reading\n", v17, v18, v19, v20, v21, v22, (uint64_t)a3);
    free(v15);
  }
  else
  {
    VisionCoreValidatedLog(4, @"Failed to allocate fdata\n", v9, v10, v11, v12, v13, v14, v26);
  }
  v24 = 0;
LABEL_7:
  return v24;
}

- (id)readTextureFromFile:(const char *)a3 width:(int)a4 height:(int)a5 pixelFormat:(unint64_t)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v11 = a4;
  size_t v12 = +[VisionCoreMetalContext bytesPerPixelForTextureFormat:a6]* a4* a5;
  uint64_t v13 = malloc_type_malloc(v12, 0xE483550EuLL);
  if (v13)
  {
    uint64_t v20 = v13;
    v33 = self;
    uint64_t v21 = fopen(a3, "rb");
    if (v21)
    {
      v28 = v21;
      id v29 = [(VisionCoreMetalContext *)v33 newTextureWithPixelFormat:a6 width:v8 height:v7];
      fread(v20, v12, 1uLL, v28);
      if (v7 == 1) {
        v30 = &v35;
      }
      else {
        v30 = &v34;
      }
      *(void *)v30 = 0;
      *((void *)v30 + 1) = 0;
      *((void *)v30 + 2) = 0;
      *((void *)v30 + 3) = v11;
      *((void *)v30 + 4) = (int)v7;
      *((void *)v30 + 5) = 1;
      objc_msgSend(v29, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:");
      free(v20);
      fclose(v28);
      goto LABEL_10;
    }
    VisionCoreValidatedLog(4, @"Unable to fopen(\"%s\") for reading\n", v22, v23, v24, v25, v26, v27, (uint64_t)a3);
    free(v20);
  }
  else
  {
    VisionCoreValidatedLog(4, @"Failed to allocate fdata\n", v14, v15, v16, v17, v18, v19, v32);
  }
  id v29 = 0;
LABEL_10:
  return v29;
}

- (id)newBufferWithPixelFormat:(unint64_t)a3 width:(int)a4 data:(const void *)a5
{
  unint64_t v7 = +[VisionCoreMetalContext bytesPerPixelForTextureFormat:a3]* a4;
  device = self->_device;
  if (a5)
  {
    return (id)[(MTLDevice *)device newBufferWithBytes:a5 length:v7 options:0];
  }
  else
  {
    return (id)[(MTLDevice *)device newBufferWithLength:v7 options:0];
  }
}

- (id)newTextureWithPixelFormat:(unint64_t)a3 width:(int)a4 height:(int)a5
{
  if (a5 == 1)
  {
    unint64_t v6 = objc_msgSend(MEMORY[0x263F12A50], "textureBufferDescriptorWithPixelFormat:width:resourceOptions:usage:", a3);
  }
  else
  {
    unint64_t v6 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a3);
    [v6 setUsage:19];
  }
  unint64_t v7 = (void *)[(MTLDevice *)self->_device newTextureWithDescriptor:v6];

  return v7;
}

- (int)writeMetalBufferToFile:(const char *)a3 buffer:(id)a4
{
  id v5 = a4;
  unint64_t v6 = fopen(a3, "wb");
  if (v6)
  {
    uint64_t v13 = v6;
    id v14 = v5;
    uint64_t v15 = (const void *)[v14 contents];
    size_t v16 = [v14 length];
    if (fwrite(v15, 1uLL, v16, v13) == v16)
    {
      int v23 = 0;
    }
    else
    {
      VisionCoreValidatedLog(4, @"Something went wrong during fwrite to file\n", v17, v18, v19, v20, v21, v22, v25);
      int v23 = -1;
    }
    fclose(v13);
  }
  else
  {
    VisionCoreValidatedLog(4, @"Unable to fopen(\"%s\") for writing\n", v7, v8, v9, v10, v11, v12, (uint64_t)a3);
    int v23 = -1;
  }

  return v23;
}

- (BOOL)writeMetalTextureToFile:(const char *)a3 texture:(id)a4 mipmapLevel:(int)a5
{
  id v7 = a4;
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  if (!a3 || !v7 || a5 < 0) {
    goto LABEL_10;
  }
  if ([v7 mipmapLevelCount] <= (unint64_t)a5)
  {
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  uint64_t v10 = a5;
  [v8 pixelFormat];
  MTLPixelFormatGetInfoForDevice();
  size_t v11 = v32;
  unint64_t v12 = (unint64_t)[v8 width] >> v10;
  unint64_t v13 = (unint64_t)[v8 height] >> v10;
  uint64_t v9 = malloc_type_malloc(v12 * v32 * v13, 0xEDC68849uLL);
  memset(v31, 0, 24);
  v31[3] = v12;
  v31[4] = v13;
  v31[5] = 1;
  [v8 getBytes:v9 bytesPerRow:v12 * v32 fromRegion:v31 mipmapLevel:v10];
  id v14 = fopen(a3, "wb");
  if (!v14)
  {
    VisionCoreValidatedLog(4, @"Unable to fopen(\"%s\") for writing\n", v15, v16, v17, v18, v19, v20, (uint64_t)a3);
LABEL_10:
    free(v9);
    BOOL v28 = 0;
    goto LABEL_11;
  }
  uint64_t v21 = v14;
  BOOL v28 = fwrite(v9, v11, v13 * v12, v14) == v13 * v12;
  if (!v28) {
    VisionCoreValidatedLog(4, @"Something went wrong during fwrite to file\n", v22, v23, v24, v25, v26, v27, v30);
  }
  free(v9);
  fclose(v21);
LABEL_11:

  return v28;
}

- (BOOL)writeMetalTextureToFile:(const char *)a3 texture:(id)a4
{
  return [(VisionCoreMetalContext *)self writeMetalTextureToFile:a3 texture:a4 mipmapLevel:0];
}

- (BOOL)writeMetalTextureToData:(void *)a3 texture:(id)a4 mipmapLevel:(int)a5
{
  id v7 = a4;
  uint64_t v8 = v7;
  BOOL v9 = 0;
  if (v7 && (a5 & 0x80000000) == 0)
  {
    if ([v7 mipmapLevelCount] <= (unint64_t)a5)
    {
      BOOL v9 = 0;
    }
    else
    {
      [v8 pixelFormat];
      MTLPixelFormatGetInfoForDevice();
      memset(v11, 0, sizeof(v11));
      unint64_t v12 = (unint64_t)[v8 width] >> a5;
      BOOL v9 = 1;
      unint64_t v13 = (unint64_t)[v8 height] >> a5;
      uint64_t v14 = 1;
      [v8 getBytes:a3 bytesPerRow:v12 * v15 fromRegion:v11 mipmapLevel:a5];
    }
  }

  return v9;
}

- (VisionCoreMetalContext)initWithLibrary:(id)a3 device:(id)a4 commandQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VisionCoreMetalContext;
  unint64_t v12 = [(VisionCoreMetalContext *)&v15 init];
  unint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_library, a3);
    objc_storeStrong((id *)&v13->_device, a4);
    objc_storeStrong((id *)&v13->_commandQueue, a5);
  }

  return v13;
}

+ (id)metalContextAndReturnError:(id *)a3
{
  id v5 = MTLCreateSystemDefaultDevice();
  if (v5)
  {
    unint64_t v6 = VisionCoreFrameworkBundle();
    id v7 = [v6 URLForResource:@"default" withExtension:@"metallib"];
    uint64_t v8 = (void *)[v5 newLibraryWithURL:v7 error:a3];
    if (v8)
    {
      id v9 = (void *)[v5 newCommandQueue];
      id v10 = v9;
      if (v9)
      {
        [v9 setBackgroundGPUPriority:2];
        id v11 = (void *)[objc_alloc((Class)a1) initWithLibrary:v8 device:v5 commandQueue:v10];
      }
      else if (a3)
      {
        [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:@"Unable to create command queue "];
        id v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else if (a3)
  {
    [MEMORY[0x263F087E8] VisionCoreErrorForInternalErrorWithLocalizedDescription:@"MTLDevice is nil"];
    id v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (unint64_t)bytesPerPixelForTextureFormat:(unint64_t)a3
{
  unint64_t result = 1;
  switch(a3)
  {
    case 0xAuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      return result;
    case 0xBuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
    case 0x1DuLL:
    case 0x1FuLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
    case 0x30uLL:
    case 0x31uLL:
    case 0x32uLL:
    case 0x33uLL:
    case 0x34uLL:
    case 0x38uLL:
    case 0x39uLL:
    case 0x3AuLL:
    case 0x3BuLL:
    case 0x3DuLL:
    case 0x42uLL:
    case 0x43uLL:
    case 0x44uLL:
    case 0x45uLL:
    case 0x4BuLL:
    case 0x4CuLL:
    case 0x4DuLL:
    case 0x4EuLL:
    case 0x4FuLL:
      goto LABEL_12;
    case 0x14uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1EuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x2BuLL:
      return 2;
    case 0x35uLL:
    case 0x36uLL:
    case 0x37uLL:
    case 0x3CuLL:
    case 0x3EuLL:
    case 0x3FuLL:
    case 0x40uLL:
    case 0x41uLL:
    case 0x46uLL:
    case 0x47uLL:
    case 0x48uLL:
    case 0x49uLL:
    case 0x4AuLL:
    case 0x50uLL:
    case 0x51uLL:
      return 4;
    default:
      char v4 = a3 - 90;
      if (a3 - 90 > 0x23) {
        goto LABEL_11;
      }
      if (((1 << v4) & 0x3D0E000) != 0) {
        return 8;
      }
      if (((1 << v4) & 0xF) != 0) {
        return 4;
      }
      if (((1 << v4) & 0xE00000000) != 0) {
        return 16;
      }
LABEL_11:
      if (a3 != 1)
      {
LABEL_12:
        NSLog(&cfstr_UnidentifiedMe.isa, a2);
        return 0;
      }
      return result;
  }
}

@end