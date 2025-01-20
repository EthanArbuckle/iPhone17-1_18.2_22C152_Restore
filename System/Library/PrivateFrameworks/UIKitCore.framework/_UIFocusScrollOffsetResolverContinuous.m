@interface _UIFocusScrollOffsetResolverContinuous
- (CGPoint)contentOffsetForScrollRequest:(id)a3;
- (unint64_t)scrollOffsetResolverType;
@end

@implementation _UIFocusScrollOffsetResolverContinuous

- (unint64_t)scrollOffsetResolverType
{
  return 0;
}

- (CGPoint)contentOffsetForScrollRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 environmentScrollableContainer];
  v5 = [v4 scrollableContainer];

  v6 = [v3 focusItemInfo];
  [v3 focusItemFrame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat rect_24 = v11;
  CGFloat rect_16 = v12;
  v13 = [v3 focusMovement];
  [v13 heading];

  [v3 originatingContentOffset];
  double v115 = v14;
  double v116 = v15;
  int CanScrollX = _UIFocusItemScrollableContainerCanScrollX(v5);
  int CanScrollY = _UIFocusItemScrollableContainerCanScrollY(v5);
  [v3 targetContentOffset];
  double v128 = v18;
  double v20 = v19;
  [v3 originatingBounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  if ((_IsKindOfUIView((uint64_t)v5) & 1) != 0
    || (char v29 = objc_opt_respondsToSelector(), v30 = 0.0, v123 = 0.0, v31 = 0.0, v32 = 0.0, (v29 & 1) != 0))
  {
    [v5 safeAreaInsets];
    double v31 = v33;
    double v123 = v34;
  }
  double v117 = v32;
  double v120 = v30;
  int v35 = dyld_program_sdk_at_least();
  double v36 = 90.0;
  if (v35) {
    double v36 = 80.0;
  }
  double v124 = v36;
  double v127 = v20;
  double v122 = v31;
  if (objc_msgSend(v5, "__isKindOfUIScrollView"))
  {
    [v5 _effectiveContentInset];
    double v22 = v22 + v37;
    double v24 = v24 + v38;
    double v26 = v26 - (v37 + v39);
    double v28 = v28 - (v38 + v40);
  }
  v134.origin.double x = v22;
  v134.origin.double y = v24;
  v134.size.double width = v26;
  v134.size.height = v28;
  double Height = CGRectGetHeight(v134);
  CGFloat rect = v8;
  v135.origin.double x = v8;
  v135.origin.double y = v10;
  v135.size.double width = rect_24;
  v135.size.height = rect_16;
  double v119 = CGRectGetHeight(v135);
  if (!CanScrollX
    || (v136.origin.double x = v22,
        v136.origin.double y = v24,
        v136.size.double width = v26,
        v136.size.height = v28,
        double v42 = v124,
        CGRectGetWidth(v136) < v42 + v42))
  {
    double v42 = 0.0;
  }
  CGFloat rect_8 = v10;
  if (!CanScrollY
    || (v137.origin.double x = v22,
        v137.origin.double y = v24,
        v137.size.double width = v26,
        v137.size.height = v28,
        CGFloat v43 = CGRectGetHeight(v137),
        double v44 = Height * 0.25,
        v43 < Height * 0.25 + Height * 0.25))
  {
    double v44 = 0.0;
  }
  double v118 = Height * 0.25;
  v138.origin.double x = v22;
  v138.origin.double y = v24;
  v138.size.double width = v26;
  v138.size.height = v28;
  CGRect v139 = CGRectInset(v138, v42, v44);
  double x = v139.origin.x;
  double y = v139.origin.y;
  double width = v139.size.width;
  double v48 = v139.size.height;
  double v49 = _UIFocusItemScrollableContainerScrollableAreaInsets(v5);
  double v53 = width - v50 - v52;
  if (v53 >= 0.0) {
    double v54 = 0.0;
  }
  else {
    double v54 = v53 * 0.5;
  }
  double v55 = v48 - v49 - v51;
  if (v55 >= 0.0) {
    double v56 = 0.0;
  }
  else {
    double v56 = v55 * 0.5;
  }
  double v57 = x + v50;
  double v58 = y + v49;
  v59 = [v6 item];

  if (v59)
  {
    v59 = [v3 environmentScrollableContainer];
    v60 = [v6 item];
    v61 = _UIFocusItemScrollableContainerScrollBoundaryMetricsForItem(v59, v60);

    int v62 = [v61 isMinX];
    int v63 = [v61 isMaxX];
    LODWORD(v59) = [v61 isMinY];
    int v64 = [v61 isMaxY];
  }
  else
  {
    int v64 = 0;
    int v63 = 0;
    int v62 = 0;
  }
  double v65 = fmax(v53, 0.0);
  double v66 = fmax(v55, 0.0);
  double v125 = v58 + v56;
  double v126 = v57 + v54;
  double v67 = _UIFocusItemScrollableContainerMinimumContentOffset(v5);
  double v69 = v68;
  double v70 = _UIFocusItemScrollableContainerMaximumContentOffset(v5);
  double v121 = v71;
  CGFloat v72 = rect_8;
  double v73 = v128;
  if (CanScrollX)
  {
    double v74 = v70;
    v140.origin.double x = v126;
    v140.origin.double y = v125;
    v140.size.double width = v65;
    v140.size.height = v66;
    double MinX = CGRectGetMinX(v140);
    v141.origin.double x = v126;
    v141.origin.double y = v125;
    v141.size.double width = v65;
    v141.size.height = v66;
    double MaxX = CGRectGetMaxX(v141);
    v142.origin.double y = rect_8;
    v142.origin.double x = rect;
    v142.size.double width = rect_24;
    v142.size.height = rect_16;
    double v77 = CGRectGetMinX(v142);
    v143.origin.double x = rect;
    v143.origin.double y = rect_8;
    v143.size.double width = rect_24;
    v143.size.height = rect_16;
    double v78 = CGRectGetMaxX(v143);
    double v79 = v78 - v77;
    double v80 = MaxX - MinX;
    double v81 = v128 + v78 - MaxX;
    if (v78 <= MaxX) {
      double v81 = v128;
    }
    if (v77 < MinX) {
      double v81 = v128 - (MinX - v77);
    }
    double v82 = MinX + MaxX;
    CGFloat v72 = rect_8;
    double v83 = v128 - (v82 * 0.5 - (v77 + v78) * 0.5);
    if (v79 < v80) {
      double v83 = v81;
    }
    if ((v63 & v62) != 0) {
      double v84 = v83;
    }
    else {
      double v84 = v67;
    }
    if (v63) {
      double v83 = v74;
    }
    if (v62) {
      double v83 = v84;
    }
    if (v83 < v67) {
      double v83 = v67;
    }
    double v73 = v83 <= v74 ? v83 : v74;
    v144.origin.double x = rect;
    v144.origin.double y = rect_8;
    v144.size.double width = rect_24;
    v144.size.height = rect_16;
    double v85 = CGRectGetMinX(v144);
    v145.origin.double x = rect;
    v145.origin.double y = rect_8;
    v145.size.double width = rect_24;
    v145.size.height = rect_16;
    double v86 = CGRectGetMaxX(v145);
    if (v85 < v73 || ([v5 visibleSize], v86 > v73 + v87))
    {
      [v5 visibleSize];
      double v89 = v88;
      v146.origin.double x = rect;
      v146.origin.double y = rect_8;
      v146.size.double width = rect_24;
      v146.size.height = rect_16;
      double v90 = v89 - CGRectGetWidth(v146);
      if (v90 <= v123 + v117 + v124)
      {
        if (v90 >= 0.0)
        {
          double v73 = v85 + v90 * 0.5 - v117;
          goto LABEL_52;
        }
        double v91 = v85 - v117;
        [v5 visibleSize];
        double v93 = v86 - v94;
      }
      else
      {
        double v91 = v85 - v124 - v117;
        [v5 visibleSize];
        double v93 = v124 + v86 - v92;
      }
      double v95 = v123 + v93;
      if (vabdd_f64(v91, v115) >= vabdd_f64(v95, v115)) {
        double v73 = v95;
      }
      else {
        double v73 = v91;
      }
    }
  }
LABEL_52:
  if (!CanScrollY)
  {
    double v101 = v127;
    if (!v6) {
      goto LABEL_82;
    }
    goto LABEL_81;
  }
  v147.origin.double x = v126;
  v147.origin.double y = v125;
  v147.size.double width = v65;
  v147.size.height = v66;
  double MinY = CGRectGetMinY(v147);
  v148.origin.double x = v126;
  v148.origin.double y = v125;
  v148.size.double width = v65;
  v148.size.height = v66;
  double MaxY = CGRectGetMaxY(v148);
  v149.origin.double x = rect;
  v149.origin.double y = v72;
  v149.size.double width = rect_24;
  v149.size.height = rect_16;
  double MidY = CGRectGetMidY(v149);
  if (MidY >= MinY)
  {
    double v99 = v127;
    double v100 = v122;
    if (MidY > MaxY) {
      double v99 = v127 + MidY - MaxY;
    }
  }
  else
  {
    double v99 = v127 - (MinY - MidY);
    double v100 = v122;
  }
  if ((v64 & v59) != 0) {
    double v102 = v99;
  }
  else {
    double v102 = v69;
  }
  if (v64) {
    double v99 = v121;
  }
  if (!v59) {
    double v102 = v99;
  }
  if (v102 < v69) {
    double v102 = v69;
  }
  if (v102 <= v121) {
    double v101 = v102;
  }
  else {
    double v101 = v121;
  }
  v150.origin.double x = rect;
  v150.origin.double y = v72;
  v150.size.double width = rect_24;
  v150.size.height = rect_16;
  double v103 = CGRectGetMinY(v150);
  v151.origin.double x = rect;
  v151.origin.double y = v72;
  v151.size.double width = rect_24;
  v151.size.height = rect_16;
  double v104 = CGRectGetMaxY(v151);
  if (v103 < v101 || ([v5 visibleSize], v104 > v101 + v105 - v100))
  {
    double v106 = fmax(v118 - v119, 0.0);
    [v5 visibleSize];
    double v108 = v107;
    v152.origin.double x = rect;
    v152.origin.double y = v72;
    v152.size.double width = rect_24;
    v152.size.height = rect_16;
    double v109 = v108 - CGRectGetHeight(v152);
    if (v109 <= v100 + v120 + v106)
    {
      if (v109 >= 0.0)
      {
        double v101 = v103 + v109 * 0.5 - v120;
        if (!v6) {
          goto LABEL_82;
        }
        goto LABEL_81;
      }
      double v110 = v103 - v120;
    }
    else
    {
      double v110 = v103 - v106 - v120;
      double v104 = v106 + v104;
    }
    [v5 visibleSize];
    if (vabdd_f64(v110, v116) >= vabdd_f64(v100 + v104 - v111, v116)) {
      double v101 = v100 + v104 - v111;
    }
    else {
      double v101 = v110;
    }
  }
  if (v6)
  {
LABEL_81:
    double v73 = _UIFocusItemScrollableContainerAdjustedContentOffsetToShowFocusItem(v5, v6, v73, v101);
    double v101 = v112;
  }
LABEL_82:

  double v113 = v73;
  double v114 = v101;
  result.double y = v114;
  result.double x = v113;
  return result;
}

@end