@interface UIView(PhotosUICore)
+ (id)px_circularGlyphViewWithName:()PhotosUICore prefersMulticolor:backgroundColor:;
+ (id)px_contentLoadingView;
+ (uint64_t)px_animateView:()PhotosUICore toCenter:bounds:transform:usingDefaultDampedSpringWithDelay:initialVelocity:options:completion:;
+ (uint64_t)px_animateView:()PhotosUICore toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:;
+ (uint64_t)px_circularGlyphViewWithName:()PhotosUICore backgroundColor:;
+ (void)_px_animateView:()PhotosUICore toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:;
+ (void)px_animateUsingDefaultDampedEaseInEaseOutWithDuration:()PhotosUICore animations:completion:;
- (BOOL)px_intersectsWindowBounds;
- (double)px_peripheryInsets;
- (id)px_ancestorViewOfClass:()PhotosUICore;
- (id)px_ancestorViewPassingTest:()PhotosUICore;
- (id)px_rootView;
- (uint64_t)px_convertTransform:()PhotosUICore toView:;
- (uint64_t)px_hasHiddenAncestor;
- (void)px_addFullBoundsSubview:()PhotosUICore;
- (void)px_convertTransform:()PhotosUICore fromView:;
- (void)px_transferToSuperview:()PhotosUICore;
@end

@implementation UIView(PhotosUICore)

- (double)px_peripheryInsets
{
  v2 = [a1 window];
  v3 = [v2 screen];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  }
  v6 = v5;

  if (objc_opt_respondsToSelector())
  {
    [v6 _peripheryInsets];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = *MEMORY[0x1E4FB2848];
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v14 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  [v6 bounds];
  double v49 = v8;
  double v16 = v10 + v15;
  double v18 = v8 + v17;
  double v20 = v19 - (v14 + v10);
  double v22 = v21 - (v12 + v8);
  v23 = [v6 coordinateSpace];
  objc_msgSend(v23, "convertRect:toCoordinateSpace:", a1, v16, v18, v20, v22);
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;

  [a1 bounds];
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  v50.origin.CGFloat x = v25;
  v50.origin.CGFloat y = v27;
  v50.size.CGFloat width = v29;
  v50.size.CGFloat height = v31;
  v57.origin.CGFloat x = v33;
  v57.origin.CGFloat y = v35;
  CGFloat v48 = v37;
  v57.size.CGFloat width = v37;
  v57.size.CGFloat height = v39;
  CGRect v51 = CGRectIntersection(v50, v57);
  CGFloat x = v51.origin.x;
  CGFloat y = v51.origin.y;
  CGFloat width = v51.size.width;
  CGFloat height = v51.size.height;
  CGRectGetMinX(v51);
  v52.origin.CGFloat x = v33;
  v52.origin.CGFloat y = v35;
  v52.size.CGFloat width = v37;
  v52.size.CGFloat height = v39;
  CGRectGetMaxX(v52);
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.CGFloat width = width;
  v53.size.CGFloat height = height;
  CGRectGetMaxX(v53);
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.CGFloat width = width;
  v54.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v54);
  v55.origin.CGFloat x = v33;
  v55.size.CGFloat width = v48;
  v55.origin.CGFloat y = v35;
  v55.size.CGFloat height = v39;
  CGRectGetMaxY(v55);
  v56.origin.CGFloat x = x;
  v56.origin.CGFloat y = y;
  v56.size.CGFloat width = width;
  v56.size.CGFloat height = height;
  CGRectGetMaxY(v56);
  double v45 = v49;
  if (MinY < v49) {
    double v45 = MinY;
  }
  double v46 = fmax(v45, 0.0);

  return v46;
}

- (void)px_transferToSuperview:()PhotosUICore
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = a1;
  v6 = [v5 superview];
  if (!v6) {
    PXAssertGetLog();
  }
  [v5 center];
  objc_msgSend(v4, "convertPoint:fromView:", v6);
  double v8 = v7;
  double v10 = v9;
  long long v19 = 0u;
  long long v20 = 0u;
  *(_OWORD *)buf = 0u;
  if (v5)
  {
    [v5 transform];
    if (v4)
    {
LABEL_4:
      objc_msgSend(v4, "px_convertTransform:fromView:", v17, v6);
      goto LABEL_8;
    }
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    if (v4) {
      goto LABEL_4;
    }
  }
  long long v19 = 0u;
  long long v20 = 0u;
  *(_OWORD *)buf = 0u;
LABEL_8:
  objc_msgSend(v5, "setCenter:", v8, v10);
  v16[0] = *(_OWORD *)buf;
  v16[1] = v19;
  v16[2] = v20;
  [v5 setTransform:v16];
  double v11 = [v4 layer];
  int v12 = [v11 flipsHorizontalAxis];

  if (v12)
  {
    double v13 = [v5 layer];
    uint64_t v14 = [v13 flipsHorizontalAxis] ^ 1;
    double v15 = [v5 layer];
    [v15 setFlipsHorizontalAxis:v14];
  }
  [v4 addSubview:v5];
}

- (uint64_t)px_convertTransform:()PhotosUICore toView:
{
  a4[1] = 0u;
  a4[2] = 0u;
  *a4 = 0u;
  if (a3)
  {
    long long v4 = a2[1];
    v5[0] = *a2;
    v5[1] = v4;
    v5[2] = a2[2];
    return objc_msgSend(a3, "px_convertTransform:fromView:", v5, result);
  }
  return result;
}

- (void)px_convertTransform:()PhotosUICore fromView:
{
  void (**v13)(void *__return_ptr);
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  CGAffineTransform v20;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v23;
  CGAffineTransform v24;
  void aBlock[4];
  id v26;
  CGAffineTransform buf;
  uint64_t v28;

  double v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double v8 = [a1 layer];
  double v9 = [v7 layer];
  double v10 = [v8 ancestorSharedWithLayer:v9];

  double v11 = [v10 delegate];
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      PXAssertGetLog();
    }
  }
  if (v11)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__UIView_PhotosUICore__px_convertTransform_fromView___block_invoke;
    aBlock[3] = &unk_1E5DD36C8;
    double v26 = v11;
    id v12 = v11;
    double v13 = (void (**)(void *__return_ptr))_Block_copy(aBlock);
    memset(&buf, 0, sizeof(buf));
    ((void (**)(CGAffineTransform *__return_ptr))v13)[2](&buf);
    memset(&v24, 0, sizeof(v24));
    ((void (*)(CGAffineTransform *__return_ptr, void (**)(void *__return_ptr), void *))v13[2])(&v23, v13, a1);
    CGAffineTransformInvert(&v24, &v23);
    uint64_t v14 = a2[1];
    *(_OWORD *)a4 = *a2;
    *(_OWORD *)(a4 + 16) = v14;
    double v16 = *a2;
    double v15 = a2[1];
    *(_OWORD *)(a4 + 32) = a2[2];
    t1 = buf;
    *(_OWORD *)&t2.a = v16;
    *(_OWORD *)&t2.c = v15;
    *(_OWORD *)&t2.tCGFloat x = a2[2];
    CGAffineTransformConcat((CGAffineTransform *)a4, &t1, &t2);
    t2 = v24;
    double v17 = *(_OWORD *)(a4 + 16);
    *(_OWORD *)&v20.a = *(_OWORD *)a4;
    *(_OWORD *)&v20.c = v17;
    *(_OWORD *)&v20.tCGFloat x = *(_OWORD *)(a4 + 32);
    CGAffineTransformConcat(&t1, &t2, &v20);
    double v18 = *(_OWORD *)&t1.c;
    *(_OWORD *)a4 = *(_OWORD *)&t1.a;
    *(_OWORD *)(a4 + 16) = v18;
    *(_OWORD *)(a4 + 32) = *(_OWORD *)&t1.tx;
  }
  else
  {
    long long v19 = a2[1];
    *(_OWORD *)a4 = *a2;
    *(_OWORD *)(a4 + 16) = v19;
    *(_OWORD *)(a4 + 32) = a2[2];
  }
}

- (id)px_ancestorViewPassingTest:()PhotosUICore
{
  id v4 = a1;
  if (v4)
  {
    do
    {
      if ((*(uint64_t (**)(uint64_t, id))(a3 + 16))(a3, v4)) {
        break;
      }
      uint64_t v5 = [v4 superview];

      id v4 = (id)v5;
    }
    while (v5);
  }
  return v4;
}

- (id)px_ancestorViewOfClass:()PhotosUICore
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__UIView_PhotosUICore__px_ancestorViewOfClass___block_invoke;
  _OWORD v5[3] = &__block_descriptor_40_e16_B16__0__UIView_8lu32l8;
  v5[4] = a3;
  v3 = objc_msgSend(a1, "px_ancestorViewPassingTest:", v5);
  return v3;
}

- (id)px_rootView
{
  v2 = [a1 window];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "px_ancestorViewPassingTest:", &__block_literal_global_302818);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v5 = v4;

  return v5;
}

- (uint64_t)px_hasHiddenAncestor
{
  id v1 = a1;
  if (v1)
  {
    v2 = v1;
    int v3 = 0;
    do
    {
      char v4 = [v2 isHidden];
      if (v4) {
        break;
      }
      objc_opt_class();
      v3 |= objc_opt_isKindOfClass();
      uint64_t v5 = [v2 superview];

      v2 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    LOBYTE(v3) = 0;
    char v4 = 0;
  }
  return v4 & 1 | ((v3 & 1) == 0);
}

- (void)px_addFullBoundsSubview:()PhotosUICore
{
  v19[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [a1 addSubview:v4];
  double v15 = (void *)MEMORY[0x1E4F28DC8];
  double v18 = [v4 topAnchor];
  double v17 = [a1 topAnchor];
  double v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  uint64_t v5 = [v4 leadingAnchor];
  v6 = [a1 leadingAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  v19[1] = v7;
  double v8 = [a1 trailingAnchor];
  double v9 = [v4 trailingAnchor];
  double v10 = [v8 constraintEqualToAnchor:v9];
  v19[2] = v10;
  double v11 = [a1 bottomAnchor];
  id v12 = [v4 bottomAnchor];

  double v13 = [v11 constraintEqualToAnchor:v12];
  v19[3] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4];
  [v15 activateConstraints:v14];
}

- (BOOL)px_intersectsWindowBounds
{
  v2 = [a1 window];
  if (v2)
  {
    [a1 frame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v11 = [a1 superview];
    objc_msgSend(v2, "convertRect:fromView:", v11, v4, v6, v8, v10);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    [v2 bounds];
    v27.origin.CGFloat x = v20;
    v27.origin.CGFloat y = v21;
    v27.size.CGFloat width = v22;
    v27.size.CGFloat height = v23;
    v26.origin.CGFloat x = v13;
    v26.origin.CGFloat y = v15;
    v26.size.CGFloat width = v17;
    v26.size.CGFloat height = v19;
    BOOL v24 = CGRectIntersectsRect(v26, v27);
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

+ (id)px_contentLoadingView
{
  v0 = [MEMORY[0x1E4FB1658] loadingConfiguration];
  id v1 = (void *)[objc_alloc(MEMORY[0x1E4FB1670]) initWithConfiguration:v0];

  return v1;
}

+ (id)px_circularGlyphViewWithName:()PhotosUICore prefersMulticolor:backgroundColor:
{
  id v7 = a3;
  id v8 = a5;
  double v9 = [MEMORY[0x1E4FB1830] configurationWithScale:3];
  if (a4)
  {
    double v10 = [MEMORY[0x1E4FB1830] configurationPreferringMulticolor];
    uint64_t v11 = [v9 configurationByApplyingConfiguration:v10];

    double v9 = (void *)v11;
  }
  double v12 = [MEMORY[0x1E4FB1818] systemImageNamed:v7];
  CGFloat v13 = [v12 imageByApplyingSymbolConfiguration:v9];

  [v13 size];
  double v15 = v14;
  double v17 = v16;
  id v18 = objc_alloc_init(MEMORY[0x1E4FB1838]);
  CGFloat v19 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [v18 setTintColor:v19];

  objc_msgSend(v18, "setFrame:", 0.0, 0.0, v15, v17);
  if ((a4 & 1) == 0)
  {
    CGFloat v20 = [MEMORY[0x1E4FB1618] clearColor];
    char v21 = [v8 isEqual:v20];

    if ((v21 & 1) == 0)
    {
      CGFloat v22 = [MEMORY[0x1E4FB1618] systemWhiteColor];
      uint64_t v23 = objc_msgSend(v13, "px_tintedCircularImageWithColor:backgroundColor:", v22, v8);

      CGFloat v13 = (void *)v23;
    }
  }
  [v18 setImage:v13];

  return v18;
}

+ (uint64_t)px_circularGlyphViewWithName:()PhotosUICore backgroundColor:
{
  return objc_msgSend(MEMORY[0x1E4FB1EB0], "px_circularGlyphViewWithName:prefersMulticolor:backgroundColor:", a3, 0, a4);
}

+ (void)px_animateUsingDefaultDampedEaseInEaseOutWithDuration:()PhotosUICore animations:completion:
{
  id v7 = a4;
  id v8 = a5;
  if (px_animateUsingDefaultDampedEaseInEaseOutWithDuration_animations_completion__onceToken != -1) {
    dispatch_once(&px_animateUsingDefaultDampedEaseInEaseOutWithDuration_animations_completion__onceToken, &__block_literal_global_28_302820);
  }
  id v9 = objc_alloc(MEMORY[0x1E4FB1ED8]);
  double v10 = (void *)[v9 initWithDuration:px_animateUsingDefaultDampedEaseInEaseOutWithDuration_animations_completion__timingParameters timingParameters:a1];
  uint64_t v11 = v10;
  if (v7) {
    [v10 addAnimations:v7];
  }
  if (v8)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __100__UIView_PhotosUICore__px_animateUsingDefaultDampedEaseInEaseOutWithDuration_animations_completion___block_invoke_2;
    v12[3] = &unk_1E5DD36A0;
    id v13 = v8;
    [v11 addCompletion:v12];
  }
  [v11 startAnimation];
}

+ (void)_px_animateView:()PhotosUICore toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v28 = a5;
  id v29 = a6;
  if (v27)
  {
    if (v28) {
      goto LABEL_3;
    }
  }
  else
  {
    double v49 = [MEMORY[0x1E4F28B00] currentHandler];
    [v49 handleFailureInMethod:a2, a1, @"UIView+PhotosUICore.m", 130, @"Invalid parameter not satisfying: %@", @"view != nil" object file lineNumber description];

    if (v28) {
      goto LABEL_3;
    }
  }
  CGRect v50 = [MEMORY[0x1E4F28B00] currentHandler];
  [v50 handleFailureInMethod:a2, a1, @"UIView+PhotosUICore.m", 131, @"Invalid parameter not satisfying: %@", @"springAnimation != NULL" object file lineNumber description];

LABEL_3:
  [v27 center];
  double v31 = v30;
  double v33 = v32;
  [v27 bounds];
  CGFloat v53 = v35;
  CGFloat v54 = v34;
  CGFloat v51 = v37;
  CGFloat v52 = v36;
  memset(&v85, 0, sizeof(v85));
  if (v27) {
    [v27 transform];
  }
  v83[0] = 0;
  v83[1] = v83;
  v83[2] = 0x2020000000;
  char v84 = 1;
  double v38 = dispatch_group_create();
  dispatch_group_enter(v38);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke;
  block[3] = &unk_1E5DD35B8;
  id v39 = v29;
  id v81 = v39;
  v82 = v83;
  dispatch_group_notify(v38, MEMORY[0x1E4F14428], block);
  if (a7 == v31)
  {
    a7 = v31;
    double v40 = a8;
  }
  else
  {
    dispatch_group_enter(v38);
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_2;
    v76[3] = &unk_1E5DD35E0;
    id v77 = v27;
    double v78 = a7;
    double v79 = v33;
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_3;
    v73[3] = &unk_1E5DD3608;
    v75 = v83;
    v74 = v38;
    (*((void (**)(id, void *, void *, double))v28 + 2))(v28, v76, v73, a15 / (a7 - v31));

    double v40 = a8;
  }
  if (v40 != v33)
  {
    dispatch_group_enter(v38);
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_4;
    v69[3] = &unk_1E5DD35E0;
    id v70 = v27;
    double v71 = a7;
    double v72 = v40;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_5;
    v66[3] = &unk_1E5DD3608;
    v68 = v83;
    v67 = v38;
    (*((void (**)(id, void *, void *, double))v28 + 2))(v28, v69, v66, a16 / (v40 - v33));
  }
  v88.origin.CGFloat x = a9;
  v88.origin.CGFloat y = a10;
  v88.size.CGFloat width = a11;
  v88.size.CGFloat height = a12;
  v93.origin.CGFloat y = v53;
  v93.origin.CGFloat x = v54;
  v93.size.CGFloat height = v51;
  v93.size.CGFloat width = v52;
  if (!CGRectEqualToRect(v88, v93))
  {
    v89.origin.CGFloat x = a9;
    v89.origin.CGFloat y = a10;
    v89.size.CGFloat width = a11;
    v89.size.CGFloat height = a12;
    double Width = CGRectGetWidth(v89);
    v90.origin.CGFloat y = v53;
    v90.origin.CGFloat x = v54;
    v90.size.CGFloat height = v51;
    v90.size.CGFloat width = v52;
    double v42 = CGRectGetWidth(v90);
    v91.origin.CGFloat x = a9;
    v91.origin.CGFloat y = a10;
    v91.size.CGFloat width = a11;
    v91.size.CGFloat height = a12;
    double Height = CGRectGetHeight(v91);
    v92.origin.CGFloat y = v53;
    v92.origin.CGFloat x = v54;
    v92.size.CGFloat height = v51;
    v92.size.CGFloat width = v52;
    double v44 = Height / CGRectGetHeight(v92);
    double v45 = 0.0;
    double v46 = 0.0;
    if (Width / v42 != 1.0) {
      double v46 = a17 / (Width / v42 + -1.0);
    }
    if (v44 != 1.0) {
      double v45 = a17 / (v44 + -1.0);
    }
    double v47 = (v46 + v45) * 0.5;
    dispatch_group_enter(v38);
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_6;
    v60[3] = &unk_1E5DD3630;
    id v61 = v27;
    CGFloat v62 = a9;
    CGFloat v63 = a10;
    CGFloat v64 = a11;
    CGFloat v65 = a12;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __118__UIView_PhotosUICore___px_animateView_toCenter_bounds_transform_withInitialVelocity_usingSpringAnimation_completion___block_invoke_7;
    v57[3] = &unk_1E5DD3608;
    v59 = v83;
    v58 = v38;
    (*((void (**)(id, void *, void *, double))v28 + 2))(v28, v60, v57, v47);
  }
  long long v48 = a4[1];
  *(_OWORD *)&t1.a = *a4;
  *(_OWORD *)&t1.c = v48;
  *(_OWORD *)&t1.tCGFloat x = a4[2];
  CGAffineTransform t2 = v85;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    CGAffineTransform t1 = v85;
    PXAffineTransformDecomposeTranslationScaleRotation();
  }
  dispatch_group_leave(v38);

  _Block_object_dispose(v83, 8);
}

+ (uint64_t)px_animateView:()PhotosUICore toCenter:bounds:transform:usingDefaultDampedSpringWithDelay:initialVelocity:options:completion:
{
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __134__UIView_PhotosUICore__px_animateView_toCenter_bounds_transform_usingDefaultDampedSpringWithDelay_initialVelocity_options_completion___block_invoke;
  v21[3] = &__block_descriptor_48_e27_v32__0d8___v___16___v__B_24l;
  *(double *)&v21[4] = a8;
  v21[5] = a12;
  long long v18 = a11[1];
  v20[0] = *a11;
  v20[1] = v18;
  v20[2] = a11[2];
  return objc_msgSend(a1, "_px_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", a10, v20, v21, a16, a17, a18);
}

+ (uint64_t)px_animateView:()PhotosUICore toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:
{
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __142__UIView_PhotosUICore__px_animateView_toCenter_bounds_transform_withDuration_delay_usingSpringWithDamping_initialVelocity_options_completion___block_invoke;
  v23[3] = &__block_descriptor_64_e27_v32__0d8___v___16___v__B_24l;
  *(double *)&v23[4] = a8;
  *(double *)&v23[5] = a9;
  v23[6] = a17;
  v23[7] = a13;
  long long v20 = a12[1];
  v22[0] = *a12;
  v22[1] = v20;
  v22[2] = a12[2];
  return objc_msgSend(a1, "_px_animateView:toCenter:bounds:transform:withInitialVelocity:usingSpringAnimation:completion:", a11, v22, v23, a18, a19, a20);
}

@end