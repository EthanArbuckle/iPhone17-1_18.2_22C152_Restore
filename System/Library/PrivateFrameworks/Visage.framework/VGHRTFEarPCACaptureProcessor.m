@interface VGHRTFEarPCACaptureProcessor
- (VGHRTFEarPCACaptureProcessor)initWithDebugDataPath:(id)a3 withModelsRootPath:(id)a4;
- (id).cxx_construct;
- (id)defaultUpdateData;
- (id)processCaptureData:(id)a3 faceData:(id)a4;
@end

@implementation VGHRTFEarPCACaptureProcessor

- (VGHRTFEarPCACaptureProcessor)initWithDebugDataPath:(id)a3 withModelsRootPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)VGHRTFEarPCACaptureProcessor;
  v8 = [(VGHRTFEarPCACaptureProcessor *)&v19 init];
  if (v8)
  {
    v9 = [[VGEarPCACaptureOptions alloc] initWithSuiteName:@"com.apple.visage"];
    earCaptureOptions = v8->_earCaptureOptions;
    v8->_earCaptureOptions = v9;

    [(VGEarPCACaptureOptions *)v8->_earCaptureOptions setWriteDebugData:v6 != 0];
    if (v6)
    {
      v11 = [v6 stringByAppendingPathComponent:@"EarPCACapture"];
      [(VGEarPCACaptureOptions *)v8->_earCaptureOptions setDebugDataPath:v11];
    }
    [(VGEarPCACaptureOptions *)v8->_earCaptureOptions setModelsRootPath:v7];
    v12 = [[VGEarPCAFrameSelector alloc] initWithOptions:v8->_earCaptureOptions];
    selector = v8->_selector;
    v8->_selector = v12;

    if (v8->_selector) {
      vg::hrtf::Rectify::create(v14);
    }
    v15 = __VGLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      v16 = " Failed to initialize ear frame selector. ";
      goto LABEL_10;
    }
  }
  else
  {
    v15 = __VGLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      v16 = " Failed to initialize VGHRTFCaptureProcessor ";
LABEL_10:
      _os_log_impl(&dword_260C8D000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v18, 2u);
    }
  }

  return 0;
}

- (id)defaultUpdateData
{
  unsigned int v2 = [(VGEarPCACaptureOptions *)self->_earCaptureOptions frameCountThreshold];
  v3 = objc_opt_new();
  if (v2)
  {
    for (unsigned int i = 0; i != v2; ++i)
    {
      v5 = [NSNumber numberWithDouble:(double)i];
      [v3 setObject:0 forKeyedSubscript:v5];
    }
  }
  id v6 = [[VGHRTFEarCaptureUpdateData alloc] initEmpty];
  [v6 setProgressType:0];
  [v6 setProgress:0.0];
  [v6 setLeftEarStatusList:v3];
  [v6 setRightEarStatusList:v3];
  [v6 setTrackedData:0];
  [v6 setResult:0];

  return v6;
}

- (id)processCaptureData:(id)a3 faceData:(id)a4
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v57 = a4;
  id v7 = [(VGHRTFEarPCACaptureProcessor *)self defaultUpdateData];
  value = self->_rectify.__ptr_.__value_;
  v9 = [v6 colorBuffer];
  v10 = [v6 depthBuffer];
  [v6 colorIntrinsics];
  simd_float3 v60 = v12;
  simd_float3 v62 = v11;
  simd_float3 v58 = v13;
  v14 = [v6 depthCalibrationData];
  v98.columns[1] = v60;
  v98.columns[0] = v62;
  v98.columns[2] = v58;
  vg::hrtf::Rectify::process((vg::hrtf::Rectify *)value, v9, v10, v98, v14, (uint64_t)v90);

  if (v95)
  {
    v63 = objc_opt_new();
    if (!v95) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    CVPixelBufferRef CVPixelBufferFromIOSurface = createCVPixelBufferFromIOSurface(v91);
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __60__VGHRTFEarPCACaptureProcessor_processCaptureData_faceData___block_invoke;
    v67[3] = &__block_descriptor_40_e5_v8__0l;
    v67[4] = CVPixelBufferFromIOSurface;
    v54 = (void (**)(void))MEMORY[0x261227FC0](v67);
    [v63 setDepth:CVPixelBufferFromIOSurface];
    if (!v95) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    objc_msgSend(v63, "setDepthIntrinsics:", *(double *)&v92, *(double *)&v93, v94);
    if (!v95) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    CVPixelBufferRef v16 = createCVPixelBufferFromIOSurface(v90[0]);
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __60__VGHRTFEarPCACaptureProcessor_processCaptureData_faceData___block_invoke_2;
    v66[3] = &__block_descriptor_40_e5_v8__0l;
    v66[4] = v16;
    v55 = (void (**)(void))MEMORY[0x261227FC0](v66);
    [v63 setYuvRectified:v16];
    if (!v95) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    objc_msgSend(v63, "setVideoIntrinsics:", *(double *)&v90[2], *(double *)&v90[4], *(double *)&v90[6]);
    [v6 timestamp];
    CMTimeMakeWithSeconds(&v65, v17, 1000000);
    CMTime v64 = v65;
    [v63 setTimestamp:&v64];
    selector = self->_selector;
    objc_super v19 = [v57 yawAngle];
    v59 = [(VGEarPCAFrameSelector *)selector addPoseWithCaptureData:v63 faceYaw:v19];

    if ([v59 completed])
    {
      if ([v59 failed]) {
        uint64_t v20 = 2;
      }
      else {
        uint64_t v20 = 3;
      }
    }
    else
    {
      uint64_t v20 = 1;
    }
    [v59 progress];
    int v24 = v23;
    [v7 setProgressType:v20];
    LODWORD(v25) = v24;
    [v7 setProgress:v25];
    v26 = [(VGEarPCAFrameSelector *)self->_selector currentState];
    v27 = detail::getEarPoseList((detail *)[v26 leftFrameCount], -[VGEarPCAFrameSelector requiredPosesCount](self->_selector, "requiredPosesCount"));
    [v7 setLeftEarStatusList:v27];

    v28 = [(VGEarPCAFrameSelector *)self->_selector currentState];
    v29 = detail::getEarPoseList((detail *)[v28 rightFrameCount], -[VGEarPCAFrameSelector requiredPosesCount](self->_selector, "requiredPosesCount"));
    [v7 setRightEarStatusList:v29];

    id v61 = [[VGHRTFEarCaptureProcessedData alloc] initEmpty];
    id v30 = v59;
    v21 = v63;
    if ([v30 detectionError])
    {
      id v31 = 0;
LABEL_67:

      [v61 setDetectionData:v31];
      v45 = [v6 colorBuffer];
      [v61 setRectifiedColorBuffer:v45];

      uint64_t v46 = 8;
      switch([v30 detectionError])
      {
        case 0u:
          goto LABEL_92;
        case 1u:
          v47 = __VGLogSharedInstance();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_260C8D000, v47, OS_LOG_TYPE_DEBUG, " Ear detection failed: ear not found. ", buf, 2u);
          }
          uint64_t v46 = 0;
          goto LABEL_91;
        case 2u:
          v47 = __VGLogSharedInstance();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_260C8D000, v47, OS_LOG_TYPE_DEBUG, " Ear detection failed: low landmark confidence. ", buf, 2u);
          }
          uint64_t v46 = 5;
          goto LABEL_91;
        case 3u:
          v47 = __VGLogSharedInstance();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_260C8D000, v47, OS_LOG_TYPE_DEBUG, " Front facing pose ", buf, 2u);
          }
          uint64_t v46 = 6;
          goto LABEL_91;
        case 4u:
          v47 = __VGLogSharedInstance();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_260C8D000, v47, OS_LOG_TYPE_DEBUG, " Ear detection failed: ear occluded. ", buf, 2u);
          }
          uint64_t v46 = 1;
          goto LABEL_91;
        case 5u:
          v47 = __VGLogSharedInstance();
          uint64_t v46 = 2;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            uint64_t v46 = 2;
            _os_log_impl(&dword_260C8D000, v47, OS_LOG_TYPE_DEBUG, " Ear motion blur detected. ", buf, 2u);
          }
          goto LABEL_91;
        case 6u:
          v47 = __VGLogSharedInstance();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_260C8D000, v47, OS_LOG_TYPE_DEBUG, " Ear too close to camera. ", buf, 2u);
          }
          uint64_t v46 = 3;
          goto LABEL_91;
        case 7u:
          v47 = __VGLogSharedInstance();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_260C8D000, v47, OS_LOG_TYPE_DEBUG, " Ear too far from camera. ", buf, 2u);
          }
          uint64_t v46 = 4;
          goto LABEL_91;
        case 8u:
          v47 = __VGLogSharedInstance();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_260C8D000, v47, OS_LOG_TYPE_DEBUG, " Ear out of frame ", buf, 2u);
          }
          uint64_t v46 = 7;
LABEL_91:

LABEL_92:
          [v61 setError:v46];
          break;
        default:
          break;
      }
      [v7 setTrackedData:v61];
      if ([v7 progressType] == 3)
      {
        id v48 = [[VGHRTFEarsFrameData alloc] initEmpty];
        v49 = self->_selector;
        if (v49)
        {
          [(VGEarPCAFrameSelector *)v49 leftEarEnrolledPoses];
        }
        else
        {
          memset(buf, 0, sizeof(buf));
          *(void *)&long long v80 = 0;
        }
        v50 = detail::getEarFrameData((uint64_t *)buf);
        [v48 setLeftEarFrames:v50];

        *(void *)v68 = buf;
        std::vector<EarFrame>::__destroy_vector::operator()[abi:ne180100]((void ***)v68);
        v51 = self->_selector;
        if (v51)
        {
          [(VGEarPCAFrameSelector *)v51 rightEarEnrolledPoses];
        }
        else
        {
          memset(buf, 0, sizeof(buf));
          *(void *)&long long v80 = 0;
        }
        v52 = detail::getEarFrameData((uint64_t *)buf);
        [v48 setRightEarFrames:v52];

        *(void *)v68 = buf;
        std::vector<EarFrame>::__destroy_vector::operator()[abi:ne180100]((void ***)v68);
        [v7 setResult:v48];
      }
      id v22 = v7;

      v55[2](v55);
      v54[2](v54);

      goto LABEL_102;
    }
    id v56 = [[VGHRTFEarCaptureDetectionData alloc] initEmpty];
    if (v30)
    {
      [v30 pose];
    }
    else
    {
      *(_OWORD *)v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      *(_OWORD *)v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      *(_OWORD *)buf = 0u;
    }
    size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v21 yuvRectified]);
    size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v21 yuvRectified]);
    long long v34 = v86;
    if (v30)
    {
      [v30 pose];
      BOOL v35 = *(_DWORD *)v68 == 0;
      if (*((void *)&v77 + 1))
      {
        *(void *)&long long v78 = *((void *)&v77 + 1);
        operator delete(*((void **)&v77 + 1));
      }
    }
    else
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      *(_OWORD *)v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      BOOL v35 = 1;
      *(_OWORD *)v68 = 0u;
    }
    if (v76[0])
    {
      v76[1] = v76[0];
      operator delete(v76[0]);
    }
    if (v35)
    {
      uint64_t v36 = 0;
    }
    else
    {
      if (v30)
      {
        [v30 pose];
        BOOL v37 = *(_DWORD *)v68 == 1;
        if (*((void *)&v77 + 1))
        {
          *(void *)&long long v78 = *((void *)&v77 + 1);
          operator delete(*((void **)&v77 + 1));
        }
      }
      else
      {
        BOOL v37 = 0;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        *(_OWORD *)v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        *(_OWORD *)v68 = 0u;
      }
      if (v76[0])
      {
        v76[1] = v76[0];
        operator delete(v76[0]);
      }
      if (!v37)
      {
        v40 = __VGLogSharedInstance();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_260C8D000, v40, OS_LOG_TYPE_ERROR, " No suitable conversion supported for ear side. ", v68, 2u);
        }
        id v31 = 0;
        goto LABEL_62;
      }
      uint64_t v36 = 1;
    }
    [v56 setEarSide:v36];
    if (v30)
    {
      [v30 pose];
      float v38 = *((float *)&v74 + 1);
    }
    else
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      *(_OWORD *)v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      float v38 = 0.0;
      *(_OWORD *)v68 = 0u;
    }
    [v56 setYawAngle:v38];
    if (*((void *)&v77 + 1))
    {
      *(void *)&long long v78 = *((void *)&v77 + 1);
      operator delete(*((void **)&v77 + 1));
    }
    if (v76[0])
    {
      v76[1] = v76[0];
      operator delete(v76[0]);
    }
    if (v30)
    {
      [v30 pose];
      float v39 = *((float *)&v74 + 2);
    }
    else
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      *(_OWORD *)v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      float v39 = 0.0;
      *(_OWORD *)v68 = 0u;
    }
    [v56 setPitchAngle:v39];
    if (*((void *)&v77 + 1))
    {
      *(void *)&long long v78 = *((void *)&v77 + 1);
      operator delete(*((void **)&v77 + 1));
    }
    if (v76[0])
    {
      v76[1] = v76[0];
      operator delete(v76[0]);
    }
    objc_msgSend(v56, "setBoundingBox:", (float)(*(float *)&v34 * (float)Width), (float)(*((float *)&v34 + 1) * (float)Height), (float)((float)(*((float *)&v34 + 2) - *(float *)&v34) * (float)Width), (float)((float)(*((float *)&v34 + 3) - *((float *)&v34 + 1)) * (float)Height));
    v40 = objc_opt_new();
    if (v30)
    {
      [v30 pose];
      v43 = v76[0];
      for (unsigned int i = v76[1]; v43 != i; ++v43)
      {
        LODWORD(v41) = *v43;
        v44 = [NSNumber numberWithFloat:v41];
        [v40 addObject:v44];
      }
    }
    else
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      *(_OWORD *)v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      *(_OWORD *)v68 = 0u;
    }
    if (*((void *)&v77 + 1))
    {
      *(void *)&long long v78 = *((void *)&v77 + 1);
      operator delete(*((void **)&v77 + 1));
    }
    if (v76[0])
    {
      v76[1] = v76[0];
      operator delete(v76[0]);
    }
    [v56 setLandmarkPoints:v40];
    id v31 = v56;
LABEL_62:

    if (v88[1])
    {
      *(void **)&long long v89 = v88[1];
      operator delete(v88[1]);
    }
    if (v87[0])
    {
      v87[1] = v87[0];
      operator delete(v87[0]);
    }

    goto LABEL_67;
  }
  v21 = __VGLogSharedInstance();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_260C8D000, v21, OS_LOG_TYPE_ERROR, " Failed to rectify ear images. ", buf, 2u);
  }
  id v22 = 0;
LABEL_102:

  if (v95)
  {
  }

  return v22;
}

void __60__VGHRTFEarPCACaptureProcessor_processCaptureData_faceData___block_invoke(uint64_t a1)
{
}

void __60__VGHRTFEarPCACaptureProcessor_processCaptureData_faceData___block_invoke_2(uint64_t a1)
{
}

- (void).cxx_destruct
{
  std::unique_ptr<vg::hrtf::Rectify>::reset[abi:ne180100]((vg::hrtf::Rectify **)&self->_rectify, 0);
  objc_storeStrong((id *)&self->_earCaptureOptions, 0);

  objc_storeStrong((id *)&self->_selector, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end