@interface TUISmartGridGridLayoutManager
+ (void)configureContentLayout:(id)a3 configuration:(id)a4;
+ (void)configureScrollLayout:(id)a3 configuration:(id)a4;
- (BOOL)list;
- (CGSize)contentLayoutSize;
- (CGSize)layoutSize;
- (TUISmartGridContentBox)content;
- (TUISmartGridGridLayoutManager)initWithContent:(id)a3;
- (TUISmartGridLayoutConfiguration)configuration;
- (double)computedColumnSpacing;
- (double)computedColumnWidth;
- (double)widthForColumnSpan:(unint64_t)a3;
- (id).cxx_construct;
- (unint64_t)computedColumns;
- (unint64_t)ruleLayoutAxis;
- (void)appendAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7;
- (void)appendAnchorsToSet:(id)a3 forLayout:(id)a4 inRoot:(id)a5;
- (void)appendHoverRegions:(id)a3 transform:(CGAffineTransform *)a4;
- (void)layoutContent:(id)a3;
- (void)positionContainerLayout:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setList:(BOOL)a3;
@end

@implementation TUISmartGridGridLayoutManager

- (TUISmartGridGridLayoutManager)initWithContent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUISmartGridGridLayoutManager;
  v6 = [(TUISmartGridGridLayoutManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_content, a3);
  }

  return v7;
}

+ (void)configureScrollLayout:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [v5 width];
  [v6 setContainingWidth:];
  [v5 height];
  [v6 setContainingHeight:];
}

+ (void)configureContentLayout:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [v5 width];
  [v6 setContainingWidth:];
}

- (double)widthForColumnSpan:(unint64_t)a3
{
  if (a3) {
    return -(self->_computedColumnSpacing - (self->_computedColumnWidth + self->_computedColumnSpacing) * (double)a3);
  }
  else {
    return 0.0;
  }
}

- (unint64_t)ruleLayoutAxis
{
  if (self->_list) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)layoutContent:(id)a3
{
  id v120 = a3;
  id v4 = [v120 computedLayoutDirection];
  [(TUISmartGridLayoutConfiguration *)self->_configuration width];
  double v6 = v5;
  [(TUISmartGridLayoutConfiguration *)self->_configuration contentInsets];
  double v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  CGFloat v14 = v13;
  self->_unint64_t computedColumns = +[TUISmartGridBox columnsWithConfiguration:self->_configuration];
  id v15 = [(TUISmartGridLayoutConfiguration *)self->_configuration columnSpacing];
  self->_double computedColumnSpacing = TUILengthValueWithDefault((uint64_t)v15, v16, 0.0);
  +[TUISmartGridBox columnWidthWithConfiguration:columns:spacing:](TUISmartGridBox, "columnWidthWithConfiguration:columns:spacing:", self->_configuration, self->_computedColumns);
  self->_double computedColumnWidth = v17;
  id v18 = [(TUISmartGridLayoutConfiguration *)self->_configuration rowSpacing];
  self->_double computedRowSpacing = TUILengthValueWithDefault((uint64_t)v18, v19, 0.0);
  v20 = [v120 children];
  sub_64720((uint64_t)&v145, v20, self->_content, 1);

  unint64_t computedColumns = self->_computedColumns;
  uint64_t v149 = 1;
  begin = self->_scrollAnchors.__begin_;
  if (begin != self->_scrollAnchors.__end_) {
    self->_scrollAnchors.__end_ = begin;
  }
  p_cellBounds = &self->_cellBounds;
  sub_62030((uint64_t)&self->_cellBounds, (uint64_t)self->_cellBounds.__begin_, (uint64_t *)self->_cellBounds.__end_);
  unint64_t v22 = computedColumns;
  unint64_t v23 = v149;
  double computedColumnWidth = self->_computedColumnWidth;
  double computedColumnSpacing = self->_computedColumnSpacing;
  double computedRowSpacing = self->_computedRowSpacing;
  v27 = [v120 controller];
  [v27 contentsScale];
  double v29 = computedColumnWidth;
  double v30 = computedColumnSpacing;
  if (v22 >= 2)
  {
    double v29 = computedColumnWidth;
    double v30 = computedColumnSpacing;
    if (computedColumnSpacing != 0.0)
    {
      double v29 = computedColumnWidth;
      if (v28 > 0.0) {
        double v29 = floor(computedColumnWidth * v28) / v28;
      }
      double v30 = ((computedColumnWidth - v29) * (double)v22 + computedColumnSpacing * (double)(v22 - 1)) / (double)(v22 - 1);
    }
  }
  self->_columnSystem._double containerWidth = v6;
  self->_columnSystem._columns = v22;
  self->_columnSystem._rows = v23;
  self->_columnSystem._insets.top = v8;
  self->_columnSystem._insets.left = v10;
  self->_columnSystem._insets.bottom = v12;
  self->_columnSystem._insets.right = v14;
  self->_columnSystem._specifiedColumnWidth = computedColumnWidth;
  self->_columnSystem._specifiedColumnSpacing = computedColumnSpacing;
  self->_columnSystem._double computedColumnWidth = v29;
  self->_columnSystem._double computedColumnSpacing = v30;
  self->_columnSystem._rowSpacing = computedRowSpacing;
  self->_columnSystem._layoutDirection = (unint64_t)v4;
  self->_columnSystem._contentsScale = v28;
  self->_columnSystem._columnsPerPage = 0;

  unint64_t v31 = (unint64_t)[(TUISmartGridLayoutConfiguration *)self->_configuration verticalPlacement];
  if (v31 >= 7) {
    int v32 = 5;
  }
  else {
    int v32 = dword_243340[v31];
  }
  int v126 = v32;
  v33 = (void *)sub_620A0((uint64_t)&v145, (char *)&dword_4 + 2);
  if ((void *)v147[1] == v33)
  {
    *(CGSize *)v135 = CGSizeZero;
    *(_OWORD *)&v135[16] = 0u;
    long long v136 = 0u;
    sub_625C8((uint64_t)&self->_cellDividers, (uint64_t)v135);
    v156[0] = (void **)&v135[24];
    sub_641FC(v156);
  }
  else
  {
    double v34 = sub_62124((uint64_t)&self->_columnSystem, 0, 1uLL);
    sub_68438((uint64_t)&v144, 0, v33[5], v33[6], v34);
    uint64_t v36 = v35;
    uint64_t v38 = v37;
    v33[9] = v35;
    v33[10] = v37;
    sub_622EC((uint64_t)v33, 1);
    v39 = objc_opt_new();
    sub_62424(&v145, v33, v39);
    *(void *)v135 = v36;
    *(void *)&v135[8] = v38;
    *(_OWORD *)&v135[16] = (unint64_t)v39;
    long long v136 = 0uLL;
    id v40 = v39;
    sub_625C8((uint64_t)&self->_cellDividers, (uint64_t)v135);
    v156[0] = (void **)&v135[24];
    sub_641FC(v156);
  }
  double containerWidth = self->_columnSystem._containerWidth;
  double v42 = containerWidth - sub_62620((uint64_t)&self->_columnSystem);
  if (v42 <= 0.0) {
    double v43 = 0.0;
  }
  else {
    double v43 = v42 * 0.5;
  }
  v44 = v145;
  v121 = v146;
  if (v145 != v146)
  {
    uint64_t v123 = 0;
    p_cellDividers = &self->_cellDividers;
    while (1)
    {
      uint64_t v45 = v44[3];
      uint64_t v46 = v44[4];
      while (v45 != v46)
      {
        id v47 = *(id *)(v45 + 32);
        if ([v47 role] == (char *)&def_141F14 + 3)
        {
        }
        else
        {
          id v48 = *(id *)(v45 + 32);
          v49 = (int *)[v48 role];

          if (v49 != &dword_4) {
            goto LABEL_25;
          }
        }
        *(void *)uint64_t v45 = 0;
        unint64_t v50 = self->_computedColumns;
        *(void *)(v45 + 8) = 0;
        *(void *)(v45 + 16) = v50;
        *(void *)(v45 + 24) = 1;
LABEL_25:
        v45 += 96;
      }
      *(void *)&long long v133 = &v145;
      *((void *)&v133 + 1) = v123;
      long long v134 = (unint64_t)(v123 + 1);
      sub_68774((uint64_t)&v133);
      *(void *)&long long v131 = &v145;
      *((void *)&v131 + 1) = v123 + 1;
      long long v132 = (unint64_t)(v123 + 1);
      sub_68774((uint64_t)&v131);
      *(_OWORD *)v135 = v133;
      *(_OWORD *)&v135[16] = v134;
      long long v136 = v131;
      long long v137 = v132;
      double v138 = v43;
      double v139 = v8;
      int v140 = 0;
      v142 = 0;
      uint64_t v143 = 0;
      __p = 0;
      sub_62778((uint64_t)v135, (uint64_t)&self->_columnSystem, &v145, 0);
      double v53 = *(double *)v52.i64;
      if (__p)
      {
        v142 = __p;
        operator delete(__p);
      }
      unint64_t v122 = v123 + 1;
      double v54 = v8 + v53;
      uint64_t v56 = *v44;
      uint64_t v55 = v44[1];
      if (*v44 == v55)
      {
        int v57 = 0;
      }
      else
      {
        int v57 = 0;
        unint64_t v58 = 0;
        unint64_t v59 = self->_computedColumns;
        if (v59 == 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v60 = -1;
        }
        else {
          unint64_t v60 = v59 - 1;
        }
        uint64_t v61 = *v44;
        do
        {
          if (v60 < v58)
          {
            if (v57 >= 1) {
              sub_62C98((uint64_t)p_cellDividers, (uint64_t)&self->_columnSystem, v56, v61, v43, v54);
            }
            *(void *)v135 = v56;
            *(void *)&v135[8] = v61;
            *(double *)&v135[16] = v43;
            *(double *)&v135[24] = v54;
            double v138 = 0.0;
            double v139 = 0.0;
            *((void *)&v137 + 1) = 0;
            LODWORD(v136) = v126;
            v62 = v145;
            unint64_t v63 = 1;
            while (v62 != v146)
            {
              for (uint64_t i = *v62; i != v62[1]; i += 96)
              {
                uint64_t v65 = *(void *)(i + 48);
                if ((*(void *)(i + 56) - v65) >> 6 > v63) {
                  unint64_t v63 = (*(void *)(i + 56) - v65) >> 6;
                }
              }
              v62 += 11;
            }
            sub_62DA4((uint64_t)v135, (uint64_t)&self->_columnSystem, &v145, v63);
            double v66 = *(double *)v52.i64;
            double v67 = self->_computedRowSpacing;
            if (*((void *)&v137 + 1))
            {
              double v138 = *((double *)&v137 + 1);
              operator delete(*((void **)&v137 + 1));
            }
            unint64_t v58 = 0;
            double v54 = v54 + v66 + v67;
            ++v57;
            uint64_t v56 = v61;
          }
          if (self->_list) {
            unint64_t v68 = self->_computedColumns;
          }
          else {
            unint64_t v68 = 1;
          }
          v51.i64[0] = v60;
          v52.i64[0] = v58;
          int8x16_t v69 = (int8x16_t)vdupq_lane_s64(vmvnq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v52, v51)).i64[0], 0);
          int8x16_t v52 = (int8x16_t)vdupq_n_s64(1uLL);
          v52.i64[0] = v68;
          uint64x2_t v51 = (uint64x2_t)vandq_s8(v52, v69);
          unint64_t v70 = v68 + v58;
          if (v60 >= v58) {
            unint64_t v71 = v58;
          }
          else {
            unint64_t v71 = 0;
          }
          if (v60 >= v58) {
            unint64_t v58 = v70;
          }
          *(void *)uint64_t v61 = v71;
          *(void *)(v61 + 8) = 0;
          *(uint64x2_t *)(v61 + 16) = v51;
          v61 += 96;
        }
        while (v61 != v55);
        if (v56 != v55)
        {
          if (v57 >= 1) {
            sub_62C98((uint64_t)p_cellDividers, (uint64_t)&self->_columnSystem, v56, v55, v43, v54);
          }
          *(void *)v135 = v56;
          *(void *)&v135[8] = v55;
          *(double *)&v135[16] = v43;
          *(double *)&v135[24] = v54;
          double v138 = 0.0;
          double v139 = 0.0;
          *((void *)&v137 + 1) = 0;
          LODWORD(v136) = v126;
          v72 = v145;
          unint64_t v73 = 1;
          while (v72 != v146)
          {
            for (uint64_t j = *v72; j != v72[1]; j += 96)
            {
              uint64_t v75 = *(void *)(j + 48);
              if ((*(void *)(j + 56) - v75) >> 6 > v73) {
                unint64_t v73 = (*(void *)(j + 56) - v75) >> 6;
              }
            }
            v72 += 11;
          }
          sub_62DA4((uint64_t)v135, (uint64_t)&self->_columnSystem, &v145, v73);
          double v77 = v76;
          double v78 = self->_computedRowSpacing;
          if (*((void *)&v137 + 1))
          {
            double v138 = *((double *)&v137 + 1);
            operator delete(*((void **)&v137 + 1));
          }
          double v54 = v54 + v77 + v78;
          ++v57;
        }
      }
      uint64_t v79 = *v44;
      uint64_t v80 = v44[1];
      while (v79 != v80)
      {
        if (!*(unsigned char *)(v79 + 40))
        {
          uint64_t v82 = *(void *)(v79 + 48);
          uint64_t v81 = *(void *)(v79 + 56);
          if (v82 == v81)
          {
            double x = CGRectNull.origin.x;
            double y = CGRectNull.origin.y;
            double width = CGRectNull.size.width;
            double height = CGRectNull.size.height;
          }
          else
          {
            double x = *(double *)(v82 + 32);
            double y = *(double *)(v82 + 40);
            double width = *(double *)(v81 - 32) + *(double *)(v81 - 16) - x;
            double height = *(double *)(v81 - 24) + *(double *)(v81 - 8) - y;
          }
          v157.origin.double x = x;
          v157.origin.double y = y;
          v157.size.double width = width;
          v157.size.double height = height;
          if (!CGRectIsNull(v157))
          {
            id v87 = *(id *)(v79 + 32);
            id v88 = v87;
            end = (char *)self->_cellBounds.__end_;
            value = (char *)self->_cellBounds.__end_cap_.__value_;
            if (end >= value)
            {
              v92 = (char *)p_cellBounds->__begin_;
              unint64_t v93 = 0xCCCCCCCCCCCCCCCDLL * ((end - (char *)p_cellBounds->__begin_) >> 3);
              unint64_t v94 = v93 + 1;
              if (v93 + 1 > 0x666666666666666) {
                sub_4484();
              }
              unint64_t v95 = 0xCCCCCCCCCCCCCCCDLL * ((value - v92) >> 3);
              if (2 * v95 > v94) {
                unint64_t v94 = 2 * v95;
              }
              if (v95 >= 0x333333333333333) {
                unint64_t v96 = 0x666666666666666;
              }
              else {
                unint64_t v96 = v94;
              }
              *(void *)&long long v136 = &self->_cellBounds.__end_cap_;
              if (v96)
              {
                v97 = (char *)sub_69ED0((uint64_t)&self->_cellBounds.__end_cap_, v96);
                v92 = (char *)self->_cellBounds.__begin_;
                end = (char *)self->_cellBounds.__end_;
              }
              else
              {
                v97 = 0;
              }
              v98 = (double *)&v97[40 * v93];
              *(void *)v98 = v88;
              v98[1] = x;
              v98[2] = y;
              v98[3] = width;
              v98[4] = height;
              if (end == v92)
              {
                int64x2_t v102 = vdupq_n_s64((unint64_t)v92);
                v99 = &v97[40 * v93];
              }
              else
              {
                v99 = &v97[40 * v93];
                do
                {
                  uint64_t v100 = *((void *)end - 5);
                  end -= 40;
                  *(void *)end = 0;
                  *((void *)v99 - 5) = v100;
                  v99 -= 40;
                  long long v101 = *(_OWORD *)(end + 8);
                  *(_OWORD *)(v99 + 24) = *(_OWORD *)(end + 24);
                  *(_OWORD *)(v99 + 8) = v101;
                }
                while (end != v92);
                int64x2_t v102 = *(int64x2_t *)&p_cellBounds->__begin_;
              }
              v91 = v98 + 5;
              self->_cellBounds.__begin_ = v99;
              self->_cellBounds.__end_ = v98 + 5;
              *(int64x2_t *)&v135[8] = v102;
              v103 = self->_cellBounds.__end_cap_.__value_;
              self->_cellBounds.__end_cap_.__value_ = &v97[40 * v96];
              *(void *)&v135[24] = v103;
              *(void *)v135 = v102.i64[0];
              sub_69F18((uint64_t)v135);
            }
            else
            {
              *(void *)end = v87;
              *((double *)end + 1) = x;
              *((double *)end + 2) = y;
              v91 = end + 40;
              *((double *)end + 3) = width;
              *((double *)end + 4) = height;
            }
            self->_cellBounds.__end_ = v91;
          }
        }
        v79 += 96;
      }
      if (v57 > 0) {
        double v54 = v54 - self->_computedRowSpacing;
      }
      *(void *)&long long v129 = &v145;
      *((void *)&v129 + 1) = v123;
      long long v130 = v122;
      sub_69F6C((uint64_t)&v129);
      *(void *)&long long v127 = &v145;
      *((void *)&v127 + 1) = v123 + 1;
      long long v128 = v122;
      sub_69F6C((uint64_t)&v127);
      *(_OWORD *)v135 = v129;
      *(_OWORD *)&v135[16] = v130;
      long long v136 = v127;
      long long v137 = v128;
      double v138 = v43;
      double v139 = v54;
      int v140 = 0;
      v142 = 0;
      uint64_t v143 = 0;
      __p = 0;
      sub_631A8((uint64_t)v135, (uint64_t)&self->_columnSystem, &v145, 0);
      double v105 = v104;
      if (__p)
      {
        v142 = __p;
        operator delete(__p);
      }
      double v8 = v54 + v105;
      v44 += 11;
      ++v123;
      if (v44 == v121)
      {
        v106 = v145;
        v107 = v146;
        while (v106 != v107)
        {
          uint64_t v108 = *v106;
          uint64_t v109 = v106[1];
          while (v108 != v109)
          {
            if (*(void *)(v108 + 16)) {
              BOOL v110 = *(void *)(v108 + 24) == 0;
            }
            else {
              BOOL v110 = 1;
            }
            uint64_t v111 = v110;
            sub_636C8(v108, v111);
            v108 += 96;
          }
          uint64_t v112 = v106[3];
          uint64_t v113 = v106[4];
          while (v112 != v113)
          {
            if (*(void *)(v112 + 16)) {
              BOOL v114 = *(void *)(v112 + 24) == 0;
            }
            else {
              BOOL v114 = 1;
            }
            uint64_t v115 = v114;
            sub_622EC(v112, v115);
            v112 += 96;
          }
          v106 += 11;
        }
        break;
      }
    }
  }
  [(TUISmartGridLayoutConfiguration *)self->_configuration height];
  double v117 = v116;
  [(TUISmartGridLayoutConfiguration *)self->_configuration specifiedHeight];
  if ((v118 & 0x6000000000000) == 0x2000000000000) {
    double v119 = v12 + v8;
  }
  else {
    double v119 = v117;
  }
  self->_contentLayoutSize.double width = v6;
  self->_contentLayoutSize.double height = v12 + v8;
  self->_layoutSize.double width = v6;
  self->_layoutSize.double height = v119;
  if (v154)
  {
    v155 = v154;
    operator delete(v154);
  }
  if (v152)
  {
    v153 = v152;
    operator delete(v152);
  }
  if (v150)
  {
    v151 = v150;
    operator delete(v150);
  }
  *(void *)v135 = v147;
  sub_6427C((void ***)v135);
  *(void *)v135 = &v145;
  sub_644C0((void ***)v135);
}

- (void)positionContainerLayout:(id)a3
{
}

- (void)appendAnchorsToSet:(id)a3 forLayout:(id)a4 inRoot:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 axis] == (char *)&def_141F14 + 2)
  {
    double width = self->_contentLayoutSize.width;
    uint64_t v15 = 0;
    if (v9) {
      [v9 computedTransformInAncestorLayout:v10];
    }
    begin = self->_scrollAnchors.__begin_;
    end = self->_scrollAnchors.__end_;
    if (begin != end)
    {
      double v14 = width * 0.5;
      do
        [v8 appendScrollAnchor:[*begin++ * 0.0 + 0.0 * v14 + 0.0] v15];
      while (begin != end);
    }
  }
}

- (void)appendAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  long long v15 = *(_OWORD *)&a4->c;
  v22[0] = *(_OWORD *)&a4->a;
  v22[1] = v15;
  v22[2] = *(_OWORD *)&a4->tx;
  sub_63ADC((uint64_t)&self->_cellDividers, a3, (double *)v22, v12, v14);
  if (a3 >= 4 && [v12 debugVisualLayout])
  {
    double width = self->_contentLayoutSize.width;
    double height = self->_contentLayoutSize.height;
    id v18 = [v13 identifier];
    long long v19 = *(_OWORD *)&a4->c;
    v21[0] = *(_OWORD *)&a4->a;
    v21[1] = v19;
    v21[2] = *(_OWORD *)&a4->tx;
    v20 = +[TUISmartGridDebugRenderModel renderModelWithSize:columnSystem:identifier:transform:](TUISmartGridDebugRenderModel, "renderModelWithSize:columnSystem:identifier:transform:", &self->_columnSystem, v18, v21, width, height);

    [v14 addObject:v20];
  }
}

- (void)appendHoverRegions:(id)a3 transform:(CGAffineTransform *)a4
{
  id v6 = a3;
  begin = (id *)self->_cellBounds.__begin_;
  for (uint64_t i = (id *)self->_cellBounds.__end_; begin != i; begin += 5)
  {
    id v9 = *begin;
    id v10 = begin[1];
    id v11 = begin[2];
    id v12 = begin[3];
    id v13 = begin[4];
    id v14 = v9;
    long long v15 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v27.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v27.c = v15;
    *(_OWORD *)&v27.tdouble x = *(_OWORD *)&a4->tx;
    id v16 = v10;
    *(void *)&long long v15 = v11;
    id v17 = v12;
    id v18 = v13;
    CGRect v28 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v15 - 8), &v27);
    double x = v28.origin.x;
    double y = v28.origin.y;
    double width = v28.size.width;
    double height = v28.size.height;
    unint64_t v23 = [TUIHoverIdentifier alloc];
    v24 = [v14 identifier];
    v25 = [(TUIHoverIdentifier *)v23 initWithName:@"cell" identifier:v24];

    v26 = -[TUIHoverRegion initWithBounds:]([TUIHoverRegion alloc], "initWithBounds:", x, y, width, height);
    [v6 setObject:v26 forKeyedSubscript:v25];
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

- (BOOL)list
{
  return self->_list;
}

- (void)setList:(BOOL)a3
{
  self->_list = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_content, 0);
  p_begin = &self->_cellDividers._positions.__begin_;
  sub_641FC(&p_begin);

  p_begin = &self->_cellBounds.__begin_;
  sub_6A678(&p_begin);
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
  *(_OWORD *)((char *)self + 104) = 0u;
  *((void *)self + 15) = 0;
  long long v2 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *((_OWORD *)self + 8) = *(_OWORD *)&UIEdgeInsetsZero.top;
  *((_OWORD *)self + 9) = v2;
  *((void *)self + 27) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 24) = 0;
  *((void *)self + 25) = 0;
  return self;
}

@end