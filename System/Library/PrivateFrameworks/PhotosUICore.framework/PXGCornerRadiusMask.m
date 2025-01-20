@interface PXGCornerRadiusMask
+ (id)_loadQueue;
+ (id)cornerRadiusMaskForDevice:(id)a3 maxCornerRadius:(double)a4 screenScale:(double)a5;
- (MTLTexture)atomicTexture;
- (MTLTexture)texture;
- (PXGCornerRadiusMask)init;
- (PXGCornerRadiusMask)initWithDevice:(id)a3 maxCornerRadius:(double)a4 screenScale:(double)a5;
- (double)maxCornerRadius;
- (double)screenScale;
- (int64_t)byteSize;
- (int64_t)numberOfSlices;
- (int64_t)texturePixelSide;
- (void)_loadCornerRadiusTexture;
- (void)setAtomicTexture:(id)a3;
@end

@implementation PXGCornerRadiusMask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atomicTexture, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setAtomicTexture:(id)a3
{
}

- (MTLTexture)atomicTexture
{
  return (MTLTexture *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)byteSize
{
  return self->_byteSize;
}

- (int64_t)numberOfSlices
{
  return self->_numberOfSlices;
}

- (double)maxCornerRadius
{
  return self->_maxCornerRadius;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (int64_t)texturePixelSide
{
  return self->_texturePixelSide;
}

- (MTLTexture)texture
{
  v3 = [(PXGCornerRadiusMask *)self atomicTexture];
  if (!v3)
  {
    v4 = +[PXGCornerRadiusMask _loadQueue];
    dispatch_sync(v4, &__block_literal_global_17_44149);

    v3 = [(PXGCornerRadiusMask *)self atomicTexture];
  }
  return (MTLTexture *)v3;
}

- (void)_loadCornerRadiusTexture
{
  double v3 = (double)(uint64_t)self->_maxCornerRadius * 1.528665;
  int64_t v4 = llround((double)(uint64_t)round((double)(uint64_t)self->_screenScale * (double)(uint64_t)ceil(v3 + v3)) * 0.5);
  int64_t v5 = (uint64_t)self->_screenScale * (uint64_t)self->_maxCornerRadius + 1;
  self->_texturePixelSide = v4;
  self->_numberOfSlices = v5;
  self->_byteSize = 2 * v4 * v5;
  v6 = +[PXGCornerRadiusMask _loadQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PXGCornerRadiusMask__loadCornerRadiusTexture__block_invoke;
  block[3] = &unk_1E5DD3630;
  block[4] = self;
  block[5] = v4;
  block[6] = v5;
  block[7] = v4;
  block[8] = (uint64_t)(double)(2 * v4);
  dispatch_async(v6, block);
}

void __47__PXGCornerRadiusMask__loadCornerRadiusTexture__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:1 width:*(void *)(a1 + 40) height:*(void *)(a1 + 40) mipmapped:0];
  [v2 setTextureType:3];
  [v2 setArrayLength:*(void *)(a1 + 48)];
  double v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) newTextureWithDescriptor:v2];
  int64_t v4 = CGBitmapContextCreate(0, *(void *)(a1 + 40), *(void *)(a1 + 40), 8uLL, *(void *)(a1 + 56), 0, 7u);
  CGFloat v5 = (double)*(uint64_t *)(a1 + 40);
  transform.b = 0.0;
  transform.c = 0.0;
  transform.a = 1.0;
  *(_OWORD *)&transform.d = xmmword_1AB359C80;
  transform.ty = v5;
  CGContextConcatCTM(v4, &transform);
  if (*(uint64_t *)(a1 + 48) >= 1)
  {
    uint64_t v6 = 0;
    double v7 = (double)*(uint64_t *)(a1 + 64);
    double v8 = (double)*(uint64_t *)(a1 + 40);
    do
    {
      CGContextSaveGState(v4);
      CGContextSetBlendMode(v4, kCGBlendModeCopy);
      CGContextSetRGBFillColor(v4, 0.0, 0.0, 0.0, 0.0);
      v14.origin.x = 0.0;
      v14.origin.y = 0.0;
      v14.size.width = v8;
      v14.size.height = v8;
      CGContextFillRect(v4, v14);
      objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v7, v7, (double)v6);
      id v9 = objc_claimAutoreleasedReturnValue();
      CGContextAddPath(v4, (CGPathRef)[v9 CGPath]);
      CGContextClip(v4);
      CGContextSetRGBFillColor(v4, 1.0, 1.0, 1.0, 1.0);
      v15.origin.x = 0.0;
      v15.origin.y = 0.0;
      v15.size.width = v7;
      v15.size.height = v7;
      CGContextFillRect(v4, v15);
      Data = CGBitmapContextGetData(v4);
      uint64_t v11 = *(void *)(a1 + 40);
      memset(v12, 0, 24);
      v12[3] = v11;
      v12[4] = v11;
      v12[5] = 1;
      [v3 replaceRegion:v12 mipmapLevel:0 slice:v6 withBytes:Data bytesPerRow:*(void *)(a1 + 56) bytesPerImage:*(void *)(a1 + 56) * v11];
      CGContextRestoreGState(v4);

      ++v6;
    }
    while (v6 < *(void *)(a1 + 48));
  }
  CGContextRelease(v4);
  [*(id *)(a1 + 32) setAtomicTexture:v3];
}

- (PXGCornerRadiusMask)init
{
  int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGCornerRadiusMask.m", 62, @"%s is not available as initializer", "-[PXGCornerRadiusMask init]");

  abort();
}

- (PXGCornerRadiusMask)initWithDevice:(id)a3 maxCornerRadius:(double)a4 screenScale:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGCornerRadiusMask;
  v10 = [(PXGCornerRadiusMask *)&v13 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a3);
    v11->_screenScale = a5;
    v11->_maxCornerRadius = a4;
    [(PXGCornerRadiusMask *)v11 _loadCornerRadiusTexture];
  }

  return v11;
}

+ (id)cornerRadiusMaskForDevice:(id)a3 maxCornerRadius:(double)a4 screenScale:(double)a5
{
  id v7 = a3;
  double v8 = objc_msgSend(NSString, "stringWithFormat:", @"device:%p maxCornerRadius:%.5f screenScale:%.5f", v7, *(void *)&a4, *(void *)&a5);
  if (cornerRadiusMaskForDevice_maxCornerRadius_screenScale__onceToken != -1) {
    dispatch_once(&cornerRadiusMaskForDevice_maxCornerRadius_screenScale__onceToken, &__block_literal_global_4_44167);
  }
  id v9 = [(id)cornerRadiusMaskForDevice_maxCornerRadius_screenScale__cache objectForKey:v8];
  if (!v9)
  {
    id v9 = [[PXGCornerRadiusMask alloc] initWithDevice:v7 maxCornerRadius:a4 screenScale:a5];
    [(id)cornerRadiusMaskForDevice_maxCornerRadius_screenScale__cache setObject:v9 forKey:v8];
  }

  return v9;
}

uint64_t __77__PXGCornerRadiusMask_cornerRadiusMaskForDevice_maxCornerRadius_screenScale___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)cornerRadiusMaskForDevice_maxCornerRadius_screenScale__cache;
  cornerRadiusMaskForDevice_maxCornerRadius_screenScale__cache = (uint64_t)v0;

  v2 = (void *)cornerRadiusMaskForDevice_maxCornerRadius_screenScale__cache;
  return [v2 setCountLimit:2];
}

+ (id)_loadQueue
{
  if (_loadQueue_onceToken != -1) {
    dispatch_once(&_loadQueue_onceToken, &__block_literal_global_44172);
  }
  v2 = (void *)_loadQueue_queue;
  return v2;
}

void __33__PXGCornerRadiusMask__loadQueue__block_invoke()
{
  id v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.PXGCornerRadiusMask-loadQueue", attr);
  v2 = (void *)_loadQueue_queue;
  _loadQueue_queue = (uint64_t)v1;
}

@end