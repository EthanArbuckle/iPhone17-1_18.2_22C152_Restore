@interface VGHRTFFaceCaptureProcessor
- (VGHRTFFaceCaptureProcessor)initWithDebugDataPath:(id)a3;
- (id).cxx_construct;
- (id)processCaptureData:(id)a3 faceData:(id)a4;
@end

@implementation VGHRTFFaceCaptureProcessor

- (VGHRTFFaceCaptureProcessor)initWithDebugDataPath:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VGHRTFFaceCaptureProcessor;
  v5 = [(VGHRTFFaceCaptureProcessor *)&v14 init];
  if (v5)
  {
    v6 = objc_opt_new();
    LODWORD(v7) = 30.0;
    [v6 setYawLimit:v7];
    [v6 setRequiredPitchPoses:0];
    [v6 setWriteDebugData:v4 != 0];
    [v6 setDebugDataPath:v4];
    [v6 setUseFKInternalFaceDetector:1];
    v8 = [[VGFaceCapture alloc] initWithOptions:v6];
    capturer = v5->_capturer;
    v5->_capturer = v8;

    if (v5->_capturer) {
      vg::hrtf::Rectify::create(v10);
    }
    v11 = __VGLogSharedInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_260C8D000, v11, OS_LOG_TYPE_ERROR, " Failed to initialize VGFaceCapture ", (uint8_t *)&v13, 2u);
    }
  }
  else
  {
    v6 = __VGLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_260C8D000, v6, OS_LOG_TYPE_ERROR, " Failed to initialize VGHRTFCaptureProcessor ", (uint8_t *)&v13, 2u);
    }
  }

  return 0;
}

- (id)processCaptureData:(id)a3 faceData:(id)a4
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [[VGHRTFFaceCaptureUpdateData alloc] initEmpty];
  [v8 setProgressType:self->_captureState];
  *(float *)&double v9 = self->_progress;
  [v8 setProgress:v9];
  v10 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_poseStatus copyItems:1];
  [v8 setPoseStatusList:v10];

  [v8 setTrackedData:0];
  [v8 setResult:self->_resultsCache];
  if (v7)
  {
    value = self->_rectify.__ptr_.__value_;
    v12 = [v6 colorBuffer];
    v13 = [v6 depthBuffer];
    [v6 colorIntrinsics];
    simd_float3 v66 = v15;
    simd_float3 v68 = v14;
    simd_float3 v65 = v16;
    v17 = [v6 depthCalibrationData];
    v90.columns[1] = v66;
    v90.columns[0] = v68;
    v90.columns[2] = v65;
    vg::hrtf::Rectify::process((vg::hrtf::Rectify *)value, v12, v13, v90, v17, (uint64_t)v79);

    if (v87)
    {
      v18 = __VGLogSharedInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_260C8D000, v18, OS_LOG_TYPE_DEBUG, " Rectified face images. ", buf, 2u);
      }

      v19 = objc_opt_new();
      if (!v87) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      CVPixelBufferRef CVPixelBufferFromIOSurface = createCVPixelBufferFromIOSurface(v83);
      v77[0] = MEMORY[0x263EF8330];
      v77[1] = 3221225472;
      v77[2] = __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke;
      v77[3] = &__block_descriptor_40_e5_v8__0l;
      v77[4] = CVPixelBufferFromIOSurface;
      v67 = (void (**)(void))MEMORY[0x261227FC0](v77);
      [v19 setDepth:CVPixelBufferFromIOSurface];
      if (!v87) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      objc_msgSend(v19, "setDepthIntrinsics:", v84, v85, v86);
      if (!v87) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      CVPixelBufferRef v21 = createCVPixelBufferFromIOSurface(*(IOSurface **)v79);
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke_2;
      v76[3] = &__block_descriptor_40_e5_v8__0l;
      v76[4] = v21;
      v69 = (void (**)(void))MEMORY[0x261227FC0](v76);
      [v19 setYuvRectified:v21];
      if (!v87) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      objc_msgSend(v19, "setVideoIntrinsics:", v80, v81, v82);
      v22 = [v7 yawAngle];
      if (v22)
      {
        v23 = [v7 yawAngle];
        [v23 floatValue];
        float v25 = v24;
      }
      else
      {
        float v25 = 0.0;
      }

      v30 = [v7 rollAngle];
      if (v30)
      {
        v31 = [v7 rollAngle];
        [v31 floatValue];
        float v33 = v32;
      }
      else
      {
        float v33 = 0.0;
      }

      v34 = [VGFaceMetadata alloc];
      uint64_t v35 = [v7 trackedId];
      [v7 boundingBox];
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      v44 = [v6 colorBuffer];
      unint64_t v45 = [v44 width];
      v46 = [v6 colorBuffer];
      unint64_t v47 = [v46 height];
      v48 = -[VGFaceMetadata initWithFaceId:bounds:yawAngle:rollAngle:](v34, "initWithFaceId:bounds:yawAngle:rollAngle:", v35, v37 / (double)v45, v39 / (double)v47, v41 / (double)v45, v43 / (double)v47, v25, v33);
      [v19 setFace:v48];

      [v6 timestamp];
      CMTimeMakeWithSeconds(&v75, v49, 1000000);
      CMTime v74 = v75;
      [v19 setTimestamp:&v74];
      v50 = self->_semaphore;
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      v70[2] = __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke_3;
      v70[3] = &unk_265570240;
      v51 = v50;
      v71 = v51;
      v72 = self;
      id v52 = v8;
      id v73 = v52;
      v53 = (void *)MEMORY[0x261227FC0](v70);
      if ([(VGFaceCapture *)self->_capturer processWithCaptureData:v19 callback:v53])
      {
        dispatch_semaphore_wait(v51, 0xFFFFFFFFFFFFFFFFLL);
        [v52 progress];
        self->_progress = v54;
        self->_captureState = [v52 progressType];
        id v55 = objc_alloc(MEMORY[0x263EFF8C0]);
        v56 = [v52 poseStatusList];
        v57 = (NSArray *)[v55 initWithArray:v56 copyItems:1];
        poseStatus = self->_poseStatus;
        self->_poseStatus = v57;

        IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v19 yuvRectified]);
        v60 = [v52 trackedData];
        [v60 setRectifiedColorBuffer:IOSurface];

        IOSurfaceRef v61 = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v19 depth]);
        v62 = [v52 trackedData];
        [v62 setRectifiedDepthBuffer:v61];
      }
      else
      {
        v62 = __VGLogSharedInstance();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_260C8D000, v62, OS_LOG_TYPE_ERROR, " Face tracking failed ", buf, 2u);
        }
      }

      id v63 = v52;
      v69[2](v69);

      v67[2](v67);
    }
    else
    {
      v28 = __VGLogSharedInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_260C8D000, v28, OS_LOG_TYPE_ERROR, " Failed to rectify face images. ", buf, 2u);
      }

      id v29 = v8;
    }
    if (v87)
    {
    }
  }
  else
  {
    v26 = __VGLogSharedInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v79 = 0;
      _os_log_impl(&dword_260C8D000, v26, OS_LOG_TYPE_ERROR, " Face not found. ", v79, 2u);
    }

    id v27 = v8;
  }

  return v8;
}

void __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke(uint64_t a1)
{
}

void __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke_2(uint64_t a1)
{
}

void __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  memptr[2] = *(void **)MEMORY[0x263EF8340];
  id v69 = a2;
  id v68 = a3;
  v85[0] = MEMORY[0x263EF8330];
  v85[1] = 3221225472;
  v85[2] = __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke_4;
  v85[3] = &unk_265570218;
  uint64_t v70 = a1;
  id v86 = *(id *)(a1 + 32);
  v67 = (void (**)(void))MEMORY[0x261227FC0](v85);
  LODWORD(a3) = [v69 failed];
  int v5 = [v69 completed];
  if (a3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  if (v5)
  {
    if (v68)
    {
      id v77 = v68;
      uint64_t v76 = [v77 count];
      CMTime v75 = objc_opt_new();
      if (v76)
      {
        uint64_t v7 = 0;
        uint64_t v74 = *MEMORY[0x263F26AC0];
        uint64_t v73 = *MEMORY[0x263F26AA0];
        uint64_t v72 = *MEMORY[0x263F26A30];
        uint64_t v71 = *MEMORY[0x263F26A38];
        do
        {
          v83 = [v77 objectAtIndexedSubscript:v7];
          id v8 = [[VGHRTFFaceFrameData alloc] initEmpty];
          double v9 = [v83 captureData];
          v10 = [v9 faceTrackingResult];
          double v81 = [v10 objectForKey:v74];

          v78 = [v81 objectAtIndex:0];
          v79 = [v78 objectForKey:v73];
          double v80 = [v79 objectForKey:v72];
          v11 = [v80 objectForKey:v71];
          unint64_t v12 = [v11 length];
          id v13 = v11;
          simd_float3 v14 = (_DWORD *)[v13 bytes];
          unint64_t v15 = v12 >> 3;
          unsigned int v16 = 2 * (v12 >> 3);
          memptr[0] = 0;
          malloc_type_posix_memalign(memptr, 0x20uLL, (4 * v16 + 31) & 0x7FFFFFFE0, 0x49090899uLL);
          v17 = memptr[0];
          if (v14 == memptr[0])
          {
            memptr[0] = 0;
            malloc_type_posix_memalign(memptr, 0x20uLL, ((v12 & 0x3FFFFFFF8) + 31) & 0x7FFFFFFE0, 0x49090899uLL);
            v17 = memptr[0];
            if (v16)
            {
              unint64_t v26 = 0;
              if ((v15 & 0x7FFFFFFF) != 0) {
                id v27 = v14;
              }
              else {
                id v27 = 0;
              }
              uint64_t v28 = v12 & 0x3FFFFFFF8;
              id v29 = memptr[0];
              do
              {
                *v29++ = *v27;
                unint64_t v30 = HIDWORD(v26);
                BOOL v31 = (int)v26 < 1;
                if ((int)v26 < 1) {
                  unint64_t v30 = 0;
                }
                float v32 = &v27[v30];
                uint64_t v33 = (v26 + 1);
                unint64_t v34 = v26 & 0xFFFFFFFF00000000;
                if (!v31) {
                  uint64_t v33 = 0;
                }
                unint64_t v26 = v33 | v34;
                id v27 = v32 + 1;
                v28 -= 4;
              }
              while (v28);
            }
            free(v14);
          }
          else if (v16)
          {
            unint64_t v18 = 0;
            unint64_t v19 = 0;
            if ((v15 & 0x7FFFFFFF) != 0) {
              v20 = v14;
            }
            else {
              v20 = 0;
            }
            do
            {
              v17[v18 / 4] = *v20;
              unint64_t v21 = HIDWORD(v19);
              BOOL v22 = (int)v19 < 1;
              if ((int)v19 < 1) {
                unint64_t v21 = 0;
              }
              v23 = &v20[v21];
              uint64_t v24 = (v19 + 1);
              unint64_t v25 = v19 & 0xFFFFFFFF00000000;
              if (!v22) {
                uint64_t v24 = 0;
              }
              unint64_t v19 = v24 | v25;
              v20 = v23 + 1;
              v18 += 4;
            }
            while ((v12 & 0x3FFFFFFF8) != v18);
          }
          uint64_t v35 = objc_opt_new();
          if (v12 >= 8)
          {
            unsigned int v37 = 1;
            unsigned int v38 = 1;
            do
            {
              LODWORD(v36) = v17[v37 - 1];
              double v39 = [NSNumber numberWithFloat:v36];
              [v35 addObject:v39];

              LODWORD(v40) = v17[v37];
              double v41 = [NSNumber numberWithFloat:v40];
              [v35 addObject:v41];

              BOOL v22 = v15 > v38++;
              v37 += 2;
            }
            while (v22);
          }
          double v42 = [v83 captureData];
          objc_msgSend(v8, "setRgbImage:", CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v42, "rgbRectified")));

          double v43 = [v83 captureData];
          objc_msgSend(v8, "setDepthImage:", CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v43, "depth")));

          v44 = [v83 captureData];
          [v44 depthIntrinsics];
          objc_msgSend(v8, "setDepthIntrinsics:", v45, v46, v47);

          [v8 setLandmarks:v35];
          [v75 addObject:v8];

          free(v17);
          ++v7;
        }
        while (v7 != v76);
      }

      uint64_t v48 = *(void *)(v70 + 40);
      Float64 v49 = *(void **)(v48 + 56);
      *(void *)(v48 + 56) = v75;
    }
    uint64_t v6 = 4;
  }
  id v50 = [[VGHRTFFaceCaptureProcessedData alloc] initEmpty];
  v51 = [v69 rejectionState];
  if ([v51 reason] == 1) {
    goto LABEL_51;
  }
  id v52 = [v69 rejectionState];
  if ([v52 reason] == 5)
  {
LABEL_50:

LABEL_51:
    goto LABEL_52;
  }
  v53 = [v69 rejectionState];
  if ([v53 reason] == 2)
  {
LABEL_49:

    goto LABEL_50;
  }
  float v54 = [v69 rejectionState];
  if ([v54 reason] == 3)
  {
LABEL_48:

    goto LABEL_49;
  }
  id v55 = [v69 rejectionState];
  if ([v55 reason] == 4)
  {
LABEL_47:

    goto LABEL_48;
  }
  v56 = [v69 rejectionState];
  if ([v56 reason] == 33)
  {
LABEL_46:

    goto LABEL_47;
  }
  v57 = [v69 rejectionState];
  if ([v57 reason] == 36)
  {
LABEL_45:

    goto LABEL_46;
  }
  double v84 = [v69 rejectionState];
  if ([v84 reason] == 35)
  {

    goto LABEL_45;
  }
  v62 = [v69 rejectionState];
  BOOL v82 = [v62 reason] == 36;

  if (!v82)
  {
    id v63 = NSNumber;
    [v69 yawAngle];
    v64 = objc_msgSend(v63, "numberWithFloat:");
    [v50 setYawAngle:v64];

    simd_float3 v65 = NSNumber;
    [v69 pitchAngle];
    simd_float3 v66 = objc_msgSend(v65, "numberWithFloat:");
    [v50 setPitchAngle:v66];

    goto LABEL_53;
  }
LABEL_52:
  [v50 setYawAngle:0];
  [v50 setPitchAngle:0];
LABEL_53:
  [*(id *)(v70 + 48) setProgressType:v6];
  [v69 progress];
  objc_msgSend(*(id *)(v70 + 48), "setProgress:");
  id v58 = v69;
  v59 = detail::getFacePoseList(v58, 0);
  memptr[0] = v59;
  v60 = detail::getFacePoseList(v58, 1);
  memptr[1] = v60;
  IOSurfaceRef v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:memptr count:2];

  [*(id *)(v70 + 48) setPoseStatusList:v61];
  [*(id *)(v70 + 48) setTrackedData:v50];
  [*(id *)(v70 + 48) setResult:*(void *)(*(void *)(v70 + 40) + 56)];

  v67[2](v67);
}

intptr_t __58__VGHRTFFaceCaptureProcessor_processCaptureData_faceData___block_invoke_4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsCache, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_poseStatus, 0);
  std::unique_ptr<vg::hrtf::Rectify>::reset[abi:ne180100]((vg::hrtf::Rectify **)&self->_rectify, 0);

  objc_storeStrong((id *)&self->_capturer, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end