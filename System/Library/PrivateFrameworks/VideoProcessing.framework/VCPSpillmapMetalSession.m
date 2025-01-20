@interface VCPSpillmapMetalSession
- (VCPSpillmapMetalSession)init;
- (id).cxx_construct;
- (id)loadTexture:(__CVBuffer *)a3 withAttributes:(id)a4 forPlane:(unsigned int)a5 withCache:(__CVMetalTextureCache *)a6 withFormat:(unint64_t)a7;
- (int)calculateDrmSpillmapMetal:(__CVBuffer *)a3 emitSpillmap:(__CVBuffer *)a4 setLayout:(int)a5;
- (int)configureGPU;
- (int)configureIntermediateTextureProcessing:(int)a3 setHeight:(int)a4 setSigma:(float)a5;
- (int)configureSession:(__IOSurface *)a3 setWidth:(int)a4 setHeight:(int)a5;
@end

@implementation VCPSpillmapMetalSession

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gaussianBlur, 0);
  objc_storeStrong((id *)&self->_intermediateImageDescriptor, 0);
  objc_storeStrong((id *)&self->_readWriteAttributes, 0);
  objc_storeStrong((id *)&self->_readAttributes, 0);
  sub_1BB9C4888((const void **)&self->_textureCacheSpillmap.value_);
  sub_1BB9C4888((const void **)&self->_textureCacheBGRA.value_);
  sub_1BB9BE228((const void **)&self->_spillmapBufferProperties.value_);
  sub_1BB9C1B6C((const void **)&self->_spillBufferPoolHDCPType1.value_);
  sub_1BB9C1B6C((const void **)&self->_spillBufferPoolHDCPType0.value_);
  sub_1BB9C1B6C((const void **)&self->_spillBufferPoolScreenScrapingProtected.value_);
  sub_1BB9C1B6C((const void **)&self->_spillBufferPoolUnprotected.value_);
  objc_storeStrong((id *)&self->_bilinearScale, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (int)calculateDrmSpillmapMetal:(__CVBuffer *)a3 emitSpillmap:(__CVBuffer *)a4 setLayout:(int)a5
{
  v9 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  CVPixelBufferGetIOSurface(a3);
  unint64_t ProtectionOptions = IOSurfaceGetProtectionOptions();
  [v9 setProtectionOptions:ProtectionOptions];
  if (ProtectionOptions >= 8 || ((0x8Bu >> ProtectionOptions) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unsupported frame protection option", buf, 2u);
    }
    int v11 = -666;
    goto LABEL_6;
  }
  if (!(unsigned __int16)CVPixelBufferPoolCreatePixelBuffer(0, *(CVPixelBufferPoolRef *)((char *)&self->super.isa + qword_1BBB77C70[ProtectionOptions]), a4))
  {
    v13 = [(VCPSpillmapMetalSession *)self loadTexture:*a4 withAttributes:self->_readWriteAttributes forPlane:0 withCache:self->_textureCacheSpillmap.value_ withFormat:81];
    if (!v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create spillmap texture from cache\n", buf, 2u);
      }
      int v11 = -26525;
      goto LABEL_57;
    }
    int v63 = 0;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    *(_OWORD *)buf = 0u;
    uint64_t v55 = 116;
    CVPixelBufferGetIOSurface(a3);
    if (IOSurfaceGetBulkAttachments()) {
      int v14 = 2;
    }
    else {
      int v14 = 0;
    }
    IOSurface = CVPixelBufferGetIOSurface(*a4);
    char v54 = 13;
    int v11 = IOSurfaceSetBulkAttachments();
    if (v11)
    {
LABEL_57:

      goto LABEL_6;
    }
    signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (PixelFormatType > 1111970368)
    {
      if (PixelFormatType <= 1885745711)
      {
        if (PixelFormatType == 1111970369)
        {
          uint64_t v21 = 80;
          goto LABEL_39;
        }
        if (PixelFormatType != 1882468912) {
          goto LABEL_59;
        }
      }
      else if (PixelFormatType != 1885745712)
      {
        if (PixelFormatType == 2016686640 || PixelFormatType == 2019963440)
        {
          uint64_t v18 = 525;
          BOOL v19 = v14 == 8;
          uint64_t v20 = 505;
          goto LABEL_36;
        }
        goto LABEL_59;
      }
    }
    else
    {
      if (PixelFormatType <= 645428783)
      {
        if (PixelFormatType != 641230384)
        {
          int v17 = 641234480;
LABEL_31:
          if (PixelFormatType == v17) {
            goto LABEL_32;
          }
LABEL_59:
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v50 = 0;
            _os_log_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unsupported pixel format", v50, 2u);
          }
          int v11 = -666;
          goto LABEL_57;
        }
LABEL_32:
        BOOL v19 = v14 == 8;
        uint64_t v18 = 520;
        uint64_t v20 = 500;
        goto LABEL_36;
      }
      if (PixelFormatType != 645428784)
      {
        if (PixelFormatType != 875704422)
        {
          int v17 = 875704438;
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
    uint64_t v18 = 528;
    BOOL v19 = v14 == 8;
    uint64_t v20 = 508;
LABEL_36:
    if (v19) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = v18;
    }
LABEL_39:
    uint64_t v22 = [(VCPSpillmapMetalSession *)self loadTexture:a3 withAttributes:self->_readAttributes forPlane:0 withCache:self->_textureCacheBGRA.value_ withFormat:v21];
    v23 = (void *)v22;
    if (!v22)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v50 = 0;
        _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create BGRA texture from cache\n", v50, 2u);
      }
      int v11 = -26525;
      goto LABEL_56;
    }
    v45 = (void *)v22;
    NSUInteger v24 = [(MTLTextureDescriptor *)self->_intermediateImageDescriptor width];
    NSUInteger v46 = [(MTLTextureDescriptor *)self->_intermediateImageDescriptor height];
    unint64_t v25 = [(MTLTextureDescriptor *)self->_intermediateImageDescriptor width];
    size_t Width = CVPixelBufferGetWidth(a3);
    unint64_t v27 = [(MTLTextureDescriptor *)self->_intermediateImageDescriptor height];
    size_t Height = CVPixelBufferGetHeight(a3);
    float v29 = (float)((float)v25 / (float)Width) + (float)((float)v25 / (float)Width);
    if (a5 != 1) {
      float v29 = (float)v25 / (float)Width;
    }
    if (a5 == 2)
    {
      float v29 = (float)v25 / (float)Width;
      float v30 = (float)((float)v27 / (float)Height) + (float)((float)v27 / (float)Height);
    }
    else
    {
      float v30 = (float)v27 / (float)Height;
    }
    *(double *)v50 = v29;
    double v51 = v30;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    [(MPSImageBilinearScale *)self->_bilinearScale setScaleTransform:v50];
    memset(v49, 0, 24);
    bilinearScale = self->_bilinearScale;
    v49[3] = v24;
    v49[4] = v46;
    v49[5] = 1;
    [(MPSImageBilinearScale *)bilinearScale setClipRect:v49];
    v32 = [MEMORY[0x1E4F35978] temporaryImageWithCommandBuffer:v9 textureDescriptor:self->_intermediateImageDescriptor];
    v47 = v32;
    if (v32)
    {
      v33 = self->_bilinearScale;
      v34 = [v32 texture];
      [(MPSImageBilinearScale *)v33 encodeToCommandBuffer:v9 sourceTexture:v45 destinationTexture:v34];

      v35 = [MEMORY[0x1E4F35978] temporaryImageWithCommandBuffer:v9 textureDescriptor:self->_intermediateImageDescriptor];
      if (v35)
      {
        gaussianBlur = self->_gaussianBlur;
        v37 = [v47 texture];
        v38 = [v35 texture];
        [(MPSImageGaussianBlur *)gaussianBlur encodeToCommandBuffer:v9 sourceTexture:v37 destinationTexture:v38];

        LODWORD(v37) = IOSurfaceGetWidth(IOSurface);
        int v39 = IOSurfaceGetHeight(IOSurface);
        unint64_t v40 = [(MTLTextureDescriptor *)self->_intermediateImageDescriptor width];
        unint64_t v41 = [(MTLTextureDescriptor *)self->_intermediateImageDescriptor height];
        *(double *)v50 = (float)((float)(int)v37 / (float)v40);
        double v51 = (float)((float)v39 / (float)v41);
        uint64_t v52 = 0;
        uint64_t v53 = 0;
        [(MPSImageBilinearScale *)self->_bilinearScale setScaleTransform:v50];
        memset(v48, 0, 24);
        v42 = self->_bilinearScale;
        v48[3] = (int)v37;
        v48[4] = v39;
        v48[5] = 1;
        [(MPSImageBilinearScale *)v42 setClipRect:v48];
        v43 = self->_bilinearScale;
        v44 = [v35 texture];
        [(MPSImageBilinearScale *)v43 encodeToCommandBuffer:v9 sourceTexture:v44 destinationTexture:v13];

        if (([v9 commitAndWaitUntilSubmitted] & 1) == 0) {
          [v9 waitUntilScheduled];
        }
        int v11 = 0;
        goto LABEL_55;
      }
    }
    else
    {
      v35 = 0;
    }
    int v11 = -12904;
LABEL_55:

    v23 = v45;
LABEL_56:

    goto LABEL_57;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to create spillmap pixel buffer from pool\n", buf, 2u);
  }
  int v11 = -26525;
LABEL_6:

  return v11;
}

- (id)loadTexture:(__CVBuffer *)a3 withAttributes:(id)a4 forPlane:(unsigned int)a5 withCache:(__CVMetalTextureCache *)a6 withFormat:(unint64_t)a7
{
  CFDictionaryRef v11 = (const __CFDictionary *)a4;
  CFTypeRef cf = 0;
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, a5);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, a5);
  if (CVMetalTextureCacheCreateTextureFromImage(0, a6, a3, v11, (MTLPixelFormat)a7, WidthOfPlane, HeightOfPlane, a5, (CVMetalTextureRef *)&cf))
  {
    int v14 = 0;
  }
  else
  {
    int v14 = CVMetalTextureGetTexture((CVMetalTextureRef)cf);
  }
  sub_1BB9C14A0(&cf);

  return v14;
}

- (int)configureIntermediateTextureProcessing:(int)a3 setHeight:(int)a4 setSigma:(float)a5
{
  v7 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:81 width:a3 height:a4 mipmapped:0];
  intermediateImageDescriptor = self->_intermediateImageDescriptor;
  self->_intermediateImageDescriptor = v7;

  [(MTLTextureDescriptor *)self->_intermediateImageDescriptor setUsage:3];
  if (!self->_intermediateImageDescriptor) {
    return -12904;
  }
  id v9 = objc_alloc(MEMORY[0x1E4F35588]);
  *(float *)&double v10 = a5;
  CFDictionaryRef v11 = (MPSImageGaussianBlur *)[v9 initWithDevice:self->_device sigma:v10];
  gaussianBlur = self->_gaussianBlur;
  self->_gaussianBlur = v11;

  v13 = self->_gaussianBlur;
  if (v13)
  {
    [(MPSImageGaussianBlur *)v13 setEdgeMode:1];
    return 0;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to initialize gaussian filter\n", v15, 2u);
    }
    return -26525;
  }
}

- (int)configureSession:(__IOSurface *)a3 setWidth:(int)a4 setHeight:(int)a5
{
  if (a3)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    CFTypeRef cf = Mutable;
    if (!Mutable) {
      goto LABEL_24;
    }
    id v9 = Mutable;
    LODWORD(valuePtr[0]) = a4;
    CFNumberRef v10 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v10)
    {
      CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F2F2C0], v10);
      CFRelease(v10);
    }
    LODWORD(valuePtr[0]) = a5;
    CFNumberRef v11 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v11)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)cf, (const void *)*MEMORY[0x1E4F2F0E8], v11);
      CFRelease(v11);
    }
    valuePtr[0] = (const void *)1111970369;
    CFNumberRef v12 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
    if (v12)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)cf, (const void *)*MEMORY[0x1E4F2F150], v12);
      CFRelease(v12);
    }
    LODWORD(valuePtr[0]) = 4 * a4;
    CFNumberRef v13 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v13)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)cf, (const void *)*MEMORY[0x1E4F2EFE0], v13);
      CFRelease(v13);
    }
    LODWORD(valuePtr[0]) = 4;
    CFNumberRef v14 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
    if (v14)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)cf, (const void *)*MEMORY[0x1E4F2EFD8], v14);
      CFRelease(v14);
    }
    valuePtr[0] = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    p_spillmapBufferProperties = &self->_spillmapBufferProperties;
    sub_1BB9C57D0((const void **)&self->_spillmapBufferProperties.value_, valuePtr);
    sub_1BB9BE228(valuePtr);
    value = self->_spillmapBufferProperties.value_;
    if (value)
    {
      LODWORD(valuePtr[0]) = a4;
      CFNumberRef v17 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
      if (v17)
      {
        CFDictionarySetValue(value, (const void *)*MEMORY[0x1E4F24E10], v17);
        CFRelease(v17);
      }
      uint64_t v18 = p_spillmapBufferProperties->value_;
      LODWORD(valuePtr[0]) = a5;
      CFNumberRef v19 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
      if (v19)
      {
        CFDictionarySetValue(v18, (const void *)*MEMORY[0x1E4F24D08], v19);
        CFRelease(v19);
      }
      uint64_t v20 = p_spillmapBufferProperties->value_;
      valuePtr[0] = (const void *)1111970369;
      CFNumberRef v21 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
      if (v21)
      {
        CFDictionarySetValue(v20, (const void *)*MEMORY[0x1E4F24D70], v21);
        CFRelease(v21);
      }
      valuePtr[0] = 0;
      CFNumberRef v22 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
      v23 = (const void *)*MEMORY[0x1E4F2F280];
      if (v22)
      {
        CFDictionarySetValue((CFMutableDictionaryRef)cf, (const void *)*MEMORY[0x1E4F2F280], v22);
        CFRelease(v22);
      }
      NSUInteger v24 = p_spillmapBufferProperties->value_;
      CFTypeRef v51 = cf;
      if (cf)
      {
        CFRetain(cf);
        unint64_t v25 = v51;
      }
      else
      {
        unint64_t v25 = 0;
      }
      unint64_t v27 = (const void *)*MEMORY[0x1E4F24D20];
      CFDictionarySetValue(v24, (const void *)*MEMORY[0x1E4F24D20], v25);
      sub_1BB9BE228(&v51);
      v28 = self->_spillBufferPoolUnprotected.value_;
      float v29 = self->_spillmapBufferProperties.value_;
      if (v28)
      {
        CFRelease(v28);
        self->_spillBufferPoolUnprotected.value_ = 0;
      }
      CVReturn v26 = CVPixelBufferPoolCreate(0, 0, v29, &self->_spillBufferPoolUnprotected.value_);
      if (!v26)
      {
        float v30 = (__CFDictionary *)cf;
        valuePtr[0] = (const void *)1;
        CFNumberRef v31 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
        if (v31)
        {
          CFDictionarySetValue(v30, v23, v31);
          CFRelease(v31);
        }
        v32 = p_spillmapBufferProperties->value_;
        CFTypeRef v50 = cf;
        if (cf)
        {
          CFRetain(cf);
          v33 = v50;
        }
        else
        {
          v33 = 0;
        }
        CFDictionarySetValue(v32, v27, v33);
        sub_1BB9BE228(&v50);
        v34 = self->_spillBufferPoolScreenScrapingProtected.value_;
        v35 = self->_spillmapBufferProperties.value_;
        if (v34)
        {
          CFRelease(v34);
          self->_spillBufferPoolScreenScrapingProtected.value_ = 0;
        }
        CVReturn v26 = CVPixelBufferPoolCreate(0, 0, v35, &self->_spillBufferPoolScreenScrapingProtected.value_);
        if (!v26)
        {
          v36 = (__CFDictionary *)cf;
          valuePtr[0] = (const void *)3;
          CFNumberRef v37 = CFNumberCreate(0, kCFNumberSInt64Type, valuePtr);
          if (v37)
          {
            CFDictionarySetValue(v36, v23, v37);
            CFRelease(v37);
          }
          v38 = p_spillmapBufferProperties->value_;
          CFTypeRef v39 = cf;
          CFTypeRef v49 = cf;
          if (cf) {
            CFRetain(cf);
          }
          CFDictionarySetValue(v38, v27, v39);
          sub_1BB9BE228(&v49);
          unint64_t v40 = self->_spillBufferPoolHDCPType0.value_;
          unint64_t v41 = self->_spillmapBufferProperties.value_;
          if (v40)
          {
            CFRelease(v40);
            self->_spillBufferPoolHDCPType0.value_ = 0;
          }
          CVReturn v26 = CVPixelBufferPoolCreate(0, 0, v41, &self->_spillBufferPoolHDCPType0.value_);
          if (!v26)
          {
            sub_1BB9C5814((__CFDictionary *)cf, v23);
            v42 = p_spillmapBufferProperties->value_;
            CFTypeRef v43 = cf;
            CFTypeRef v48 = cf;
            if (cf) {
              CFRetain(cf);
            }
            CFDictionarySetValue(v42, v27, v43);
            sub_1BB9BE228(&v48);
            v44 = self->_spillBufferPoolHDCPType1.value_;
            NSUInteger v46 = self->_spillmapBufferProperties.value_;
            p_spillBufferPoolHDCPType1 = &self->_spillBufferPoolHDCPType1;
            if (v44)
            {
              CFRelease(v44);
              p_spillBufferPoolHDCPType1->value_ = 0;
            }
            CVReturn v26 = CVPixelBufferPoolCreate(0, 0, v46, &p_spillBufferPoolHDCPType1->value_);
          }
        }
      }
    }
    else
    {
LABEL_24:
      CVReturn v26 = -12904;
    }
    sub_1BB9BE228(&cf);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      LOWORD(valuePtr[0]) = 0;
      _os_log_error_impl(&dword_1BB9B9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Source iosurface is unavailable\n", (uint8_t *)valuePtr, 2u);
    }
    return -26525;
  }
  return v26;
}

- (int)configureGPU
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v3;

  v5 = self->_device;
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return -26525;
    }
    *(_WORD *)CFNumberRef v21 = 0;
    CFNumberRef v19 = MEMORY[0x1E4F14500];
    uint64_t v20 = "Unable to get metal device\n";
LABEL_21:
    _os_log_error_impl(&dword_1BB9B9000, v19, OS_LOG_TYPE_ERROR, v20, v21, 2u);
    return -26525;
  }
  v6 = (MTLCommandQueue *)[(MTLDevice *)v5 newCommandQueue];
  commandQueue = self->_commandQueue;
  self->_commandQueue = v6;

  if (!self->_commandQueue)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return -26525;
    }
    *(_WORD *)CFNumberRef v21 = 0;
    CFNumberRef v19 = MEMORY[0x1E4F14500];
    uint64_t v20 = "Unable to get command queue\n";
    goto LABEL_21;
  }
  v8 = (MPSImageBilinearScale *)[objc_alloc(MEMORY[0x1E4F35548]) initWithDevice:self->_device];
  bilinearScale = self->_bilinearScale;
  self->_bilinearScale = v8;

  if (!self->_bilinearScale)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CFNumberRef v21 = 0;
      CFNumberRef v19 = MEMORY[0x1E4F14500];
      uint64_t v20 = "Unable to initialize bilinear scaling filter\n";
      goto LABEL_21;
    }
    return -26525;
  }
  value = self->_textureCacheBGRA.value_;
  CFNumberRef v11 = self->_device;
  if (value)
  {
    CFRelease(value);
    self->_textureCacheBGRA.value_ = 0;
  }
  int result = CVMetalTextureCacheCreate(0, 0, v11, 0, &self->_textureCacheBGRA.value_);
  if (!result)
  {
    CFNumberRef v13 = self->_textureCacheSpillmap.value_;
    CFNumberRef v14 = self->_device;
    if (v13)
    {
      CFRelease(v13);
      self->_textureCacheSpillmap.value_ = 0;
    }
    int result = CVMetalTextureCacheCreate(0, 0, v14, 0, &self->_textureCacheSpillmap.value_);
    if (!result)
    {
      if (!self->_readAttributes)
      {
        uint64_t v24 = *MEMORY[0x1E4F24C88];
        v25[0] = &unk_1F14F43D8;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
        readAttributes = self->_readAttributes;
        self->_readAttributes = v15;
      }
      if (!self->_readWriteAttributes)
      {
        uint64_t v22 = *MEMORY[0x1E4F24C88];
        v23 = &unk_1F14F43F0;
        CFNumberRef v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        readWriteAttributes = self->_readWriteAttributes;
        self->_readWriteAttributes = v17;
      }
      return 0;
    }
  }
  return result;
}

- (VCPSpillmapMetalSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)VCPSpillmapMetalSession;
  v2 = [(VCPSpillmapMetalSession *)&v6 init];
  v3 = v2;
  if (v2 && ![(VCPSpillmapMetalSession *)v2 configureGPU]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }

  return v4;
}

@end