@interface VKCRemoveBackgroundResult
- (BOOL)isMaskResult;
- (CGImage)createCGImage;
- (CGImage)maskImage;
- (CGImage)orientedMaskImage;
- (CGImageRef)_createCGImageFromBGRAPixelBuffer:(CGFloat)a3 cropRect:(CGFloat)a4;
- (CGImageRef)_memoryFriendlyCreateCGImageFromBGRAPixelBuffer:(CGFloat)a3 cropRect:(CGFloat)a4;
- (CGRect)cropRect;
- (CGRect)initWithMADMaskResult:(void *)a3 request:;
- (CGRect)normalizedCropRect;
- (NSArray)instanceMasks;
- (NSNumber)animatedStickerScore;
- (VKCRemoveBackgroundRequest)request;
- (VKCRemoveBackgroundResult)initWithMADResult:(id)a3 request:(id)a4;
- (__CVBuffer)pixelBuffer;
- (const)imageRefForMask:(uint64_t)a1;
- (id)initWithMADMatteResult:(void *)a3 request:;
- (int64_t)imageOrientation;
- (uint64_t)setIsMaskResult:(uint64_t)result;
- (void)dealloc;
- (void)generateImageMaskIfNecessaryWithContext:(id)a3;
- (void)setAnimatedStickerScore:(uint64_t)a1;
- (void)setInstanceMasks:(uint64_t)a1;
- (void)setMaskImage:(CGImage *)a3;
- (void)setOrientedMaskImage:(CGImage *)a3;
@end

@implementation VKCRemoveBackgroundResult

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  CGImageRelease(self->_maskImage);
  CGImageRelease(self->_orientedMaskImage);
  v3.receiver = self;
  v3.super_class = (Class)VKCRemoveBackgroundResult;
  [(VKCRemoveBackgroundResult *)&v3 dealloc];
}

- (VKCRemoveBackgroundResult)initWithMADResult:(id)a3 request:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  v9 = VKDynamicCast(v8, (uint64_t)v6);
  if (v9)
  {
    self = -[VKCRemoveBackgroundResult initWithMADMaskResult:request:]((CGRect *)self, v9, v7);
    v10 = self;
  }
  else
  {
    uint64_t v11 = objc_opt_class();
    v12 = VKDynamicCast(v11, (uint64_t)v6);
    if (v12)
    {
      self = -[VKCRemoveBackgroundResult initWithMADMatteResult:request:]((id *)&self->super.isa, v12, v7);
      v10 = self;
    }
    else
    {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[VKCRemoveBackgroundResult initWithMADResult:request:]", 0, 0, @"Incompatible class type for VKCRemoveBackgroundResult:initWithMadResult: %@", objc_opt_class());
      v10 = 0;
    }
  }
  return v10;
}

- (CGRect)initWithMADMaskResult:(void *)a3 request:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v30.receiver = a1;
    v30.super_class = (Class)VKCRemoveBackgroundResult;
    id v7 = (id *)[(CGRect *)&v30 init];
    a1 = (CGRect *)v7;
    if (v7)
    {
      objc_storeStrong(v7 + 7, a3);
      [v5 sourceRegionOfInterest];
      double v12 = VKMFlipRect(v8, v9, v10, v11, 0.0, 0.0, 1.0, 1.0);
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      a1[2].origin.CGFloat x = v12;
      a1[2].origin.y = v13;
      a1[2].size.CGFloat width = v15;
      a1[2].size.height = v17;
      [v6 size];
      size_t v20 = (unint64_t)v19;
      [v6 size];
      size_t v22 = (unint64_t)v21;
      v31.origin.CGFloat x = v12;
      v31.origin.y = v14;
      v31.size.CGFloat width = v16;
      v31.size.height = v18;
      a1[3] = VNImageRectForNormalizedRect(v31, v20, v22);
      v23 = [v5 allInstances];
      uint64_t v24 = [v5 maskImagesForInstances:v23 error:0];
      CGFloat x = a1[1].origin.x;
      *(void *)&a1[1].origin.CGFloat x = v24;

      v26 = [v5 animatedStickerScore];
      [v6 setAnimatedStickerScore:v26];

      uint64_t v27 = [v5 animatedStickerScore];
      CGFloat width = a1[1].size.width;
      *(void *)&a1[1].size.CGFloat width = v27;

      LOBYTE(a1->size.width) = 1;
    }
  }

  return a1;
}

- (id)initWithMADMatteResult:(void *)a3 request:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v26.receiver = a1;
    v26.super_class = (Class)VKCRemoveBackgroundResult;
    id v7 = (id *)objc_msgSendSuper2(&v26, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong(v7 + 7, a3);
      a1[1] = CVPixelBufferRetain((CVPixelBufferRef)[v5 pixelBuffer]);
      +[VKCPreDeclare cropRectForMatteResult:v5];
      double x = v27.origin.x;
      double y = v27.origin.y;
      double width = v27.size.width;
      double height = v27.size.height;
      if (CGRectIsNull(v27))
      {
        *((_OWORD *)a1 + 4) = VKMRectUnit;
        *((_OWORD *)a1 + 5) = *(_OWORD *)&qword_1DB33EB28;
        vk_sizeForPixelBuffer((__CVBuffer *)a1[1]);
        double v12 = VKMRectWithSize();
      }
      else
      {
        *((double *)a1 + 8) = VKMFlipRect(x, y, width, height, 0.0, 0.0, 1.0, 1.0);
        a1[9] = v16;
        a1[10] = v17;
        a1[11] = v18;
        [v6 size];
        double v19 = VKMRectWithSize();
        VKMRectFromNormalizedSubrect(v19, v20, v21, v22, *((CGFloat *)a1 + 8), *((CGFloat *)a1 + 9), *((CGFloat *)a1 + 10), *((CGFloat *)a1 + 11));
      }
      *((double *)a1 + 12) = v12;
      a1[13] = v13;
      a1[14] = v14;
      a1[15] = v15;
      uint64_t v23 = [v6 animatedStickerScore];
      id v24 = a1[6];
      a1[6] = (id)v23;
    }
  }

  return a1;
}

- (CGImage)maskImage
{
  return self->_maskImage;
}

- (NSArray)instanceMasks
{
  v2 = (void *)[(NSArray *)self->_instanceMasks copy];
  return (NSArray *)v2;
}

- (void)generateImageMaskIfNecessaryWithContext:(id)a3
{
  id v23 = a3;
  v4 = [(VKCRemoveBackgroundResult *)self pixelBuffer];
  if (!self->_maskImage)
  {
    id v5 = v4;
    BOOL v6 = self->_orientedMaskImage || v4 == 0;
    if (!v6 && CVPixelBufferGetPixelFormatType(v4) == 1278226534)
    {
      id v7 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v5];
      double v8 = [MEMORY[0x1E4F1E040] filterWithName:@"CIMaskToAlpha"];
      [v8 setValue:v7 forKey:@"inputImage"];
      if (v23) {
        id v9 = v23;
      }
      else {
        id v9 = (id)[objc_alloc(MEMORY[0x1E4F1E018]) initWithOptions:0];
      }
      double v10 = v9;
      CVPixelBufferGetHeight(v5);
      CVPixelBufferGetWidth(v5);
      double v11 = VKMRectWithSize();
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      CGFloat v18 = [v8 outputImage];
      uint64_t v19 = *MEMORY[0x1E4F1E280];
      self->_maskImage = (CGImage *)objc_msgSend(v10, "createCGImage:fromRect:format:colorSpace:", v18, v19, 0, v11, v13, v15, v17);

      CGFloat v20 = [(VKCRemoveBackgroundResult *)self request];
      CGFloat v21 = objc_msgSend(v7, "imageByApplyingCGOrientation:", vk_cgImagePropertyOrientationFromVKOrientation(objc_msgSend(v20, "imageOrientation")));

      [v8 setValue:v21 forKey:@"inputImage"];
      CGFloat v22 = [v8 outputImage];
      self->_orientedMaskImage = (CGImage *)objc_msgSend(v10, "createCGImage:fromRect:format:colorSpace:", v22, v19, 0, v11, v13, v15, v17);
    }
  }
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (int64_t)imageOrientation
{
  v2 = [(VKCRemoveBackgroundResult *)self request];
  int64_t v3 = [v2 imageOrientation];

  return v3;
}

- (CGImage)createCGImage
{
  int64_t v3 = [(VKCRemoveBackgroundResult *)self pixelBuffer];
  [(VKCRemoveBackgroundResult *)self cropRect];
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  if (v3 && VKMRectHasArea(v4, v5, v6, v7))
  {
    CVPixelBufferRetain(v3);
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(v3);
    if (PixelFormatType == 1111970369)
    {
      double v13 = vk_cgImageFromPixelBuffer(v3);
    }
    else
    {
      uint64_t v15 = PixelFormatType;
      double v16 = VKMUIStringForCVPixelBufferType(1111970369);
      double v17 = VKMUIStringForCVPixelBufferType(v15);
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "[(VKCRemoveBackgroundResult *)"Pixel format for createCGImage is incorrect createCGImage], v16, v17);

      double v13 = 0;
    }
    CVPixelBufferRelease(v3);
  }
  else
  {
    double v14 = VKMUIStringForRect(v8, v9, v10, v11);
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "[(VKCRemoveBackgroundResult *)"CreateCGImage is buffer incorrect createCGImage], v3, v14);

    return 0;
  }
  return v13;
}

- (CGImageRef)_createCGImageFromBGRAPixelBuffer:(CGFloat)a3 cropRect:(CGFloat)a4
{
  if (!a1) {
    return 0;
  }
  double v10 = vk_cgImageFromPixelBuffer(a2);
  v13.origin.double x = a3;
  v13.origin.double y = a4;
  v13.size.double width = a5;
  v13.size.double height = a6;
  CGImageRef v11 = CGImageCreateWithImageInRect(v10, v13);
  CGImageRelease(v10);
  if (v11) {
    CFAutorelease(v11);
  }
  return v11;
}

- (CGImageRef)_memoryFriendlyCreateCGImageFromBGRAPixelBuffer:(CGFloat)a3 cropRect:(CGFloat)a4
{
  if (!a1) {
    return 0;
  }
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  CFDictionaryRef v13 = CVPixelFormatDescriptionCreateWithPixelFormatType(0, PixelFormatType);
  if (!v13)
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((pixelFormatDict) != nil)", "-[VKCRemoveBackgroundResult _memoryFriendlyCreateCGImageFromBGRAPixelBuffer:cropRect:]", 0, 0, @"Expected non-nil value for '%s'", "pixelFormatDict");
    if (BaseAddress) {
      goto LABEL_4;
    }
LABEL_9:
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((bufferBaseAddress) != nil)", "-[VKCRemoveBackgroundResult _memoryFriendlyCreateCGImageFromBGRAPixelBuffer:cropRect:]", 0, 0, @"Expected non-nil value for '%s'", "bufferBaseAddress");
    goto LABEL_4;
  }
  if (!BaseAddress) {
    goto LABEL_9;
  }
LABEL_4:
  double v14 = [(__CFDictionary *)v13 objectForKeyedSubscript:*MEMORY[0x1E4F24E18]];
  unint64_t v15 = [v14 integerValue];

  double v16 = [(__CFDictionary *)v13 objectForKeyedSubscript:@"BitsPerComponent"];
  size_t v17 = [v16 integerValue];

  CFRelease(v13);
  v26.origin.double x = a3;
  v26.origin.double y = a4;
  v26.size.double width = a5;
  v26.size.double height = a6;
  unint64_t v18 = vcvtmd_u64_f64(CGRectGetMinX(v26));
  v27.origin.double x = a3;
  v27.origin.double y = a4;
  v27.size.double width = a5;
  v27.size.double height = a6;
  unint64_t v19 = vcvtmd_u64_f64(CGRectGetMinY(v27));
  CGFloat v20 = &BaseAddress[(v15 >> 3) * v18 + CVPixelBufferGetBytesPerRow(pixelBuffer) * v19];
  CGFloat v21 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
  id v23 = CGBitmapContextCreate(v20, vcvtmd_u64_f64(a5), vcvtmd_u64_f64(a6), v17, BytesPerRow, v21, 0x2002u);
  CGImageRef Image = CGBitmapContextCreateImage(v23);
  CGContextRelease(v23);
  CGColorSpaceRelease(v21);
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  if (Image) {
    CFAutorelease(Image);
  }

  return Image;
}

- (const)imageRefForMask:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  int64_t v3 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a2];
  double v4 = [MEMORY[0x1E4F1E040] filterWithName:@"CIMaskToAlpha"];
  [v4 setValue:v3 forKey:@"inputImage"];
  double v5 = [v4 valueForKey:@"outputImage"];
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4F1E018]) initWithOptions:0];
  CVPixelBufferGetHeight(a2);
  CVPixelBufferGetWidth(a2);
  double v7 = (const void *)[v6 createCGImage:v5 fromRect:*MEMORY[0x1E4F1E280] format:0 colorSpace:VKMRectWithSize()];
  double v8 = v7;
  if (v7) {
    CFAutorelease(v7);
  }

  return v8;
}

- (void)setMaskImage:(CGImage *)a3
{
  self->_maskCGImageRef Image = a3;
}

- (void)setInstanceMasks:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (CGImage)orientedMaskImage
{
  return self->_orientedMaskImage;
}

- (void)setOrientedMaskImage:(CGImage *)a3
{
  self->_orientedMaskCGImageRef Image = a3;
}

- (CGRect)normalizedCropRect
{
  double x = self->_normalizedCropRect.origin.x;
  double y = self->_normalizedCropRect.origin.y;
  double width = self->_normalizedCropRect.size.width;
  double height = self->_normalizedCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSNumber)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (void)setAnimatedStickerScore:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (BOOL)isMaskResult
{
  if (result) {
    return *(unsigned char *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)setIsMaskResult:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 16) = a2;
  }
  return result;
}

- (VKCRemoveBackgroundRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_animatedStickerScore, 0);
  objc_storeStrong((id *)&self->_instanceMasks, 0);
}

@end