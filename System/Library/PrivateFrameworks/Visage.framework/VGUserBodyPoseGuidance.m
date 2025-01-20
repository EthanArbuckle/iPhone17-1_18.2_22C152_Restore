@interface VGUserBodyPoseGuidance
- (VGUserBodyPoseGuidance)initWithOptions:(id)a3;
- (float)calculateAggregatedScoreFromScores:(id)a3;
- (id)calculatePoseGuidanceFromSkeleton:(float32x4_t)a3 andAtlasToDeviceTransform:(float32x4_t)a4 atTimestamp:(simd_float4)a5;
- (id)evaluatePoseValues:(id)a3 atTimestamp:(double)a4;
@end

@implementation VGUserBodyPoseGuidance

- (VGUserBodyPoseGuidance)initWithOptions:(id)a3
{
  v98[7] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v97.receiver = self;
  v97.super_class = (Class)VGUserBodyPoseGuidance;
  v6 = [(VGUserBodyPoseGuidance *)&v97 init];
  v7 = v6;
  if (v6)
  {
    p_options = (id *)&v6->_options;
    objc_storeStrong((id *)&v6->_options, a3);
    [*p_options torsoHeadTargetMin];
    int v10 = v9;
    [*p_options torsoHeadTargetMax];
    int v12 = v11;
    [*p_options torsoHeadMarginMin];
    int v14 = v13;
    [*p_options torsoHeadMarginMax];
    LODWORD(v16) = v15;
    LODWORD(v17) = v10;
    LODWORD(v18) = v12;
    LODWORD(v19) = v14;
    v20 = +[VGUserBodyPoseTarget targetWithIdentifier:2 targetDescription:@"torso - up aligned with head" targetMin:1 targetMax:1 marginMin:30 marginMax:30 feedbackTooSmall:v17 feedbackTooLarge:v18 rejectionReasonTooSmall:v19 rejectionReasonTooLarge:v16];
    v98[0] = v20;
    [*p_options shouldersTwistTargetMin];
    int v22 = v21;
    [*p_options shouldersTwistTargetMax];
    int v24 = v23;
    [*p_options shouldersTwistMarginMin];
    int v26 = v25;
    [*p_options shouldersTwistMarginMax];
    LODWORD(v28) = v27;
    LODWORD(v29) = v22;
    LODWORD(v30) = v24;
    LODWORD(v31) = v26;
    v32 = +[VGUserBodyPoseTarget targetWithIdentifier:3 targetDescription:@"shoulders - twist relative to head" targetMin:2 targetMax:2 marginMin:31 marginMax:31 feedbackTooSmall:v29 feedbackTooLarge:v30 rejectionReasonTooSmall:v31 rejectionReasonTooLarge:v28];
    v98[1] = v32;
    [*p_options leftElbowTargetMin];
    int v34 = v33;
    [*p_options leftElbowTargetMax];
    int v36 = v35;
    [*p_options leftElbowMarginMin];
    int v38 = v37;
    [*p_options leftElbowMarginMax];
    LODWORD(v40) = v39;
    LODWORD(v41) = v34;
    LODWORD(v42) = v36;
    LODWORD(v43) = v38;
    v44 = +[VGUserBodyPoseTarget targetWithIdentifier:0 targetDescription:@"elbows - left arm" targetMin:3 targetMax:4 marginMin:33 marginMax:32 feedbackTooSmall:v41 feedbackTooLarge:v42 rejectionReasonTooSmall:v43 rejectionReasonTooLarge:v40];
    v98[2] = v44;
    [*p_options rightElbowTargetMin];
    int v46 = v45;
    [*p_options rightElbowTargetMax];
    int v48 = v47;
    [*p_options rightElbowMarginMin];
    int v50 = v49;
    [*p_options rightElbowMarginMax];
    LODWORD(v52) = v51;
    LODWORD(v53) = v46;
    LODWORD(v54) = v48;
    LODWORD(v55) = v50;
    v56 = +[VGUserBodyPoseTarget targetWithIdentifier:1 targetDescription:@"elbows - right arm" targetMin:4 targetMax:3 marginMin:34 marginMax:35 feedbackTooSmall:v53 feedbackTooLarge:v54 rejectionReasonTooSmall:v55 rejectionReasonTooLarge:v52];
    v98[3] = v56;
    [*p_options shouldersHeightAsymmetryTargetMin];
    int v58 = v57;
    [*p_options shouldersHeightAsymmetryTargetMax];
    int v60 = v59;
    [*p_options shouldersHeightAsymmetryMarginMin];
    int v62 = v61;
    [*p_options shouldersHeightAsymmetryMarginMax];
    LODWORD(v64) = v63;
    LODWORD(v65) = v58;
    LODWORD(v66) = v60;
    LODWORD(v67) = v62;
    v68 = +[VGUserBodyPoseTarget targetWithIdentifier:4 targetDescription:@"shoulders - height asymmetry (degree)" targetMin:5 targetMax:5 marginMin:36 marginMax:36 feedbackTooSmall:v65 feedbackTooLarge:v66 rejectionReasonTooSmall:v67 rejectionReasonTooLarge:v64];
    v98[4] = v68;
    [*p_options leftShoulderForwardTargetMin];
    int v70 = v69;
    [*p_options leftShoulderForwardTargetMax];
    int v72 = v71;
    [*p_options leftShoulderForwardMarginMin];
    int v74 = v73;
    [*p_options leftShoulderForwardMarginMax];
    LODWORD(v76) = v75;
    LODWORD(v77) = v70;
    LODWORD(v78) = v72;
    LODWORD(v79) = v74;
    v80 = +[VGUserBodyPoseTarget targetWithIdentifier:5 targetDescription:@"shoulders - left_shoulder_pos_atlas_space z" targetMin:6 targetMax:7 marginMin:37 marginMax:38 feedbackTooSmall:v77 feedbackTooLarge:v78 rejectionReasonTooSmall:v79 rejectionReasonTooLarge:v76];
    v98[5] = v80;
    [*p_options rightShoulderForwardTargetMin];
    int v82 = v81;
    [*p_options rightShoulderForwardTargetMax];
    int v84 = v83;
    [*p_options rightShoulderForwardMarginMin];
    int v86 = v85;
    [*p_options rightShoulderForwardMarginMax];
    LODWORD(v88) = v87;
    LODWORD(v89) = v82;
    LODWORD(v90) = v84;
    LODWORD(v91) = v86;
    v92 = +[VGUserBodyPoseTarget targetWithIdentifier:6 targetDescription:@"shoulders - right_shoulder_pos_atlas_space z" targetMin:6 targetMax:7 marginMin:39 marginMax:40 feedbackTooSmall:v89 feedbackTooLarge:v90 rejectionReasonTooSmall:v91 rejectionReasonTooLarge:v88];
    v98[6] = v92;
    uint64_t v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:7];
    poseTargets = v7->_poseTargets;
    v7->_poseTargets = (NSArray *)v93;

    v95 = v7;
  }

  return v7;
}

- (float)calculateAggregatedScoreFromScores:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  int v9 = (float *)&v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__VGUserBodyPoseGuidance_calculateAggregatedScoreFromScores___block_invoke;
  v7[3] = &unk_265570300;
  v7[4] = &v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];
  unint64_t v4 = [v3 count];
  float v5 = v9[6] / (float)v4;
  v9[6] = v5;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __61__VGUserBodyPoseGuidance_calculateAggregatedScoreFromScores___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [v5 value];
  *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4
                                                             + *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

- (id)evaluatePoseValues:(id)a3 atTimestamp:(double)a4
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v79 = a3;
  id v74 = (id)objc_opt_new();
  double v77 = objc_opt_new();
  double v76 = (vg::shared::VisualLogger *)objc_opt_new();
  int v87 = (vg::shared::VisualLogger *)vg::shared::VisualLogger::sharedLogger(v76);
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  obj = self->_poseTargets;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v93 objects:v103 count:16];
  int v73 = self;
  if (v6)
  {
    uint64_t v80 = v6;
    int v7 = 0;
    uint64_t v78 = *(void *)v94;
    float v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v80; ++i)
      {
        if (*(void *)v94 != v78) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v93 + 1) + 8 * i);
        uint64_t v10 = objc_opt_new();
        [v9 targetMin];
        objc_msgSend(v10, "setRawValueTargetMin:");
        [v9 targetMax];
        objc_msgSend(v10, "setRawValueTargetMax:");
        [v9 marginMin];
        objc_msgSend(v10, "setRawValueMarginMin:");
        [v9 marginMax];
        objc_msgSend(v10, "setRawValueMarginMax:");
        int v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "identifier"));
        int v85 = [v79 objectForKeyedSubscript:v11];

        if (v85)
        {
          [v85 floatValue];
          float v13 = v12;
          objc_msgSend(v10, "setRawValue:");
          [v9 targetMax];
          if (v13 <= v14)
          {
            [v9 targetMin];
            if (v13 >= *(float *)&v19)
            {
              LODWORD(v19) = 1.0;
              [v10 setValue:v19];
            }
            else
            {
              objc_msgSend(v10, "setFeedback:", objc_msgSend(v9, "feedbackTooSmall"));
              if (!v7) {
                int v7 = [v9 rejectionReasonTooSmall];
              }
              [v9 targetMin];
              float v21 = v20;
              [v9 marginMin];
              *(float *)&double v23 = fmaxf(1.0 - (float)((float)(v21 - v13) / v22), 0.0);
              [v10 setValue:v23];
            }
          }
          else
          {
            objc_msgSend(v10, "setFeedback:", objc_msgSend(v9, "feedbackTooLarge"));
            if (!v7) {
              int v7 = [v9 rejectionReasonTooLarge];
            }
            [v9 targetMax];
            float v16 = v15;
            [v9 marginMax];
            *(float *)&double v18 = fmaxf(1.0 - (float)((float)(v13 - v16) / v17), 0.0);
            [v10 setValue:v18];
          }
          int v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "identifier"));
          [v77 setObject:v10 forKey:v24];

          v101[0] = @"id";
          int v83 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "identifier"));
          v102[0] = v83;
          v101[1] = @"description";
          int v84 = [v9 targetDescription];
          v102[1] = v84;
          v101[2] = @"rawValueTargetMin";
          int v25 = NSNumber;
          [v9 targetMin];
          int v82 = objc_msgSend(v25, "numberWithFloat:");
          v102[2] = v82;
          v101[3] = @"rawValueTargetMax";
          int v26 = NSNumber;
          [v9 targetMax];
          int v81 = objc_msgSend(v26, "numberWithFloat:");
          v102[3] = v81;
          v101[4] = @"rawValueMarginMin";
          int v27 = NSNumber;
          [v9 marginMin];
          double v28 = objc_msgSend(v27, "numberWithFloat:");
          v102[4] = v28;
          v101[5] = @"rawValueMarginMax";
          double v29 = NSNumber;
          [v9 marginMax];
          double v30 = objc_msgSend(v29, "numberWithFloat:");
          v102[5] = v30;
          v101[6] = @"rawValue";
          *(float *)&double v31 = v13;
          v32 = [NSNumber numberWithFloat:v31];
          v102[6] = v32;
          v101[7] = @"value";
          int v33 = NSNumber;
          [v10 value];
          int v34 = objc_msgSend(v33, "numberWithFloat:");
          v102[7] = v34;
          v101[8] = @"feedback";
          int v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "feedback"));
          v102[8] = v35;
          v101[9] = @"feedbackStr";
          int v36 = +[VGBodyPoseFeedbackHelper feedbackToString:](VGBodyPoseFeedbackHelper, "feedbackToString:", [v10 feedback]);
          v102[9] = v36;
          int v37 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:10];
          [(vg::shared::VisualLogger *)v76 addObject:v37];

          int v38 = NSString;
          int v39 = [v9 targetDescription];
          double v40 = [v38 stringWithFormat:@"visage.userbodyposeguidance.rawValues.%@", v39];

          double v41 = [v9 targetDescription];
          vg::shared::VisualLogger::logFloat(v87, v13, a4, v40, v41);

          [v9 targetMin];
          vg::shared::VisualLogger::logFloat(v87, v42, a4, v40, &cfstr_Min.isa);
          [v9 targetMax];
          vg::shared::VisualLogger::logFloat(v87, v43, a4, v40, &cfstr_Max.isa);
          [v9 targetMin];
          float v45 = v44;
          [v9 marginMin];
          vg::shared::VisualLogger::logFloat(v87, v45 - v46, a4, v40, &cfstr_Minmargin.isa);
          [v9 targetMax];
          float v48 = v47;
          [v9 marginMax];
          vg::shared::VisualLogger::logFloat(v87, v48 + v49, a4, v40, &cfstr_Maxmargin.isa);
          [v10 value];
          float v51 = v50;
          double v52 = [v9 targetDescription];
          vg::shared::VisualLogger::logFloat(v87, v51, a4, &cfstr_VisageUserbody_0.isa, v52);

          [v10 value];
          float v54 = v53;
          double v55 = [v9 targetDescription];
          vg::shared::VisualLogger::logFloat(v87, v8 + v54, a4, &cfstr_VisageUserbody_1.isa, v55);

          float v8 = v8 + 1.0;
        }
      }
      uint64_t v80 = [(NSArray *)obj countByEnumeratingWithState:&v93 objects:v103 count:16];
    }
    while (v80);
  }
  else
  {
    int v7 = 0;
  }

  v56 = objc_opt_new();
  [v56 setScores:v77];
  [(VGUserBodyPoseGuidance *)v73 calculateAggregatedScoreFromScores:v77];
  objc_msgSend(v56, "setAggregatedScore:");
  [v56 aggregatedScore];
  vg::shared::VisualLogger::logFloat(v87, v57, a4, &cfstr_VisageUserbody_0.isa, &cfstr_Aggregatedscor.isa);
  v99[0] = @"aggregatedScore";
  int v58 = NSNumber;
  [v56 aggregatedScore];
  int v59 = objc_msgSend(v58, "numberWithFloat:");
  v99[1] = @"poseValues";
  v100[0] = v59;
  int v60 = (void *)[(vg::shared::VisualLogger *)v76 copy];
  v100[1] = v60;
  int v61 = [NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:2];

  if (v7)
  {
    int v62 = NSString;
    vg::frame_selection::frameRejectionReasonToString(v7, &__p);
    unint64_t v63 = 0x263F08000;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    double v65 = objc_msgSend(v62, "stringWithFormat:", @"Body Pose Guidance filter failed with rejection: %s", p_p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    double v65 = 0;
    unint64_t v63 = 0x263F08000uLL;
  }
  int v88 = v7;
  id v66 = v65;
  id v89 = v66;
  uint64_t v90 = 0;
  id v67 = v61;
  id v91 = v67;
  if (v74)
  {
    [v74 setRejection:&v88];
  }
  else
  {
  }
  [v74 setFrameState:v56];
  if (vg::shared::VisualLogger::isLoggerEnabled(v87, &cfstr_VisageUserbody_2.isa))
  {
    v97[0] = @"aggregatedScore";
    v68 = *(void **)(v63 + 2584);
    [v56 aggregatedScore];
    int v69 = objc_msgSend(v68, "numberWithFloat:");
    v97[1] = @"poseValues";
    v98[0] = v69;
    int v70 = (void *)[(vg::shared::VisualLogger *)v76 copy];
    v98[1] = v70;
    int v71 = [NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:2];

    vg::shared::VisualLogger::logDictionary(v87, v71, a4, &cfstr_VisageUserbody_2.isa, 0);
  }

  return v74;
}

- (id)calculatePoseGuidanceFromSkeleton:(float32x4_t)a3 andAtlasToDeviceTransform:(float32x4_t)a4 atTimestamp:(simd_float4)a5
{
  v102[7] = *MEMORY[0x263EF8340];
  id v10 = a8;
  int v11 = objc_opt_new();
  v104.columns[1] = (simd_float4)a3;
  v104.columns[0] = (simd_float4)a2;
  v104.columns[3] = a5;
  v104.columns[2] = (simd_float4)a4;
  simd_float4x4 v105 = __invert_f4(v104);
  float32x4_t v66 = (float32x4_t)v105.columns[0];
  float32x4_t v67 = (float32x4_t)v105.columns[1];
  float32x4_t v68 = (float32x4_t)v105.columns[3];
  float32x4_t v70 = (float32x4_t)v105.columns[2];
  v100.i32[2] = 0;
  v100.i64[0] = 0;
  if (!device_space_joint_pos(&v100, v10, 19))
  {
    missing_joint(&cfstr_Leftshoulder.isa, (uint64_t)v97);
    if (!v11)
    {

      double v55 = v98;
      goto LABEL_31;
    }
    [v11 setRejection:v97];
LABEL_32:
    id v54 = v11;
    goto LABEL_33;
  }
  v96.i32[2] = 0;
  v96.i64[0] = 0;
  if (!device_space_joint_pos(&v96, v10, 15))
  {
    missing_joint(&cfstr_Rightshoulder.isa, (uint64_t)v93);
    if (!v11)
    {

      double v55 = v94;
      goto LABEL_31;
    }
    [v11 setRejection:v93];
    goto LABEL_32;
  }
  v92.i32[2] = 0;
  v92.i64[0] = 0;
  if (!device_space_joint_pos(&v92, v10, 20))
  {
    missing_joint(&cfstr_Leftelbow.isa, (uint64_t)v89);
    if (!v11)
    {

      double v55 = v90;
      goto LABEL_31;
    }
    [v11 setRejection:v89];
    goto LABEL_32;
  }
  v88.i32[2] = 0;
  v88.i64[0] = 0;
  if (!device_space_joint_pos(&v88, v10, 16))
  {
    missing_joint(&cfstr_Rightelbow.isa, (uint64_t)v85);
    if (!v11)
    {

      double v55 = v86;
      goto LABEL_31;
    }
    [v11 setRejection:v85];
    goto LABEL_32;
  }
  v84.i32[2] = 0;
  v84.i64[0] = 0;
  if (!device_space_joint_pos(&v84, v10, 0))
  {
    missing_joint(&cfstr_Midshoulder.isa, (uint64_t)v81);
    if (!v11)
    {

      double v55 = v82;
      goto LABEL_31;
    }
    [v11 setRejection:v81];
    goto LABEL_32;
  }
  v80.i32[2] = 0;
  v80.i64[0] = 0;
  if (!device_space_joint_pos(&v80, v10, 1))
  {
    missing_joint(&cfstr_Spine3.isa, (uint64_t)v77);
    if (v11)
    {
      [v11 setRejection:v77];
      goto LABEL_32;
    }

    double v55 = v78;
LABEL_31:

    goto LABEL_32;
  }
  float32x4_t v12 = vsubq_f32(v92, v100);
  float32x4_t v13 = vmulq_f32(v12, v12);
  v13.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).u64[0];
  v13.f32[0] = sqrtf(v13.f32[0]) + 1.0e-16;
  float32x4_t v14 = vsubq_f32(v88, v96);
  float32x4_t v15 = vmulq_f32(v14, v14);
  v15.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).u64[0];
  v15.f32[0] = sqrtf(v15.f32[0]) + 1.0e-16;
  float32x4_t v63 = vdivq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 0));
  float32x4_t v64 = vdivq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 0));
  float32x4_t v57 = v96;
  float32x4_t v58 = v100;
  float32x4_t v16 = vsubq_f32(v96, v100);
  float32x4_t v17 = vmulq_f32(v16, v16);
  v17.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).u64[0];
  v17.f32[0] = sqrtf(v17.f32[0]) + 1.0e-16;
  float32x4_t v18 = vdivq_f32(v16, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 0));
  float32x4_t v19 = vsubq_f32(v80, v84);
  float32x4_t v20 = vmulq_f32(v19, v19);
  v20.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).u64[0];
  v20.f32[0] = sqrtf(v20.f32[0]) + 1.0e-16;
  float32x4_t v65 = vdivq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 0));
  int32x4_t v61 = (int32x4_t)v18;
  float32x4_t v62 = vnegq_f32(v18);
  float v60 = angle_deg_in_2d_plane(v62, a2, a4);
  float v59 = angle_deg_in_2d_plane(v62, a2, a3);
  float32x4_t v21 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v65, (int32x4_t)v65), (int8x16_t)v65, 0xCuLL), v62), v65, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v61, v61), (int8x16_t)v61, 0xCuLL));
  float32x4_t v22 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v21, (int32x4_t)v21), (int8x16_t)v21, 0xCuLL);
  float32x4_t v23 = vmulq_f32(v21, v21);
  v23.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v23, 2), v23)).u64[0];
  v23.f32[0] = sqrtf(v23.f32[0]) + 1.0e-16;
  float32x4_t v75 = vdivq_f32(v22, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v23.f32, 0));
  int32x4_t v24 = (int32x4_t)vnegq_f32(v65);
  float32x4_t v25 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v75, (int32x4_t)v75), (int8x16_t)v75, 0xCuLL), v65), v75, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v24, v24), (int8x16_t)v24, 0xCuLL));
  float32x4_t v26 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL);
  float32x4_t v27 = vmulq_f32(v25, v25);
  v27.i64[0] = vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 1), vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v27, 2), v27)).u64[0];
  v27.f32[0] = sqrtf(v27.f32[0]) + 1.0e-16;
  float32x4_t v72 = vdivq_f32(v26, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v27.f32, 0));
  float v28 = angle_deg_in_2d_plane(v63, v65, v72);
  float v29 = angle_deg_in_2d_plane(v64, v65, v72);
  float v30 = deg_angle_between(v75, v63);
  float v31 = deg_angle_between(v75, v64);
  float v32 = v28;
  if (v30 < 25.0)
  {
    float v33 = fminf(fmaxf((float)(25.0 - v30) / 10.0, 0.0), 1.0);
    float v32 = (float)(v33 * 90.0) + (float)((float)(1.0 - v33) * v28);
  }
  float v34 = fminf(fmaxf((float)(25.0 - v31) / 10.0, 0.0), 1.0);
  float v35 = (float)(v34 * -90.0) + (float)((float)(1.0 - v34) * v29);
  if (v31 < 25.0) {
    float v36 = v35;
  }
  else {
    float v36 = v29;
  }
  float v37 = deg_angle_between(v65, vnegq_f32(a3));
  v101[0] = &unk_270CFDAC8;
  *(float *)&double v38 = v32;
  v102[0] = [NSNumber numberWithFloat:v38];
  v101[1] = &unk_270CFDAE0;
  *(float *)&double v39 = v36;
  double v76 = (void *)v102[0];
  double v40 = [NSNumber numberWithFloat:v39];
  v102[1] = v40;
  v101[2] = &unk_270CFDAF8;
  *(float *)&double v41 = v37;
  float v42 = [NSNumber numberWithFloat:v41];
  v102[2] = v42;
  v101[3] = &unk_270CFDB10;
  *(float *)&double v43 = v60;
  float v44 = [NSNumber numberWithFloat:v43];
  v102[3] = v44;
  v101[4] = &unk_270CFDB28;
  *(float *)&double v45 = v59;
  float v46 = [NSNumber numberWithFloat:v45];
  float32x4_t v47 = vaddq_f32(v68, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v66, v58.f32[0]), v67, *(float32x2_t *)v58.f32, 1), v70, v58, 2));
  v102[4] = v46;
  v101[5] = &unk_270CFDB40;
  v47.i32[0] = v47.i32[2];
  float v48 = [NSNumber numberWithFloat:*(double *)v47.i64];
  float32x4_t v49 = vaddq_f32(v68, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v66, v57.f32[0]), v67, *(float32x2_t *)v57.f32, 1), v70, v57, 2));
  v102[5] = v48;
  v101[6] = &unk_270CFDB58;
  v49.i32[0] = v49.i32[2];
  float v50 = [NSNumber numberWithFloat:*(double *)v49.i64];
  v102[6] = v50;
  float v51 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:7];

  float v53 = vg::shared::VisualLogger::sharedLogger(v52);
  vg::shared::VisualLogger::logFloat((vg::shared::VisualLogger *)v53, v28, a6, &cfstr_VisageUserbody_3.isa, &cfstr_Leftelbowraw.isa);
  vg::shared::VisualLogger::logFloat((vg::shared::VisualLogger *)v53, v29, a6, &cfstr_VisageUserbody_3.isa, &cfstr_Rightelbowraw.isa);
  vg::shared::VisualLogger::logFloat((vg::shared::VisualLogger *)v53, v30, a6, &cfstr_VisageUserbody_3.isa, &cfstr_Leftelbowforwa.isa);
  vg::shared::VisualLogger::logFloat((vg::shared::VisualLogger *)v53, v31, a6, &cfstr_VisageUserbody_3.isa, &cfstr_Rightelbowforw.isa);
  id v54 = [a1 evaluatePoseValues:v51 atTimestamp:a6];

LABEL_33:

  return v54;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_poseTargets, 0);
}

@end