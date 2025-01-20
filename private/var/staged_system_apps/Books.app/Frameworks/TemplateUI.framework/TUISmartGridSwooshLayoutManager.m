@interface TUISmartGridSwooshLayoutManager
+ (void)configureContentLayout:(id)a3 configuration:(id)a4;
+ (void)configureScrollLayout:(id)a3 configuration:(id)a4;
- (CGSize)contentLayoutSize;
- (CGSize)layoutSize;
- (TUISmartGridContentBox)content;
- (TUISmartGridLayoutConfiguration)configuration;
- (TUISmartGridSwooshLayoutManager)initWithContent:(id)a3;
- (UIEdgeInsets)scrollGradientFraction;
- (UIEdgeInsets)scrollGradientInsets;
- (double)computedColumnSpacing;
- (double)computedColumnWidth;
- (double)widthForColumnSpan:(unint64_t)a3;
- (id).cxx_construct;
- (unint64_t)computedColumns;
- (unint64_t)ruleLayoutAxis;
- (void)appendAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7;
- (void)appendAnchorsToSet:(id)a3 forLayout:(id)a4 inRoot:(id)a5;
- (void)appendHoverRegions:(id)a3 transform:(CGAffineTransform *)a4;
- (void)appendNonScrollableAdornmentRenderModelsCompatibleWithKind:(unint64_t)a3 transform:(CGAffineTransform *)a4 context:(id)a5 box:(id)a6 toModels:(id)a7;
- (void)layoutContent:(id)a3;
- (void)positionContainerLayout:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation TUISmartGridSwooshLayoutManager

- (TUISmartGridSwooshLayoutManager)initWithContent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUISmartGridSwooshLayoutManager;
  v6 = [(TUISmartGridSwooshLayoutManager *)&v9 init];
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
  [v7 setComputedOrigin:v5, 0.0];
}

- (unint64_t)ruleLayoutAxis
{
  v2 = (char *)[(TUISmartGridLayoutConfiguration *)self->_configuration rows];
  if (v2 == (char *)0x7FFFFFFFFFFFFFFFLL || v2 == (unsigned char *)&def_141F14 + 1) {
    return 2;
  }
  else {
    return 1;
  }
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

- (void)layoutContent:(id)a3
{
  id v280 = a3;
  v278 = (char *)[v280 computedLayoutDirection];
  [(TUISmartGridLayoutConfiguration *)self->_configuration contentInsets];
  double v276 = v5;
  double v277 = v4;
  double v7 = v6;
  double v9 = v8;
  [(TUISmartGridLayoutConfiguration *)self->_configuration width];
  CGFloat v279 = v10;
  double v11 = (char *)[(TUISmartGridLayoutConfiguration *)self->_configuration rows];
  if ([(TUISmartGridLayoutConfiguration *)self->_configuration maxPages] == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v12 = 0;
  }
  else {
    id v12 = [(TUISmartGridLayoutConfiguration *)self->_configuration maxPages];
  }
  self->_unint64_t computedColumns = +[TUISmartGridBox columnsWithConfiguration:self->_configuration];
  v13 = [v280 children];
  BOOL v15 = v11 == (unsigned char *)&def_141F14 + 1 || v11 == (char *)0x7FFFFFFFFFFFFFFFLL;
  sub_64720((uint64_t)&v350, v13, self->_content, v15);

  if ([(TUISmartGridLayoutConfiguration *)self->_configuration balanceSections])
  {
    v16 = v351;
    v17 = v350;
    if (v351 != v350)
    {
      v18 = v11;
      unint64_t v19 = 0;
      unint64_t v285 = 0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3);
      do
      {
        id v20 = *((id *)v17 + 6);
        id v21 = [v20 columns];

        if (v21 == (id)0x7FFFFFFFFFFFFFFFLL) {
          id v22 = 0;
        }
        else {
          id v22 = v21;
        }
        v19 += (unint64_t)v22;
        v17 += 88;
      }
      while (v17 != v16);
      double v11 = v18;
      if (v19)
      {
        unint64_t computedColumns = self->_computedColumns;
        if (v19 < computedColumns)
        {
          if (computedColumns % v285) {
            self->_unint64_t computedColumns = v19;
          }
          else {
            self->_id columnsPerSection = computedColumns / v285;
          }
        }
      }
    }
  }
  id v24 = [(TUISmartGridLayoutConfiguration *)self->_configuration columnSpacing];
  self->_double computedColumnSpacing = TUILengthValueWithDefault((uint64_t)v24, v25, 0.0);
  +[TUISmartGridBox columnWidthWithConfiguration:columns:spacing:](TUISmartGridBox, "columnWidthWithConfiguration:columns:spacing:", self->_configuration, self->_computedColumns);
  self->_double computedColumnWidth = v26;
  id v27 = [(TUISmartGridLayoutConfiguration *)self->_configuration rowSpacing];
  self->_double computedRowSpacing = TUILengthValueWithDefault((uint64_t)v27, v28, 0.0);
  if (v11 != (char *)0x7FFFFFFFFFFFFFFFLL && v11 != (unsigned char *)&def_141F14 + 1)
  {
    uint64_t v53 = 0;
    if (v351 != v350)
    {
      v54 = v350 + 8;
      while (*v54 == *(v54 - 1))
      {
        ++v53;
        v54 += 11;
        if ((v351 - v350) / 88 == v53)
        {
          uint64_t v53 = (v351 - v350) / 88;
          break;
        }
      }
    }
    unint64_t v287 = (unint64_t)v11;
    *(void *)&long long v311 = &v350;
    *((void *)&v311 + 1) = v53;
    uint64_t v312 = 0;
    v313 = &v350;
    uint64_t v314 = (v351 - v350) / 88;
    uint64_t v315 = 0;
    v319 = &v350;
    v55 = (char *)[(TUISmartGridLayoutConfiguration *)self->_configuration verticalPlacement];
    if ((unint64_t)(v55 - 2) < 4) {
      int v56 = v55 - 1;
    }
    else {
      int v56 = 5;
    }
    int v318 = v56;
    v57 = v350;
    v284 = v351;
    if (v350 != v351)
    {
      unint64_t v58 = 0;
      unint64_t v59 = self->_computedColumns * (void)v12;
      v275 = &v328;
      unint64_t v282 = v59;
      while (1)
      {
        sub_D53D8((uint64_t)v327, v287);
        id columnsPerSection = self->_columnsPerSection;
        if (columnsPerSection)
        {
          if (!v59) {
            goto LABEL_81;
          }
        }
        else
        {
          id v61 = *((id *)v57 + 6);
          id columnsPerSection = [v61 columns];

          if (!v59) {
            goto LABEL_81;
          }
        }
        if (v59 > v58)
        {
          if ((unint64_t)columnsPerSection >= v59 - v58) {
            id columnsPerSection = (id)(v59 - v58);
          }
          goto LABEL_83;
        }
LABEL_81:
        if (v59)
        {
          id v62 = 0;
          goto LABEL_86;
        }
LABEL_83:
        if (columnsPerSection == (id)0x7FFFFFFFFFFFFFFFLL) {
          id v62 = 0;
        }
        else {
          id v62 = columnsPerSection;
        }
LABEL_86:
        *(void *)&long long v329 = v62;
        *((void *)v57 + 7) = v58;
        *((void *)v57 + 8) = 0;
        uint64_t v64 = *(void *)v57;
        uint64_t v63 = *((void *)v57 + 1);
        while (v64 != v63)
        {
          id v65 = *(id *)(v64 + 32);
          id v66 = [v65 rowSpan];
          id v67 = *(id *)(v64 + 32);
          sub_D46F8((unint64_t *)v327, (uint64_t)v66, (uint64_t)[v67 columnSpan], (uint64_t)v302);

          *(void *)(v64 + 8) = *(void *)v302;
          *(void *)uint64_t v64 = *(void *)&v302[8] + v58;
          *(int8x16_t *)(v64 + 16) = vextq_s8(*(int8x16_t *)&v302[16], *(int8x16_t *)&v302[16], 8uLL);
          v64 += 96;
        }
        unint64_t v68 = *((void *)&v328 + 1);
        unint64_t v69 = v328;
        if ((void)v328)
        {
          v70 = *(unint64_t **)&v327[8];
          unint64_t v71 = *(void *)v327;
          v72 = *(unint64_t **)&v327[16];
          uint64_t v73 = *((void *)&v328 + 1);
          if (*(void *)&v327[8] != *(void *)&v327[16])
          {
            v74 = *(unint64_t **)&v327[8];
            do
            {
              if (*v74) {
                --*v74;
              }
              ++v74;
            }
            while (v74 != v72);
            uint64_t v73 = *((void *)&v328 + 1);
          }
          uint64_t v75 = v73 + 1;
          *((void *)&v328 + 1) = v75;
          *(void *)&long long v328 = 0;
          if (v69 < v71) {
            goto LABEL_109;
          }
        }
        else
        {
          v70 = *(unint64_t **)&v327[8];
          v72 = *(unint64_t **)&v327[16];
          uint64_t v75 = *((void *)&v328 + 1);
        }
        unint64_t v76 = -1;
        *(void *)v302 = -1;
        if (v70 == v72) {
          goto LABEL_107;
        }
        v77 = v70;
        do
        {
          v78 = v77;
          if (v76 != -1)
          {
            if (*v77 >= v76) {
              v78 = (unint64_t *)v302;
            }
            else {
              v78 = v77;
            }
          }
          unint64_t v76 = *v78;
          *(void *)v302 = *v78;
          ++v77;
        }
        while (v77 != v72);
        if (v76 == -1) {
LABEL_107:
        }
          unint64_t v76 = 0;
        unint64_t v68 = v76 + v75;
LABEL_109:
        if (v70 != v72)
        {
          char v79 = 0;
LABEL_111:
          v80 = v70;
          do
          {
            while (*v80)
            {
              --*v80++;
              char v79 = 1;
              if (v80 == v72)
              {
LABEL_118:
                char v79 = 0;
                ++*((void *)&v328 + 1);
                *(void *)&long long v328 = 0;
                goto LABEL_111;
              }
            }
            ++v80;
          }
          while (v80 != v72);
          if (v79) {
            goto LABEL_118;
          }
        }
        if ([(TUISmartGridLayoutConfiguration *)self->_configuration columnMultiple]
          && [(TUISmartGridLayoutConfiguration *)self->_configuration truncate]
          && v68 > (unint64_t)[(TUISmartGridLayoutConfiguration *)self->_configuration columnMultiple])
        {
          unint64_t v81 = *((void *)&v328 + 1);
          if ((void)v329) {
            unint64_t v81 = v329;
          }
          if (v68 < v81)
          {
            unint64_t v82 = (unint64_t)[(TUISmartGridLayoutConfiguration *)self->_configuration columnMultiple];
            unint64_t v83 = v68 / v82 * v82;
            *(void *)v275 = 0;
            *((void *)v275 + 1) = 0;
            if (v83 == 0x7FFFFFFFFFFFFFFFLL) {
              unint64_t v83 = 0;
            }
            *(void *)&long long v329 = v83;
            uint64_t v85 = *(void *)v57;
            uint64_t v84 = *((void *)v57 + 1);
            while (v85 != v84)
            {
              id v86 = *(id *)(v85 + 32);
              id v87 = [v86 rowSpan];
              id v88 = *(id *)(v85 + 32);
              sub_D46F8((unint64_t *)v327, (uint64_t)v87, (uint64_t)[v88 columnSpan], (uint64_t)v302);

              *(void *)(v85 + 8) = *(void *)v302;
              *(void *)uint64_t v85 = *(void *)&v302[8] + v58;
              *(int8x16_t *)(v85 + 16) = vextq_s8(*(int8x16_t *)&v302[16], *(int8x16_t *)&v302[16], 8uLL);
              v85 += 96;
            }
          }
        }
        v89 = *(void **)&v327[8];
        if ((void)v329) {
          uint64_t v90 = v329;
        }
        else {
          uint64_t v90 = *((void *)&v328 + 1);
        }
        *((void *)v57 + 9) = v90;
        *((void *)v57 + 10) = 1;
        if (v89)
        {
          *(void *)&v327[16] = v89;
          operator delete(v89);
        }
        v58 += v90;
        v57 += 88;
        unint64_t v59 = v282;
        if (v57 == v284) {
          goto LABEL_174;
        }
      }
    }
    unint64_t v58 = 0;
LABEL_174:
    sub_D48A0((uint64_t)&v350);
    *(void *)&long long v353 = v58;
    uint64_t v120 = *((void *)&v353 + 1);
    double computedColumnWidth = self->_computedColumnWidth;
    double computedColumnSpacing = self->_computedColumnSpacing;
    double computedRowSpacing = self->_computedRowSpacing;
    v124 = [v280 controller];
    [v124 contentsScale];
    CGFloat v335 = v279;
    unint64_t v336 = v58;
    uint64_t v337 = v120;
    double v338 = v7;
    double v339 = v277;
    double v340 = v9;
    double v341 = v276;
    double v342 = computedColumnWidth;
    double v343 = computedColumnSpacing;
    double v346 = computedRowSpacing;
    id v347 = v278;
    double v348 = v125;
    unint64_t v349 = 0;
    if (v58 < 2 || computedColumnSpacing == 0.0)
    {
      double v344 = computedColumnWidth;
    }
    else
    {
      double v126 = computedColumnWidth;
      if (v125 > 0.0) {
        double v126 = floor(computedColumnWidth * v125) / v125;
      }
      double v344 = v126;
      double computedColumnSpacing = ((computedColumnWidth - v126) * (double)v58 + computedColumnSpacing * (double)(v58 - 1))
                            / (double)(v58 - 1);
    }
    double v345 = computedColumnSpacing;

    if ([(TUISmartGridLayoutConfiguration *)self->_configuration paginated])
    {
      unint64_t v127 = self->_computedColumns;
      unint64_t v349 = v127;
      if (!v127) {
        unint64_t v127 = v336;
      }
      double v128 = v343;
      if (v343 == 0.0 || v127 < 2)
      {
        double v344 = v342;
      }
      else
      {
        double v129 = v342;
        if (v348 > 0.0) {
          double v129 = floor(v342 * v348) / v348;
        }
        double v344 = v129;
        double v128 = ((v342 - v129) * (double)v127 + v343 * (double)(v127 - 1)) / (double)(v127 - 1);
      }
      double v345 = v128;
    }
    uint64_t v130 = sub_620A0((uint64_t)&v350, (char *)&dword_4 + 1);
    v131 = (void *)v130;
    if (v352[1] == v130)
    {
      *(CGSize *)v327 = CGSizeZero;
      *(_OWORD *)&v327[16] = 0u;
      long long v328 = 0u;
      sub_625C8((uint64_t)&self->_cellDividers, (uint64_t)v327);
      *(void *)v302 = &v327[24];
      sub_641FC((void ***)v302);
    }
    else
    {
      if (v349)
      {
        double v132 = v344;
        double v133 = v348;
        double v134 = v345 + v344;
        if (v345 == 0.0)
        {
          double v136 = v134 * 0.0;
          if (v348 > 0.0) {
            double v136 = floor(v136 * v348) / v348;
          }
        }
        else
        {
          double v135 = v134 - v345;
          if (v348 > 0.0) {
            double v135 = floor(v135 * v348) / v348;
          }
          double v136 = v135 - v344;
        }
      }
      else
      {
        double v132 = v344;
        double v133 = v348;
        double v134 = v345 + v344;
        double v136 = 0.0;
      }
      if (v345 == 0.0)
      {
        double v140 = v134 - v345;
        if (v133 <= 0.0)
        {
          double v141 = v134 * 0.0;
        }
        else
        {
          double v140 = floor(v133 * v140) / v133;
          double v141 = floor(v133 * (v134 * 0.0)) / v133;
        }
        double v144 = 0.0;
        if (v349) {
          double v144 = v141;
        }
        double v142 = v136 + v140;
        double v143 = v144 + v141;
      }
      else
      {
        double v137 = v345 * -2.0 + v134 * 2.0;
        if (v133 <= 0.0)
        {
          double v138 = v134 - v345;
          double v139 = v134 - v345 - v132;
        }
        else
        {
          double v137 = floor(v133 * v137) / v133;
          double v138 = floor(v133 * (v134 - v345)) / v133;
          double v139 = v138 - v132;
        }
        if (!v349) {
          double v139 = 0.0;
        }
        double v142 = v136 + v137 - v132;
        double v143 = v139 + v138 - v132;
      }
      sub_68438((uint64_t)&v297, 0, *(void *)(v130 + 40), *(void *)(v130 + 48), v142 - v143);
      uint64_t v146 = v145;
      uint64_t v148 = v147;
      v131[9] = v145;
      v131[10] = v147;
      sub_622EC((uint64_t)v131, 1);
      v149 = objc_opt_new();
      sub_62424(&v350, v131, v149);
      id v150 = v149;
      *(void *)v327 = v146;
      *(void *)&v327[8] = v148;
      *(_OWORD *)&v327[16] = (unint64_t)v150;
      long long v328 = 0uLL;
      sub_625C8((uint64_t)&self->_cellDividers, (uint64_t)v327);
      *(void *)v302 = &v327[24];
      sub_641FC((void ***)v302);
    }
    v151 = v350;
    v152 = v351;
    if (v350 == v351)
    {
      v159 = v350;
LABEL_225:
      double v160 = v338;
      long long v295 = (unint64_t)&v350;
      long long v296 = (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v159 - v151) >> 3));
      sub_68774((uint64_t)&v295);
      *(void *)&long long v293 = &v350;
      *((void *)&v293 + 1) = 0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3);
      long long v294 = *((unint64_t *)&v293 + 1);
      sub_68774((uint64_t)&v293);
      *(_OWORD *)v327 = v295;
      *(_OWORD *)&v327[16] = v296;
      long long v328 = v293;
      long long v329 = v294;
      *(void *)&long long v330 = 0;
      *((double *)&v330 + 1) = v160;
      LODWORD(v331) = 0;
      uint64_t v334 = 0;
      *((void *)&v332 + 1) = 0;
      unint64_t v333 = 0;
      sub_62778((uint64_t)v327, (uint64_t)&v335, &v350, 0);
      double v162 = v161;
      double v163 = v160 + v161;
      sub_D4900((uint64_t)&v311, (uint64_t)&v335, (uint64_t)&self->_cellDividers, 0.0, v160 + v161);
      double v110 = v164;
      double v166 = v165;
      long long v291 = (unint64_t)&v350;
      long long v292 = (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3));
      sub_69F6C((uint64_t)&v291);
      *(void *)&long long v289 = &v350;
      *((void *)&v289 + 1) = 0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3);
      long long v290 = *((unint64_t *)&v289 + 1);
      sub_69F6C((uint64_t)&v289);
      double v167 = v163 + v166;
      *(_OWORD *)v302 = v291;
      *(_OWORD *)&v302[16] = v292;
      long long v303 = v289;
      long long v304 = v290;
      uint64_t v305 = 0;
      double v306 = v163 + v166;
      int v307 = 0;
      v309 = 0;
      uint64_t v310 = 0;
      v308 = 0;
      sub_631A8((uint64_t)v302, (uint64_t)&v335, &v350, 0);
      double v169 = v168;
      double v170 = v340;
      sub_96488((uint64_t *)&v297);
      sub_D4AF8(&v297, (uint64_t)&v350, (uint64_t)&v335, &v350, 0.0, v162, v166);
      v171 = (NSArray *)[v297 copy];
      nonScrollableAdornmentLayouts = self->_nonScrollableAdornmentLayouts;
      self->_nonScrollableAdornmentLayouts = v171;

      if (v308)
      {
        v309 = v308;
        operator delete(v308);
      }
      double v173 = v167 + v169;
      if (*((void *)&v332 + 1))
      {
        unint64_t v333 = *((void *)&v332 + 1);
        operator delete(*((void **)&v332 + 1));
      }
      double v119 = v173 + v170;
      goto LABEL_230;
    }
LABEL_215:
    uint64_t v153 = *((void *)v151 + 3);
    uint64_t v154 = *((void *)v151 + 4);
    while (1)
    {
      if (v153 == v154)
      {
        v151 += 88;
        if (v151 == v152)
        {
          v159 = v351;
          v151 = v350;
          goto LABEL_225;
        }
        goto LABEL_215;
      }
      id v155 = *(id *)(v153 + 32);
      if ([v155 role] == (char *)&def_141F14 + 3)
      {
      }
      else
      {
        id v156 = *(id *)(v153 + 32);
        v157 = (int *)[v156 role];

        if (v157 != &dword_4) {
          goto LABEL_221;
        }
      }
      *(void *)uint64_t v153 = *((void *)v151 + 7);
      uint64_t v158 = *((void *)v151 + 9);
      *(void *)(v153 + 8) = 0;
      *(void *)(v153 + 16) = v158;
      *(void *)(v153 + 24) = 1;
LABEL_221:
      v153 += 96;
    }
  }
  v29 = v350;
  v286 = v351;
  if (v350 == v351)
  {
    unint64_t v30 = 0;
    long long v353 = xmmword_2433C0;
    uint64_t v46 = 1;
    goto LABEL_138;
  }
  unint64_t v30 = 0;
  unint64_t v31 = self->_computedColumns * (void)v12;
  unint64_t v281 = v31;
  v283 = self;
  do
  {
    *((void *)v29 + 7) = v30;
    *((void *)v29 + 8) = 0;
    v32 = (char *)self->_columnsPerSection;
    if (v32)
    {
      if (!v31) {
        goto LABEL_34;
      }
    }
    else
    {
      id v33 = *((id *)v29 + 6);
      v32 = (char *)[v33 columns];

      if (!v31) {
        goto LABEL_34;
      }
    }
    if (v31 > v30)
    {
      if ((unint64_t)v32 >= v31 - v30) {
        v32 = (char *)(v31 - v30);
      }
      goto LABEL_36;
    }
LABEL_34:
    if (v31)
    {
      v34 = 0;
      goto LABEL_39;
    }
LABEL_36:
    if (v32 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      v34 = 0;
    }
    else {
      v34 = v32;
    }
LABEL_39:
    uint64_t v36 = *(void *)v29;
    uint64_t v35 = *((void *)v29 + 1);
    if (*(void *)v29 == v35)
    {
      unint64_t v37 = 0;
    }
    else
    {
      unint64_t v37 = 0;
      v38 = v34 - 1;
      do
      {
        id v39 = *(id *)(v36 + 32);
        id v40 = [v39 columnSpan];
        BOOL v41 = (unint64_t)v38 >= v37;
        if ((unint64_t)v38 >= v37) {
          id v42 = v40;
        }
        else {
          id v42 = 0;
        }
        if ((unint64_t)v38 >= v37) {
          unint64_t v43 = v37;
        }
        else {
          unint64_t v43 = 0;
        }
        if ((unint64_t)v38 >= v37) {
          v37 += (unint64_t)v40;
        }

        *(void *)uint64_t v36 = v43 + v30;
        *(void *)(v36 + 8) = 0;
        *(void *)(v36 + 16) = v42;
        *(void *)(v36 + 24) = v41;
        v36 += 96;
      }
      while (v36 != v35);
    }
    *((void *)v29 + 9) = v37;
    *((void *)v29 + 10) = 1;
    v30 += v37;
    v29 += 88;
    self = v283;
    unint64_t v31 = v281;
  }
  while (v29 != v286);
  v44 = v350;
  v45 = v351;
  uint64_t v46 = 1;
  *(void *)&long long v353 = v30;
  *((void *)&v353 + 1) = 1;
  if (v350 != v351)
  {
    while (1)
    {
      uint64_t v47 = *((void *)v44 + 3);
      uint64_t v48 = *((void *)v44 + 4);
      while (v47 != v48)
      {
        id v49 = *(id *)(v47 + 32);
        if ([v49 role] == (char *)&def_141F14 + 3)
        {
        }
        else
        {
          id v50 = *(id *)(v47 + 32);
          v51 = (int *)[v50 role];

          if (v51 != &dword_4) {
            goto LABEL_60;
          }
        }
        *(void *)uint64_t v47 = *((void *)v44 + 7);
        uint64_t v52 = *((void *)v44 + 9);
        *(void *)(v47 + 8) = 0;
        *(void *)(v47 + 16) = v52;
        *(void *)(v47 + 24) = 1;
LABEL_60:
        v47 += 96;
      }
      v44 += 88;
      if (v44 == v45)
      {
        uint64_t v46 = *((void *)&v353 + 1);
        unint64_t v30 = v353;
        break;
      }
    }
  }
LABEL_138:
  double v92 = self->_computedColumnWidth;
  double v91 = self->_computedColumnSpacing;
  double v93 = self->_computedRowSpacing;
  v94 = [v280 controller];
  [v94 contentsScale];
  CGFloat v335 = v279;
  unint64_t v336 = v30;
  uint64_t v337 = v46;
  double v338 = v7;
  double v339 = v277;
  double v340 = v9;
  double v341 = v276;
  double v342 = v92;
  double v343 = v91;
  double v346 = v93;
  id v347 = v278;
  double v348 = v95;
  unint64_t v349 = 0;
  if (v30 < 2 || v91 == 0.0)
  {
    double v344 = v92;
  }
  else
  {
    double v96 = v92;
    if (v95 > 0.0) {
      double v96 = floor(v92 * v95) / v95;
    }
    double v344 = v96;
    double v91 = ((v92 - v96) * (double)v30 + v91 * (double)(v30 - 1)) / (double)(v30 - 1);
  }
  double v345 = v91;

  if ([(TUISmartGridLayoutConfiguration *)self->_configuration paginated])
  {
    unint64_t v97 = self->_computedColumns;
    unint64_t v349 = v97;
    if (!v97) {
      unint64_t v97 = v336;
    }
    double v98 = v343;
    if (v343 == 0.0 || v97 < 2)
    {
      double v344 = v342;
    }
    else
    {
      double v99 = v342;
      if (v348 > 0.0) {
        double v99 = floor(v342 * v348) / v348;
      }
      double v344 = v99;
      double v98 = ((v342 - v99) * (double)v97 + v343 * (double)(v97 - 1)) / (double)(v97 - 1);
    }
    double v345 = v98;
  }
  double v100 = v338;
  *(void *)&long long v325 = &v350;
  *((void *)&v325 + 1) = 0;
  long long v326 = (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3));
  sub_68774((uint64_t)&v325);
  *(void *)&long long v323 = &v350;
  *((void *)&v323 + 1) = 0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3);
  long long v324 = *((unint64_t *)&v323 + 1);
  sub_68774((uint64_t)&v323);
  *(_OWORD *)v327 = v325;
  *(_OWORD *)&v327[16] = v326;
  long long v328 = v323;
  long long v329 = v324;
  *(void *)&long long v330 = 0;
  *((double *)&v330 + 1) = v100;
  LODWORD(v331) = 0;
  uint64_t v334 = 0;
  *((void *)&v332 + 1) = 0;
  unint64_t v333 = 0;
  sub_62778((uint64_t)v327, (uint64_t)&v335, &v350, 0);
  double v102 = v101;
  double v103 = v100 + v101;
  v104 = v350;
  uint64_t v105 = 0;
  if (v351 != v350)
  {
    v106 = v350 + 8;
    while (*v106 == *(v106 - 1))
    {
      ++v105;
      v106 += 11;
      if ((v351 - v350) / 88 == v105)
      {
        uint64_t v105 = (v351 - v350) / 88;
        break;
      }
    }
  }
  *(void *)&long long v311 = &v350;
  *((void *)&v311 + 1) = v105;
  uint64_t v312 = 0;
  v313 = &v350;
  uint64_t v315 = 0;
  uint64_t v316 = 0;
  uint64_t v314 = (v351 - v350) / 88;
  double v317 = v100 + v101;
  int v318 = 0;
  v321 = 0;
  uint64_t v322 = 0;
  v320 = 0;
  unint64_t v107 = 1;
  if (v351 != v350)
  {
    do
    {
      for (uint64_t i = *(void *)v104; i != *((void *)v104 + 1); i += 96)
      {
        uint64_t v109 = *(void *)(i + 48);
        if ((*(void *)(i + 56) - v109) >> 6 > v107) {
          unint64_t v107 = (*(void *)(i + 56) - v109) >> 6;
        }
      }
      v104 += 88;
    }
    while (v104 != v351);
  }
  double v110 = sub_D3E90(&v311, (uint64_t)&v335, &v350, v107);
  double v112 = v111;
  *(void *)&long long v300 = &v350;
  *((void *)&v300 + 1) = 0;
  long long v301 = (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3));
  sub_69F6C((uint64_t)&v300);
  *(void *)&long long v298 = &v350;
  *((void *)&v298 + 1) = 0x2E8BA2E8BA2E8BA3 * ((v351 - v350) >> 3);
  long long v299 = *((unint64_t *)&v298 + 1);
  sub_69F6C((uint64_t)&v298);
  double v113 = v103 + v112;
  *(_OWORD *)v302 = v300;
  *(_OWORD *)&v302[16] = v301;
  long long v303 = v298;
  long long v304 = v299;
  uint64_t v305 = 0;
  double v306 = v113;
  int v307 = 0;
  v309 = 0;
  uint64_t v310 = 0;
  v308 = 0;
  sub_631A8((uint64_t)v302, (uint64_t)&v335, &v350, 0);
  double v115 = v114;
  double v116 = v340;
  sub_96488((uint64_t *)&v297);
  sub_D44EC(&v297, (uint64_t *)&v320, (uint64_t)&v350, (uint64_t)&v335, &v350, 0.0, v102);
  v117 = (NSArray *)[v297 copy];
  v118 = self->_nonScrollableAdornmentLayouts;
  self->_nonScrollableAdornmentLayouts = v117;

  if (v308)
  {
    v309 = v308;
    operator delete(v308);
  }
  if (v320)
  {
    v321 = v320;
    operator delete(v320);
  }
  if (*((void *)&v332 + 1))
  {
    unint64_t v333 = *((void *)&v332 + 1);
    operator delete(*((void **)&v332 + 1));
  }
  double v119 = v113 + v115 + v116;
LABEL_230:
  long long v174 = v353;
  double v176 = self->_computedColumnWidth;
  double v175 = self->_computedColumnSpacing;
  double v177 = self->_computedRowSpacing;
  v178 = [v280 controller];
  [v178 contentsScale];
  *(CGFloat *)v327 = v279;
  *(_OWORD *)&v327[8] = v174;
  *(double *)&v327[24] = v7;
  *(double *)&long long v328 = v277;
  *((double *)&v328 + 1) = v9;
  *(double *)&long long v329 = v276;
  *((double *)&v329 + 1) = v176;
  *(double *)&long long v330 = v175;
  *((double *)&v331 + 1) = v177;
  *(void *)&long long v332 = v278;
  *((double *)&v332 + 1) = v179;
  unint64_t v333 = 0;
  if ((unint64_t)v174 < 2 || v175 == 0.0)
  {
    *((double *)&v330 + 1) = v176;
  }
  else
  {
    double v180 = v176;
    if (v179 > 0.0) {
      double v180 = floor(v176 * v179) / v179;
    }
    *((double *)&v330 + 1) = v180;
    double v175 = ((v176 - v180) * (double)(unint64_t)v174 + v175 * (double)(unint64_t)(v174 - 1))
         / (double)(unint64_t)(v174 - 1);
  }
  *(double *)&long long v331 = v175;

  if ([(TUISmartGridLayoutConfiguration *)self->_configuration paginated])
  {
    unint64_t v181 = self->_computedColumns;
    unint64_t v333 = v181;
    if (!v181) {
      unint64_t v181 = *(void *)&v327[8];
    }
    double v182 = *(double *)&v330;
    if (*(double *)&v330 == 0.0 || v181 < 2)
    {
      *((void *)&v330 + 1) = *((void *)&v329 + 1);
    }
    else
    {
      double v183 = *((double *)&v329 + 1);
      if (*((double *)&v332 + 1) > 0.0) {
        double v183 = floor(*((double *)&v329 + 1) * *((double *)&v332 + 1)) / *((double *)&v332 + 1);
      }
      *((double *)&v330 + 1) = v183;
      double v182 = ((*((double *)&v329 + 1) - v183) * (double)v181 + *(double *)&v330 * (double)(v181 - 1))
           / (double)(v181 - 1);
    }
    *(double *)&long long v331 = v182;
  }
  v184 = (uint64_t *)v350;
  v185 = (uint64_t *)v351;
  while (v184 != v185)
  {
    uint64_t v186 = *v184;
    uint64_t v187 = v184[1];
    while (v186 != v187)
    {
      if (*(void *)(v186 + 16)) {
        BOOL v188 = *(void *)(v186 + 24) == 0;
      }
      else {
        BOOL v188 = 1;
      }
      uint64_t v189 = v188;
      sub_636C8(v186, v189);
      v186 += 96;
    }
    uint64_t v190 = v184[3];
    uint64_t v191 = v184[4];
    while (v190 != v191)
    {
      if (*(void *)(v190 + 16)) {
        BOOL v192 = *(void *)(v190 + 24) == 0;
      }
      else {
        BOOL v192 = 1;
      }
      uint64_t v193 = v192;
      sub_622EC(v190, v193);
      v190 += 96;
    }
    v184 += 11;
  }
  p_cellBounds = &self->_cellBounds;
  sub_62030((uint64_t)&self->_cellBounds, (uint64_t)self->_cellBounds.__begin_, (uint64_t *)self->_cellBounds.__end_);
  v195 = v350;
  for (j = v351; v195 != j; v195 += 88)
  {
    uint64_t v196 = *(void *)v195;
    uint64_t v197 = *((void *)v195 + 1);
    while (v196 != v197)
    {
      if (!*(unsigned char *)(v196 + 40))
      {
        uint64_t v199 = *(void *)(v196 + 48);
        uint64_t v198 = *(void *)(v196 + 56);
        if (v199 == v198)
        {
          double x = CGRectNull.origin.x;
          double y = CGRectNull.origin.y;
          double width = CGRectNull.size.width;
          double height = CGRectNull.size.height;
        }
        else
        {
          double x = *(double *)(v199 + 32);
          double y = *(double *)(v199 + 40);
          double width = *(double *)(v198 - 32) + *(double *)(v198 - 16) - x;
          double height = *(double *)(v198 - 24) + *(double *)(v198 - 8) - y;
        }
        v360.origin.double x = x;
        v360.origin.double y = y;
        v360.size.double width = width;
        v360.size.double height = height;
        if (!CGRectIsNull(v360))
        {
          id v204 = *(id *)(v196 + 32);
          id v205 = v204;
          end = (char *)self->_cellBounds.__end_;
          value = (char *)self->_cellBounds.__end_cap_.__value_;
          if (end >= value)
          {
            begin = (char *)p_cellBounds->__begin_;
            unint64_t v210 = 0xCCCCCCCCCCCCCCCDLL * ((end - (char *)p_cellBounds->__begin_) >> 3);
            unint64_t v211 = v210 + 1;
            if (v210 + 1 > 0x666666666666666) {
              sub_4484();
            }
            unint64_t v212 = 0xCCCCCCCCCCCCCCCDLL * ((value - begin) >> 3);
            if (2 * v212 > v211) {
              unint64_t v211 = 2 * v212;
            }
            if (v212 >= 0x333333333333333) {
              unint64_t v213 = 0x666666666666666;
            }
            else {
              unint64_t v213 = v211;
            }
            *(void *)&long long v303 = &self->_cellBounds.__end_cap_;
            if (v213)
            {
              v214 = (char *)sub_69ED0((uint64_t)&self->_cellBounds.__end_cap_, v213);
              begin = (char *)self->_cellBounds.__begin_;
              end = (char *)self->_cellBounds.__end_;
            }
            else
            {
              v214 = 0;
            }
            v215 = (double *)&v214[40 * v210];
            *(void *)v215 = v205;
            v215[1] = x;
            v215[2] = y;
            v215[3] = width;
            v215[4] = height;
            if (end == begin)
            {
              int64x2_t v219 = vdupq_n_s64((unint64_t)begin);
              v216 = &v214[40 * v210];
            }
            else
            {
              v216 = &v214[40 * v210];
              do
              {
                uint64_t v217 = *((void *)end - 5);
                end -= 40;
                *(void *)end = 0;
                *((void *)v216 - 5) = v217;
                v216 -= 40;
                long long v218 = *(_OWORD *)(end + 8);
                *(_OWORD *)(v216 + 24) = *(_OWORD *)(end + 24);
                *(_OWORD *)(v216 + 8) = v218;
              }
              while (end != begin);
              int64x2_t v219 = *(int64x2_t *)&p_cellBounds->__begin_;
            }
            v208 = v215 + 5;
            self->_cellBounds.__begin_ = v216;
            self->_cellBounds.__end_ = v215 + 5;
            *(int64x2_t *)&v302[8] = v219;
            v220 = self->_cellBounds.__end_cap_.__value_;
            self->_cellBounds.__end_cap_.__value_ = &v214[40 * v213];
            *(void *)&v302[24] = v220;
            *(void *)v302 = v219.i64[0];
            sub_69F18((uint64_t)v302);
          }
          else
          {
            *(void *)end = v204;
            *((double *)end + 1) = x;
            *((double *)end + 2) = y;
            v208 = end + 40;
            *((double *)end + 3) = width;
            *((double *)end + 4) = height;
          }
          self->_cellBounds.__end_ = v208;
        }
      }
      v196 += 96;
    }
  }
  v221 = self->_scrollAnchors.__begin_;
  p_scrollAnchors = &self->_scrollAnchors;
  if (v221 != self->_scrollAnchors.__end_) {
    self->_scrollAnchors.__end_ = v221;
  }
  if ([(TUISmartGridLayoutConfiguration *)self->_configuration paginated])
  {
    unint64_t v223 = v333;
    if (v333)
    {
      unint64_t v224 = 0;
      do
      {
        if (v224 >= (v223 + *(void *)&v327[8] - 1) / v223) {
          break;
        }
        double v225 = *(double *)&v331 + *((double *)&v330 + 1);
        if (*(double *)&v331 == 0.0)
        {
          double v233 = v225 * (double)v223;
          if (*((double *)&v332 + 1) > 0.0) {
            double v233 = floor(v233 * *((double *)&v332 + 1)) / *((double *)&v332 + 1);
          }
          double v234 = v225 * 0.0;
          if (*((double *)&v332 + 1) > 0.0) {
            double v234 = floor(v234 * *((double *)&v332 + 1)) / *((double *)&v332 + 1);
          }
          double v228 = v233 + v234;
          if ((void)v332 == 2)
          {
            unint64_t v235 = (*(void *)&v327[8] - 1) / v223 * v223;
            unint64_t v236 = (*(void *)&v327[8] - 1) % v223;
            double v237 = v225 * (double)v235;
            if (*((double *)&v332 + 1) <= 0.0)
            {
              double v238 = -(*(double *)&v331 - v225 * (double)(v236 + 1));
            }
            else
            {
              double v237 = floor(*((double *)&v332 + 1) * v237) / *((double *)&v332 + 1);
              double v238 = floor(*((double *)&v332 + 1) * -(*(double *)&v331 - v225 * (double)(v236 + 1)))
                   / *((double *)&v332 + 1);
            }
            double v240 = v237 + v238;
            goto LABEL_321;
          }
        }
        else
        {
          double v226 = -(*(double *)&v331 - v225 * (double)(v223 + 1));
          if (*((double *)&v332 + 1) > 0.0) {
            double v226 = floor(v226 * *((double *)&v332 + 1)) / *((double *)&v332 + 1);
          }
          double v227 = v225 - *(double *)&v331;
          if (*((double *)&v332 + 1) > 0.0) {
            double v227 = floor(v227 * *((double *)&v332 + 1)) / *((double *)&v332 + 1);
          }
          double v228 = v226 - *((double *)&v330 + 1) + v227 - *((double *)&v330 + 1);
          if ((void)v332 == 2)
          {
            unint64_t v229 = (*(void *)&v327[8] - 1) / v223 * v223;
            unint64_t v230 = (*(void *)&v327[8] - 1) % v223;
            double v231 = v225 * (double)(v229 + 1) - *(double *)&v331;
            if (*((double *)&v332 + 1) <= 0.0)
            {
              double v232 = *(double *)&v331 * -2.0 + v225 * (double)(v230 + 2);
            }
            else
            {
              double v231 = floor(*((double *)&v332 + 1) * v231) / *((double *)&v332 + 1);
              double v232 = floor(*((double *)&v332 + 1) * (*(double *)&v331 * -2.0 + v225 * (double)(v230 + 2)))
                   / *((double *)&v332 + 1);
            }
            double v240 = v231 - *((double *)&v330 + 1) + v232 - *((double *)&v330 + 1);
LABEL_321:
            double v239 = v240 - (double)v224 * v228;
            goto LABEL_322;
          }
        }
        double v239 = v228 * (double)v224;
LABEL_322:
        v242 = self->_scrollAnchors.__end_;
        v241 = self->_scrollAnchors.__end_cap_.__value_;
        if (v242 >= v241)
        {
          v244 = p_scrollAnchors->__begin_;
          uint64_t v245 = v242 - p_scrollAnchors->__begin_;
          unint64_t v246 = v245 + 1;
          if ((unint64_t)(v245 + 1) >> 61) {
            sub_4484();
          }
          uint64_t v247 = (char *)v241 - (char *)v244;
          if (v247 >> 2 > v246) {
            unint64_t v246 = v247 >> 2;
          }
          if ((unint64_t)v247 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v248 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v248 = v246;
          }
          if (v248)
          {
            v249 = (char *)sub_39FA0((uint64_t)&self->_scrollAnchors.__end_cap_, v248);
            v244 = self->_scrollAnchors.__begin_;
            v242 = self->_scrollAnchors.__end_;
          }
          else
          {
            v249 = 0;
          }
          v250 = (double *)&v249[8 * v245];
          double *v250 = v239;
          v243 = v250 + 1;
          while (v242 != v244)
          {
            uint64_t v251 = *((void *)v242-- - 1);
            *((void *)v250-- - 1) = v251;
          }
          self->_scrollAnchors.__begin_ = v250;
          self->_scrollAnchors.__end_ = v243;
          self->_scrollAnchors.__end_cap_.__value_ = (double *)&v249[8 * v248];
          if (v244) {
            operator delete(v244);
          }
        }
        else
        {
          double *v242 = v239;
          v243 = v242 + 1;
        }
        self->_scrollAnchors.__end_ = v243;
        ++v224;
        unint64_t v223 = v333;
      }
      while (v333);
    }
  }
  else
  {
    v252 = (unint64_t **)v350;
    v253 = v351;
    if (v350 != v351)
    {
      if (v278 == (unsigned char *)&def_141F14 + 2) {
        double v254 = v276;
      }
      else {
        double v254 = -v277;
      }
      do
      {
        v255 = *v252;
        v256 = v252[1];
        while (v255 != v256)
        {
          unint64_t v257 = v255[2];
          if (v257) {
            BOOL v258 = v255[3] == 0;
          }
          else {
            BOOL v258 = 1;
          }
          if (!v258)
          {
            sub_68CD0((uint64_t)v327, *v255, v257, 0);
            double v260 = v254 + v259;
            v262 = self->_scrollAnchors.__end_;
            v261 = self->_scrollAnchors.__end_cap_.__value_;
            if (v262 >= v261)
            {
              v264 = p_scrollAnchors->__begin_;
              uint64_t v265 = v262 - p_scrollAnchors->__begin_;
              unint64_t v266 = v265 + 1;
              if ((unint64_t)(v265 + 1) >> 61) {
                sub_4484();
              }
              uint64_t v267 = (char *)v261 - (char *)v264;
              if (v267 >> 2 > v266) {
                unint64_t v266 = v267 >> 2;
              }
              if ((unint64_t)v267 >= 0x7FFFFFFFFFFFFFF8) {
                unint64_t v268 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v268 = v266;
              }
              if (v268)
              {
                v269 = (char *)sub_39FA0((uint64_t)&self->_scrollAnchors.__end_cap_, v268);
                v264 = self->_scrollAnchors.__begin_;
                v262 = self->_scrollAnchors.__end_;
              }
              else
              {
                v269 = 0;
              }
              v270 = (double *)&v269[8 * v265];
              double *v270 = v260;
              v263 = v270 + 1;
              while (v262 != v264)
              {
                uint64_t v271 = *((void *)v262-- - 1);
                *((void *)v270-- - 1) = v271;
              }
              self->_scrollAnchors.__begin_ = v270;
              self->_scrollAnchors.__end_ = v263;
              self->_scrollAnchors.__end_cap_.__value_ = (double *)&v269[8 * v268];
              if (v264) {
                operator delete(v264);
              }
            }
            else
            {
              double *v262 = v260;
              v263 = v262 + 1;
            }
            self->_scrollAnchors.__end_ = v263;
          }
          v255 += 12;
        }
        v252 += 11;
      }
      while (v252 != (unint64_t **)v253);
    }
  }
  long long v272 = v331;
  *(_OWORD *)&self->_columnSystem._specifiedColumnSpacing = v330;
  *(_OWORD *)&self->_columnSystem._double computedColumnSpacing = v272;
  *(_OWORD *)&self->_columnSystem._layoutDirection = v332;
  long long v273 = *(_OWORD *)&v327[16];
  *(_OWORD *)&self->_columnSystem._containerWidth = *(_OWORD *)v327;
  *(_OWORD *)&self->_columnSystem._rows = v273;
  long long v274 = v329;
  *(_OWORD *)&self->_columnSystem._insets.left = v328;
  self->_columnSystem._columnsPerPage = v333;
  *(_OWORD *)&self->_columnSystem._insets.right = v274;
  self->_contentLayoutSize.double width = v110;
  self->_contentLayoutSize.double height = v119;
  self->_layoutSize.double width = v279;
  self->_layoutSize.double height = v119;
  if (v358)
  {
    v359 = v358;
    operator delete(v358);
  }
  if (v356)
  {
    v357 = v356;
    operator delete(v356);
  }
  if (v354)
  {
    v355 = v354;
    operator delete(v354);
  }
  *(void *)v327 = v352;
  sub_6427C((void ***)v327);
  *(void *)v327 = &v350;
  sub_644C0((void ***)v327);
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
    v18 = [v13 identifier];
    long long v19 = *(_OWORD *)&a4->c;
    v21[0] = *(_OWORD *)&a4->a;
    v21[1] = v19;
    v21[2] = *(_OWORD *)&a4->tx;
    id v20 = +[TUISmartGridDebugRenderModel renderModelWithSize:columnSystem:identifier:transform:](TUISmartGridDebugRenderModel, "renderModelWithSize:columnSystem:identifier:transform:", &self->_columnSystem, v18, v21, width, height);

    [v14 addObject:v20];
  }
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
      for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v15);
        }
        id v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
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
    double v23 = [TUIHoverIdentifier alloc];
    double v24 = [v14 identifier];
    double v25 = [(TUIHoverIdentifier *)v23 initWithName:@"cell" identifier:v24];

    double v26 = -[TUIHoverRegion initWithBounds:]([TUIHoverRegion alloc], "initWithBounds:", x, y, width, height);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_nonScrollableAdornmentLayouts, 0);
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