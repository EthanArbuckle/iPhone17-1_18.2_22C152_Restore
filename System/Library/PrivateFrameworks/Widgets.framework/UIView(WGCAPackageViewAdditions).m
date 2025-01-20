@interface UIView(WGCAPackageViewAdditions)
- (BOOL)wg_imageContentsDrawWithinBounds;
- (BOOL)wg_supportsBottomCornerRadiusGivenRootView:()WGCAPackageViewAdditions withCornerRadius:supportedCorners:;
- (uint64_t)wg_walkSubviewTreeWithBlock:()WGCAPackageViewAdditions;
- (void)_wg_innerWalkSubviewTreeWithBlock:()WGCAPackageViewAdditions stop:;
@end

@implementation UIView(WGCAPackageViewAdditions)

- (void)_wg_innerWalkSubviewTreeWithBlock:()WGCAPackageViewAdditions stop:
{
  id v6 = a3;
  v7 = v6;
  if (!*a4)
  {
    char v13 = 1;
    char v8 = (*((uint64_t (**)(id, void *, char *))v6 + 2))(v6, a1, &v13);
    *a4 = v8;
    if ((v8 & 1) == 0)
    {
      if (v13)
      {
        v9 = [a1 subviews];
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __75__UIView_WGCAPackageViewAdditions___wg_innerWalkSubviewTreeWithBlock_stop___block_invoke;
        v10[3] = &unk_264677358;
        id v11 = v7;
        v12 = a4;
        [v9 enumerateObjectsUsingBlock:v10];
      }
    }
  }
}

- (uint64_t)wg_walkSubviewTreeWithBlock:()WGCAPackageViewAdditions
{
  char v4 = 0;
  return objc_msgSend(a1, "_wg_innerWalkSubviewTreeWithBlock:stop:", a3, &v4);
}

- (BOOL)wg_imageContentsDrawWithinBounds
{
  v2 = [a1 layer];
  if ([v2 isMemberOfClass:objc_opt_class()])
  {
    v3 = [a1 layer];
    char v4 = [v3 contents];

    if (v4 && (CFTypeID v5 = CFGetTypeID(v4), v5 == CGImageGetTypeID()))
    {
      [a1 bounds];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGImageGetWidth(v4);
      _WGMainScreenScale();
      CGImageGetHeight(v4);
      _WGMainScreenScale();
      BSRectWithSize();
      v21.origin.x = v14;
      v21.origin.y = v15;
      v21.size.width = v16;
      v21.size.height = v17;
      v20.origin.x = v7;
      v20.origin.y = v9;
      v20.size.width = v11;
      v20.size.height = v13;
      BOOL v18 = CGRectContainsRect(v20, v21);
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)wg_supportsBottomCornerRadiusGivenRootView:()WGCAPackageViewAdditions withCornerRadius:supportedCorners:
{
  id v6 = a3;
  CGFloat v7 = [v6 layer];
  double v8 = [v7 animationKeys];
  uint64_t v9 = [v8 count];

  if (v9) {
    goto LABEL_2;
  }
  [v6 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  _WGMainScreenScale();
  BSFloatRoundForScale();
  UIRectInset();
  double v68 = v20;
  double v69 = v19;
  double v67 = v21;
  CGFloat v65 = v22;
  v74.origin.x = v12;
  v74.origin.y = v14;
  v74.size.width = v16;
  v74.size.height = v18;
  CGRectGetMaxY(v74);
  CGFloat v70 = v12;
  UIRectInset();
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  v31 = [a1 superview];
  [a1 frame];
  objc_msgSend(v31, "convertRect:toView:", v6);
  CGFloat v72 = v33;
  CGFloat v73 = v32;
  CGFloat v35 = v34;
  CGFloat v71 = v36;

  if ([a1 clipsToBounds] & 1) != 0 || (objc_msgSend(a1, "wg_imageContentsDrawWithinBounds"))
  {
    v75.origin.x = v24;
    v75.origin.y = v26;
    v75.size.width = v28;
    v75.size.height = v30;
    CGFloat v38 = v72;
    CGFloat v37 = v73;
    v89.origin.x = v73;
    v89.origin.y = v35;
    v89.size.width = v72;
    CGFloat v39 = v71;
    v89.size.height = v71;
    if (!CGRectIntersectsRect(v75, v89)) {
      goto LABEL_28;
    }
  }
  else
  {
    CGFloat v38 = v72;
    CGFloat v37 = v73;
    CGFloat v39 = v71;
  }
  v76.origin.y = v14;
  v76.origin.x = v70;
  CGFloat rect = v14;
  v76.size.width = v16;
  v76.size.height = v18;
  double MaxY = CGRectGetMaxY(v76);
  v77.origin.x = v37;
  v77.origin.y = v35;
  v77.size.width = v38;
  v77.size.height = v39;
  if (vabdd_f64(MaxY, CGRectGetMaxY(v77)) > 2.22044605e-16) {
    goto LABEL_2;
  }
  v78.origin.x = v70;
  v78.origin.y = v14;
  v78.size.width = v16;
  v78.size.height = v18;
  double MinX = CGRectGetMinX(v78);
  v79.origin.x = v37;
  v79.origin.y = v35;
  v79.size.width = v38;
  v79.size.height = v39;
  CGFloat v63 = v18;
  CGFloat v64 = v16;
  if (vabdd_f64(MinX, CGRectGetMinX(v79)) <= 2.22044605e-16)
  {
    v85.origin.x = v70;
    v85.origin.y = v14;
    v85.size.width = v16;
    v85.size.height = v18;
    double MaxX = CGRectGetMaxX(v85);
    v86.origin.x = v37;
    v86.origin.y = v35;
    v86.size.width = v38;
    v86.size.height = v39;
    double v58 = vabdd_f64(MaxX, CGRectGetMaxX(v86));
    BOOL v42 = a4 != 0;
    CGFloat v44 = v68;
    CGFloat v43 = v69;
    CGFloat v46 = v67;
    CGFloat v45 = rect;
    if (a4 && v58 <= 2.22044605e-16)
    {
      uint64_t v56 = 12;
      goto LABEL_27;
    }
    if (v58 <= 2.22044605e-16) {
      goto LABEL_28;
    }
  }
  else
  {
    BOOL v42 = a4 != 0;
    CGFloat v44 = v68;
    CGFloat v43 = v69;
    CGFloat v45 = rect;
    CGFloat v46 = v67;
  }
  CGFloat v47 = v70;
  CGFloat v49 = v63;
  CGFloat v48 = v64;
  double v50 = CGRectGetMinX(*(CGRect *)(&v45 - 1));
  v80.origin.x = v73;
  v80.origin.y = v35;
  v80.size.width = v72;
  v80.size.height = v71;
  if (vabdd_f64(v50, CGRectGetMinX(v80)) <= 2.22044605e-16)
  {
    v87.origin.x = v73;
    v87.origin.y = v35;
    v87.size.width = v72;
    v87.size.height = v71;
    double v59 = CGRectGetMaxX(v87);
    v88.origin.x = v43;
    CGFloat v51 = v44;
    v88.origin.y = v44;
    v88.size.width = v46;
    v88.size.height = v65;
    double v60 = CGRectGetMaxX(v88);
    if (v59 <= v60 && v42)
    {
      uint64_t v56 = 4;
      goto LABEL_27;
    }
    if (v59 <= v60) {
      goto LABEL_28;
    }
  }
  else
  {
    CGFloat v51 = v44;
  }
  v81.origin.x = v43;
  v81.origin.y = v51;
  v81.size.width = v46;
  v81.size.height = v65;
  double v52 = CGRectGetMinX(v81);
  v82.origin.x = v73;
  v82.origin.y = v35;
  v82.size.width = v72;
  v82.size.height = v71;
  if (v52 > CGRectGetMinX(v82))
  {
LABEL_2:
    BOOL v10 = 0;
    goto LABEL_29;
  }
  v83.origin.x = v70;
  v83.origin.y = rect;
  v83.size.height = v63;
  v83.size.width = v64;
  double v53 = CGRectGetMaxX(v83);
  v84.origin.x = v73;
  v84.origin.y = v35;
  v84.size.width = v72;
  v84.size.height = v71;
  double v54 = vabdd_f64(v53, CGRectGetMaxX(v84));
  BOOL v10 = v54 <= 2.22044605e-16;
  if (v54 <= 2.22044605e-16 && v42)
  {
    uint64_t v56 = 8;
LABEL_27:
    *a4 = v56;
LABEL_28:
    BOOL v10 = 1;
  }
LABEL_29:

  return v10;
}

@end