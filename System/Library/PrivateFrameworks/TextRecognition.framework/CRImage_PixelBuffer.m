@interface CRImage_PixelBuffer
+ (__CVBuffer)_convertPixelBuffer:(__CVBuffer *)a3 toFormat:(unsigned int)a4 iosurfaceBacking:(BOOL)a5;
+ (void)drawVerticalLineAtXOffset:(double)a3 image:(id)a4;
- (CGImage)cgImage;
- (CRImage_PixelBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3;
- (CRImage_PixelBuffer)initWithContentsOfURL:(id)a3 toColorSpace:(int)a4;
- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4;
- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5;
- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6;
- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6 format:(unsigned int)a7;
- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6 format:(unsigned int)a7 hardwareAcceleration:(BOOL)a8 iosurfaceBacking:(BOOL)a9;
- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6 format:(unsigned int)a7 hardwareAcceleration:(BOOL)a8 toSurface:(__IOSurface *)a9;
- (__CVBuffer)_pixelBufferFromUrl:(id)a3;
- (__CVBuffer)pixelBuffer;
- (id)imageByApplyingBinaryMask:(id)a3;
- (id)imageByConvertingToColorSpace:(int)a3;
- (id)imageByConvertingToColorSpace:(int)a3 forceDataCopy:(BOOL)a4;
- (id)imageByCorrectingFromOrientation:(unsigned int)a3;
- (id)imageByCroppingRectangle:(CGRect)a3;
- (id)imageByCroppingRectangle:(CGRect)a3 iosurfaceBacking:(BOOL)a4;
- (id)imageByCroppingRectangle:(CGRect)a3 toSurface:(__IOSurface *)a4;
- (id)imageByDilating;
- (id)imageByInvertingIntensity;
- (id)imageByOverlayingRects:(CGRect *)a3 count:(int64_t)a4;
- (id)imageByOverlayingRects:(CGRect *)a3 count:(int64_t)a4 lineWidth:(double)a5 red:(double)a6 green:(double)a7 blue:(double)a8 alpha:(double)a9;
- (id)imageByPaddingToRatioAndScalingToWidth:(unint64_t)a3 height:(unint64_t)a4 paddingMode:(unint64_t)a5;
- (id)imageByPaddingToRatioAndScalingToWidth:(unint64_t)a3 height:(unint64_t)a4 paddingMode:(unint64_t)a5 alignCenter:(BOOL)a6;
- (id)imageByRotating180;
- (id)imageByRotating90CW;
- (id)imageByScalingToWidth:(unint64_t)a3 height:(unint64_t)a4;
- (unint64_t)height;
- (unint64_t)width;
- (vImage_Buffer)createFloatBuffer;
- (vImage_Buffer)vImage;
- (void)dealloc;
- (void)writeToFile:(id)a3;
@end

@implementation CRImage_PixelBuffer

- (unint64_t)height
{
  v2 = [(CRImage_PixelBuffer *)self pixelBuffer];
  return CVPixelBufferGetHeight(v2);
}

- (unint64_t)width
{
  v2 = [(CRImage_PixelBuffer *)self pixelBuffer];
  return CVPixelBufferGetWidth(v2);
}

- (__CVBuffer)pixelBuffer
{
  return self->super._pixelBuffer;
}

- (CRImage_PixelBuffer)initWithCVPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Attempting to initialize CRImage_PixelBuffer with nil CVPixelBufferRef" userInfo:0];
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)CRImage_PixelBuffer;
  v4 = [(CRImage *)&v12 init];
  if (v4)
  {
    v5 = CVPixelBufferRetain(a3);
    v4->super._pixelBuffer = v5;
    signed int PixelFormatType = CVPixelBufferGetPixelFormatType(v5);
    if (PixelFormatType <= 875704421)
    {
      if (PixelFormatType == 32)
      {
        uint64_t v7 = 1;
        goto LABEL_13;
      }
      if (PixelFormatType != 846624121)
      {
LABEL_15:
        v9 = CROSLogForCategory(0);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          OSType v10 = CVPixelBufferGetPixelFormatType(v4->super._pixelBuffer);
          *(_DWORD *)buf = 67109120;
          OSType v14 = v10;
          _os_log_impl(&dword_1DD733000, v9, OS_LOG_TYPE_FAULT, "[CRImage_PixelBuffer initWithCVPixelBuffer:] Unsupported pixel buffer type %08x", buf, 8u);
        }

        return v4;
      }
    }
    else if (PixelFormatType != 875704422)
    {
      if (PixelFormatType == 1111970369)
      {
        uint64_t v7 = 2;
        goto LABEL_13;
      }
      if (PixelFormatType == 1278226488)
      {
        uint64_t v7 = 0;
LABEL_13:
        [(CRImage *)v4 setColorSpace:v7];
        return v4;
      }
      goto LABEL_15;
    }
    uint64_t v7 = 3;
    goto LABEL_13;
  }
  return v4;
}

- (CRImage_PixelBuffer)initWithContentsOfURL:(id)a3 toColorSpace:(int)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 3)
  {
    v12.receiver = self;
    v12.super_class = (Class)CRImage_PixelBuffer;
    uint64_t v7 = [(CRImage *)&v12 init];
    v8 = v7;
    if (v7) {
      v7->super._pixelBuffer = [(CRImage_PixelBuffer *)v7 _pixelBufferFromUrl:v6];
    }
    self = v8;
    v9 = self;
  }
  else
  {
    OSType v10 = CROSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = a4;
      _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_ERROR, "[CRImage_PixelBuffer initWithContentsOfURL:toColorSpace:] Unsupported colorspace: %d ", buf, 8u);
    }

    v9 = 0;
  }

  return v9;
}

- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6 format:(unsigned int)a7
{
  return -[CRImage_PixelBuffer pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:iosurfaceBacking:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:iosurfaceBacking:", a5, a6, *(void *)&a7, 0, 0, a3, a4.width, a4.height);
}

- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6 format:(unsigned int)a7 hardwareAcceleration:(BOOL)a8 toSurface:(__IOSurface *)a9
{
  BOOL v10 = a8;
  double height = a4.height;
  double width = a4.width;
  if (*a9)
  {
    unint64_t v17 = [(CRImage_PixelBuffer *)self width];
    unint64_t v18 = [(CRImage_PixelBuffer *)self height];
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType([(CRImage_PixelBuffer *)self pixelBuffer]);
    CVPixelBufferRef pixelBufferOut = 0;
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v21 = 0;
    if (!CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], *a9, MEMORY[0x1E4F1CC08], &pixelBufferOut))
    {
      OSType v39 = PixelFormatType;
      unint64_t v22 = (unint64_t)width;
      unint64_t v23 = (unint64_t)height;
      unint64_t v24 = (unint64_t)((double)v18 * a3);
      unint64_t v25 = (unint64_t)((double)v17 * a3);
      VTPixelTransferSessionRef pixelTransferSessionOut = 0;
      VTPixelTransferSessionCreate(v20, &pixelTransferSessionOut);
      v26 = (const void *)*MEMORY[0x1E4F1CFD0];
      if (v10) {
        v27 = (const void *)*MEMORY[0x1E4F1CFD0];
      }
      else {
        v27 = (const void *)*MEMORY[0x1E4F1CFC8];
      }
      VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E4F45120], v27);
      VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E4F45118], v27);
      VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E4F45168], (CFTypeRef)*MEMORY[0x1E4F45450]);
      if (v25 >= v22) {
        unint64_t v28 = (unint64_t)width;
      }
      else {
        unint64_t v28 = v25;
      }
      if (v24 >= v23) {
        unint64_t v29 = (unint64_t)height;
      }
      else {
        unint64_t v29 = v24;
      }
      double v30 = (double)v28;
      double v31 = (double)v29;
      if (a5)
      {
        a5->double width = v30;
        a5->double height = v31;
      }
      v42.double width = (double)v22;
      v42.double height = (double)v23;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      v34 = createPixelBufferCLAPDictionaryFromRect(v42, *(CGRect *)(&v30 - 2));
      VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E4F450D8], v34);
      VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E4F45188], v26);
      v35 = pixelTransferSessionOut;
      v36 = [(CRImage_PixelBuffer *)self pixelBuffer];
      VTPixelTransferSessionTransferImage(v35, v36, pixelBufferOut);
      VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
      CFRelease(pixelTransferSessionOut);
      if (v39 == a7) {
        v21 = (CRImage_PixelBuffer *)pixelBufferOut;
      }
      else {
        v21 = 0;
      }
    }
  }
  else
  {
    v21 = -[CRImage_PixelBuffer pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:iosurfaceBacking:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:hardwareAcceleration:iosurfaceBacking:", a5, a6, *(void *)&a7, a8, 1, a3, a4.width, a4.height);
    IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)v21);
    *a9 = IOSurface;
    CFRetain(IOSurface);
  }
  return v21;
}

- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6 format:(unsigned int)a7 hardwareAcceleration:(BOOL)a8 iosurfaceBacking:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  double height = a4.height;
  double width = a4.width;
  unint64_t v16 = [(CRImage_PixelBuffer *)self width];
  unint64_t v17 = [(CRImage_PixelBuffer *)self height];
  CFDictionaryRef v18 = [MEMORY[0x1E4F1CA60] dictionary];
  CFDictionaryRef v19 = v18;
  if (v9) {
    [(__CFDictionary *)v18 setObject:MEMORY[0x1E4F1CC08] forKey:*MEMORY[0x1E4F24D20]];
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType([(CRImage_PixelBuffer *)self pixelBuffer]);
  unint64_t v21 = (unint64_t)width;
  unint64_t v22 = (unint64_t)height;
  CVPixelBufferRef pixelBufferOut = 0;
  CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (unint64_t)width, (unint64_t)height, PixelFormatType, v19, &pixelBufferOut))
  {
    unint64_t v24 = 0;
  }
  else
  {
    VTPixelTransferSessionRef pixelTransferSessionOut = 0;
    VTPixelTransferSessionCreate(v23, &pixelTransferSessionOut);
    unint64_t v25 = (const void *)*MEMORY[0x1E4F1CFD0];
    if (v10) {
      v26 = (const void *)*MEMORY[0x1E4F1CFD0];
    }
    else {
      v26 = (const void *)*MEMORY[0x1E4F1CFC8];
    }
    VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E4F45120], v26);
    VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E4F45118], v26);
    VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E4F45168], (CFTypeRef)*MEMORY[0x1E4F45450]);
    unint64_t v27 = (unint64_t)((double)v16 * a3);
    unint64_t v28 = (unint64_t)((double)v17 * a3);
    if (v27 >= v21) {
      unint64_t v27 = (unint64_t)width;
    }
    if (v28 >= v22) {
      unint64_t v28 = (unint64_t)height;
    }
    double v29 = (double)v27;
    double v30 = (double)v28;
    if (a5)
    {
      a5->double width = v29;
      a5->double height = v30;
    }
    v40.double width = (double)v21;
    v40.double height = (double)v22;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = createPixelBufferCLAPDictionaryFromRect(v40, *(CGRect *)(&v29 - 2));
    VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E4F450D8], v33);
    VTSessionSetProperty(pixelTransferSessionOut, (CFStringRef)*MEMORY[0x1E4F45188], v25);
    v34 = pixelTransferSessionOut;
    v35 = [(CRImage_PixelBuffer *)self pixelBuffer];
    VTPixelTransferSessionTransferImage(v34, v35, pixelBufferOut);
    VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
    CFRelease(pixelTransferSessionOut);
    if (PixelFormatType == a7)
    {
      unint64_t v24 = pixelBufferOut;
    }
    else
    {
      unint64_t v24 = +[CRImage_PixelBuffer _convertPixelBuffer:toFormat:iosurfaceBacking:](CRImage_PixelBuffer, "_convertPixelBuffer:toFormat:iosurfaceBacking:", pixelBufferOut);
      CVPixelBufferRelease(pixelBufferOut);
    }
  }
  return (CRImage_PixelBuffer *)v24;
}

- (id)imageByConvertingToColorSpace:(int)a3
{
  return [(CRImage_PixelBuffer *)self imageByConvertingToColorSpace:*(void *)&a3 forceDataCopy:0];
}

- (id)imageByConvertingToColorSpace:(int)a3 forceDataCopy:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(CRImage *)self colorSpace] != a3 || v4)
  {
    if (v5)
    {
      if (v5 == 3)
      {
        uint64_t v8 = 875704422;
        if (v4) {
          goto LABEL_16;
        }
      }
      else
      {
        if (v5 != 1)
        {
          id v11 = CROSLogForCategory(0);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            v13[0] = 67109120;
            v13[1] = v5;
            _os_log_impl(&dword_1DD733000, v11, OS_LOG_TYPE_FAULT, "[CRImage_PixelBuffer imageByConvertingToColorSpace:forceDataCopy:] Unsupported color space %d", (uint8_t *)v13, 8u);
          }

          goto LABEL_16;
        }
        uint64_t v8 = 32;
        if (v4)
        {
LABEL_16:
          uint64_t v7 = [[CRImage alloc] initWithCVPixelBuffer:[(CRImage_PixelBuffer *)self pixelBuffer] toColorSpace:v5 forceDataCopy:v4];
          goto LABEL_17;
        }
      }
    }
    else
    {
      uint64_t v8 = 1278226488;
      if (v4) {
        goto LABEL_16;
      }
    }
    BOOL v9 = +[CRImage_PixelBuffer _convertPixelBuffer:[(CRImage_PixelBuffer *)self pixelBuffer] toFormat:v8 iosurfaceBacking:1];
    BOOL v10 = [[CRImage_PixelBuffer alloc] initWithCVPixelBuffer:v9];
    CVPixelBufferRelease(v9);
    goto LABEL_18;
  }
  uint64_t v7 = self;
LABEL_17:
  BOOL v10 = v7;
LABEL_18:
  return v10;
}

- (id)imageByCroppingRectangle:(CGRect)a3
{
  return -[CRImage_PixelBuffer imageByCroppingRectangle:iosurfaceBacking:](self, "imageByCroppingRectangle:iosurfaceBacking:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)imageByCroppingRectangle:(CGRect)a3 toSurface:(__IOSurface *)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  BOOL v9 = *a4;
  if (*a4)
  {
    CVPixelBufferRef pixelBufferOut = 0;
    if (CVPixelBufferCreateWithIOSurface((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9, MEMORY[0x1E4F1CC08], &pixelBufferOut))
    {
      BOOL v10 = 0;
    }
    else
    {
      v13 = [(CRImage_PixelBuffer *)self pixelBuffer];
      CRCropRectangleFromPixelBuffer(v13, pixelBufferOut, x, y, width, height);
      uint64_t v14 = [CRImage_PixelBuffer alloc];
      BOOL v10 = [(CRImage_PixelBuffer *)v14 initWithCVPixelBuffer:pixelBufferOut];
      CVPixelBufferRelease(pixelBufferOut);
    }
  }
  else
  {
    -[CRImage_PixelBuffer imageByCroppingRectangle:iosurfaceBacking:](self, "imageByCroppingRectangle:iosurfaceBacking:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    BOOL v10 = (CRImage_PixelBuffer *)objc_claimAutoreleasedReturnValue();
    IOSurface = CVPixelBufferGetIOSurface([(CRImage_PixelBuffer *)v10 pixelBuffer]);
    *a4 = IOSurface;
    CFRetain(IOSurface);
  }
  return v10;
}

- (id)imageByCroppingRectangle:(CGRect)a3 iosurfaceBacking:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unint64_t v10 = [(CRImage_PixelBuffer *)self width];
  unint64_t v11 = [(CRImage_PixelBuffer *)self height];
  v32.size.double width = (double)v10;
  v32.size.double height = (double)v11;
  v32.origin.CGFloat x = 0.0;
  v32.origin.CGFloat y = 0.0;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.double width = width;
  v31.size.double height = height;
  if (!CGRectEqualToRect(v31, v32) || v4)
  {
    if (v4
      || [(CRImage *)self colorSpace]
      && [(CRImage *)self colorSpace] != 1
      && [(CRImage *)self colorSpace] != 2)
    {
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType([(CRImage_PixelBuffer *)self pixelBuffer]);
      CFDictionaryRef v14 = [MEMORY[0x1E4F1CA60] dictionary];
      CFDictionaryRef v15 = v14;
      if (v4) {
        [(__CFDictionary *)v14 setObject:MEMORY[0x1E4F1CC08] forKey:*MEMORY[0x1E4F24D20]];
      }
      texture[0] = 0;
      if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (unint64_t)width, (unint64_t)height, PixelFormatType, v15, texture))
      {
        uint64_t v16 = 0;
      }
      else
      {
        CFDictionaryRef v19 = [(CRImage_PixelBuffer *)self pixelBuffer];
        CRCropRectangleFromPixelBuffer(v19, texture[0], x, y, width, height);
        CFAllocatorRef v20 = [CRImage_PixelBuffer alloc];
        uint64_t v16 = [(CRImage_PixelBuffer *)v20 initWithCVPixelBuffer:texture[0]];
        CVPixelBufferRelease(texture[0]);
      }

      objc_super v12 = (CRImage_PixelBuffer *)v16;
    }
    else
    {
      objc_super v12 = objc_alloc_init(CRImage);
      [(CRImage *)v12 setColorSpace:[(CRImage *)self colorSpace]];
      unint64_t v17 = objc_opt_class();
      uint64_t v18 = [(CRImage *)self colorSpace];
      if (v17)
      {
        [v17 allocateVImageBufferWithWidth:(unint64_t)width height:(unint64_t)height colorSpace:v18];
      }
      else
      {
        long long v28 = 0u;
        long long v29 = 0u;
      }
      v27[0] = v28;
      v27[1] = v29;
      [(CRImage *)v12 setVImage:v27];
      [(CRImage *)v12 setVImageDataIsCopy:1];
      if ([(CRImage *)self colorSpace]) {
        uint64_t v21 = 4;
      }
      else {
        uint64_t v21 = 1;
      }
      unint64_t v22 = [(CRImage_PixelBuffer *)self pixelBuffer];
      if (v12)
      {
        [(CRImage_PixelBuffer *)v12 vImage];
        CFAllocatorRef v23 = (char *)texture[0];
      }
      else
      {
        CFAllocatorRef v23 = 0;
        *(_OWORD *)texture = 0u;
        long long v26 = 0u;
      }
      CRCopyRectangleCropMemoryFromPixelBuffer(v22, v23, v21, x, y, width, height);
    }
  }
  else
  {
    objc_super v12 = self;
  }
  return v12;
}

- (id)imageByRotating90CW
{
  return [(CRImage_PixelBuffer *)self imageByCorrectingFromOrientation:8];
}

- (id)imageByCorrectingFromOrientation:(unsigned int)a3
{
  if (a3 - 1 <= 1)
  {
    BOOL v4 = self;
    goto LABEL_14;
  }
  size_t v6 = [(CRImage_PixelBuffer *)self width];
  size_t v7 = [(CRImage_PixelBuffer *)self height];
  uint64_t v8 = 0;
  if (a3 <= 8)
  {
    if (((1 << a3) & 0x18) != 0)
    {
      uint64_t v8 = (const void *)*MEMORY[0x1E4F45350];
    }
    else
    {
      if (((1 << a3) & 0xC0) != 0)
      {
        BOOL v9 = (const void **)MEMORY[0x1E4F45360];
      }
      else
      {
        if (((1 << a3) & 0x120) == 0) {
          goto LABEL_11;
        }
        BOOL v9 = (const void **)MEMORY[0x1E4F45358];
      }
      uint64_t v8 = *v9;
      size_t v6 = [(CRImage_PixelBuffer *)self height];
      size_t v7 = [(CRImage_PixelBuffer *)self width];
    }
  }
LABEL_11:
  CVPixelBufferRef destinationBuffer = 0;
  VTPixelRotationSessionRef pixelRotationSessionOut = 0;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  VTPixelRotationSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &pixelRotationSessionOut);
  VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E4F450C0], v8);
  VTSessionSetProperty(pixelRotationSessionOut, (CFStringRef)*MEMORY[0x1E4F45118], (CFTypeRef)*MEMORY[0x1E4F1CFC8]);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType([(CRImage_PixelBuffer *)self pixelBuffer]);
  CVReturn v12 = CVPixelBufferCreate(v10, v6, v7, PixelFormatType, MEMORY[0x1E4F1CC08], &destinationBuffer);
  v13 = pixelRotationSessionOut;
  if (v12)
  {
    CFRelease(pixelRotationSessionOut);
    BOOL v4 = 0;
  }
  else
  {
    CFDictionaryRef v14 = [(CRImage_PixelBuffer *)self pixelBuffer];
    VTPixelRotationSessionRotateImage(v13, v14, destinationBuffer);
    VTPixelRotationSessionInvalidate(pixelRotationSessionOut);
    CFRelease(pixelRotationSessionOut);
    CFDictionaryRef v15 = [CRImage_PixelBuffer alloc];
    BOOL v4 = [(CRImage_PixelBuffer *)v15 initWithCVPixelBuffer:destinationBuffer];
    CVPixelBufferRelease(destinationBuffer);
  }
LABEL_14:
  return v4;
}

- (vImage_Buffer)vImage
{
  BOOL v4 = [[CRImage alloc] initWithCVPixelBuffer:[(CRImage_PixelBuffer *)self pixelBuffer] toColorSpace:1];
  size_t v6 = v4;
  if (v4)
  {
    [(CRImage *)v4 vImage];
  }
  else
  {
    *(_OWORD *)&retstr->data = 0u;
    *(_OWORD *)&retstr->double width = 0u;
  }

  return result;
}

- (CGImage)cgImage
{
  v2 = [[CRImage alloc] initWithCVPixelBuffer:[(CRImage_PixelBuffer *)self pixelBuffer] toColorSpace:1];
  v3 = [(CRImage *)v2 cgImage];

  return v3;
}

- (id)imageByScalingToWidth:(unint64_t)a3 height:(unint64_t)a4
{
  size_t v6 = [[CRImage alloc] initWithCVPixelBuffer:[(CRImage_PixelBuffer *)self pixelBuffer] toColorSpace:1];
  size_t v7 = [(CRImage *)v6 imageByScalingToWidth:a3 height:a4];

  return v7;
}

- (id)imageByPaddingToRatioAndScalingToWidth:(unint64_t)a3 height:(unint64_t)a4 paddingMode:(unint64_t)a5
{
  return [(CRImage_PixelBuffer *)self imageByPaddingToRatioAndScalingToWidth:a3 height:a4 paddingMode:a5 alignCenter:0];
}

- (id)imageByPaddingToRatioAndScalingToWidth:(unint64_t)a3 height:(unint64_t)a4 paddingMode:(unint64_t)a5 alignCenter:(BOOL)a6
{
  BOOL v6 = a6;
  int v11 = [(CRImage *)self colorSpace];
  CVReturn v12 = [CRImage alloc];
  if (v11)
  {
    v13 = [(CRImage *)v12 initWithCVPixelBuffer:[(CRImage_PixelBuffer *)self pixelBuffer] toColorSpace:[(CRImage *)self colorSpace]];
    uint64_t v14 = [(CRImage *)v13 imageByPaddingToRatioAndScalingToWidth:a3 height:a4 paddingMode:a5 alignCenter:v6];
  }
  else
  {
    uint64_t v14 = [(CRImage *)v12 initWithWidth:a3 height:a4 colorSpace:0];
    unint64_t v15 = (unint64_t)(float)((float)([(CRImage_PixelBuffer *)self height] * a3) / (float)a4);
    if ([(CRImage_PixelBuffer *)self width] > v15) {
      unint64_t v15 = [(CRImage_PixelBuffer *)self width];
    }
    unint64_t v16 = (unint64_t)(float)((float)([(CRImage_PixelBuffer *)self width] * a4) / (float)a3);
    if ([(CRImage_PixelBuffer *)self height] > v16) {
      unint64_t v16 = [(CRImage_PixelBuffer *)self height];
    }
    if (v6) {
      unint64_t v17 = (v15 - [(CRImage_PixelBuffer *)self width]) >> 1;
    }
    else {
      unint64_t v17 = 0;
    }
    unint64_t v25 = [(CRImage_PixelBuffer *)self height];
    v13 = [[CRImage alloc] initWithWidth:v15 height:v16 colorSpace:0];
    CVPixelBufferLockBaseAddress([(CRImage_PixelBuffer *)self pixelBuffer], 1uLL);
    BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress([(CRImage_PixelBuffer *)self pixelBuffer]);
    size_t Width = CVPixelBufferGetWidth([(CRImage_PixelBuffer *)self pixelBuffer]);
    size_t Height = CVPixelBufferGetHeight([(CRImage_PixelBuffer *)self pixelBuffer]);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow([(CRImage_PixelBuffer *)self pixelBuffer]);
    CVPixelBufferGetPlaneCount([(CRImage_PixelBuffer *)self pixelBuffer]);
    int v22 = CRImagePaddingValueForMode(a5, BaseAddress, Width, Height, BytesPerRow);
    memset(v13->_vImage.data, v22, v13->_vImage.height * v13->_vImage.rowBytes);
    if (Height)
    {
      unint64_t v23 = (v16 - v25) >> 1;
      do
      {
        memcpy((char *)v13->_vImage.data + v13->_vImage.rowBytes * v23 + v17, BaseAddress, Width);
        BaseAddress += BytesPerRow;
        ++v23;
        --Height;
      }
      while (Height);
    }
    CVPixelBufferUnlockBaseAddress([(CRImage_PixelBuffer *)self pixelBuffer], 1uLL);
    vImageScale_Planar8(&v13->_vImage, (const vImage_Buffer *)(v14 + 16), 0, 0);
  }

  return (id)v14;
}

- (id)imageByRotating180
{
  return [(CRImage_PixelBuffer *)self imageByCorrectingFromOrientation:3];
}

- (id)imageByDilating
{
  v2 = [[CRImage alloc] initWithCVPixelBuffer:[(CRImage_PixelBuffer *)self pixelBuffer] toColorSpace:1];
  v3 = [(CRImage *)v2 imageByDilating];

  return v3;
}

- (id)imageByApplyingBinaryMask:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[CRImage alloc] initWithCVPixelBuffer:[(CRImage_PixelBuffer *)self pixelBuffer] toColorSpace:1];
  BOOL v6 = [(CRImage *)v5 imageByApplyingBinaryMask:v4];

  return v6;
}

- (void)writeToFile:(id)a3
{
  id v5 = a3;
  id v4 = [[CRImage alloc] initWithCVPixelBuffer:[(CRImage_PixelBuffer *)self pixelBuffer] toColorSpace:1];
  [(CRImage *)v4 writeToFile:v5];
}

- (id)imageByInvertingIntensity
{
  v2 = [[CRImage alloc] initWithCVPixelBuffer:[(CRImage_PixelBuffer *)self pixelBuffer] toColorSpace:1];
  v3 = [(CRImage *)v2 imageByInvertingIntensity];

  return v3;
}

- (id)imageByOverlayingRects:(CGRect *)a3 count:(int64_t)a4 lineWidth:(double)a5 red:(double)a6 green:(double)a7 blue:(double)a8 alpha:(double)a9
{
  unint64_t v16 = [[CRImage alloc] initWithCVPixelBuffer:[(CRImage_PixelBuffer *)self pixelBuffer] toColorSpace:1];
  unint64_t v17 = [(CRImage *)v16 imageByOverlayingRects:a3 count:a4 strings:0 lineWidth:a5 red:a6 green:a7 blue:a8 alpha:a9];

  return v17;
}

- (id)imageByOverlayingRects:(CGRect *)a3 count:(int64_t)a4
{
  return [(CRImage *)self imageByOverlayingRects:a3 count:a4 strings:0 lineWidth:3.0 red:1.0 green:0.0 blue:0.0 alpha:1.0];
}

+ (void)drawVerticalLineAtXOffset:(double)a3 image:(id)a4
{
}

- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType([(CRImage_PixelBuffer *)self pixelBuffer]);
  return -[CRImage_PixelBuffer pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:", 0, 1, PixelFormatType, a3, width, height);
}

- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5
{
  double height = a4.height;
  double width = a4.width;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType([(CRImage_PixelBuffer *)self pixelBuffer]);
  return -[CRImage_PixelBuffer pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:", a5, 1, PixelFormatType, a3, width, height);
}

- (CRImage_PixelBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6
{
  double height = a4.height;
  double width = a4.width;
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType([(CRImage_PixelBuffer *)self pixelBuffer]);
  return -[CRImage_PixelBuffer pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:format:", a5, 1, PixelFormatType, a3, width, height);
}

- (vImage_Buffer)createFloatBuffer
{
  return (vImage_Buffer *)[(CRImage_PixelBuffer *)self doesNotRecognizeSelector:a3];
}

- (void)dealloc
{
  pixelBuffer = self->super._pixelBuffer;
  if (pixelBuffer)
  {
    CVPixelBufferRelease(pixelBuffer);
    self->super._pixelBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRImage_PixelBuffer;
  [(CRImage *)&v4 dealloc];
}

- (__CVBuffer)_pixelBufferFromUrl:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = (void *)MEMORY[0x1E4F1E050];
  uint64_t v18 = *MEMORY[0x1E4F1E330];
  v19[0] = MEMORY[0x1E4F1CC38];
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  BOOL v6 = [v4 imageWithContentsOfURL:v3 options:v5];

  size_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1E018]) initWithOptions:0];
  [v6 extent];
  double v9 = v8;
  double v11 = v10;
  CVPixelBufferRef v15 = 0;
  uint64_t v16 = *MEMORY[0x1E4F24D20];
  uint64_t v17 = MEMORY[0x1E4F1CC08];
  CFDictionaryRef v12 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (unint64_t)v9, (unint64_t)v11, 0x34323066u, v12, &v15))
  {
    v13 = 0;
  }
  else
  {
    [v7 render:v6 toCVPixelBuffer:v15];
    v13 = v15;
  }

  return v13;
}

+ (__CVBuffer)_convertPixelBuffer:(__CVBuffer *)a3 toFormat:(unsigned int)a4 iosurfaceBacking:(BOOL)a5
{
  BOOL v5 = a5;
  VTPixelTransferSessionRef pixelTransferSessionOut = 0;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &pixelTransferSessionOut);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  CFDictionaryRef v11 = [MEMORY[0x1E4F1CA60] dictionary];
  CFDictionaryRef v12 = v11;
  if (v5) {
    [(__CFDictionary *)v11 setObject:MEMORY[0x1E4F1CC08] forKey:*MEMORY[0x1E4F24D20]];
  }
  CVPixelBufferRef v15 = 0;
  CVPixelBufferCreate(v8, Width, Height, a4, v12, &v15);
  VTPixelTransferSessionTransferImage(pixelTransferSessionOut, a3, v15);
  VTPixelTransferSessionInvalidate(pixelTransferSessionOut);
  CFRelease(pixelTransferSessionOut);
  v13 = v15;

  return v13;
}

@end