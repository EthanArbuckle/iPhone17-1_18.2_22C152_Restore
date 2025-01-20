@interface _UIDocumentCarouselView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isPagingEnabled;
- (NSArray)items;
- (_UIDocumentCarouselView)initWithFrame:(CGRect)a3;
- (void)_cleanUpAfterAnimation;
- (void)_handlePanNavigation:(id)a3;
- (void)_handleTapNavigation:(id)a3;
- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3;
- (void)_performLayout;
- (void)_updatePagingFraction:(double)a3 withTracking:;
- (void)dealloc;
- (void)scrollToItemAtIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setItems:(id)a3;
- (void)setLockedFocusEnvironmentForAnimation:(unsigned char *)a1;
- (void)setPagingEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIDocumentCarouselView

- (_UIDocumentCarouselView)initWithFrame:(CGRect)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentCarouselView;
  v3 = -[UIView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_centerItemFraction = 1.0;
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:5];
    containerViews = v4->_containerViews;
    v4->_containerViews = (NSMutableDictionary *)v5;

    [(UIView *)v4 setPreservesSuperviewLayoutMargins:1];
    if (v4->_panGestureRecognizer || v4->_tapGestureRecognizer)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:sel__configureGestureRecognizers object:v4 file:@"_UIDocumentCarouselView.m" lineNumber:588 description:@"UIKit internal inconsistency: gesture recognizers have already been configured"];
    }
    v7 = [[UIPanGestureRecognizer alloc] initWithTarget:v4 action:sel__handlePanNavigation_];
    [(UIPanGestureRecognizer *)v7 setDelegate:v4];
    [(UIPanGestureRecognizer *)v7 setAllowedScrollTypesMask:3];
    panGestureRecognizer = v4->_panGestureRecognizer;
    v4->_panGestureRecognizer = v7;
    v9 = v7;

    v10 = [[UITapGestureRecognizer alloc] initWithTarget:v4 action:sel__handleTapNavigation_];
    [(UIGestureRecognizer *)v10 setDelegate:v4];
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = v10;
    v12 = v10;

    [(UIView *)v4 addGestureRecognizer:v9];
    [(UIView *)v4 addGestureRecognizer:v12];

    v13 = objc_alloc_init(UIViewFloatAnimatableProperty);
    pagingFractionAnimatableProperty = v4->_pagingFractionAnimatableProperty;
    v4->_pagingFractionAnimatableProperty = v13;

    v15 = objc_alloc_init(UIViewFloatAnimatableProperty);
    revealAnimatableProperty = v4->_revealAnimatableProperty;
    v4->_revealAnimatableProperty = v15;

    objc_initWeak(&location, v4);
    v24[0] = v4->_pagingFractionAnimatableProperty;
    v24[1] = v4->_revealAnimatableProperty;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57___UIDocumentCarouselView__configureAnimatableProperties__block_invoke;
    v21[3] = &unk_1E52DC308;
    objc_copyWeak(&v22, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:v17 presentationValueChangedCallback:v21];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    [(_UIDocumentCarouselView *)v4 setPagingEnabled:1 animated:0];
  }
  return v4;
}

- (void)_performLayout
{
  uint64_t v215 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  [*(id *)(a1 + 416) presentationValue];
  double v3 = v2;
  [*(id *)(a1 + 424) presentationValue];
  double v5 = v4;
  unint64_t v6 = [*(id *)(a1 + 496) count];
  unint64_t v7 = v6;
  if (v6 >= 5) {
    uint64_t v8 = 5;
  }
  else {
    uint64_t v8 = v6;
  }
  _UIDocumentCarouselViewItemWidth((void *)a1);
  double v10 = v9;
  _UIDocumentCarouselViewRevealDimension((void *)a1);
  double v135 = v11;
  if (!v8 || v10 <= 0.0)
  {
    v67 = *(void **)(a1 + 408);
    [v67 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_281];
    return;
  }
  double v151 = v5;
  uint64_t v12 = vcvtmd_s64_f64(v3);
  double v13 = (double)(uint64_t)floor(v3);
  uint64_t v14 = vcvtpd_s64_f64(v3);
  if (v3 == v13) {
    uint64_t v14 = v12 + 1;
  }
  unint64_t v15 = (uint64_t)(v12 % (uint64_t)v7 + v7) % (uint64_t)v7;
  unint64_t v16 = (uint64_t)(v14 % (uint64_t)v7 + v7) % (uint64_t)v7;
  double v17 = *(double *)(a1 + 448);
  [(id)a1 bounds];
  CGFloat v158 = v19;
  CGFloat v159 = v18;
  CGFloat v156 = v21;
  CGFloat v157 = v20;
  uint64_t v169 = a1;
  [(id)a1 directionalLayoutMargins];
  double v23 = v22;
  uint64_t v145 = v25;
  uint64_t v147 = v24;
  double v27 = v26;
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
  uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
  uint64_t v30 = 1;
  if (v7 < 4) {
    uint64_t v30 = 2;
  }
  if (v7 >= 2) {
    uint64_t v31 = v30;
  }
  else {
    uint64_t v31 = 3;
  }
  SEL v163 = (SEL)v8;
  v166 = (void *)v29;
  do
  {
    v32 = [NSNumber numberWithUnsignedInteger:v31];
    v33 = [NSNumber numberWithUnsignedInteger:v15 % v7];
    [v28 setObject:v32 forKeyedSubscript:v33];

    v34 = v166;
    v35 = [NSNumber numberWithUnsignedInteger:v31];
    v36 = [NSNumber numberWithUnsignedInteger:v16 % v7];
    [v166 setObject:v35 forKeyedSubscript:v36];

    ++v16;
    ++v15;
    ++v31;
    --v8;
  }
  while (v8);
  v165 = v28;
  double v37 = v3 - v13;
  BOOL v38 = v3 <= v17 + -1.0;
  if (v3 >= v17 + 1.0) {
    BOOL v38 = 1;
  }
  BOOL v167 = v38;
  v162 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v163];
  v132 = 0;
  v133 = 0;
  BOOL v136 = 0;
  uint64_t v39 = 0;
  double v40 = round(v3);
  double v160 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v161 = *MEMORY[0x1E4F1DB30];
  BOOL v41 = *MEMORY[0x1E4F1DB30] == 0.0;
  if (v160 != 0.0) {
    BOOL v41 = 0;
  }
  BOOL v143 = v41;
  double v152 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v154 = *MEMORY[0x1E4F1DB28];
  double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v149 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  do
  {
    v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v39, v132);
    v44 = [v165 objectForKeyedSubscript:v43];
    uint64_t v45 = [v44 unsignedIntegerValue];

    v46 = [NSNumber numberWithUnsignedInteger:v39];
    v47 = [v34 objectForKeyedSubscript:v46];
    uint64_t v48 = [v47 unsignedIntegerValue];

    v49 = *(void **)(v169 + 408);
    v50 = [NSNumber numberWithUnsignedInteger:v39];
    p_a = [v49 objectForKeyedSubscript:v50];

    if (!(v45 | v48))
    {
      [p_a _setHiddenForReuse:1];
      goto LABEL_56;
    }
    v52 = objc_alloc_init(_UIDocumentCarouselViewLayoutAttributes);
    v53 = [NSNumber numberWithUnsignedInteger:v39];
    [v162 setObject:v52 forKeyedSubscript:v53];

    if (v45 == 3)
    {
      v54 = v52;

      if (v37 <= 0.5)
      {
        if (v54) {
          v54->_userInteractionEnabled = 1;
        }
        if (v167)
        {
          *(void *)(v169 + 456) = v39;
          *(double *)(v169 + 448) = v40;
        }
      }
      if (v39 == *(void *)(v169 + 456)) {
        BOOL v136 = (unint64_t)(v48 - 1) < 2;
      }
      v133 = (double *)v54;
    }
    if (v48 == 3)
    {
      v55 = v52;

      if (v37 > 0.5)
      {
        if (v55) {
          v55->_userInteractionEnabled = 1;
        }
        if (v167)
        {
          *(void *)(v169 + 456) = v39;
          *(double *)(v169 + 448) = v40;
        }
      }
      if (v39 == *(void *)(v169 + 456)) {
        BOOL v136 = (unint64_t)(v45 - 1) < 2;
      }
      v132 = (double *)v55;
    }
    v56 = objc_msgSend(*(id *)(v169 + 496), "objectAtIndexedSubscript:", v39, v132);
    if (p_a)
    {
      -[_UIDocumentCarouselViewItemContainerView setContentConfiguration:]((uint64_t)p_a, v56);
    }
    else
    {
      v57 = [_UIDocumentCarouselViewItemContainerView alloc];
      if (v57)
      {
        *(void *)&v213.a = v57;
        *(void *)&v213.b = _UIDocumentCarouselViewItemContainerView;
        v58 = -[CGAffineTransform initWithFrame:]((objc_super *)&v213, sel_initWithFrame_, v154, v152, v149, v42);
        p_a = &v58->a;
        if (v58)
        {
          [(CGAffineTransform *)v58 _configureView];
          -[_UIDocumentCarouselViewItemContainerView setContentConfiguration:]((uint64_t)p_a, v56);
        }
      }
      else
      {
        p_a = 0;
      }
      v59 = *(void **)(v169 + 408);
      v60 = [NSNumber numberWithUnsignedInteger:v39];
      [v59 setObject:p_a forKeyedSubscript:v60];

      [(id)v169 addSubview:p_a];
      if (!p_a)
      {
        double v62 = 0.0;
        double v61 = 0.0;
        if (!v143) {
          goto LABEL_53;
        }
        goto LABEL_52;
      }
    }
    double v61 = p_a[53];
    double v62 = p_a[54];
    if (v161 != v61 || v160 != v62) {
      goto LABEL_53;
    }
LABEL_52:
    objc_msgSend(p_a, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    v217.origin.y = v158;
    v217.origin.x = v159;
    v217.size.height = v156;
    v217.size.width = v157;
    CGFloat Height = CGRectGetHeight(v217);
    LODWORD(v65) = 1148846080;
    LODWORD(v66) = 1132068864;
    objc_msgSend(p_a, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v10, Height - v23 - v27, v65, v66);
LABEL_53:
    if (v52)
    {
      v52->_size.width = v61;
      v52->_size.height = v62;
    }

LABEL_56:
    ++v39;
    v34 = v166;
  }
  while (v7 != v39);
  v196[0] = MEMORY[0x1E4F143A8];
  v196[1] = 3221225472;
  v197 = __41___UIDocumentCarouselView__performLayout__block_invoke_2;
  v198 = &unk_1E52F1678;
  double v200 = v135;
  CGFloat v201 = v159;
  CGFloat v202 = v158;
  CGFloat v203 = v157;
  CGFloat v204 = v156;
  double v205 = v23;
  uint64_t v206 = v147;
  double v207 = v27;
  uint64_t v208 = v145;
  v209 = sel__performLayout;
  uint64_t v199 = v169;
  v192[0] = MEMORY[0x1E4F143A8];
  v192[1] = 3221225472;
  v193 = __41___UIDocumentCarouselView__performLayout__block_invoke_3;
  v194 = &__block_descriptor_40_e8_d16__0Q8l;
  double v195 = v151;
  v187[0] = MEMORY[0x1E4F143A8];
  v187[1] = 3221225472;
  v188 = __41___UIDocumentCarouselView__performLayout__block_invoke_4;
  v189 = &unk_1E52F16C0;
  v191 = sel__performLayout;
  uint64_t v190 = v169;
  v175[0] = MEMORY[0x1E4F143A8];
  v175[1] = 3221225472;
  v176 = __41___UIDocumentCarouselView__performLayout__block_invoke_5;
  v177 = &unk_1E52F16E8;
  CGFloat v179 = v159;
  CGFloat v180 = v158;
  CGFloat v181 = v157;
  CGFloat v182 = v156;
  double v183 = v23;
  uint64_t v184 = v147;
  double v185 = v27;
  uint64_t v186 = v145;
  uint64_t v178 = v169;
  double v153 = 0.0;
  double v155 = 0.0;
  double v150 = 0.0;
  if (v133)
  {
    double v150 = v133[6];
    double v153 = v133[7];
  }
  double v68 = 0.0;
  v69 = v165;
  if (v132)
  {
    double v68 = v132[6];
    double v155 = v132[7];
  }
  double v71 = *MEMORY[0x1E4F1DAD8];
  double v70 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v218.origin.y = v158;
  v218.origin.x = v159;
  v218.size.height = v156;
  v218.size.width = v157;
  double MidX = CGRectGetMidX(v218);
  double v72 = v205;
  double v168 = v70;
  double v73 = ((double (*)(void *, uint64_t, double, double, double, double, double, double))v197)(v196, 3, v68, v155, v71, v70, v161, v160);
  double v144 = v74;
  double v146 = v73;
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  id obj = [v162 keyEnumerator];
  SEL v164 = (SEL)[obj countByEnumeratingWithState:&v171 objects:v214 count:16];
  if (v164)
  {
    double v139 = v153 * 0.5 + v72;
    double v75 = 1.0 - v37;
    if (v136) {
      double v75 = v37;
    }
    uint64_t v138 = *(void *)v172;
    if (v75 <= 0.5) {
      double v76 = v75 + v75 + 0.0;
    }
    else {
      double v76 = 1.0 - (v75 + -0.5 + v75 + -0.5);
    }
    double v134 = v76;
    double v141 = v68;
    double v142 = v37;
    double v140 = v71;
    do
    {
      SEL v77 = 0;
      do
      {
        if (*(void *)v172 != v138) {
          objc_enumerationMutation(obj);
        }
        v78 = *(void **)(*((void *)&v171 + 1) + 8 * (void)v77);
        uint64_t v79 = [v162 objectForKeyedSubscript:v78];
        v80 = [*(id *)(v169 + 408) objectForKeyedSubscript:v78];
        v81 = [v69 objectForKeyedSubscript:v78];
        uint64_t v82 = [v81 unsignedIntegerValue];

        v83 = [v166 objectForKeyedSubscript:v78];
        uint64_t v84 = [v83 unsignedIntegerValue];

        double v85 = 0.0;
        v86.n128_u64[0] = 0;
        v87.n128_u64[0] = 0;
        if (v79)
        {
          v87.n128_u64[0] = *(void *)(v79 + 48);
          v86.n128_u64[0] = *(void *)(v79 + 56);
        }
        double v88 = ((double (*)(void *, uint64_t, __n128, __n128, double, double, double, double))v197)(v196, v82, v87, v86, MidX, v139, v150, v153);
        double v90 = v89;
        v91.n128_u64[0] = 0;
        if (v79)
        {
          v91.n128_u64[0] = *(void *)(v79 + 48);
          double v85 = *(double *)(v79 + 56);
        }
        double v94 = ((double (*)(void *, uint64_t, __n128, double, double, double, double, double))v197)(v196, v84, v91, v85, v146, v144, v68, v155);
        double v95 = v93.n128_f64[0];
        if (v79)
        {
          v92.n128_u64[0] = *(void *)(v79 + 48);
          v93.n128_u64[0] = *(void *)(v79 + 56);
        }
        else
        {
          v93.n128_u64[0] = 0;
          v92.n128_u64[0] = 0;
        }
        double v96 = ((double (*)(void *, uint64_t, __n128, __n128, double, double, double, double))v197)(v196, 3, v92, v93, v71, v168, v161, v160);
        double v98 = v97;
        double v99 = v96 + v151 * (v88 + v37 * (v94 - v88) - v96);
        uint64_t v100 = *(void *)(v169 + 456);
        if (v100 == [v78 unsignedIntegerValue])
        {
          v69 = v165;
          if (v79)
          {
            double v101 = *(double *)(v79 + 48);
            double v102 = *(double *)(v79 + 56);
          }
          else
          {
            double v102 = 0.0;
            double v101 = 0.0;
          }
          double v103 = v101 + v102 * 0.0599640065 + v101 + v101 * -0.99820054 - v135 + 20.0;
          _UIScrollViewRubberBandOffsetWithoutDecorationForOffset(0, v134 * v103, v103 + -85.0, 0.0, v103);
          if (v136) {
            double v104 = -v104;
          }
          double v99 = v99 + v104;
        }
        else
        {
          v69 = v165;
        }
        if (v79)
        {
          *(double *)(v79 + 32) = v99;
          *(double *)(v79 + 40) = v98 + v151 * (v90 + v37 * (v95 - v90) - v98);
        }
        memset(&v170, 0, sizeof(v170));
        v219.origin.x = v159;
        v219.origin.y = v158;
        v219.size.width = v157;
        v219.size.height = v156;
        BOOL v105 = v99 < CGRectGetMidX(v219);
        v220.origin.x = v159;
        v220.origin.y = v158;
        v220.size.width = v157;
        v220.size.height = v156;
        double v106 = v99 - CGRectGetMidX(v220);
        if (v106 >= 0.0) {
          double v107 = v106;
        }
        else {
          double v107 = -v106;
        }
        v221.origin.x = v159;
        v221.origin.y = v158;
        v221.size.width = v157;
        v221.size.height = v156;
        double v108 = v107 / (CGRectGetWidth(v221) * 0.5);
        memset(&v213, 0, sizeof(v213));
        CGAffineTransformMakeRotation(&v213, dbl_186B977B0[v105] * v108);
        memset(&v212, 0, sizeof(v212));
        CGAffineTransformMakeScale(&v212, v108 * -0.05 + 1.0, v108 * -0.05 + 1.0);
        memset(&v170, 0, sizeof(v170));
        CGAffineTransform t1 = v213;
        CGAffineTransform t2 = v212;
        CGAffineTransformConcat(&v170, &t1, &t2);
        if (v79)
        {
          long long v109 = *(_OWORD *)&v170.c;
          *(_OWORD *)(v79 + 96) = *(_OWORD *)&v170.a;
          *(_OWORD *)(v79 + 112) = v109;
          *(_OWORD *)(v79 + 128) = *(_OWORD *)&v170.tx;
        }
        double v110 = v193((uint64_t)v192, v82);
        v193((uint64_t)v192, v84);
        double v37 = v142;
        if (v79) {
          *(double *)(v79 + 24) = v110 + v142 * (v111 - v110);
        }
        double v112 = v188((uint64_t)v187, v82);
        v188((uint64_t)v187, v84);
        double v68 = v141;
        if (v79)
        {
          *(double *)(v79 + 16) = v112 + v142 * (v113 - v112);
          v114.n128_u64[0] = *(void *)(v79 + 48);
          v115.n128_u64[0] = *(void *)(v79 + 56);
        }
        else
        {
          v115.n128_u64[0] = 0;
          v114.n128_u64[0] = 0;
        }
        ((void (*)(void *, double, double, __n128, __n128))v176)(v175, v96, v98, v114, v115);
        if (v79)
        {
          *(void *)(v79 + 64) = v116;
          *(void *)(v79 + 72) = v117;
          *(void *)(v79 + 80) = v118;
          *(void *)(v79 + 88) = v119;
          [v80 _setHiddenForReuse:0];
          double v71 = v140;
          if (!v80) {
            goto LABEL_108;
          }
          objc_msgSend(v80, "setCenter:", *(double *)(v79 + 32), *(double *)(v79 + 40));
          objc_msgSend(v80, "setBounds:", v140, v168, *(double *)(v79 + 48), *(double *)(v79 + 56));
          long long v120 = *(_OWORD *)(v79 + 112);
          *(_OWORD *)&v213.a = *(_OWORD *)(v79 + 96);
          *(_OWORD *)&v213.c = v120;
          *(_OWORD *)&v213.tx = *(_OWORD *)(v79 + 128);
          [v80 setTransform:&v213];
          float v121 = *(double *)(v79 + 24) * 0.2;
        }
        else
        {
          [v80 _setHiddenForReuse:0];
          double v71 = v140;
          if (!v80) {
            goto LABEL_108;
          }
          objc_msgSend(v80, "setCenter:", 0.0, 0.0);
          objc_msgSend(v80, "setBounds:", v140, v168, 0.0, 0.0);
          memset(&v213, 0, sizeof(v213));
          [v80 setTransform:&v213];
          float v121 = 0.0;
        }
        v122 = [v80 layer];
        *(float *)&double v123 = v121;
        [v122 setShadowOpacity:v123];

        if (v79)
        {
          double v124 = *(double *)(v79 + 16);
          v125 = [v80 layer];
          [v125 setZPosition:v124];

          [v80 setUserInteractionEnabled:*(unsigned __int8 *)(v79 + 8)];
          double v126 = *(double *)(v79 + 64);
          double v127 = *(double *)(v79 + 72);
          double v128 = *(double *)(v79 + 80);
          double v129 = *(double *)(v79 + 88);
        }
        else
        {
          v130 = [v80 layer];
          double v127 = 0.0;
          [v130 setZPosition:0.0];

          [v80 setUserInteractionEnabled:0];
          double v128 = 0.0;
          double v129 = 0.0;
          double v126 = 0.0;
        }
        objc_msgSend(v80, "setDirectionalLayoutMargins:", v126, v127, v128, v129);
LABEL_108:

        ++v77;
      }
      while (v164 != v77);
      uint64_t v131 = [obj countByEnumeratingWithState:&v171 objects:v214 count:16];
      SEL v164 = (SEL)v131;
    }
    while (v131);
  }
}

- (void)_updatePagingFraction:(double)a3 withTracking:
{
  if (val)
  {
    uint64_t v6 = val[54];
    if (!v6)
    {
      -[_UIDocumentCarouselView setLockedFocusEnvironmentForAnimation:](val, 1);
      uint64_t v6 = val[54];
    }
    val[54] = v6 + 1;
    objc_initWeak(&location, val);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62___UIDocumentCarouselView__updatePagingFraction_withTracking___block_invoke;
    v9[3] = &unk_1E52D9CD0;
    v9[4] = val;
    *(double *)&v9[5] = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __62___UIDocumentCarouselView__updatePagingFraction_withTracking___block_invoke_2;
    v7[3] = &unk_1E52F1710;
    objc_copyWeak(&v8, &location);
    _UIDocumentCarouselViewAnimateWithTracking(a2, (uint64_t)v9, (uint64_t)v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_cleanUpAfterAnimation
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 432);
    if (!v2)
    {
      double v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:sel__cleanUpAfterAnimation object:a1 file:@"_UIDocumentCarouselView.m" lineNumber:531 description:@"UIKit internal inconsistency: unbalanced document animation"];

      uint64_t v2 = *(void *)(a1 + 432);
    }
    uint64_t v3 = v2 - 1;
    *(void *)(a1 + 432) = v3;
    if (!v3)
    {
      -[_UIDocumentCarouselView setLockedFocusEnvironmentForAnimation:]((unsigned char *)a1, 0);
    }
  }
}

- (void)setLockedFocusEnvironmentForAnimation:(unsigned char *)a1
{
  if (a1 && a1[488] != a2)
  {
    a1[488] = a2;
    double v4 = [a1 _focusSystem];
    id v5 = v4;
    if (a2) {
      [v4 _lockEnvironment:a1];
    }
    else {
      [v4 _unlockEnvironment:a1];
    }
  }
}

- (void)scrollToItemAtIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v8 = [(NSArray *)self->_items count];
  unint64_t v9 = v8;
  if (a3 < 0 || v8 <= a3)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIDocumentCarouselView.m", 550, @"Attempted to scroll to an invalid index: %ld", a3);
  }
  double v10 = (double)v9 + -1.0;
  if (v10 > 2.0) {
    double v10 = 2.0;
  }
  double v11 = (double)a3 - v10;
  if (v4)
  {
    -[_UIDocumentCarouselView _updatePagingFraction:withTracking:](self, 0, v11);
  }
  else
  {
    [(UIViewFloatAnimatableProperty *)self->_pagingFractionAnimatableProperty setValue:v11];
    -[_UIDocumentCarouselView _performLayout]((uint64_t)self);
  }
}

- (void)setPagingEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_pagingEnabled != a3)
  {
    self->_pagingEnabled = a3;
    if (a3) {
      double v5 = 1.0;
    }
    else {
      double v5 = 0.0;
    }
    if (a4)
    {
      unint64_t animationCount = self->_animationCount;
      if (!animationCount)
      {
        -[_UIDocumentCarouselView setLockedFocusEnvironmentForAnimation:](self, 1);
        unint64_t animationCount = self->_animationCount;
      }
      self->_unint64_t animationCount = animationCount + 1;
      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __53___UIDocumentCarouselView_setPagingEnabled_animated___block_invoke;
      v10[3] = &unk_1E52D9CD0;
      v10[4] = self;
      *(double *)&v10[5] = v5;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __53___UIDocumentCarouselView_setPagingEnabled_animated___block_invoke_2;
      v8[3] = &unk_1E52F1710;
      objc_copyWeak(&v9, &location);
      _UIDocumentCarouselViewAnimateWithTracking(0, (uint64_t)v10, (uint64_t)v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    else
    {
      revealAnimatableProperty = self->_revealAnimatableProperty;
      [(UIViewFloatAnimatableProperty *)revealAnimatableProperty setValue:v5];
    }
  }
}

- (BOOL)isPagingEnabled
{
  return self->_pagingEnabled;
}

- (void)_handlePanNavigation:(id)a3
{
  if (self->_panGestureRecognizer != a3)
  {
    double v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"_UIDocumentCarouselView.m", 606, @"Invalid parameter not satisfying: %@", @"panGestureRecognizer == _panGestureRecognizer" object file lineNumber description];
  }
  uint64_t v5 = [a3 state];
  if ((unint64_t)(v5 - 3) < 2)
  {
    [a3 translationInView:self];
    double v9 = v8;
    [a3 velocityInView:self];
    double v11 = v10;
    double v12 = -v10;
    if (v11 >= 0.0) {
      double v13 = v11;
    }
    else {
      double v13 = v12;
    }
    _UIDocumentCarouselViewItemWidth(self);
    if (v9 >= 0.0) {
      double v15 = v9;
    }
    else {
      double v15 = -v9;
    }
    double v16 = v14 * 0.5;
    if (v9 <= 0.0 || v11 <= -100.0)
    {
      BOOL v17 = v9 < 0.0;
      if (v11 >= 100.0) {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 1;
    }
    BOOL v34 = v13 >= 100.0;
    if (v15 >= v16) {
      BOOL v34 = 1;
    }
    double v35 = 1.0;
    if (v9 > 0.0) {
      double v35 = -1.0;
    }
    if (!v34 || !v17) {
      double v35 = -0.0;
    }
    -[_UIDocumentCarouselView _updatePagingFraction:withTracking:](self, 0, self->_pagingFractionPanStart + v35);
    -[_UIDocumentCarouselView _cleanUpAfterAnimation]((uint64_t)self);
  }
  else if (v5 == 2)
  {
    double v18 = [(UIView *)self window];
    double v19 = [v18 screen];
    [v19 bounds];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;

    [a3 translationInView:self];
    double v29 = v28;
    v39.origin.x = v21;
    v39.origin.y = v23;
    v39.size.width = v25;
    v39.size.height = v27;
    double v30 = v29 / CGRectGetWidth(v39);
    if (v30 < 0.0) {
      double v30 = -v30;
    }
    double v31 = fmax(fmin(v30, 0.9999), 0.0001);
    double v32 = 1.0;
    if (v29 > 0.0) {
      double v32 = -1.0;
    }
    double v33 = self->_pagingFractionPanStart + (self->_pagingFractionPanStart + v32 - self->_pagingFractionPanStart) * v31;
    -[_UIDocumentCarouselView _updatePagingFraction:withTracking:](self, 1, v33);
  }
  else if (v5 == 1)
  {
    [(UIViewFloatAnimatableProperty *)self->_pagingFractionAnimatableProperty value];
    self->_pagingFractionPanStart = v6;
    unint64_t animationCount = self->_animationCount;
    if (!animationCount)
    {
      -[_UIDocumentCarouselView setLockedFocusEnvironmentForAnimation:](self, 1);
      unint64_t animationCount = self->_animationCount;
    }
    self->_unint64_t animationCount = animationCount + 1;
  }
}

- (void)_handleTapNavigation:(id)a3
{
  if (self->_tapGestureRecognizer != a3)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UIDocumentCarouselView.m", 650, @"Invalid parameter not satisfying: %@", @"tapGestureRecognizer == _tapGestureRecognizer" object file lineNumber description];
  }
  if ([a3 state] == 3)
  {
    [a3 locationInView:self];
    double v6 = v5;
    [(UIView *)self bounds];
    double MidX = CGRectGetMidX(v14);
    [(UIViewFloatAnimatableProperty *)self->_pagingFractionAnimatableProperty value];
    double v9 = 1.0;
    if (v6 < MidX) {
      double v9 = -1.0;
    }
    double v10 = v9 + v8;
    -[_UIDocumentCarouselView _updatePagingFraction:withTracking:](self, 0, v10);
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v5 = [(NSArray *)self->_items count] >= 2
    && [(_UIDocumentCarouselView *)self isPagingEnabled];
  if (self->_panGestureRecognizer != a3)
  {
    if (self->_tapGestureRecognizer == a3)
    {
      containerViews = self->_containerViews;
      unint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_centerItemIndex];
      double v8 = [(NSMutableDictionary *)containerViews objectForKeyedSubscript:v7];

      if (v8) {
        BOOL v9 = v5;
      }
      else {
        BOOL v9 = 0;
      }
      if (v9)
      {
        [a3 locationInView:self];
        double v11 = v10;
        [(UIView *)self bounds];
        double v12 = CGRectGetMidX(v15) - v11;
        if (v12 >= 0.0) {
          double v13 = v12;
        }
        else {
          double v13 = -v12;
        }
        [v8 frame];
        LOBYTE(v5) = v13 > CGRectGetWidth(v16) * 0.5;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)setItems:(id)a3
{
  if ((-[NSArray isEqual:](self->_items, "isEqual:") & 1) == 0)
  {
    BOOL v5 = (NSArray *)[a3 copy];
    items = self->_items;
    self->_items = v5;

    if ([a3 count])
    {
      [(_UIDocumentCarouselView *)self scrollToItemAtIndex:0 animated:0];
    }
    else
    {
      -[_UIDocumentCarouselView _performLayout]((uint64_t)self);
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentCarouselView;
  -[UIView setFrame:](&v20, sel_setFrame_, x, y, width, height);
  [(UIView *)self frame];
  v22.origin.double x = v16;
  v22.origin.double y = v17;
  v22.size.double width = v18;
  v22.size.double height = v19;
  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  if (!CGRectEqualToRect(v21, v22))
  {
    if (self) {
      [(NSMutableDictionary *)self->_containerViews enumerateKeysAndObjectsUsingBlock:&__block_literal_global_15_6];
    }
    -[_UIDocumentCarouselView _performLayout]((uint64_t)self);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentCarouselView;
  -[UIView setBounds:](&v20, sel_setBounds_, x, y, width, height);
  [(UIView *)self bounds];
  v22.origin.double x = v16;
  v22.origin.double y = v17;
  v22.size.double width = v18;
  v22.size.double height = v19;
  v21.origin.double x = v9;
  v21.origin.double y = v11;
  v21.size.double width = v13;
  v21.size.double height = v15;
  if (!CGRectEqualToRect(v21, v22))
  {
    if (self) {
      [(NSMutableDictionary *)self->_containerViews enumerateKeysAndObjectsUsingBlock:&__block_literal_global_15_6];
    }
    -[_UIDocumentCarouselView _performLayout]((uint64_t)self);
  }
}

- (void)_layoutMarginsDidChangeFromOldMargins:(UIEdgeInsets)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentCarouselView;
  -[UIView _layoutMarginsDidChangeFromOldMargins:](&v4, sel__layoutMarginsDidChangeFromOldMargins_, a3.top, a3.left, a3.bottom, a3.right);
  if (self) {
    [(NSMutableDictionary *)self->_containerViews enumerateKeysAndObjectsUsingBlock:&__block_literal_global_15_6];
  }
  -[_UIDocumentCarouselView _performLayout]((uint64_t)self);
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentCarouselView;
  -[UIView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3) {
    -[_UIDocumentCarouselView setLockedFocusEnvironmentForAnimation:](self, 0);
  }
}

- (void)dealloc
{
  -[_UIDocumentCarouselView setLockedFocusEnvironmentForAnimation:](self, 0);
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentCarouselView;
  [(UIView *)&v3 dealloc];
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_revealAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_pagingFractionAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_containerViews, 0);
}

@end