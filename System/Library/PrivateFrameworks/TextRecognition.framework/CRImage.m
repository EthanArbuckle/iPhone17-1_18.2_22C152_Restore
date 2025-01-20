@interface CRImage
+ (BOOL)convertVImage:(const vImage_Buffer *)a3 inColorSpace:(int)a4 toVImage:(vImage_Buffer *)a5 toColorSpace:(int)a6;
+ (id)nameForColorSpace:(int)a3;
+ (unint64_t)bytesPerPixelForColorSpace:(int)a3;
+ (unint64_t)channelsForColorSpace:(int)a3;
+ (vImage_Buffer)allocateVImageBufferWithWidth:(SEL)a3 height:(unint64_t)a4 bytesPerPixel:(unint64_t)a5;
+ (vImage_Buffer)allocateVImageBufferWithWidth:(SEL)a3 height:(unint64_t)a4 colorSpace:(unint64_t)a5;
+ (vImage_Buffer)applyEXIFTransformsOnImage:(SEL)a3 inColorSpace:(const vImage_Buffer *)a4 properties:(int)a5;
+ (void)cgOrientation:(unsigned int)a3 toVImageRotationMode:(char *)a4 andReflection:(int *)a5;
+ (void)drawVerticalLineAtXOffset:(double)a3 image:(id)a4;
- (BOOL)hasBackingPixelBuffer;
- (BOOL)isFullRange;
- (BOOL)vImageDataIsCopy;
- (CGImage)cgImage;
- (CGRect)rotatedRoiByCroppingRectangle:(CGRect)a3 textFeaturePoints:(id)a4 radians:(float)a5;
- (CGSize)size;
- (CIImage)ciImage;
- (CRImage)init;
- (CRImage)initWithCGImage:(CGImage *)a3 properties:(id)a4 toColorSpace:(int)a5;
- (CRImage)initWithCGImage:(CGImage *)a3 toColorSpace:(int)a4;
- (CRImage)initWithCIImage:(id)a3 toColorSpace:(int)a4;
- (CRImage)initWithCVPixelBuffer:(__CVBuffer *)a3 toColorSpace:(int)a4;
- (CRImage)initWithCVPixelBuffer:(__CVBuffer *)a3 toColorSpace:(int)a4 forceDataCopy:(BOOL)a5;
- (CRImage)initWithContentsOfURL:(id)a3 toColorSpace:(int)a4;
- (CRImage)initWithFloatBuffer:(float *)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (CRImage)initWithMTLTexture:(id)a3 toColorSpace:(int)a4;
- (CRImage)initWithMat:(const Mat *)a3;
- (CRImage)initWithVImageBuffer:(vImage_Buffer *)a3 inColorSpace:(int)a4;
- (CRImage)initWithVImageBuffer:(vImage_Buffer *)a3 inColorSpace:(int)a4 toColorSpace:(int)a5;
- (CRImage)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 colorSpace:(int)a5;
- (NSNumber)sceneStabilityMetric;
- (NSURL)url;
- (__CVBuffer)pixelBuffer;
- (__CVBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4;
- (__CVBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5;
- (__CVBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6;
- (id)description;
- (id)imageByAdjustingBrightnessAlpha:(double)a3 beta:(double)a4;
- (id)imageByApplyingBinaryMask:(id)a3;
- (id)imageByApplyingHistogramCorrection;
- (id)imageByConvertingToColorSpace:(int)a3;
- (id)imageByCorrectingFromOrientation:(unsigned int)a3;
- (id)imageByCroppingRectangle:(CGRect)a3;
- (id)imageByCroppingRectangle:(CGRect)a3 textFeaturePoints:(id)a4 radians:(float)a5 rotatedRoi:(CGRect *)a6;
- (id)imageByCroppingRectangle:(CGRect)a3 toHeight:(unint64_t)a4 andWidth:(unint64_t)a5 withRotationAngle:(float)a6;
- (id)imageByDilating;
- (id)imageByInvertingIntensity;
- (id)imageByOverlayingRects:(CGRect *)a3 count:(int64_t)a4;
- (id)imageByOverlayingRects:(CGRect *)a3 count:(int64_t)a4 strings:(id)a5 lineWidth:(double)a6 red:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10;
- (id)imageByOverlayingRegions:(id)a3 strings:(id)a4 lineWidth:(double)a5 red:(double)a6 green:(double)a7 blue:(double)a8 alpha:(double)a9;
- (id)imageByPaddingToRatioAndScalingToWidth:(unint64_t)a3 height:(unint64_t)a4 paddingMode:(unint64_t)a5;
- (id)imageByPaddingToRatioAndScalingToWidth:(unint64_t)a3 height:(unint64_t)a4 paddingMode:(unint64_t)a5 alignCenter:(BOOL)a6;
- (id)imageByRectifyingRegion:(id)a3 toColorSpace:(int)a4 homography:(id *)a5;
- (id)imageByRotating180;
- (id)imageByRotating90CW;
- (id)imageByScaling:(double)a3 paddingToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6;
- (id)imageByScalingToWidth:(unint64_t)a3 height:(unint64_t)a4;
- (id)initARGB8888WithCVPixelBuffer:(__CVBuffer *)a3;
- (id)initAYUV8888WithCVPixelBuffer:(__CVBuffer *)a3;
- (id)initY8WithCVPixelBuffer:(__CVBuffer *)a3 forceDataCopy:(BOOL)a4;
- (id)initYUV888WithCVPixelBuffer:(__CVBuffer *)a3;
- (int)colorSpace;
- (unint64_t)bufferHash;
- (unint64_t)bytesPerPixel;
- (unint64_t)height;
- (unint64_t)numChannels;
- (unint64_t)width;
- (vImage_Buffer)createFloatBuffer;
- (vImage_Buffer)vImage;
- (void)dealloc;
- (void)runBlockWithARGB8888Image:(id)a3 blockOwnsMemory:(BOOL)a4;
- (void)setCgImage:(CGImage *)a3;
- (void)setCiImage:(id)a3;
- (void)setColorSpace:(int)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
- (void)setSceneStabilityMetric:(id)a3;
- (void)setUrl:(id)a3;
- (void)setVImage:(vImage_Buffer *)a3;
- (void)setVImageDataIsCopy:(BOOL)a3;
- (void)writeToFile:(id)a3;
- (void)writeToURL:(id)a3;
@end

@implementation CRImage

- (unint64_t)width
{
  return self->_vImage.width;
}

- (unint64_t)height
{
  return self->_vImage.height;
}

- (CGSize)size
{
  double v3 = (double)[(CRImage *)self width];
  double v4 = (double)[(CRImage *)self height];
  double v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (unint64_t)bufferHash
{
  v2 = [(CRImage *)self pixelBuffer];
  CVPixelBufferLockBaseAddress(v2, 0);
  if (CVPixelBufferIsPlanar(v2))
  {
    size_t PlaneCount = CVPixelBufferGetPlaneCount(v2);
    unint64_t v3 = 0;
    if (PlaneCount)
    {
      for (size_t i = 0; i != PlaneCount; ++i)
      {
        size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(v2, i);
        size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(v2, i);
        size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v2, i);
        BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v2, i);
        v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:BaseAddressOfPlane length:BytesPerRowOfPlane];
        v3 ^= [v9 hash];
        if (HeightOfPlane)
        {
          for (unint64_t j = 0; j != HeightOfPlane; ++j)
          {
            if (WidthOfPlane)
            {
              uint64_t v11 = 0;
              v12 = &BaseAddressOfPlane[j * BytesPerRowOfPlane];
              while (1)
              {
                v12 += BytesPerRowOfPlane / WidthOfPlane;
                if (*v12)
                {
                  if (*v12 != 255) {
                    break;
                  }
                }
                if (WidthOfPlane == ++v11) {
                  goto LABEL_13;
                }
              }
              v3 ^= v11 << (j % 0x18);
            }
LABEL_13:
            ;
          }
        }
      }
    }
  }
  else
  {
    BaseAddress = CVPixelBufferGetBaseAddress(v2);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v2);
    size_t Width = CVPixelBufferGetWidth(v2);
    size_t Height = CVPixelBufferGetHeight(v2);
    unint64_t v3 = Height ^ Width;
    if (Height)
    {
      for (unint64_t k = 0; k != Height; ++k)
      {
        if (Width)
        {
          unint64_t v18 = 0;
          while ((BaseAddress[k * BytesPerRow
                                              + v18 * (BytesPerRow / Width)
                                              + v18 % (BytesPerRow / Width)]
                                  + 1) < 2u)
          {
            if (Width == ++v18) {
              goto LABEL_24;
            }
          }
          v3 ^= v18 << (k % 0x18);
        }
LABEL_24:
        ;
      }
    }
  }
  CVPixelBufferUnlockBaseAddress(v2, 0);
  return v3;
}

+ (vImage_Buffer)allocateVImageBufferWithWidth:(SEL)a3 height:(unint64_t)a4 bytesPerPixel:(unint64_t)a5
{
  retstr->height = a5;
  retstr->width = a4;
  size_t v7 = a6 * a4;
  retstr->rowBytes = v7;
  CGSize result = (vImage_Buffer *)malloc_type_calloc(v7 * a5, 1uLL, 0xC10F0FFEuLL);
  retstr->data = result;
  return result;
}

+ (vImage_Buffer)allocateVImageBufferWithWidth:(SEL)a3 height:(unint64_t)a4 colorSpace:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a6;
  v10 = objc_opt_class();
  CGSize result = (vImage_Buffer *)[(id)objc_opt_class() bytesPerPixelForColorSpace:v6];
  if (v10)
  {
    return (vImage_Buffer *)[v10 allocateVImageBufferWithWidth:a4 height:a5 bytesPerPixel:result];
  }
  else
  {
    *(_OWORD *)&retstr->data = 0u;
    *(_OWORD *)&retstr->width = 0u;
  }
  return result;
}

- (CRImage)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRImage;
  v2 = [(CRImage *)&v5 init];
  v2->_colorSpace = -1;
  sceneStabilityMetric = v2->_sceneStabilityMetric;
  v2->_sceneStabilityMetric = 0;

  return v2;
}

- (id)initY8WithCVPixelBuffer:(__CVBuffer *)a3 forceDataCopy:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(CRImage *)self init];
  v6->_pixelBuffer = CVPixelBufferRetain(a3);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  OSType v8 = PixelFormatType;
  if (PixelFormatType == 846624121 || PixelFormatType == 875704422 || PixelFormatType == 1278226488)
  {
    v6->_isFullRange = PixelFormatType == 875704422;
    CVPixelBufferLockBaseAddress(v6->_pixelBuffer, 0);
    if (v8 == 846624121)
    {
      v9 = objc_opt_class();
      size_t Width = CVPixelBufferGetWidth(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      if (v9)
      {
        [v9 allocateVImageBufferWithWidth:Width height:Height colorSpace:0];
      }
      else
      {
        long long v50 = 0u;
        long long v51 = 0u;
      }
      long long v20 = v51;
      *(_OWORD *)&v6->_vImage.data = v50;
      *(_OWORD *)&v6->_vImage.width = v20;
      vImagePixelCount v22 = v6->_vImage.height;
      vImagePixelCount v21 = v6->_vImage.width;
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      size_t rowBytes = v6->_vImage.rowBytes;
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      if (v22)
      {
        uint64_t v26 = 0;
        data = v6->_vImage.data;
        v28 = BaseAddress + 1;
        do
        {
          for (vImagePixelCount i = v21; i; --i)
          {
            char v30 = *v28;
            v28 += 2;
            *data++ = v30;
          }
          v28 += BytesPerRow - 2 * v21;
          data += rowBytes - v21;
          ++v26;
        }
        while (v26 != v22);
      }
    }
    else
    {
      if (v4 && v8 == 1278226488)
      {
        v12 = objc_opt_class();
        size_t v13 = CVPixelBufferGetWidth(a3);
        size_t v14 = CVPixelBufferGetHeight(a3);
        if (v12)
        {
          [v12 allocateVImageBufferWithWidth:v13 height:v14 colorSpace:0];
        }
        else
        {
          long long v50 = 0u;
          long long v51 = 0u;
        }
        long long v33 = v51;
        *(_OWORD *)&v6->_vImage.data = v50;
        *(_OWORD *)&v6->_vImage.width = v33;
        v34 = CVPixelBufferGetBaseAddress(a3);
        size_t v35 = CVPixelBufferGetHeight(a3);
        CVPixelBufferGetWidth(a3);
        size_t v36 = CVPixelBufferGetBytesPerRow(a3);
        memcpy(v6->_vImage.data, v34, v36 * v35);
        CVPixelBufferUnlockBaseAddress(v6->_pixelBuffer, 0);
        CVPixelBufferRelease(v6->_pixelBuffer);
        goto LABEL_40;
      }
      if (!v4)
      {
        v6->_vImage.width = CVPixelBufferGetWidthOfPlane(a3, 0);
        v6->_vImage.height = CVPixelBufferGetHeightOfPlane(a3, 0);
        v6->_vImage.size_t rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
        char v32 = 0;
        v6->_vImage.data = BaseAddressOfPlane;
LABEL_41:
        v6->_vImageDataIsCopy = v32;
        v16 = v6;
        goto LABEL_42;
      }
      size_t v17 = CVPixelBufferGetWidth(a3);
      size_t v18 = CVPixelBufferGetHeight(a3);
      v19 = objc_opt_class();
      if (v19)
      {
        [v19 allocateVImageBufferWithWidth:v17 & 0xFFFFFFFFFFFFFFFELL height:v18 & 0xFFFFFFFFFFFFFFFELL colorSpace:0];
      }
      else
      {
        long long v50 = 0u;
        long long v51 = 0u;
      }
      long long v37 = v51;
      *(_OWORD *)&v6->_vImage.data = v50;
      *(_OWORD *)&v6->_vImage.width = v37;
      v38 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      v39 = v6->_vImage.data;
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      if (v18 >= 2)
      {
        uint64_t v41 = 0;
        uint64_t v42 = v17 >> 1;
        if (v17 >> 1 <= 1) {
          uint64_t v42 = 1;
        }
        v43 = &v38[BytesPerRowOfPlane];
        do
        {
          if (v17 >= 2)
          {
            v44 = &v38[2 * v41 * BytesPerRowOfPlane];
            uint64_t v45 = v42;
            do
            {
              unsigned char *v39 = *v44;
              v39[1] = v44[1];
              v44 += 2;
              v39 += 2;
              --v45;
            }
            while (v45);
            uint64_t v46 = 0;
            uint64_t v47 = v42;
            do
            {
              v48 = &v39[v46];
              unsigned char *v48 = v43[v46];
              v48[1] = v43[v46 + 1];
              v46 += 2;
              --v47;
            }
            while (v47);
            v39 += v46;
          }
          ++v41;
          v43 += 2 * BytesPerRowOfPlane;
        }
        while (v41 != v18 >> 1);
      }
    }
    CVPixelBufferUnlockBaseAddress(v6->_pixelBuffer, 0);
    CVPixelBufferRelease(v6->_pixelBuffer);
LABEL_40:
    v6->_pixelBuffer = 0;
    char v32 = 1;
    goto LABEL_41;
  }
  CVPixelBufferRelease(v6->_pixelBuffer);
  v15 = CROSLogForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    LODWORD(v50) = 67109120;
    DWORD1(v50) = v8;
    _os_log_impl(&dword_1DD733000, v15, OS_LOG_TYPE_FAULT, "[CRImage initY8WithCVPixelBuffer:] Unsupported pixel buffer type %08x", (uint8_t *)&v50, 8u);
  }

  v16 = 0;
LABEL_42:

  return v16;
}

- (id)initARGB8888WithCVPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(CRImage *)self init];
  v4->_pixelBuffer = CVPixelBufferRetain(a3);
  OSType PixelFormatType = (CRLogger *)CVPixelBufferGetPixelFormatType(a3);
  int v6 = (int)PixelFormatType;
  if ((int)PixelFormatType <= 875704421)
  {
    if (PixelFormatType == 32) {
      goto LABEL_8;
    }
    int v7 = 846624121;
  }
  else
  {
    if (PixelFormatType == 875704422) {
      goto LABEL_8;
    }
    if (PixelFormatType == 1111970369)
    {
      CRLogger = CRLogger::getCRLogger(PixelFormatType);
      if (*CRLogger && (CRLogger[8] & 0x10) != 0) {
        goto LABEL_8;
      }
      goto LABEL_35;
    }
    int v7 = 1278226488;
  }
  if (PixelFormatType == v7)
  {
LABEL_8:
    v4->_isFullRange = 1;
    CVPixelBufferLockBaseAddress(v4->_pixelBuffer, 0);
    OSType v8 = objc_opt_class();
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    if (v8) {
      [v8 allocateVImageBufferWithWidth:Width height:Height colorSpace:1];
    }
    else {
      memset(&outInfo, 0, 32);
    }
    long long v11 = *(_OWORD *)&outInfo.opaque[16];
    *(_OWORD *)&v4->_vImage.data = *(_OWORD *)outInfo.opaque;
    *(_OWORD *)&v4->_vImage.width = v11;
    v4->_vImageDataIsCopy = 1;
    switch(v6)
    {
      case 1278226488:
        *(void *)outInfo.opaque = CVPixelBufferGetBaseAddress(a3);
        *(void *)&outInfo.opaque[8] = CVPixelBufferGetHeight(a3);
        *(void *)&outInfo.opaque[16] = CVPixelBufferGetWidth(a3);
        *(void *)&outInfo.opaque[24] = CVPixelBufferGetBytesPerRow(a3);
        vImage_Error v13 = vImageConvert_Planar8ToXRGB8888(0xFFu, (const vImage_Buffer *)&outInfo, (const vImage_Buffer *)&outInfo, (const vImage_Buffer *)&outInfo, &v4->_vImage, 0);
        BOOL v14 = v13 != 0;
        if (v13)
        {
          v15 = CROSLogForCategory(0);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            LOWORD(src.data) = 0;
            _os_log_impl(&dword_1DD733000, v15, OS_LOG_TYPE_FAULT, "[CRImage initARGB8888WithCVPixelBuffer:] Unable to initialize ARGB8888 CRImage with Yp8 pixel buffer", (uint8_t *)&src, 2u);
          }
        }
        goto LABEL_31;
      case 875704422:
        src.data = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
        src.height = CVPixelBufferGetHeightOfPlane(a3, 0);
        src.width = CVPixelBufferGetWidthOfPlane(a3, 0);
        src.size_t rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
        buf.data = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
        buf.height = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
        buf.width = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
        buf.size_t rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
        if (vImageConvert_YpCbCrToARGB_GenerateConversion((const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x1E4F167D8], &fullYpCbCrPixelRange, &outInfo, kvImage420Yp8_CbCr8, kvImageARGB8888, 0)|| vImageConvert_420Yp8_CbCr8ToARGB8888(&src, &buf, &v4->_vImage, &outInfo, 0, 0xFFu, 0))
        {
          v16 = CROSLogForCategory(0);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v24 = 0;
            _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_FAULT, "[CRImage initARGB8888WithCVPixelBuffer:] Unable to initialize ARGB8888 CRImage with 420YpCbCr8BiPlanarFullRange pixel buffer", v24, 2u);
          }

          goto LABEL_28;
        }
        break;
      case 846624121:
        src.data = CVPixelBufferGetBaseAddress(a3);
        src.height = CVPixelBufferGetHeight(a3);
        src.width = CVPixelBufferGetWidth(a3);
        src.size_t rowBytes = CVPixelBufferGetBytesPerRow(a3);
        if (vImageConvert_YpCbCrToARGB_GenerateConversion((const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x1E4F167D8], &videoYpCbCrPixelRange, &outInfo, kvImage422CbYpCrYp8, kvImageARGB8888, 0)|| vImageConvert_422CbYpCrYp8ToARGB8888(&src, &v4->_vImage, &outInfo, 0, 0xFFu, 0))
        {
          v12 = CROSLogForCategory(0);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            LOWORD(buf.data) = 0;
            _os_log_impl(&dword_1DD733000, v12, OS_LOG_TYPE_FAULT, "[CRImage initARGB8888WithCVPixelBuffer:] Unable to initialize ARGB8888 CRImage with 422CbYpCrYp8 pixel buffer", (uint8_t *)&buf, 2u);
          }

LABEL_28:
          BOOL v14 = 1;
          goto LABEL_31;
        }
        break;
      default:
        BaseAddress = CVPixelBufferGetBaseAddress(a3);
        size_t v18 = CVPixelBufferGetHeight(a3);
        CVPixelBufferGetWidth(a3);
        size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
        memcpy(v4->_vImage.data, BaseAddress, BytesPerRow * v18);
        break;
    }
    BOOL v14 = 0;
LABEL_31:
    CVPixelBufferUnlockBaseAddress(v4->_pixelBuffer, 0);
    CVPixelBufferRelease(v4->_pixelBuffer);
    long long v20 = 0;
    v4->_pixelBuffer = 0;
    if (!v14) {
      long long v20 = v4;
    }
    goto LABEL_38;
  }
LABEL_35:
  CVPixelBufferRelease(v4->_pixelBuffer);
  vImagePixelCount v22 = CROSLogForCategory(0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)outInfo.opaque = 67109120;
    *(_DWORD *)&outInfo.opaque[4] = v6;
    _os_log_impl(&dword_1DD733000, v22, OS_LOG_TYPE_FAULT, "[CRImage initARGB8888WithCVPixelBuffer:] Unsupported pixel buffer type %08x", outInfo.opaque, 8u);
  }

  long long v20 = 0;
LABEL_38:

  return v20;
}

- (id)initYUV888WithCVPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(CRImage *)self init];
  v4->_pixelBuffer = CVPixelBufferRetain(a3);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  OSType v6 = PixelFormatType;
  if (PixelFormatType == 846624121 || PixelFormatType == 875704422)
  {
    v4->_isFullRange = PixelFormatType == 875704422;
    CVPixelBufferLockBaseAddress(v4->_pixelBuffer, 0);
    int v7 = objc_opt_class();
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    if (v7)
    {
      [v7 allocateVImageBufferWithWidth:Width height:Height colorSpace:4];
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
    }
    long long v12 = v42;
    *(_OWORD *)&v4->_vImage.data = v41;
    *(_OWORD *)&v4->_vImage.width = v12;
    v4->_vImageDataIsCopy = 1;
    if (v6 == 846624121)
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      vImagePixelCount v15 = v4->_vImage.height;
      if (v15)
      {
        vImagePixelCount v16 = 0;
        data = v4->_vImage.data;
        unint64_t v18 = v4->_vImage.width;
        do
        {
          if (v18 >= 2)
          {
            unint64_t v19 = 0;
            do
            {
              int v20 = *(_DWORD *)&BaseAddress[4 * v19];
              unsigned char *data = BYTE1(v20);
              data[1] = v20;
              data[2] = BYTE2(v20);
              data[3] = HIBYTE(v20);
              data[4] = v20;
              data[5] = BYTE2(v20);
              ++v19;
              data += 6;
              unint64_t v18 = v4->_vImage.width;
            }
            while (v19 < v18 >> 1);
            vImagePixelCount v15 = v4->_vImage.height;
          }
          ++v16;
          BaseAddress += BytesPerRow;
        }
        while (v16 < v15);
      }
    }
    else
    {
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      vImagePixelCount v22 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      size_t v24 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
      if (v4->_vImage.height >= 2)
      {
        vImagePixelCount v25 = 0;
        uint64_t v26 = v4->_vImage.data;
        unint64_t v27 = v4->_vImage.width;
        do
        {
          if (v27 >= 2)
          {
            unint64_t v28 = 0;
            v29 = &v22[v25 * v24];
            char v30 = &BaseAddressOfPlane[2 * v25 * BytesPerRowOfPlane];
            v31 = v29;
            do
            {
              char v32 = v30[1];
              char v33 = *v31;
              char v34 = v31[1];
              *uint64_t v26 = *v30;
              v26[1] = v33;
              v26[2] = v34;
              v26[3] = v32;
              v26[4] = v33;
              v26[5] = v34;
              ++v28;
              v30 += 2;
              v31 += 2;
              v26 += 6;
              unint64_t v27 = v4->_vImage.width;
            }
            while (v28 < v27 >> 1);
            if (v27 >= 2)
            {
              unint64_t v35 = 0;
              size_t v36 = &BaseAddressOfPlane[((2 * v25) | 1) * BytesPerRowOfPlane];
              do
              {
                char v37 = v36[1];
                char v38 = *v29;
                char v39 = v29[1];
                *uint64_t v26 = *v36;
                v26[1] = v38;
                v26[2] = v39;
                v26[3] = v37;
                v26[4] = v38;
                v26[5] = v39;
                ++v35;
                v36 += 2;
                v29 += 2;
                v26 += 6;
                unint64_t v27 = v4->_vImage.width;
              }
              while (v35 < v27 >> 1);
            }
          }
          ++v25;
        }
        while (v25 < v4->_vImage.height >> 1);
      }
    }
    long long v11 = v4;
    CVPixelBufferUnlockBaseAddress(v4->_pixelBuffer, 0);
  }
  else
  {
    v10 = CROSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v41) = 67109120;
      DWORD1(v41) = v6;
      _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_FAULT, "[CRImage initYUV888WithCVPixelBuffer:] Unsupported pixel buffer type %08x", (uint8_t *)&v41, 8u);
    }

    long long v11 = 0;
  }
  CVPixelBufferRelease(v4->_pixelBuffer);
  v4->_pixelBuffer = 0;

  return v11;
}

- (id)initAYUV8888WithCVPixelBuffer:(__CVBuffer *)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(CRImage *)self init];
  v4->_pixelBuffer = CVPixelBufferRetain(a3);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  OSType v6 = PixelFormatType;
  if (PixelFormatType == 846624121 || PixelFormatType == 875704422)
  {
    v4->_isFullRange = PixelFormatType == 875704422;
    CVPixelBufferLockBaseAddress(v4->_pixelBuffer, 0);
    int v7 = objc_opt_class();
    size_t Width = CVPixelBufferGetWidth(a3);
    size_t Height = CVPixelBufferGetHeight(a3);
    if (v7)
    {
      [v7 allocateVImageBufferWithWidth:Width height:Height colorSpace:3];
    }
    else
    {
      long long v47 = 0u;
      long long v48 = 0u;
    }
    long long v12 = v48;
    *(_OWORD *)&v4->_vImage.data = v47;
    *(_OWORD *)&v4->_vImage.width = v12;
    v4->_vImageDataIsCopy = 1;
    if (v6 == 846624121)
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      vImagePixelCount v15 = v4->_vImage.height;
      if (v15)
      {
        uint64_t v16 = 0;
        data = v4->_vImage.data;
        unint64_t v18 = v4->_vImage.width;
        uint64_t v19 = v18 >> 1;
        if (v18 >> 1 <= 1) {
          uint64_t v19 = 1;
        }
        do
        {
          if (v18 >= 2)
          {
            int v20 = &BaseAddress[v16 * BytesPerRow];
            uint64_t v21 = v19;
            do
            {
              int v22 = *(_DWORD *)v20;
              v20 += 4;
              HIDWORD(v23) = v22;
              LODWORD(v23) = v22;
              _DWORD *data = v22 & 0xFF00 | (v22 << 16) & 0xFFFFFF | (BYTE2(v22) << 24) | 0xFF;
              data[1] = (v23 >> 16) & 0xFFFF00 | (BYTE2(v22) << 24) | 0xFF;
              data += 2;
              --v21;
            }
            while (v21);
          }
          ++v16;
        }
        while (v16 != v15);
      }
    }
    else
    {
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      vImagePixelCount v25 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      size_t v27 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
      unint64_t v28 = v4->_vImage.height;
      if (v28 >= 2)
      {
        uint64_t v29 = 0;
        unint64_t v30 = v28 >> 1;
        v31 = v4->_vImage.data;
        unint64_t v32 = v4->_vImage.width;
        uint64_t v33 = v32 >> 1;
        if (v32 >> 1 <= 1) {
          uint64_t v33 = 1;
        }
        do
        {
          if (v32 >= 2)
          {
            char v34 = &v25[v29 * v27];
            unint64_t v35 = &BaseAddressOfPlane[2 * v29 * BytesPerRowOfPlane];
            uint64_t v36 = v33;
            char v37 = v34;
            do
            {
              int v38 = *v37 << 16;
              int v39 = v37[1];
              int v40 = (v38 | (v35[1] << 8)) & 0xFFFFFF | (v39 << 24) | 0xFF;
              _DWORD *v31 = v38 | (*v35 << 8) | (v39 << 24) | 0xFF;
              v31[1] = v40;
              v31 += 2;
              v35 += 2;
              v37 += 2;
              --v36;
            }
            while (v36);
            long long v41 = &BaseAddressOfPlane[((2 * v29) | 1) * BytesPerRowOfPlane];
            uint64_t v42 = v33;
            do
            {
              int v43 = *v34 << 16;
              int v44 = v34[1];
              int v45 = (v43 | (v41[1] << 8)) & 0xFFFFFF | (v44 << 24) | 0xFF;
              _DWORD *v31 = v43 | (*v41 << 8) | (v44 << 24) | 0xFF;
              v31[1] = v45;
              v31 += 2;
              v41 += 2;
              v34 += 2;
              --v42;
            }
            while (v42);
          }
          ++v29;
        }
        while (v29 != v30);
      }
    }
    long long v11 = v4;
    CVPixelBufferUnlockBaseAddress(v4->_pixelBuffer, 0);
  }
  else
  {
    v10 = CROSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v47) = 67109120;
      DWORD1(v47) = v6;
      _os_log_impl(&dword_1DD733000, v10, OS_LOG_TYPE_FAULT, "[CRImage initAYUV8888WithCVPixelBuffer:] Unsupported pixel buffer type %08x", (uint8_t *)&v47, 8u);
    }

    long long v11 = 0;
  }
  CVPixelBufferRelease(v4->_pixelBuffer);
  v4->_pixelBuffer = 0;

  return v11;
}

- (CRImage)initWithCVPixelBuffer:(__CVBuffer *)a3 toColorSpace:(int)a4
{
  return [(CRImage *)self initWithCVPixelBuffer:a3 toColorSpace:*(void *)&a4 forceDataCopy:0];
}

- (CRImage)initWithCVPixelBuffer:(__CVBuffer *)a3 toColorSpace:(int)a4 forceDataCopy:(BOOL)a5
{
  OSType v6 = 0;
  switch(a4)
  {
    case -1:
    case 2:
      goto LABEL_10;
    case 0:
      self = [(CRImage *)self initY8WithCVPixelBuffer:a3 forceDataCopy:a5];
      if (self) {
        goto LABEL_8;
      }
      goto LABEL_9;
    case 1:
      self = [(CRImage *)self initARGB8888WithCVPixelBuffer:a3];
      if (!self) {
        goto LABEL_9;
      }
      goto LABEL_8;
    case 3:
      self = [(CRImage *)self initAYUV8888WithCVPixelBuffer:a3];
      if (!self) {
        goto LABEL_9;
      }
      goto LABEL_8;
    case 4:
      self = [(CRImage *)self initYUV888WithCVPixelBuffer:a3];
      goto LABEL_7;
    default:
LABEL_7:
      if (self) {
LABEL_8:
      }
        self->_colorSpace = a4;
LABEL_9:
      self = self;
      OSType v6 = self;
LABEL_10:

      return v6;
  }
}

- (CRImage)initWithCIImage:(id)a3 toColorSpace:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    int v7 = [(CRImage *)self init];
    self = v7;
    if (v7)
    {
      [(CRImage *)v7 setCiImage:v6];
      [v6 extent];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      self->_colorSpace = v4;
      self->_isFullRange = 1;
      uint64_t v16 = objc_opt_class();
      if (v16) {
        [v16 allocateVImageBufferWithWidth:(unint64_t)v13 height:(unint64_t)v15 colorSpace:v4];
      }
      else {
        memset(&src, 0, sizeof(src));
      }
      long long v18 = *(_OWORD *)&src.width;
      *(_OWORD *)&self->_vImage.data = *(_OWORD *)&src.data;
      *(_OWORD *)&self->_vImage.width = v18;
      self->_vImageDataIsCopy = 1;
      if (v4)
      {
        p_vImage = &self->_vImage;
        if (v4 != 1)
        {
          int v20 = objc_opt_class();
          if (v20) {
            [v20 allocateVImageBufferWithWidth:self->_vImage.width height:self->_vImage.height colorSpace:1];
          }
          else {
            memset(&v38, 0, sizeof(v38));
          }
          vImage_Buffer src = v38;
          p_vImage = &src;
        }
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        unint64_t v30 = (void *)MEMORY[0x1E4F1E018];
        uint64_t v39 = *MEMORY[0x1E4F1E1E0];
        uint64_t v40 = MEMORY[0x1E4F1CC28];
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        unint64_t v32 = [v30 contextWithOptions:v31];
        objc_msgSend(v32, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v6, p_vImage->data, p_vImage->rowBytes, *MEMORY[0x1E4F1E278], DeviceRGB, v9, v11, v13, v15);

        CGColorSpaceRelease(DeviceRGB);
        if (v4 != 1)
        {
          [(id)objc_opt_class() convertVImage:p_vImage inColorSpace:1 toVImage:&self->_vImage toColorSpace:self->_colorSpace];
          free(p_vImage->data);
        }
        uint64_t v33 = self;
        goto LABEL_29;
      }
      DeviceGray = CGColorSpaceCreateDeviceGray();
      if ((CGColorSpace *)[v6 colorSpace] == DeviceGray)
      {
        vImagePixelCount v25 = (void *)MEMORY[0x1E4F1E018];
        uint64_t v26 = *MEMORY[0x1E4F1E1E0];
        v41[0] = *MEMORY[0x1E4F1E240];
        v41[1] = v26;
        v42[0] = DeviceGray;
        v42[1] = MEMORY[0x1E4F1CC28];
        size_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
        unint64_t v23 = [v25 contextWithOptions:v27];

        objc_msgSend(v23, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v6, self->_vImage.data, self->_vImage.rowBytes, *MEMORY[0x1E4F1E288], DeviceGray, v9, v11, v13, v15);
        BOOL v28 = 0;
      }
      else
      {
        if (qword_1EB58CED8 != -1) {
          dispatch_once(&qword_1EB58CED8, &__block_literal_global_42);
        }
        int v22 = objc_msgSend(MEMORY[0x1E4F1E040], "filterWithName:keysAndValues:", @"CIColorControls", *MEMORY[0x1E4F1E480], v6, *MEMORY[0x1E4F1E438], &unk_1F3933280, *MEMORY[0x1E4F1E4E8], &unk_1F3933280, *MEMORY[0x1E4F1E458], &unk_1F3933298, 0);
        unint64_t v23 = [v22 outputImage];

        memset(&src, 0, sizeof(src));
        size_t v24 = objc_opt_class();
        if (v24) {
          [v24 allocateVImageBufferWithWidth:self->_vImage.width height:self->_vImage.height colorSpace:1];
        }
        else {
          memset(&src, 0, sizeof(src));
        }
        char v34 = CGColorSpaceCreateDeviceRGB();
        objc_msgSend((id)_MergedGlobals_39, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v23, src.data, src.rowBytes, *MEMORY[0x1E4F1E278], v34, v9, v11, v13, v15);
        CGColorSpaceRelease(v34);
        BOOL v28 = vImageExtractChannel_ARGB8888(&src, &self->_vImage, 1, 0) != 0;
        free(src.data);
      }

      CGColorSpaceRelease(DeviceGray);
      uint64_t v33 = self;
      if (!v28) {
        goto LABEL_29;
      }
      unint64_t v35 = CROSLogForCategory(0);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = [(id)objc_opt_class() nameForColorSpace:0];
        LODWORD(src.data) = 138412290;
        *(void **)((char *)&src.data + 4) = v36;
        _os_log_impl(&dword_1DD733000, v35, OS_LOG_TYPE_ERROR, "[CRImage initWithCIImage:toColorSpace:] Unable to initialize from CIImage to color space %@", (uint8_t *)&src, 0xCu);
      }
    }
    uint64_t v33 = 0;
LABEL_29:
    size_t v17 = v33;
    goto LABEL_30;
  }
  size_t v17 = 0;
LABEL_30:

  return v17;
}

void __40__CRImage_initWithCIImage_toColorSpace___block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v4 = *MEMORY[0x1E4F1E1E0];
  v5[0] = MEMORY[0x1E4F1CC28];
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = [v0 contextWithOptions:v1];
  unint64_t v3 = (void *)_MergedGlobals_39;
  _MergedGlobals_39 = v2;
}

- (CRImage)initWithMTLTexture:(id)a3 toColorSpace:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    int v7 = [(CRImage *)self init];
    self = v7;
    if (v7)
    {
      if (v4 <= 1)
      {
        v7->_colorSpace = v4;
        v7->_isFullRange = 1;
        double v8 = objc_opt_class();
        uint64_t v9 = [v6 width];
        uint64_t v10 = [v6 height];
        if (v8)
        {
          [v8 allocateVImageBufferWithWidth:v9 height:v10 colorSpace:v4];
        }
        else
        {
          *(_OWORD *)vImage_Buffer buf = 0u;
          long long v23 = 0u;
        }
        long long v12 = v23;
        *(_OWORD *)&self->_vImage.data = *(_OWORD *)buf;
        *(_OWORD *)&self->_vImage.width = v12;
        self->_vImageDataIsCopy = 1;
        if ([v6 pixelFormat] == 10
          || [v6 pixelFormat] == 13
          || [v6 pixelFormat] == 70
          || [v6 pixelFormat] == 73)
        {
          uint64_t v13 = [v6 width];
          uint64_t v14 = [v6 height];
          data = self->_vImage.data;
          size_t rowBytes = self->_vImage.rowBytes;
          memset(v21, 0, 24);
          v21[3] = v13;
          v21[4] = v14;
          v21[5] = 1;
          [v6 getBytes:data bytesPerRow:rowBytes fromRegion:v21 mipmapLevel:0];
          size_t v17 = self;
LABEL_17:
          double v11 = v17;
          goto LABEL_18;
        }
      }
      long long v18 = CROSLogForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = [(id)objc_opt_class() nameForColorSpace:v4];
        *(_DWORD *)vImage_Buffer buf = 138412290;
        *(void *)&buf[4] = v19;
        _os_log_impl(&dword_1DD733000, v18, OS_LOG_TYPE_ERROR, "[CRImage initWithMTLTexture:toColorSpace:] Unable to initialize from MTLTexture to color space %@", buf, 0xCu);
      }
    }
    size_t v17 = 0;
    goto LABEL_17;
  }
  double v11 = 0;
LABEL_18:

  return v11;
}

- (void)runBlockWithARGB8888Image:(id)a3 blockOwnsMemory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(id, vImage_Buffer *, void))a3;
  p_vImage = &self->_vImage;
  if (self->_colorSpace == 1)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    if (v9)
    {
      [v9 allocateVImageBufferWithWidth:self->_vImage.width height:self->_vImage.height colorSpace:1];
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
    }
    v12[0] = v10;
    v12[1] = v11;
    if (![(id)objc_opt_class() convertVImage:&self->_vImage inColorSpace:self->_colorSpace toVImage:v12 toColorSpace:1])
    {
      p_vImage = (vImage_Buffer *)v12;
      goto LABEL_10;
    }
    BOOL v8 = self->_colorSpace != 1;
    p_vImage = (vImage_Buffer *)v12;
  }
  v6[2](v6, p_vImage, v8 & v4);
LABEL_10:
  if (self->_colorSpace != 1 && !v4) {
    free(p_vImage->data);
  }
}

- (CIImage)ciImage
{
  p_ciImage = &self->_ciImage;
  ciImage = self->_ciImage;
  if (!ciImage)
  {
    uint64_t v6 = 0;
    int v7 = &v6;
    uint64_t v8 = 0x3032000000;
    uint64_t v9 = __Block_byref_object_copy__24;
    long long v10 = __Block_byref_object_dispose__24;
    id v11 = 0;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __18__CRImage_ciImage__block_invoke;
    v5[3] = &unk_1E6CDC7E8;
    v5[4] = &v6;
    [(CRImage *)self runBlockWithARGB8888Image:v5 blockOwnsMemory:1];
    objc_storeStrong((id *)p_ciImage, (id)v7[5]);
    _Block_object_dispose(&v6, 8);

    ciImage = *p_ciImage;
  }
  return ciImage;
}

void __18__CRImage_ciImage__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  int v7 = (void *)MEMORY[0x1E4F1E050];
  uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*a2 length:a2[1] * a2[3] freeWhenDone:a3];
  uint64_t v9 = objc_msgSend(v7, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v8, a2[3], *MEMORY[0x1E4F1E278], DeviceRGB, (double)(unint64_t)a2[2], (double)(unint64_t)a2[1]);
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  CGColorSpaceRelease(DeviceRGB);
}

- (__CVBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4
{
  return -[CRImage pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:", 0, 2, a3, a4.width, a4.height);
}

- (__CVBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5
{
  return -[CRImage pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:", a5, 2, a3, a4.width, a4.height);
}

- (__CVBuffer)pixelBufferWithScale:(double)a3 paddedToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6
{
  double height = a4.height;
  double width = a4.width;
  unint64_t v12 = [(CRImage *)self width];
  unint64_t v13 = [(CRImage *)self height];
  unint64_t v14 = (unint64_t)width;
  unint64_t v15 = (unint64_t)height;
  CVPixelBufferRef pixelBufferOut = 0;
  CVReturn v16 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (unint64_t)width, (unint64_t)height, 0x20u, MEMORY[0x1E4F1CC08], &pixelBufferOut);
  CGSize result = 0;
  if (!v16)
  {
    double v18 = (double)v12 * a3;
    if ((unint64_t)v18 >= v14) {
      unint64_t v19 = (unint64_t)width;
    }
    else {
      unint64_t v19 = (unint64_t)v18;
    }
    if ((unint64_t)((double)v13 * a3) >= v15) {
      unint64_t v20 = (unint64_t)height;
    }
    else {
      unint64_t v20 = (unint64_t)((double)v13 * a3);
    }
    if (a5)
    {
      a5->double width = (double)v19;
      a5->double height = (double)v20;
    }
    CGFloat v21 = 0.0;
    if (a6 <= 3) {
      CGFloat v21 = dbl_1DD8CF238[a6];
    }
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
    vImagePixelCount v25 = CGBitmapContextCreate(BaseAddress, (unint64_t)width, (unint64_t)height, 8uLL, BytesPerRow, DeviceRGB, 6u);
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v28.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v28.c = v26;
    *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGContextConcatCTM(v25, &v28);
    CGContextSetGrayFillColor(v25, v21, 1.0);
    CGContextSetGrayStrokeColor(v25, v21, 1.0);
    v30.size.double width = (double)v14;
    v30.size.double height = (double)v15;
    v30.origin.x = 0.0;
    v30.origin.y = 0.0;
    CGContextFillRect(v25, v30);
    size_t v27 = [(CRImage *)self cgImage];
    v31.origin.y = (double)(v15 - v20);
    v31.size.double width = (double)v19;
    v31.size.double height = (double)v20;
    v31.origin.x = 0.0;
    CGContextDrawImage(v25, v31, v27);
    CGColorSpaceRelease(DeviceRGB);
    CGContextRelease(v25);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    return pixelBufferOut;
  }
  return result;
}

- (id)imageByScaling:(double)a3 paddingToSize:(CGSize)a4 adjustedToSize:(CGSize *)a5 paddingMode:(unint64_t)a6
{
  uint64_t v6 = -[CRImage pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:](self, "pixelBufferWithScale:paddedToSize:adjustedToSize:paddingMode:", a5, a6, a3, a4.width, a4.height);
  int v7 = [[CRImage_PixelBuffer alloc] initWithCVPixelBuffer:v6];
  CVPixelBufferRelease(v6);
  return v7;
}

- (__CVBuffer)pixelBuffer
{
  p_pixelBuffer = &self->_pixelBuffer;
  CGSize result = self->_pixelBuffer;
  if (!result)
  {
    objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F24CA8], 0);
    CFDictionaryRef v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    size_t v6 = [(CRImage *)self width];
    size_t v7 = [(CRImage *)self height];
    CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v6, v7, 0x20u, v5, p_pixelBuffer);
    CVPixelBufferLockBaseAddress(*p_pixelBuffer, 0);
    BaseAddress = CVPixelBufferGetBaseAddress(*p_pixelBuffer);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    size_t v10 = [(CRImage *)self width];
    size_t v11 = [(CRImage *)self height];
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(*p_pixelBuffer);
    unint64_t v13 = CGBitmapContextCreate(BaseAddress, v10, v11, 8uLL, BytesPerRow, DeviceRGB, 6u);
    unint64_t v14 = [(CRImage *)self cgImage];
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&transform.c = v15;
    *(_OWORD *)&transform.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGContextConcatCTM(v13, &transform);
    unint64_t v16 = [(CRImage *)self width];
    unint64_t v17 = [(CRImage *)self height];
    v19.size.double width = (double)v16;
    v19.size.double height = (double)v17;
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    CGContextDrawImage(v13, v19, v14);
    CGColorSpaceRelease(DeviceRGB);
    CGContextRelease(v13);
    CVPixelBufferUnlockBaseAddress(*p_pixelBuffer, 0);

    return *p_pixelBuffer;
  }
  return result;
}

- (BOOL)hasBackingPixelBuffer
{
  return self->_pixelBuffer != 0;
}

- (vImage_Buffer)createFloatBuffer
{
  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->double width = 0u;
  retstr->data = malloc_type_calloc([(CRImage *)self height] * [(CRImage *)self width], 4uLL, 0x100004052888210uLL);
  retstr->double height = [(CRImage *)self height];
  retstr->double width = [(CRImage *)self width];
  retstr->size_t rowBytes = 4 * [(CRImage *)self width];
  [(CRImage *)self vImage];
  return (vImage_Buffer *)vImageConvert_Planar8toPlanarF(&v6, retstr, 1.0, 0.0, 0);
}

- (CGImage)cgImage
{
  if (!self->_cgImage)
  {
    if (self->_colorSpace)
    {
      uint64_t v7 = 0;
      CGColorSpaceRef space = (CGColorSpaceRef)&v7;
      uint64_t v9 = 0x2020000000;
      uint64_t v10 = 0;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __18__CRImage_cgImage__block_invoke;
      v6[3] = &unk_1E6CDC7E8;
      v6[4] = &v7;
      [(CRImage *)self runBlockWithARGB8888Image:v6 blockOwnsMemory:0];
      self->_cgImage = (CGImage *)*((void *)space + 3);
      _Block_object_dispose(&v7, 8);
    }
    else
    {
      uint64_t v7 = 0x100000008;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      CGColorSpaceRef space = CGColorSpaceCreateDeviceGray();
      uint64_t v11 = 0;
      self->_cgImage = (CGImage *)MEMORY[0x1E01C0270](&self->_vImage, &v7, 0, 0, 0, 0);
      CGColorSpaceRelease(space);
    }
    if (!self->_cgImage) {
      return 0;
    }
  }
  CRLogger = CRLogger::getCRLogger((CRLogger *)self);
  if (*CRLogger)
  {
    BOOL v4 = CRLogger;
    CGSize result = self->_cgImage;
    if ((v4[8] & 0x10) == 0) {
      return result;
    }
    CFRetain(result);
  }
  return self->_cgImage;
}

void __18__CRImage_cgImage__block_invoke(uint64_t a1, void **a2, int a3)
{
  int v11 = 0;
  uint64_t v6 = 0x2000000008;
  CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
  int v8 = 4;
  uint64_t v10 = 0;
  uint64_t v9 = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = MEMORY[0x1E01C0270](a2, &v6, 0, 0, 0, 0);
  CGColorSpaceRelease(space);
  if (a3) {
    free(*a2);
  }
}

- (id)imageByApplyingHistogramCorrection
{
  v22[128] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [[CRImage alloc] initWithWidth:[(CRImage *)self width] height:[(CRImage *)self height] colorSpace:0];
  int v4 = [(CRImage *)self width];
  int v5 = [(CRImage *)self height];
  [(CRImage *)self vImage];
  uint64_t v6 = (unsigned __int8 *)v22[0];
  if (v3)
  {
    [(CRImage *)v3 vImage];
    uint64_t v7 = (unsigned char *)v22[0];
  }
  else
  {
    uint64_t v7 = 0;
  }
  int v8 = v5 * v4;
  bzero(v22, 0x400uLL);
  if (v8 >= 1)
  {
    uint64_t v9 = v8;
    uint64_t v10 = v6;
    do
    {
      unsigned int v11 = *v10++;
      ++*((_DWORD *)v22 + v11);
      --v9;
    }
    while (v9);
  }
  int v12 = 257;
  unint64_t v13 = (int *)v22;
  do
  {
    int v14 = *v13++;
    --v12;
  }
  while (!v14);
  uint64_t v15 = 1020;
  int v16 = v12;
  do
  {
    int v17 = *(_DWORD *)((char *)v22 + v15);
    --v16;
    v15 -= 4;
  }
  while (!v17);
  if (v8 >= 1)
  {
    float v18 = 255.0 / (float)v16;
    uint64_t v19 = v8;
    do
    {
      int v20 = *v6++;
      *v7++ = (int)(float)(v18 * (float)(v12 + v20 - 256));
      --v19;
    }
    while (v19);
  }
  return v3;
}

- (id)imageByAdjustingBrightnessAlpha:(double)a3 beta:(double)a4
{
  uint64_t v7 = [[CRImage alloc] initWithWidth:[(CRImage *)self width] height:[(CRImage *)self height] colorSpace:0];
  int v8 = [(CRImage *)self width];
  int v9 = [(CRImage *)self height];
  [(CRImage *)self vImage];
  uint64_t v10 = v15;
  if (v7)
  {
    [(CRImage *)v7 vImage];
    unsigned int v11 = v15;
  }
  else
  {
    unsigned int v11 = 0;
  }
  if (v9 * v8 >= 1)
  {
    uint64_t v12 = (v9 * v8);
    do
    {
      unsigned int v13 = *v10++;
      *v11++ = (int)fmin(a4 + (double)v13 * a3, 255.0);
      --v12;
    }
    while (v12);
  }
  return v7;
}

- (id)imageByRotating90CW
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  unint64_t v3 = [(CRImage *)self bytesPerPixel];
  int v4 = [[CRImage alloc] initWithWidth:[(CRImage *)self height] height:[(CRImage *)self width] colorSpace:self->_colorSpace];
  if (v3 == 1)
  {
    int v5 = vImageRotate90_Planar8(&self->_vImage, &v4->_vImage, 3u, 0, 0) == 0;
    *((unsigned char *)v19 + 24) = v5;
  }
  else
  {
    *(_OWORD *)int v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [(CRImage *)v4 width];
    uint64_t v8 = [(CRImage *)v4 height];
    if (v6)
    {
      [v6 allocateVImageBufferWithWidth:v7 height:v8 colorSpace:1];
    }
    else
    {
      *(_OWORD *)int v16 = 0u;
      long long v17 = 0u;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    long long v14 = *(_OWORD *)v16;
    long long v15 = v17;
    v13[2] = __30__CRImage_imageByRotating90CW__block_invoke;
    v13[3] = &unk_1E6CDC810;
    v13[4] = &v18;
    [(CRImage *)self runBlockWithARGB8888Image:v13 blockOwnsMemory:0];
    if (*((unsigned char *)v19 + 24))
    {
      char v9 = [(id)objc_opt_class() convertVImage:v16 inColorSpace:1 toVImage:&v4->_vImage toColorSpace:v4->_colorSpace];
      *((unsigned char *)v19 + 24) = v9;
    }
    free(v16[0]);
    int v5 = *((unsigned __int8 *)v19 + 24);
  }
  if (v5) {
    uint64_t v10 = v4;
  }
  else {
    uint64_t v10 = 0;
  }
  unsigned int v11 = v10;

  _Block_object_dispose(&v18, 8);
  return v11;
}

vImage_Error __30__CRImage_imageByRotating90CW__block_invoke(uint64_t a1, vImage_Buffer *src)
{
  vImage_Error result = vImageRotate90_ARGB8888(src, (const vImage_Buffer *)(a1 + 40), 3u, black_ARGB8888, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == 0;
  return result;
}

- (id)imageByRotating180
{
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  unint64_t v3 = [(CRImage *)self bytesPerPixel];
  int v4 = [[CRImage alloc] initWithWidth:[(CRImage *)self width] height:[(CRImage *)self height] colorSpace:self->_colorSpace];
  if (v3 == 1)
  {
    int v5 = vImageRotate90_Planar8(&self->_vImage, &v4->_vImage, 2u, 0, 0) == 0;
    *((unsigned char *)v19 + 24) = v5;
  }
  else
  {
    *(_OWORD *)int v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [(CRImage *)v4 width];
    uint64_t v8 = [(CRImage *)v4 height];
    if (v6)
    {
      [v6 allocateVImageBufferWithWidth:v7 height:v8 colorSpace:1];
    }
    else
    {
      *(_OWORD *)int v16 = 0u;
      long long v17 = 0u;
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    long long v14 = *(_OWORD *)v16;
    long long v15 = v17;
    v13[2] = __29__CRImage_imageByRotating180__block_invoke;
    v13[3] = &unk_1E6CDC810;
    v13[4] = &v18;
    [(CRImage *)self runBlockWithARGB8888Image:v13 blockOwnsMemory:0];
    if (*((unsigned char *)v19 + 24))
    {
      char v9 = [(id)objc_opt_class() convertVImage:v16 inColorSpace:1 toVImage:&v4->_vImage toColorSpace:v4->_colorSpace];
      *((unsigned char *)v19 + 24) = v9;
    }
    free(v16[0]);
    int v5 = *((unsigned __int8 *)v19 + 24);
  }
  if (v5) {
    uint64_t v10 = v4;
  }
  else {
    uint64_t v10 = 0;
  }
  unsigned int v11 = v10;

  _Block_object_dispose(&v18, 8);
  return v11;
}

vImage_Error __29__CRImage_imageByRotating180__block_invoke(uint64_t a1, vImage_Buffer *src)
{
  vImage_Error result = vImageRotate90_ARGB8888(src, (const vImage_Buffer *)(a1 + 40), 2u, black_ARGB8888, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == 0;
  return result;
}

- (id)imageByCorrectingFromOrientation:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v20[1] = *MEMORY[0x1E4F143B8];
  char v18 = 0;
  int v17 = 0;
  [(id)objc_opt_class() cgOrientation:*(void *)&a3 toVImageRotationMode:&v18 andReflection:&v17];
  if (v18) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v17 == 0;
  }
  if (v5)
  {
    uint64_t v8 = self;
  }
  else if (self->_vImage.data)
  {
    uint64_t v6 = [CRImage alloc];
    long long v7 = *(_OWORD *)&self->_vImage.width;
    v16[0] = *(_OWORD *)&self->_vImage.data;
    v16[1] = v7;
    uint64_t v8 = [(CRImage *)v6 initWithVImageBuffer:v16 inColorSpace:self->_colorSpace];
    char v9 = objc_opt_class();
    uint64_t colorSpace = self->_colorSpace;
    uint64_t v19 = *MEMORY[0x1E4F2FCA0];
    unsigned int v11 = [NSNumber numberWithUnsignedInt:v3];
    v20[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    if (v9)
    {
      [v9 applyEXIFTransformsOnImage:&v8->_vImage inColorSpace:colorSpace properties:v12];
    }
    else
    {
      long long v14 = 0u;
      long long v15 = 0u;
    }
    *(_OWORD *)&v8->_vImage.data = v14;
    *(_OWORD *)&v8->_vImage.double width = v15;
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)imageByScalingToWidth:(unint64_t)a3 height:(unint64_t)a4
{
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  unint64_t v7 = [(CRImage *)self bytesPerPixel];
  uint64_t v8 = [[CRImage alloc] initWithWidth:a3 height:a4 colorSpace:self->_colorSpace];
  if (v7 == 1)
  {
    int v9 = vImageScale_Planar8(&self->_vImage, &v8->_vImage, 0, 0) == 0;
    *((unsigned char *)v21 + 24) = v9;
  }
  else
  {
    *(_OWORD *)char v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = objc_opt_class();
    if (v10)
    {
      [v10 allocateVImageBufferWithWidth:a3 height:a4 colorSpace:1];
    }
    else
    {
      *(_OWORD *)char v18 = 0u;
      long long v19 = 0u;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    long long v16 = *(_OWORD *)v18;
    long long v17 = v19;
    v15[2] = __40__CRImage_imageByScalingToWidth_height___block_invoke;
    v15[3] = &unk_1E6CDC810;
    v15[4] = &v20;
    [(CRImage *)self runBlockWithARGB8888Image:v15 blockOwnsMemory:0];
    if (*((unsigned char *)v21 + 24))
    {
      char v11 = [(id)objc_opt_class() convertVImage:v18 inColorSpace:1 toVImage:&v8->_vImage toColorSpace:self->_colorSpace];
      *((unsigned char *)v21 + 24) = v11;
    }
    free(v18[0]);
    int v9 = *((unsigned __int8 *)v21 + 24);
  }
  if (v9) {
    uint64_t v12 = v8;
  }
  else {
    uint64_t v12 = 0;
  }
  unsigned int v13 = v12;

  _Block_object_dispose(&v20, 8);
  return v13;
}

vImage_Error __40__CRImage_imageByScalingToWidth_height___block_invoke(uint64_t a1, vImage_Buffer *src)
{
  vImage_Error result = vImageScale_ARGB8888(src, (const vImage_Buffer *)(a1 + 40), 0, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result == 0;
  return result;
}

- (id)imageByPaddingToRatioAndScalingToWidth:(unint64_t)a3 height:(unint64_t)a4 paddingMode:(unint64_t)a5
{
  return [(CRImage *)self imageByPaddingToRatioAndScalingToWidth:a3 height:a4 paddingMode:a5 alignCenter:1];
}

- (id)imageByPaddingToRatioAndScalingToWidth:(unint64_t)a3 height:(unint64_t)a4 paddingMode:(unint64_t)a5 alignCenter:(BOOL)a6
{
  BOOL v6 = a6;
  char v11 = [[CRImage alloc] initWithWidth:a3 height:a4 colorSpace:0];
  unint64_t v12 = (unint64_t)(float)((float)([(CRImage *)self height] * a3) / (float)a4);
  if ([(CRImage *)self width] > v12) {
    unint64_t v12 = [(CRImage *)self width];
  }
  unint64_t v13 = (unint64_t)(float)((float)([(CRImage *)self width] * a4) / (float)a3);
  if ([(CRImage *)self height] > v13) {
    unint64_t v13 = [(CRImage *)self height];
  }
  if (v6) {
    unint64_t v14 = (v12 - [(CRImage *)self width]) >> 1;
  }
  else {
    unint64_t v14 = 0;
  }
  unint64_t v15 = [(CRImage *)self height];
  long long v16 = [[CRImage alloc] initWithWidth:v12 height:v13 colorSpace:0];
  int v17 = CRImagePaddingValueForMode(a5, (unsigned __int8 *)self->_vImage.data, self->_vImage.width, self->_vImage.height, self->_vImage.rowBytes);
  memset(v16->_vImage.data, v17, v16->_vImage.height * v16->_vImage.rowBytes);
  if (self->_vImage.height)
  {
    vImagePixelCount v18 = 0;
    unint64_t v19 = (v13 - v15) >> 1;
    do
    {
      memcpy((char *)v16->_vImage.data + v16->_vImage.rowBytes * (v19 + v18) + v14, (char *)self->_vImage.data + self->_vImage.rowBytes * v18, self->_vImage.width);
      ++v18;
    }
    while (v18 < self->_vImage.height);
  }
  vImageScale_Planar8(&v16->_vImage, &v11->_vImage, 0, 0);

  return v11;
}

- (id)imageByDilating
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [[CRImage alloc] initWithWidth:[(CRImage *)self width] height:[(CRImage *)self height] colorSpace:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__CRImage_imageByDilating__block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v9 = 3;
  if (qword_1EB58CEE0 != -1) {
    dispatch_once(&qword_1EB58CEE0, block);
  }
  vImage_Error v4 = vImageDilate_Planar8(&self->_vImage, &v3->_vImage, 0, 0, (const unsigned __int8 *)qword_1EB58CEE8, 3uLL, 3uLL, 0x10u);
  int v5 = v4;
  if (v4)
  {
    BOOL v6 = CROSLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)vImage_Buffer buf = 67109120;
      int v11 = v5;
      _os_log_impl(&dword_1DD733000, v6, OS_LOG_TYPE_ERROR, "%d", buf, 8u);
    }
  }
  return v3;
}

unsigned char *__26__CRImage_imageByDilating__block_invoke(uint64_t a1)
{
  uint64_t v2 = (char *)malloc_type_calloc((*(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 32)), 1uLL, 0x100004077774924uLL);
  qword_1EB58CEE8 = (uint64_t)v2;
  vImage_Error result = memset(v2, 255, (*(_DWORD *)(a1 + 32) * *(_DWORD *)(a1 + 32)));
  unint64_t v4 = *(unsigned int *)(a1 + 32);
  if ((int)v4 >= 2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    unint64_t v7 = v4 >> 1;
    do
    {
      uint64_t v8 = 0;
      int v9 = &v2[v7 + v7 * (unint64_t)v4];
      vImage_Error result = v9;
      do
      {
        if (((v4 - 1) * (v4 - 1)) >> 2 > (int)v6 * (int)v6 + (int)v8 * (int)v8)
        {
          v9[v6] = 0;
          v9[v5] = 0;
          result[v6] = 0;
          result[v5] = 0;
        }
        ++v8;
        result -= v4;
        v9 += v4;
      }
      while (v7 != v8);
      ++v6;
      --v5;
    }
    while (v6 != v7);
  }
  return result;
}

- (id)imageByApplyingBinaryMask:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = [[CRImage alloc] initWithWidth:[(CRImage *)self width] height:[(CRImage *)self height] colorSpace:0];
  uint64_t v6 = v5;
  unint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  vImagePixelCount height = self->_vImage.height;
  if (!height) {
    goto LABEL_41;
  }
  CGRect v30 = v5;
  uint64_t v8 = 0;
  vImagePixelCount v9 = 0;
  vImagePixelCount width = self->_vImage.width;
  vImagePixelCount v11 = width;
  do
  {
    if (v11)
    {
      vImagePixelCount v12 = 0;
      do
      {
        if (!*(unsigned char *)(v4[2] + v12 + v4[5] * v9))
        {
          unint64_t v13 = (char *)self->_vImage.data + v12;
          size_t v14 = self->_vImage.rowBytes * v9;
          if (v8 >= v33)
          {
            long long v16 = &v8[-v31];
            uint64_t v17 = (uint64_t)&v8[-v31 + 1];
            if (v17 < 0) {
              std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v18 = (unint64_t)&v33[-v31];
            if (2 * (uint64_t)&v33[-v31] > (unint64_t)v17) {
              uint64_t v17 = 2 * v18;
            }
            if (v18 >= 0x3FFFFFFFFFFFFFFFLL) {
              size_t v19 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              size_t v19 = v17;
            }
            if (v19) {
              uint64_t v20 = (char *)operator new(v19);
            }
            else {
              uint64_t v20 = 0;
            }
            char v21 = &v16[(void)v20];
            v16[(void)v20] = v13[v14];
            uint64_t v15 = (uint64_t)&v16[(void)v20 + 1];
            if (v8 != (char *)v31)
            {
              uint64_t v22 = &v8[~v31];
              do
              {
                char v23 = *--v8;
                (v22--)[(void)v20] = v23;
              }
              while (v8 != (char *)v31);
              uint64_t v8 = (char *)v31;
              char v21 = v20;
            }
            unint64_t v31 = (unint64_t)v21;
            uint64_t v33 = &v20[v19];
            if (v8) {
              operator delete(v8);
            }
          }
          else
          {
            *uint64_t v8 = v13[v14];
            uint64_t v15 = (uint64_t)(v8 + 1);
          }
          uint64_t v32 = v15;
          vImagePixelCount width = self->_vImage.width;
          uint64_t v8 = (char *)v15;
        }
        ++v12;
      }
      while (width > v12);
      vImagePixelCount height = self->_vImage.height;
      vImagePixelCount v11 = width;
    }
    ++v9;
  }
  while (height > v9);
  if (v8 == (char *)v31)
  {
    char v24 = 0;
    uint64_t v6 = v30;
    if (!height) {
      goto LABEL_39;
    }
LABEL_31:
    vImagePixelCount v25 = 0;
    vImagePixelCount v26 = self->_vImage.width;
    do
    {
      if (v26)
      {
        for (vImagePixelCount i = 0; i < v26; ++i)
        {
          char v28 = v24;
          if (*(unsigned char *)(v4[2] + v25 * v4[5] + i)) {
            char v28 = *((unsigned char *)self->_vImage.data + v25 * self->_vImage.rowBytes + i);
          }
          *((unsigned char *)v6->_vImage.data + v25 * v6->_vImage.rowBytes + i) = v28;
          vImagePixelCount v26 = self->_vImage.width;
        }
        vImagePixelCount height = self->_vImage.height;
      }
      ++v25;
    }
    while (height > v25);
    goto LABEL_39;
  }
  uint64_t v6 = v30;
  std::__sort<std::__less<unsigned char,unsigned char> &,unsigned char *>();
  uint64_t v8 = (char *)v31;
  char v24 = *(unsigned char *)(v31 + ((v32 - v31) >> 1));
  vImagePixelCount height = self->_vImage.height;
  if (height) {
    goto LABEL_31;
  }
LABEL_39:
  if (v8) {
    operator delete(v8);
  }
LABEL_41:

  return v6;
}

+ (unint64_t)bytesPerPixelForColorSpace:(int)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return qword_1DD8CF258[a3];
  }
}

+ (unint64_t)channelsForColorSpace:(int)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return qword_1DD8CF258[a3];
  }
}

- (unint64_t)bytesPerPixel
{
  uint64_t v3 = objc_opt_class();
  uint64_t colorSpace = self->_colorSpace;
  return [v3 bytesPerPixelForColorSpace:colorSpace];
}

- (unint64_t)numChannels
{
  uint64_t v3 = objc_opt_class();
  uint64_t colorSpace = self->_colorSpace;
  return [v3 channelsForColorSpace:colorSpace];
}

+ (id)nameForColorSpace:(int)a3
{
  if (a3 > 4) {
    return @"Unknown";
  }
  else {
    return off_1E6CDC850[a3];
  }
}

- (id)description
{
  uint64_t v3 = objc_opt_new();
  [v3 appendFormat:@"CRImage (%@) %ldpx x %ldpx\n", objc_opt_class(), -[CRImage width](self, "width"), -[CRImage height](self, "height")];
  unint64_t v4 = objc_msgSend((id)objc_opt_class(), "nameForColorSpace:", -[CRImage colorSpace](self, "colorSpace"));
  [v3 appendFormat:@"- colorSpace: '%@'\n", v4];

  if (self->_sceneStabilityMetric) {
    [v3 appendFormat:@"- sceneStability: %@", self->_sceneStabilityMetric];
  }
  if (self->_vImageDataIsCopy) {
    objc_msgSend(v3, "appendFormat:", @"- HAS vImage COPY (%p)", self->_vImage.data);
  }
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer) {
    objc_msgSend(v3, "appendFormat:", @"- HAS pixelBuffer (format: %08x)", CVPixelBufferGetPixelFormatType(pixelBuffer));
  }
  if (self->_ciImage) {
    [v3 appendFormat:@"- HAS ciImage"];
  }
  if (self->_cgImage) {
    [v3 appendFormat:@"- HAS cgImage"];
  }
  return v3;
}

- (CRImage)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 colorSpace:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v8 = [(CRImage *)self init];
  vImagePixelCount v9 = v8;
  if (v8)
  {
    v8->_uint64_t colorSpace = v5;
    v8->_isFullRange = 1;
    uint64_t v10 = objc_opt_class();
    if (v10)
    {
      [v10 allocateVImageBufferWithWidth:a3 height:a4 colorSpace:v5];
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
    }
    *(_OWORD *)&v9->_vImage.data = v12;
    *(_OWORD *)&v9->_vImage.vImagePixelCount width = v13;
    v9->_vImageDataIsCopy = 1;
  }
  return v9;
}

- (CRImage)initWithVImageBuffer:(vImage_Buffer *)a3 inColorSpace:(int)a4 toColorSpace:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = [(CRImage *)self init];
  vImagePixelCount v9 = v8;
  if (v8)
  {
    v8->_uint64_t colorSpace = v5;
    v8->_isFullRange = 1;
    size_t v10 = [(id)objc_opt_class() bytesPerPixelForColorSpace:v5];
    vImagePixelCount v11 = objc_opt_class();
    if (v11)
    {
      [v11 allocateVImageBufferWithWidth:a3->width height:a3->height bytesPerPixel:v10];
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
    }
    p_data = &v9->_vImage.data;
    *(_OWORD *)&v9->_vImage.data = v15;
    *(_OWORD *)&v9->_vImage.vImagePixelCount width = v16;
    v9->_vImageDataIsCopy = 1;
    if (v6 == v5)
    {
      vImageCopyBuffer(a3, &v9->_vImage, v10, 0);
    }
    else if (([(id)objc_opt_class() convertVImage:a3 inColorSpace:v6 toVImage:&v9->_vImage toColorSpace:v5] & 1) == 0)
    {
      free(*p_data);
      long long v13 = 0;
      *(_OWORD *)p_data = 0u;
      *(_OWORD *)&v9->_vImage.vImagePixelCount width = 0u;
      goto LABEL_9;
    }
  }
  long long v13 = v9;
LABEL_9:

  return v13;
}

- (CRImage)initWithVImageBuffer:(vImage_Buffer *)a3 inColorSpace:(int)a4
{
  long long v4 = *(_OWORD *)&a3->width;
  v6[0] = *(_OWORD *)&a3->data;
  v6[1] = v4;
  return [(CRImage *)self initWithVImageBuffer:v6 inColorSpace:*(void *)&a4 toColorSpace:*(void *)&a4];
}

- (CRImage)initWithFloatBuffer:(float *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [(CRImage *)self init];
  vImagePixelCount v9 = v8;
  if (!v8) {
    goto LABEL_9;
  }
  v8->_uint64_t colorSpace = 0;
  v8->_isFullRange = 1;
  uint64_t v10 = [(id)objc_opt_class() bytesPerPixelForColorSpace:v8->_colorSpace];
  vImagePixelCount v11 = objc_opt_class();
  if (v11)
  {
    [v11 allocateVImageBufferWithWidth:a4 height:a5 bytesPerPixel:v10];
  }
  else
  {
    *(_OWORD *)vImage_Buffer buf = 0u;
    long long v22 = 0u;
  }
  long long v12 = v22;
  *(_OWORD *)&v9->_vImage.data = *(_OWORD *)buf;
  *(_OWORD *)&v9->_vImage.vImagePixelCount width = v12;
  v9->_vImageDataIsCopy = 1;
  data = v9->_vImage.data;
  id v20 = 0;
  CRConvertFloat32BufferToUInt8Buffer(a3, data, a5 * a4, &v20);
  id v14 = v20;
  if (v14)
  {
    long long v15 = v14;
    long long v16 = CROSLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [v15 localizedDescription];
      *(_DWORD *)vImage_Buffer buf = 138412290;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_ERROR, "Failed to create image with float buffer: %@", buf, 0xCu);
    }
    unint64_t v18 = 0;
  }
  else
  {
LABEL_9:
    unint64_t v18 = v9;
  }

  return v18;
}

- (CRImage)initWithMat:(const Mat *)a3
{
  cv::Mat::Mat((cv::Mat *)&v50);
  int var9 = a3->var9;
  if (var9 > 16)
  {
    if (var9 != 17)
    {
      if (var9 != 65) {
        goto LABEL_30;
      }
      cv::Mat::Mat(buf, a3->var3, a3->var4, 1);
      uint64_t var3 = a3->var3;
      if ((int)var3 < 1)
      {
        __int16 v13 = 0x8000;
        int v19 = 0x7FFF;
      }
      else
      {
        uint64_t v8 = 0;
        int v9 = a3->var6[0];
        uint64_t var8 = a3->var8;
        vImagePixelCount v11 = &a3->var1[(a3->var10[1] + a3->var10[0] * (uint64_t)v9) * var8];
        uint64_t v12 = v9 * (uint64_t)(int)var8;
        __int16 v13 = 0x8000;
        __int16 v14 = 0x7FFF;
        do
        {
          long long v15 = v11;
          uint64_t var4 = a3->var4;
          if (a3->var4 >= 1)
          {
            do
            {
              int v18 = *(__int16 *)v15;
              v15 += 2;
              int v17 = v18;
              if (v18 > v13) {
                __int16 v13 = v17;
              }
              if (v17 < v14) {
                __int16 v14 = v17;
              }
              --var4;
            }
            while (var4);
          }
          ++v8;
          v11 += v12;
        }
        while (v8 != var3);
        int v19 = v14;
        float v20 = 0.0;
        if (v13 == v14) {
          goto LABEL_35;
        }
      }
      float v20 = 255.0 / (float)(v13 - v19);
LABEL_35:
      if ((int)var3 >= 1)
      {
        int v36 = 0;
        LODWORD(v37) = a3->var4;
        do
        {
          if ((int)v37 >= 1)
          {
            uint64_t v38 = 0;
            uint64_t v39 = *((void *)&buf[0] + 1) + v56[0] * (v56[3] + HIDWORD(buf[9]) * (v56[2] + v36));
            uint64_t v40 = &a3->var1[a3->var8 * (a3->var10[1] + a3->var6[0] * (a3->var10[0] + v36))];
            do
            {
              *(unsigned char *)(v39 + v38) = (int)(float)((float)((float)(*(__int16 *)&v40[2 * v38] - v19) * v20) + 0.0);
              ++v38;
              uint64_t v37 = a3->var4;
            }
            while (v38 < v37);
            LODWORD(var3) = a3->var3;
          }
          ++v36;
        }
        while (v36 < (int)var3);
      }
LABEL_52:
      memcpy(v51, (char *)buf + 8, sizeof(v51));
      cv::SmartPtr::operator=((cv::SmartPtr *)v52, (cv::SmartPtr *)v55, v57);
      v57[0] = &unk_1F38ED520;
      cv::SmartPtr::release((cv::SmartPtr *)v57);
      memcpy(v53, v56, sizeof(v53));
      *(void *)&buf[0] = &unk_1F38ED500;
      v55[0] = &unk_1F38ED520;
      cv::SmartPtr::release((cv::SmartPtr *)v55);
      cv::Mat::vImage((cv::Mat *)&v50, (uint64_t)buf);
      goto LABEL_53;
    }
    cv::Mat::Mat(buf, a3->var3, a3->var4, 1);
    uint64_t v21 = a3->var3;
    if ((int)v21 < 1)
    {
      float v27 = 1.1755e-38;
      float v28 = 3.4028e38;
    }
    else
    {
      uint64_t v22 = 0;
      int v23 = a3->var6[0];
      uint64_t v24 = a3->var8;
      vImagePixelCount v25 = &a3->var1[(a3->var10[1] + a3->var10[0] * (uint64_t)v23) * v24];
      uint64_t v26 = v23 * (uint64_t)(int)v24;
      float v27 = 1.1755e-38;
      float v28 = 3.4028e38;
      do
      {
        uint64_t v29 = (float *)v25;
        uint64_t v30 = a3->var4;
        if (a3->var4 >= 1)
        {
          do
          {
            float v31 = *v29++;
            float v32 = v31;
            if (v31 > v27) {
              float v27 = v32;
            }
            if (v32 < v28) {
              float v28 = v32;
            }
            --v30;
          }
          while (v30);
        }
        ++v22;
        v25 += v26;
      }
      while (v22 != v21);
      if (v27 == v28)
      {
        float v33 = 0.0;
        goto LABEL_45;
      }
    }
    float v33 = 255.0 / (float)(v27 - v28);
LABEL_45:
    if ((int)v21 >= 1)
    {
      int v41 = 0;
      LODWORD(v42) = a3->var4;
      do
      {
        if ((int)v42 >= 1)
        {
          uint64_t v43 = 0;
          uint64_t v44 = *((void *)&buf[0] + 1) + v56[0] * (v56[3] + HIDWORD(buf[9]) * (v56[2] + v41));
          int v45 = &a3->var1[a3->var8 * (a3->var10[1] + a3->var6[0] * (a3->var10[0] + v41))];
          do
          {
            *(unsigned char *)(v44 + v43) = (int)(float)((float)((float)(*(float *)&v45[4 * v43] - v28) * v33) + 0.0);
            ++v43;
            uint64_t v42 = a3->var4;
          }
          while (v43 < v42);
          LODWORD(v21) = a3->var3;
        }
        ++v41;
      }
      while (v41 < (int)v21);
    }
    goto LABEL_52;
  }
  if (var9 == 1)
  {
    cv::Mat::vImage((cv::Mat *)a3, (uint64_t)buf);
LABEL_53:
    uint64_t v6 = 0;
    long long v48 = buf[0];
    long long v49 = buf[1];
    goto LABEL_54;
  }
  if (var9 == 4)
  {
    cv::Mat::vImage((cv::Mat *)a3, (uint64_t)buf);
    long long v48 = buf[0];
    long long v49 = buf[1];
    uint64_t v6 = 1;
LABEL_54:
    v47[0] = v48;
    v47[1] = v49;
    self = [(CRImage *)self initWithVImageBuffer:v47 inColorSpace:v6 toColorSpace:1];
    unint64_t v35 = self;
    goto LABEL_55;
  }
LABEL_30:
  char v34 = CROSLogForCategory(0);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DD733000, v34, OS_LOG_TYPE_ERROR, "Unsupported color space", (uint8_t *)buf, 2u);
  }

  unint64_t v35 = 0;
LABEL_55:
  long long v50 = &unk_1F38ED500;
  v52[0] = &unk_1F38ED520;
  cv::SmartPtr::release((cv::SmartPtr *)v52);

  return v35;
}

- (id)imageByCroppingRectangle:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v8 = (double)[(CRImage *)self width];
  v24.size.CGFloat height = (double)[(CRImage *)self height];
  v24.origin.CGFloat x = 0.0;
  v24.origin.CGFloat y = 0.0;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  v24.size.CGFloat width = v8;
  CGRect v23 = CGRectIntersection(v22, v24);
  double v9 = v23.origin.x;
  double v10 = v23.origin.y;
  double v11 = v23.size.width;
  double v12 = v23.size.height;
  long long v19 = 0u;
  long long v20 = 0u;
  [(CRImage *)self vImage];
  uint64_t v13 = v19;
  uint64_t v14 = *((void *)&v20 + 1) * (int)v10;
  *(void *)&long long v19 = v13 + v14 + [(CRImage *)self bytesPerPixel] * (int)v9;
  *((void *)&v19 + 1) = (int)v12;
  *(void *)&long long v20 = (int)v11;
  long long v15 = [CRImage alloc];
  long long v16 = [(CRImage *)v15 initWithVImageBuffer:&v18 inColorSpace:[(CRImage *)self colorSpace]];
  return v16;
}

- (id)imageByCroppingRectangle:(CGRect)a3 textFeaturePoints:(id)a4 radians:(float)a5 rotatedRoi:(CGRect *)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v74 = a4;
  unint64_t v13 = [(CRImage *)self width];
  unint64_t v14 = [(CRImage *)self height];
  v89.size.double width = (double)v13;
  v89.size.double height = (double)v14;
  v89.origin.double x = 0.0;
  v89.origin.double y = 0.0;
  v87.origin.double x = x;
  v87.origin.double y = y;
  v87.size.double width = width;
  v87.size.double height = height;
  CGRect v88 = CGRectIntersection(v87, v89);
  double v69 = v88.origin.y;
  double v70 = v88.origin.x;
  double v71 = v88.size.width;
  double v72 = v88.size.height;
  float angleInRadians = a5;
  __float2 v15 = __sincosf_stret(a5);
  long long v16 = (int8x16_t *)malloc_type_calloc([v74 count], 0x10uLL, 0x1000040451B5BE8uLL);
  v67 = (int8x16_t *)a6;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v17 = v74;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v80 objects:v84 count:16];
  if (v18)
  {
    int v19 = 0;
    double v20 = width * 0.5;
    double v21 = height * 0.5;
    uint64_t v22 = *(void *)v81;
    double cosval = v15.__cosval;
    double v24 = (float)-v15.__sinval;
    do
    {
      uint64_t v25 = 0;
      int v26 = v19;
      float v27 = (double *)&v16[v19].i64[1];
      do
      {
        if (*(void *)v81 != v22) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v80 + 1) + 8 * v25) pointValue];
        double v29 = v28;
        double v31 = v30;
        unint64_t v32 = [(CRImage *)self width];
        unint64_t v33 = [(CRImage *)self height];
        double v34 = v29 * (double)v32 - x - v20;
        double v35 = v31 * (double)v33 - y - v21;
        float v36 = v34 * cosval - v35 * v24;
        *(float *)&double v34 = v35 * cosval + v34 * v24;
        *(v27 - 1) = v20 + v36;
        *float v27 = v21 + *(float *)&v34;
        ++v25;
        v27 += 2;
      }
      while (v18 != v25);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v80 objects:v84 count:16];
      int v19 = v26 + v25;
    }
    while (v18);
  }

  unint64_t v37 = 0;
  double v38 = fmax((double)[(CRImage *)self width], (double)[(CRImage *)self height]);
  *(float *)&double v38 = v38;
  float32x2_t v39 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v38, 0);
  float32x2_t v40 = 0;
  while ([v17 count] > v37)
  {
    float64x2_t v41 = (float64x2_t)vextq_s8(v16[v37], v16[v37], 8uLL);
    float32x2_t v39 = vcvt_f32_f64(vminnmq_f64(vcvtq_f64_f32(v39), v41));
    float32x2_t v40 = vcvt_f32_f64(vmaxnmq_f64(vcvtq_f64_f32(v40), v41));
    ++v37;
  }
  free(v16);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CVPixelBufferLockBaseAddress(self->_pixelBuffer, 1uLL);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(self->_pixelBuffer);
    CVPixelBufferGetHeight(self->_pixelBuffer);
    CVPixelBufferGetWidth(self->_pixelBuffer);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(self->_pixelBuffer);
    src.size_t rowBytes = BytesPerRow;
  }
  else
  {
    [(CRImage *)self vImage];
    vImage_Buffer src = dest;
    BaseAddress = (char *)dest.data;
    size_t BytesPerRow = dest.rowBytes;
  }
  uint64_t v44 = (int)v69;
  unint64_t v45 = [(CRImage *)self bytesPerPixel] * (int)v70;
  uint64_t v46 = &BaseAddress[v45 + BytesPerRow * v44];
  vImagePixelCount v47 = (int)v71;
  vImagePixelCount v48 = (int)v72;
  src.data = v46;
  src.double height = v48;
  src.double width = v47;
  uint64_t v49 = objc_msgSend((id)objc_opt_class(), "bytesPerPixelForColorSpace:", -[CRImage colorSpace](self, "colorSpace"));
  memset(&dest, 0, sizeof(dest));
  long long v50 = objc_opt_class();
  uint64x2_t v51 = vcvtq_u64_f64(vcvtq_f64_f32(vsub_f32(v40, v39)));
  int64x2_t v73 = (int64x2_t)v51;
  if (v50) {
    [v50 allocateVImageBufferWithWidth:v51.i64[1] height:v51.i64[0] bytesPerPixel:v49];
  }
  else {
    memset(&dest, 0, sizeof(dest));
  }
  int v52 = 0;
  if (v47)
  {
    v53 = &BaseAddress[v45 + BytesPerRow * (v48 + v44 - 1)];
    uint64_t v54 = (int)v71;
    float v55 = angleInRadians;
    do
    {
      int v56 = *v46++;
      int v57 = v52 + v56;
      int v58 = *v53++;
      int v52 = v57 + v58;
      --v54;
    }
    while (v54);
  }
  else
  {
    float v55 = angleInRadians;
  }
  if (v48 - 1 >= 2)
  {
    vImagePixelCount v59 = v48 - 2;
    v60 = &BaseAddress[v45 + BytesPerRow + BytesPerRow * v44];
    do
    {
      v52 += *v60 + v60[v47 - 1];
      v60 += BytesPerRow;
      --v59;
    }
    while (v59);
  }
  if (2 * (v48 + v47) == 4) {
    LOBYTE(v61) = 0;
  }
  else {
    unint64_t v61 = v52 / (2 * (v48 + v47) - 4);
  }
  vImageRotate_Planar8(&src, &dest, 0, v55, v61, 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CVPixelBufferUnlockBaseAddress(self->_pixelBuffer, 1uLL);
  }
  if (v67)
  {
    int8x16_t v62 = (int8x16_t)vcvtq_f64_f32(v39);
    int8x16_t v63 = (int8x16_t)vcvtq_f64_u64((uint64x2_t)v73);
    int8x16_t *v67 = vextq_s8(v62, v62, 8uLL);
    v67[1] = vextq_s8(v63, v63, 8uLL);
  }
  data = dest.data;
  [(CRImage *)self bytesPerPixel];
  v75 = data;
  int64x2_t v76 = vshrq_n_s64(vshlq_n_s64(v73, 0x20uLL), 0x20uLL);
  size_t rowBytes = dest.rowBytes;
  v65 = [[CRImage alloc] initWithVImageBuffer:&v75 inColorSpace:[(CRImage *)self colorSpace]];
  free(dest.data);

  return v65;
}

- (CGRect)rotatedRoiByCroppingRectangle:(CGRect)a3 textFeaturePoints:(id)a4 radians:(float)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  __float2 v12 = __sincosf_stret(a5);
  unint64_t v13 = (double *)malloc_type_calloc([v11 count], 0x10uLL, 0x1000040451B5BE8uLL);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v15)
  {
    int v16 = 0;
    double v17 = width * 0.5;
    double v18 = height * 0.5;
    uint64_t v19 = *(void *)v47;
    double cosval = v12.__cosval;
    double v21 = (float)-v12.__sinval;
    do
    {
      uint64_t v22 = 0;
      int v23 = v16;
      double v24 = &v13[2 * v16 + 1];
      do
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * v22) pointValue];
        double v26 = v25;
        double v28 = v27;
        unint64_t v29 = [(CRImage *)self width];
        unint64_t v30 = [(CRImage *)self height];
        double v31 = v26 * (double)v29 - x - v17;
        double v32 = v28 * (double)v30 - y - v18;
        float v33 = v31 * cosval - v32 * v21;
        *(float *)&double v31 = v32 * cosval + v31 * v21;
        *(v24 - 1) = v17 + v33;
        *double v24 = v18 + *(float *)&v31;
        ++v22;
        v24 += 2;
      }
      while (v15 != v22);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v50 count:16];
      int v16 = v23 + v22;
    }
    while (v15);
  }

  unint64_t v34 = 0;
  float v35 = fmax((double)[(CRImage *)self width], (double)[(CRImage *)self height]);
  float v36 = v13 + 1;
  float v37 = 0.0;
  float v38 = v35;
  float v39 = 0.0;
  while ([v14 count] > v34)
  {
    double v40 = *(v36 - 1);
    float v35 = fmin(v35, v40);
    double v41 = *v36;
    v36 += 2;
    float v38 = fmin(v38, v41);
    float v37 = fmax(v37, v40);
    float v39 = fmax(v39, v41);
    ++v34;
  }
  free(v13);

  double v42 = v38;
  double v43 = (float)(v37 - v35);
  double v44 = (float)(v39 - v38);
  double v45 = v35;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.double y = v42;
  result.origin.double x = v45;
  return result;
}

- (id)imageByCroppingRectangle:(CGRect)a3 toHeight:(unint64_t)a4 andWidth:(unint64_t)a5 withRotationAngle:(float)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v14 = (double)[(CRImage *)self width];
  v31.size.CGFloat height = (double)[(CRImage *)self height];
  v31.origin.CGFloat x = 0.0;
  v31.origin.CGFloat y = 0.0;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  v31.size.CGFloat width = v14;
  CGRect v30 = CGRectIntersection(v29, v31);
  double v15 = v30.origin.x;
  double v16 = v30.size.width;
  double v17 = v30.size.height;
  *(_OWORD *)&src.CGFloat width = 0u;
  [(CRImage *)self vImage];
  src.data = (void *)([(CRImage *)self bytesPerPixel] * (int)v15);
  src.CGFloat height = (int)v17;
  src.CGFloat width = (int)v16;
  if (src.height <= a4)
  {
    double v20 = [CRImage alloc];
    vImage_Buffer v26 = src;
    double v21 = [(CRImage *)v20 initWithVImageBuffer:&v26 inColorSpace:[(CRImage *)self colorSpace]];
  }
  else
  {
    memset(&dest, 0, sizeof(dest));
    double v18 = objc_opt_class();
    unint64_t v19 = [(CRImage *)self bytesPerPixel];
    if (v18) {
      [v18 allocateVImageBufferWithWidth:a5 height:a4 bytesPerPixel:v19];
    }
    else {
      memset(&dest, 0, sizeof(dest));
    }
    vImageRotate_Planar8(&src, &dest, 0, a6, 0, 0);
    uint64_t v22 = [CRImage alloc];
    double v21 = [(CRImage *)v22 initWithVImageBuffer:&v24 inColorSpace:[(CRImage *)self colorSpace]];
    if (dest.data) {
      free(dest.data);
    }
  }
  return v21;
}

- (id)imageByRectifyingRegion:(id)a3 toColorSpace:(int)a4 homography:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  v66[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1E050]), "initWithCVPixelBuffer:", -[CRImage pixelBuffer](self, "pixelBuffer"));
  v65[0] = @"inputTopLeft";
  [v8 topLeft];
  double v11 = v10;
  double v13 = v12;
  [(CRImage *)self size];
  double v16 = CIImageCoordinateFromCGPoint(v11, v13, v14, v15);
  v66[0] = v16;
  v65[1] = @"inputTopRight";
  [v8 topRight];
  double v18 = v17;
  double v20 = v19;
  [(CRImage *)self size];
  int v23 = CIImageCoordinateFromCGPoint(v18, v20, v21, v22);
  v66[1] = v23;
  v65[2] = @"inputBottomRight";
  [v8 bottomRight];
  double v25 = v24;
  double v27 = v26;
  [(CRImage *)self size];
  CGRect v30 = CIImageCoordinateFromCGPoint(v25, v27, v28, v29);
  v66[2] = v30;
  v65[3] = @"inputBottomLeft";
  [v8 bottomLeft];
  double v32 = v31;
  double v34 = v33;
  [(CRImage *)self size];
  float v37 = CIImageCoordinateFromCGPoint(v32, v34, v35, v36);
  v66[3] = v37;
  float v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:v65 count:4];
  float v39 = [v9 imageByApplyingFilter:@"CIPerspectiveCorrection" withInputParameters:v38];

  double v40 = [[CRImage alloc] initWithCIImage:v39 toColorSpace:v6];
  if (a5)
  {
    v61[8] = 0;
    v61[9] = 0;
    __asm { FMOV            V1.2D, #1.0 }
    long long v62 = xmmword_1DD8CE3C0;
    long long v63 = _Q1;
    long long v64 = xmmword_1DD8CE3D0;
    [v8 topLeft];
    objc_msgSend(v8, "topRight", v46, v47);
    v61[2] = v48;
    v61[3] = v49;
    [v8 bottomRight];
    v61[4] = v50;
    v61[5] = v51;
    [v8 bottomLeft];
    v61[6] = v52;
    v61[7] = v53;
    float32x2_t v54 = computeHomographyMatrix((uint64_t)v61);
    *((_DWORD *)a5 + 2) = v55;
    *((_DWORD *)a5 + 6) = v56;
    *(float32x2_t *)a5 = v54;
    *((void *)a5 + 2) = v57;
    *((_DWORD *)a5 + 10) = v58;
    *((void *)a5 + 4) = v59;
  }

  return v40;
}

- (void)writeToURL:(id)a3
{
  id v5 = [a3 absoluteString];
  long long v4 = [v5 stringByReplacingOccurrencesOfString:@"file://" withString:&stru_1F38EED68];
  [(CRImage *)self writeToFile:v4];
}

- (void)writeToFile:(id)a3
{
  id v4 = a3;
  writeCGImageWithMetadata([(CRImage *)self cgImage], v4, 0);
}

- (void)dealloc
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
    CVPixelBufferRelease(self->_pixelBuffer);
    self->_pixelBuffer = 0;
  }
  if (self->_vImageDataIsCopy)
  {
    data = self->_vImage.data;
    if (data)
    {
      free(data);
      self->_vImage.data = 0;
      self->_vImageDataIsCopCGFloat y = 0;
    }
  }
  cgImage = self->_cgImage;
  if (cgImage)
  {
    CGImageRelease(cgImage);
    self->_cgImage = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CRImage;
  [(CRImage *)&v6 dealloc];
}

- (id)imageByInvertingIntensity
{
  uint64_t v3 = [CRImage alloc];
  [(CRImage *)self vImage];
  id v4 = [(CRImage *)v3 initWithVImageBuffer:v12 inColorSpace:0];
  id v5 = v4;
  if (v4)
  {
    [(CRImage *)v4 vImage];
    uint64_t v6 = v11;
  }
  else
  {
    uint64_t v6 = 0;
  }
  for (unint64_t i = 0; [(CRImage *)v5 width] > i; ++i)
  {
    for (unint64_t j = 0; [(CRImage *)v5 height] > j; ++j)
    {
      char v9 = *(unsigned char *)(v6 + i + [(CRImage *)v5 width] * j);
      *(unsigned char *)(v6 + i + [(CRImage *)v5 width] * j) = ~v9;
    }
  }
  return v5;
}

- (CRImage)initWithCGImage:(CGImage *)a3 toColorSpace:(int)a4
{
  return [(CRImage *)self initWithCGImage:a3 properties:0 toColorSpace:*(void *)&a4];
}

+ (void)cgOrientation:(unsigned int)a3 toVImageRotationMode:(char *)a4 andReflection:(int *)a5
{
  signed int v5 = a3 - 2;
  if (a3 - 2 > 6)
  {
    LOBYTE(v6) = 0;
    int v7 = 0;
  }
  else
  {
    unint64_t v6 = 0x1030301020200uLL >> (8 * v5);
    int v7 = dword_1DD8CF280[v5];
  }
  *a4 = v6;
  *a5 = v7;
}

+ (vImage_Buffer)applyEXIFTransformsOnImage:(SEL)a3 inColorSpace:(const vImage_Buffer *)a4 properties:(int)a5
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v8 = *(_OWORD *)&a4->width;
  *(_OWORD *)&retstr->data = *(_OWORD *)&a4->data;
  *(_OWORD *)&retstr->CGFloat width = v8;
  char v9 = [a6 objectForKey:*MEMORY[0x1E4F2FCA0]];
  double v10 = v9;
  if (!v9) {
    goto LABEL_34;
  }
  uint8_t rotationConstant = 0;
  int v24 = 0;
  objc_msgSend((id)objc_opt_class(), "cgOrientation:toVImageRotationMode:andReflection:", objc_msgSend(v9, "intValue"), &rotationConstant, &v24);
  uint64_t v11 = [(id)objc_opt_class() bytesPerPixelForColorSpace:v6];
  uint64_t v12 = v11;
  if (v11 != 1 && v11 != 4)
  {
    double v15 = CROSLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      double v16 = [(id)objc_opt_class() nameForColorSpace:v6];
      LODWORD(buf.data) = 138412290;
      *(void **)((char *)&buf.data + 4) = v16;
      _os_log_impl(&dword_1DD733000, v15, OS_LOG_TYPE_ERROR, "[CRImage applyEXIFTransformsOnImage:inColorSpace:properties:] Color space %@ not supported. Only color spaces with 1 or 4 bytes per pixel are supported.", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_34;
  }
  if (rotationConstant)
  {
    long long v13 = *(_OWORD *)&retstr->width;
    *(_OWORD *)&buf.data = *(_OWORD *)&retstr->data;
    *(_OWORD *)&buf.CGFloat width = v13;
    if (rotationConstant)
    {
      double v17 = objc_opt_class();
      if (v17)
      {
        [v17 allocateVImageBufferWithWidth:buf.height height:buf.width bytesPerPixel:v12];
        goto LABEL_14;
      }
    }
    else
    {
      double v14 = objc_opt_class();
      if (v14)
      {
        [v14 allocateVImageBufferWithWidth:buf.width height:buf.height bytesPerPixel:v12];
LABEL_14:
        *(_OWORD *)&retstr->data = v22;
        *(_OWORD *)&retstr->CGFloat width = v23;
        if (v12 == 1) {
          vImageRotate90_Planar8(&buf, retstr, rotationConstant, 0, 0);
        }
        else {
          vImageRotate90_ARGB8888(&buf, retstr, rotationConstant, black_ARGB8888, 0);
        }
        free(buf.data);
        goto LABEL_18;
      }
    }
    long long v22 = 0u;
    long long v23 = 0u;
    goto LABEL_14;
  }
LABEL_18:
  if (v24)
  {
    long long v18 = *(_OWORD *)&retstr->width;
    *(_OWORD *)&buf.data = *(_OWORD *)&retstr->data;
    *(_OWORD *)&buf.CGFloat width = v18;
    if (v24 == 2)
    {
      double v20 = objc_opt_class();
      if (v20)
      {
        [v20 allocateVImageBufferWithWidth:buf.width height:buf.height bytesPerPixel:v12];
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
      }
      *(_OWORD *)&retstr->data = v22;
      *(_OWORD *)&retstr->CGFloat width = v23;
      if (v12 == 1) {
        vImageHorizontalReflect_Planar8(&buf, retstr, 0);
      }
      else {
        vImageHorizontalReflect_ARGB8888(&buf, retstr, 0);
      }
      goto LABEL_33;
    }
    if (v24 == 1)
    {
      double v19 = objc_opt_class();
      if (v19)
      {
        [v19 allocateVImageBufferWithWidth:buf.width height:buf.height bytesPerPixel:v12];
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
      }
      *(_OWORD *)&retstr->data = v22;
      *(_OWORD *)&retstr->CGFloat width = v23;
      if (v12 == 1) {
        vImageVerticalReflect_Planar8(&buf, retstr, 0);
      }
      else {
        vImageVerticalReflect_ARGB8888(&buf, retstr, 0);
      }
LABEL_33:
      free(buf.data);
    }
  }
LABEL_34:

  return result;
}

- (CRImage)initWithCGImage:(CGImage *)a3 properties:(id)a4 toColorSpace:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  char v9 = [(CRImage *)self init];
  if (!v9)
  {
LABEL_27:
    double v15 = v9;
    goto LABEL_28;
  }
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v12 = objc_opt_class();
  if (v12)
  {
    [v12 allocateVImageBufferWithWidth:Width height:Height colorSpace:1];
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  int v32 = 0;
  v28[0] = 0x2000000008;
  v28[1] = DeviceRGB;
  int v29 = 4;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v14 = MEMORY[0x1E01C0160](&v33, v28, 0, a3, 512);
  CGColorSpaceRelease(DeviceRGB);
  if (v14) {
    goto LABEL_6;
  }
  uint64_t v16 = [(id)objc_opt_class() bytesPerPixelForColorSpace:v5];
  uint64_t v17 = v16;
  if (v16 != 1 && v16 != 4)
  {
    long long v18 = objc_opt_class();
    if (v18)
    {
      [v18 applyEXIFTransformsOnImage:&v33 inColorSpace:1 properties:v8];
    }
    else
    {
      *(_OWORD *)double v26 = 0u;
      long long v27 = 0u;
    }
    long long v33 = *(_OWORD *)v26;
    long long v34 = v27;
  }
  if (v5 == 1)
  {
    *(_OWORD *)double v26 = v33;
    long long v27 = v34;
LABEL_19:
    if (v17 == 4 || v17 == 1)
    {
      double v21 = objc_opt_class();
      if (v21)
      {
        [v21 applyEXIFTransformsOnImage:v26 inColorSpace:v5 properties:v8];
      }
      else
      {
        long long v24 = 0u;
        long long v25 = 0u;
      }
      *(_OWORD *)double v26 = v24;
      long long v27 = v25;
    }
    v9->_uint64_t colorSpace = v5;
    *(_WORD *)&v9->_isFullRange = 257;
    long long v22 = v27;
    *(_OWORD *)&v9->_vImage.data = *(_OWORD *)v26;
    *(_OWORD *)&v9->_vImage.CGFloat width = v22;
    goto LABEL_27;
  }
  double v19 = objc_opt_class();
  if (v19)
  {
    [v19 allocateVImageBufferWithWidth:Width height:Height colorSpace:v5];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
  }
  *(_OWORD *)double v26 = v24;
  long long v27 = v25;
  char v20 = [(id)objc_opt_class() convertVImage:&v33 inColorSpace:1 toVImage:v26 toColorSpace:v5];
  free((void *)v33);
  if (v20) {
    goto LABEL_19;
  }
  free(v26[0]);
LABEL_6:
  double v15 = 0;
LABEL_28:

  return v15;
}

- (CRImage)initWithContentsOfURL:(id)a3 toColorSpace:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  int v7 = v6;
  if (v6)
  {
    ImageAtIndeCGFloat x = CGImageSourceCreateImageAtIndex(v6, 0, 0);
    if (ImageAtIndex)
    {
      CFDictionaryRef v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
      double v10 = [(CRImage *)self initWithCGImage:ImageAtIndex properties:v9 toColorSpace:v4];

      CGImageRelease(ImageAtIndex);
      CFRelease(v7);
      self = v10;
      int v7 = (CGImageSource *)self;
    }
    else
    {
      CFRelease(v7);
      int v7 = 0;
    }
  }

  return (CRImage *)v7;
}

+ (BOOL)convertVImage:(const vImage_Buffer *)a3 inColorSpace:(int)a4 toVImage:(vImage_Buffer *)a5 toColorSpace:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v8 = *(void *)&a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a4 != a6)
  {
    switch(a4)
    {
      case -1:
        uint64_t v16 = CROSLogForCategory(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = [(id)objc_opt_class() nameForColorSpace:0xFFFFFFFFLL];
          long long v18 = [(id)objc_opt_class() nameForColorSpace:v6];
          *(_DWORD *)buf.opaque = 138412546;
          *(void *)&buf.opaque[4] = v17;
          *(_WORD *)&buf.opaque[12] = 2112;
          *(void *)&buf.opaque[14] = v18;
          _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_ERROR, "[CRImage convertVImage:inColorSpace:toVImage:toColorSpace:] Unable to convert %@ to %@", buf.opaque, 0x16u);
        }
        goto LABEL_11;
      case 0:
        if (a6 == 1)
        {
          vImage_Error v11 = vImageConvert_Planar8ToXRGB8888(0xFFu, a3, a3, a3, a5, 0);
          goto LABEL_3;
        }
        if (a6 == 4)
        {
          memset(&buf, 0, 32);
          long long v22 = objc_opt_class();
          if (v22) {
            [v22 allocateVImageBufferWithWidth:a3->width height:a3->height colorSpace:1];
          }
          else {
            memset(&buf, 0, 32);
          }
          if (!vImageOverwriteChannelsWithPixel_ARGB8888(black_AYpCbCr, (const vImage_Buffer *)&buf, (const vImage_Buffer *)&buf, 0xFu, 0)&& !vImageOverwriteChannels_ARGB8888(a3, (const vImage_Buffer *)&buf, (const vImage_Buffer *)&buf, 4u, 0))
          {
            vImage_Error v24 = vImageConvert_ARGB8888toRGB888((const vImage_Buffer *)&buf, a5, 0);
            data = *(void **)buf.opaque;
            goto LABEL_62;
          }
        }
        else if (a6 == 3 && !vImageOverwriteChannelsWithPixel_ARGB8888(black_AYpCbCr, a5, a5, 0xFu, 0))
        {
          vImage_Error v11 = vImageOverwriteChannels_ARGB8888(a3, a5, a5, 4u, 0);
          goto LABEL_3;
        }
        goto LABEL_4;
      case 1:
        if (a6 == 4)
        {
          if (!vImageConvert_ARGBToYpCbCr_GenerateConversion((const vImage_ARGBToYpCbCrMatrix *)*MEMORY[0x1E4F167C8], &fullYpCbCrPixelRange, &buf, kvImageARGB8888, kvImage444CrYpCb8, 0)&& !vImageConvert_ARGB8888To444CrYpCb8(a3, a5, &buf, 0, 0))
          {
            BYTE2(permuteMap.data) = 0;
            LOWORD(permuteMap.data) = 513;
            vImage_Error v11 = vImagePermuteChannels_RGB888(a5, a5, (const uint8_t *)&permuteMap, 0);
            goto LABEL_3;
          }
          goto LABEL_4;
        }
        if (a6 == 3)
        {
          if (vImageConvert_ARGBToYpCbCr_GenerateConversion((const vImage_ARGBToYpCbCrMatrix *)*MEMORY[0x1E4F167C8], &fullYpCbCrPixelRange, &buf, kvImageARGB8888, kvImage444AYpCbCr8, 0))
          {
            goto LABEL_4;
          }
          vImage_Error v11 = vImageConvert_ARGB8888To444AYpCbCr8(a3, a5, &buf, 0, 0);
        }
        else
        {
          if (a6) {
            goto LABEL_4;
          }
          *(void *)buf.opaque = 0x93B5B921B330000;
          vImage_Error v11 = vImageMatrixMultiply_ARGB8888ToPlanar8(a3, a5, (const int16_t *)&buf, 0x7FFF, 0, 0x3FFF, 0);
        }
        goto LABEL_3;
      case 2:
        uint64_t v16 = CROSLogForCategory(0);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v19 = [(id)objc_opt_class() nameForColorSpace:2];
          char v20 = [(id)objc_opt_class() nameForColorSpace:v6];
          *(_DWORD *)buf.opaque = 138412546;
          *(void *)&buf.opaque[4] = v19;
          *(_WORD *)&buf.opaque[12] = 2112;
          *(void *)&buf.opaque[14] = v20;
          _os_log_impl(&dword_1DD733000, v16, OS_LOG_TYPE_ERROR, "[CRImage convertVImage:inColorSpace:toVImage:toColorSpace:] Unable to convert %@ to %@", buf.opaque, 0x16u);
        }
LABEL_11:

        return 0;
      case 3:
        if (!a6)
        {
          BOOL v15 = 1;
          if (vImageExtractChannel_ARGB8888(a3, a5, 1, 0)) {
            goto LABEL_4;
          }
          return v15;
        }
        if (a6 == 4)
        {
          vImageConvert_ARGB8888toRGB888(a3, a5, 0);
          return 1;
        }
        if (a6 == 1
          && !vImageConvert_YpCbCrToARGB_GenerateConversion((const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x1E4F167D8], &fullYpCbCrPixelRange, (vImage_YpCbCrToARGB *)&buf, kvImage444AYpCbCr8, kvImageARGB8888, 0))
        {
          vImage_Error v11 = vImageConvert_444AYpCbCr8ToARGB8888(a3, a5, (const vImage_YpCbCrToARGB *)&buf, 0, 0);
          goto LABEL_3;
        }
        goto LABEL_4;
      case 4:
        if (a6)
        {
          if (a6 == 3)
          {
            vImage_Error v11 = vImageConvert_RGB888toARGB8888(a3, 0, 0xFFu, a5, 0, 0);
            goto LABEL_3;
          }
          if (a6 != 1) {
            goto LABEL_4;
          }
          memset(&permuteMap, 0, sizeof(permuteMap));
          double v21 = objc_opt_class();
          if (v21) {
            [v21 allocateVImageBufferWithWidth:a3->width height:a3->height colorSpace:4];
          }
          else {
            memset(&permuteMap, 0, sizeof(permuteMap));
          }
          char v29 = 1;
          *(_WORD *)double v28 = 2;
          if (vImagePermuteChannels_RGB888(a3, &permuteMap, v28, 0)
            || vImageConvert_YpCbCrToARGB_GenerateConversion((const vImage_YpCbCrToARGBMatrix *)*MEMORY[0x1E4F167D8], &fullYpCbCrPixelRange, (vImage_YpCbCrToARGB *)&buf, kvImage444CrYpCb8, kvImageARGB8888, 0))
          {
            free(permuteMap.data);
            goto LABEL_4;
          }
          vImage_Error v24 = vImageConvert_444CrYpCb8ToARGB8888(&permuteMap, a5, (const vImage_YpCbCrToARGB *)&buf, 0, 0xFFu, 0);
        }
        else
        {
          memset(&buf, 0, 32);
          long long v23 = objc_opt_class();
          if (v23) {
            [v23 allocateVImageBufferWithWidth:a3->width height:a3->height bytesPerPixel:1];
          }
          else {
            memset(&buf, 0, 32);
          }
          memset(&permuteMap, 0, sizeof(permuteMap));
          double v26 = objc_opt_class();
          if (v26) {
            [v26 allocateVImageBufferWithWidth:a3->width height:a3->height bytesPerPixel:1];
          }
          else {
            memset(&permuteMap, 0, sizeof(permuteMap));
          }
          vImage_Error v24 = vImageConvert_RGB888toPlanar8(a3, a5, (const vImage_Buffer *)&buf, &permuteMap, 0);
          free(*(void **)buf.opaque);
        }
        data = permuteMap.data;
LABEL_62:
        free(data);
        if (!v24) {
          return 1;
        }
        goto LABEL_4;
      default:
        return 1;
    }
  }
  size_t v10 = [(id)objc_opt_class() bytesPerPixelForColorSpace:*(void *)&a4];
  vImage_Error v11 = vImageCopyBuffer(a3, a5, v10, 0);
LABEL_3:
  if (!v11) {
    return 1;
  }
LABEL_4:
  uint64_t v12 = CROSLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = [(id)objc_opt_class() nameForColorSpace:v8];
    uint64_t v14 = [(id)objc_opt_class() nameForColorSpace:v6];
    *(_DWORD *)buf.opaque = 138412546;
    *(void *)&buf.opaque[4] = v13;
    *(_WORD *)&buf.opaque[12] = 2112;
    *(void *)&buf.opaque[14] = v14;
    _os_log_impl(&dword_1DD733000, v12, OS_LOG_TYPE_ERROR, "[CRImage convertVImage:inColorSpace:toVImage:toColorSpace:] Unable to convert %@ to %@", buf.opaque, 0x16u);
  }
  return 0;
}

- (id)imageByConvertingToColorSpace:(int)a3
{
  if (self->_colorSpace == a3)
  {
    uint64_t v4 = self;
  }
  else
  {
    uint64_t v5 = *(void *)&a3;
    uint64_t v6 = [[CRImage alloc] initWithWidth:[(CRImage *)self width] height:[(CRImage *)self height] colorSpace:*(void *)&a3];
    if ([(id)objc_opt_class() convertVImage:&self->_vImage inColorSpace:self->_colorSpace toVImage:&v6->_vImage toColorSpace:v5])uint64_t v4 = v6; {
    else
    }
      uint64_t v4 = 0;
  }
  return v4;
}

- (id)imageByOverlayingRects:(CGRect *)a3 count:(int64_t)a4 strings:(id)a5 lineWidth:(double)a6 red:(double)a7 green:(double)a8 blue:(double)a9 alpha:(double)a10
{
  id v18 = a5;
  id v19 = [(CRImage *)self cgImage];
  size_t v20 = [(CRImage *)self width];
  size_t v21 = [(CRImage *)self height];
  long long v22 = makeCFPointer<CGColorSpace *>;
  CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  ((void (*)(uint64_t@<X0>, void *@<X8>))v22)((uint64_t)DeviceRGB, &space);
  vImage_Error v24 = makeCFPointer<CGContext *>;
  CGContextRef v25 = CGBitmapContextCreate(0, v20, v21, 8uLL, 4 * v20, space, 6u);
  ((void (*)(uint64_t@<X0>, void *@<X8>))v24)((uint64_t)v25, &c);
  long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&transform.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&transform.CGContextRef c = v26;
  *(_OWORD *)&transform.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGContextConcatCTM(c, &transform);
  v53.size.CGFloat width = (double)v20;
  v53.size.double height = (double)v21;
  v53.origin.CGFloat x = 0.0;
  v53.origin.CGFloat y = 0.0;
  CGContextDrawImage(c, v53, v19);
  CGContextSetRGBStrokeColor(c, a7, a8, a9, a10);
  CGContextSetRGBFillColor(c, a7, a8, a9, a10);
  if (a4 >= 1 && v18)
  {
    CGContextSetTextDrawingMode(c, kCGTextFill);
    long long v27 = makeCFPointer<CGColor *>;
    CGColorRef GenericRGB = CGColorCreateGenericRGB(a7, a8, a9, a10);
    ((void (*)(uint64_t@<X0>, void *@<X8>))v27)((uint64_t)GenericRGB, &v47);
    uint64_t v29 = 0;
    uint64_t v30 = a3;
    do
    {
      CGContextSetTextPosition(c, v30->origin.x, v30->origin.y);
      uint64_t v31 = makeCFPointer<CGPath *>;
      CGMutablePathRef Mutable = CGPathCreateMutable();
      ((void (*)(uint64_t@<X0>, void *@<X8>))v31)((uint64_t)Mutable, &path);
      v54.origin.CGFloat x = v30->origin.x;
      v54.size.CGFloat width = v30->size.width;
      double height = v30->size.height;
      v54.origin.CGFloat y = v30->origin.y - height;
      v54.size.double height = height + height;
      CGPathAddRect(path, 0, v54);
      long long v34 = makeCFPointer<__CTFramesetter const*>;
      CFAttributedStringRef v35 = [v18 objectAtIndexedSubscript:v29];
      CTFramesetterRef v36 = CTFramesetterCreateWithAttributedString(v35);
      ((void (*)(uint64_t@<X0>, void *@<X8>))v34)((uint64_t)v36, &cf);

      float v37 = makeCFPointer<__CTFrame const*>;
      v52.location = 0;
      v52.length = 0;
      CTFrameRef v38 = CTFramesetterCreateFrame((CTFramesetterRef)cf, v52, path, 0);
      ((void (*)(uint64_t@<X0>, void *@<X8>))v37)((uint64_t)v38, &frame);
      CTFrameDraw(frame, c);
      if (frame) {
        CFRelease(frame);
      }
      if (cf) {
        CFRelease(cf);
      }
      if (path) {
        CFRelease(path);
      }
      ++v29;
      ++v30;
    }
    while (a4 != v29);
    if (v47) {
      CFRelease(v47);
    }
  }
  CGContextSetLineWidth(c, a6);
  CGContextAddRects(c, a3, a4);
  CGContextStrokePath(c);
  float v39 = makeCFPointer<CGImage *>;
  CGImageRef Image = CGBitmapContextCreateImage(c);
  ((void (*)(uint64_t@<X0>, void *@<X8>))v39)((uint64_t)Image, &v47);
  double v41 = [CRImage alloc];
  double v42 = [(CRImage *)v41 initWithCGImage:v47 toColorSpace:1];
  if (v47) {
    CFRelease(v47);
  }
  if (c) {
    CFRelease(c);
  }
  if (space) {
    CFRelease(space);
  }

  return v42;
}

- (id)imageByOverlayingRects:(CGRect *)a3 count:(int64_t)a4
{
  return [(CRImage *)self imageByOverlayingRects:a3 count:a4 strings:0 lineWidth:3.0 red:1.0 green:0.0 blue:0.0 alpha:1.0];
}

- (id)imageByOverlayingRegions:(id)a3 strings:(id)a4 lineWidth:(double)a5 red:(double)a6 green:(double)a7 blue:(double)a8 alpha:(double)a9
{
  double v48 = a9;
  id v15 = a3;
  id v16 = a4;
  __p = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  unint64_t v17 = [v15 count];
  if (v17)
  {
    if (v17 >> 59) {
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    }
    __p = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v51, v17);
    uint64_t v50 = __p;
    uint64_t v51 = &__p[32 * v18];
  }
  for (unint64_t i = 0; i < objc_msgSend(v15, "count", *(void *)&v48); ++i)
  {
    size_t v20 = [v15 objectAtIndexedSubscript:i];
    size_t v21 = [v20 boundingQuad];
    long long v22 = [v21 denormalizedQuad];
    [v22 boundingBox];
    uint64_t v24 = v23;
    double v26 = v25;
    uint64_t v28 = v27;
    double v30 = v29;

    [(CRImage *)self size];
    double v32 = v31 - v26 - v30;
    long long v33 = v50;
    if (v50 >= v51)
    {
      CFAttributedStringRef v35 = __p;
      uint64_t v36 = (v50 - __p) >> 5;
      unint64_t v37 = v36 + 1;
      if ((unint64_t)(v36 + 1) >> 59) {
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v38 = v51 - __p;
      if ((v51 - __p) >> 4 > v37) {
        unint64_t v37 = v38 >> 4;
      }
      if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v39 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v39 = v37;
      }
      if (v39)
      {
        double v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGRect>>((uint64_t)&v51, v39);
        CFAttributedStringRef v35 = __p;
        long long v33 = v50;
      }
      else
      {
        double v40 = 0;
      }
      double v41 = (double *)&v40[32 * v36];
      *(void *)double v41 = v24;
      v41[1] = v32;
      *((void *)v41 + 2) = v28;
      v41[3] = v30;
      if (v33 == v35)
      {
        double v44 = &v40[32 * v36];
      }
      else
      {
        double v42 = &v40[32 * v36];
        do
        {
          long long v43 = *((_OWORD *)v33 - 1);
          double v44 = v42 - 32;
          *((_OWORD *)v42 - 2) = *((_OWORD *)v33 - 2);
          *((_OWORD *)v42 - 1) = v43;
          v33 -= 32;
          v42 -= 32;
        }
        while (v33 != v35);
      }
      long long v34 = (char *)(v41 + 4);
      __p = v44;
      uint64_t v51 = &v40[32 * v39];
      if (v35) {
        operator delete(v35);
      }
    }
    else
    {
      *(void *)uint64_t v50 = v24;
      *((double *)v50 + 1) = v32;
      long long v34 = v50 + 32;
      *((void *)v50 + 2) = v28;
      *((double *)v50 + 3) = v30;
    }
    uint64_t v50 = v34;
  }
  double v45 = __p;
  if (__p != v50)
  {
    uint64_t v46 = [(CRImage *)self imageByOverlayingRects:__p count:(v50 - __p) >> 5 strings:v16 lineWidth:a5 red:a6 green:a7 blue:a8 alpha:v48];
    double v45 = __p;
    if (!__p) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  uint64_t v46 = self;
  if (__p) {
LABEL_27:
  }
    operator delete(v45);
LABEL_28:

  return v46;
}

+ (void)drawVerticalLineAtXOffset:(double)a3 image:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 vImage];
    uint64_t v7 = v11;
  }
  else
  {
    uint64_t v7 = 0;
  }
  unint64_t v8 = 0;
  int v9 = llround(a3);
  uint64_t v10 = v7 + (v9 & ~(v9 >> 31));
  while ([v6 height] > v8)
    *(unsigned char *)(v10 + [v6 width] * v8++) = 125;
}

- (vImage_Buffer)vImage
{
  long long v3 = *(_OWORD *)&self[1].data;
  *(_OWORD *)&retstr->data = *(_OWORD *)&self->width;
  *(_OWORD *)&retstr->CGFloat width = v3;
  return self;
}

- (void)setVImage:(vImage_Buffer *)a3
{
  long long v3 = *(_OWORD *)&a3->width;
  *(_OWORD *)&self->_vImage.data = *(_OWORD *)&a3->data;
  *(_OWORD *)&self->_vImage.CGFloat width = v3;
}

- (void)setCiImage:(id)a3
{
}

- (void)setCgImage:(CGImage *)a3
{
  self->_cgCGImageRef Image = a3;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (int)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(int)a3
{
  self->_uint64_t colorSpace = a3;
}

- (BOOL)isFullRange
{
  return self->_isFullRange;
}

- (NSNumber)sceneStabilityMetric
{
  return self->_sceneStabilityMetric;
}

- (void)setSceneStabilityMetric:(id)a3
{
}

- (BOOL)vImageDataIsCopy
{
  return self->_vImageDataIsCopy;
}

- (void)setVImageDataIsCopy:(BOOL)a3
{
  self->_vImageDataIsCopCGFloat y = a3;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sceneStabilityMetric, 0);
  objc_storeStrong((id *)&self->_ciImage, 0);
}

@end