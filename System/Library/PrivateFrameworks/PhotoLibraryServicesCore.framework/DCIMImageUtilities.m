@interface DCIMImageUtilities
+ (BOOL)generateThumbnailsFromData:(id)a3 inputSize:(CGSize)a4 preCropLargeThumbnailSize:(CGSize)a5 postCropLargeThumbnailSize:(CGSize)a6 preCropSmallThumbnailSize:(CGSize)a7 postCropSmallThumbnailSize:(CGSize)a8 outSmallThumbnailImageRef:(CGImage *)a9 outLargeThumbnailImageRef:(CGImage *)a10 outLargeThumbnailJPEGData:(id *)a11;
@end

@implementation DCIMImageUtilities

+ (BOOL)generateThumbnailsFromData:(id)a3 inputSize:(CGSize)a4 preCropLargeThumbnailSize:(CGSize)a5 postCropLargeThumbnailSize:(CGSize)a6 preCropSmallThumbnailSize:(CGSize)a7 postCropSmallThumbnailSize:(CGSize)a8 outSmallThumbnailImageRef:(CGImage *)a9 outLargeThumbnailImageRef:(CGImage *)a10 outLargeThumbnailJPEGData:(id *)a11
{
  CGFloat height = a8.height;
  CGFloat width = a8.width;
  double v14 = a7.height;
  double v15 = a7.width;
  double v16 = a5.height;
  double v17 = a5.width;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  unint64_t v20 = *(void *)&height | (unint64_t)a9;
  if (v17 >= v16) {
    double v21 = v17;
  }
  else {
    double v21 = v16;
  }
  if (v15 >= v14) {
    double v22 = v15;
  }
  else {
    double v22 = v14;
  }
  if (!v20) {
    double v21 = v22;
  }
  uint64_t v23 = (int)v21;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v25 = *MEMORY[0x1E4F1CFD0];
  [v24 setObject:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F56288]];
  [v24 setObject:v25 forKey:*MEMORY[0x1E4F56298]];
  v26 = [MEMORY[0x1E4F28ED0] numberWithInt:v23];
  [v24 setObject:v26 forKey:*MEMORY[0x1E4F562A8]];

  if (v20)
  {
    int CVPixelBufferFromImageData = PFFigCreateCVPixelBufferFromImageData();
    if (!CVPixelBufferFromImageData)
    {
      int CGImageFromImageData = 0;
      goto LABEL_18;
    }
    int CGImageFromImageData = CVPixelBufferFromImageData;
    v29 = PLBackendGetLog();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v30 = NSStringFromSelector(a2);
    buf[0] = 138412802;
    *(void *)&buf[1] = v30;
    __int16 v36 = 2048;
    uint64_t v37 = CGImageFromImageData;
    __int16 v38 = 2048;
    uint64_t v39 = [v19 length];
    v31 = "PFFigCreateCVPixelBufferFromImageData %@ returned %ld from %lu";
    goto LABEL_16;
  }
  int CGImageFromImageData = PFFigCreateCGImageFromImageData();
  if (CGImageFromImageData)
  {
    v29 = PLBackendGetLog();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:

      goto LABEL_18;
    }
    v30 = NSStringFromSelector(a2);
    buf[0] = 138412802;
    *(void *)&buf[1] = v30;
    __int16 v36 = 2048;
    uint64_t v37 = CGImageFromImageData;
    __int16 v38 = 2048;
    uint64_t v39 = [v19 length];
    v31 = "PFFigCreateCGImageFromImageData %@ returned %ld from %lu";
LABEL_16:
    _os_log_impl(&dword_19BCFB000, v29, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)buf, 0x20u);

    goto LABEL_17;
  }
LABEL_18:
  if (width != 0.0 && !CGImageFromImageData) {
    **(void **)&CGFloat width = 0;
  }
  if (height != 0.0 && !CGImageFromImageData) {
    **(void **)&CGFloat height = 0;
  }
  BOOL v32 = *(void *)&height != 0;
  if (CGImageFromImageData) {
    BOOL v33 = 0;
  }
  else {
    BOOL v33 = *(void *)&width == 0;
  }

  return v33 && !v32;
}

@end