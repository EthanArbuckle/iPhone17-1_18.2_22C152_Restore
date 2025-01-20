@interface TUISmartGridOverlapWithOffsetsLayoutManager
+ (void)configureContentLayout:(id)a3 configuration:(id)a4;
+ (void)configureScrollLayout:(id)a3 configuration:(id)a4;
- (CGSize)contentLayoutSize;
- (CGSize)layoutSize;
- (CGSize)scrollLayoutSizeWithSize:(CGSize)a3;
- (TUISmartGridContentBox)content;
- (TUISmartGridLayoutConfiguration)configuration;
- (TUISmartGridOverlapWithOffsetsLayoutManager)initWithContent:(id)a3;
- (double)computedColumnSpacing;
- (double)computedColumnWidth;
- (double)widthForColumnSpan:(unint64_t)a3;
- (unint64_t)computedColumns;
- (unint64_t)ruleLayoutAxis;
- (void)layoutContent:(id)a3;
- (void)positionContainerLayout:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation TUISmartGridOverlapWithOffsetsLayoutManager

- (TUISmartGridOverlapWithOffsetsLayoutManager)initWithContent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUISmartGridOverlapWithOffsetsLayoutManager;
  v6 = [(TUISmartGridOverlapWithOffsetsLayoutManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_content, a3);
  }

  return v7;
}

- (unint64_t)ruleLayoutAxis
{
  return 0;
}

+ (void)configureScrollLayout:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [v5 width];
  [v6 setContainingWidth:];
  [v6 setContainingHeight:NAN];
}

+ (void)configureContentLayout:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [v5 width];
  [v6 setContainingWidth:];
}

- (void)layoutContent:(id)a3
{
  id v4 = a3;
  id v5 = (char *)[v4 computedLayoutDirection];
  id v6 = [v4 children];
  sub_64720((uint64_t)&v118, v6, self->_content, 0);

  v7 = v118;
  if (v118 == v119)
  {
    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v10 = *(void *)v7;
      uint64_t v9 = *((void *)v7 + 1);
      v7 += 88;
      v8 -= 0x5555555555555555 * ((v9 - v10) >> 5);
    }
    while (v7 != v119);
  }
  [(TUISmartGridLayoutConfiguration *)self->_configuration contentInsets];
  double v115 = v11;
  double v13 = v12;
  double v15 = v14;
  [(TUISmartGridLayoutConfiguration *)self->_configuration width];
  double v17 = v16;
  v114 = self;
  v18 = [(TUISmartGridLayoutConfiguration *)self->_configuration additionalConfiguration];
  uint64_t v19 = objc_opt_class();
  v20 = [v18 objectForKeyedSubscript:@"offsets"];
  v21 = TUIDynamicCast(v19, v20);

  uint64_t v22 = objc_opt_class();
  v23 = [(TUISmartGridLayoutConfiguration *)self->_configuration widthSnap];
  v24 = [v23 identifierForValue:v17];
  uint64_t v25 = TUIDynamicCast(v22, v24);

  if (v25)
  {
    uint64_t v26 = objc_opt_class();
    v27 = [v21 objectForKeyedSubscript:v25];
    v116 = TUIDynamicCast(v26, v27);
  }
  else
  {
    v116 = 0;
  }
  uint64_t v28 = objc_opt_class();
  v29 = [v18 objectForKeyedSubscript:@"minHOffset"];
  v30 = TUIDynamicCast(v28, v29);

  uint64_t v31 = objc_opt_class();
  v32 = [v18 objectForKeyedSubscript:@"maxHOffset"];
  v33 = TUIDynamicCast(v31, v32);

  id v34 = [(TUISmartGridLayoutConfiguration *)v114->_configuration columnWidth];
  double v36 = TUILengthValueWithDefault((uint64_t)v34, v35, 120.0);
  unint64_t v113 = (unint64_t)[v116 count];
  v111 = v33;
  if (v30 && v33)
  {
    [v30 doubleValue];
    double v38 = v37;
    [v33 doubleValue];
    double v40 = v17 - v13 - v15;
    double v41 = v40 - v36;
    unint64_t v42 = vcvtpd_u64_f64((v40 - v36) / v38);
    if (v8 >= v42) {
      unint64_t v43 = v42;
    }
    else {
      unint64_t v43 = v8;
    }
  }
  else
  {
    unint64_t v44 = v113;
    if (v113 >= v8) {
      unint64_t v44 = v8;
    }
    if (v116) {
      unint64_t v43 = v44;
    }
    else {
      unint64_t v43 = v8;
    }
    double v40 = v17 - v13 - v15;
    double v41 = v40 - v36;
    double v39 = 1.79769313e308;
  }
  unint64_t v117 = v43;
  double v45 = (double)(v43 - 1);
  double v46 = v41 / v45;
  if (v46 >= v39) {
    double v47 = v39;
  }
  else {
    double v47 = v46;
  }
  double v48 = v40 - (v36 + v45 * v47);
  double v49 = v13 + v48 * 0.5;
  double v50 = v17 - v15 - v48 * 0.5;
  if (v5 == (unsigned char *)&def_141F14 + 2) {
    double v51 = v50;
  }
  else {
    double v51 = v49;
  }
  uint64_t v52 = objc_opt_class();
  v53 = [v18 objectForKeyedSubscript:@"minVerticalCutoff"];
  v54 = TUIDynamicCast(v52, v53);

  v110 = v54;
  if (v54)
  {
    [v54 doubleValue];
    double v56 = v55;
  }
  else
  {
    double v56 = 12.0;
  }
  id v57 = [(TUISmartGridLayoutConfiguration *)v114->_configuration specifiedHeight];
  v107 = (void *)v25;
  v59 = v118;
  uint64_t v60 = (v119 - v118) / 88;
  v108 = v18;
  v109 = v4;
  if (v119 == v118)
  {
    uint64_t v63 = v58;
    uint64_t v64 = (uint64_t)v57;
    unint64_t v61 = 0;
  }
  else
  {
    unint64_t v61 = 0;
    v62 = v118 + 8;
    while (*v62 == *(v62 - 1))
    {
      ++v61;
      v62 += 11;
      if (v60 == v61)
      {
        uint64_t v63 = v58;
        uint64_t v64 = (uint64_t)v57;
        double v65 = 0.0;
        goto LABEL_52;
      }
    }
    uint64_t v63 = v58;
    uint64_t v64 = (uint64_t)v57;
  }
  double v65 = 0.0;
  if (v61 != v60)
  {
    unint64_t v66 = 0;
    unint64_t v67 = 0;
    do
    {
      uint64_t v68 = *(void *)&v59[88 * v61];
      uint64_t v69 = v68 + 96 * v67;
      if (v66 >= v117)
      {
        sub_636C8(v69, 1);
      }
      else
      {
        sub_636C8(v69, 0);
        sub_68438((uint64_t)v127, 0, *(void *)(v68 + 96 * v67 + 48), *(void *)(v68 + 96 * v67 + 56), v36);
        uint64_t v71 = v68 + 96 * v67;
        *(void *)(v71 + 72) = v72;
        *(double *)(v71 + 80) = v70;
        if (v65 < v70) {
          double v65 = v70;
        }
      }
      v59 = v118;
      unint64_t v73 = 0x2E8BA2E8BA2E8BA3 * ((v119 - v118) >> 3);
      if (v61 >= v73)
      {
        unint64_t v67 = 0;
LABEL_49:
        unint64_t v61 = 0x2E8BA2E8BA2E8BA3 * ((v119 - v118) >> 3);
      }
      else
      {
        ++v67;
        v74 = &v118[88 * v61 + 8];
        while (v67 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)v74 - *((void *)v74 - 1)) >> 5))
        {
          unint64_t v67 = 0;
          ++v61;
          v74 += 88;
          if (v73 == v61) {
            goto LABEL_49;
          }
        }
      }
      ++v66;
    }
    while (v67 || v61 != v73);
  }
LABEL_52:
  double v75 = TUILengthValueWithDefault(v64, v63, v65 - v56 - v115);
  v76 = v118;
  uint64_t v77 = (v119 - v118) / 88;
  unint64_t v78 = 0;
  if (v119 != v118)
  {
    v79 = v118 + 8;
    while (*v79 == *(v79 - 1))
    {
      ++v78;
      v79 += 11;
      if (v77 == v78) {
        goto LABEL_88;
      }
    }
  }
  if (v78 != v77)
  {
    unint64_t v80 = 0;
    unint64_t v81 = 0;
    double v82 = 0.0;
    if (v5 == (unsigned char *)&def_141F14 + 2) {
      double v82 = v36;
    }
    double v112 = v82;
    if (v5 == (unsigned char *)&def_141F14 + 2) {
      double v47 = -v47;
    }
    while (v80 != v117)
    {
      uint64_t v83 = *(void *)&v76[88 * v78];
      double v84 = *(double *)(v83 + 96 * v81 + 80);
      if (v116)
      {
        uint64_t v85 = objc_opt_class();
        v86 = [v116 objectAtIndexedSubscript:v80 % v113];
        v87 = TUIDynamicCast(v85, v86);

        [v87 doubleValue];
        double v89 = v88;
      }
      else
      {
        double v89 = (double)(8 * (17 * v80 % 5));
      }
      if (v75 > v84 + v89 - v56) {
        double v89 = v56 + v75 - v84;
      }
      uint64_t v90 = v83 + 96 * v81;
      uint64_t v91 = *(void *)(v90 + 48);
      uint64_t v92 = *(void *)(v90 + 56);
      if (v91 != v92)
      {
        double v93 = v51 - v112;
        double v94 = v115 + v89;
        double v95 = 0.0;
        do
        {
          *(double *)(v91 + 32) = v93;
          *(double *)(v91 + 40) = v94 + v95;
          uint64_t v97 = *(void *)(v91 + 8);
          uint64_t v96 = *(void *)(v91 + 16);
          while (v97 != v96)
          {
            uint64_t v98 = *(void *)(v97 + 56);
            v99 = (char *)__p + 152 * v98;
            v100 = (const CGPoint *)(v99 + 136);
            p_y = (CGFloat *)(v99 + 144);
            BOOL v102 = v98 == -1;
            if (v98 == -1) {
              v103 = &CGPointZero;
            }
            else {
              v103 = v100;
            }
            if (v102) {
              p_y = &CGPointZero.y;
            }
            sub_69564((double *)(v97 + 8), v93 - v103->x + *(double *)(v97 + 72), v94 + v95 - *p_y + *(double *)(v97 + 64));
            v97 += 96;
          }
          double v95 = v95 + *(double *)(v91 + 56);
          v91 += 64;
        }
        while (v91 != v92);
      }
      v76 = v118;
      unint64_t v104 = 0x2E8BA2E8BA2E8BA3 * ((v119 - v118) >> 3);
      if (v78 >= v104)
      {
        unint64_t v81 = 0;
LABEL_85:
        unint64_t v78 = 0x2E8BA2E8BA2E8BA3 * ((v119 - v118) >> 3);
      }
      else
      {
        ++v81;
        v105 = &v118[88 * v78 + 8];
        while (v81 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)v105 - *((void *)v105 - 1)) >> 5))
        {
          unint64_t v81 = 0;
          ++v78;
          v105 += 88;
          if (v104 == v78) {
            goto LABEL_85;
          }
        }
      }
      double v51 = v51 + v47;
      ++v80;
      if (!v81 && v78 == v104) {
        break;
      }
    }
  }
LABEL_88:
  v114->_contentLayoutSize.width = v106;
  v114->_contentLayoutSize.height = v115 + v75;
  v114->_layoutSize = v114->_contentLayoutSize;

  if (__p)
  {
    v126 = __p;
    operator delete(__p);
  }
  if (v123)
  {
    v124 = v123;
    operator delete(v123);
  }
  if (v121)
  {
    v122 = v121;
    operator delete(v121);
  }
  v127[0] = (void **)&v120;
  sub_6427C(v127);
  v127[0] = (void **)&v118;
  sub_644C0(v127);
}

- (void)positionContainerLayout:(id)a3
{
}

- (double)widthForColumnSpan:(unint64_t)a3
{
  return NAN;
}

- (CGSize)scrollLayoutSizeWithSize:(CGSize)a3
{
  double width = self->_layoutSize.width;
  double height = self->_layoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (TUISmartGridLayoutConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (unint64_t)computedColumns
{
  return self->_computedColumns;
}

- (double)computedColumnSpacing
{
  return self->_computedColumnSpacing;
}

- (double)computedColumnWidth
{
  return self->_computedColumnWidth;
}

- (TUISmartGridContentBox)content
{
  return self->_content;
}

- (CGSize)layoutSize
{
  double width = self->_layoutSize.width;
  double height = self->_layoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)contentLayoutSize
{
  double width = self->_contentLayoutSize.width;
  double height = self->_contentLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end