@interface NUAuxiliaryImageRawBuffer
- (CGImage)cgImageRef;
- (CGImageMetadata)compatibilityMetadata;
- (CGImageMetadata)metadata;
- (NSString)cgAuxIdentifier;
- (NUAuxiliaryImageRawBuffer)initWithPixelBuffer:(__CVBuffer *)a3 auxiliaryImageType:(int64_t)a4 identifier:(id)a5;
- (NUColorSpace)colorSpace;
- (__CVBuffer)pixelBuffer;
- (id)auxiliaryImageByApplyingExifOrientation:(unsigned int)a3;
- (id)auxiliaryImageByReplacingAuxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 error:(id *)a4;
- (id)auxiliaryImageByUpdatingMetadata:(CGImageMetadata *)a3;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationForAuxiliaryDataType:(id *)a3;
- (int64_t)auxiliaryImageType;
- (unsigned)pixelFormatType;
- (void)dealloc;
- (void)setCgAuxIdentifier:(id)a3;
- (void)setColorSpace:(id)a3;
- (void)setCompatibilityMetadata:(CGImageMetadata *)a3;
- (void)setMetadata:(CGImageMetadata *)a3;
- (void)setPixelBuffer:(__CVBuffer *)a3;
@end

@implementation NUAuxiliaryImageRawBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cgAuxIdentifier, 0);

  objc_storeStrong((id *)&self->_colorSpace, 0);
}

- (void)setCgAuxIdentifier:(id)a3
{
}

- (NSString)cgAuxIdentifier
{
  return self->_cgAuxIdentifier;
}

- (void)setCompatibilityMetadata:(CGImageMetadata *)a3
{
}

- (CGImageMetadata)compatibilityMetadata
{
  return self->_compatibilityMetadata;
}

- (void)setColorSpace:(id)a3
{
}

- (NUColorSpace)colorSpace
{
  return self->_colorSpace;
}

- (void)setMetadata:(CGImageMetadata *)a3
{
}

- (CGImageMetadata)metadata
{
  return self->_metadata;
}

- (void)setPixelBuffer:(__CVBuffer *)a3
{
  self->_pixelBuffer = a3;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (unsigned)pixelFormatType
{
  v2 = [(NUAuxiliaryImageRawBuffer *)self pixelBuffer];

  return CVPixelBufferGetPixelFormatType(v2);
}

- (id)dictionaryRepresentationForAuxiliaryDataType:(id *)a3
{
  unsigned int v5 = [(NUAuxiliaryImageRawBuffer *)self pixelFormatType];
  size_t Width = CVPixelBufferGetWidth([(NUAuxiliaryImageRawBuffer *)self pixelBuffer]);
  size_t Height = CVPixelBufferGetHeight([(NUAuxiliaryImageRawBuffer *)self pixelBuffer]);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow([(NUAuxiliaryImageRawBuffer *)self pixelBuffer]);
  v9 = 0;
  if (v5 && Width && Height && BytesPerRow)
  {
    v10 = [(NUAuxiliaryImageRawBuffer *)self cgAuxIdentifier];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F2F3C8]];

    if (v11) {
      v12 = [(NUAuxiliaryImageRawBuffer *)self compatibilityMetadata];
    }
    else {
      v12 = 0;
    }
    v13 = (void *)MEMORY[0x1E4F8CC38];
    v14 = [(NUAuxiliaryImageRawBuffer *)self pixelBuffer];
    v15 = [(NUAuxiliaryImageRawBuffer *)self metadata];
    v16 = [(NUAuxiliaryImageRawBuffer *)self colorSpace];
    v9 = objc_msgSend(v13, "dictionaryRepresentationForAuxiliaryImagePixelBuffer:metadata:colorSpace:compatibilityMetadata:", v14, v15, objc_msgSend(v16, "CGColorSpace"), v12);

    if (v9)
    {
      if (a3)
      {
        *a3 = [(NUAuxiliaryImageRawBuffer *)self cgAuxIdentifier];
      }
      id v17 = v9;
    }
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v4 = 0;
  v2 = [(NUAuxiliaryImageRawBuffer *)self dictionaryRepresentationForAuxiliaryDataType:&v4];

  return v2;
}

- (CGImage)cgImageRef
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(NUAuxiliaryImageRawBuffer *)self auxiliaryImageType] != 11
    && [(NUAuxiliaryImageRawBuffer *)self auxiliaryImageType] != 10)
  {
    size_t Width = CVPixelBufferGetWidth(self->_pixelBuffer);
    size_t Height = CVPixelBufferGetHeight(self->_pixelBuffer);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(self->_pixelBuffer);
    off_t DataSize = CVPixelBufferGetDataSize(self->_pixelBuffer);
    CGDataProviderDirectCallbacks imageOut = *(CGDataProviderDirectCallbacks *)byte_1F0012228;
    CVPixelBufferRef v11 = CVPixelBufferRetain(self->_pixelBuffer);
    v12 = CGDataProviderCreateDirect(v11, DataSize, &imageOut);
    v13 = +[NUColorSpace linearGrayColorSpace];
    v14 = [(NUAuxiliaryImageRawBuffer *)self cgAuxIdentifier];
    if ([v14 isEqualToString:*MEMORY[0x1E4F2F3C0]])
    {
      BOOL v15 = +[NUGlobalSettings forceMeteorPlusLinear];

      if (v15)
      {
LABEL_13:
        v6 = CGImageCreate(Width, Height, 8uLL, 8uLL, BytesPerRow, (CGColorSpaceRef)[v13 CGColorSpace], 0, v12, 0, 0, kCGRenderingIntentDefault);
        CGDataProviderRelease(v12);

        return v6;
      }
      +[NUColorSpace genericGrayGamma2_2ColorSpace];
      v13 = v14 = v13;
    }

    goto LABEL_13;
  }
  *(void *)&imageOut.version = 0;
  OSStatus v3 = VTCreateCGImageFromCVPixelBuffer([(NUAuxiliaryImageRawBuffer *)self cvPixelBufferRef], 0, (CGImageRef *)&imageOut);
  if (v3)
  {
    OSStatus v4 = v3;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_211);
    }
    unsigned int v5 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      OSStatus v19 = v4;
      _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "VTCreateCGImageFromCVPixelBuffer() failed: %d", buf, 8u);
    }
  }
  return *(CGImage **)&imageOut.version;
}

- (id)auxiliaryImageByUpdatingMetadata:(CGImageMetadata *)a3
{
  unsigned int v5 = [NUAuxiliaryImageRawBuffer alloc];
  v6 = [(NUAuxiliaryImageRawBuffer *)self pixelBuffer];
  int64_t v7 = [(NUAuxiliaryImageRawBuffer *)self auxiliaryImageType];
  v8 = [(NUAuxiliaryImageRawBuffer *)self cgAuxIdentifier];
  v9 = [(NUAuxiliaryImageRawBuffer *)v5 initWithPixelBuffer:v6 auxiliaryImageType:v7 identifier:v8];

  [(NUAuxiliaryImageRawBuffer *)v9 setMetadata:a3];
  v10 = [(NUAuxiliaryImageRawBuffer *)self colorSpace];
  [(NUAuxiliaryImageRawBuffer *)v9 setColorSpace:v10];

  [(NUAuxiliaryImageRawBuffer *)v9 setCompatibilityMetadata:[(NUAuxiliaryImageRawBuffer *)self compatibilityMetadata]];

  return v9;
}

- (id)auxiliaryImageByReplacingAuxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  v6 = [NUAuxiliaryImageRawBuffer alloc];
  int64_t v7 = [(NUAuxiliaryImageRawBuffer *)self auxiliaryImageType];
  v8 = [(NUAuxiliaryImageRawBuffer *)self cgAuxIdentifier];
  v9 = [(NUAuxiliaryImageRawBuffer *)v6 initWithPixelBuffer:a3 auxiliaryImageType:v7 identifier:v8];

  [(NUAuxiliaryImageRawBuffer *)v9 setMetadata:[(NUAuxiliaryImageRawBuffer *)self metadata]];
  v10 = [(NUAuxiliaryImageRawBuffer *)self colorSpace];
  [(NUAuxiliaryImageRawBuffer *)v9 setColorSpace:v10];

  [(NUAuxiliaryImageRawBuffer *)v9 setCompatibilityMetadata:[(NUAuxiliaryImageRawBuffer *)self compatibilityMetadata]];

  return v9;
}

- (id)auxiliaryImageByApplyingExifOrientation:(unsigned int)a3
{
  v44[1] = *MEMORY[0x1E4F143B8];
  VTSessionRef session = 0;
  CVPixelBufferRef pixelBufferOut = 0;
  if (a3 - 9 <= 0xFFFFFFF7)
  {
    id v38 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Unsupported EXIF orientation" userInfo:0];
    objc_exception_throw(v38);
  }
  size_t Width = CVPixelBufferGetWidth([(NUAuxiliaryImageRawBuffer *)self pixelBuffer]);
  size_t Height = CVPixelBufferGetHeight([(NUAuxiliaryImageRawBuffer *)self pixelBuffer]);
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType([(NUAuxiliaryImageRawBuffer *)self pixelBuffer]);
  int v8 = 0;
  int v9 = 270;
  int v10 = 1;
  int v11 = 1;
  switch(a3)
  {
    case 2u:
      int v9 = 0;
      int v12 = 0;
      int v10 = 0;
      goto LABEL_6;
    case 3u:
      int v8 = 0;
      int v12 = 0;
      int v10 = 0;
      int v9 = 180;
      goto LABEL_9;
    case 4u:
      int v12 = 0;
      int v10 = 0;
      int v9 = 180;
LABEL_6:
      int v8 = 1;
      goto LABEL_9;
    case 5u:
      goto LABEL_13;
    case 6u:
      int v10 = 0;
      int v11 = 0;
      goto LABEL_11;
    case 7u:
      int v10 = 0;
LABEL_11:
      int v9 = 90;
      int v8 = 1;
      goto LABEL_13;
    case 8u:
      int v8 = 0;
      int v11 = 0;
LABEL_13:
      int v12 = v8;
      int v8 = v11;
      size_t v13 = Height;
      break;
    default:
      int v9 = 0;
      int v12 = 0;
      int v10 = 0;
LABEL_9:
      size_t v13 = Width;
      size_t Width = Height;
      break;
  }
  uint64_t v43 = *MEMORY[0x1E4F24D20];
  v44[0] = MEMORY[0x1E4F1CC08];
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1, session);
  CFDictionaryRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v13, Width, PixelFormatType, v14, &pixelBufferOut))
  {
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_211);
    }
    v16 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A9892000, v16, OS_LOG_TYPE_ERROR, "[NUAuxiliaryImage] Failed to create rotated pixel buffer", buf, 2u);
    }
    goto LABEL_41;
  }
  id v17 = (const void *)*MEMORY[0x1E4F24BE8];
  CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
  OSStatus v18 = VTPixelRotationSessionCreate(v15, (VTPixelRotationSessionRef *)&session);
  if (v18)
  {
    OSStatus v19 = v18;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_211);
    }
    uint64_t v20 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v42 = v19;
    v21 = "[NUAuxiliaryImage] VTImageRotationSessionCreate failed (%d)";
    v22 = v20;
LABEL_48:
    _os_log_error_impl(&dword_1A9892000, v22, OS_LOG_TYPE_ERROR, v21, buf, 8u);
LABEL_40:
    CVPixelBufferRelease(pixelBufferOut);
LABEL_41:
    v31 = self;
    goto LABEL_42;
  }
  if (v9 > 179)
  {
    if (v9 == 180) {
      v23 = (CFTypeRef *)MEMORY[0x1E4F45350];
    }
    else {
      v23 = (CFTypeRef *)MEMORY[0x1E4F45358];
    }
  }
  else if (v9)
  {
    v23 = (CFTypeRef *)MEMORY[0x1E4F45360];
  }
  else
  {
    v23 = (CFTypeRef *)MEMORY[0x1E4F45348];
  }
  VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E4F450C0], *v23);
  v24 = (const void *)*MEMORY[0x1E4F1CFD0];
  VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E4F45088], (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
  VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E4F45070], v17);
  VTSessionSetProperty(session, (CFStringRef)*MEMORY[0x1E4F45078], (CFTypeRef)*MEMORY[0x1E4F1CFC8]);
  if (v8)
  {
    if (v10 | v12) {
      v25 = (CFStringRef *)MEMORY[0x1E4F450A0];
    }
    else {
      v25 = (CFStringRef *)MEMORY[0x1E4F45098];
    }
    VTSessionSetProperty(session, *v25, v24);
  }
  v26 = (OpaqueVTPixelRotationSession *)session;
  v27 = [(NUAuxiliaryImageRawBuffer *)self pixelBuffer];
  OSStatus v28 = VTPixelRotationSessionRotateImage(v26, v27, pixelBufferOut);
  if (v28)
  {
    OSStatus v29 = v28;
    if (_NULogOnceToken != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_211);
    }
    uint64_t v30 = _NULogger;
    if (!os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    *(_DWORD *)buf = 67109120;
    OSStatus v42 = v29;
    v21 = "[NUAuxiliaryImage] VTImageRotationSessionTransferImage failed (%d)";
    v22 = v30;
    goto LABEL_48;
  }
  v33 = [NUAuxiliaryImageRawBuffer alloc];
  CVPixelBufferRef v34 = pixelBufferOut;
  int64_t v35 = [(NUAuxiliaryImageRawBuffer *)self auxiliaryImageType];
  v36 = [(NUAuxiliaryImageRawBuffer *)self cgAuxIdentifier];
  v31 = [(NUAuxiliaryImageRawBuffer *)v33 initWithPixelBuffer:v34 auxiliaryImageType:v35 identifier:v36];

  [(NUAuxiliaryImageRawBuffer *)v31 setMetadata:[(NUAuxiliaryImageRawBuffer *)self metadata]];
  v37 = [(NUAuxiliaryImageRawBuffer *)self colorSpace];
  [(NUAuxiliaryImageRawBuffer *)v31 setColorSpace:v37];

  [(NUAuxiliaryImageRawBuffer *)v31 setCompatibilityMetadata:[(NUAuxiliaryImageRawBuffer *)self compatibilityMetadata]];
  CVPixelBufferRelease(pixelBufferOut);
  if (session) {
    CFRelease(session);
  }
LABEL_42:

  return v31;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  [(NUAuxiliaryImageRawBuffer *)self setMetadata:0];
  [(NUAuxiliaryImageRawBuffer *)self setCompatibilityMetadata:0];
  v3.receiver = self;
  v3.super_class = (Class)NUAuxiliaryImageRawBuffer;
  [(NUAuxiliaryImageRawBuffer *)&v3 dealloc];
}

- (NUAuxiliaryImageRawBuffer)initWithPixelBuffer:(__CVBuffer *)a3 auxiliaryImageType:(int64_t)a4 identifier:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (!v8)
  {
    CFAllocatorRef v15 = NUAssertLogger_14834();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "cgIdentifier != nil");
      *(_DWORD *)buf = 138543362;
      v33 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    OSStatus v18 = NUAssertLogger_14834();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        v25 = [v23 callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v33 = v22;
        __int16 v34 = 2114;
        int64_t v35 = v26;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      uint64_t v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v33 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageRawBuffer initWithPixelBuffer:auxiliaryImageType:identifier:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUAuxiliaryImage.m", 528, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"cgIdentifier != nil");
  }
  int v9 = v8;
  v31.receiver = self;
  v31.super_class = (Class)NUAuxiliaryImageRawBuffer;
  int v10 = [(NUAuxiliaryImageRawBuffer *)&v31 init];
  CVPixelBufferRef v11 = CVPixelBufferRetain(a3);
  v10->_auxiliaryImageType = a4;
  v10->_pixelBuffer = v11;
  uint64_t v12 = [v9 copy];
  cgAuxIdentifier = v10->_cgAuxIdentifier;
  v10->_cgAuxIdentifier = (NSString *)v12;

  return v10;
}

@end