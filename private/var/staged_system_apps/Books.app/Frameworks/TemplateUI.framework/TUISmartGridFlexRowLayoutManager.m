@interface TUISmartGridFlexRowLayoutManager
+ (void)configureContentLayout:(id)a3 configuration:(id)a4;
+ (void)configureScrollLayout:(id)a3 configuration:(id)a4;
- (BOOL)shouldInvalidateRenderModelForScrollLayout;
- (CGSize)contentLayoutSize;
- (CGSize)layoutSize;
- (TUISmartGridContentBox)content;
- (TUISmartGridFlexRowLayoutManager)initWithContent:(id)a3;
- (TUISmartGridLayoutConfiguration)configuration;
- (UIEdgeInsets)scrollGradientFraction;
- (UIEdgeInsets)scrollGradientInsets;
- (double)computedColumnSpacing;
- (double)computedColumnWidth;
- (id).cxx_construct;
- (id)scrollPolicy;
- (unint64_t)computedColumns;
- (unint64_t)ruleLayoutAxis;
- (void)appendAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7;
- (void)appendAnchorsToSet:(id)a3 forLayout:(id)a4 inRoot:(id)a5;
- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6;
- (void)appendHoverRegions:(id)a3 transform:(CGAffineTransform *)a4;
- (void)appendNonScrollableAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7;
- (void)layoutContent:(id)a3;
- (void)positionContainerLayout:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation TUISmartGridFlexRowLayoutManager

- (TUISmartGridFlexRowLayoutManager)initWithContent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUISmartGridFlexRowLayoutManager;
  v6 = [(TUISmartGridFlexRowLayoutManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_content, a3);
  }

  return v7;
}

+ (void)configureScrollLayout:(id)a3 configuration:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  [v5 contentInsets];
  double v7 = v6;
  double v9 = v8;
  if ([v5 paginated])
  {
    [v5 width];
    double v11 = v10 - v7 - v9;
  }
  else
  {
    [v5 width];
  }
  [v12 setContainingWidth:v11];
}

+ (void)configureContentLayout:(id)a3 configuration:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  [v5 contentInsets];
  double v7 = v6;
  double v9 = v8;
  if ([v5 paginated])
  {
    [v5 width];
    double v11 = v10 - v7 - v9;
  }
  else
  {
    [v5 width];
  }
  [v12 setContainingWidth:v11];
}

- (void)positionContainerLayout:(id)a3
{
  id v7 = a3;
  unsigned int v4 = [(TUISmartGridLayoutConfiguration *)self->_configuration paginated];
  double v5 = 0.0;
  if (v4)
  {
    [(TUISmartGridLayoutConfiguration *)self->_configuration contentInsets];
    double v5 = v6;
  }
  [v7 setComputedOrigin:v5];
}

- (unint64_t)ruleLayoutAxis
{
  return 2;
}

- (BOOL)shouldInvalidateRenderModelForScrollLayout
{
  unsigned int v3 = [(TUISmartGridLayoutConfiguration *)self->_configuration paginated];
  if (v3) {
    LOBYTE(v3) = self->_scrollPolicy == 0;
  }
  return v3;
}

- (void)layoutContent:(id)a3
{
  id v131 = a3;
  unsigned int v4 = (char *)[v131 computedLayoutDirection];
  [(TUISmartGridLayoutConfiguration *)self->_configuration width];
  double v6 = v5;
  [(TUISmartGridLayoutConfiguration *)self->_configuration contentInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  self->_computedColumns = +[TUISmartGridBox columnsWithConfiguration:self->_configuration];
  id v15 = [(TUISmartGridLayoutConfiguration *)self->_configuration columnSpacing];
  self->_double computedColumnSpacing = TUILengthValueWithDefault((uint64_t)v15, v16, 0.0);
  +[TUISmartGridBox columnWidthWithConfiguration:columns:spacing:](TUISmartGridBox, "columnWidthWithConfiguration:columns:spacing:", self->_configuration, self->_computedColumns);
  self->_computedColumnWidth = v17;
  v18 = [v131 children];
  sub_64720((uint64_t)&v160, v18, self->_content, 1);

  v19 = v160;
  v20 = v161;
  if (v160 != v161)
  {
    uint64_t v21 = 0;
    do
    {
      uint64_t v22 = *v19;
      uint64_t v23 = v19[1];
      while (v22 != v23)
      {
        *(void *)uint64_t v22 = v21;
        *(void *)(v22 + 24) = 1;
        *(_OWORD *)(v22 + 8) = xmmword_2433C0;
        ++v21;
        v22 += 96;
      }
      v19 += 11;
    }
    while (v19 != v20);
  }
  double computedColumnSpacing = self->_computedColumnSpacing;
  double v148 = v6;
  double v149 = v8;
  double v150 = v10;
  double v151 = v12;
  double v152 = v14;
  double v153 = computedColumnSpacing;
  uint64_t v154 = 0;
  v155 = v4;
  unsigned __int8 v156 = 0;
  v158 = 0;
  uint64_t v159 = 0;
  v157 = 0;
  unsigned __int8 v156 = [(TUISmartGridLayoutConfiguration *)self->_configuration paginated];
  double v25 = v8;
  v27 = v160;
  v26 = v161;
  uint64_t v28 = 0;
  if (v161 != v160)
  {
    v29 = v160 + 1;
    while (*v29 == *(v29 - 1))
    {
      ++v28;
      v29 += 11;
      if (((char *)v161 - (char *)v160) / 88 == v28)
      {
        uint64_t v28 = ((char *)v161 - (char *)v160) / 88;
        break;
      }
    }
  }
  *(void *)&long long v138 = &v160;
  *((void *)&v138 + 1) = v28;
  uint64_t v139 = 0;
  v140 = &v160;
  uint64_t v142 = 0;
  uint64_t v143 = 0;
  uint64_t v141 = ((char *)v161 - (char *)v160) / 88;
  double v144 = v149;
  long long v145 = 0u;
  *(_OWORD *)__p = 0u;
  long long v147 = 0u;
  unint64_t v30 = 1;
  if (v161 != v160)
  {
    do
    {
      uint64_t v31 = *v27;
      uint64_t v32 = v27[1];
      while (v31 != v32)
      {
        v33 = *(id **)(v31 + 48);
        v34 = *(id **)(v31 + 56);
        if (v33 == v34)
        {
          unint64_t v35 = 0;
        }
        else
        {
          unint64_t v35 = 0;
          do
          {
            if (*v33)
            {
              id v36 = [*v33 span];
              if ((unint64_t)v36 <= 1) {
                uint64_t v37 = 1;
              }
              else {
                uint64_t v37 = (uint64_t)v36;
              }
            }
            else
            {
              uint64_t v37 = 1;
            }
            v35 += v37;
            v33 += 8;
          }
          while (v33 != v34);
        }
        if (v35 > v30) {
          unint64_t v30 = v35;
        }
        v31 += 96;
      }
      v27 += 11;
    }
    while (v27 != v26);
  }
  double v38 = sub_94678(&v138, &v148, &v160, v30);
  double v40 = v39;
  double v41 = v151;
  v42 = v160;
  v43 = v161;
  while (v42 != v43)
  {
    uint64_t v44 = *v42;
    uint64_t v45 = v42[1];
    while (v44 != v45)
    {
      if (*(void *)(v44 + 16)) {
        BOOL v46 = *(void *)(v44 + 24) == 0;
      }
      else {
        BOOL v46 = 1;
      }
      uint64_t v47 = v46;
      sub_636C8(v44, v47);
      v44 += 96;
    }
    uint64_t v48 = v42[3];
    uint64_t v49 = v42[4];
    while (v48 != v49)
    {
      sub_622EC(v48, 1);
      v48 += 96;
    }
    v42 += 11;
  }
  sub_955B8((uint64_t)&self->_cells, (uint64_t)self->_cells.__begin_, (uint64_t)self->_cells.__end_);
  double v129 = v41;
  CGFloat v130 = v6;
  CGFloat v50 = v38;
  v133 = objc_opt_new();
  v51 = v160;
  for (i = v161; v51 != i; v51 += 11)
  {
    uint64_t v53 = *v51;
    uint64_t v52 = v51[1];
    while (v53 != v52)
    {
      if (!*(unsigned char *)(v53 + 40))
      {
        uint64_t v55 = *(void *)(v53 + 48);
        uint64_t v54 = *(void *)(v53 + 56);
        if (v55 == v54)
        {
          double x = CGRectNull.origin.x;
          double y = CGRectNull.origin.y;
          double width = CGRectNull.size.width;
          double height = CGRectNull.size.height;
        }
        else
        {
          double x = *(double *)(v55 + 32);
          double y = *(double *)(v55 + 40);
          double width = *(double *)(v54 - 32) + *(double *)(v54 - 16) - x;
          double height = *(double *)(v54 - 24) + *(double *)(v54 - 8) - y;
        }
        v170.origin.double x = x;
        v170.origin.double y = y;
        v170.size.double width = width;
        v170.size.double height = height;
        if (!CGRectIsNull(v170))
        {
          id v60 = *(id *)(v53 + 32);
          id v61 = [v60 identifier];
          v134.double width = x;
          v134.double height = y;
          *(double *)&long long v135 = width;
          *((double *)&v135 + 1) = height;
          *(void *)&long long v136 = v61;
          end = self->_cells.__end_;
          if (end >= self->_cells.__end_cap_.__value_)
          {
            v64 = (CellInfo *)sub_9743C((uint64_t *)&self->_cells, (uint64_t)&v134);
          }
          else
          {
            long long v63 = v135;
            *(CGSize *)end = v134;
            *((_OWORD *)end + 1) = v63;
            *((void *)end + 4) = (id)v136;
            v64 = (CellInfo *)((char *)end + 40);
          }
          self->_cells.__end_ = v64;

          v65 = objc_opt_new();
          sub_68024(&v160, (void *)v53, v65);
          id v66 = [v65 copy];
          [v133 addObject:v66];
        }
      }
      v53 += 96;
    }
  }
  v67 = (NSArray *)[v133 copy];
  cellLayouts = self->_cellLayouts;
  self->_cellLayouts = v67;

  uint64_t v69 = sub_620A0((uint64_t)&v160, (char *)&dword_4 + 1);
  v70 = (double *)v69;
  if (v162[1] == v69)
  {
    CGSize v134 = CGSizeZero;
    long long v135 = 0u;
    long long v136 = 0u;
    sub_625C8((uint64_t)&self->_cellDividers, (uint64_t)&v134);
    v169[0] = (void **)&v135 + 1;
    sub_641FC(v169);
  }
  else
  {
    double v71 = sub_97654((uint64_t)&v137, 0, *(void *)(v69 + 40), *(void *)(v69 + 48), NAN, v40);
    CGFloat v73 = v72;
    v70[9] = v71;
    v70[10] = v72;
    sub_622EC((uint64_t)v70, 1);
    v74 = objc_opt_new();
    sub_62424(&v160, v70, v74);
    id v75 = v74;
    v134.double width = v71;
    v134.double height = v73;
    long long v135 = (unint64_t)v75;
    long long v136 = 0uLL;
    sub_625C8((uint64_t)&self->_cellDividers, (uint64_t)&v134);
    v169[0] = (void **)&v135 + 1;
    sub_641FC(v169);

    unint64_t v76 = 0xCCCCCCCCCCCCCCCDLL * ((self->_cells.__end_ - self->_cells.__begin_) >> 3);
    double v77 = -0.5;
    if (v155 == (unsigned char *)&def_141F14 + 2) {
      double v77 = 0.5;
    }
    if (v76 >= 2)
    {
      double v78 = v153 * v77;
      uint64_t v79 = 1;
      uint64_t v80 = 72;
      do
      {
        v81 = [*(id *)((char *)self->_cells.__begin_ + v80) tui_identifierByAppendingString:@"divider"];
        if (v155 == (unsigned char *)&def_141F14 + 2)
        {
          double v82 = v150 + v152;
          if (v156) {
            double v82 = 0.0;
          }
          double v83 = *(v158 - 1) - *(double *)v157 - v153 + v82 - *((double *)v157 + v79);
        }
        else
        {
          double v83 = *((double *)v157 + v79);
        }
        sub_695E4(&self->_cellDividers._layoutSize.width, v81, v78 + v83, v8);

        ++v79;
        v80 += 40;
      }
      while (v76 != v79);
    }
  }
  scrollPolicdouble y = self->_scrollPolicy;
  if (scrollPolicy)
  {
    v85 = [(TUICellScrollPolicy *)scrollPolicy cells];
    uint64_t v87 = *v85;
    uint64_t v86 = v85[1];
    begin = self->_cells.__begin_;
    if (v86 - *v85 == self->_cells.__end_ - begin)
    {
      while (v87 != v86)
      {
        if (!sub_978F8((uint64_t)&v134, v87, (uint64_t)begin)) {
          goto LABEL_76;
        }
        v87 += 40;
        begin = (CellInfo *)((char *)begin + 40);
      }
    }
    else
    {
LABEL_76:
      v89 = self->_scrollPolicy;
      self->_scrollPolicdouble y = 0;
    }
  }
  v90 = self->_scrollAnchors.__begin_;
  p_scrollAnchors = &self->_scrollAnchors;
  if (v90 != self->_scrollAnchors.__end_) {
    self->_scrollAnchors.__end_ = v90;
  }
  if (v156)
  {
    v93 = (uint64_t *)*((void *)&v145 + 1);
    v92 = (uint64_t *)v145;
    if ((void)v145 != *((void *)&v145 + 1))
    {
      uint64_t v94 = 0;
      p_end_cap = &self->_scrollAnchors.__end_cap_;
      do
      {
        if (v155 == (unsigned char *)&def_141F14 + 2)
        {
          double v96 = v150 + v152;
          if (v156) {
            double v96 = 0.0;
          }
          double v97 = *(v158 - 1) - *(double *)v157 - v153 + v96 - *((double *)v157 + v94);
        }
        else
        {
          double v97 = *((double *)v157 + v94);
        }
        if (v90 >= p_end_cap->__value_)
        {
          v99 = p_scrollAnchors->__begin_;
          uint64_t v100 = v90 - p_scrollAnchors->__begin_;
          unint64_t v101 = v100 + 1;
          if ((unint64_t)(v100 + 1) >> 61) {
            sub_4484();
          }
          uint64_t v102 = (char *)p_end_cap->__value_ - (char *)v99;
          if (v102 >> 2 > v101) {
            unint64_t v101 = v102 >> 2;
          }
          if ((unint64_t)v102 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v103 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v103 = v101;
          }
          if (v103)
          {
            v104 = (char *)sub_39FA0((uint64_t)&self->_scrollAnchors.__end_cap_, v103);
            v99 = self->_scrollAnchors.__begin_;
            v90 = self->_scrollAnchors.__end_;
          }
          else
          {
            v104 = 0;
          }
          v105 = (double *)&v104[8 * v100];
          double *v105 = v97;
          v98 = v105 + 1;
          while (v90 != v99)
          {
            uint64_t v106 = *((void *)v90-- - 1);
            *((void *)v105-- - 1) = v106;
          }
          self->_scrollAnchors.__begin_ = v105;
          self->_scrollAnchors.__end_ = v98;
          self->_scrollAnchors.__end_cap_.__value_ = (double *)&v104[8 * v103];
          if (v99) {
            operator delete(v99);
          }
        }
        else
        {
          double *v90 = v97;
          v98 = v90 + 1;
        }
        self->_scrollAnchors.__end_ = v98;
        uint64_t v108 = *v92;
        uint64_t v107 = v92[1];
        v92 += 3;
        v94 += (v107 - v108) >> 4;
        v90 = v98;
      }
      while (v92 != v93);
    }
  }
  else
  {
    if (v155 == (unsigned char *)&def_141F14 + 2) {
      double v109 = -v150;
    }
    else {
      double v109 = v150;
    }
    v110 = self->_cells.__begin_;
    v111 = self->_cells.__end_;
    if (v110 != v111)
    {
      uint64_t v112 = 0;
      v113 = &self->_scrollAnchors.__end_cap_;
      do
      {
        if (v155 == (unsigned char *)&def_141F14 + 2)
        {
          double v114 = v150 + v152;
          if (v156) {
            double v114 = 0.0;
          }
          double v115 = *(v158 - 1) - *(double *)v157 - v153 + v114 - *((double *)v157 + v112);
        }
        else
        {
          double v115 = *((double *)v157 + v112);
        }
        double v116 = v115 - v109;
        if (v90 >= v113->__value_)
        {
          v118 = p_scrollAnchors->__begin_;
          uint64_t v119 = v90 - p_scrollAnchors->__begin_;
          unint64_t v120 = v119 + 1;
          if ((unint64_t)(v119 + 1) >> 61) {
            sub_4484();
          }
          uint64_t v121 = (char *)v113->__value_ - (char *)v118;
          if (v121 >> 2 > v120) {
            unint64_t v120 = v121 >> 2;
          }
          if ((unint64_t)v121 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v122 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v122 = v120;
          }
          if (v122)
          {
            v123 = (char *)sub_39FA0((uint64_t)&self->_scrollAnchors.__end_cap_, v122);
            v118 = self->_scrollAnchors.__begin_;
            v90 = self->_scrollAnchors.__end_;
          }
          else
          {
            v123 = 0;
          }
          v124 = (double *)&v123[8 * v119];
          double *v124 = v116;
          v117 = v124 + 1;
          while (v90 != v118)
          {
            uint64_t v125 = *((void *)v90-- - 1);
            *((void *)v124-- - 1) = v125;
          }
          self->_scrollAnchors.__begin_ = v124;
          self->_scrollAnchors.__end_ = v117;
          self->_scrollAnchors.__end_cap_.__value_ = (double *)&v123[8 * v122];
          if (v118) {
            operator delete(v118);
          }
        }
        else
        {
          double *v90 = v116;
          v117 = v90 + 1;
        }
        self->_scrollAnchors.__end_ = v117;
        ++v112;
        v110 = (CellInfo *)((char *)v110 + 40);
        v90 = v117;
      }
      while (v110 != v111);
    }
  }
  sub_96488((uint64_t *)&v134);
  sub_95630((id *)&v134, (uint64_t *)&__p[1], (uint64_t)&v160, (uint64_t)&v148, &v160, CGPointZero.x, CGPointZero.y);
  v126 = (NSArray *)[*(id *)&v134.width copy];
  CGFloat v127 = v25 + v40 + v129;
  nonScrollableAdornmentLayouts = self->_nonScrollableAdornmentLayouts;
  self->_nonScrollableAdornmentLayouts = v126;

  self->_contentLayoutSize.double width = v50;
  self->_contentLayoutSize.double height = v127;
  self->_layoutSize.double width = v130;
  self->_layoutSize.double height = v127;

  if (__p[1])
  {
    *(void **)&long long v147 = __p[1];
    operator delete(__p[1]);
  }
  *(void *)&v134.double width = &v145;
  sub_964DC((void ***)&v134);
  if (v157)
  {
    v158 = (double *)v157;
    operator delete(v157);
  }
  if (v167)
  {
    v168 = v167;
    operator delete(v167);
  }
  if (v165)
  {
    v166 = v165;
    operator delete(v165);
  }
  if (v163)
  {
    v164 = v163;
    operator delete(v163);
  }
  *(void *)&long long v138 = v162;
  sub_6427C((void ***)&v138);
  *(void *)&long long v138 = &v160;
  sub_644C0((void ***)&v138);
}

- (id)scrollPolicy
{
  if (!self->_scrollPolicy
    && [(TUISmartGridLayoutConfiguration *)self->_configuration paginated])
  {
    unsigned int v3 = [[TUICellScrollPolicy alloc] initWithCells:&self->_cells];
    scrollPolicdouble y = self->_scrollPolicy;
    self->_scrollPolicdouble y = v3;
  }
  double v5 = self->_scrollPolicy;

  return v5;
}

- (UIEdgeInsets)scrollGradientInsets
{
  [(TUISmartGridLayoutConfiguration *)self->_configuration gradientInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)scrollGradientFraction
{
  [(TUISmartGridLayoutConfiguration *)self->_configuration gradientFraction];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)appendAnchorsToSet:(id)a3 forLayout:(id)a4 inRoot:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 axis] == (char *)&def_141F14 + 1)
  {
    double height = self->_contentLayoutSize.height;
    long long v15 = 0u;
    if (v9) {
      [v9 computedTransformInAncestorLayout:v10];
    }
    begin = self->_scrollAnchors.__begin_;
    end = self->_scrollAnchors.__end_;
    if (begin != end)
    {
      double v14 = height * 0.5;
      do
        [v8 appendScrollAnchor:v14 * 0.0 + *(double *)&v15 * *begin++ + 0.0 v15];
      while (begin != end);
    }
  }
}

- (void)appendAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7
{
  long long v7 = *(_OWORD *)&a4->c;
  v8[0] = *(_OWORD *)&a4->a;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&a4->tx;
  sub_63ADC((uint64_t)&self->_cellDividers, a3, (double *)v8, a5, a7);
}

- (void)appendNonScrollableAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7
{
  id v11 = a5;
  id v12 = a7;
  double width = self->_layoutSize.width;
  double height = self->_layoutSize.height;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v15 = self->_nonScrollableAdornmentLayouts;
  id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v34;
    double v18 = -width;
    double v19 = -height;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [v21 computedOrigin];
        double v23 = v22;
        double v25 = v24;
        [v21 computedTransformedSize];
        memset(&v32, 0, sizeof(v32));
        CGAffineTransformMakeTranslation(&t1, v23 + v26 * 0.5 + v18 * 0.5, v25 + v27 * 0.5 + v19 * 0.5);
        long long v28 = *(_OWORD *)&a4->c;
        *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
        *(_OWORD *)&t2.c = v28;
        *(_OWORD *)&t2.tdouble x = *(_OWORD *)&a4->tx;
        CGAffineTransformConcat(&v32, &t1, &t2);
        CGAffineTransform v29 = v32;
        [v21 appendRenderModelIgnoreHiddenCompatibleWithKind:a3 context:v11 transform:&v29 toModels:v12];
      }
      id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v16);
  }
}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v9 = a4;
  id v59 = a6;
  if (a3 >= 4)
  {
    int64_t v10 = self->_cells.__end_ - self->_cells.__begin_;
    if (v10)
    {
      uint64_t v11 = 0;
      unint64_t v12 = v10 / 40;
      double v57 = -self->_contentLayoutSize.height;
      double v58 = -self->_contentLayoutSize.width;
      if (v12 <= 1) {
        unint64_t v12 = 1;
      }
      unint64_t v56 = v12;
      do
      {
        double v13 = (double *)((char *)self->_cells.__begin_ + 40 * v11);
        double v15 = *v13;
        double v14 = v13[1];
        double v17 = v13[2];
        double v16 = v13[3];
        memset(&v81, 0, sizeof(v81));
        CGAffineTransformMakeTranslation(&v81, v17 * 0.5, v16 * 0.5);
        double v18 = objc_opt_new();
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        double v19 = [(NSArray *)self->_cellLayouts objectAtIndexedSubscript:v11];
        id v20 = [v19 countByEnumeratingWithState:&v77 objects:v82 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v78;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v78 != v21) {
                objc_enumerationMutation(v19);
              }
              double v23 = *(void **)(*((void *)&v77 + 1) + 8 * i);
              [v23 computedOrigin:v56];
              double v25 = v24;
              double v27 = v26;
              [v23 computedTransformedSize];
              memset(&v76, 0, sizeof(v76));
              CGAffineTransformMakeTranslation(&t1, v25 - v15 + v28 * 0.5 + -v17 * 0.5, v27 - v14 + v29 * 0.5 + -v16 * 0.5);
              CGAffineTransform t2 = v81;
              CGAffineTransformConcat(&v76, &t1, &t2);
              CGAffineTransform v73 = v76;
              [v23 appendRenderModelCompatibleWithKind:a3 context:v9 transform:&v73 toModels:v18];
            }
            id v20 = [v19 countByEnumeratingWithState:&v77 objects:v82 count:16];
          }
          while (v20);
        }

        CGAffineTransformMakeTranslation(&v72, v15 + v17 * 0.5 + v58 * 0.5, v14 + v16 * 0.5 + v57 * 0.5);
        long long v30 = *(_OWORD *)&a5->c;
        *(_OWORD *)&v71.double a = *(_OWORD *)&a5->a;
        *(_OWORD *)&v71.double c = v30;
        *(_OWORD *)&v71.tdouble x = *(_OWORD *)&a5->tx;
        CGAffineTransformConcat(&v76, &v72, &v71);
        CGAffineTransform v81 = v76;
        uint64_t v31 = [TUIRenderModelSubviews alloc];
        CGAffineTransform v32 = [v9 renderModelConvertModels:v18 toKind:a3];
        long long v33 = [(TUIRenderModelSubviews *)v31 initWithSubmodels:v32];

        -[TUIRenderModelSubviews setSize:](v33, "setSize:", v17, v16);
        long long v34 = [*((id *)self->_cells.__begin_ + 5 * v11 + 4) tui_identifierByAppendingString:@"cell"];
        long long v35 = +[TUIContainerView renderModelWithSubviewsModel:v33 style:0 identifier:v34];

        long long v36 = [[TUIRenderModelTransform alloc] initWithSubmodel:v35];
        double y = CGPointZero.y;
        double d = v81.d;
        long long v64 = *(_OWORD *)&v81.a;
        tdouble x = v81.tx;
        double c = v81.c;
        tdouble y = v81.ty;
        [v35 size];
        double v67 = v37;
        [v35 size];
        double v39 = v38;
        double a = a5->a;
        double b = a5->b;
        double v42 = a5->c;
        double v43 = a5->d;
        double v44 = a5->tx;
        double v45 = a5->ty;
        [v9 contentsScale];
        double v46 = v44 + v39 * -0.5 * v42 + a * (v67 * -0.5);
        double v47 = v45 + v39 * -0.5 * v43 + b * (v67 * -0.5);
        double v49 = tx + y * c + *(double *)&v64 * CGPointZero.x + TUIPointRoundedForScale(v46, v47, v48) - v46;
        double v51 = ty + y * d + *((double *)&v64 + 1) * CGPointZero.x + v50 - v47;
        memset(&v76, 0, sizeof(v76));
        CGAffineTransform v70 = v81;
        CGAffineTransformMakeTranslation(&v69, -v49, -v51);
        CGAffineTransformConcat(&v76, &v70, &v69);
        double v52 = v76.tx;
        [v9 contentsScale];
        v76.tdouble x = TUIFloatRoundedForScale(v52, v53);
        double v54 = v76.ty;
        [v9 contentsScale];
        v76.tdouble y = TUIFloatRoundedForScale(v54, v55);
        -[TUIRenderModelTransform setCenter:](v36, "setCenter:", v49, v51);
        CGAffineTransform v68 = v76;
        [(TUIRenderModelTransform *)v36 setTransform:&v68];
        [v59 addObject:v36];

        ++v11;
      }
      while (v11 != v56);
    }
  }
}

- (void)appendHoverRegions:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  begin = self->_cells.__begin_;
  for (i = self->_cells.__end_; begin != i; begin = (CellInfo *)((char *)begin + 40))
  {
    CGRect v19 = *(CGRect *)begin;
    long long v9 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v18.double a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v18.double c = v9;
    *(_OWORD *)&v18.tdouble x = *(_OWORD *)&a4->tx;
    CGRect v20 = CGRectApplyAffineTransform(v19, &v18);
    double x = v20.origin.x;
    double y = v20.origin.y;
    double width = v20.size.width;
    double height = v20.size.height;
    double v14 = [TUIHoverIdentifier alloc];
    id v15 = *((id *)begin + 4);
    double v16 = [(TUIHoverIdentifier *)v14 initWithName:@"cell" identifier:v15];

    double v17 = -[TUIHoverRegion initWithBounds:]([TUIHoverRegion alloc], "initWithBounds:", x, y, width, height);
    [v6 setObject:v17 forKeyedSubscript:v16];
  }
}

- (TUISmartGridContentBox)content
{
  return self->_content;
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

- (double)computedColumnWidth
{
  return self->_computedColumnWidth;
}

- (double)computedColumnSpacing
{
  return self->_computedColumnSpacing;
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
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_scrollPolicy, 0);
  objc_storeStrong((id *)&self->_nonScrollableAdornmentLayouts, 0);
  objc_storeStrong((id *)&self->_cellLayouts, 0);
  p_begin = &self->_cellDividers._positions.__begin_;
  sub_641FC(&p_begin);

  p_begin = (void **)&self->_cells.__begin_;
  sub_98550(&p_begin);
  begin = self->_scrollAnchors.__begin_;
  if (begin)
  {
    self->_scrollAnchors.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(CGSize *)((char *)self + 56) = CGSizeZero;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  return self;
}

@end