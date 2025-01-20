@interface VIImageScaler
- (VIImageScaler)init;
- (__CVBuffer)createCroppedImageWithSource:(const __CVBuffer *)a3 regionOfInterest:(CGRect)a4;
- (__CVBuffer)createImageWithSource:(const __CVBuffer *)a3 format:(unsigned int)a4;
- (__CVBuffer)createScaledImageWithSource:(const __CVBuffer *)a3 size:(CGSize)a4;
- (int)cropScaleImageFromSource:(const __CVBuffer *)a3 destination:(const __CVBuffer *)a4 normalizedBoundingBox:(CGRect)a5 bottomLeftBoxOrigin:(BOOL)a6;
- (int)cropScaleImageFromSource:(const __CVBuffer *)a3 destination:(const __CVBuffer *)a4 regionOfInterest:(CGRect)a5;
- (int)scaleImageFromSource:(const __CVBuffer *)a3 destination:(const __CVBuffer *)a4;
- (int)setFillColorBGRA:(VIImageScaler *)self;
- (int)setScalingMode:(unint64_t)a3;
- (int)setVTTransferSessionProperties:(id)a3;
- (int)unsetFillColor;
- (void)dealloc;
@end

@implementation VIImageScaler

- (VIImageScaler)init
{
  v11.receiver = self;
  v11.super_class = (Class)VIImageScaler;
  v2 = [(VIImageScaler *)&v11 init];
  v3 = v2;
  if (v2)
  {
    p_transferSession = (CFTypeRef *)&v2->_transferSession;
    if (VTPixelTransferSessionCreate(0, &v2->_transferSession))
    {
      if (*p_transferSession) {
        CFRelease(*p_transferSession);
      }
      CFTypeRef *p_transferSession = 0;
    }
    v3->useFill = 0;
    *(int32x2_t *)&v3->fillColor[3] = vdup_n_s32(0xFF000000);
    v3->scaleMode = 3;
    v3->needFill = 0;
    v3->entireImage.origin.x = 0.0;
    v3->entireImage.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v3->entireImage.size = _Q0;
  }
  return v3;
}

- (int)setScalingMode:(unint64_t)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1uLL:
      uint64_t v16 = *MEMORY[0x1E4F45168];
      uint64_t v17 = *MEMORY[0x1E4F45468];
      v5 = (void *)MEMORY[0x1E4F1C9E8];
      BOOL v6 = 1;
      v7 = &v17;
      v8 = &v16;
      goto LABEL_11;
    case 2uLL:
      uint64_t v20 = *MEMORY[0x1E4F45168];
      v21[0] = *MEMORY[0x1E4F45458];
      BOOL v6 = 1;
      objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      goto LABEL_12;
    case 3uLL:
      uint64_t v14 = *MEMORY[0x1E4F45168];
      uint64_t v15 = *MEMORY[0x1E4F45460];
      objc_super v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      BOOL v6 = 0;
      goto LABEL_12;
    case 4uLL:
      uint64_t v18 = *MEMORY[0x1E4F45168];
      uint64_t v19 = *MEMORY[0x1E4F45460];
      v5 = (void *)MEMORY[0x1E4F1C9E8];
      BOOL v6 = 1;
      v7 = &v19;
      v8 = &v18;
LABEL_11:
      objc_super v11 = [v5 dictionaryWithObjects:v7 forKeys:v8 count:1];
LABEL_12:
      int v10 = [(VIImageScaler *)self setVTTransferSessionProperties:v11];

      self->needFill = v6;
      self->scaleMode = a3;
      break;
    default:
      if (+[VILogger shouldLogMessage])
      {
        v9 = +[VILogger log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v13[0] = 67109120;
          v13[1] = a3;
          _os_log_impl(&dword_1DCCF9000, v9, OS_LOG_TYPE_ERROR, "VIImageScaler.setScalingMode unsupported scaling mode: %d", (uint8_t *)v13, 8u);
        }
      }
      int v10 = -1;
      break;
  }
  return v10;
}

- (int)setVTTransferSessionProperties:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      CFStringRef v9 = *(const __CFString **)(*((void *)&v14 + 1) + 8 * v8);
      transferSession = self->_transferSession;
      objc_super v11 = objc_msgSend(v4, "objectForKeyedSubscript:", v9, (void)v14);
      OSStatus v12 = VTSessionSetProperty(transferSession, v9, v11);

      if (v12) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    OSStatus v12 = 0;
  }

  return v12;
}

- (int)setFillColorBGRA:(VIImageScaler *)self
{
  v3.i32[0] = *(_DWORD *)&self->defaultBlackOpaqueColor[3];
  int16x4_t v5 = (int16x4_t)vmovl_u8(v3).u64[0];
  v4.i32[0] = v2;
  int8x8_t v6 = (int8x8_t)vceq_s16(v5, (int16x4_t)(*(void *)&vzip1_s8(v4, (int8x8_t)v5) & 0xFF00FF00FF00FFLL));
  if ((vminv_u8((uint8x8_t)vuzp1_s8(v6, v6)) & 0x80) != 0)
  {
    self->useFill = 0;
    uint64_t v7 = (CFTypeRef *)MEMORY[0x1E4F1CFD0];
  }
  else
  {
    self->useFill = 1;
    *(_DWORD *)&self->fillColor[3] = v2;
    uint64_t v7 = (CFTypeRef *)MEMORY[0x1E4F1CFC8];
  }
  return VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x1E4F45188], *v7);
}

- (int)unsetFillColor
{
  self->useFill = 0;
  *(_DWORD *)&self->fillColor[3] = *(_DWORD *)&self->defaultBlackOpaqueColor[3];
  return VTSessionSetProperty(self->_transferSession, (CFStringRef)*MEMORY[0x1E4F45188], (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
}

- (void)dealloc
{
  transferSession = self->_transferSession;
  if (transferSession)
  {
    VTPixelTransferSessionInvalidate(transferSession);
    int8x8_t v4 = self->_transferSession;
    if (v4) {
      CFRelease(v4);
    }
    self->_transferSession = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)VIImageScaler;
  [(VIImageScaler *)&v5 dealloc];
}

- (__CVBuffer)createScaledImageWithSource:(const __CVBuffer *)a3 size:(CGSize)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  size_t width = (unint64_t)a4.width;
  size_t height = (unint64_t)a4.height;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  CFStringRef v9 = VICreateCVPixelBufferWithFormat(width, height, PixelFormatType);
  if (v9)
  {
    int v10 = [(VIImageScaler *)self scaleImageFromSource:a3 destination:v9];
    if (v10)
    {
      int v11 = v10;
      if (+[VILogger shouldLogMessage])
      {
        OSStatus v12 = +[VILogger log];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v14[0] = 67109120;
          v14[1] = v11;
          _os_log_impl(&dword_1DCCF9000, v12, OS_LOG_TYPE_ERROR, "-scaleImageFromSource:destination: failed with error %d", (uint8_t *)v14, 8u);
        }
      }
      CVPixelBufferRelease(v9);
      return 0;
    }
  }
  return v9;
}

- (__CVBuffer)createCroppedImageWithSource:(const __CVBuffer *)a3 regionOfInterest:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  size_t v10 = VIPixelBufferSize(a3);
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  CGRect v31 = VNImageRectForNormalizedRect(v30, v10, v11);
  double v12 = v31.origin.x;
  double v13 = v31.origin.y;
  double v14 = v31.size.width;
  double v15 = v31.size.height;
  int IsPlanar = CVPixelBufferIsPlanar(a3);
  long long v17 = (void (*)(double, double, double, double))_CGRectIntegralEven;
  if (!IsPlanar) {
    long long v17 = (void (*)(double, double, double, double))MEMORY[0x1E4F1DB18];
  }
  v17(v12, v13, v14, v15);
  size_t v19 = (unint64_t)v18;
  size_t v21 = (unint64_t)v20;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  v23 = VICreateCVPixelBufferWithFormat(v19, v21, PixelFormatType);
  if (v23)
  {
    int v24 = -[VIImageScaler cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin:](self, "cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin:", a3, v23, 1, x, y, width, height);
    if (v24)
    {
      int v25 = v24;
      if (+[VILogger shouldLogMessage])
      {
        v26 = +[VILogger log];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v28[0] = 67109120;
          v28[1] = v25;
          _os_log_impl(&dword_1DCCF9000, v26, OS_LOG_TYPE_ERROR, "-cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin: failed with error %d", (uint8_t *)v28, 8u);
        }
      }
      CVPixelBufferRelease(v23);
      return 0;
    }
  }
  return v23;
}

- (__CVBuffer)createImageWithSource:(const __CVBuffer *)a3 format:(unsigned int)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  CFStringRef v9 = VICreateCVPixelBufferWithFormat(Width, Height, a4);
  int v10 = [(VIImageScaler *)self scaleImageFromSource:a3 destination:v9];
  if (v10)
  {
    int v11 = v10;
    if (+[VILogger shouldLogMessage])
    {
      double v12 = +[VILogger log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14[0] = 67109120;
        v14[1] = v11;
        _os_log_impl(&dword_1DCCF9000, v12, OS_LOG_TYPE_ERROR, "-scaleImageFromSource:destination: failed with error %d", (uint8_t *)v14, 8u);
      }
    }
    CVPixelBufferRelease(v9);
    return 0;
  }
  return v9;
}

- (int)scaleImageFromSource:(const __CVBuffer *)a3 destination:(const __CVBuffer *)a4
{
  return -[VIImageScaler cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin:](self, "cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin:", a3, a4, 0, self->entireImage.origin.x, self->entireImage.origin.y, self->entireImage.size.width, self->entireImage.size.height);
}

- (int)cropScaleImageFromSource:(const __CVBuffer *)a3 destination:(const __CVBuffer *)a4 regionOfInterest:(CGRect)a5
{
  return -[VIImageScaler cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin:](self, "cropScaleImageFromSource:destination:normalizedBoundingBox:bottomLeftBoxOrigin:", a3, a4, 1, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (int)cropScaleImageFromSource:(const __CVBuffer *)a3 destination:(const __CVBuffer *)a4 normalizedBoundingBox:(CGRect)a5 bottomLeftBoxOrigin:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  unint64_t v14 = VIPixelBufferSize(a3);
  size_t v16 = v15;
  size_t v17 = VIPixelBufferSize(a4);
  unint64_t v19 = v18;
  if (CVPixelBufferIsPlanar(a3)
    && ((v14 | v16) & 1) != 0
    && +[VILogger shouldLogMessage])
  {
    double v20 = +[VILogger log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v53) = 0;
      _os_log_impl(&dword_1DCCF9000, v20, OS_LOG_TYPE_ERROR, "VIScaler: planar odd source image is not supported", (uint8_t *)&v53, 2u);
    }
  }
  if (CVPixelBufferIsPlanar(a4)
    && ((v17 | v19) & 1) != 0
    && +[VILogger shouldLogMessage])
  {
    size_t v21 = +[VILogger log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v53) = 0;
      _os_log_impl(&dword_1DCCF9000, v21, OS_LOG_TYPE_ERROR, "VIScaler: planar odd destination image is not supported", (uint8_t *)&v53, 2u);
    }
  }
  if (+[VILogger shouldLogVerboseMessage])
  {
    v22 = +[VILogger verboseLog];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
      OSType v24 = CVPixelBufferGetPixelFormatType(a4);
      int v53 = 134219264;
      unint64_t v54 = v14;
      __int16 v55 = 2048;
      size_t v56 = v16;
      __int16 v57 = 1024;
      OSType v58 = PixelFormatType;
      __int16 v59 = 2048;
      size_t v60 = v17;
      __int16 v61 = 2048;
      unint64_t v62 = v19;
      __int16 v63 = 1024;
      OSType v64 = v24;
      _os_log_impl(&dword_1DCCF9000, v22, OS_LOG_TYPE_DEBUG, "VIScaler (w, h, pixtype): from (%zu, %zu, %d) to (%zu ,%zu, %d)", (uint8_t *)&v53, 0x36u);
    }
  }
  v66.origin.CGFloat x = x;
  v66.origin.CGFloat y = y;
  v66.size.CGFloat width = width;
  v66.size.CGFloat height = height;
  if (CGRectEqualToRect(v66, self->entireImage))
  {
    if (self->scaleMode != 4)
    {
      CFDictionaryRef DictionaryRepresentation = 0;
LABEL_29:
      CFDictionaryRef v33 = 0;
      goto LABEL_38;
    }
  }
  else
  {
    if (v6)
    {
      CGFloat x = VIFlipOriginNormalizedRect(x, y, width, height);
      CGFloat y = v26;
      CGFloat width = v27;
      CGFloat height = v28;
    }
    v67.origin.CGFloat x = x;
    v67.origin.CGFloat y = y;
    v67.size.CGFloat width = width;
    v67.size.CGFloat height = height;
    CGRect v68 = VNImageRectForNormalizedRect(v67, v14, v16);
    v69.origin.CGFloat x = VIRectIntegral(a3, 1, v68.origin.x, v68.origin.y, v68.size.width, v68.size.height);
    double v29 = v69.size.width;
    double v30 = v69.size.height;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v69);
    if (+[VILogger shouldLogVerboseMessage])
    {
      CGRect v31 = +[VILogger verboseLog];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        int v53 = 138543362;
        unint64_t v54 = (unint64_t)DictionaryRepresentation;
        _os_log_impl(&dword_1DCCF9000, v31, OS_LOG_TYPE_DEBUG, "VIScaler: sourceRectDict %{public}@", (uint8_t *)&v53, 0xCu);
      }
    }
    if (self->scaleMode != 4) {
      goto LABEL_29;
    }
    if (DictionaryRepresentation)
    {
      float v32 = v29 / v30;
      goto LABEL_31;
    }
  }
  CFDictionaryRef DictionaryRepresentation = 0;
  float v32 = (float)v14 / (float)v16;
LABEL_31:
  float v34 = (float)v17;
  float v35 = (float)v19;
  if ((float)((float)v17 / (float)v19) >= v32) {
    float v34 = v32 * v35;
  }
  else {
    float v35 = v34 / v32;
  }
  v70.origin.CGFloat x = VIRectIntegral(a4, 1, 0.0, 0.0, v34, v35);
  CFDictionaryRef v33 = CGRectCreateDictionaryRepresentation(v70);
  if (+[VILogger shouldLogVerboseMessage])
  {
    v36 = +[VILogger verboseLog];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      int v53 = 138543362;
      unint64_t v54 = (unint64_t)v33;
      _os_log_impl(&dword_1DCCF9000, v36, OS_LOG_TYPE_DEBUG, "VIScaler: destRectDict %{public}@", (uint8_t *)&v53, 0xCu);
    }
  }
LABEL_38:
  v37 = self;
  objc_sync_enter(v37);
  if (v37->useFill && v37->needFill)
  {
    int v38 = _VTModifyPixelBufferWithColor(a4, *(_DWORD *)&v37->fillColor[3]);
    if (v38 && +[VILogger shouldLogMessage])
    {
      v39 = +[VILogger log];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        int v53 = 67109120;
        LODWORD(v54) = 0;
        _os_log_impl(&dword_1DCCF9000, v39, OS_LOG_TYPE_ERROR, "Fill color failed (%d)", (uint8_t *)&v53, 8u);
      }
    }
  }
  else
  {
    int v38 = 0;
  }
  CFStringRef v40 = (const __CFString *)*MEMORY[0x1E4F45170];
  int v41 = VTSessionSetProperty(v37->_transferSession, (CFStringRef)*MEMORY[0x1E4F45170], DictionaryRepresentation) | v38;
  if (v38 != v41)
  {
    if (+[VILogger shouldLogMessage])
    {
      v42 = +[VILogger log];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v53) = 0;
        _os_log_impl(&dword_1DCCF9000, v42, OS_LOG_TYPE_ERROR, "Failed to set source crop rect property.", (uint8_t *)&v53, 2u);
      }
    }
    int v38 = v41;
  }
  CFStringRef v43 = (const __CFString *)*MEMORY[0x1E4F450F0];
  int v44 = VTSessionSetProperty(v37->_transferSession, (CFStringRef)*MEMORY[0x1E4F450F0], v33) | v41;
  if (v38 != v44)
  {
    if (+[VILogger shouldLogMessage])
    {
      v45 = +[VILogger log];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v53) = 0;
        _os_log_impl(&dword_1DCCF9000, v45, OS_LOG_TYPE_ERROR, "Failed to set destination rect property.", (uint8_t *)&v53, 2u);
      }
    }
    int v38 = v44;
  }
  CVPixelBufferRetain(a3);
  CVPixelBufferRetain(a4);
  OSStatus v46 = VTPixelTransferSessionTransferImage(v37->_transferSession, a3, a4);
  CVPixelBufferRelease(a3);
  CVPixelBufferRelease(a4);
  if (v38 != (v46 | v44))
  {
    if (+[VILogger shouldLogMessage])
    {
      v47 = +[VILogger log];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        int v53 = 67109120;
        LODWORD(v54) = v38;
        _os_log_impl(&dword_1DCCF9000, v47, OS_LOG_TYPE_ERROR, "Transfer failed (%d)", (uint8_t *)&v53, 8u);
      }
    }
    int v38 = v46 | v44;
  }
  int v48 = VTSessionSetProperty(v37->_transferSession, v40, 0) | v46 | v44;
  if (v38 != v48)
  {
    if (+[VILogger shouldLogMessage])
    {
      v49 = +[VILogger log];
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v53) = 0;
        _os_log_impl(&dword_1DCCF9000, v49, OS_LOG_TYPE_ERROR, "Failed to unset source crop property.", (uint8_t *)&v53, 2u);
      }
    }
    int v38 = v48;
  }
  int v50 = VTSessionSetProperty(v37->_transferSession, v43, 0) | v48;
  if (v38 != v50)
  {
    if (+[VILogger shouldLogMessage])
    {
      v51 = +[VILogger log];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v53) = 0;
        _os_log_impl(&dword_1DCCF9000, v51, OS_LOG_TYPE_ERROR, "Failed to unset destination rect property.", (uint8_t *)&v53, 2u);
      }
    }
    int v38 = v50;
  }
  objc_sync_exit(v37);

  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
  if (v33) {
    CFRelease(v33);
  }
  return v38;
}

@end