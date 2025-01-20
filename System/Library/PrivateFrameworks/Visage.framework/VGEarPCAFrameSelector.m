@interface VGEarPCAFrameSelector
- (VGEarPCAFrameSelector)initWithOptions:(id)a3;
- (float)getMotionBlurScoreFromLandmarks:()vector<float isEarDetected:(std:(BOOL)a4 :(id *)a5 allocator<float>> *)a3 frameTimestamp:;
- (id).cxx_construct;
- (id)addPoseWithCaptureData:(id)a3 faceYaw:(id)a4;
- (id)currentState;
- (unsigned)requiredPosesCount;
- (vector<EarFrame,)leftEarEnrolledPoses;
- (vector<EarFrame,)posesFromGroup:(VGEarPCAFrameSelector *)self;
- (vector<EarFrame,)rightEarEnrolledPoses;
@end

@implementation VGEarPCAFrameSelector

- (VGEarPCAFrameSelector)initWithOptions:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VGEarPCAFrameSelector;
  v5 = [(VGEarPCAFrameSelector *)&v18 init];
  if (v5)
  {
    v6 = VGLogVGEarPCASelectionState();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = [v4 description];
      [(VGEarPCAFrameSelector *)v7 initWithOptions:v6];
    }

    v8 = [v4 modelsRootPath];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      [v4 earPresenceThreshold];
      [v4 earOcclusionThreshold];
      [v4 bboxVisibilityThreshold];
      [v4 landmarkVisibilityThreshold];
      [v4 faceYawLimit];
      id v10 = [v4 modelsRootPath];
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v10 UTF8String]);
      char v15 = [v4 useEarSideSmoothPredictor];
      int v16 = [v4 earSideSmoothPredictorBufferCapacity];
      [v4 earSideSmoothPredictorConfidenceThreshold];
      int v17 = v11;

      vg::ear_detection::EarPCADetector::create();
    }
    v12 = VGLogVGEarPCASelectionState();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[VGEarPCAFrameSelector initWithOptions:]();
    }
  }
  return 0;
}

- (vector<EarFrame,)posesFromGroup:(VGEarPCAFrameSelector *)self
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  std::vector<EarFrame>::reserve((uint64_t *)retstr, 3uLL);
  uint64_t v6 = 0;
  var1 = retstr->var1;
  do
  {
    v8 = (char *)a4 + v6;
    if (var1 >= retstr->var2.var0)
    {
      result = (vector<EarFrame, std::allocator<EarFrame>> *)std::vector<EarFrame>::__emplace_back_slow_path<EarFrame const&>((uint64_t *)retstr, (uint64_t)v8);
      var1 = (EarFrame *)result;
    }
    else
    {
      result = (vector<EarFrame, std::allocator<EarFrame>> *)std::construct_at[abi:ne180100]<EarFrame,EarFrame const&,EarFrame*>((uint64_t)var1, (uint64_t)v8);
      var1 += 4;
      retstr->var1 = var1;
    }
    retstr->var1 = var1;
    v6 += 192;
  }
  while (v6 != 576);
  return result;
}

- (vector<EarFrame,)leftEarEnrolledPoses
{
  return [(VGEarPCAFrameSelector *)self posesFromGroup:&self->_leftEarGroup];
}

- (vector<EarFrame,)rightEarEnrolledPoses
{
  return [(VGEarPCAFrameSelector *)self posesFromGroup:&self->_rightEarGroup];
}

- (unsigned)requiredPosesCount
{
  return [(VGEarPCACaptureOptions *)self->_options frameCountThreshold];
}

- (id)currentState
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unsigned int v3 = [(VGEarPCACaptureOptions *)self->_options frameCountThreshold];
  unsigned int v4 = [(VGEarPCACaptureOptions *)self->_options frameCountThreshold];
  if (v4 >= self->_leftFrameCount) {
    unsigned int leftFrameCount = self->_leftFrameCount;
  }
  else {
    unsigned int leftFrameCount = v4;
  }
  unsigned int v6 = [(VGEarPCACaptureOptions *)self->_options frameCountThreshold];
  unsigned int v7 = [(VGEarPCACaptureOptions *)self->_options frameCountThreshold];
  if (v7 >= self->_rightFrameCount) {
    unsigned int rightFrameCount = self->_rightFrameCount;
  }
  else {
    unsigned int rightFrameCount = v7;
  }
  unsigned int v9 = 2 * [(VGEarPCACaptureOptions *)self->_options frameCountThreshold];
  id v10 = objc_alloc_init(VGEarPCASelectionState);
  [(VGEarPCASelectionState *)v10 setFailed:v9 == 0];
  int v11 = v6 - rightFrameCount + v3 - leftFrameCount;
  v12 = VGLogVGEarPCASelectionState();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 67109634;
    v16[1] = v11;
    __int16 v17 = 1024;
    unsigned int v18 = v9;
    __int16 v19 = 2112;
    uint64_t v20 = v10;
    _os_log_debug_impl(&dword_260C8D000, v12, OS_LOG_TYPE_DEBUG, "%u/%u %@", (uint8_t *)v16, 0x18u);
  }

  [(VGEarPCASelectionState *)v10 setLeftFrameCount:self->_leftFrameCount];
  [(VGEarPCASelectionState *)v10 setRightFrameCount:self->_rightFrameCount];
  [(VGEarPCASelectionState *)v10 setLeftEarCompleted:self->_leftFrameCount >= [(VGEarPCACaptureOptions *)self->_options frameCountThreshold]];
  [(VGEarPCASelectionState *)v10 setRightEarCompleted:self->_rightFrameCount >= [(VGEarPCACaptureOptions *)self->_options frameCountThreshold]];
  if (![(VGEarPCASelectionState *)v10 failed])
  {
    uint64_t v13 = [(VGEarPCASelectionState *)v10 leftEarCompleted]
       && [(VGEarPCASelectionState *)v10 rightEarCompleted];
    [(VGEarPCASelectionState *)v10 setCompleted:v13];
    if (v9)
    {
      *(float *)&double v14 = (float)(v9 - v11) / (float)v9;
      [(VGEarPCASelectionState *)v10 setProgress:v14];
    }
  }

  return v10;
}

- (float)getMotionBlurScoreFromLandmarks:()vector<float isEarDetected:(std:(BOOL)a4 :(id *)a5 allocator<float>> *)a3 frameTimestamp:
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  [(VGEarPCACaptureOptions *)self->_options motionBlurFilterThreshold];
  float v10 = v9;
  if (a4)
  {
    CMTime time = (CMTime)*a5;
    unint64_t v11 = (unint64_t)(CMTimeGetSeconds(&time) * 1000.0);
    p_previousFrameTimestampMS = (uint64_t *)&self->_previousFrameTimestampMS;
    if (self->_previousFrameTimestampMS <= v11)
    {
      __src = 0;
      v46 = 0;
      v47 = 0;
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm(&__src, 0x31uLL);
      uint64_t v14 = 0;
      char v15 = v46;
      do
      {
        uint64_t v16 = *(void *)&a3->var0[2 * v14];
        if (v15 >= v47)
        {
          uint64_t v17 = (v15 - (unsigned char *)__src) >> 3;
          if ((unint64_t)(v17 + 1) >> 61) {
            std::vector<vg::hrtf::FaceFrameData>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v18 = (v47 - (unsigned char *)__src) >> 2;
          if (v18 <= v17 + 1) {
            unint64_t v18 = v17 + 1;
          }
          if ((unint64_t)(v47 - (unsigned char *)__src) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v18;
          }
          if (v19) {
            uint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<IOSurface * {__strong}>>((uint64_t)&v47, v19);
          }
          else {
            uint64_t v20 = 0;
          }
          uint64_t v21 = &v20[8 * v17];
          *(void *)uint64_t v21 = v16;
          char v15 = v21 + 8;
          v23 = (char *)__src;
          v22 = v46;
          if (v46 != __src)
          {
            do
            {
              uint64_t v24 = *((void *)v22 - 1);
              v22 -= 8;
              *((void *)v21 - 1) = v24;
              v21 -= 8;
            }
            while (v22 != v23);
            v22 = (char *)__src;
          }
          __src = v21;
          v46 = v15;
          v47 = &v20[8 * v19];
          if (v22) {
            operator delete(v22);
          }
        }
        else
        {
          *(void *)char v15 = v16;
          v15 += 8;
        }
        v46 = v15;
        ++v14;
      }
      while (v14 != 49);
      v25 = (char *)__src;
      if (self->_hasPreviousLandmarks)
      {
        uint64_t v26 = *p_previousFrameTimestampMS;
        __p = 0;
        v43 = 0;
        v44 = 0;
        std::vector<float>::reserve(&__p, (v15 - (unsigned char *)__src) >> 3);
        v27 = (char *)__src;
        if (v46 != __src)
        {
          unint64_t v28 = 0;
          v29 = v43;
          do
          {
            float32x2_t v30 = vsub_f32(*(float32x2_t *)&v27[8 * v28], (float32x2_t)self->_previousLandmarksCoords.var0[v28]);
            float v31 = (float)(vaddv_f32(vmul_f32(v30, v30)) / (float)(v11 - v26)) / (float)((float)(v11 - v26) / 30.0);
            if (v29 >= v44)
            {
              v33 = (float *)__p;
              uint64_t v34 = ((char *)v29 - (unsigned char *)__p) >> 2;
              unint64_t v35 = v34 + 1;
              if ((unint64_t)(v34 + 1) >> 62) {
                std::vector<vg::hrtf::FaceFrameData>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v36 = (char *)v44 - (unsigned char *)__p;
              if (((char *)v44 - (unsigned char *)__p) >> 1 > v35) {
                unint64_t v35 = v36 >> 1;
              }
              if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v37 = v35;
              }
              if (v37)
              {
                v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v44, v37);
                v33 = (float *)__p;
                v29 = v43;
              }
              else
              {
                v38 = 0;
              }
              v39 = (float *)&v38[4 * v34];
              float *v39 = v31;
              v32 = v39 + 1;
              while (v29 != v33)
              {
                int v40 = *((_DWORD *)v29-- - 1);
                *((_DWORD *)v39-- - 1) = v40;
              }
              __p = v39;
              v43 = v32;
              v44 = (float *)&v38[4 * v37];
              if (v33) {
                operator delete(v33);
              }
            }
            else
            {
              float *v29 = v31;
              v32 = v29 + 1;
            }
            v43 = v32;
            ++v28;
            v27 = (char *)__src;
            v29 = v32;
          }
          while (v28 < (v46 - (unsigned char *)__src) >> 3);
        }
        vg::shared::computeMedian<float>();
      }
      if (&self->_previousLandmarksCoords != (vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> *)&__src)
      {
        _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)&self->_previousLandmarksCoords, (char *)__src, (uint64_t)v46, (v46 - (unsigned char *)__src) >> 3);
        v25 = (char *)__src;
      }
      self->_hasPreviousLandmarks = 1;
      self->_previousFrameTimestampMS = v11;
      if (v25)
      {
        v46 = v25;
        operator delete(v25);
      }
    }
    else
    {
      uint64_t v13 = VGLogVGEarPCASelectionState();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[VGEarPCAFrameSelector getMotionBlurScoreFromLandmarks:isEarDetected:frameTimestamp:](p_previousFrameTimestampMS, v11, v13);
      }
    }
  }
  else
  {
    self->_hasPreviousLandmarks = 0;
  }
  return v10;
}

- (id)addPoseWithCaptureData:(id)a3 faceYaw:(id)a4
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  float v9 = [(VGEarPCAFrameSelector *)self currentState];
  [v9 setDetectionError:1];
  if ([v9 failed])
  {
    id v10 = v9;
    goto LABEL_66;
  }
  if (v7) {
    [v7 timestamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  v12 = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v7 yuvRectified]);
  if (!v12)
  {
    uint64_t v16 = VGLogVGEarPCASelectionState();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[VGEarPCAFrameSelector addPoseWithCaptureData:faceYaw:]();
    }

    id v10 = v9;
    goto LABEL_65;
  }
  uint64_t v13 = CVPixelBufferGetIOSurface((CVPixelBufferRef)[v7 depth]);
  if (!v13)
  {
    uint64_t v17 = VGLogVGEarPCASelectionState();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[VGEarPCAFrameSelector addPoseWithCaptureData:faceYaw:]();
    }

    id v10 = v9;
    goto LABEL_64;
  }
  if (v8)
  {
    [v8 floatValue];
    uint64_t v15 = 0x100000000;
  }
  else
  {
    uint64_t v15 = 0;
    unsigned int v14 = 0;
  }
  vg::ear_detection::EarPCADetector::detectPCA((uint64_t *)self->_earPCADetector.__ptr_.__value_, v12, v13, v15 | v14, (uint64_t)v79);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  BYTE12(v62) = 0;
  LOBYTE(v63) = 0;
  *(_OWORD *)v65 = 0u;
  *(_OWORD *)v66 = 0u;
  long long v67 = 0u;
  if (v84)
  {
    long long v61 = v79[4];
    long long v62 = v79[5];
    long long v63 = v79[6];
    long long v64 = v79[7];
    long long v57 = v79[0];
    long long v58 = v79[1];
    long long v59 = v79[2];
    long long v60 = v79[3];
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)v65, (char *)__src, v81, (v81 - (uint64_t)__src) >> 2);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&v66[1], (char *)v82, v83, (v83 - (uint64_t)v82) >> 2);
  }
  unsigned int v18 = v85;
  [v9 setDetectionError:v85];
  v50[4] = v61;
  v50[5] = v62;
  v50[6] = v63;
  v50[7] = v64;
  v50[0] = v57;
  v50[1] = v58;
  v50[2] = v59;
  v50[3] = v60;
  v52 = 0;
  uint64_t v53 = 0;
  v51 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v51, v65[0], (uint64_t)v65[1], ((char *)v65[1] - (char *)v65[0]) >> 2);
  __p = 0;
  v55 = 0;
  uint64_t v56 = 0;
  std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v66[1], v67, (uint64_t)(v67 - (unint64_t)v66[1]) >> 2);
  [v9 setPose:v50];
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  double v19 = Seconds * 1000.0;
  if (v51)
  {
    v52 = v51;
    operator delete(v51);
  }
  uint64_t v20 = (VGCaptureData *)v19;
  options = self->_options;
  if (!v18)
  {
    if ([(VGEarPCACaptureOptions *)options useMotionBlurFilter])
    {
      v47 = 0;
      v48 = 0;
      uint64_t v49 = 0;
      std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v47, v65[0], (uint64_t)v65[1], ((char *)v65[1] - (char *)v65[0]) >> 2);
      if (v7) {
        [v7 timestamp];
      }
      else {
        memset(v46, 0, sizeof(v46));
      }
      [(VGEarPCAFrameSelector *)self getMotionBlurScoreFromLandmarks:&v47 isEarDetected:1 frameTimestamp:v46];
      float v24 = v23;
      if (v47)
      {
        v48 = v47;
        operator delete(v47);
      }
      [(VGEarPCACaptureOptions *)self->_options motionBlurFilterThreshold];
      float v26 = v25;
      v27 = VGLogVGEarPCASelectionState();
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
      if (v24 >= v26)
      {
        if (v28)
        {
          [(VGEarPCACaptureOptions *)self->_options motionBlurFilterThreshold];
          LODWORD(location.captureData) = 134218496;
          *(VGCaptureData **)((char *)&location.captureData + 4) = v20;
          LOWORD(location.pose.lmPCA.__elems_[0]) = 2048;
          *(double *)((char *)location.pose.lmPCA.__elems_ + 2) = v24;
          HIWORD(location.pose.lmPCA.__elems_[2]) = 2048;
          *(double *)&location.pose.faceYawAngle = v31;
          _os_log_debug_impl(&dword_260C8D000, v27, OS_LOG_TYPE_DEBUG, "Frame#%zu rejected because of motion blur score greater or equal to threshold (%g >= %g)", (uint8_t *)&location, 0x20u);
        }

        [v9 setDetectionError:5];
        goto LABEL_29;
      }
      if (v28) {
        -[VGEarPCAFrameSelector addPoseWithCaptureData:faceYaw:]((uint64_t)v20, v27, v24);
      }
    }
    ++self->_frameCount;
    location.captureData = 0;
    *(_OWORD *)&location.pose.yawAngle = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    BYTE12(v73) = 0;
    LOBYTE(v74) = 0;
    *(_OWORD *)v76 = 0u;
    *(_OWORD *)v77 = 0u;
    long long v78 = 0u;
    objc_storeStrong((id *)&location.captureData, a3);
    long long v72 = v61;
    long long v73 = v62;
    long long v74 = v63;
    long long v75 = v64;
    *(_OWORD *)&location.pose.lmPCA.__elems_[1] = v57;
    *(_OWORD *)&location.pose.yawAngle = v58;
    long long v70 = v59;
    long long v71 = v60;
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)v76, (char *)v65[0], (uint64_t)v65[1], ((char *)v65[1] - (char *)v65[0]) >> 2);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&v77[1], (char *)v66[1], v67, (uint64_t)(v67 - (unint64_t)v66[1]) >> 2);
    if (v57 == 1)
    {
      uint64_t v29 = 1224;
    }
    else
    {
      if (v57)
      {
LABEL_48:
        id v10 = [(VGEarPCAFrameSelector *)self currentState];
        [v10 setDetectionError:0];
        long long v36 = v61;
        long long v37 = v62;
        long long v38 = v63;
        long long v39 = v64;
        long long v32 = v57;
        long long v33 = v58;
        long long v34 = v59;
        long long v35 = v60;
        v41 = 0;
        uint64_t v42 = 0;
        int v40 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v40, v65[0], (uint64_t)v65[1], ((char *)v65[1] - (char *)v65[0]) >> 2);
        v43 = 0;
        v44 = 0;
        uint64_t v45 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v43, v66[1], v67, (uint64_t)(v67 - (unint64_t)v66[1]) >> 2);
        [v10 setPose:&v32];
        if (v43)
        {
          v44 = v43;
          operator delete(v43);
        }
        if (v40)
        {
          v41 = v40;
          operator delete(v40);
        }
        objc_msgSend(v10, "setLeftEarCompleted:", objc_msgSend(v9, "leftEarCompleted", v32, v33, v34, v35, v36, v37, v38, v39));
        objc_msgSend(v10, "setRightEarCompleted:", objc_msgSend(v9, "rightEarCompleted"));
        if ([v10 completed]) {
          self->_selectionCompleted = 1;
        }
        if (v77[1])
        {
          *(void **)&long long v78 = v77[1];
          operator delete(v77[1]);
        }
        if (v76[0])
        {
          v76[1] = v76[0];
          operator delete(v76[0]);
        }

        goto LABEL_59;
      }
      uint64_t v29 = 1228;
    }
    ++*(_DWORD *)((char *)&self->super.isa + v29);
    goto LABEL_48;
  }
  if ([(VGEarPCACaptureOptions *)options useMotionBlurFilter]) {
    self->_hasPreviousLandmarks = 0;
  }
  v22 = VGLogVGEarPCASelectionState();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[VGEarPCAFrameSelector addPoseWithCaptureData:faceYaw:].cold.4((unint64_t)v19, v22);
  }

LABEL_29:
  id v10 = v9;
LABEL_59:
  if (v66[1])
  {
    *(void **)&long long v67 = v66[1];
    operator delete(v66[1]);
  }
  if (v65[0])
  {
    v65[1] = v65[0];
    operator delete(v65[0]);
  }
  std::__optional_destruct_base<vg::ear_detection::EarPose,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)v79);
LABEL_64:

LABEL_65:
LABEL_66:

  return v10;
}

- (void).cxx_destruct
{
  var0 = self->_previousLandmarksCoords.var0;
  if (var0)
  {
    *(void *)self->_anon_4e0 = var0;
    operator delete(var0);
  }
  for (uint64_t i = 0; i != -576; i -= 192)
  {
    v5 = (char *)self + i;
    unsigned int v6 = *(void **)&self->_anon_308[i + 400];
    if (v6)
    {
      *((void *)v5 + 148) = v6;
      operator delete(v6);
    }
    id v7 = (void *)*((void *)v5 + 144);
    if (v7)
    {
      *(void *)&self->_anon_308[i + 384] = v7;
      operator delete(v7);
    }
  }
  for (uint64_t j = 0; j != -576; j -= 192)
  {
    float v9 = (char *)self + j;
    id v10 = *(void **)&self->_anon_b8[j + 400];
    if (v10)
    {
      *((void *)v9 + 74) = v10;
      operator delete(v10);
    }
    unint64_t v11 = (void *)*((void *)v9 + 70);
    if (v11)
    {
      *(void *)&self->_anon_b8[j + 384] = v11;
      operator delete(v11);
    }
  }
  std::unique_ptr<vg::ear_detection::EarPCADetector>::reset[abi:ne180100]((vg::ear_detection::EarBoundingBoxModel ****)&self->_earPCADetector, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

- (id).cxx_construct
{
  uint64_t v2 = 0;
  *((void *)self + 2) = 0;
  do
  {
    unsigned int v3 = (char *)self + v2;
    *((void *)v3 + 4) = 0;
    *((_OWORD *)v3 + 4) = 0uLL;
    *((_OWORD *)v3 + 5) = 0uLL;
    *((_OWORD *)v3 + 6) = 0uLL;
    *((_OWORD *)v3 + 7) = 0uLL;
    v3[140] = 0;
    v3[144] = 0;
    *((_OWORD *)v3 + 11) = 0uLL;
    *((_OWORD *)v3 + 12) = 0uLL;
    v2 += 192;
    *((_OWORD *)v3 + 13) = 0uLL;
  }
  while (v2 != 576);
  for (uint64_t i = 0; i != 576; i += 192)
  {
    v5 = (char *)self + i;
    *((void *)v5 + 78) = 0;
    *((_OWORD *)v5 + 41) = 0uLL;
    *((_OWORD *)v5 + 42) = 0uLL;
    *((_OWORD *)v5 + 43) = 0uLL;
    *((_OWORD *)v5 + 44) = 0uLL;
    v5[732] = 0;
    v5[736] = 0;
    *((_OWORD *)v5 + 48) = 0uLL;
    *((_OWORD *)v5 + 49) = 0uLL;
    *((_OWORD *)v5 + 50) = 0uLL;
  }
  *((void *)self + 157) = 0;
  *(_OWORD *)((char *)self + 1240) = 0u;
  return self;
}

- (void)initWithOptions:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_260C8D000, v0, v1, "Unable to initialize due to nil models root path", v2, v3, v4, v5, v6);
}

- (void)initWithOptions:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_260C8D000, v0, v1, "Failed to create earPCADetector.", v2, v3, v4, v5, v6);
}

- (void)initWithOptions:(os_log_t)log .cold.3(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_260C8D000, log, OS_LOG_TYPE_DEBUG, "Ear frame selection options: %@", buf, 0xCu);
}

- (void)getMotionBlurScoreFromLandmarks:(uint64_t *)a1 isEarDetected:(uint64_t)a2 frameTimestamp:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134218496;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_260C8D000, log, OS_LOG_TYPE_ERROR, "Frame#%zu has timestamp value lower than the timestamp of the previously processed frame (%zu < %zu)", (uint8_t *)&v4, 0x20u);
}

- (void)addPoseWithCaptureData:faceYaw:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_260C8D000, v0, v1, "color image must be IOSurface backend.", v2, v3, v4, v5, v6);
}

- (void)addPoseWithCaptureData:faceYaw:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_260C8D000, v0, v1, "depth image must be IOSurface backend.", v2, v3, v4, v5, v6);
}

- (void)addPoseWithCaptureData:(float)a3 faceYaw:.cold.3(uint64_t a1, NSObject *a2, float a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_260C8D000, a2, OS_LOG_TYPE_DEBUG, "Frame#%zu selected by motion blur filter with score: %g", (uint8_t *)&v3, 0x16u);
}

- (void)addPoseWithCaptureData:(uint64_t)a1 faceYaw:(NSObject *)a2 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_260C8D000, a2, OS_LOG_TYPE_DEBUG, "Frame#%zu rejected because No Ear detected", (uint8_t *)&v2, 0xCu);
}

@end