@interface UIView(PUDisplayVelocity)
+ (void)_pu_animateView:()PUDisplayVelocity toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:;
+ (void)pu_animateView:()PUDisplayVelocity toCenter:bounds:transform:usingDefaultDampedSpringWithDelay:initialVelocity:options:completion:;
+ (void)pu_animateView:()PUDisplayVelocity toCenter:bounds:transform:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:completion:;
+ (void)pu_animateView:()PUDisplayVelocity toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:;
@end

@implementation UIView(PUDisplayVelocity)

+ (void)_pu_animateView:()PUDisplayVelocity toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v29 = a5;
  id v30 = a6;
  if (v28)
  {
    if (v29) {
      goto LABEL_3;
    }
  }
  else
  {
    v65 = [MEMORY[0x1E4F28B00] currentHandler];
    [v65 handleFailureInMethod:a2, a1, @"PUDisplayVelocity.m", 56, @"Invalid parameter not satisfying: %@", @"view != nil" object file lineNumber description];

    if (v29) {
      goto LABEL_3;
    }
  }
  v66 = [MEMORY[0x1E4F28B00] currentHandler];
  [v66 handleFailureInMethod:a2, a1, @"PUDisplayVelocity.m", 57, @"Invalid parameter not satisfying: %@", @"springAnimation != NULL" object file lineNumber description];

LABEL_3:
  [v28 center];
  double v32 = v31;
  double v34 = v33;
  [v28 bounds];
  CGFloat v69 = v36;
  CGFloat v70 = v35;
  CGFloat v67 = v38;
  CGFloat v68 = v37;
  memset(&v137, 0, sizeof(v137));
  if (v28) {
    [v28 transform];
  }
  v135[0] = 0;
  v135[1] = v135;
  v135[2] = 0x2020000000;
  char v136 = 1;
  v39 = dispatch_group_create();
  dispatch_group_enter(v39);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke;
  block[3] = &unk_1E5F2DB98;
  id v40 = v30;
  id v133 = v40;
  v134 = v135;
  dispatch_group_notify(v39, MEMORY[0x1E4F14428], block);
  if (a7 == v32)
  {
    a7 = v32;
    double v41 = a8;
  }
  else
  {
    dispatch_group_enter(v39);
    v128[0] = MEMORY[0x1E4F143A8];
    v128[1] = 3221225472;
    v128[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2;
    v128[3] = &unk_1E5F2A1D0;
    id v129 = v28;
    double v130 = a7;
    double v131 = v34;
    v125[0] = MEMORY[0x1E4F143A8];
    v125[1] = 3221225472;
    v125[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3;
    v125[3] = &unk_1E5F2C7A0;
    v127 = v135;
    v126 = v39;
    (*((void (**)(id, void *, void *, double))v29 + 2))(v29, v128, v125, a15 / (a7 - v32));

    double v41 = a8;
  }
  if (v41 != v34)
  {
    dispatch_group_enter(v39);
    v121[0] = MEMORY[0x1E4F143A8];
    v121[1] = 3221225472;
    v121[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4;
    v121[3] = &unk_1E5F2A1D0;
    id v122 = v28;
    double v123 = a7;
    double v124 = v41;
    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5;
    v118[3] = &unk_1E5F2C7A0;
    v120 = v135;
    v119 = v39;
    (*((void (**)(id, void *, void *, double))v29 + 2))(v29, v121, v118, a16 / (v41 - v34));
  }
  v140.origin.x = a9;
  v140.origin.y = a10;
  v140.size.width = a11;
  v140.size.height = a12;
  v145.origin.y = v69;
  v145.origin.x = v70;
  v145.size.height = v67;
  v145.size.width = v68;
  if (!CGRectEqualToRect(v140, v145))
  {
    v141.origin.x = a9;
    v141.origin.y = a10;
    v141.size.width = a11;
    v141.size.height = a12;
    double Width = CGRectGetWidth(v141);
    v142.origin.y = v69;
    v142.origin.x = v70;
    v142.size.height = v67;
    v142.size.width = v68;
    double v43 = CGRectGetWidth(v142);
    v143.origin.x = a9;
    v143.origin.y = a10;
    v143.size.width = a11;
    v143.size.height = a12;
    double Height = CGRectGetHeight(v143);
    v144.origin.y = v69;
    v144.origin.x = v70;
    v144.size.height = v67;
    v144.size.width = v68;
    double v45 = Height / CGRectGetHeight(v144);
    double v46 = 0.0;
    double v47 = 0.0;
    if (Width / v43 != 1.0) {
      double v47 = a17 / (Width / v43 + -1.0);
    }
    if (v45 != 1.0) {
      double v46 = a17 / (v45 + -1.0);
    }
    double v48 = (v47 + v46) * 0.5;
    dispatch_group_enter(v39);
    v112[0] = MEMORY[0x1E4F143A8];
    v112[1] = 3221225472;
    v112[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6;
    v112[3] = &unk_1E5F2E058;
    id v113 = v28;
    CGFloat v114 = a9;
    CGFloat v115 = a10;
    CGFloat v116 = a11;
    CGFloat v117 = a12;
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_7;
    v109[3] = &unk_1E5F2C7A0;
    v111 = v135;
    v110 = v39;
    (*((void (**)(id, void *, void *, double))v29 + 2))(v29, v112, v109, v48);
  }
  long long v49 = a4[1];
  *(_OWORD *)&t1.a = *a4;
  *(_OWORD *)&t1.c = v49;
  *(_OWORD *)&t1.tx = a4[2];
  CGAffineTransform t2 = v137;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    long long v50 = *MEMORY[0x1E4F1DAD8];
    double v106 = 0.0;
    double v104 = 0.0;
    double v105 = 0.0;
    long long v72 = v50;
    long long v107 = v50;
    CGAffineTransform t1 = v137;
    PUDecomposeTransform((uint64_t)&t1, &v107, &v106, &v105, &v104);
    long long v103 = v72;
    double v101 = 0.0;
    double v102 = 0.0;
    double v100 = 0.0;
    long long v51 = a4[1];
    *(_OWORD *)&t1.a = *a4;
    *(_OWORD *)&t1.c = v51;
    *(_OWORD *)&t1.tx = a4[2];
    PUDecomposeTransform((uint64_t)&t1, &v103, &v102, &v101, &v100);
    if (!PXFloatApproximatelyEqualToFloat() || (PXFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      v52 = PLUIGetLog();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        CGAffineTransform t1 = v137;
        NSStringFromCGAffineTransform(&t1);
        id v53 = (id)objc_claimAutoreleasedReturnValue();
        long long v54 = a4[1];
        *(_OWORD *)&t1.a = *a4;
        *(_OWORD *)&t1.c = v54;
        *(_OWORD *)&t1.tx = a4[2];
        v55 = NSStringFromCGAffineTransform(&t1);
        LODWORD(t2.a) = 138412546;
        *(void *)((char *)&t2.a + 4) = v53;
        WORD2(t2.b) = 2112;
        *(void *)((char *)&t2.b + 6) = v55;
        _os_log_impl(&dword_1AE9F8000, v52, OS_LOG_TYPE_DEFAULT, "animation of translational transforms is not supported (%@ => %@)", (uint8_t *)&t2, 0x16u);
      }
    }
    if (v102 != v106 || v101 != v105)
    {
      double v56 = v101 / v105;
      double v57 = 0.0;
      double v58 = 0.0;
      if (v102 / v106 != 1.0) {
        double v58 = a17 / (v102 / v106 + -1.0);
      }
      if (v56 != 1.0) {
        double v57 = a17 / (v56 + -1.0);
      }
      int v59 = PXFloatApproximatelyEqualToFloat();
      char v60 = v59;
      double v106 = v102;
      if (v59) {
        double v105 = v101;
      }
      dispatch_group_enter(v39);
      v94[0] = MEMORY[0x1E4F143A8];
      v94[1] = 3221225472;
      v94[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_19;
      v94[3] = &unk_1E5F24D18;
      id v61 = v28;
      id v95 = v61;
      long long v96 = v107;
      double v97 = v106;
      double v98 = v105;
      double v99 = v104;
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2_20;
      v91[3] = &unk_1E5F2C7A0;
      v93 = v135;
      v62 = v39;
      v92 = v62;
      (*((void (**)(id, void *, void *, double))v29 + 2))(v29, v94, v91, v58);
      if ((v60 & 1) == 0)
      {
        double v105 = v101;
        dispatch_group_enter(v62);
        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3_21;
        v85[3] = &unk_1E5F24D18;
        id v86 = v61;
        long long v87 = v107;
        double v88 = v106;
        double v89 = v105;
        double v90 = v104;
        v82[0] = MEMORY[0x1E4F143A8];
        v82[1] = 3221225472;
        v82[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4_22;
        v82[3] = &unk_1E5F2C7A0;
        v84 = v135;
        v83 = v62;
        (*((void (**)(id, void *, void *, double))v29 + 2))(v29, v85, v82, v57);
      }
    }
    if (v100 != v104)
    {
      double v63 = v100 - v104;
      double v104 = v100;
      double v64 = a18 / v63;
      dispatch_group_enter(v39);
      v76[0] = MEMORY[0x1E4F143A8];
      v76[1] = 3221225472;
      v76[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5_23;
      v76[3] = &unk_1E5F24D18;
      id v77 = v28;
      long long v78 = v107;
      double v79 = v106;
      double v80 = v105;
      double v81 = v104;
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __123__UIView_PUDisplayVelocity___pu_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6_24;
      v73[3] = &unk_1E5F2C7A0;
      v75 = v135;
      v74 = v39;
      (*((void (**)(id, void *, void *, double))v29 + 2))(v29, v76, v73, v64);
    }
  }
  dispatch_group_leave(v39);

  _Block_object_dispose(v135, 8);
}

+ (void)pu_animateView:()PUDisplayVelocity toCenter:bounds:transform:usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:completion:
{
  id v30 = a11;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __158__UIView_PUDisplayVelocity__pu_animateView_toCenter_bounds_transform_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_completion___block_invoke;
  v37[3] = &unk_1E5F24CF0;
  id v38 = v30;
  double v39 = a8;
  double v40 = a9;
  uint64_t v41 = a13;
  long long v42 = a17;
  uint64_t v43 = a18;
  long long v31 = a12[1];
  v36[0] = *a12;
  v36[1] = v31;
  v36[2] = a12[2];
  id v32 = v30;
  objc_msgSend(a1, "_pu_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", v32, v36, v37, a14, a2, a3, a4, a5, a6, a7, a19, a20, a21);
}

+ (void)pu_animateView:()PUDisplayVelocity toCenter:bounds:transform:usingDefaultDampedSpringWithDelay:initialVelocity:options:completion:
{
  id v28 = a10;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __139__UIView_PUDisplayVelocity__pu_animateView_toCenter_bounds_transform_usingDefaultDampedSpringWithDelay_initialVelocity_options_completion___block_invoke;
  v33[3] = &unk_1E5F24CC8;
  id v34 = v28;
  double v35 = a8;
  uint64_t v36 = a12;
  long long v29 = a11[1];
  v32[0] = *a11;
  v32[1] = v29;
  v32[2] = a11[2];
  id v30 = v28;
  objc_msgSend(a1, "_pu_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", v30, v32, v33, a13, a2, a3, a4, a5, a6, a7, a16, a17, a18);
}

+ (void)pu_animateView:()PUDisplayVelocity toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:
{
  id v29 = a11;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __147__UIView_PUDisplayVelocity__pu_animateView_toCenter_bounds_transform_withDuration_delay_usingSpringWithDamping_initialVelocity_options_completion___block_invoke;
  _OWORD v36[3] = &unk_1E5F24CA0;
  id v37 = v29;
  double v38 = a8;
  double v39 = a9;
  uint64_t v40 = a17;
  uint64_t v41 = a13;
  long long v30 = a12[1];
  v35[0] = *a12;
  v35[1] = v30;
  v35[2] = a12[2];
  id v31 = v29;
  objc_msgSend(a1, "_pu_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", v31, v35, v36, a14, a2, a3, a4, a5, a6, a7, a18, a19, a20);
}

@end