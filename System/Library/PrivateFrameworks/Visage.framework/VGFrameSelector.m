@interface VGFrameSelector
+ (id)invalidPose;
+ (optional<std::vector<TargetPoseData>>)_computeTargetPosesForFrameCount:(SEL)a3 limit:(unint64_t)a4 desiredFrontPoseFrustumOffsets:(float)a5 desiredFrontPoseFrustumOffset:(optional<const VGFrameSelectorFrustumOffsets> *)a6 anglesDegrees:(optional<const VGFrameSelectorFrustumOffsets> *)a7 motionType:(id)a8 detectFrontPose:(int)a9 options:(BOOL)a10;
- (BOOL)completed;
- (BOOL)completedPitch;
- (BOOL)completedYaw;
- (FrameRejectionState)applyExpressionFilters:(SEL)a3 trackingData:(const void *)a4 frameTimestampMS:(id)a5 score:(unint64_t)a6;
- (FrameRejectionState)applyVisionFaceLandmarksFilter:(SEL)a3 bestTargetPoseData:(id)a4 frameTimestampMS:(const void *)a5;
- (FrameRejectionState)applyVisionFilters:(SEL)a3 bestTargetPoseData:(id)a4 frameTimestampMS:(const void *)a5;
- (NSDictionary)pitchResults;
- (NSDictionary)results;
- (NSDictionary)yawResults;
- (VGFrameSelector)initWithOptions:(id)a3;
- (id).cxx_construct;
- (id)processCaptureData:(int32x4_t)a3 trackingData:(int32x4_t)a4 framePose:(float32x4_t)a5 validDataFrameBounds:(uint64_t)a6;
- (id)processHeadPose:(HeadPoseData)a3 captureData:(id)a4 trackingData:(id)a5 validDataBounds:(const void *)a6 frameTimestampMS:(unint64_t)a7;
- (id)processHeadPoseSimple:(HeadPoseData)a3 frameTimestampMS:(unint64_t)a4;
- (id)resultsForMotionType:(optional<vg::frame_selection::MotionType>)a3;
- (id)selectedPitchValidPoses;
- (id)selectedValidPosesForMotion:(optional<vg::frame_selection::MotionType>)a3;
- (id)selectedYawValidPoses;
- (optional<simd_float4x4>)parseAtlasToCameraTransformation:(id)a3;
- (unint64_t)remainingPosesCount;
- (unint64_t)requiredPosesCount;
- (void)checkDepthFoVFilter:(uint64_t)a3@<X3> framePose:(double *)a4@<X4> bestTargetPoseData:(uint64_t)a5@<X5> validDataBounds:(uint64_t)a6@<X8> frameTimestampMS:(__n128)a7@<Q3>;
- (void)processHeadPose:captureData:trackingData:validDataBounds:frameTimestampMS:;
@end

@implementation VGFrameSelector

+ (id)invalidPose
{
  if (+[VGFrameSelector invalidPose]::onceToken != -1) {
    dispatch_once(&+[VGFrameSelector invalidPose]::onceToken, &__block_literal_global_1);
  }
  v2 = (void *)+[VGFrameSelector invalidPose]::invalidPose;

  return v2;
}

uint64_t __30__VGFrameSelector_invalidPose__block_invoke()
{
  +[VGFrameSelector invalidPose]::invalidPose = objc_alloc_init(VGCapturedPose);

  return MEMORY[0x270F9A758]();
}

+ (optional<std::vector<TargetPoseData>>)_computeTargetPosesForFrameCount:(SEL)a3 limit:(unint64_t)a4 desiredFrontPoseFrustumOffsets:(float)a5 desiredFrontPoseFrustumOffset:(optional<const VGFrameSelectorFrustumOffsets> *)a6 anglesDegrees:(optional<const VGFrameSelectorFrustumOffsets> *)a7 motionType:(id)a8 detectFrontPose:(int)a9 options:(BOOL)a10
{
  BOOL v11 = a10;
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v17 = a8;
  id v86 = a11;
  if (a9 < 2)
  {
    std::vector<TargetPoseData>::vector(&v87, a4);
    float v19 = a5 + a5;
    if (v17)
    {
      if (!a6->var1)
      {
        v27 = __VGLogSharedInstance();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf.__r_.__value_.__l.__data_) = 0;
        }

        char v62 = 0;
        v63 = retstr;
        retstr->var0.var0 = 0;
        goto LABEL_90;
      }
      float pitchOffsetDegreesTop = a6->var0.var1.pitchOffsetDegreesTop;
      float pitchOffsetDegreesBottom = a6->var0.var1.pitchOffsetDegreesBottom;
      float v79 = a5 + a5;
      float v80 = pitchOffsetDegreesBottom;
      float yawOffsetDegreesRight = a6->var0.var1.yawOffsetDegreesRight;
      float yawOffsetDegreesLeft = a6->var0.var1.yawOffsetDegreesLeft;
      float v81 = pitchOffsetDegreesTop;
      if (a7->var1)
      {
        float pitchOffsetDegreesTop = a7->var0.var1.pitchOffsetDegreesTop;
        float v84 = a7->var0.var1.yawOffsetDegreesRight;
        float v85 = a7->var0.var1.yawOffsetDegreesLeft;
        float pitchOffsetDegreesBottom = a7->var0.var1.pitchOffsetDegreesBottom;
        if (!a4) {
          goto LABEL_72;
        }
      }
      else
      {
        float v84 = a6->var0.var1.yawOffsetDegreesRight;
        float v85 = a6->var0.var1.yawOffsetDegreesLeft;
        if (!a4) {
          goto LABEL_72;
        }
      }
    }
    else
    {
      if (a4 >= 3) {
        float v19 = v19 / (float)(a4 - 1);
      }
      float v22 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
      float v23 = v22;
      float v24 = v22;
      float v25 = v22;
      float v26 = v22;
      if (a6->var1)
      {
        float v23 = fabsf(a6->var0.var1.yawOffsetDegreesLeft);
        float v24 = fabsf(a6->var0.var1.yawOffsetDegreesRight);
        float v25 = fabsf(a6->var0.var1.pitchOffsetDegreesTop);
        float v26 = fabsf(a6->var0.var1.pitchOffsetDegreesBottom);
        if (a9 == 1)
        {
          if (v25 > v22) {
            float v25 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          }
          if (v26 > v22) {
            float v26 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          }
        }
        else
        {
          if (v23 > v22) {
            float v23 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          }
          if (v24 > v22) {
            float v24 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          }
        }
      }
      float v79 = v19;
      float v80 = v26;
      float yawOffsetDegreesRight = v24;
      float yawOffsetDegreesLeft = v23;
      float v81 = v25;
      if (a7->var1)
      {
        float v84 = fabsf(a7->var0.var1.yawOffsetDegreesRight);
        float v85 = fabsf(a7->var0.var1.yawOffsetDegreesLeft);
        float pitchOffsetDegreesTop = fabsf(a7->var0.var1.pitchOffsetDegreesTop);
        float pitchOffsetDegreesBottom = fabsf(a7->var0.var1.pitchOffsetDegreesBottom);
        if (a9 == 1)
        {
          if (pitchOffsetDegreesTop > v22) {
            float pitchOffsetDegreesTop = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          }
          if (pitchOffsetDegreesBottom > v22) {
            float pitchOffsetDegreesBottom = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          }
          if (!a4) {
            goto LABEL_72;
          }
        }
        else
        {
          if (v85 <= v22) {
            float v28 = v85;
          }
          else {
            float v28 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          }
          float v29 = v84;
          if (v84 > v22) {
            float v29 = (float)((float)(v19 * 0.5) * 180.0) / 3.14159265;
          }
          float v84 = v29;
          float v85 = v28;
          if (!a4) {
            goto LABEL_72;
          }
        }
      }
      else
      {
        float v84 = v24;
        float v85 = v23;
        float pitchOffsetDegreesTop = v25;
        float pitchOffsetDegreesBottom = v26;
        if (!a4)
        {
LABEL_72:
          v60 = __VGLogSharedInstance();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          {
            v61 = &vg::frame_selection::motionTypeToString(vg::frame_selection::MotionType)::kMotionTypeToString[24 * a9];
            if (v61[23] < 0) {
              std::string::__init_copy_ctor_external(&buf, *(const std::string::value_type **)v61, 0);
            }
            else {
              std::string buf = *(std::string *)v61;
            }
            p_std::string buf = &buf;
            if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
            }
            *(_DWORD *)v99 = 136315138;
            v100 = p_buf;
            _os_log_impl(&dword_260C8D000, v60, OS_LOG_TYPE_DEBUG, " Generated target poses for MotionType: %s ", v99, 0xCu);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
          }

          uint64_t v66 = *((void *)&v87 + 1);
          uint64_t v65 = v87;
          if ((void)v87 == *((void *)&v87 + 1))
          {
            int64x2_t v75 = vdupq_n_s64(v87);
          }
          else
          {
            do
            {
              v67 = __VGLogSharedInstance();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
              {
                std::string::size_type v68 = *(void *)(v65 + 72);
                double v69 = *(float *)(v65 + 68);
                if (*(unsigned char *)(v65 + 80)) {
                  v70 = @"YES";
                }
                else {
                  v70 = @"NO";
                }
                double v71 = *(float *)(v65 + 84);
                double v72 = *(float *)(v65 + 88);
                double v73 = *(float *)(v65 + 92);
                double v74 = *(float *)(v65 + 96);
                LODWORD(buf.__r_.__value_.__l.__data_) = 134219522;
                *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v68;
                WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
                *(double *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v69;
                HIWORD(buf.__r_.__value_.__r.__words[2]) = 2112;
                v90 = v70;
                __int16 v91 = 2048;
                double v92 = v71;
                __int16 v93 = 2048;
                double v94 = v72;
                __int16 v95 = 2048;
                double v96 = v73;
                __int16 v97 = 2048;
                double v98 = v74;
                _os_log_impl(&dword_260C8D000, v67, OS_LOG_TYPE_DEBUG, " PoseIdx: %zu Angle in degrees: %g Is front pose: %@ Alignment frustum: [(%g, %g), (%g, %g)] [(minYawAngleDegrees, maxYawAngleDegrees), (minPitchAngleDegrees, maxPitchAngleDegrees)] ", (uint8_t *)&buf, 0x48u);
              }

              v65 += 112;
            }
            while (v65 != v66);
            int64x2_t v75 = (int64x2_t)v87;
          }
          v63 = retstr;
          *(int64x2_t *)&retstr->var0.var0 = v75;
          retstr->var0.var1.__end_cap_.__value_ = v88;
          v88 = 0;
          long long v87 = 0uLL;
          char v62 = 1;
LABEL_90:
          v63->var1 = v62;
          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v87;
          std::vector<TargetPoseData>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
          goto LABEL_91;
        }
      }
    }
    uint64_t v30 = 0;
    unint64_t v31 = 0;
    if (v11) {
      uint64_t v32 = (a4 >> 1);
    }
    else {
      uint64_t v32 = 0xFFFFFFFFLL;
    }
    float v78 = 1.5708 - a5;
    do
    {
      if (v17)
      {
        v33 = [v17 objectAtIndexedSubscript:v31];
        [v33 floatValue];
        float v35 = v34;

        float v36 = v35 * 3.14159265 / 180.0;
        float v37 = v36 + 1.5708;
      }
      else
      {
        float v37 = v78 + (float)((float)v31 * v79);
      }
      v38 = (_OWORD *)(v87 + v30);
      *(_DWORD *)(v87 + v30 + 64) = a9;
      __float2 v39 = __sincosf_stret(v37);
      if (a9 == 1)
      {
        LODWORD(v40) = 0;
        HIDWORD(v40) = 0;
        DWORD1(v40) = LODWORD(v39.__cosval);
      }
      else
      {
        HIDWORD(v40) = 0;
        *(void *)&long long v40 = LODWORD(v39.__cosval);
      }
      DWORD2(v40) = LODWORD(v39.__sinval);
      _OWORD *v38 = v40;
      uint64_t v41 = v87;
      v42 = (float *)(v87 + v30);
      float v43 = (float)(atan2f(-*(float *)(v87 + v30), *(float *)(v87 + v30 + 8)) * 180.0) / 3.14159265;
      float v44 = (float)(asinf(v42[1]) * -180.0) / 3.14159265;
      if ((v32 & 0x80000000) != 0 || v32 != v31)
      {
        float v53 = v43 - yawOffsetDegreesRight;
        if ((float)(v43 - yawOffsetDegreesRight) >= v43) {
          float v53 = v43;
        }
        float v54 = yawOffsetDegreesLeft + v43;
        if ((float)(yawOffsetDegreesLeft + v43) <= v43) {
          float v54 = v43;
        }
        float v55 = v44 - v80;
        if ((float)(v44 - v80) >= v44) {
          float v55 = v44;
        }
        v42[21] = v53;
        v42[22] = v54;
        if ((float)(v81 + v44) > v44) {
          float v44 = v81 + v44;
        }
        v42[23] = v55;
        v42[24] = v44;
      }
      else
      {
        float v45 = v43 - v84;
        if ((float)(v43 - v84) >= v43) {
          float v45 = v43;
        }
        float v46 = v85 + v43;
        if ((float)(v85 + v43) <= v43) {
          float v46 = v43;
        }
        float v47 = v44 - pitchOffsetDegreesBottom;
        if ((float)(v44 - pitchOffsetDegreesBottom) >= v44) {
          float v47 = v44;
        }
        uint64_t v48 = v41 + 112 * v32;
        *(float *)(v48 + 84) = v45;
        *(float *)(v48 + 88) = v46;
        if ((float)(pitchOffsetDegreesTop + v44) > v44) {
          float v44 = pitchOffsetDegreesTop + v44;
        }
        *(float *)(v48 + 92) = v47;
        *(float *)(v48 + 96) = v44;
        *(unsigned char *)(v48 + 80) = 1;
        v49 = [v86 bodyPoseGuidanceOptions];
        if (v49)
        {
          v50 = [v86 bodyPoseGuidanceOptions];
          [v50 bestAlignmentToleranceAngleFrontPose];
          float v52 = v51 * 3.14159265 / 180.0;
          *(float *)(v87 + 112 * v32 + 56) = fmaxf(v52, 0.0);
        }
        else
        {
          *(_DWORD *)(v87 + 112 * v32 + 56) = 0;
        }

        uint64_t v41 = v87;
      }
      uint64_t v56 = v41 + v30;
      *(void *)(v56 + 72) = v31;
      float v57 = (float)((float)(v37 + -1.5708) * 180.0) / 3.14159265;
      *(float *)(v56 + 68) = v57;
      *(_DWORD *)(v56 + 60) = 0;
      uint64_t v58 = +[VGFrameSelector invalidPose];
      v59 = *(void **)(v87 + v30 + 16);
      *(void *)(v87 + v30 + 16) = v58;

      ++v31;
      v30 += 112;
    }
    while (a4 != v31);
    goto LABEL_72;
  }
  v18 = __VGLogSharedInstance();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
    HIDWORD(buf.__r_.__value_.__r.__words[0]) = a9;
    _os_log_impl(&dword_260C8D000, v18, OS_LOG_TYPE_DEBUG, " VGFrameSelector received unknown / unsupported MotionType: %d ", (uint8_t *)&buf, 8u);
  }

  retstr->var0.var0 = 0;
  retstr->var1 = 0;
LABEL_91:

  return result;
}

- (VGFrameSelector)initWithOptions:(id)a3
{
  id v5 = a3;
  v63.receiver = self;
  v63.super_class = (Class)VGFrameSelector;
  v6 = [(VGFrameSelector *)&v63 init];
  v7 = v6;
  if (v6)
  {
    p_options = (id *)&v6->_options;
    objc_storeStrong((id *)&v6->_options, a3);
    uint64_t v9 = [(VGFrameSelectorOptions *)v7->_options yawFrameCount];
    uint64_t v10 = [*p_options pitchFrameCount];
    v7->_requiredPosesCount = v10 + v9;
    v7->_remainingPosesCount = v10 + v9;
    if ([(VGFrameSelectorOptions *)v7->_options useSimpleSelector])
    {
      [*p_options simpleSelectorMinOffsetAngle];
      float v12 = v11 * 3.14159265 / 180.0;
      v7->_simpleSelectorMaxAlignment = cosf(v12);
      [(VGFrameSelectorOptions *)v7->_options simpleSelectorMaxOffsetAngle];
      float v14 = v13 * 3.14159265 / 180.0;
      v7->_simpleSelectorMinAlignment = cosf(v14);
    }
    if (v7->_requiredPosesCount)
    {
      uint64_t v60 = 0;
      uint64_t v61 = 0;
      uint64_t v62 = 0;
      if ([v5 yawFrameCount])
      {
        uint64_t v15 = [*p_options yawFrameCount];
        [*p_options yawLimit];
        int v17 = v16;
        [*p_options yawPosesFrustumOffsets];
        v55[0] = v18;
        v55[1] = v19;
        v55[2] = v20;
        v55[3] = v21;
        char v56 = 1;
        [*p_options frontPoseFrustumOffsets];
        v53[0] = v22;
        v53[1] = v23;
        v53[2] = v24;
        v53[3] = v25;
        char v54 = 1;
        float v26 = [*p_options yawAngles];
        uint64_t v27 = [*p_options detectFrontPose];
        LODWORD(v28) = v17;
        +[VGFrameSelector _computeTargetPosesForFrameCount:v15 limit:v55 desiredFrontPoseFrustumOffsets:v53 desiredFrontPoseFrustumOffset:v26 anglesDegrees:0 motionType:v27 detectFrontPose:v28 options:v5];

        if (!v59)
        {
          float v43 = 0;
LABEL_30:
          *(void *)std::string buf = &v60;
          std::vector<TargetPoseData>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          goto LABEL_31;
        }
        std::vector<TargetPoseData>::__assign_with_size[abi:ne180100]<TargetPoseData*,TargetPoseData*>(&v60, *(uint64_t *)buf, v58, 0x6DB6DB6DB6DB6DB7 * ((v58 - *(void *)buf) >> 4));
        if (v59)
        {
          v50 = buf;
          std::vector<TargetPoseData>::__destroy_vector::operator()[abi:ne180100]((void ***)&v50);
        }
      }
      v50 = 0;
      uint64_t v51 = 0;
      uint64_t v52 = 0;
      if ([v5 pitchFrameCount])
      {
        uint64_t v29 = [*p_options pitchFrameCount];
        [*p_options pitchLimit];
        int v31 = v30;
        [*p_options pitchPosesFrustumOffsets];
        v48[0] = v32;
        v48[1] = v33;
        v48[2] = v34;
        v48[3] = v35;
        char v49 = 1;
        v47[0] = 0;
        v47[16] = 0;
        float v36 = [*p_options pitchAngles];
        LODWORD(v37) = v31;
        +[VGFrameSelector _computeTargetPosesForFrameCount:v29 limit:v48 desiredFrontPoseFrustumOffsets:v47 desiredFrontPoseFrustumOffset:v36 anglesDegrees:1 motionType:0 detectFrontPose:v37 options:v5];

        if (!v59) {
          goto LABEL_28;
        }
        std::vector<TargetPoseData>::__assign_with_size[abi:ne180100]<TargetPoseData*,TargetPoseData*>((uint64_t *)&v50, *(uint64_t *)buf, v58, 0x6DB6DB6DB6DB6DB7 * ((v58 - *(void *)buf) >> 4));
        if (v59)
        {
          v64 = buf;
          std::vector<TargetPoseData>::__destroy_vector::operator()[abi:ne180100]((void ***)&v64);
        }
      }
      std::vector<TargetPoseData>::__insert_with_size[abi:ne180100]<std::move_iterator<std::__wrap_iter<TargetPoseData*>>,std::move_iterator<std::__wrap_iter<TargetPoseData*>>>((uint64_t *)&v7->_targetPosesData, (uint64_t)v7->_targetPosesData.__end_, v60, v61, 0x6DB6DB6DB6DB6DB7 * ((v61 - v60) >> 4));
      std::vector<TargetPoseData>::__insert_with_size[abi:ne180100]<std::move_iterator<std::__wrap_iter<TargetPoseData*>>,std::move_iterator<std::__wrap_iter<TargetPoseData*>>>((uint64_t *)&v7->_targetPosesData, (uint64_t)v7->_targetPosesData.__end_, (uint64_t)v50, v51, 0x6DB6DB6DB6DB6DB7 * ((v51 - (uint64_t)v50) >> 4));
      if (v7->_targetPosesData.__end_ != v7->_targetPosesData.__begin_)
      {
        if ([*p_options detectFrontPose]
          && [*p_options useVNFilters])
        {
          *(_WORD *)std::string buf = 256;
          vg::shared::VNWarmupDetector(buf);
        }
        v38 = [*p_options bodyPoseGuidanceOptions];

        if (v38)
        {
          __float2 v39 = [VGUserBodyPoseGuidance alloc];
          long long v40 = [*p_options bodyPoseGuidanceOptions];
          uint64_t v41 = [(VGUserBodyPoseGuidance *)v39 initWithOptions:v40];
          userBodyPoseGuidance = v7->_userBodyPoseGuidance;
          v7->_userBodyPoseGuidance = (VGUserBodyPoseGuidance *)v41;
        }
        float v43 = v7;
        goto LABEL_29;
      }
      float v45 = __VGLogSharedInstance();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_260C8D000, v45, OS_LOG_TYPE_DEBUG, " No target poses have been computed from the selector options ", buf, 2u);
      }

LABEL_28:
      float v43 = 0;
LABEL_29:
      *(void *)std::string buf = &v50;
      std::vector<TargetPoseData>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      goto LABEL_30;
    }
    float v44 = __VGLogSharedInstance();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_260C8D000, v44, OS_LOG_TYPE_DEBUG, " VGFrameSelector expects at least a single frame ", buf, 2u);
    }
  }
  float v43 = 0;
LABEL_31:

  return v43;
}

- (FrameRejectionState)applyVisionFilters:(SEL)a3 bestTargetPoseData:(id)a4 frameTimestampMS:(const void *)a5
{
  id v9 = a4;
  if (*((unsigned char *)a5 + 80) && [(VGFrameSelectorOptions *)self->_options useVNFilters])
  {
    uint64_t v10 = VGLogVGFrameSelector();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v34[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_260C8D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ApplyVisionFilters", (const char *)&unk_260D385D9, (uint8_t *)v34, 2u);
    }

    size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v9 rgbRectified]);
    size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v9 rgbRectified]);
    float v13 = [v9 face];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    CroppedCVPixelBuffer = createCroppedCVPixelBuffer((__CVBuffer *)[v9 rgbRectified], (unint64_t)(v15 * (float)Width), (unint64_t)(v17 * (float)Height), (unint64_t)((v15 + v19) * (float)Width), (unint64_t)((v17 + v21) * (float)Height));
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __74__VGFrameSelector_applyVisionFilters_bestTargetPoseData_frameTimestampMS___block_invoke_633;
    v38[3] = &__block_descriptor_40_e5_v8__0l;
    v38[4] = CroppedCVPixelBuffer;
    int v23 = (void (**)(void))MEMORY[0x261227FC0](v38);
    int v24 = CVPixelBufferGetIOSurface(CroppedCVPixelBuffer);
    v34[1] = 0;
    v34[2] = 0;
    v34[0] = v24;
    __asm { FMOV            V0.2D, #1.0 }
    long long v35 = _Q0;
    char v36 = 1;
    char v37 = 0;
    int v30 = vg::shared::VNGetFaceAttributes((uint64_t)v34);
    [(VGFrameSelectorOptions *)self->_options vnFrontPoseBlinkThreshold];
    if (vg::shared::VNGetIsBlinking(v30, v31))
    {
      retstr->reason = 28;
      int v32 = [NSString stringWithFormat:@"blinking was detected on front pose (Vision)"];
      retstr->debugDictionary = 0;
      retstr->description = v32;
    }
    else
    {
      retstr->reason = 0;
      retstr->debugDictionary = 0;
      retstr->description = 0;
    }
    *(void *)&retstr->outOfFovOffset = 0;

    v23[2](v23);
    __74__VGFrameSelector_applyVisionFilters_bestTargetPoseData_frameTimestampMS___block_invoke();
  }
  else
  {
    retstr->reason = 0;
    *(void *)&retstr->outOfFovOffset = 0;
    retstr->debugDictionary = 0;
    retstr->description = 0;
  }

  return result;
}

void __74__VGFrameSelector_applyVisionFilters_bestTargetPoseData_frameTimestampMS___block_invoke()
{
  v0 = VGLogVGFrameSelector();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ApplyVisionFilters", (const char *)&unk_260D385D9, v1, 2u);
  }
}

void __74__VGFrameSelector_applyVisionFilters_bestTargetPoseData_frameTimestampMS___block_invoke_633(uint64_t a1)
{
}

- (FrameRejectionState)applyVisionFaceLandmarksFilter:(SEL)a3 bestTargetPoseData:(id)a4 frameTimestampMS:(const void *)a5
{
  id v9 = a4;
  if (*((unsigned char *)a5 + 80)
    && [(VGFrameSelectorOptions *)self->_options useVNFaceLandmarksFilter])
  {
    uint64_t v10 = VGLogVGFrameSelector();
    if (os_signpost_enabled(v10))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_260C8D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ApplyVisionFaceLandmarkFilter", (const char *)&unk_260D385D9, (uint8_t *)&buf, 2u);
    }

    size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v9 rgbRectified]);
    size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v9 rgbRectified]);
    float v13 = [v9 face];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    CroppedCVPixelBuffer = createCroppedCVPixelBuffer((__CVBuffer *)[v9 rgbRectified], (unint64_t)(v15 * (float)Width), (unint64_t)(v17 * (float)Height), (unint64_t)((v15 + v19) * (float)Width), (unint64_t)((v17 + v21) * (float)Height));
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __86__VGFrameSelector_applyVisionFaceLandmarksFilter_bestTargetPoseData_frameTimestampMS___block_invoke_640;
    v40[3] = &__block_descriptor_40_e5_v8__0l;
    v40[4] = CroppedCVPixelBuffer;
    int v23 = (void (**)(void))MEMORY[0x261227FC0](v40);
    int v24 = CVPixelBufferGetIOSurface(CroppedCVPixelBuffer);
    long long buf = 0uLL;
    __asm { FMOV            V0.2D, #1.0 }
    long long v38 = _Q0;
    char v39 = 1;
    int v30 = vg::shared::VNDetectFaceLandmarks2D(v24, &buf);
    float v31 = v30;
    if (v30 && ([v30 confidence], v32 < 0.8))
    {
      retstr->reason = 9;
      int v33 = NSString;
      [v31 confidence];
      objc_msgSend(v33, "stringWithFormat:", @"face landmarks not detected [confidence: %g < %g]", v34, 0x3FE99999A0000000);
      long long v35 = (NSString *)objc_claimAutoreleasedReturnValue();
      retstr->debugDictionary = 0;
      retstr->description = v35;
    }
    else
    {
      retstr->reason = 0;
      retstr->debugDictionary = 0;
      retstr->description = 0;
    }
    *(void *)&retstr->outOfFovOffset = 0;

    v23[2](v23);
    __86__VGFrameSelector_applyVisionFaceLandmarksFilter_bestTargetPoseData_frameTimestampMS___block_invoke();
  }
  else
  {
    retstr->reason = 0;
    *(void *)&retstr->outOfFovOffset = 0;
    retstr->debugDictionary = 0;
    retstr->description = 0;
  }

  return result;
}

void __86__VGFrameSelector_applyVisionFaceLandmarksFilter_bestTargetPoseData_frameTimestampMS___block_invoke()
{
  v0 = VGLogVGFrameSelector();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ApplyVisionFaceLandmarkFilter", (const char *)&unk_260D385D9, v1, 2u);
  }
}

void __86__VGFrameSelector_applyVisionFaceLandmarksFilter_bestTargetPoseData_frameTimestampMS___block_invoke_640(uint64_t a1)
{
}

- (void)checkDepthFoVFilter:(uint64_t)a3@<X3> framePose:(double *)a4@<X4> bestTargetPoseData:(uint64_t)a5@<X5> validDataBounds:(uint64_t)a6@<X8> frameTimestampMS:(__n128)a7@<Q3>
{
  float v58 = a7.n128_f32[2];
  v94[2] = *MEMORY[0x263EF8340];
  id v12 = a2;
  float v13 = [v12 face];
  [v13 bounds];
  v61.f64[0] = v14;
  v61.f64[1] = v15;
  v62.f64[0] = v16;
  v62.f64[1] = v17;

  if (!*(unsigned char *)(a3 + 112))
  {
    double v19 = *(void **)(a1 + 40);
LABEL_5:
    double v18 = [v19 yawMarginRatio];
    goto LABEL_8;
  }
  if (*(unsigned char *)(a3 + 80))
  {
    double v18 = [*(id *)(a1 + 40) frontPoseMarginRatio];
    goto LABEL_8;
  }
  double v19 = *(void **)(a1 + 40);
  if (!*(_DWORD *)(a3 + 64)) {
    goto LABEL_5;
  }
  double v18 = [v19 pitchMarginRatio];
LABEL_8:
  double v20 = v18;
  if (v18)
  {
    double v57 = *a4;
    [v18 leftMarginHeadRatio];
    float v56 = v21;
    double v55 = a4[1];
    [v20 topMarginHeadRatio];
    float v23 = v22;
    double v24 = *a4;
    double v25 = a4[2];
    [v20 rightMarginHeadRatio];
    float v27 = v26;
    double v28 = a4[1];
    double v29 = a4[3];
    [v20 bottomMarginHeadRatio];
    v59.f64[0] = v57 + v62.f64[0] * v56;
    v59.f64[1] = v55 + v62.f64[1] * v23;
    v60.f64[0] = fmax(v24 + v25 - v62.f64[0] * v27 - v59.f64[0], 0.0);
    v60.f64[1] = fmax(v28 + v29 - v62.f64[1] * v30 - v59.f64[1], 0.0);
    v91[0] = @"validDataBounds";
    float v31 = +[VGSerializationHelpers cgRectToDict:a4];
    v92[0] = v31;
    v91[1] = @"faceBounds";
    float v32 = +[VGSerializationHelpers cgRectToDict:&v61];
    v92[1] = v32;
    v91[2] = @"fovBounds";
    int v33 = +[VGSerializationHelpers cgRectToDict:&v59];
    v92[2] = v33;
    uint64_t v34 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:3];

    v95.origin = (CGPoint)v59;
    v95.size = (CGSize)v60;
    v96.origin = (CGPoint)v61;
    v96.size = (CGSize)v62;
    if (CGRectContainsRect(v95, v96))
    {
      *(_DWORD *)a6 = 0;
      *(void *)(a6 + 8) = 0;
      *(void *)(a6 + 16) = 0;
    }
    else
    {
      char v37 = __VGLogSharedInstance();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        double v38 = *a4;
        uint64_t v39 = *((void *)a4 + 1);
        uint64_t v40 = *((void *)a4 + 2);
        uint64_t v41 = *((void *)a4 + 3);
        *(_DWORD *)long long buf = 134221315;
        uint64_t v64 = a5;
        __int16 v65 = 2049;
        float64_t v66 = v61.f64[0];
        __int16 v67 = 2049;
        float64_t v68 = v61.f64[1];
        __int16 v69 = 2049;
        float64_t v70 = v62.f64[0];
        __int16 v71 = 2049;
        float64_t v72 = v62.f64[1];
        __int16 v73 = 2049;
        double v74 = v38;
        __int16 v75 = 2049;
        uint64_t v76 = v39;
        __int16 v77 = 2049;
        uint64_t v78 = v40;
        __int16 v79 = 2049;
        uint64_t v80 = v41;
        __int16 v81 = 2049;
        float64_t v82 = v59.f64[0];
        __int16 v83 = 2049;
        float64_t v84 = v59.f64[1];
        __int16 v85 = 2049;
        float64_t v86 = v60.f64[0];
        __int16 v87 = 2049;
        float64_t v88 = v60.f64[1];
        __int16 v89 = 2113;
        v90 = v20;
        _os_log_impl(&dword_260C8D000, v37, OS_LOG_TYPE_DEBUG, " Frame#%zu face out of depth FoV. face bounds: [%{private}g %{private}g %{private}g %{private}g], valid depth bounds: [%{private}g %{private}g %{private}g %{private}g], fov bounds: [%{private}g %{private}g %{private}g %{private}g]margins: [%{private}@],  ", buf, 0x8Eu);
      }

      __asm { FMOV            V2.2D, #0.5 }
      float32x2_t v47 = vsub_f32(vcvt_f32_f64(vmlaq_f64(v61, _Q2, v62)), vcvt_f32_f64(vmlaq_f64(v59, _Q2, v60)));
      float v48 = fabsf(v47.f32[0]);
      float32x2_t v49 = v47;
      float v50 = fabsf(v47.f32[1]);
      if (v48 <= v50)
      {
        [v12 videoIntrinsics];
        float v52 = (float)((float)(v58 / v54) * 0.1)
            * (float)(v50 * (float)CVPixelBufferGetHeight((CVPixelBufferRef)[v12 yuvRectified]));
        if (v49.f32[1] >= 0.0) {
          int v53 = 14;
        }
        else {
          int v53 = 13;
        }
      }
      else
      {
        [v12 videoIntrinsics];
        float v52 = (float)((float)(v58 / v51) * 0.1)
            * (float)(v48 * (float)CVPixelBufferGetWidth((CVPixelBufferRef)[v12 yuvRectified]));
        if (v49.f32[0] >= 0.0) {
          int v53 = 12;
        }
        else {
          int v53 = 11;
        }
      }
      *(_DWORD *)a6 = v53;
      *(void *)(a6 + 8) = objc_msgSend(NSString, "stringWithFormat:", @"out of FoV offset: %g cm", v52);
      *(float *)(a6 + 16) = v52;
      *(_DWORD *)(a6 + 20) = 0;
    }
    *(void *)(a6 + 24) = v34;
  }
  else
  {
    *(_DWORD *)a6 = 0;
    *(void *)(a6 + 8) = 0;
    *(void *)(a6 + 16) = 0;
    v93[0] = @"validDataBounds";
    long long v35 = +[VGSerializationHelpers cgRectToDict:a4];
    v93[1] = @"faceBounds";
    v94[0] = v35;
    char v36 = +[VGSerializationHelpers cgRectToDict:&v61];
    v94[1] = v36;
    *(void *)(a6 + 24) = [NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:2];
  }
}

- (FrameRejectionState)applyExpressionFilters:(SEL)a3 trackingData:(const void *)a4 frameTimestampMS:(id)a5 score:(unint64_t)a6
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = VGLogVGFrameSelector();
  if (os_signpost_enabled(v12))
  {
    if (*((unsigned char *)a4 + 80)) {
      float v13 = @"true";
    }
    else {
      float v13 = @"false";
    }
    *(_DWORD *)long long buf = 138543362;
    char v36 = v13;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ExpressionFilters", "isFrontPose:%{public}@", buf, 0xCu);
  }

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __78__VGFrameSelector_applyExpressionFilters_trackingData_frameTimestampMS_score___block_invoke;
  v33[3] = &__block_descriptor_40_e5_v8__0l;
  v33[4] = a4;
  float64_t v14 = (void (**)(void))MEMORY[0x261227FC0](v33);
  if (*((unsigned char *)a4 + 80))
  {
    float64_t v15 = [(VGFrameSelectorOptions *)self->_options frontExpressionFilters];
  }
  else
  {
    options = self->_options;
    if (*((_DWORD *)a4 + 16)) {
      [(VGFrameSelectorOptions *)options pitchExpressionFilters];
    }
    else {
    float64_t v15 = [(VGFrameSelectorOptions *)options yawExpressionFilters];
    }
  }
  float64_t v17 = v15;
  if (v15)
  {
    double v28 = v14;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v15;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v18);
          }
          float v22 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          [v22 filter:v11];
          float v24 = v23 * *a7;
          *a7 = v24;
          if (v24 == 0.0)
          {
            retstr->reason = [v22 rejectionReason];
            if (*((unsigned char *)a4 + 80)) {
              double v25 = @"YES";
            }
            else {
              double v25 = @"NO";
            }
            float v26 = [NSString stringWithFormat:@"expression filter [%@], isFrontPose: %@", v22, v25];
            *(void *)&retstr->outOfFovOffset = 0;
            retstr->debugDictionary = 0;
            retstr->description = v26;

            float64_t v14 = v28;
            goto LABEL_27;
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    float64_t v14 = v28;
  }
  retstr->reason = 0;
  *(void *)&retstr->outOfFovOffset = 0;
  retstr->debugDictionary = 0;
  retstr->description = 0;
LABEL_27:

  v14[2](v14);
  return result;
}

void __78__VGFrameSelector_applyExpressionFilters_trackingData_frameTimestampMS_score___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = VGLogVGFrameSelector();
  if (os_signpost_enabled(v2))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 80)) {
      v3 = @"true";
    }
    else {
      v3 = @"false";
    }
    int v4 = 138543362;
    id v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExpressionFilters", "isFrontPose:%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)processHeadPoseSimple:(HeadPoseData)a3 frameTimestampMS:(unint64_t)a4
{
  uint64_t v6 = objc_opt_new();
  unint64_t v7 = self->_requiredPosesCount - self->_remainingPosesCount;
  [v6 setPoseIndex:v7];
  [v6 setMotionType:*((unsigned int *)self->_targetPosesData.__begin_ + 28 * v7 + 16)];
  if (self->_requiredPosesCount)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    while (1)
    {
      id v10 = *(id *)((char *)self->_targetPosesData.__begin_ + v8 + 16);
      if ([v10 valid])
      {
        float32x4_t v11 = vmulq_f32(*(float32x4_t *)(a4 + 16), *(float32x4_t *)((char *)self->_targetPosesData.__begin_ + v8 + 32));
        float v12 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v11, 2), vaddq_f32(v11, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v11.f32, 1))).f32[0];
        float simpleSelectorMinAlignment = self->_simpleSelectorMinAlignment;
        float simpleSelectorMaxAlignment = self->_simpleSelectorMaxAlignment;
        if (simpleSelectorMaxAlignment < v12 || v12 < simpleSelectorMinAlignment) {
          break;
        }
      }

      ++v9;
      v8 += 112;
      if (v9 >= self->_requiredPosesCount) {
        goto LABEL_9;
      }
    }
    int v22 = 24;
    objc_msgSend(NSString, "stringWithFormat:", @"viewdir alignment to previously selected poses does not satisfy the limit criteria; %g not within (%g, %g)",
      v12,
      simpleSelectorMinAlignment,
    float64_t v16 = simpleSelectorMaxAlignment);
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    float v23 = v16;
    if (v6) {
      [v6 setRejectionState:&v22];
    }
    else {
  }
    }
  else
  {
LABEL_9:
    *((_OWORD *)self->_targetPosesData.__begin_ + 7 * v7 + 2) = *(_OWORD *)(a4 + 16);
    int v18 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v19 = 0;
    if (v6) {
      [v6 setRejectionState:&v18];
    }
  }

  return v6;
}

- (id)processHeadPose:(HeadPoseData)a3 captureData:(id)a4 trackingData:(id)a5 validDataBounds:(const void *)a6 frameTimestampMS:(unint64_t)a7
{
  uint64_t v8 = v7;
  uint64_t v159 = *MEMORY[0x263EF8340];
  id v102 = a5;
  v103 = (id)a6;
  float v13 = VGLogVGFrameSelector();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ProcessHeadPose", (const char *)&unk_260D385D9, buf, 2u);
  }

  float64_t v14 = objc_opt_new();
  if (!v103)
  {
    int v140 = 2;
    int v22 = [NSString stringWithFormat:@"no tracking data"];
    uint64_t v142 = 0;
    uint64_t v143 = 0;
    v141 = v22;
    if (v14) {
      [v14 setRejectionState:&v140];
    }
    else {

    }
    id v24 = v14;
    goto LABEL_96;
  }
  if (!self->_userBodyPoseGuidance) {
    goto LABEL_15;
  }
  [(VGFrameSelector *)self parseAtlasToCameraTransformation:v103];
  if (!(_BYTE)v151)
  {
    float v23 = __VGLogSharedInstance();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v155 = 134217984;
      *(void *)&v155[4] = v8;
      _os_log_impl(&dword_260C8D000, v23, OS_LOG_TYPE_DEBUG, " Frame#%zu unable to parse atlasToCameraTransform, skipping Body Pose Guidance filter ", v155, 0xCu);
    }

LABEL_15:
    uint64_t v101 = 0;
    goto LABEL_23;
  }
  [v102 cameraToDeviceTransform];
  uint64_t v19 = 0;
  long long v144 = *(_OWORD *)buf;
  long long v145 = *(_OWORD *)&buf[16];
  long long v146 = v149;
  long long v147 = v150;
  do
  {
    *(float32x4_t *)&v155[v19] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v15, COERCE_FLOAT(*(long long *)((char *)&v144 + v19))), v16, *(float32x2_t *)((char *)&v144 + v19), 1), v17, *(float32x4_t *)((char *)&v144 + v19), 2), v18, *(float32x4_t *)((char *)&v144 + v19), 3);
    v19 += 16;
  }
  while (v19 != 64);
  double v98 = *(double *)&v156;
  double v100 = *(double *)v155;
  double v95 = *(double *)&v158;
  double v96 = *(double *)&v157;
  userBodyPoseGuidance = self->_userBodyPoseGuidance;
  uint64_t v21 = [v102 skeleton];
  if (v102) {
    [v102 timestamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  uint64_t v101 = -[VGUserBodyPoseGuidance calculatePoseGuidanceFromSkeleton:andAtlasToDeviceTransform:atTimestamp:](userBodyPoseGuidance, "calculatePoseGuidanceFromSkeleton:andAtlasToDeviceTransform:atTimestamp:", v21, v100, v98, v96, v95, CMTimeGetSeconds(&time));

  uint64_t v25 = [v101 frameState];
  [v14 setBodyPoseFrameState:v25];

  if (v101)
  {
    [v101 rejection];
    uint64_t v26 = *((void *)&v156 + 1);
  }
  else
  {
    uint64_t v26 = 0;
    *(_OWORD *)v155 = 0u;
    long long v156 = 0u;
  }
  [v14 addDebugDataForKey:@"poseGuidance" debugData:v26];

LABEL_23:
  unint64_t requiredPosesCount = self->_requiredPosesCount;
  if (!requiredPosesCount)
  {
    v138 = self;
LABEL_49:
    if (![(VGFrameSelectorOptions *)self->_options useDepthFovFilterForBadAlignment]) {
      goto LABEL_54;
    }
    buf[0] = 0;
    char v154 = 0;
    -[VGFrameSelector processHeadPose:captureData:trackingData:validDataBounds:frameTimestampMS:]::$_3::operator()((id *)&v138, v102, (double *)a4, (uint64_t)buf, a7, v8, v14);
    if (v154) {

    }
    if (!v14
      || ([v14 rejectionState],
          BOOL v54 = *(_DWORD *)buf == 0,
          *(id *)&buf[24],
          *(id *)&buf[8],
          v54))
    {
LABEL_54:
      int v134 = 24;
      double v55 = objc_msgSend(NSString, "stringWithFormat:", @"bad alignment [yaw %g pitch %g] with all target poses", *(float *)a4, *((float *)a4 + 1));
      uint64_t v136 = 0;
      uint64_t v137 = 0;
      v135 = v55;
      if (v14) {
        [v14 setRejectionState:&v134];
      }
      else {
    }
      }
    id v56 = v14;
    goto LABEL_95;
  }
  uint64_t v28 = 0;
  float v29 = *(float *)a4;
  float v30 = *((float *)a4 + 1);
  long long v31 = (float *)((char *)self->_targetPosesData.__begin_ + 96);
  float v32 = 0.0;
  uint64_t v33 = -1;
  do
  {
    if (*(v31 - 3) <= v29 && *(v31 - 2) >= v29 && *(v31 - 1) <= v30 && *v31 >= v30)
    {
      float32x4_t v34 = vmulq_f32(*((float32x4_t *)a4 + 1), *(float32x4_t *)(v31 - 24));
      float v35 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2), vaddq_f32(v34, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v34.f32, 1))).f32[0];
      if (v35 > v32)
      {
        float v32 = v35;
        uint64_t v33 = v28;
      }
    }
    ++v28;
    v31 += 28;
  }
  while (requiredPosesCount != v28);
  char v36 = self;
  v138 = v36;
  if (v33 == -1) {
    goto LABEL_49;
  }
  uint64_t v37 = v36;
  begin = self->_targetPosesData.__begin_;
  uint64_t v39 = VGLogVGFrameSelector();
  if (os_signpost_enabled(v39))
  {
    if (*((unsigned char *)begin + 112 * v33 + 80)) {
      uint64_t v40 = @"true";
    }
    else {
      uint64_t v40 = @"false";
    }
    *(_DWORD *)long long buf = 138543362;
    *(void *)&uint8_t buf[4] = v40;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v39, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ProcessHeadPose_PoseFilters", "isFrontPose:%{public}@", buf, 0xCu);
  }

  v133[0] = MEMORY[0x263EF8330];
  v133[1] = 3221225472;
  v133[2] = __93__VGFrameSelector_processHeadPose_captureData_trackingData_validDataBounds_frameTimestampMS___block_invoke_682;
  v133[3] = &__block_descriptor_40_e5_v8__0l;
  v133[4] = (char *)begin + 112 * v33;
  __int16 v97 = (void (**)(void))MEMORY[0x261227FC0](v133);
  uint64_t v41 = (char *)begin + 112 * v33;
  int v43 = *((_DWORD *)v41 + 16);
  v42 = (unsigned int *)(v41 + 64);
  if (v43) {
    float v44 = @"pitch";
  }
  else {
    float v44 = @"yaw";
  }
  v99 = v44;
  float v45 = __VGLogSharedInstance();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218498;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v99;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v33;
    _os_log_impl(&dword_260C8D000, v45, OS_LOG_TYPE_DEBUG, " Frame#%zu acquired by %@ selector with poseIdx %d ", buf, 0x1Cu);
  }

  [v14 setPoseIndex:v33];
  [v14 setMotionType:*v42];
  *(_OWORD *)long long buf = *((_OWORD *)begin + 7 * v33);
  float v46 = (char *)begin + 112 * v33;
  float v48 = (void *)*((void *)v46 + 2);
  float32x2_t v47 = v46 + 16;
  *(void *)&buf[16] = v48;
  long long v149 = *((_OWORD *)v47 + 1);
  long long v49 = *((_OWORD *)v47 + 2);
  long long v50 = *((_OWORD *)v47 + 3);
  long long v51 = *((_OWORD *)v47 + 4);
  int v153 = *((_DWORD *)v47 + 20);
  long long v151 = v50;
  long long v152 = v51;
  long long v150 = v49;
  char v154 = 1;
  -[VGFrameSelector processHeadPose:captureData:trackingData:validDataBounds:frameTimestampMS:]::$_3::operator()((id *)&v138, v102, (double *)a4, (uint64_t)buf, a7, v8, v14);
  if (v154) {

  }
  if (!v14)
  {
    memset(buf, 0, sizeof(buf));

LABEL_59:
    [(VGFrameSelector *)v37 applyVisionFaceLandmarksFilter:v102 bestTargetPoseData:(char *)begin + 112 * v33 frameTimestampMS:v8];
    if (*(_DWORD *)buf)
    {
      int v129 = *(_DWORD *)buf;
      id v57 = *(id *)&buf[8];
      id v130 = v57;
      uint64_t v131 = *(void *)&buf[16];
      id v58 = *(id *)&buf[24];
      id v132 = v58;
      if (v14)
      {
        [v14 setRejectionState:&v129];
      }
      else
      {
      }
      id v62 = v14;
      goto LABEL_93;
    }
    float v128 = 1.0;
    [(VGFrameSelector *)v37 applyExpressionFilters:(char *)begin + 112 * v33 trackingData:v103 frameTimestampMS:v8 score:&v128];
    if (*(_DWORD *)v155)
    {
      int v124 = *(_DWORD *)v155;
      id v60 = *(id *)&v155[8];
      id v125 = v60;
      uint64_t v126 = v156;
      id v61 = *((id *)&v156 + 1);
      id v127 = v61;
      if (v14)
      {
        [v14 setRejectionState:&v124];
      }
      else
      {
      }
      goto LABEL_91;
    }
    float v63 = v128;
    uint64_t v64 = (float *)((char *)begin + 112 * v33);
    float v66 = v64[15];
    __int16 v65 = v64 + 15;
    float v67 = v66;
    if (v128 < v66)
    {
      int v120 = 23;
      float64_t v68 = objc_msgSend(NSString, "stringWithFormat:", @"lower score [%g < %g]", v128, v67);
      uint64_t v122 = 0;
      uint64_t v123 = 0;
      v121 = v68;
      if (v14)
      {
        [v14 setRejectionState:&v120];
LABEL_91:
        id v90 = v14;
LABEL_92:

LABEL_93:
        goto LABEL_94;
      }
      goto LABEL_90;
    }
    __int16 v69 = (char *)begin + 112 * v33;
    int v70 = v69[52];
    if (v69[52])
    {
      __int16 v71 = (float *)((char *)begin + 112 * v33);
      float v72 = acosf(v71[12]);
      *(float *)&double v59 = cosf(v72 + v71[14]);
    }
    else
    {
      LODWORD(v59) = -1.0;
    }
    if (v63 == v67 && v32 <= *(float *)&v59)
    {
      int v116 = 25;
      double v73 = *(float *)&v59;
      if (v70) {
        double v74 = *((float *)begin + 28 * v33 + 12);
      }
      else {
        double v74 = -1.0;
      }
      float64_t v68 = [NSString stringWithFormat:@"lower alignment [%g <= %g] (tolerance (radians): %g, best alignment: %g)", v32, *(void *)&v73, *((float *)begin + 28 * v33 + 14), *(void *)&v74];
      uint64_t v118 = 0;
      uint64_t v119 = 0;
      v117 = v68;
      if (v14)
      {
        [v14 setRejectionState:&v116];
        goto LABEL_91;
      }
LABEL_90:

      goto LABEL_91;
    }
    -[VGFrameSelector applyVisionFilters:bestTargetPoseData:frameTimestampMS:](v37, "applyVisionFilters:bestTargetPoseData:frameTimestampMS:", v102, (char *)begin + 112 * v33, v8, v59);
    if (v144)
    {
      int v112 = v144;
      id v75 = *((id *)&v144 + 1);
      id v113 = v75;
      uint64_t v114 = v145;
      id v76 = *((id *)&v145 + 1);
      id v115 = v76;
      if (v14)
      {
        __int16 v77 = &v112;
LABEL_104:
        [v14 setRejectionState:v77];
LABEL_107:
        id v94 = v14;

        goto LABEL_92;
      }
      __int16 v87 = v76;
    }
    else
    {
      if (!*((unsigned char *)begin + 112 * v33 + 80)) {
        goto LABEL_99;
      }
      if (!v101) {
        goto LABEL_99;
      }
      uint64_t v78 = [v101 frameState];
      [v78 aggregatedScore];
      float v80 = v79;
      __int16 v81 = [*(id *)v47 bodyPoseFrameState];
      [v81 aggregatedScore];
      BOOL v83 = v80 < v82;

      if (!v83)
      {
LABEL_99:
        double v92 = (char *)begin + 112 * v33;
        __int16 v93 = (float *)(v92 + 48);
        if (v92[52] && *v93 >= v32) {
          float v32 = *v93;
        }
        *__int16 v93 = v32;
        v92[52] = 1;
        *__int16 v65 = v128;
        int v104 = 0;
        uint64_t v106 = 0;
        uint64_t v107 = 0;
        uint64_t v105 = 0;
        if (!v14) {
          goto LABEL_107;
        }
        __int16 v77 = &v104;
        goto LABEL_104;
      }
      int v108 = 41;
      float64_t v84 = NSString;
      id v75 = [v101 frameState];
      [v75 aggregatedScore];
      float v86 = v85;
      __int16 v87 = [*(id *)v47 bodyPoseFrameState];
      [v87 aggregatedScore];
      __int16 v89 = objc_msgSend(v84, "stringWithFormat:", @"lower body pose aggregated score [%g < %g]", v86, v88);
      uint64_t v110 = 0;
      uint64_t v111 = 0;
      v109 = v89;
      if (v14) {
        [v14 setRejectionState:&v108];
      }
      else {
    }
      }
    goto LABEL_107;
  }
  [v14 rejectionState];
  BOOL v52 = *(_DWORD *)buf == 0;

  if (v52) {
    goto LABEL_59;
  }
  id v53 = v14;
LABEL_94:

  v97[2](v97);
  self = v138;
LABEL_95:

LABEL_96:
  __93__VGFrameSelector_processHeadPose_captureData_trackingData_validDataBounds_frameTimestampMS___block_invoke();

  return v14;
}

void __93__VGFrameSelector_processHeadPose_captureData_trackingData_validDataBounds_frameTimestampMS___block_invoke()
{
  v0 = VGLogVGFrameSelector();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ProcessHeadPose", (const char *)&unk_260D385D9, v1, 2u);
  }
}

- (void)processHeadPose:captureData:trackingData:validDataBounds:frameTimestampMS:
{
  id v13 = a2;
  id v14 = a7;
  if (*(unsigned char *)(a5 + 32))
  {
    if (*a1)
    {
      objc_msgSend(*a1, "checkDepthFoVFilter:framePose:bestTargetPoseData:validDataBounds:frameTimestampMS:", v13, a4, a5, a6, a3[4], a3[6], a3[8], a3[10]);
      uint64_t v15 = *((void *)&v23 + 1);
    }
    else
    {
      uint64_t v15 = 0;
      long long v22 = 0u;
      long long v23 = 0u;
    }
    [v14 addDebugDataForKey:@"depthFovFilter" debugData:v15];
    if (v22)
    {
      int v18 = v22;
      id v16 = *((id *)&v22 + 1);
      id v19 = v16;
      uint64_t v20 = v23;
      id v17 = *((id *)&v23 + 1);
      id v21 = v17;
      if (v14)
      {
        [v14 setRejectionState:&v18];
      }
      else
      {
      }
    }
  }
}

void __93__VGFrameSelector_processHeadPose_captureData_trackingData_validDataBounds_frameTimestampMS___block_invoke_682(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = VGLogVGFrameSelector();
  if (os_signpost_enabled(v2))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 80)) {
      v3 = @"true";
    }
    else {
      v3 = @"false";
    }
    int v4 = 138543362;
    id v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ProcessHeadPose_PoseFilters", "isFrontPose:%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (optional<simd_float4x4>)parseAtlasToCameraTransformation:(id)a3
{
  int v4 = v3;
  id v57 = [a3 objectForKeyedSubscript:@"tracked_faces"];
  if (![v57 count])
  {
    id v5 = __VGLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v6 = " Could not extract atlas joint. No Faces tracked ";
      goto LABEL_7;
    }
LABEL_8:

    *int v4 = 0;
    v4[64] = 0;
    goto LABEL_26;
  }
  if ((unint64_t)[v57 count] >= 2)
  {
    id v5 = __VGLogSharedInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v6 = " Could not extract atlas joint. Multiple faces tracked in FaceKitDictionary. Discarding all. ";
LABEL_7:
      _os_log_impl(&dword_260C8D000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  uint64_t v7 = [v57 objectAtIndexedSubscript:0];
  id v56 = [v7 objectForKeyedSubscript:@"raw_data"];
  uint64_t v8 = [v56 objectForKeyedSubscript:@"pose"];
  if (v8)
  {
    double v55 = v4;
    unint64_t v9 = v7;
    for (uint64_t i = 0; i != 3; ++i)
    {
      for (uint64_t j = 0; j != 3; ++j)
      {
        float v12 = [v8 objectForKeyedSubscript:@"rotation"];
        id v13 = [v12 objectAtIndexedSubscript:j];
        id v14 = [v13 objectAtIndexedSubscript:i];
        [v14 floatValue];
        uint64_t v15 = &v61[i];
        *((_DWORD *)v15 + j) = v16;
      }
      *((_DWORD *)v15 + 3) = 0;
    }
    uint64_t v17 = 0;
    float32x4_t v58 = (float32x4_t)v61[3];
    uint64_t v7 = v9;
    do
    {
      int v18 = [v8 objectForKeyedSubscript:@"translation"];
      id v19 = [v18 objectAtIndexedSubscript:v17];
      [v19 floatValue];
      float32x4_t v60 = v58;
      *(float *)((unint64_t)&v60 & 0xFFFFFFFFFFFFFFF3 | (4 * (v17 & 3))) = v20 * 0.001;
      float32x4_t v58 = v60;

      ++v17;
    }
    while (v17 != 3);
    id v21 = [v9 objectForKeyedSubscript:@"kAtlasToFaceKitTransform"];
    long long v22 = v21;
    if (v21)
    {
      long long v23 = [v21 objectAtIndexedSubscript:0];
      objc_msgSend(v23, "vg_float4ByInvokingFloatValue");
      int32x4_t v54 = v24;

      uint64_t v25 = [v22 objectAtIndexedSubscript:1];
      objc_msgSend(v25, "vg_float4ByInvokingFloatValue");
      int32x4_t v53 = v26;

      float v27 = [v22 objectAtIndexedSubscript:2];
      objc_msgSend(v27, "vg_float4ByInvokingFloatValue");
      int32x4_t v52 = v28;

      float v29 = [v22 objectAtIndexedSubscript:3];
      objc_msgSend(v29, "vg_float4ByInvokingFloatValue");
      int32x4_t v51 = v30;
      float32x4_t v31 = v58;
      v31.i32[3] = 1.0;
      float32x4_t v59 = v31;

      uint64_t v32 = 0;
      int32x4_t v33 = vzip1q_s32(v54, v52);
      int32x4_t v34 = vzip2q_s32(v54, v52);
      int32x4_t v35 = vzip1q_s32(v53, v51);
      int32x4_t v36 = vzip2q_s32(v53, v51);
      float32x4_t v37 = (float32x4_t)vzip1q_s32(v33, v35);
      float32x4_t v38 = (float32x4_t)vzip2q_s32(v33, v35);
      float32x4_t v39 = (float32x4_t)vzip1q_s32(v34, v36);
      float32x4_t v40 = (float32x4_t)vzip2q_s32(v34, v36);
      long long v62 = xmmword_260D21970;
      long long v63 = xmmword_260D21980;
      long long v64 = xmmword_260D21990;
      long long v65 = xmmword_260D219A0;
      do
      {
        *(float32x4_t *)&buf[v32] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v37, COERCE_FLOAT(*(long long *)((char *)&v62 + v32))), v38, *(float32x2_t *)((char *)&v62 + v32), 1), v39, *(float32x4_t *)((char *)&v62 + v32), 2), v40, *(float32x4_t *)((char *)&v62 + v32), 3);
        v32 += 16;
      }
      while (v32 != 64);
      uint64_t v41 = 0;
      long long v42 = v69;
      HIDWORD(v42) = 1.0;
      float32x4_t v43 = (float32x4_t)v61[0];
      float32x4_t v44 = (float32x4_t)v61[1];
      float32x4_t v45 = (float32x4_t)v61[2];
      long long v62 = *(_OWORD *)buf;
      long long v63 = v67;
      long long v64 = v68;
      long long v65 = v42;
      do
      {
        *(float32x4_t *)&buf[v41] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v43, COERCE_FLOAT(*(long long *)((char *)&v62 + v41))), v44, *(float32x2_t *)((char *)&v62 + v41), 1), v45, *(float32x4_t *)((char *)&v62 + v41), 2), v59, *(float32x4_t *)((char *)&v62 + v41), 3);
        v41 += 16;
      }
      while (v41 != 64);
      long long v46 = v67;
      long long v47 = v68;
      long long v48 = v69;
      *(_OWORD *)double v55 = *(_OWORD *)buf;
      *((_OWORD *)v55 + 1) = v46;
      *((_OWORD *)v55 + 2) = v47;
      *((_OWORD *)v55 + 3) = v48;
      char v49 = 1;
    }
    else
    {
      char v49 = 0;
      *double v55 = 0;
    }
    v55[64] = v49;
  }
  else
  {
    *int v4 = 0;
    v4[64] = 0;
  }

LABEL_26:
  return v50;
}

- (id)processCaptureData:(int32x4_t)a3 trackingData:(int32x4_t)a4 framePose:(float32x4_t)a5 validDataFrameBounds:(uint64_t)a6
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v96 = a7;
  id v89 = a8;
  id v13 = VGLogVGFrameSelector();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ProcessCaptureData", (const char *)&unk_260D385D9, buf, 2u);
  }

  if (v96) {
    [v96 timestamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  uint64_t v15 = __VGLogSharedInstance();
  unint64_t v16 = (unint64_t)(Seconds * 1000.0);
  int32x4_t v17 = (int32x4_t)vmulq_f32(a5, a5);
  v17.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v17, 2), vadd_f32(*(float32x2_t *)v17.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v17.i8, 1))).u32[0];
  float32x2_t v18 = vrsqrte_f32((float32x2_t)v17.u32[0]);
  float32x2_t v19 = vmul_f32(v18, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v18, v18)));
  float32x4_t v20 = vmulq_n_f32(a5, vmul_f32(v19, vrsqrts_f32((float32x2_t)v17.u32[0], vmul_f32(v19, v19))).f32[0]);
  float32x4_t v21 = (float32x4_t)vtrn2q_s32(a2, a3);
  v21.i32[2] = a4.i32[1];
  float32x4_t v94 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(vzip1q_s32(a2, a4), a3), v20.f32[0]), v21, *(float32x2_t *)v20.f32, 1), (float32x4_t)vzip1q_s32(vzip2q_s32(a2, a4), vdupq_laneq_s32(a3, 2)), v20, 2);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    float v22 = (float)(asinf(v94.f32[0]) * 180.0) / 3.14159265;
    double v23 = v22;
    float v24 = asinf(v94.f32[1]);
    *(_DWORD *)long long buf = 134219265;
    *(void *)&uint8_t buf[4] = (unint64_t)(Seconds * 1000.0);
    *(_WORD *)&buf[12] = 2049;
    *(double *)&buf[14] = a5.f32[0];
    *(_WORD *)&buf[22] = 2049;
    *(double *)&buf[24] = a5.f32[1];
    float v25 = (float)(v24 * 180.0) / 3.14159265;
    __int16 v121 = 2049;
    double v122 = a5.f32[2];
    __int16 v123 = 2049;
    double v124 = v23;
    __int16 v125 = 2049;
    double v126 = v25;
    _os_log_impl(&dword_260C8D000, v15, OS_LOG_TYPE_DEBUG, " Frame#%zu acquired by pose selector with position x:%{private}g y:%{private}g z:%{private}g view direction x:%{private}g y:%{private}g ", buf, 0x3Eu);
  }

  int32x4_t v26 = __VGLogSharedInstance();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    float v27 = [v96 allFaces];
    if (v27)
    {
      int32x4_t v28 = NSNumber;
      unint64_t v9 = [v96 allFaces];
      objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      float v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      float v29 = @"n/a";
    }
    *(_DWORD *)long long buf = 134218242;
    *(void *)&uint8_t buf[4] = (unint64_t)(Seconds * 1000.0);
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v29;
    _os_log_impl(&dword_260C8D000, v26, OS_LOG_TYPE_DEBUG, " Frame#%zu number of face bounding boxes: %@  ", buf, 0x16u);
    if (v27)
    {
    }
  }

  int v30 = [v96 mirrored];
  float v31 = (float)(atan2f(-v94.f32[0], v94.f32[2]) * 180.0) / 3.14159265;
  if (v30) {
    float v32 = -v31;
  }
  else {
    float v32 = v31;
  }
  float v33 = asinf(v94.f32[1]);
  int32x4_t v34 = __VGLogSharedInstance();
  float v35 = (float)(v33 * -180.0) / 3.14159265;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134218497;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2049;
    *(double *)&buf[14] = v32;
    *(_WORD *)&buf[22] = 2049;
    *(double *)&buf[24] = v35;
    _os_log_impl(&dword_260C8D000, v34, OS_LOG_TYPE_DEBUG, " Frame#%zu [yaw pitch] (degrees): [%{private}g %{private}g] ", buf, 0x20u);
  }

  if ([*(id *)(a1 + 40) useSimpleSelector])
  {
    *(float *)uint64_t v110 = v32;
    *(float *)&v110[1] = v35;
    uint64_t v111 = 0;
    float32x4_t v112 = v94;
    int32x4_t v113 = a2;
    int32x4_t v114 = a3;
    int32x4_t v115 = a4;
    float32x4_t v116 = a5;
    int32x4_t v36 = [(id)a1 processHeadPoseSimple:v110 frameTimestampMS:v16];
  }
  else
  {
    *(float *)v103 = v32;
    *(float *)&v103[1] = v35;
    uint64_t v104 = 0;
    float32x4_t v105 = v94;
    int32x4_t v106 = a2;
    int32x4_t v107 = a3;
    int32x4_t v108 = a4;
    float32x4_t v109 = a5;
    int32x4_t v36 = [(id)a1 processHeadPose:v103 captureData:v96 trackingData:v89 validDataBounds:a9 frameTimestampMS:v16];
  }
  float32x4_t v38 = v36;
  *(float *)&double v37 = v32;
  [v36 setYawInDegrees:v37];
  *(float *)&double v39 = v35;
  float32x4_t v40 = vg::shared::VisualLogger::sharedLogger((vg::shared::VisualLogger *)[v38 setPitchInDegrees:v39]);
  uint64_t v41 = (__CVBuffer *)[v96 rgbRectified];
  if (v96) {
    [v96 timestamp];
  }
  else {
    memset(&v102, 0, sizeof(v102));
  }
  double v42 = CMTimeGetSeconds(&v102);
  vg::shared::VisualLogger::logPixelBuffer((vg::shared::VisualLogger *)v40, v41, v42, &cfstr_VisageFramesel.isa, 0);
  float32x4_t v43 = NSString;
  if (v38)
  {
    [v38 rejectionState];
    int v44 = *(_DWORD *)buf;
  }
  else
  {
    int v44 = 0;
    memset(buf, 0, sizeof(buf));
  }
  vg::frame_selection::frameRejectionReasonToString(v44, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  long long v46 = objc_msgSend(v43, "stringWithFormat:", @"%s", p_p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  if (v38)
  {
    [v38 rejectionState];
    if (*(void *)&buf[8])
    {
      [v38 rejectionState];
      long long v47 = (__CFString *)(id)__p.__r_.__value_.__l.__size_;

      goto LABEL_39;
    }
  }
  else
  {
    memset(buf, 0, sizeof(buf));
  }
  long long v47 = @"None";
LABEL_39:

  v118[0] = @"picked";
  int v48 = [v38 isSuccessful];
  char v49 = @"no";
  if (v48) {
    char v49 = @"yes";
  }
  v119[0] = v49;
  v119[1] = v46;
  v118[1] = @"reason";
  v118[2] = @"description";
  v119[2] = v47;
  optional<simd_float4x4> v50 = [NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:3];
  if (v96) {
    [v96 timestamp];
  }
  else {
    memset(&v99, 0, sizeof(v99));
  }
  double v51 = CMTimeGetSeconds(&v99);
  vg::shared::VisualLogger::logDictionary((vg::shared::VisualLogger *)v40, v50, v51, &cfstr_VisageFramesel_0.isa, 0);

  int32x4_t v53 = vg::shared::VisualLogger::sharedLogger(v52);
  if ([v38 isSuccessful])
  {
    uint64_t v54 = a1;
    uint64_t v55 = [v38 poseIndex];
    uint64_t v56 = *(void *)(a1 + 8);
    uint64_t v57 = v56 + 112 * v55;
    uint64_t v59 = *(void *)(v57 + 72);
    float32x4_t v58 = (double *)(v57 + 72);
    [v38 setTargetAngleId:v59];
    uint64_t v60 = v56 + 112 * v55;
    LODWORD(v59) = *(_DWORD *)(v60 + 68);
    id v61 = (float *)(v60 + 68);
    LODWORD(v62) = v59;
    [v38 setAngleInDegrees:v62];
    uint64_t v63 = v56 + 112 * v55;
    LODWORD(v59) = *(unsigned __int8 *)(v63 + 80);
    long long v64 = (unsigned __int8 *)(v63 + 80);
    if (v59
      && vg::shared::VisualLogger::isLoggerEnabled((vg::shared::VisualLogger *)v53, &cfstr_VisageFramesel_1.isa))
    {
      long long v65 = (__CVBuffer *)[v96 rgbRectified];
      if (v96) {
        [v96 timestamp];
      }
      else {
        memset(&v97, 0, sizeof(v97));
      }
      double v68 = CMTimeGetSeconds(&v97);
      vg::shared::VisualLogger::logPixelBuffer((vg::shared::VisualLogger *)v53, v65, v68, &cfstr_VisageFramesel_1.isa, 0);
    }
    uint64_t v69 = v56 + 112 * v55;
    int v71 = *(_DWORD *)(v69 + 64);
    int v70 = (_DWORD *)(v69 + 64);
    if (v71) {
      float v72 = @"pitch";
    }
    else {
      float v72 = @"yaw";
    }
    double v95 = v72;
    double v73 = __VGLogSharedInstance();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      double v74 = *v61;
      double v75 = *v58;
      *(_DWORD *)long long buf = 134218755;
      *(void *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v95;
      *(_WORD *)&buf[22] = 2049;
      *(double *)&buf[24] = v74;
      __int16 v121 = 2049;
      double v122 = v75;
      _os_log_impl(&dword_260C8D000, v73, OS_LOG_TYPE_DEBUG, " Frame#%zu selected by %@ selector with angle:%{private}f target angle index:%{private}zu ", buf, 0x2Au);
    }

    id v76 = objc_opt_new();
    __int16 v77 = (void *)[v96 copy];
    [v76 setCaptureData:v77];

    [v76 setTrackingData:v89];
    [v76 setFrontPose:*v64];
    uint64_t v78 = [v38 bodyPoseFrameState];
    [v76 setBodyPoseFrameState:v78];

    if (*v70) {
      *(float *)&double v79 = v35;
    }
    else {
      *(float *)&double v79 = v32;
    }
    [v76 setSelectedAngle:v79];
    *(float *)&double v80 = v35;
    [v76 setSelectedPitch:v80];
    *(float *)&double v81 = v32;
    [v76 setSelectedYaw:v81];
    uint64_t v82 = v56 + 112 * v55;
    float64_t v84 = *(void **)(v82 + 16);
    BOOL v83 = (void **)(v82 + 16);
    float v85 = +[VGFrameSelector invalidPose];
    int v86 = [v84 isEqual:v85];

    if (v86) {
      --*(void *)(v54 + 64);
    }
    __int16 v87 = *v83;
    *BOOL v83 = v76;
  }
  else if (vg::shared::VisualLogger::isLoggerEnabled((vg::shared::VisualLogger *)v53, &cfstr_VisageFramesel_1.isa))
  {
    ZeroPixelBuffer = createZeroPixelBuffer(1uLL, 1uLL);
    if (ZeroPixelBuffer)
    {
      if (v96) {
        [v96 timestamp];
      }
      else {
        memset(&v98, 0, sizeof(v98));
      }
      double v67 = CMTimeGetSeconds(&v98);
      vg::shared::VisualLogger::logPixelBuffer((vg::shared::VisualLogger *)v53, ZeroPixelBuffer, v67, &cfstr_VisageFramesel_1.isa, 0);
    }
    CVPixelBufferRelease(ZeroPixelBuffer);
  }
  __82__VGFrameSelector_processCaptureData_trackingData_framePose_validDataFrameBounds___block_invoke();

  return v38;
}

void __82__VGFrameSelector_processCaptureData_trackingData_framePose_validDataFrameBounds___block_invoke()
{
  v0 = VGLogVGFrameSelector();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_260C8D000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ProcessCaptureData", (const char *)&unk_260D385D9, v1, 2u);
  }
}

- (id)resultsForMotionType:(optional<vg::frame_selection::MotionType>)a3
{
  id v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:self->_requiredPosesCount];
  unint64_t requiredPosesCount = self->_requiredPosesCount;
  if (requiredPosesCount)
  {
    uint64_t v8 = 0;
    for (unint64_t i = 0; i < requiredPosesCount; ++i)
    {
      begin = self->_targetPosesData.__begin_;
      if ((*(void *)&a3 & 0xFF00000000) == 0 || *(_DWORD *)((char *)begin + v8 + 64) == a3.var0.var1)
      {
        uint64_t v11 = *(void *)((char *)begin + v8 + 16);
        LODWORD(v6) = *(_DWORD *)((char *)begin + v8 + 68);
        float v12 = [NSNumber numberWithFloat:v6];
        [v5 setObject:v11 forKeyedSubscript:v12];

        unint64_t requiredPosesCount = self->_requiredPosesCount;
      }
      v8 += 112;
    }
  }

  return v5;
}

- (NSDictionary)results
{
  return (NSDictionary *)[(VGFrameSelector *)self resultsForMotionType:0];
}

- (NSDictionary)yawResults
{
  return (NSDictionary *)[(VGFrameSelector *)self resultsForMotionType:0x100000000];
}

- (NSDictionary)pitchResults
{
  return (NSDictionary *)[(VGFrameSelector *)self resultsForMotionType:0x100000001];
}

- (id)selectedValidPosesForMotion:(optional<vg::frame_selection::MotionType>)a3
{
  id v5 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:self->_requiredPosesCount];
  if (self->_requiredPosesCount)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      begin = self->_targetPosesData.__begin_;
      if (((*(void *)&a3 & 0xFF00000000) == 0 || *(_DWORD *)((char *)begin + v6 + 64) == a3.var0.var1)
        && [*(id *)((char *)begin + v6 + 16) valid])
      {
        uint64_t v10 = *(void *)((char *)begin + v6 + 16);
        LODWORD(v9) = *(_DWORD *)((char *)begin + v6 + 68);
        uint64_t v11 = [NSNumber numberWithFloat:v9];
        [v5 setObject:v10 forKeyedSubscript:v11];
      }
      ++v7;
      v6 += 112;
    }
    while (v7 < self->_requiredPosesCount);
  }

  return v5;
}

- (id)selectedYawValidPoses
{
  return [(VGFrameSelector *)self selectedValidPosesForMotion:0x100000000];
}

- (id)selectedPitchValidPoses
{
  return [(VGFrameSelector *)self selectedValidPosesForMotion:0x100000001];
}

- (BOOL)completed
{
  return self->_remainingPosesCount == 0;
}

- (BOOL)completedYaw
{
  v2 = self;
  v3 = [(VGFrameSelector *)self selectedYawValidPoses];
  uint64_t v4 = [v3 count];
  LOBYTE(v2) = v4 == [(VGFrameSelectorOptions *)v2->_options yawFrameCount];

  return (char)v2;
}

- (BOOL)completedPitch
{
  v2 = self;
  v3 = [(VGFrameSelector *)self selectedPitchValidPoses];
  uint64_t v4 = [v3 count];
  LOBYTE(v2) = v4 == [(VGFrameSelectorOptions *)v2->_options pitchFrameCount];

  return (char)v2;
}

- (unint64_t)requiredPosesCount
{
  return self->_requiredPosesCount;
}

- (unint64_t)remainingPosesCount
{
  return self->_remainingPosesCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userBodyPoseGuidance, 0);
  objc_storeStrong((id *)&self->_options, 0);
  p_targetPosesData = &self->_targetPosesData;
  std::vector<TargetPoseData>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_targetPosesData);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end