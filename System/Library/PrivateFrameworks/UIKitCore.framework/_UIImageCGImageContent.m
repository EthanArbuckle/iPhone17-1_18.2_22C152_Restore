@interface _UIImageCGImageContent
- (BOOL)hasCGImage;
- (BOOL)isCGImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHDR;
- (BOOL)optimizeContentForImageSize:(CGSize)a3 completionHandler:(id)a4;
- (BOOL)prepareContentForDisplayWithCompletionHandler:(id)a3;
- (CGImage)CGImage;
- (CGImage)_provideCGImageWithSize:(CGSize)a3 scale:(double)a4;
- (CGSize)sizeInPixels;
- (_UIImageCGImageContent)contentWithCGImage:(CGImage *)a3;
- (_UIImageCGImageContent)initWithCGImage:(CGImage *)a3 scale:(double)a4;
- (_UIImageCGImageContent)initWithCGImageSource:(CGImageSource *)a3 CGImage:(CGImage *)a4 scale:(double)a5;
- (_UIImageCGImageContent)initWithCGImageSource:(CGImageSource *)a3 scale:(double)a4;
- (double)imageMaximumHeadroom;
- (id)_activeDecompressorCreatingIfNecessary;
- (id)contentOptimizedForImageSize:(CGSize)a3;
- (id)contentPreparedForDisplay;
- (id)description;
- (id)imageRendererFormat;
- (id)makeSDRVersion;
- (id)renditionApplyingEffect:(id)a3;
- (id)typeName;
- (unint64_t)hash;
- (void)_contentWithCARenderRef;
- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6;
- (void)dealloc;
@end

@implementation _UIImageCGImageContent

- (BOOL)isEqual:(id)a3
{
  v4 = (atomic_ullong *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)&self->_imageRef, memory_order_acquire);
    unint64_t v6 = atomic_load_explicit(v4 + 5, memory_order_acquire);
    v10.receiver = self;
    v10.super_class = (Class)_UIImageCGImageContent;
    unsigned __int8 v7 = [(_UIImageContent *)&v10 isEqual:v4];
    if (explicit == v6) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(_UIImageCGImageContent *)self CGImage];
  return CFHash(v2);
}

- (CGSize)sizeInPixels
{
  v2 = [(_UIImageCGImageContent *)self CGImage];
  double Width = (double)CGImageGetWidth(v2);
  double Height = (double)CGImageGetHeight(v2);
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (CGImage)CGImage
{
  return (CGImage *)atomic_load_explicit((atomic_ullong *volatile)&self->_imageRef, memory_order_acquire);
}

- (BOOL)hasCGImage
{
  return 1;
}

- (BOOL)isCGImage
{
  return 1;
}

- (void)dealloc
{
  CGImageRelease((CGImageRef)atomic_load_explicit((atomic_ullong *volatile)&self->_imageRef, memory_order_acquire));
  v3.receiver = self;
  v3.super_class = (Class)_UIImageCGImageContent;
  [(_UIImageCGImageContent *)&v3 dealloc];
}

- (_UIImageCGImageContent)contentWithCGImage:(CGImage *)a3
{
  double v5 = [_UIImageCGImageContent alloc];
  [(_UIImageContent *)self scale];
  unint64_t v6 = -[_UIImageCGImageContent initWithCGImage:scale:](v5, "initWithCGImage:scale:", a3);
  return v6;
}

- (_UIImageCGImageContent)initWithCGImageSource:(CGImageSource *)a3 CGImage:(CGImage *)a4 scale:(double)a5
{
  if (!a4)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:688 description:@"Need an imageRef"];
  }
  CFTypeID v10 = CFGetTypeID(a4);
  if (v10 != CGImageGetTypeID())
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:689 description:@"imageRef passed is not a CGImageRef"];
  }
  v15.receiver = self;
  v15.super_class = (Class)_UIImageCGImageContent;
  id v11 = [(_UIImageContent *)&v15 initWithScale:a5];
  if (v11)
  {
    atomic_store((unint64_t)CGImageRetain(a4), (unint64_t *)v11 + 5);
    [v11 _setCGImageSource:a3];
  }
  return (_UIImageCGImageContent *)v11;
}

- (_UIImageCGImageContent)initWithCGImage:(CGImage *)a3 scale:(double)a4
{
  uint64_t ImageSource = CGImageGetImageSource();
  return [(_UIImageCGImageContent *)self initWithCGImageSource:ImageSource CGImage:a3 scale:a4];
}

- (id)imageRendererFormat
{
  objc_super v3 = +[UIGraphicsImageRendererFormat preferredFormat];
  v4 = self;
  double v5 = [(_UIImageCGImageContent *)v4 CGImage];
  ColorSpace = CGImageGetColorSpace(v5);
  if ((CGImageGetBitmapInfo(v5) & 0x100) != 0)
  {
    unsigned __int8 v7 = v3;
    uint64_t v8 = 1;
  }
  else if ([(_UIImageCGImageContent *)v4 isHDR])
  {
    if (CGColorSpaceIsHLGBased(ColorSpace))
    {
      unsigned __int8 v7 = v3;
      uint64_t v8 = 101;
    }
    else
    {
      unsigned __int8 v7 = v3;
      uint64_t v8 = 100;
    }
  }
  else
  {
    if (CGColorSpaceSupportsOutput(ColorSpace))
    {
      [v3 _setOverrideColorSpace:ColorSpace];
      [v3 _setOverrideBitsPerComponent:CGImageGetBitsPerComponent(v5)];
      goto LABEL_11;
    }
    unsigned __int8 v7 = v3;
    uint64_t v8 = 0;
  }
  [v7 setPreferredRange:v8];
LABEL_11:
  [v3 setOpaque:CGImageHasAlpha() ^ 1];
  [(_UIImageContent *)v4 scale];
  objc_msgSend(v3, "setScale:");
  return v3;
}

- (BOOL)isHDR
{
  ColorSpace = CGImageGetColorSpace([(_UIImageCGImageContent *)self CGImage]);
  return CGColorSpaceUsesITUR_2100TF(ColorSpace);
}

- (BOOL)prepareContentForDisplayWithCompletionHandler:(id)a3
{
  id v4 = a3;
  double v5 = -[_UIImageContent _existingPreparedContentForDisplay](self);
  if (v5)
  {
    self;
    unint64_t v6 = _UIImageDecompressionCompletionQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke;
    block[3] = &unk_1E52DB330;
    id v20 = v4;
    id v19 = v5;
    dispatch_async(v6, block);

    unsigned __int8 v7 = v20;
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke_2;
    aBlock[3] = &unk_1E52DA160;
    aBlock[4] = self;
    id v8 = v4;
    id v17 = v8;
    v9 = _Block_copy(aBlock);
    CFTypeID v10 = -[_UIImageCGImageContent _activeDecompressorCreatingIfNecessary](self);
    if (v10)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __72___UIImageCGImageContent_prepareContentForDisplayWithCompletionHandler___block_invoke_4;
      v13[3] = &unk_1E52ECB50;
      v13[4] = self;
      id v14 = v8;
      id v15 = v9;
      -[_UINewCGImageDecompressor decompressAsync:]((uint64_t)v10, v13);
    }
    else
    {
      id v11 = AsyncFallbackPreparationQueue();
      dispatch_async(v11, v9);
    }
    unsigned __int8 v7 = v17;
  }

  return 1;
}

- (id)contentPreparedForDisplay
{
  objc_super v3 = -[_UIImageContent _existingPreparedContentForDisplay](self);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    double v5 = -[_UIImageCGImageContent _activeDecompressorCreatingIfNecessary](self);
    unint64_t v6 = v5;
    if (!v5) {
      goto LABEL_6;
    }
    uint64_t v7 = [v5 waitForImageRef];
    if (!v7
      || (uint64_t v8 = v7,
          v9 = [_UIImageCGImageContent alloc],
          [(_UIImageContent *)self scale],
          CFTypeID v10 = -[_UIImageCGImageContent initWithCGImage:scale:](v9, "initWithCGImage:scale:", v8),
          -[_UIImageCGImageContent _contentWithCARenderRef](v10),
          id v11 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v11))
    {
LABEL_6:
      id v11 = -[_UIImageCGImageContent _contentWithCARenderRef](self);
    }
    +[_UIImageContent _cachePreparedContent:forDisplayOfContent:]((uint64_t)_UIImageCGImageContent, v11, self);
    objc_setAssociatedObject(self, @"com.apple.UIKit.active-decompressor", 0, (void *)0x301);
    id v4 = v11;
  }
  return v4;
}

- (id)_activeDecompressorCreatingIfNecessary
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    v2 = objc_getAssociatedObject(v1, @"com.apple.UIKit.active-decompressor");
    if (!v2)
    {
      objc_super v3 = [_UINewCGImageDecompressor alloc];
      id v4 = v1;
      uint64_t v5 = [v4 CGImage];
      self;
      unint64_t v6 = _UIImageDecompressionCompletionQueue();
      v2 = -[_UINewCGImageDecompressor initWithSourceImage:completionQueue:](v3, v5, v6);

      objc_setAssociatedObject(v4, @"com.apple.UIKit.active-decompressor", v2, (void *)1);
    }
    objc_sync_exit(v1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_contentWithCARenderRef
{
  if (a1
    && ((id v1 = a1,
         v2 = (void *)[v1 CGImage],
         ![MEMORY[0x1E4FBA8A8] instancesRespondToSelector:sel_CA_copyRenderValueWithColorspace_])? (uint64_t v3 = objc_msgSend(v2, "CA_copyRenderValue")): (uint64_t v3 = objc_msgSend(v2, "CA_copyRenderValueWithColorspace:", CGImageGetColorSpace((CGImageRef)v2))), v3))
  {
    id v4 = [_UIImagePreparedCGImageContent alloc];
    [v1 scale];
    if (v4)
    {
      double v6 = v5;
      if (!v2)
      {
        v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:sel_initWithCARenderRef_CGImage_scale_, v4, @"_UIImageContent.m", 655, @"Invalid parameter not satisfying: %@", @"originalImageRef != NULL" object file lineNumber description];
      }
      v10.receiver = v4;
      v10.super_class = (Class)_UIImagePreparedCGImageContent;
      uint64_t v7 = objc_msgSendSuper2(&v10, sel_initWithCGImage_scale_, v2, v6);
      if (v7) {
        v7[6] = CARenderRetain();
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    CARenderRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (_UIImageCGImageContent)initWithCGImageSource:(CGImageSource *)a3 scale:(double)a4
{
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
  if (ImageAtIndex)
  {
    uint64_t v8 = ImageAtIndex;
    v9 = [(_UIImageCGImageContent *)self initWithCGImageSource:a3 CGImage:ImageAtIndex scale:a4];
    CGImageRelease(v8);
    self = v9;
    objc_super v10 = self;
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p CGImageRef:%p>", objc_opt_class(), self, atomic_load_explicit((atomic_ullong *volatile)&self->_imageRef, memory_order_acquire)];
}

- (id)typeName
{
  return @"CGImage";
}

- (double)imageMaximumHeadroom
{
  v2 = [(_UIImageCGImageContent *)self CGImage];
  ColorSpace = CGImageGetColorSpace(v2);
  BOOL v4 = CGColorSpaceUsesITUR_2100TF(ColorSpace);
  double result = 1.0;
  if (v4)
  {
    if (CGImageGetHeadroom())
    {
      return 0.0;
    }
    else
    {
      double v6 = CGImageGetColorSpace(v2);
      BOOL IsHLGBased = CGColorSpaceIsHLGBased(v6);
      double result = 8.0;
      if (IsHLGBased) {
        return 5.0;
      }
    }
  }
  return result;
}

- (id)makeSDRVersion
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (![(_UIImageCGImageContent *)self isHDR])
  {
    objc_super v10 = self;
    goto LABEL_12;
  }
  uint64_t v3 = self;
  BOOL v4 = [(_UIImageCGImageContent *)v3 CGImage];
  double v5 = v3;
  double v6 = [(_UIImageContent *)v5 CGImageSource];
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v18 = *MEMORY[0x1E4F2FE58];
  v19[0] = *MEMORY[0x1E4F2FE70];
  CFDictionaryRef v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, v7);
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  if (CGColorSpaceUsesITUR_2100TF(ColorSpace))
  {
    CFRelease(ImageAtIndex);

LABEL_7:
    id v11 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
    unint64_t Width = CGImageGetWidth(v4);
    unint64_t Height = CGImageGetHeight(v4);
    if (CGImageHasAlpha()) {
      uint32_t v14 = 4353;
    }
    else {
      uint32_t v14 = 4357;
    }
    id v15 = CGBitmapContextCreate(0, Width, Height, 0x10uLL, 0, v11, v14);
    CGColorSpaceRelease(v11);
    CGContextSetBlendMode(v15, kCGBlendModeCopy);
    v21.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v21.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
    v21.size.width = (double)Width;
    v21.size.height = (double)Height;
    CGContextDrawImage(v15, v21, v4);
    CGImageRef ImageAtIndex = CGBitmapContextCreateImage(v15);
    CGContextRelease(v15);
    goto LABEL_11;
  }

  if (!ImageAtIndex) {
    goto LABEL_7;
  }
LABEL_11:
  v16 = [_UIImageCGImageContent alloc];
  [(_UIImageContent *)v5 scale];
  objc_super v10 = -[_UIImageCGImageContent initWithCGImageSource:CGImage:scale:](v16, "initWithCGImageSource:CGImage:scale:", v6, ImageAtIndex);
  CFRelease(ImageAtIndex);
LABEL_12:
  return v10;
}

- (id)renditionApplyingEffect:(id)a3
{
  if (a3)
  {
    v15.receiver = self;
    v15.super_class = (Class)_UIImageCGImageContent;
    BOOL v4 = -[_UIImageContent renditionApplyingEffect:](&v15, sel_renditionApplyingEffect_);
  }
  else
  {
    [(_UIImageContent *)self size];
    uint64_t v6 = v5;
    uint64_t v8 = v7;
    v9 = [(_UIImageCGImageContent *)self CGImage];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50___UIImageCGImageContent_renditionApplyingEffect___block_invoke;
    aBlock[3] = &__block_descriptor_56_e20_v16__0__CGContext__8l;
    aBlock[4] = v6;
    void aBlock[5] = v8;
    aBlock[6] = v9;
    objc_super v10 = _Block_copy(aBlock);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50___UIImageCGImageContent_renditionApplyingEffect___block_invoke_2;
    v13[3] = &__block_descriptor_40_e15___CGImage__8__0l;
    v13[4] = v9;
    id v11 = +[_UIImageContentRenditionResult resultWithDrawingProvider:CGImageProvider:rbSymbolConfigurationProvider:]((uint64_t)_UIImageContentRenditionResult, v10, v13, 0);
    BOOL v4 = +[_UIImageContentRendition renditionWithResult:]((uint64_t)_UIImageContentRendition, v11);
  }
  return v4;
}

- (CGImage)_provideCGImageWithSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  [(_UIImageContent *)self size];
  if (width == v8 && height == v7)
  {
    objc_super v15 = (const void *)atomic_load((unint64_t *)&self->_imageRef);
    CFTypeRef v16 = CFRetain(v15);
    return (CGImage *)CFAutorelease(v16);
  }
  else
  {
    objc_super v10 = 0;
    if (width > 0.0 && height > 0.0)
    {
      id v11 = [(_UIImageCGImageContent *)self imageRendererFormat];
      v12 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v11, width, height);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __56___UIImageCGImageContent__provideCGImageWithSize_scale___block_invoke;
      v17[3] = &unk_1E52ECB28;
      *(double *)&v17[5] = width;
      *(double *)&v17[6] = height;
      v17[4] = self;
      id v13 = [(UIGraphicsImageRenderer *)v12 imageWithActions:v17];
      objc_super v10 = (CGImage *)[v13 CGImage];
    }
    return v10;
  }
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v9 = *MEMORY[0x1E4F1DAD8];
  uint64_t v10 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
  id v11 = [(_UIImageCGImageContent *)self CGImage];
  uint64_t v12 = v9;
  uint64_t v13 = v10;
  CGFloat v14 = width;
  CGFloat v15 = height;
  CGContextDrawImage(a5, *(CGRect *)&v12, v11);
}

- (id)contentOptimizedForImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v20[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = self;
  [(_UIImageCGImageContent *)v5 CGImage];
  uint64_t v6 = v5;
  double v7 = [(_UIImageContent *)v6 CGImageSource];
  [(_UIImageContent *)v6 scale];
  double v9 = v8;
  [(_UIImageCGImageContent *)v6 sizeInPixels];
  double v10 = width * v9;
  if (width * v9 < height * v9) {
    double v10 = height * v9;
  }
  unint64_t v11 = vcvtpd_u64_f64(v10);
  if (v7)
  {
    uint64_t v12 = *MEMORY[0x1E4F2FE28];
    v19[0] = *MEMORY[0x1E4F2FE38];
    v19[1] = v12;
    v20[0] = MEMORY[0x1E4F1CC38];
    v20[1] = MEMORY[0x1E4F1CC38];
    void v19[2] = *MEMORY[0x1E4F2FF68];
    uint64_t v13 = [NSNumber numberWithUnsignedLong:v11];
    v19[3] = *MEMORY[0x1E4F2FE48];
    v20[2] = v13;
    v20[3] = MEMORY[0x1E4F1CC28];
    CGFloat v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
    CFDictionaryRef v15 = (const __CFDictionary *)[v14 mutableCopy];

    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v7, 0, v15);
    if (ThumbnailAtIndex)
    {
LABEL_5:
      id v17 = [[_UIImageCGImageContent alloc] initWithCGImage:ThumbnailAtIndex scale:v9];
      CGImageRelease(ThumbnailAtIndex);
      goto LABEL_8;
    }
  }
  else
  {
    ThumbnailAtIndex = (CGImage *)CGImageCreateThumb();
    if (ThumbnailAtIndex) {
      goto LABEL_5;
    }
  }
  id v17 = 0;
LABEL_8:
  return v17;
}

- (BOOL)optimizeContentForImageSize:(CGSize)a3 completionHandler:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIImageContent.m", 1067, @"Invalid parameter not satisfying: %@", @"completionHandler != NULL" object file lineNumber description];
  }
  double v9 = AsyncFallbackPreparationQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72___UIImageCGImageContent_optimizeContentForImageSize_completionHandler___block_invoke;
  block[3] = &unk_1E52EBE88;
  void block[4] = self;
  id v14 = v8;
  CGFloat v15 = width;
  CGFloat v16 = height;
  id v10 = v8;
  dispatch_async(v9, block);

  return 1;
}

@end