@interface VGHRTFEarCaptureProcessor
- (VGHRTFEarCaptureProcessor)initWithDebugDataPath:(id)a3 withModelsRootPath:(id)a4;
- (id).cxx_construct;
- (id)currentUpdateData;
- (id)initWithDebugDataPath:withModelsRootPath:;
- (id)processCaptureData:(id)a3 faceData:(id)a4;
@end

@implementation VGHRTFEarCaptureProcessor

- (VGHRTFEarCaptureProcessor)initWithDebugDataPath:(id)a3 withModelsRootPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VGHRTFEarCaptureProcessor;
  v8 = [(VGHRTFEarCaptureProcessor *)&v18 init];
  v9 = v8;
  v10 = v8;
  if (v8)
  {
    v8->_earCaptureOptions.writeDebugData = v6 != 0;
    if (v6)
    {
      id v11 = [v6 stringByAppendingPathComponent:@"EarCapture"];
      std::string::basic_string[abi:ne180100]<0>(v16, (char *)[v11 UTF8String]);
      p_debugDataPath = (void **)&v9->_earCaptureOptions.debugDataPath;
      if (*((char *)&v10->_earCaptureOptions.debugDataPath.__r_.__value_.var0.__l + 23) < 0) {
        operator delete(*p_debugDataPath);
      }
      *(_OWORD *)p_debugDataPath = *(_OWORD *)v16;
      *((void *)&v9->_earCaptureOptions.debugDataPath.__r_.__value_.var0.__l + 2) = v17;
      HIBYTE(v17) = 0;
      LOBYTE(v16[0]) = 0;
    }
    std::string::__assign_external((std::string *)&v9->_earCaptureOptions.debugDataPath.__r_.var0, (const std::string::value_type *)[v7 UTF8String]);
    vg::frame_selection::VGEarFrameSelector::create((vg::frame_selection::VGEarFrameSelector *)&v9->_earCaptureOptions, v13);
  }
  v14 = __VGLogSharedInstance();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl(&dword_260C8D000, v14, OS_LOG_TYPE_ERROR, " Failed to initialize VGHRTFCaptureProcessor ", (uint8_t *)v16, 2u);
  }

  return 0;
}

- (id)initWithDebugDataPath:withModelsRootPath:
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "doubleValue", (void)v10);
        v8 = [NSNumber numberWithDouble:ceil(v7 * 100.0) / 100.0];
        [v2 setObject:0 forKeyedSubscript:v8];
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return v2;
}

- (id)currentUpdateData
{
  id v3 = [[VGHRTFEarCaptureUpdateData alloc] initEmpty];
  [v3 setProgressType:self->_captureState];
  *(float *)&double v4 = self->_progress;
  [v3 setProgress:v4];
  uint64_t v5 = (void *)[objc_alloc(NSDictionary) initWithDictionary:self->_leftPoseStatus copyItems:1];
  [v3 setLeftEarStatusList:v5];

  id v6 = (void *)[objc_alloc(NSDictionary) initWithDictionary:self->_rightPoseStatus copyItems:1];
  [v3 setRightEarStatusList:v6];

  [v3 setTrackedData:0];
  [v3 setResult:0];

  return v3;
}

- (id)processCaptureData:(id)a3 faceData:(id)a4
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v56 = a4;
  double v7 = [(VGHRTFEarCaptureProcessor *)self currentUpdateData];
  value = self->_rectify.__ptr_.__value_;
  v9 = [v6 colorBuffer];
  long long v10 = [v6 depthBuffer];
  [v6 colorIntrinsics];
  simd_float3 v59 = v12;
  *(_OWORD *)v61 = v11;
  simd_float3 v57 = v13;
  v14 = [v6 depthCalibrationData];
  v91.columns[1] = v59;
  v91.columns[0] = *(simd_float3 *)v61;
  v91.columns[2] = v57;
  vg::hrtf::Rectify::process((vg::hrtf::Rectify *)value, v9, v10, v91, v14, (uint64_t)v83);

  if (v88)
  {
    v62 = (VGCaptureData *)objc_opt_new();
    if (!v88) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    CVPixelBufferRef CVPixelBufferFromIOSurface = createCVPixelBufferFromIOSurface(v84);
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __57__VGHRTFEarCaptureProcessor_processCaptureData_faceData___block_invoke;
    v66[3] = &__block_descriptor_40_e5_v8__0l;
    v66[4] = CVPixelBufferFromIOSurface;
    v55 = (void (**)(void))MEMORY[0x261227FC0](v66);
    [(VGCaptureData *)v62 setDepth:CVPixelBufferFromIOSurface];
    if (!v88) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    -[VGCaptureData setDepthIntrinsics:](v62, "setDepthIntrinsics:", *(double *)&v85, *(double *)&v86, *(double *)&v87);
    if (!v88) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    CVPixelBufferRef v16 = createCVPixelBufferFromIOSurface(v83[0]);
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __57__VGHRTFEarCaptureProcessor_processCaptureData_faceData___block_invoke_2;
    v65[3] = &__block_descriptor_40_e5_v8__0l;
    v65[4] = v16;
    v58 = (void (**)(void))MEMORY[0x261227FC0](v65);
    [(VGCaptureData *)v62 setYuvRectified:v16];
    if (!v88) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    -[VGCaptureData setVideoIntrinsics:](v62, "setVideoIntrinsics:", *(double *)&v83[2], *(double *)&v83[4], *(double *)&v83[6]);
    [v6 timestamp];
    CMTimeMakeWithSeconds(&v64, v17, 1000000);
    CMTime v63 = v64;
    [(VGCaptureData *)v62 setTimestamp:&v63];
    vg::frame_selection::VGEarFrameSelector::addPoseWithCaptureData((vg::frame_selection::VGEarFrameSelectorImpl **)self->_selector.__ptr_.__value_, v62, (uint64_t)buf);
    self->_captureState = 1;
    if (buf[0])
    {
      unint64_t v18 = 2;
      if (!buf[1]) {
        unint64_t v18 = 3;
      }
      self->_captureState = v18;
    }
    self->_progress = *(float *)&buf[4];
    v19 = vg::frame_selection::VGEarSelectionState::leftEarYawAngleCaptured((void **)buf);
    detail::getEarPoseList(v19);
    v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    leftPoseStatus = self->_leftPoseStatus;
    self->_leftPoseStatus = v20;

    v22 = vg::frame_selection::VGEarSelectionState::rightEarYawAngleCaptured((void **)buf);
    detail::getEarPoseList(v22);
    v23 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    rightPoseStatus = self->_rightPoseStatus;
    self->_rightPoseStatus = v23;

    [v7 setProgressType:self->_captureState];
    *(float *)&double v25 = self->_progress;
    [v7 setProgress:v25];
    v26 = (void *)[objc_alloc(NSDictionary) initWithDictionary:self->_leftPoseStatus copyItems:1];
    [v7 setLeftEarStatusList:v26];

    v27 = (void *)[objc_alloc(NSDictionary) initWithDictionary:self->_rightPoseStatus copyItems:1];
    [v7 setRightEarStatusList:v27];

    id v28 = [[VGHRTFEarCaptureProcessedData alloc] initEmpty];
    v60 = v62;
    if (v80)
    {
      id v29 = 0;
    }
    else
    {
      id v32 = [[VGHRTFEarCaptureDetectionData alloc] initEmpty];
      size_t Width = CVPixelBufferGetWidth([(VGCaptureData *)v60 yuvRectified]);
      size_t Height = CVPixelBufferGetHeight([(VGCaptureData *)v60 yuvRectified]);
      float v35 = v72;
      float v36 = v73;
      float v37 = v74;
      float v38 = v75;
      if (v69 > 1)
      {
        v39 = __VGLogSharedInstance();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v67 = 0;
          _os_log_impl(&dword_260C8D000, v39, OS_LOG_TYPE_ERROR, " No suitable conversion supported for ear side. ", v67, 2u);
        }
        id v29 = 0;
      }
      else
      {
        objc_msgSend(v32, "setEarSide:");
        [v32 setYawAngle:v70];
        [v32 setPitchAngle:v71];
        objc_msgSend(v32, "setBoundingBox:", (float)(v35 * (float)Width), (float)(v36 * (float)Height), (float)((float)(v37 - v35) * (float)Width), (float)((float)(v38 - v36) * (float)Height));
        v39 = objc_opt_new();
        v41 = v76;
        v42 = v77;
        if (v76 != v77)
        {
          do
          {
            LODWORD(v40) = *v41;
            v43 = [NSNumber numberWithFloat:v40];
            [v39 addObject:v43];

            ++v41;
          }
          while (v41 != v42);
        }
        [v32 setLandmarkPoints:v39];
        id v29 = v32;
      }
    }
    [v28 setDetectionData:v29];

    if (!v88) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    [v28 setRectifiedColorBuffer:v83[0]];
    uint64_t v44 = 8;
    switch(v80)
    {
      case 0:
        goto LABEL_49;
      case 1:
        v45 = __VGLogSharedInstance();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v67 = 0;
          _os_log_impl(&dword_260C8D000, v45, OS_LOG_TYPE_DEBUG, " Ear detection failed: ear not found. ", v67, 2u);
        }
        uint64_t v44 = 0;
        goto LABEL_48;
      case 2:
        v45 = __VGLogSharedInstance();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v67 = 0;
          _os_log_impl(&dword_260C8D000, v45, OS_LOG_TYPE_DEBUG, " Ear detection failed: low landmark confidence. ", v67, 2u);
        }
        uint64_t v44 = 5;
        goto LABEL_48;
      case 3:
        v45 = __VGLogSharedInstance();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v67 = 0;
          _os_log_impl(&dword_260C8D000, v45, OS_LOG_TYPE_DEBUG, " Front facing pose ", v67, 2u);
        }
        uint64_t v44 = 6;
        goto LABEL_48;
      case 4:
        v45 = __VGLogSharedInstance();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v67 = 0;
          _os_log_impl(&dword_260C8D000, v45, OS_LOG_TYPE_DEBUG, " Ear detection failed: ear occluded. ", v67, 2u);
        }
        uint64_t v44 = 1;
        goto LABEL_48;
      case 5:
        v45 = __VGLogSharedInstance();
        uint64_t v44 = 2;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v67 = 0;
          uint64_t v44 = 2;
          _os_log_impl(&dword_260C8D000, v45, OS_LOG_TYPE_DEBUG, " Ear motion blur detected. ", v67, 2u);
        }
        goto LABEL_48;
      case 6:
        v45 = __VGLogSharedInstance();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v67 = 0;
          _os_log_impl(&dword_260C8D000, v45, OS_LOG_TYPE_DEBUG, " Ear too close to camera. ", v67, 2u);
        }
        uint64_t v44 = 3;
        goto LABEL_48;
      case 7:
        v45 = __VGLogSharedInstance();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v67 = 0;
          _os_log_impl(&dword_260C8D000, v45, OS_LOG_TYPE_DEBUG, " Ear too far from camera. ", v67, 2u);
        }
        uint64_t v44 = 4;
        goto LABEL_48;
      case 8:
        v45 = __VGLogSharedInstance();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v67 = 0;
          _os_log_impl(&dword_260C8D000, v45, OS_LOG_TYPE_DEBUG, " Ear out of frame ", v67, 2u);
        }
        uint64_t v44 = 7;
LABEL_48:

LABEL_49:
        [v28 setError:v44];
        break;
      default:
        break;
    }
    [v7 setTrackedData:v28];
    if ([v7 progressType] == 3)
    {
      id v46 = [[VGHRTFEarsFrameData alloc] initEmpty];
      v47 = vg::frame_selection::VGEarFrameSelector::leftEarEnrolledPoses((vg::frame_selection::VGEarFrameSelectorImpl **)self->_selector.__ptr_.__value_);
      v48 = vg::frame_selection::VGEarFrameSelector::leftEarEnrolledYawToBoundingBox((vg::frame_selection::VGEarFrameSelector *)self->_selector.__ptr_.__value_);
      v49 = detail::getEarFrameData(v47, v48);
      [v46 setLeftEarFrames:v49];

      v50 = vg::frame_selection::VGEarFrameSelector::rightEarEnrolledPoses((vg::frame_selection::VGEarFrameSelectorImpl **)self->_selector.__ptr_.__value_);
      v51 = vg::frame_selection::VGEarFrameSelector::rightEarEnrolledYawToBoundingBox((vg::frame_selection::VGEarFrameSelector *)self->_selector.__ptr_.__value_);
      v52 = detail::getEarFrameData(v50, v51);
      [v46 setRightEarFrames:v52];

      [v7 setResult:v46];
    }
    id v53 = v7;

    if (__p)
    {
      v79 = __p;
      operator delete(__p);
    }
    if (v76)
    {
      v77 = v76;
      operator delete(v76);
    }
    v58[2](v58);

    v55[2](v55);
  }
  else
  {
    v30 = __VGLogSharedInstance();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_260C8D000, v30, OS_LOG_TYPE_ERROR, " Failed to rectify ear images. ", buf, 2u);
    }

    id v31 = v7;
  }
  if (v88)
  {
  }

  return v7;
}

void __57__VGHRTFEarCaptureProcessor_processCaptureData_faceData___block_invoke(uint64_t a1)
{
}

void __57__VGHRTFEarCaptureProcessor_processCaptureData_faceData___block_invoke_2(uint64_t a1)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightPoseStatus, 0);
  objc_storeStrong((id *)&self->_leftPoseStatus, 0);
  std::unique_ptr<vg::hrtf::Rectify>::reset[abi:ne180100]((vg::hrtf::Rectify **)&self->_rectify, 0);

  if ((char)self->_anon_78[7] < 0) {
    operator delete(*(void **)&self->_earCaptureOptions.debugDataPath.__r_.var0);
  }
  if (*((char *)&self->_earCaptureOptions.debugDataPath.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_earCaptureOptions.debugDataPath.__r_.__value_.var0.__l.__data_);
  }

  std::unique_ptr<vg::frame_selection::VGEarFrameSelector>::reset[abi:ne180100]((vg::frame_selection::VGEarFrameSelectorImpl ***)&self->_selector, 0);
}

- (id).cxx_construct
{
  self->_selector.__ptr_.__value_ = 0;
  *(_OWORD *)&self->_earCaptureOptions.earPresenceThreshold = xmmword_260D21650;
  self->_earCaptureOptions.percentileDetectionConfidence = 0.8;
  *(_OWORD *)&self->_earCaptureOptions.yawCount = xmmword_260D21660;
  *(_OWORD *)&self->_earCaptureOptions.yawLimit = xmmword_260D21670;
  self->_earCaptureOptions.writeDebugData = 0;
  std::string::basic_string[abi:ne180100]<0>(&self->_earCaptureOptions.debugDataPath.__r_.__value_.var0.__l.__data_, "");
  std::string::basic_string[abi:ne180100]<0>(&self->_earCaptureOptions.debugDataPath.__r_.var0, "");
  self->_anon_78[8] = 1;
  *(_DWORD *)&self->_anon_78[12] = 1083808154;
  *(void *)&self->_anon_78[16] = &unk_270CFD918;
  self->_rectify.__ptr_.__value_ = 0;
  return self;
}

@end