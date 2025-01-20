@interface _UIAutoScrollerItemBehavior
- ($9F891FA3B7BC1BE651A10F4EEBEFFC62)offsetForAutoScroller:(SEL)a3 timeDelta:(id)a4;
@end

@implementation _UIAutoScrollerItemBehavior

- ($9F891FA3B7BC1BE651A10F4EEBEFFC62)offsetForAutoScroller:(SEL)a3 timeDelta:(id)a4
{
  retstr->var0.CGFloat x = 0.0;
  retstr->var0.CGFloat y = 0.0;
  retstr->var1 = 0;
  id v6 = a4;
  [v6 point];
  double v8 = v7;
  double v10 = v9;
  [v6 touchInsets];
  double v108 = v10 + v11;
  rect.origin.CGFloat x = v8 + v12;
  double v14 = 0.0 - (v12 + v13);
  CGFloat v16 = 0.0 - (v11 + v15);
  v17 = [v6 scrollView];
  uint64_t v18 = [v6 allowedDirections];

  [v17 adjustedContentInset];
  double v20 = fmax(v19, 0.0);
  double v22 = fmax(v21, 0.0);
  double v24 = fmax(v23, 0.0);
  double v26 = fmax(v25, 0.0);
  [v17 bounds];
  double v28 = v22 + v27;
  double v30 = v20 + v29;
  double v100 = v22;
  double v101 = v20;
  double v98 = v26;
  double v99 = v24;
  double v32 = v31 - (v22 + v26);
  double v33 = v20 + v24;
  double v34 = v14;
  double v36 = v35 - v33;
  [v17 contentSize];
  double v106 = v37;
  double v107 = v38;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UIAutoScrollerItemBehavior_offsetForAutoScroller_timeDelta___block_invoke;
  aBlock[3] = &__block_descriptor_40_e73_B72__0_CGRect__CGPoint_dd__CGSize_dd__8_CGRect__CGPoint_dd__CGSize_dd__40l;
  aBlock[4] = v18;
  v39 = (unsigned int (**)(void, double, double, double, double, double, double, double, double))_Block_copy(aBlock);
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = __63___UIAutoScrollerItemBehavior_offsetForAutoScroller_timeDelta___block_invoke_2;
  v116[3] = &__block_descriptor_40_e73_B72__0_CGRect__CGPoint_dd__CGSize_dd__8_CGRect__CGPoint_dd__CGSize_dd__40l;
  v116[4] = v18;
  v40 = (unsigned int (**)(void, double, double, double, double, double, double, double, double))_Block_copy(v116);
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __63___UIAutoScrollerItemBehavior_offsetForAutoScroller_timeDelta___block_invoke_3;
  v115[3] = &__block_descriptor_40_e73_B72__0_CGRect__CGPoint_dd__CGSize_dd__8_CGRect__CGPoint_dd__CGSize_dd__40l;
  v115[4] = v18;
  v41 = (unsigned int (**)(void, double, double, double, __n128, double, double, double, double))_Block_copy(v115);
  *(void *)&rect.size.width = MEMORY[0x1E4F143A8];
  *(void *)&rect.size.height = 3221225472;
  CGFloat v42 = v108;
  v112 = __63___UIAutoScrollerItemBehavior_offsetForAutoScroller_timeDelta___block_invoke_4;
  v113 = &__block_descriptor_40_e73_B72__0_CGRect__CGPoint_dd__CGSize_dd__8_CGRect__CGPoint_dd__CGSize_dd__40l;
  uint64_t v114 = v18;
  v43 = (unsigned int (**)(void, double, double, double, double, double, double, double, double))_Block_copy(&rect.size);
  rect.origin.CGFloat y = v16;
  double v44 = v16;
  double v45 = v30;
  double v46 = v28;
  CGFloat v105 = v14;
  if (v39[2](v39, rect.origin.x, v108, v14, v44, v28, v45, v32, v36))
  {
    v118.origin.CGFloat x = v28;
    v118.origin.CGFloat y = v45;
    v118.size.width = v32;
    v118.size.height = v36;
    if (CGRectGetMaxY(v118) < v107)
    {
      retstr->var1 |= 0x10uLL;
      v119.origin.CGFloat x = rect.origin.x;
      v119.origin.CGFloat y = v108;
      v119.size.width = v14;
      CGFloat v47 = v45;
      CGFloat y = rect.origin.y;
      v119.size.height = rect.origin.y;
      double MaxY = CGRectGetMaxY(v119);
      double v103 = v46;
      v120.origin.CGFloat x = v46;
      CGFloat v50 = v47;
      v120.origin.CGFloat y = v47;
      v120.size.width = v32;
      v120.size.height = v36;
      double v51 = MaxY - CGRectGetMaxY(v120);
      if (v51 <= 40.0) {
        double v53 = v51;
      }
      else {
        double v53 = 40.0;
      }
      if (v53 > 0.0)
      {
        v121.origin.CGFloat x = rect.origin.x;
        v121.origin.CGFloat y = v108;
        double v34 = v14;
        v121.size.width = v14;
        v121.size.height = rect.origin.y;
        CGFloat Height = CGRectGetHeight(v121);
        double v55 = floor(v53 / (Height * 0.5) * (v53 / (Height * 0.5) * 1080.0) + 120.0);
LABEL_16:
        v52.n128_f64[0] = y;
        double v45 = v50;
        double v46 = v103;
        goto LABEL_17;
      }
      *(double *)&unint64_t v64 = 120.0;
      goto LABEL_15;
    }
  }
  if (v40[2](v40, rect.origin.x, v108, v14, rect.origin.y, v28, v45, v32, v36))
  {
    v122.origin.CGFloat x = v28;
    v122.origin.CGFloat y = v45;
    v122.size.width = v32;
    v122.size.height = v36;
    CGFloat MinY = CGRectGetMinY(v122);
    v52.n128_u64[0] = *(void *)&rect.origin.y;
    double v55 = 0.0;
    if (MinY > 0.0)
    {
      retstr->var1 |= 8uLL;
      CGFloat x = rect.origin.x;
      double v58 = v108;
      double v59 = v14;
      CGFloat v60 = v45;
      CGFloat y = rect.origin.y;
      double v61 = CGRectGetMinY(*(CGRect *)((char *)&v52 - 24));
      double v103 = v46;
      v123.origin.CGFloat x = v46;
      CGFloat v50 = v60;
      v123.origin.CGFloat y = v60;
      v123.size.width = v32;
      v123.size.height = v36;
      double v62 = fmax(v61 - CGRectGetMinY(v123), -40.0);
      if (v62 < 0.0)
      {
        v124.origin.CGFloat x = rect.origin.x;
        v124.origin.CGFloat y = v108;
        double v34 = v14;
        v124.size.width = v14;
        v124.size.height = rect.origin.y;
        CGFloat v63 = CGRectGetHeight(v124);
        double v55 = -floor(v62 / (v63 * 0.5) * (v62 / (v63 * 0.5) * 1080.0) + 120.0);
        goto LABEL_16;
      }
      *(double *)&unint64_t v64 = -120.0;
LABEL_15:
      double v55 = *(double *)&v64;
      double v34 = v14;
      goto LABEL_16;
    }
  }
  else
  {
    v52.n128_u64[0] = *(void *)&rect.origin.y;
    double v55 = 0.0;
  }
LABEL_17:
  if (v41[2](v41, rect.origin.x, v108, v34, v52, v46, v45, v32, v36))
  {
    v125.origin.CGFloat x = v46;
    v125.origin.CGFloat y = v45;
    v125.size.width = v32;
    v125.size.height = v36;
    if (CGRectGetMaxX(v125) < v106)
    {
      double v109 = v55;
      retstr->var1 |= 4uLL;
      v126.origin.CGFloat x = rect.origin.x;
      v126.origin.CGFloat y = v42;
      v126.size.width = v34;
      v126.size.height = rect.origin.y;
      double MaxX = CGRectGetMaxX(v126);
      double v104 = v46;
      v127.origin.CGFloat x = v46;
      double v66 = v45;
      v127.origin.CGFloat y = v45;
      v127.size.width = v32;
      v127.size.height = v36;
      double v67 = MaxX - CGRectGetMaxX(v127);
      CGFloat v68 = v42;
      if (v67 <= 40.0) {
        double v69 = v67;
      }
      else {
        double v69 = 40.0;
      }
      if (v69 > 0.0)
      {
        CGFloat v70 = rect.origin.x;
        double v71 = v14;
        CGFloat v72 = rect.origin.y;
        CGFloat Width = CGRectGetWidth(*(CGRect *)(&v68 - 1));
        double v74 = floor(v69 / (Width * 0.5) * (v69 / (Width * 0.5) * 1080.0) + 120.0);
LABEL_28:
        double v45 = v66;
        double v46 = v104;
        double v55 = v109;
        goto LABEL_29;
      }
      *(double *)&unint64_t v79 = 120.0;
      goto LABEL_34;
    }
  }
  CGFloat v75 = v108;
  double v74 = 0.0;
  if (v43[2](v43, rect.origin.x, v108, v34, rect.origin.y, v46, v45, v32, v36))
  {
    v128.origin.CGFloat x = v46;
    v128.origin.CGFloat y = v45;
    v128.size.width = v32;
    v128.size.height = v36;
    if (CGRectGetMinX(v128) > 0.0)
    {
      double v109 = v55;
      retstr->var1 |= 2uLL;
      v129.origin.CGFloat x = rect.origin.x;
      v129.origin.CGFloat y = v75;
      v129.size.width = v105;
      v129.size.height = rect.origin.y;
      double MinX = CGRectGetMinX(v129);
      double v104 = v46;
      v130.origin.CGFloat x = v46;
      double v66 = v45;
      v130.origin.CGFloat y = v45;
      v130.size.width = v32;
      v130.size.height = v36;
      double v77 = fmax(MinX - CGRectGetMinX(v130), -40.0);
      if (v77 < 0.0)
      {
        v131.origin.CGFloat x = rect.origin.x;
        v131.origin.CGFloat y = v75;
        v131.size.width = v105;
        v131.size.height = rect.origin.y;
        CGFloat v78 = CGRectGetWidth(v131);
        double v74 = -floor(v77 / (v78 * 0.5) * (v77 / (v78 * 0.5) * 1080.0) + 120.0);
        goto LABEL_28;
      }
      *(double *)&unint64_t v79 = -120.0;
LABEL_34:
      double v74 = *(double *)&v79;
      double v45 = v66;
      double v46 = v104;
      double v55 = v109;
      goto LABEL_35;
    }
  }
LABEL_29:
  if (v55 == 0.0 && v74 == 0.0)
  {
    retstr->var1 = 1;
    goto LABEL_61;
  }
LABEL_35:
  int v80 = [v17 isPagingEnabled];
  [v17 contentOffset];
  double v83 = v82;
  double v84 = v81;
  if (v80)
  {
    rect.origin.CGFloat y = v81;
    [v17 contentSize];
    double v110 = v85;
    rect.origin.CGFloat x = v86;
    v132.origin.CGFloat x = v46;
    v132.origin.CGFloat y = v45;
    v132.size.width = v32;
    v132.size.height = v36;
    double v87 = CGRectGetWidth(v132);
    v133.origin.CGFloat x = v46;
    v133.origin.CGFloat y = v45;
    v133.size.width = v32;
    v133.size.height = v36;
    double v88 = CGRectGetHeight(v133);
    if (v74 <= 0.0)
    {
      double v89 = 0.0;
      if (v74 < 0.0)
      {
        if (v83 - v87 >= 0.0) {
          double v89 = -v87;
        }
        else {
          double v89 = -v83;
        }
      }
    }
    else
    {
      double v89 = v87;
      if (v83 + v87 + v87 > v110) {
        double v89 = v110 - v87 - v83;
      }
    }
    if (v55 <= 0.0)
    {
      double v96 = 0.0;
      double v95 = rect.origin.y;
      if (v55 < 0.0)
      {
        if (rect.origin.y - v88 >= v101) {
          double v96 = -v88;
        }
        else {
          double v96 = -rect.origin.y - v101;
        }
      }
    }
    else
    {
      double v95 = rect.origin.y;
      double v96 = v88;
      if (rect.origin.y + v88 + v88 > rect.origin.x) {
        double v96 = rect.origin.x - v88 - rect.origin.y;
      }
    }
    retstr->var0.CGFloat x = v83 + v89;
    retstr->var0.CGFloat y = v95 + v96;
  }
  else
  {
    v134.origin.CGFloat x = v46;
    v134.origin.CGFloat y = v45;
    v134.size.width = v32;
    v134.size.height = v36;
    if (v107 > CGRectGetHeight(v134))
    {
      double v90 = v55 * a5 + v84;
      double v84 = -v101;
      v135.origin.CGFloat x = v46;
      v135.origin.CGFloat y = v45;
      v135.size.width = v32;
      v135.size.height = v36;
      double v91 = v101 + v99 + v107 - CGRectGetHeight(v135);
      if (v90 <= v91) {
        double v91 = v90;
      }
      if (v90 >= v84) {
        double v84 = v91;
      }
    }
    v136.origin.CGFloat x = v46;
    v136.origin.CGFloat y = v45;
    v136.size.width = v32;
    v136.size.height = v36;
    if (v106 > CGRectGetWidth(v136))
    {
      double v92 = v74 * a5 + v83;
      double v83 = -v100;
      v137.origin.CGFloat x = v46;
      v137.origin.CGFloat y = v45;
      v137.size.width = v32;
      v137.size.height = v36;
      double v93 = CGRectGetWidth(v137);
      if (v92 >= -v100)
      {
        double v94 = v98 + v100 + v106 - v93;
        double v83 = v92;
        if (v92 > v94) {
          double v83 = v94;
        }
      }
    }
    retstr->var0.CGFloat x = v83;
    retstr->var0.CGFloat y = v84;
  }
LABEL_61:

  return result;
}

@end