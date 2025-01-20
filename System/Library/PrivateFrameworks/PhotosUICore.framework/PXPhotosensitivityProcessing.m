@interface PXPhotosensitivityProcessing
+ (BOOL)isSupported;
- (BOOL)forceEnable;
- (PSEVideoProcessor)lock_processor;
- (PXPhotosensitivityProcessing)init;
- (__CVBuffer)_lock_processPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4;
- (__CVBuffer)copyAndProcessPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4;
- (__CVPixelBufferPool)_lock_poolForSize:(CGSize)a3;
- (void)dealloc;
- (void)setForceEnable:(BOOL)a3;
@end

@implementation PXPhotosensitivityProcessing

- (void).cxx_destruct
{
}

- (void)setForceEnable:(BOOL)a3
{
  self->_forceEnable = a3;
}

- (BOOL)forceEnable
{
  return self->_forceEnable;
}

- (__CVPixelBufferPool)_lock_poolForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v15[5] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  lock_pool = self->_lock_pool;
  double v7 = self->_lock_poolSize.height;
  if (self->_lock_poolSize.width != width || v7 != height)
  {
    if (lock_pool)
    {
      CVPixelBufferPoolRelease(self->_lock_pool);
      self->_lock_pool = 0;
    }
    self->_lock_poolSize.double width = width;
    self->_lock_poolSize.double height = height;
    uint64_t v9 = *MEMORY[0x1E4F24D20];
    v14[0] = *MEMORY[0x1E4F24D40];
    v14[1] = v9;
    v15[0] = MEMORY[0x1E4F1CC38];
    v15[1] = MEMORY[0x1E4F1CC08];
    v14[2] = *MEMORY[0x1E4F24E10];
    v10 = objc_msgSend(NSNumber, "numberWithDouble:", width, v7);
    v15[2] = v10;
    v14[3] = *MEMORY[0x1E4F24D08];
    v11 = [NSNumber numberWithDouble:height];
    v14[4] = *MEMORY[0x1E4F24D70];
    v15[3] = v11;
    v15[4] = &unk_1F02D5C50;
    CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];

    CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, v12, &self->_lock_pool);
    lock_pool = self->_lock_pool;
  }
  return lock_pool;
}

- (__CVBuffer)_lock_processPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  if (([MEMORY[0x1E4F91380] needsProcessing] & 1) != 0
    || [(PXPhotosensitivityProcessing *)self forceEnable])
  {
    IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a3);
    if (IOSurface)
    {
      IOSurfaceRef v8 = IOSurface;
      uint64_t v9 = [(PXPhotosensitivityProcessing *)self lock_processor];
      if ([v9 canProcessSurface:v8])
      {
        double Width = (double)CVPixelBufferGetWidth(a3);
        v11 = -[PXPhotosensitivityProcessing _lock_poolForSize:](self, "_lock_poolForSize:", Width, (double)CVPixelBufferGetHeight(a3));
        if (!v11) {
          PXAssertGetLog();
        }
        *(void *)pixelBufferOut = 0;
        if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v11, (CVPixelBufferRef *)pixelBufferOut))
        {
          PXAssertGetLog();
        }
        IOSurfaceRef v15 = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)pixelBufferOut);
        if (!v15) {
          PXAssertGetLog();
        }
        IOSurfaceRef v16 = v15;
        CFDictionaryRef v17 = CVBufferCopyAttachments(a3, kCVAttachmentMode_ShouldPropagate);
        CVBufferSetAttachments(*(CVBufferRef *)pixelBufferOut, v17, kCVAttachmentMode_ShouldPropagate);
        CFRelease(v17);
        [v9 processSourceSurface:v8 withTimestamp:v16 toDestinationSurface:&unk_1F02DA898 options:a4];
        CFDictionaryRef v12 = *(__CVBuffer **)pixelBufferOut;
        goto LABEL_16;
      }
      v13 = PLUIGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pixelBufferOut = 138412290;
        *(void *)&pixelBufferOut[4] = v8;
        _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_ERROR, "PXPhotosensitivityProcessing cannot process surface %@", pixelBufferOut, 0xCu);
      }
    }
    else
    {
      uint64_t v9 = PLUIGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)pixelBufferOut = 138412290;
        *(void *)&pixelBufferOut[4] = a3;
        _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_ERROR, "PXPhotosensitivityProcessing unable to get surface from %@", pixelBufferOut, 0xCu);
      }
    }
    CFDictionaryRef v12 = 0;
LABEL_16:

    return v12;
  }
  return 0;
}

- (__CVBuffer)copyAndProcessPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  IOSurfaceRef v8 = [(PXPhotosensitivityProcessing *)self _lock_processPixelBuffer:a3 timestamp:a4];
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (PSEVideoProcessor)lock_processor
{
  os_unfair_lock_assert_owner(&self->_lock);
  lock_processor = self->_lock_processor;
  if (!lock_processor)
  {
    v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)IOSurfaceRef v8 = 0;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_INFO, "PXPhotosensitivityProcessing creating PSEVideoProcessor for dimming flashing lights", v8, 2u);
    }

    v5 = (PSEVideoProcessor *)objc_alloc_init(MEMORY[0x1E4F91380]);
    v6 = self->_lock_processor;
    self->_lock_processor = v5;

    lock_processor = self->_lock_processor;
  }
  return lock_processor;
}

- (void)dealloc
{
  CVPixelBufferPoolRelease(self->_lock_pool);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosensitivityProcessing;
  [(PXPhotosensitivityProcessing *)&v3 dealloc];
}

- (PXPhotosensitivityProcessing)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosensitivityProcessing;
  result = [(PXPhotosensitivityProcessing *)&v3 init];
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

+ (BOOL)isSupported
{
  return 1;
}

@end