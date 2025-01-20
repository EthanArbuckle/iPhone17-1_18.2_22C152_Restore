@interface PFExportGIFRequest
+ (BOOL)_exportGIFToURL:(id)a3 request:(id)a4 progress:(id)a5 error:(id *)a6;
+ (CGImage)_createProcessedGIFImage:(opaqueCMSampleBuffer *)a3 options:(id)a4 transform:(CGAffineTransform *)a5 error:(id *)a6;
+ (OS_dispatch_queue)_exportQueue;
+ (id)runExport:(id)a3 toURL:(id)a4 completion:(id)a5;
+ (opaqueCMSampleBuffer)_copyNextSampleBuffer:(id)a3 reader:(id)a4 time:(id *)a5 didReachEnd:(BOOL *)a6 error:(id *)a7;
+ (void)runExport:(id)a3 toURL:(id)a4 progress:(id)a5 completion:(id)a6;
- (BOOL)isSynchronous;
- (BOOL)shouldDither;
- (NSURL)videoURL;
- (PFExportGIFRequest)initWithVideoURL:(id)a3;
- (double)ditherDepth;
- (double)maximumFrameRate;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)maximumFrameSize;
- (void)_ensureValidInputs;
- (void)setDitherDepth:(double)a3;
- (void)setMaximumFrameRate:(double)a3;
- (void)setMaximumFrameSize:(unint64_t)a3;
- (void)setShouldDither:(BOOL)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setVideoURL:(id)a3;
@end

@implementation PFExportGIFRequest

- (void).cxx_destruct
{
}

- (void)setVideoURL:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (BOOL)isSynchronous
{
  return self->_synchronous;
}

- (void)setMaximumFrameSize:(unint64_t)a3
{
  self->_maximumFrameSize = a3;
}

- (unint64_t)maximumFrameSize
{
  return self->_maximumFrameSize;
}

- (void)setMaximumFrameRate:(double)a3
{
  self->_maximumFrameRate = a3;
}

- (double)maximumFrameRate
{
  return self->_maximumFrameRate;
}

- (void)setDitherDepth:(double)a3
{
  self->_ditherDepth = a3;
}

- (double)ditherDepth
{
  return self->_ditherDepth;
}

- (void)setShouldDither:(BOOL)a3
{
  self->_shouldDither = a3;
}

- (BOOL)shouldDither
{
  return self->_shouldDither;
}

- (void)_ensureValidInputs
{
  double ditherDepth = self->_ditherDepth;
  if (ditherDepth < 0.0) {
    double ditherDepth = 0.0;
  }
  double v3 = fmin(self->_maximumFrameRate, 100.0);
  if (v3 <= 0.0) {
    double v3 = 30.0;
  }
  self->_double ditherDepth = ditherDepth;
  self->_maximumFrameRate = v3;
  unint64_t maximumFrameSize = self->_maximumFrameSize;
  if (maximumFrameSize <= 1) {
    unint64_t maximumFrameSize = 1;
  }
  self->_unint64_t maximumFrameSize = maximumFrameSize;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[objc_alloc((Class)objc_opt_class()) initWithVideoURL:self->_videoURL];
  *((unsigned char *)result + 8) = self->_shouldDither;
  *((void *)result + 2) = *(void *)&self->_ditherDepth;
  *((void *)result + 3) = *(void *)&self->_maximumFrameRate;
  *((void *)result + 4) = self->_maximumFrameSize;
  *((unsigned char *)result + 9) = self->_synchronous;
  return result;
}

- (PFExportGIFRequest)initWithVideoURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFExportGIFRequest;
  v5 = [(PFExportGIFRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v6;

    *(_WORD *)&v5->_shouldDither = 1;
    *(_OWORD *)&v5->_double ditherDepth = xmmword_1A42D34E0;
    v5->_unint64_t maximumFrameSize = 640;
  }

  return v5;
}

+ (BOOL)_exportGIFToURL:(id)a3 request:(id)a4 progress:(id)a5 error:(id *)a6
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  CFURLRef url = (const __CFURL *)a3;
  id v8 = a4;
  v55 = (void (**)(id, unsigned char *, double))a5;
  v56 = v8;
  objc_super v9 = (void *)MEMORY[0x1E4F16330];
  v10 = [v8 videoURL];
  v59 = [v9 assetWithURL:v10];

  v60 = +[PFMediaUtilities tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:v59];
  if ((unint64_t)[v60 count] >= 2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    LOWORD(time.value) = 0;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "PFExportGIFRequest encountered multiple video tracks. Only one will be used", (uint8_t *)&time, 2u);
  }
  v11 = [v60 firstObject];
  v12 = v11;
  if (v11)
  {
    [v11 timeRange];
    CGFloat v89 = *((double *)&v81 + 1);
    CMTimeFlags v53 = DWORD1(v82);
    CMTimeScale v90 = v82;
    CGFloat v51 = *((double *)&v82 + 1);
    memset(&v79, 0, sizeof(v79));
    [v12 preferredTransform];
  }
  else
  {
    CGFloat v51 = 0.0;
    CMTimeFlags v53 = 0;
    long long v81 = 0u;
    long long v82 = 0u;
    CGFloat v89 = 0.0;
    CMTimeScale v90 = 0;
    long long v80 = 0u;
    memset(&v79, 0, sizeof(v79));
    memset(&v78, 0, sizeof(v78));
  }
  CGAffineTransformInvert(&v79, &v78);
  if (!v12 || (v53 & 0x1D) != 1)
  {
    v25 = _PFExportGIFRequestError(1, 0, @"Failed to get a valid video track with numeric duration");
    v14 = 0;
LABEL_43:
    v58 = 0;
LABEL_44:
    BOOL v41 = 0;
    goto LABEL_45;
  }
  id v13 = objc_alloc(MEMORY[0x1E4F16378]);
  id v77 = 0;
  v14 = (void *)[v13 initWithAsset:v59 error:&v77];
  id v15 = v77;
  v16 = v15;
  if (!v14 || v15)
  {
    v25 = _PFExportGIFRequestError(1, v15, @"Failed to create AVAssetReader");

    goto LABEL_43;
  }
  *(CGFloat *)&time.value = v89;
  time.timescale = v90;
  time.flags = v53;
  *(CGFloat *)&time.epoch = v51;
  double Seconds = CMTimeGetSeconds(&time);
  [v8 maximumFrameRate];
  double v19 = v18;
  uint64_t v87 = *MEMORY[0x1E4F2F990];
  uint64_t v85 = *MEMORY[0x1E4F2F9A0];
  v86 = &unk_1EF7CA4A8;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
  v88 = v20;
  CFDictionaryRef v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];

  v22 = [(id)*MEMORY[0x1E4F443D0] identifier];
  size_t v50 = vcvtpd_u64_f64(Seconds * v19);
  CGImageDestinationRef idst = CGImageDestinationCreateWithURL(url, v22, v50, v21);

  if (!idst)
  {
    v25 = _PFExportGIFRequestError(2, 0, @"Failed to create image destination");

    goto LABEL_43;
  }

  uint64_t v83 = *MEMORY[0x1E4F24D70];
  v84 = &unk_1EF7CA4C0;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
  v58 = (void *)[objc_alloc(MEMORY[0x1E4F163A0]) initWithTrack:v12 outputSettings:v23];
  if ([v14 canAddOutput:v58]) {
    [v14 addOutput:v58];
  }
  if (([v14 startReading] & 1) == 0)
  {
    v43 = [v14 error];
    v25 = _PFExportGIFRequestError(1, v43, @"Failed to start reading video");

LABEL_57:
    CFRelease(idst);
    goto LABEL_44;
  }

  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2020000000;
  uint64_t v76 = 0;
  time.value = 0;
  *(void *)&time.timescale = &time;
  time.epoch = 0x3810000000;
  v70 = &unk_1A42EF38E;
  long long v48 = *MEMORY[0x1E4F1FA48];
  long long v71 = *MEMORY[0x1E4F1FA48];
  double v47 = *(double *)(MEMORY[0x1E4F1FA48] + 16);
  double v72 = v47;
  [v8 maximumFrameRate];
  v68[1] = 3221225472;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[2] = __61__PFExportGIFRequest__exportGIFToURL_request_progress_error___block_invoke;
  v68[3] = &unk_1E5B2D1D0;
  *(double *)&v68[6] = 1.0 / v24;
  v68[7] = idst;
  v68[4] = &time;
  v68[5] = &v73;
  v46 = (void *)MEMORY[0x1A6259AE0](v68);
  v25 = 0;
  v26 = 0;
  LOBYTE(v27) = 1;
  while (v27)
  {
    if ([v14 status] != 1 || v74[3] >= v50)
    {
      BOOL v27 = 1;
LABEL_50:
      if (!v26) {
        goto LABEL_55;
      }
      if (v27)
      {
        v44 = (void (*)(void *, CGImage *, CGAffineTransform *, uint64_t))v46[2];
        v61.a = v89;
        *(void *)&v61.b = __PAIR64__(v53, v90);
        v61.c = v51;
        v44(v46, v26, &v61, 1);
        BOOL v27 = 1;
      }
      goto LABEL_54;
    }
    v28 = (void *)MEMORY[0x1A6259880]();
    long long v66 = v48;
    CGFloat v67 = v47;
    char v65 = 0;
    id v64 = 0;
    v29 = (const void *)[a1 _copyNextSampleBuffer:v58 reader:v14 time:&v66 didReachEnd:&v65 error:&v64];
    id v30 = v64;
    v31 = v30;
    if (v29)
    {
      char v63 = 0;
      if (!v26)
      {
        uint64_t v36 = *(void *)&time.timescale;
        *(_OWORD *)(*(void *)&time.timescale + 32) = v66;
        *(CGFloat *)(v36 + 48) = v67;
        goto LABEL_27;
      }
      v32 = (unsigned int (*)(void *, CGImage *, CGAffineTransform *, void))v46[2];
      *(_OWORD *)&v61.a = v66;
      v61.c = v67;
      if (v32(v46, v26, &v61, 0))
      {
        CGImageRelease(v26);
        if (v55)
        {
          *(_OWORD *)&v61.a = *(_OWORD *)(*(void *)&time.timescale + 32);
          v61.c = *(CGFloat *)(*(void *)&time.timescale + 48);
          double v33 = CMTimeGetSeconds((CMTime *)&v61);
          v61.a = v89;
          *(void *)&v61.b = __PAIR64__(v53, v90);
          v61.c = v51;
          Float64 v34 = CMTimeGetSeconds((CMTime *)&v61);
          v55[2](v55, &v63, v33 / v34);
        }
LABEL_27:
        if (v63)
        {
          v26 = 0;
          goto LABEL_29;
        }
        id v62 = 0;
        CGAffineTransform v61 = v79;
        v26 = (CGImage *)[a1 _createProcessedGIFImage:v29 options:v56 transform:&v61 error:&v62];
        id v37 = v62;
        v38 = v37;
        BOOL v27 = v26 != 0;
        if (!v26)
        {
          id v39 = v37;

          v25 = v39;
        }
      }
      else
      {
LABEL_29:
        BOOL v27 = 1;
      }
      CFRelease(v29);
      if (v63)
      {
        [v14 cancelReading];
        _PFExportGIFRequestError(3, 0, @"Cancelled");
        id v40 = (id)objc_claimAutoreleasedReturnValue();

LABEL_37:
        BOOL v27 = 0;
        int v35 = 3;
        v25 = v40;
        goto LABEL_38;
      }
      int v35 = 0;
      goto LABEL_38;
    }
    if (!v65)
    {
      id v40 = v30;

      goto LABEL_37;
    }
    int v35 = 3;
    BOOL v27 = 1;
LABEL_38:

    if (v35) {
      goto LABEL_50;
    }
  }
  BOOL v27 = 0;
  if (!v26) {
    goto LABEL_55;
  }
LABEL_54:
  CGImageRelease(v26);
LABEL_55:

  _Block_object_dispose(&time, 8);
  _Block_object_dispose(&v73, 8);
  if (!v27) {
    goto LABEL_57;
  }
  BOOL v41 = CGImageDestinationFinalize(idst);
  uint64_t v45 = _PFExportGIFRequestError(2, 0, @"Failed to finalize image destination");

  CFRelease(idst);
  v25 = (void *)v45;
LABEL_45:
  if (a6) {
    *a6 = v25;
  }

  return v41;
}

uint64_t __61__PFExportGIFRequest__exportGIFToURL_request_progress_error___block_invoke(uint64_t a1, CGImage *a2, CMTime *a3, int a4)
{
  LODWORD(v4) = a4;
  v22[1] = *MEMORY[0x1E4F143B8];
  memset(&v18, 0, sizeof(v18));
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  CMTime lhs = *a3;
  CMTime v16 = *(CMTime *)(v8 + 32);
  CMTimeSubtract(&v18, &lhs, &v16);
  CMTime lhs = v18;
  double Seconds = CMTimeGetSeconds(&lhs);
  if (Seconds + 0.001 >= *(double *)(a1 + 48)) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v4;
  }
  if (v4 == 1)
  {
    uint64_t v21 = *MEMORY[0x1E4F2F990];
    uint64_t v19 = *MEMORY[0x1E4F2F9A8];
    v10 = [NSNumber numberWithDouble:ceil(Seconds * 100.0) / 100.0];
    v20 = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v22[0] = v11;
    CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];

    CGImageDestinationAddImage(*(CGImageDestinationRef *)(a1 + 56), a2, v12);
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v14 = *(_OWORD *)&a3->value;
    *(void *)(v13 + 48) = a3->epoch;
    *(_OWORD *)(v13 + 32) = v14;
  }
  return v4;
}

+ (CGImage)_createProcessedGIFImage:(opaqueCMSampleBuffer *)a3 options:(id)a4 transform:(CGAffineTransform *)a5 error:(id *)a6
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    CVImageBufferRef v11 = ImageBuffer;
    CFDictionaryRef v12 = (void *)MEMORY[0x1A6259880]();
    uint64_t v13 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v11];
    long long v14 = *(_OWORD *)&a5->c;
    v50[0] = *(_OWORD *)&a5->a;
    v50[1] = v14;
    v50[2] = *(_OWORD *)&a5->tx;
    id v15 = [v13 imageByApplyingTransform:v50];

    [v15 extent];
    double v17 = v16;
    double v19 = v18;
    uint64_t v20 = [v15 colorSpace];
    uint64_t v21 = v20;
    if (v20)
    {
      uint64_t v48 = *MEMORY[0x1E4F1E240];
      uint64_t v49 = v20;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    }
    else
    {
      v22 = 0;
    }
    double v24 = (double)(unint64_t)[v9 maximumFrameSize];
    id v25 = v15;
    v26 = v25;
    if (v17 <= v19) {
      double v27 = v19;
    }
    else {
      double v27 = v17;
    }
    v28 = v25;
    if (v24 / v27 < 1.0)
    {
      v46[0] = @"inputImage";
      v46[1] = @"inputScale";
      v47[0] = v25;
      v29 = objc_msgSend(NSNumber, "numberWithDouble:");
      v47[1] = v29;
      id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];

      v31 = [MEMORY[0x1E4F1E040] filterWithName:@"CILanczosScaleTransform" withInputParameters:v30];
      v28 = [v31 outputImage];
    }
    id v32 = v28;
    double v33 = v32;
    if ([v9 shouldDither])
    {
      [v9 ditherDepth];
      double v35 = v34;
      id v36 = v32;
      double v37 = exp2(-v35);
      double v33 = v36;
      if (v37 > 0.0009765625)
      {
        uint64_t v45 = v12;
        v38 = v36;
        if (v21)
        {
          v38 = [v36 imageByColorMatchingWorkingSpaceToColorSpace:v21];
        }
        v51[0] = *MEMORY[0x1E4F1E488];
        id v39 = [NSNumber numberWithDouble:v37];
        *(void *)&v50[0] = v39;
        id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v51 count:1];
        double v33 = [v38 imageByApplyingFilter:@"CIDither" withInputParameters:v40];

        if (v21)
        {
          uint64_t v41 = [v33 imageByColorMatchingColorSpaceToWorkingSpace:v21];

          double v33 = (void *)v41;
        }
        CFDictionaryRef v12 = v45;
      }
    }
    v42 = [MEMORY[0x1E4F1E018] contextWithOptions:v22];
    v43 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
    [v33 extent];
    v23 = (CGImage *)objc_msgSend(v42, "createCGImage:fromRect:format:colorSpace:", v33, *MEMORY[0x1E4F1E2F0], v43);
    CGColorSpaceRelease(v43);
  }
  else if (a6)
  {
    _PFExportGIFRequestError(1, 0, @"Unable to get CVPixelBuffer from sample buffer");
    v23 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (opaqueCMSampleBuffer)_copyNextSampleBuffer:(id)a3 reader:(id)a4 time:(id *)a5 didReachEnd:(BOOL *)a6 error:(id *)a7
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  uint64_t v12 = MEMORY[0x1E4F1F9F8];
  CMTimeValue value = *MEMORY[0x1E4F1F9F8];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  uint64_t v13 = (opaqueCMSampleBuffer *)[a3 copyNextSampleBuffer];
  if (v13)
  {
    long long v14 = v13;
    CMSampleBufferGetOutputPresentationTimeStamp(&v22, v13);
    CMTimeValue value = v22.value;
    CMTimeFlags flags = v22.flags;
    CMTimeScale timescale = v22.timescale;
    CMTimeEpoch epoch = v22.epoch;
    if (v22.flags)
    {
      BOOL v19 = 0;
      double v18 = 0;
      goto LABEL_9;
    }
    double v17 = [v11 error];
    double v18 = _PFExportGIFRequestError(1, v17, @"Encountered invalid sample buffer time");

    CFRelease(v14);
  }
  else
  {
    CMTimeFlags flags = *(_DWORD *)(v12 + 12);
    CMTimeEpoch epoch = *(void *)(v12 + 16);
    if ([v11 status] == 2)
    {
      double v18 = 0;
      long long v14 = 0;
      BOOL v19 = 1;
      goto LABEL_9;
    }
    uint64_t v20 = [v11 error];
    double v18 = _PFExportGIFRequestError(1, v20, @"Failed to read a video sample buffer");
  }
  BOOL v19 = 0;
  long long v14 = 0;
LABEL_9:
  if (a5)
  {
    a5->var0 = value;
    a5->var1 = timescale;
    a5->var2 = flags;
    a5->var3 = epoch;
  }
  if (a6) {
    *a6 = v19;
  }
  if (a7) {
    *a7 = v18;
  }

  return v14;
}

+ (void)runExport:(id)a3 toURL:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, uint64_t, id))a6;
  uint64_t v13 = (void *)[a3 copy];
  [v13 _ensureValidInputs];
  if ([v13 isSynchronous])
  {
    id v23 = 0;
    uint64_t v14 = [a1 _exportGIFToURL:v10 request:v13 progress:v11 error:&v23];
    id v15 = v23;
    v12[2](v12, v14, v15);
  }
  else
  {
    double v16 = [a1 _exportQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__PFExportGIFRequest_runExport_toURL_progress_completion___block_invoke;
    v17[3] = &unk_1E5B2D1A8;
    id v22 = a1;
    id v18 = v10;
    id v19 = v13;
    id v20 = v11;
    uint64_t v21 = v12;
    dispatch_async(v16, v17);

    id v15 = v18;
  }
}

void __58__PFExportGIFRequest_runExport_toURL_progress_completion___block_invoke(void *a1)
{
  v2 = (void *)a1[8];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v7 = 0;
  [v2 _exportGIFToURL:v3 request:v4 progress:v5 error:&v7];
  id v6 = v7;
  (*(void (**)(void))(a1[7] + 16))();
}

+ (id)runExport:(id)a3 toURL:(id)a4 completion:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F28F90];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [v8 discreteProgressWithTotalUnitCount:100];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__PFExportGIFRequest_runExport_toURL_completion___block_invoke;
  v17[3] = &unk_1E5B2D180;
  id v13 = v12;
  id v18 = v13;
  uint64_t v14 = (void *)MEMORY[0x1A6259AE0](v17);
  [a1 runExport:v11 toURL:v10 progress:v14 completion:v9];

  id v15 = v13;
  return v15;
}

uint64_t __49__PFExportGIFRequest_runExport_toURL_completion___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  [*(id *)(a1 + 32) setCompletedUnitCount:vcvtmd_s64_f64(a3 * 100.0)];
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  *a2 = result;
  return result;
}

+ (OS_dispatch_queue)_exportQueue
{
  if (_exportQueue_onceToken != -1) {
    dispatch_once(&_exportQueue_onceToken, &__block_literal_global_1104);
  }
  v2 = (void *)_exportQueue__sharedExportQueue;

  return (OS_dispatch_queue *)v2;
}

void __34__PFExportGIFRequest__exportQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.PFExportGIFRequest", v2);
  v1 = (void *)_exportQueue__sharedExportQueue;
  _exportQueue__sharedExportQueue = (uint64_t)v0;
}

@end