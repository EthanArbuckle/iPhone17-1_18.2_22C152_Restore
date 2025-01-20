@interface WFRemoteImageDrawingContext
+ (BOOL)supportsSecureCoding;
- (BOOL)allocateSharedBuffer;
- (BOOL)drawAlphaOnly;
- (CGColorSpace)colorSpace;
- (CGImage)imageAtIndex:(unint64_t)a3;
- (CGSize)singleImageSize;
- (WFRemoteImageDrawingContext)initWithAlphaOnlyImageCount:(unint64_t)a3 singleImageSize:(CGSize)a4 scale:(double)a5;
- (WFRemoteImageDrawingContext)initWithCoder:(id)a3;
- (WFRemoteImageDrawingContext)initWithImageCount:(unint64_t)a3 singleImageSize:(CGSize)a4 scale:(double)a5 colorSpace:(CGColorSpace *)a6;
- (WFRemoteImageDrawingContext)initWithImageCount:(unint64_t)a3 singleImageSize:(CGSize)a4 scale:(double)a5 colorSpace:(CGColorSpace *)a6 buffer:(void *)a7 bufferSize:(unint64_t)a8 drawAlphaOnly:(BOOL)a9;
- (double)scale;
- (double)screenScale;
- (unint64_t)bitsPerComponent;
- (unint64_t)bufferSize;
- (unint64_t)imageCount;
- (unint64_t)numberOfComponents;
- (unint64_t)sizePerImage;
- (unsigned)bitmapInfo;
- (void)accessBitmapContextForImageAtIndex:(unint64_t)a3 accessBlock:(id)a4;
- (void)buffer;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFRemoteImageDrawingContext

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)buffer
{
  return self->_buffer;
}

- (unint64_t)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (BOOL)drawAlphaOnly
{
  return self->_drawAlphaOnly;
}

- (CGColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (CGSize)singleImageSize
{
  double width = self->_singleImageSize.width;
  double height = self->_singleImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)imageCount
{
  return self->_imageCount;
}

- (WFRemoteImageDrawingContext)initWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    [v23 handleFailureInMethod:a2, self, @"WFRemoteImageDrawingContext.m", 252, @"Attempting to decode %@ with a non-XPC coder--this is not allowed", v25 object file lineNumber description];
  }
  id v6 = v5;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  [v8 decodeDoubleForKey:@"scale"];
  double v10 = v9;
  int v11 = [v8 decodeIntForKey:@"imageCount"];
  v12 = [v8 decodeObjectOfClass:objc_opt_class() forKey:@"singleImageSize"];
  v13 = [v8 decodeObjectOfClass:objc_opt_class() forKey:@"colorSpace"];
  uint64_t v14 = [v8 decodeBoolForKey:@"drawAlphaOnly"];
  region = 0;
  v15 = [v8 decodeXPCObjectOfType:MEMORY[0x1E4F145E8] forKey:@"sharedMemory"];

  if (!v15)
  {
    v19 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFRemoteImageDrawingContext initWithCoder:]";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"sharedMemory";
      v20 = "%s Could not find shmem for key: %{public}@";
LABEL_16:
      _os_log_impl(&dword_1B3C5C000, v19, OS_LOG_TYPE_FAULT, v20, buf, 0x16u);
    }
LABEL_17:

    v21 = 0;
    goto LABEL_20;
  }
  size_t v16 = xpc_shmem_map(v15, &region);
  if (!v16)
  {
    v19 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WFRemoteImageDrawingContext initWithCoder:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      v20 = "%s Could not map shared memory, mapped drawing buffer size is %llu";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  size_t v17 = v16;
  if (v13) {
    CGColorSpaceRef v18 = CGColorSpaceCreateWithName(v13);
  }
  else {
    CGColorSpaceRef v18 = 0;
  }
  *(_OWORD *)buf = *MEMORY[0x1E4F1DB30];
  [v12 getValue:buf size:16];
  self = -[WFRemoteImageDrawingContext initWithImageCount:singleImageSize:scale:colorSpace:buffer:bufferSize:drawAlphaOnly:](self, "initWithImageCount:singleImageSize:scale:colorSpace:buffer:bufferSize:drawAlphaOnly:", v11, v18, region, v17, v14, *(double *)buf, *(double *)&buf[8], v10);
  v21 = self;
LABEL_20:

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"WFRemoteImageDrawingContext.m", 234, @"Attempting to encode %@ with a non-XPC coder--this is not allowed", v15 object file lineNumber description];
  }
  xpc_object_t v6 = xpc_shmem_create([(WFRemoteImageDrawingContext *)self buffer], [(WFRemoteImageDrawingContext *)self imageCount]* [(WFRemoteImageDrawingContext *)self sizePerImage]);
  Name = [(WFRemoteImageDrawingContext *)self colorSpace];
  if (Name) {
    Name = (CGColorSpace *)CGColorSpaceGetName([(WFRemoteImageDrawingContext *)self colorSpace]);
  }
  id v8 = (void *)MEMORY[0x1E4F29238];
  double v9 = Name;
  double v10 = [v8 valueWithBytes:&self->_singleImageSize objCType:"{CGSize=dd}"];
  id v16 = v5;
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v11 = v16;
    }
    else {
      int v11 = 0;
    }
  }
  else
  {
    int v11 = 0;
  }
  id v12 = v11;

  [(WFRemoteImageDrawingContext *)self scale];
  objc_msgSend(v12, "encodeDouble:forKey:", @"scale");
  objc_msgSend(v12, "encodeInteger:forKey:", -[WFRemoteImageDrawingContext imageCount](self, "imageCount"), @"imageCount");
  [v12 encodeObject:v10 forKey:@"singleImageSize"];
  [v12 encodeObject:v9 forKey:@"colorSpace"];

  objc_msgSend(v12, "encodeBool:forKey:", -[WFRemoteImageDrawingContext drawAlphaOnly](self, "drawAlphaOnly"), @"drawAlphaOnly");
  [v12 encodeXPCObject:v6 forKey:@"sharedMemory"];
}

- (void)accessBitmapContextForImageAtIndex:(unint64_t)a3 accessBlock:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(id, CGContext *))a4;
  if ([(WFRemoteImageDrawingContext *)self imageCount] <= a3)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"WFRemoteImageDrawingContext.m", 199, @"Index %lu must be in bounds (0..%lu)", a3, -[WFRemoteImageDrawingContext imageCount](self, "imageCount"));
  }
  unint64_t v8 = [(WFRemoteImageDrawingContext *)self sizePerImage];
  double v9 = [(WFRemoteImageDrawingContext *)self buffer] + v8 * a3;
  [(WFRemoteImageDrawingContext *)self singleImageSize];
  double v11 = v10;
  [(WFRemoteImageDrawingContext *)self scale];
  size_t v13 = (unint64_t)(v11 * v12);
  [(WFRemoteImageDrawingContext *)self singleImageSize];
  double v15 = v14;
  [(WFRemoteImageDrawingContext *)self scale];
  CGContextRef v17 = CGBitmapContextCreate(v9, v13, (unint64_t)(v15 * v16), 8uLL, [(WFRemoteImageDrawingContext *)self numberOfComponents] * v13, [(WFRemoteImageDrawingContext *)self colorSpace], [(WFRemoteImageDrawingContext *)self bitmapInfo]);
  if (v17)
  {
    CGColorSpaceRef v18 = v17;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __78__WFRemoteImageDrawingContext_accessBitmapContextForImageAtIndex_accessBlock___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v17;
    uint64_t v19 = (uint64_t)_Block_copy(aBlock);
    [(WFRemoteImageDrawingContext *)self scale];
    CGFloat v21 = v20;
    [(WFRemoteImageDrawingContext *)self scale];
    CGContextScaleCTM(v18, v21, -v22);
    [(WFRemoteImageDrawingContext *)self singleImageSize];
    CGContextTranslateCTM(v18, 0.0, -v23);
    v7[2](v7, v18);
    (*(void (**)(uint64_t))(v19 + 16))(v19);
  }
  else
  {
    uint64_t v19 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[WFRemoteImageDrawingContext accessBitmapContextForImageAtIndex:accessBlock:]";
      __int16 v28 = 2048;
      unint64_t v29 = a3;
      _os_log_impl(&dword_1B3C5C000, (os_log_t)v19, OS_LOG_TYPE_FAULT, "%s Shared bitmap context is nil at index %lu", buf, 0x16u);
    }
  }
}

void __78__WFRemoteImageDrawingContext_accessBitmapContextForImageAtIndex_accessBlock___block_invoke(uint64_t a1)
{
}

- (CGImage)imageAtIndex:(unint64_t)a3
{
  if ([(WFRemoteImageDrawingContext *)self imageCount] <= a3)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"WFRemoteImageDrawingContext.m", 183, @"Index %lu must be in bounds (0..%lu)", a3, -[WFRemoteImageDrawingContext imageCount](self, "imageCount"));
  }
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__WFRemoteImageDrawingContext_imageAtIndex___block_invoke;
  v10[3] = &unk_1E60792C8;
  v10[4] = &v11;
  [(WFRemoteImageDrawingContext *)self accessBitmapContextForImageAtIndex:a3 accessBlock:v10];
  xpc_object_t v6 = (const void *)v12[3];
  if (v6) {
    v7 = (CGImage *)CFAutorelease(v6);
  }
  else {
    v7 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

CGImageRef __44__WFRemoteImageDrawingContext_imageAtIndex___block_invoke(uint64_t a1, CGContextRef context)
{
  CGImageRef result = CGBitmapContextCreateImage(context);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)allocateSharedBuffer
{
  kern_return_t memory_entry_64;
  void (**v8)(void);
  void *v9;
  NSObject *v10;
  NSObject *v11;
  kern_return_t v12;
  kern_return_t v14;
  void *v15;
  NSObject *v16;
  memory_object_size_t v17;
  void *v18;
  void aBlock[4];
  mach_port_t v20;
  mach_vm_address_t address;
  memory_object_size_t size;
  mach_port_t object_handle;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  memory_object_size_t v27;
  __int16 v28;
  memory_object_size_t v29;
  uint64_t v30;

  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![(WFRemoteImageDrawingContext *)self buffer])
  {
    unint64_t v4 = [(WFRemoteImageDrawingContext *)self sizePerImage];
    memory_object_size_t v5 = [(WFRemoteImageDrawingContext *)self imageCount] * v4;
    object_handle = 0;
    address = 0;
    size = v5;
    xpc_object_t v6 = (vm_map_t *)MEMORY[0x1E4F14960];
    memory_entry_64 = mach_make_memory_entry_64(*MEMORY[0x1E4F14960], &size, 0, 139267, &object_handle, 0);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__WFRemoteImageDrawingContext_allocateSharedBuffer__block_invoke;
    aBlock[3] = &__block_descriptor_36_e5_v8__0l;
    double v20 = object_handle;
    unint64_t v8 = (void (**)(void))_Block_copy(aBlock);
    if (memory_entry_64)
    {
      double v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F285A8] code:memory_entry_64 userInfo:0];
      double v10 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[WFRemoteImageDrawingContext allocateSharedBuffer]";
        v26 = 2112;
        v27 = (memory_object_size_t)v9;
        _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_FAULT, "%s Could not make memory entry for remote image drawing: %@", buf, 0x16u);
      }
    }
    else
    {
      if (size < v5)
      {
        uint64_t v11 = getWFVoiceShortcutClientLogObject();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315650;
          v25 = "-[WFRemoteImageDrawingContext allocateSharedBuffer]";
          v26 = 2048;
          v27 = v5;
          __int16 v28 = 2048;
          unint64_t v29 = size;
          _os_log_impl(&dword_1B3C5C000, v11, OS_LOG_TYPE_FAULT, "%s Could not make memory entry of requested size for remote image drawing (expecting %lu bytes, got %llu bytes)", buf, 0x20u);
        }

        goto LABEL_15;
      }
      double v12 = mach_vm_map(*v6, &address, size, 0, 1, object_handle, 0, 0, 3, 3, 1u);
      if (!v12)
      {
        uint64_t v14 = mach_memory_entry_ownership(object_handle, *v6, 4, 0);
        if (v14)
        {
          double v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F285A8] code:v14 userInfo:0];
          double v16 = getWFVoiceShortcutClientLogObject();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v25 = "-[WFRemoteImageDrawingContext allocateSharedBuffer]";
            v26 = 2114;
            v27 = (memory_object_size_t)v15;
            _os_log_impl(&dword_1B3C5C000, v16, OS_LOG_TYPE_ERROR, "%s Could not move memory entry to the graphics ledger for remote image drawing: %{public}@. We're proceeding - this is not a blocking error.", buf, 0x16u);
          }
        }
        CGContextRef v17 = size;
        self->_buffer = (void *)address;
        self->_bufferSize = v17;
        CGColorSpaceRef v18 = [(WFRemoteImageDrawingContext *)self buffer];
        bzero(v18, size);
        BOOL v3 = 1;
        goto LABEL_16;
      }
      double v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F285A8] code:v12 userInfo:0];
      double v10 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[WFRemoteImageDrawingContext allocateSharedBuffer]";
        v26 = 2112;
        v27 = (memory_object_size_t)v9;
        _os_log_impl(&dword_1B3C5C000, v10, OS_LOG_TYPE_FAULT, "%s Could not map memory entry for remote image drawing: %@", buf, 0x16u);
      }
    }

LABEL_15:
    BOOL v3 = 0;
LABEL_16:
    v8[2](v8);

    return v3;
  }
  return 1;
}

uint64_t __51__WFRemoteImageDrawingContext_allocateSharedBuffer__block_invoke(uint64_t result)
{
  mach_port_name_t v1 = *(_DWORD *)(result + 32);
  if (v1) {
    return mach_port_deallocate(*MEMORY[0x1E4F14960], v1);
  }
  return result;
}

- (unint64_t)sizePerImage
{
  [(WFRemoteImageDrawingContext *)self singleImageSize];
  double v4 = v3;
  [(WFRemoteImageDrawingContext *)self scale];
  double v6 = v4 * v5;
  [(WFRemoteImageDrawingContext *)self singleImageSize];
  double v8 = v7;
  [(WFRemoteImageDrawingContext *)self scale];
  return (unint64_t)(v6
                          * (v8
                           * v9)
                          * (double)[(WFRemoteImageDrawingContext *)self numberOfComponents]);
}

- (double)screenScale
{
  v2 = (void *)MGCopyAnswer();
  [v2 doubleValue];
  if (v3 <= 0.0) {
    double v4 = 1.0;
  }
  else {
    double v4 = v3;
  }

  return v4;
}

- (unsigned)bitmapInfo
{
  if ([(WFRemoteImageDrawingContext *)self drawAlphaOnly]) {
    return 7;
  }
  else {
    return 1;
  }
}

- (unint64_t)numberOfComponents
{
  if ([(WFRemoteImageDrawingContext *)self colorSpace]) {
    return CGColorSpaceGetNumberOfComponents([(WFRemoteImageDrawingContext *)self colorSpace]) + 1;
  }
  else {
    return 1;
  }
}

- (void)dealloc
{
  if ([(WFRemoteImageDrawingContext *)self buffer]) {
    munmap([(WFRemoteImageDrawingContext *)self buffer], [(WFRemoteImageDrawingContext *)self bufferSize]);
  }
  CGColorSpaceRelease(self->_colorSpace);
  v3.receiver = self;
  v3.super_class = (Class)WFRemoteImageDrawingContext;
  [(WFRemoteImageDrawingContext *)&v3 dealloc];
}

- (WFRemoteImageDrawingContext)initWithImageCount:(unint64_t)a3 singleImageSize:(CGSize)a4 scale:(double)a5 colorSpace:(CGColorSpace *)a6 buffer:(void *)a7 bufferSize:(unint64_t)a8 drawAlphaOnly:(BOOL)a9
{
  double height = a4.height;
  CGFloat width = a4.width;
  if (a4.width <= 0.0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"WFRemoteImageDrawingContext.m" lineNumber:67 description:@"Image width should be greater than 0"];
  }
  if (height <= 0.0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"WFRemoteImageDrawingContext.m" lineNumber:68 description:@"Image height should be greater than 0"];
  }
  v27.receiver = self;
  v27.super_class = (Class)WFRemoteImageDrawingContext;
  uint64_t v19 = [(WFRemoteImageDrawingContext *)&v27 init];
  double v20 = (double *)v19;
  if (!v19) {
    goto LABEL_15;
  }
  v19->_imageCount = a3;
  v19->_singleImageSize.CGFloat width = width;
  v19->_singleImageSize.double height = height;
  if (a5 <= 0.0)
  {
    [(WFRemoteImageDrawingContext *)v19 screenScale];
    a5 = v21;
  }
  v20[3] = a5;
  if (a6) {
    CGColorSpaceRef v22 = CGColorSpaceRetain(a6);
  }
  else {
    CGColorSpaceRef v22 = 0;
  }
  *((void *)v20 + 4) = v22;
  *((unsigned char *)v20 + 8) = a9;
  if (!a7)
  {
    if ([v20 allocateSharedBuffer]) {
      goto LABEL_14;
    }
LABEL_15:
    double v23 = 0;
    goto LABEL_16;
  }
  *((void *)v20 + 6) = a7;
  *((void *)v20 + 7) = a8;
LABEL_14:
  double v23 = v20;
LABEL_16:

  return v23;
}

- (WFRemoteImageDrawingContext)initWithImageCount:(unint64_t)a3 singleImageSize:(CGSize)a4 scale:(double)a5 colorSpace:(CGColorSpace *)a6
{
  return -[WFRemoteImageDrawingContext initWithImageCount:singleImageSize:scale:colorSpace:buffer:bufferSize:drawAlphaOnly:](self, "initWithImageCount:singleImageSize:scale:colorSpace:buffer:bufferSize:drawAlphaOnly:", a3, a6, 0, 0, 0, a4.width, a4.height, a5);
}

- (WFRemoteImageDrawingContext)initWithAlphaOnlyImageCount:(unint64_t)a3 singleImageSize:(CGSize)a4 scale:(double)a5
{
  return -[WFRemoteImageDrawingContext initWithImageCount:singleImageSize:scale:colorSpace:buffer:bufferSize:drawAlphaOnly:](self, "initWithImageCount:singleImageSize:scale:colorSpace:buffer:bufferSize:drawAlphaOnly:", a3, 0, 0, 0, 1, a4.width, a4.height, a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end