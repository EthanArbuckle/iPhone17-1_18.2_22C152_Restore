@interface PXMonthsLayoutGenerator
- (BOOL)presentedSingleColumn;
- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4 itemKinds:(int64_t *)a5 zPositions:(float *)a6;
@end

@implementation PXMonthsLayoutGenerator

- (BOOL)presentedSingleColumn
{
  return self->_presentedSingleColumn;
}

- (void)updateContentSize:(CGSize *)a3 itemRects:(CGRect *)a4 itemKinds:(int64_t *)a5 zPositions:(float *)a6
{
  uint64_t v10 = [(PXMonthsLayoutGenerator *)self itemCount];
  v162 = [(PXMonthsLayoutGenerator *)self itemLayoutInfoBlock];
  v157 = self;
  v11 = [(PXMonthsLayoutGenerator *)self metrics];
  uint64_t v12 = [v11 layoutStyle];
  [v11 referenceSize];
  double v144 = v13;
  v14 = +[PXCuratedLibrarySettings sharedInstance];
  int v158 = objc_msgSend(v14, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", 2, objc_msgSend(v11, "sizeClass"), objc_msgSend(v11, "orientation"), objc_msgSend(v11, "layoutStyle"));

  uint64_t v15 = [v11 orientation];
  v161 = v11;
  uint64_t v147 = v15;
  BOOL v17 = [v11 sizeClass] == 1 && v15 == 2;
  BOOL v159 = v17;
  uint64_t v145 = v12;
  if (v12 == 1)
  {
    v18 = +[PXLemonadeSettings sharedInstance];
    char v154 = [v18 enableMonthHeroPromotion];

    double v19 = 1.5;
  }
  else
  {
    double v19 = 1.0;
    char v154 = 1;
  }
  [v11 padding];
  double v21 = v20;
  double v23 = v22;
  double v142 = v24;
  double v26 = v25;
  [v11 chapterHeaderPadding];
  double v28 = v27;
  double v30 = v29;
  double v149 = v31;
  double v160 = v32;
  [v11 interitemSpacing];
  double v150 = v33;
  id v163 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  if (v10 >= 1)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      v35 = v162[2](v162, i);
      [v35 weight];
      double v37 = v36;

      if (v37 == -1.0) {
        [v163 addIndex:i];
      }
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PXMonthsLayoutGenerator_updateContentSize_itemRects_itemKinds_zPositions___block_invoke;
  aBlock[3] = &unk_1E5DB98B0;
  aBlock[4] = v157;
  aBlock[5] = v10;
  aBlock[6] = a2;
  aBlock[7] = a4;
  aBlock[8] = a5;
  v38 = (void (**)(void))_Block_copy(aBlock);
  double v39 = v144 - (v23 + v26);
  uint64_t v192 = 0;
  v193 = &v192;
  uint64_t v194 = 0x2020000000;
  uint64_t v195 = 0;
  v148 = v38;
  if (v10 <= 0)
  {
    v60 = a3;
  }
  else
  {
    uint64_t v40 = 0;
    int v151 = 0;
    BOOL v41 = v147 == 2;
    if (v147 == 2) {
      double v42 = 1.33333333;
    }
    else {
      double v42 = 1.0;
    }
    double v43 = v150;
    double v44 = (v39 + v150 * -2.0) / 3.0;
    double v124 = v44 / v42;
    double v45 = v150 + v44 / v42 * 2.0;
    double v117 = v150 + v44 / v42;
    double v118 = v42 * v45;
    double v119 = v45;
    double v138 = v150 + v45;
    double v141 = v150 + v44;
    double v129 = v141 + v141;
    double v106 = v150 + v42 * v45;
    double v46 = (v39 - v150) * 0.5;
    double v130 = v46 / 1.77777778;
    double v107 = v39 / 1.77777778 + v150 * 2.0 + v46 / 1.77777778;
    double v47 = (v39 + v150 * -3.0) * 0.25;
    double v48 = v150 + v47 * 2.0;
    double v103 = v47 + v48 + v150 * 2.0;
    if (v147 == 2) {
      double v49 = 1.77777778;
    }
    else {
      double v49 = v19;
    }
    double v50 = 1.5;
    if (v12 != 1) {
      double v50 = 1.33333333;
    }
    double v51 = v39 / v50;
    double v52 = (v39 + v150 * -3.66666667) / 3.25;
    double v112 = v150 + v150 + v52 / 1.77777778 * 3.0;
    if (v12 == 1) {
      BOOL v41 = 1;
    }
    BOOL v136 = v41;
    double v132 = v46 / 1.33333333;
    double v53 = (v39 - (v42 + 1.0) * v150) / ((v42 + v42) / v42 + 1.0);
    double v54 = v53 / v42;
    double v116 = v150 + v53 / v42 * 2.0;
    double v55 = v42 * v116;
    double v100 = v39 / v19;
    double v56 = v30 + v160;
    double v57 = v23 + v30;
    double v58 = (v39 + v150 * -2.0) / 3.0;
    double v152 = v39 - v56;
    double v153 = v57;
    uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
    double v135 = v39 / v49;
    double v127 = v150 + v39 / 1.77777778;
    double v128 = v39 / 1.77777778;
    double v143 = (v39 - v150) * 0.5;
    double v126 = v150 + v150 + v44 * 2.0;
    double v122 = v51;
    double v123 = (v39 + v150 * -3.0) * 0.25;
    double v137 = v150 + v47;
    double v110 = v150 + v47 * 2.0;
    double v111 = v112 * 1.33333333;
    double v105 = v150 + v48;
    double v139 = v150 + v51;
    double v140 = v150 + v46;
    double v120 = v52 / 1.77777778;
    double v121 = (v39 + v150 * -3.66666667) / 3.25;
    double v114 = v150 + v52 / 1.77777778;
    double v115 = v55;
    double v108 = v150 + v44 * 2.0;
    double v109 = v114 + v114;
    double v125 = v150 + v112 * 1.33333333;
    double v131 = v150 + v39 / 1.33333333;
    double v133 = v54;
    double v134 = v53;
    double v113 = v150 + v54;
    double v101 = v150 + v52;
    double v102 = v150 + v53;
    double v104 = v150 + v55;
    v60 = a3;
    double v146 = v28;
    do
    {
      if ([v163 containsIndex:v40])
      {
        [v161 chapterHeaderHeight];
        CGFloat v62 = v61;
        v63 = v193;
        uint64_t v64 = v193[3];
        v65 = &a4[v64];
        double v67 = v152;
        double v66 = v153;
        v65->origin.CGFloat x = v153;
        v65->origin.double y = v21;
        v65->size.double width = v152;
        v65->size.double height = v62;
        a5[v64] = 0;
        uint64_t v59 = v63[3];
        a6[v59] = 0.0;
        if (v159)
        {
          uint64_t v68 = v59;
        }
        else
        {
          double v74 = v21;
          double v21 = v149 + CGRectGetMaxY(*(CGRect *)&v66);
          v63 = v193;
          uint64_t v68 = v193[3];
        }
        uint64_t v40 = v68 + 1;
        v63[3] = v68 + 1;
      }
      else
      {
        uint64_t v69 = v193[3];
        uint64_t v70 = [v163 indexGreaterThanIndex:v69];
        if (v70 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v71 = v10;
        }
        else {
          uint64_t v71 = v70;
        }
        uint64_t v188 = 0;
        v189 = &v188;
        uint64_t v190 = 0x2020000000;
        uint64_t v191 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v184 = 0;
        v185 = &v184;
        uint64_t v186 = 0x2020000000;
        uint64_t v187 = 0x7FFFFFFFFFFFFFFFLL;
        v183[0] = 0;
        v183[1] = v183;
        v183[2] = 0x2020000000;
        v183[3] = 0;
        uint64_t v179 = 0;
        v180 = (double *)&v179;
        uint64_t v181 = 0x2020000000;
        double v182 = v21;
        v164[0] = MEMORY[0x1E4F143A8];
        v164[1] = 3221225472;
        v164[2] = __76__PXMonthsLayoutGenerator_updateContentSize_itemRects_itemKinds_zPositions___block_invoke_2;
        v164[3] = &unk_1E5DB98D8;
        double v171 = v23;
        double v172 = v21;
        uint64_t v173 = v10;
        SEL v174 = a2;
        v166 = &v192;
        v164[4] = v157;
        v175 = a4;
        v176 = a5;
        v177 = a6;
        char v178 = v154;
        v165 = v162;
        v167 = v183;
        v168 = &v184;
        v169 = &v188;
        v170 = &v179;
        v72 = _Block_copy(v164);
        v73 = (void (**)(void, void, double, double, double, double))v72;
        if (v158)
        {
          switch(v71 + ~v69)
          {
            case 0:
              (*((void (**)(void *, uint64_t, double, double, double, double))v72 + 2))(v72, 1, 0.0, 0.0, v39, v135);
              goto LABEL_60;
            case 1:
              v75 = (void (*)(void *, uint64_t, double, double, double, double))*((void *)v72 + 2);
              if (v147 == 2)
              {
                v75(v72, 1, 0.0, 0.0, v143, v143);
                v73[2](v73, 1, v140, 0.0, v143, v143);
                goto LABEL_60;
              }
              if (v145 == 1)
              {
                v75(v72, 1, 0.0, 0.0, v143, v100);
                v73[2](v73, 1, v140, 0.0, v143, v100);
                goto LABEL_60;
              }
              v75(v72, 1, 0.0, 0.0, v39, v128);
              v73[2](v73, 1, 0.0, v127, v39, v128);
              break;
            case 2:
              if (!v136)
              {
                (*((void (**)(void *, uint64_t, double, double, double, double))v72 + 2))(v72, 2, 0.0, 0.0, v39, v39 / 1.33333333);
                v73[2](v73, 0, 0.0, v131, v143, v132);
                v73[2](v73, 0, v140, v131, v143, v132);
                break;
              }
              v76 = (void (*)(void *, uint64_t, double, double, double, double))*((void *)v72 + 2);
              if (v151)
              {
                v76(v72, 0, 0.0, 0.0, v134, v133);
                v73[2](v73, 0, 0.0, v113, v134, v133);
                v73[2](v73, 2, v102, 0.0, v115, v116);
                goto LABEL_60;
              }
              v76(v72, 2, 0.0, 0.0, v115, v116);
              v73[2](v73, 0, v104, 0.0, v134, v133);
              v73[2](v73, 0, v104, v113, v134, v133);
              goto LABEL_68;
            case 3:
              if (v147 != 2)
              {
                (*((void (**)(void *, uint64_t, double, double, double, double))v72 + 2))(v72, 2, 0.0, 0.0, v39, v122);
                v73[2](v73, 0, 0.0, v139, v58, v58);
                v73[2](v73, 0, v141, v139, v58, v58);
                v73[2](v73, 0, v129, v139, v58, v58);
                break;
              }
              v77 = (void (*)(void *, uint64_t, double, double, double, double))*((void *)v72 + 2);
              if (v151)
              {
                v77(v72, 0, 0.0, 0.0, v121, v120);
                v73[2](v73, 0, 0.0, v114, v121, v120);
                v73[2](v73, 0, 0.0, v109, v121, v120);
                v73[2](v73, 2, v101, 0.0, v111, v112);
                goto LABEL_60;
              }
              v77(v72, 2, 0.0, 0.0, v111, v112);
              v73[2](v73, 0, v125, 0.0, v121, v120);
              v73[2](v73, 0, v125, v114, v121, v120);
              v73[2](v73, 0, v125, v109, v121, v120);
              goto LABEL_68;
            case 4:
              if (v147 == 2)
              {
                v78 = (void (*)(void *, uint64_t, double, double, double, double))*((void *)v72 + 2);
                if (v151)
                {
                  double v79 = (v39 + v150 * -3.0) * 0.25;
                  v78(v72, 0, 0.0, 0.0, v123, v123);
                  v73[2](v73, 0, 0.0, v137, v79, v79);
                  v73[2](v73, 0, v137, 0.0, v79, v79);
                  v73[2](v73, 0, v137, v137, v79, v79);
                  v73[2](v73, 2, v137 + v137, 0.0, v110, v110);
                  goto LABEL_60;
                }
                v78(v72, 2, 0.0, 0.0, v110, v110);
                double v82 = (v39 + v150 * -3.0) * 0.25;
                v73[2](v73, 0, v105, 0.0, v123, v123);
                v73[2](v73, 0, v105, v137, v82, v82);
                v73[2](v73, 0, v103, 0.0, v82, v82);
                v73[2](v73, 0, v103, v137, v82, v82);
              }
              else
              {
                if (v145 != 1)
                {
                  (*((void (**)(void *, uint64_t, double, double, double, double))v72 + 2))(v72, 2, 0.0, 0.0, v39, v128);
                  v73[2](v73, 0, 0.0, v127, v143, v130);
                  v73[2](v73, 0, v140, v127, v143, v130);
                  v73[2](v73, 0, 0.0, v107, v143, v130);
                  v73[2](v73, 0, v140, v107, v143, v130);
                  break;
                }
                v81 = (void (*)(void *, uint64_t, double, double, double, double))*((void *)v72 + 2);
                if (v151)
                {
                  v81(v72, 0, 0.0, 0.0, v58, v58);
                  v73[2](v73, 0, 0.0, v141, v58, v58);
                  v73[2](v73, 2, v141, 0.0, v108, v108);
                  v73[2](v73, 0, 0.0, v126, v58, v58);
                  v73[2](v73, 0, v141, v126, v108, v58);
                  goto LABEL_60;
                }
                v81(v72, 2, 0.0, 0.0, v108, v108);
                v73[2](v73, 0, v126, 0.0, v58, v58);
                v73[2](v73, 0, v126, v141, v58, v58);
                v73[2](v73, 0, 0.0, v126, v108, v58);
                v73[2](v73, 0, v126, v126, v58, v58);
              }
              goto LABEL_68;
            case 5:
              if (v145 != 1) {
                break;
              }
              v80 = (void (*)(void *, uint64_t, double, double, double, double))*((void *)v72 + 2);
              if (v151)
              {
                v80(v72, 0, 0.0, 0.0, v58, v124);
                v73[2](v73, 0, 0.0, v117, v58, v124);
                v73[2](v73, 2, v141, 0.0, v118, v119);
                v73[2](v73, 0, 0.0, v138, v58, v124);
                v73[2](v73, 0, v141, v138, v58, v124);
                v73[2](v73, 0, v129, v138, v58, v124);
LABEL_60:
                int v151 = 0;
              }
              else
              {
                v80(v72, 2, 0.0, 0.0, v118, v119);
                v73[2](v73, 0, v106, 0.0, v58, v124);
                v73[2](v73, 0, v106, v117, v58, v124);
                v73[2](v73, 0, 0.0, v138, v58, v124);
                v73[2](v73, 0, v141, v138, v58, v124);
                v73[2](v73, 0, v129, v138, v58, v124);
LABEL_68:
                int v151 = 2;
              }
              break;
            default:
              break;
          }
        }
        if (v193[3] == v69)
        {
          [v161 defaultSectionAspectRatio];
          double v84 = v39 / v83;
          v85 = v193 + 3;
          for (uint64_t j = v193[3]; j < v71; v193[3] = j)
          {
            v87 = &a4[j];
            v87->origin.CGFloat x = v23;
            v87->origin.double y = v21;
            v87->size.double width = v39;
            v87->size.double height = v84;
            a5[j] = 0;
            a6[*v85] = 0.0;
            v197.origin.CGFloat x = v23;
            v197.origin.double y = v21;
            v197.size.double width = v39;
            v197.size.double height = v84;
            double v21 = v43 + CGRectGetMaxY(v197);
            v85 = v193 + 3;
            uint64_t j = v193[3] + 1;
          }
          v198.origin.CGFloat x = v23;
          v198.origin.double y = v21;
          v198.size.double width = v39;
          v198.size.double height = v84;
          int v151 = 0;
          double v88 = CGRectGetMinY(v198) - v43;
          v180[3] = v88;
        }
        else
        {
          double v88 = v180[3];
        }
        if (v189[3] != 0x7FFFFFFFFFFFFFFFLL && v185[3] != 0x7FFFFFFFFFFFFFFFLL) {
          v148[2]();
        }
        if ([v161 displaceTopLeadingCardTitle])
        {
          uint64_t v89 = v189[3];
          if (v89 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v90 = v185[3];
            if (v90 != 0x7FFFFFFFFFFFFFFFLL && v90 != v89)
            {
              if (v69 == v90) {
                uint64_t v92 = v69 + 1;
              }
              else {
                uint64_t v92 = v69;
              }
              if (v69 == v89) {
                uint64_t v69 = v185[3];
              }
              else {
                uint64_t v69 = v92;
              }
            }
          }
          a5[v69] |= 8uLL;
        }
        if (v59 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v93 = &a4[v59];
          double y = v93->origin.y;
          if (v159)
          {
            double height = v180[3] - y;
            a5[v59] = 2;
            CGFloat x = 0.0;
            double width = v23;
          }
          else
          {
            CGFloat x = v93->origin.x;
            double width = v93->size.width;
            double height = v93->size.height;
            if (!v158 || [v161 displaceTopLeadingCardTitle])
            {
              double v98 = v180[3];
              int v99 = [v161 displaceTopLeadingCardTitle];
              if (height < v98 - y) {
                double height = v98 - y;
              }
              if (v99) {
                double y = y + 30.0;
              }
            }
            double v28 = v146;
          }
          v93->origin.CGFloat x = x;
          v93->origin.double y = y;
          v93->size.double width = width;
          v93->size.double height = height;
          double v43 = v150;
          double v58 = (v39 + v150 * -2.0) / 3.0;
        }
        double v21 = v28 + v88;

        _Block_object_dispose(&v179, 8);
        _Block_object_dispose(v183, 8);
        _Block_object_dispose(&v184, 8);
        _Block_object_dispose(&v188, 8);
        uint64_t v40 = v193[3];
        uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
        v60 = a3;
      }
    }
    while (v40 < v10);
  }
  v199.size.double height = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 24);
  v60->double width = v144;
  v199.origin.CGFloat x = v23;
  v199.origin.double y = v21;
  v199.size.double width = v39;
  v60->double height = v142 + CGRectGetMinY(v199) - v28;
  v157->_presentedSingleColumn = v158 ^ 1;
  _Block_object_dispose(&v192, 8);
}

__n128 __76__PXMonthsLayoutGenerator_updateContentSize_itemRects_itemKinds_zPositions___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  if (a2 < 0 || a1[5] <= a2)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], @"PXMonthsLayoutGenerator.m", 124, @"fromIndex %li out of bounds 0..%li", a2, a1[5]);

    if ((v3 & 0x8000000000000000) == 0)
    {
LABEL_4:
      if (a1[5] > v3) {
        goto LABEL_5;
      }
    }
  }
  else if ((a3 & 0x8000000000000000) == 0)
  {
    goto LABEL_4;
  }
  BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], @"PXMonthsLayoutGenerator.m", 125, @"toIndex %li out of bounds 0..%li", v3, a1[5]);

LABEL_5:
  v6 = (__n128 *)(a1[7] + 32 * v3);
  __n128 v18 = *v6;
  __n128 v19 = v6[1];
  uint64_t v7 = *(void *)(a1[8] + 8 * v3);
  if (v3 >= a2)
  {
    if (v3 > a2)
    {
      uint64_t v11 = 32 * v3;
      do
      {
        uint64_t v12 = (_OWORD *)(a1[7] + v11);
        long long v13 = *(v12 - 1);
        *uint64_t v12 = *(v12 - 2);
        v12[1] = v13;
        *(void *)(a1[8] + 8 * v3) = *(void *)(a1[8] + 8 * v3 - 8);
        v11 -= 32;
        --v3;
      }
      while (v3 > a2);
    }
  }
  else
  {
    uint64_t v8 = 32 * v3;
    do
    {
      v9 = (_OWORD *)(a1[7] + v8);
      long long v10 = v9[3];
      _OWORD *v9 = v9[2];
      v9[1] = v10;
      *(void *)(a1[8] + 8 * v3) = *(void *)(a1[8] + 8 * v3 + 8);
      v8 += 32;
      ++v3;
    }
    while (a2 != v3);
  }
  v14 = (__n128 *)(a1[7] + 32 * a2);
  __n128 result = v18;
  __n128 *v14 = v18;
  v14[1] = v19;
  *(void *)(a1[8] + 8 * a2) = v7;
  return result;
}

void __76__PXMonthsLayoutGenerator_updateContentSize_itemRects_itemKinds_zPositions___block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, CGFloat a5, CGFloat a6)
{
  double v10 = *(double *)(a1 + 88) + a3;
  double v11 = *(double *)(a1 + 96) + a4;
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (v12 < 0 || v12 >= *(void *)(a1 + 104))
  {
    double v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 112), *(void *)(a1 + 32), @"PXMonthsLayoutGenerator.m", 183, @"index %li out of bounds 0..%li", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void *)(a1 + 104));

    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  uint64_t v13 = *(void *)(a1 + 128);
  v14 = (double *)(*(void *)(a1 + 120) + 32 * v12);
  double *v14 = v10;
  v14[1] = v11;
  v14[2] = a5;
  v14[3] = a6;
  uint64_t v15 = 4 * (a2 == 2);
  if (!a2) {
    uint64_t v15 = 1;
  }
  *(void *)(v13 + 8 * *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) = v15;
  *(_DWORD *)(*(void *)(a1 + 136) + 4 * *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) = 0;
  if (*(unsigned char *)(a1 + 144))
  {
    v16 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [v16 weight];
    double v18 = v17;

    if (v18 > *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 24);
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v18;
    }
  }
  if (a2 == 2) {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
  }
                                                                            + 24);
  double v19 = *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  v22.origin.CGFloat x = v10;
  v22.origin.double y = v11;
  v22.size.double width = a5;
  v22.size.double height = a6;
  double MaxY = CGRectGetMaxY(v22);
  if (v19 >= MaxY) {
    double MaxY = v19;
  }
  *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = MaxY;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

@end