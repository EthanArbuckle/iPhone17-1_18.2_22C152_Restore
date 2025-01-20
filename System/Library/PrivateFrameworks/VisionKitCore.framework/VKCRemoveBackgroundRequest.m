@interface VKCRemoveBackgroundRequest
+ (VKCRemoveBackgroundRequest)requestWithImage:(CGImage *)a3 orientation:(int64_t)a4 canResize:(BOOL)a5;
- (BOOL)cropToFit;
- (BOOL)maskOnly;
- (BOOL)performInPlace;
- (CGImage)CGImage;
- (CGSize)size;
- (NSIndexSet)selectedIndexSet;
- (NSNumber)VIImageType;
- (NSNumber)animatedStickerScore;
- (NSString)identifier;
- (VKCImageAnalyzerRequest)photosRequest;
- (VKCRemoveBackgroundRequest)initWithCGImage:(CGImage *)a3;
- (VKCRemoveBackgroundRequest)initWithCGImage:(CGImage *)a3 orientation:(int64_t)a4;
- (VKCRemoveBackgroundRequest)initWithPhotosAnalyzerRequest:(id)a3;
- (__CVBuffer)pixelBuffer;
- (id)_createMADMaskRequest;
- (id)_createMADMatteRequest;
- (id)createMADRequest;
- (id)description;
- (int)MADRequestID;
- (int64_t)imageOrientation;
- (void)_createMADMatteRequest;
- (void)dealloc;
- (void)setAnimatedStickerScore:(id)a3;
- (void)setCropToFit:(BOOL)a3;
- (void)setMADRequestID:(int)a3;
- (void)setMaskOnly:(BOOL)a3;
- (void)setPerformInPlace:(BOOL)a3;
- (void)setSelectedIndexSet:(id)a3;
- (void)setVIImageType:(id)a3;
@end

@implementation VKCRemoveBackgroundRequest

- (VKCRemoveBackgroundRequest)initWithPhotosAnalyzerRequest:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VKCRemoveBackgroundRequest;
  v6 = [(VKCRemoveBackgroundRequest *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v7->_requestID = -1;
    objc_storeStrong((id *)&v7->_photosRequest, a3);
  }

  return v7;
}

+ (VKCRemoveBackgroundRequest)requestWithImage:(CGImage *)a3 orientation:(int64_t)a4 canResize:(BOOL)a5
{
  BOOL v5 = a5;
  v7 = a3;
  double Width = (double)CGImageGetWidth(a3);
  double v9 = Width * (double)CGImageGetHeight(v7);
  if (v9 > 12582912.0 && v5)
  {
    v11 = _VKSignpostLog();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB266000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Resize", (const char *)&unk_1DB3491BE, buf, 2u);
    }

    objc_super v12 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1DB266000, v12, OS_LOG_TYPE_INFO, "Signpost Begin: \"VisionKit Remove Background Resize\"", v20, 2u);
    }

    CGImageRef ScaledCGImage = vk_createScaledCGImage(v7, floor(sqrt(12582912.0 / v9) * 100.0) / 100.0);
    v7 = ScaledCGImage;
    if (ScaledCGImage) {
      CFAutorelease(ScaledCGImage);
    }
    v14 = _VKSignpostLog();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DB266000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "VisionKit Remove Background Resize", (const char *)&unk_1DB3491BE, v19, 2u);
    }

    v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1DB266000, v15, OS_LOG_TYPE_INFO, "Signpost End: \"VisionKit Remove Background Resize\"", v18, 2u);
    }
  }
  v16 = [[VKCRemoveBackgroundRequest alloc] initWithCGImage:v7 orientation:a4];
  return v16;
}

- (VKCRemoveBackgroundRequest)initWithCGImage:(CGImage *)a3 orientation:(int64_t)a4
{
  v14.receiver = self;
  v14.super_class = (Class)VKCRemoveBackgroundRequest;
  v6 = [(VKCRemoveBackgroundRequest *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

    v7->_requestID = -1;
    v7->_CGImage = CGImageRetain(a3);
    v7->_imageOrientation = a4;
    size_t Width = CGImageGetWidth(a3);
    size_t Height = CGImageGetHeight(a3);
    v7->_size.width = (double)Width;
    v7->_size.height = (double)Height;
  }
  return v7;
}

- (VKCRemoveBackgroundRequest)initWithCGImage:(CGImage *)a3
{
  return [(VKCRemoveBackgroundRequest *)self initWithCGImage:a3 orientation:0];
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  CGImageRelease(self->_CGImage);
  v3.receiver = self;
  v3.super_class = (Class)VKCRemoveBackgroundRequest;
  [(VKCRemoveBackgroundRequest *)&v3 dealloc];
}

- (__CVBuffer)pixelBuffer
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  pixelBuffer = self->_pixelBuffer;
  if (!pixelBuffer)
  {
    BOOL v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    self->_pixelBuffer = vk_ioSurfaceBackedPixelBufferFromCGImage([(VKCRemoveBackgroundRequest *)self CGImage], v5);
    CGColorSpaceRelease(v5);
    pixelBuffer = self->_pixelBuffer;
  }
  os_unfair_lock_unlock(p_lock);
  return pixelBuffer;
}

- (int)MADRequestID
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_requestID;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)setMADRequestID:(int)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_requestID = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)createMADRequest
{
  if ([(VKCRemoveBackgroundRequest *)self maskOnly]) {
    -[VKCRemoveBackgroundRequest _createMADMaskRequest](self);
  }
  else {
  objc_super v3 = -[VKCRemoveBackgroundRequest _createMADMatteRequest](self);
  }
  return v3;
}

- (id)_createMADMaskRequest
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F74650]);
    objc_super v3 = [a1 VIImageType];
    [v2 setImageType:v3];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (id)_createMADMatteRequest
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F74660]);
    objc_super v3 = [a1 VIImageType];
    [v2 setImageType:v3];

    objc_msgSend(v2, "setCropResult:", objc_msgSend(a1, "cropToFit"));
    if ([a1 performInPlace])
    {
      if (![a1 cropToFit])
      {
        uint64_t v5 = 1;
        goto LABEL_9;
      }
      v4 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.RemoveBackground");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[VKCRemoveBackgroundRequest _createMADMatteRequest](v4);
      }
    }
    uint64_t v5 = 0;
LABEL_9:
    [v2 setInPlace:v5];
    v6 = [a1 selectedIndexSet];
    [v2 setInstances:v6];

    goto LABEL_10;
  }
  id v2 = 0;
LABEL_10:
  return v2;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = [(VKCRemoveBackgroundRequest *)self identifier];
  [(VKCRemoveBackgroundRequest *)self size];
  v7 = VKMUIStringForSize(v5, v6);
  v8 = VKMUIStringForBool([(VKCRemoveBackgroundRequest *)self cropToFit]);
  uint64_t v9 = VKMUIStringForBool([(VKCRemoveBackgroundRequest *)self maskOnly]);
  v10 = [v3 stringWithFormat:@"RemoveBGRequest id: %@\n size: %@\n cropToFit: %@\n maskOnly: %@", v4, v7, v8, v9];

  return v10;
}

- (CGImage)CGImage
{
  return self->_CGImage;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (BOOL)cropToFit
{
  return self->_cropToFit;
}

- (void)setCropToFit:(BOOL)a3
{
  self->_cropToFit = a3;
}

- (BOOL)maskOnly
{
  return self->_maskOnly;
}

- (void)setMaskOnly:(BOOL)a3
{
  self->_maskOnly = a3;
}

- (NSIndexSet)selectedIndexSet
{
  return self->_selectedIndexSet;
}

- (void)setSelectedIndexSet:(id)a3
{
}

- (NSNumber)VIImageType
{
  return self->_VIImageType;
}

- (void)setVIImageType:(id)a3
{
}

- (VKCImageAnalyzerRequest)photosRequest
{
  return self->_photosRequest;
}

- (BOOL)performInPlace
{
  return self->_performInPlace;
}

- (void)setPerformInPlace:(BOOL)a3
{
  self->_performInPlace = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSNumber)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (void)setAnimatedStickerScore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedStickerScore, 0);
  objc_storeStrong((id *)&self->_VIImageType, 0);
  objc_storeStrong((id *)&self->_selectedIndexSet, 0);
  objc_storeStrong((id *)&self->_photosRequest, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)_createMADMatteRequest
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB266000, log, OS_LOG_TYPE_ERROR, "Trying to perform a remove background request with performInPlace and cropToFit set to true, this is not support, falling back to just cropToFit", v1, 2u);
}

@end