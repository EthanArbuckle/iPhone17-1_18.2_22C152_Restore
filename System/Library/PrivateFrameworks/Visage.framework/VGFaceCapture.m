@interface VGFaceCapture
+ (id)getFaceMetadata:(id)a3;
- (BOOL)processWithCaptureData:(id)a3 callback:(id)a4;
- (BOOL)startFaceExpressionCapture:(unint64_t)a3;
- (NSString)rootPath;
- (VGFaceCapture)initWithOptions:(id)a3;
- (id).cxx_construct;
- (id)enrolledPoses;
- (void)dealloc;
- (void)setRootPath:(id)a3;
@end

@implementation VGFaceCapture

- (VGFaceCapture)initWithOptions:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VGFaceCapture;
  v6 = [(VGFaceCapture *)&v20 init];
  v7 = v6;
  if (!v6)
  {
LABEL_8:
    v15 = v7;
    goto LABEL_12;
  }
  p_options = (id *)&v6->_options;
  objc_storeStrong((id *)&v6->_options, a3);
  __int16 v19 = 0;
  LOBYTE(v19) = [(VGFaceCaptureOptions *)v7->_options useFKInternalFaceDetector];
  HIBYTE(v19) = [*p_options useFKForceCPU];
  v9 = [[VGFaceKitTracker alloc] initWithOptions:&v19];
  faceTracker = v7->_faceTracker;
  v7->_faceTracker = v9;

  if (v7->_faceTracker)
  {
    v11 = [[VGFaceFittingFrameSelector alloc] initWithOptions:v7->_options faceKitSemantics:[(VGFaceKitTracker *)v7->_faceTracker semantics]];
    faceFrameSelector = v7->_faceFrameSelector;
    v7->_faceFrameSelector = v11;

    v13 = (vg::frame_selection::metrics *)[(VGFaceCaptureOptions *)v7->_options useFaceTrackingDictionary];
    if (v13)
    {
      v14 = v7->_faceTracker;
      v7->_faceTracker = 0;
    }
    if (vg::frame_selection::metrics::isSupported(v13)
      && [*p_options sendMetrics])
    {
      operator new();
    }
    goto LABEL_8;
  }
  v16 = __VGLogSharedInstance();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v18[0] = 0;
    _os_log_impl(&dword_260C8D000, v16, OS_LOG_TYPE_ERROR, " Failed to initialize FaceKit Tracker ", (uint8_t *)v18, 2u);
  }

  v15 = 0;
LABEL_12:

  return v15;
}

- (void)dealloc
{
  value = self->_metricsData.__ptr_.__value_;
  if (value) {
    vg::frame_selection::metrics::sendCompleteEvent((vg::frame_selection::metrics *)value, (const Data *)a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)VGFaceCapture;
  [(VGFaceCapture *)&v4 dealloc];
}

- (id)enrolledPoses
{
  faceFrameSelector = self->_faceFrameSelector;
  if (faceFrameSelector)
  {
    faceFrameSelector = [faceFrameSelector enrolledPoses];
  }

  return faceFrameSelector;
}

- (BOOL)startFaceExpressionCapture:(unint64_t)a3
{
  return [(VGFaceFittingFrameSelector *)self->_faceFrameSelector startFaceExpressionCapture:a3];
}

- (BOOL)processWithCaptureData:(id)a3 callback:(id)a4
{
  id v6 = a3;
  v7 = (vg::shared *)a4;
  v8 = (vg::shared *)vg::shared::Time(v7);
  v9 = v8;
  if (self->_metricsData.__ptr_.__value_)
  {
    v10 = (vg::frame_selection::metrics *)vg::shared::MemoryUsage(v8);
    v11 = v10;
    value = self->_metricsData.__ptr_.__value_;
    uint64_t v13 = *((void *)value + 1);
    if (!v13)
    {
      vg::frame_selection::metrics::sendStartEvent(v10);
      value = self->_metricsData.__ptr_.__value_;
      *((void *)value + 50) = v9;
      *((void *)value + 61) = v11;
      uint64_t v13 = *((void *)value + 1);
    }
    *((void *)value + 1) = v13 + 1;
    *((void *)value + 51) = v9;
    *((void *)value + 62) = v11;
  }
  if (v7)
  {
    objc_initWeak(&location, self);
    v14 = [v6 getFaceCaptureData];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __49__VGFaceCapture_processWithCaptureData_callback___block_invoke;
    v27[3] = &unk_265570288;
    objc_copyWeak(v30, &location);
    v30[1] = v9;
    id v15 = v6;
    id v28 = v15;
    v29 = v7;
    v16 = (void (**)(void, void, void))MEMORY[0x261227FC0](v27);
    if ([(VGFaceCaptureOptions *)self->_options useFaceTrackingDictionary])
    {
      v17 = [v15 faceTrackingResult];

      if (v17)
      {
        v18 = [v15 faceTrackingResult];
        ((void (**)(void, void *, BOOL))v16)[2](v16, v18, [(VGFaceCaptureOptions *)self->_options useFaceTrackingDictionary]);

        char v19 = 1;
      }
      else
      {
        v21 = __VGLogSharedInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_260C8D000, v21, OS_LOG_TYPE_ERROR, " useFaceTrackingDictionary is set to TRUE, but faceTrackingResult is empty in capture data. ", buf, 2u);
        }

        char v19 = 0;
      }
    }
    else
    {
      faceTracker = self->_faceTracker;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __49__VGFaceCapture_processWithCaptureData_callback___block_invoke_4;
      v23[3] = &unk_2655702B0;
      v23[4] = self;
      id v24 = v15;
      v25 = v16;
      char v19 = [(VGFaceKitTracker *)faceTracker processWithCaptureData:v14 callback:v23];
    }
    objc_destroyWeak(v30);

    objc_destroyWeak(&location);
  }
  else
  {
    char v19 = 0;
  }

  return v19;
}

void __49__VGFaceCapture_processWithCaptureData_callback___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  WeakRetained = (vg::shared *)objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    __uint64_t v8 = vg::shared::Time(WeakRetained);
    __uint64_t v9 = v8;
    uint64_t v10 = *((void *)v7 + 4);
    if (v10) {
      *(void *)(v10 + 424) += v8 - *(void *)(a1 + 56);
    }
    objc_msgSend(*((id *)v7 + 1), "addPoseWithCaptureData:tracking:externalTracking:metricsData:", *(void *)(a1 + 32), v5, a3);
    v11 = (vg::shared *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (*((void *)v7 + 4))
    {
      __uint64_t v13 = vg::shared::Time(v11);
      uint64_t v14 = *((void *)v7 + 4);
      *(void *)(v14 + 432) += v13 - v9;
      *(void *)(v14 + 416) += v13 - *(void *)(a1 + 56);
    }
    id v15 = [*(id *)(a1 + 32) faceTrackingResult];
    [(vg::shared *)v12 setFaceTrackingResultCurrentFrame:v15];

    if ([(vg::shared *)v12 updated])
    {
      if ([(vg::shared *)v12 completed])
      {
        v16 = (unsigned char *)*((void *)v7 + 4);
        if (v16) {
          unsigned char *v16 = 1;
        }
        v17 = __VGLogSharedInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_260C8D000, v17, OS_LOG_TYPE_DEBUG, " Pose capture fully complete and updated. ", buf, 2u);
        }

        v18 = [*((id *)v7 + 1) finish];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_17:

LABEL_19:
        goto LABEL_20;
      }
      [(vg::shared *)v12 completionScore];
      if (v19 > 0.0)
      {
        objc_super v20 = __VGLogSharedInstance();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_260C8D000, v20, OS_LOG_TYPE_DEBUG, " Pose capture partially complete and updated. ", v21, 2u);
        }

        v18 = [*((id *)v7 + 1) enrolledPoses];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_17;
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
LABEL_20:
}

void __49__VGFaceCapture_processWithCaptureData_callback___block_invoke_4(uint64_t a1, void *a2)
{
  v3 = a2;
  objc_super v4 = v3;
  if ([*(id *)(*(void *)(a1 + 32) + 16) convertFKTrackingDictToARKitDict])
  {
    size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[*(id *)(a1 + 40) yuvRectified]);
    size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[*(id *)(a1 + 40) yuvRectified]);
    *(double *)&v10[0].super.isa = (double)Width;
    *(double *)&v10[1].super.isa = (double)Height;
    objc_super v4 = vg::frame_selection::face_tracker::createARKitDictFromFaceKitDict(v3, v10, v7);
  }
  [*(id *)(a1 + 40) setFaceTrackingResult:v4];
  if ([*(id *)(*(void *)(a1 + 32) + 16) useFKInternalFaceDetector])
  {
    __uint64_t v8 = [*(id *)(a1 + 40) face];

    if (!v8)
    {
      __uint64_t v9 = +[VGFaceCapture getFaceMetadata:v4];
      [*(id *)(a1 + 40) setFace:v9];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)getFaceMetadata:(id)a3
{
  id v3 = a3;
  objc_super v4 = v3;
  if (!v3)
  {
    v12 = 0;
    goto LABEL_23;
  }
  id v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F26AC0]];
  id v6 = v5;
  if (!v5 || ![v5 count])
  {
    v7 = __VGLogSharedInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(rect.origin.x) = 0;
      _os_log_impl(&dword_260C8D000, v7, OS_LOG_TYPE_ERROR, " No tracked faces found in tracking dictionary ", (uint8_t *)&rect, 2u);
    }
    v12 = 0;
    goto LABEL_22;
  }
  v7 = [v6 objectAtIndexedSubscript:0];
  __uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F26AA0]];
  if (!v8)
  {
    uint64_t v10 = __VGLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(rect.origin.x) = 0;
      _os_log_impl(&dword_260C8D000, v10, OS_LOG_TYPE_ERROR, " No smooth data found in tracking dictionary ", (uint8_t *)&rect, 2u);
    }
    goto LABEL_20;
  }
  CFDictionaryRef v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F269D8]];
  uint64_t v10 = v9;
  if (!v9)
  {
    __uint64_t v13 = __VGLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(rect.origin.x) = 0;
      uint64_t v14 = " No face rect found in tracking dictionary ";
      p_CGRect rect = &rect;
LABEL_18:
      _os_log_impl(&dword_260C8D000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)p_rect, 2u);
    }
LABEL_19:

LABEL_20:
    v12 = 0;
    goto LABEL_21;
  }
  if (!CGRectMakeWithDictionaryRepresentation(v9, &rect))
  {
    __uint64_t v13 = __VGLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = 0;
      uint64_t v14 = " Unable to construct bbox rect from tracking dictionary ";
      p_CGRect rect = (CGRect *)&v17;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v11 = [VGFaceMetadata alloc];
  v12 = -[VGFaceMetadata initWithFaceId:bounds:yawAngle:rollAngle:](v11, "initWithFaceId:bounds:yawAngle:rollAngle:", 0, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, 0.0, 0.0);
LABEL_21:

LABEL_22:
LABEL_23:

  return v12;
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootPath, 0);
  value = self->_metricsData.__ptr_.__value_;
  self->_metricsData.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<vg::frame_selection::metrics::Data>::operator()[abi:ne180100]((uint64_t)&self->_metricsData, (uint64_t)value);
  }
  objc_storeStrong((id *)&self->_faceTracker, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_faceFrameSelector, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end