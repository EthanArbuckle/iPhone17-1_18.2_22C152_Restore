@interface THTextWrapController
- (BOOL)p_shouldTextFlowAroundWrappable:(id)a3 inTarget:(id)a4 inColumn:(id)a5;
- (double)nextUnobstructedSpanStartingAt:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5;
- (id)beginWrappingToColumn:(id)a3 target:(id)a4 hasWrapables:(BOOL *)a5;
- (id)floatingDrawableLayoutsForTarget:(id)a3;
- (unint64_t)zOrderOfDrawable:(id)a3 forTarget:(id)a4;
- (unsigned)p_pageIndexForTarget:(id)a3;
- (unsigned)p_splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappable:(id)a5;
- (unsigned)splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappableAttachments:(id)a5 ignoreFloatingGraphics:(BOOL)a6 floatingCausedWrap:(BOOL *)a7 skipHint:(double *)a8 userInfo:(id)a9;
@end

@implementation THTextWrapController

- (BOOL)p_shouldTextFlowAroundWrappable:(id)a3 inTarget:(id)a4 inColumn:(id)a5
{
  return 1;
}

- (id)floatingDrawableLayoutsForTarget:(id)a3
{
  return 0;
}

- (unint64_t)zOrderOfDrawable:(id)a3 forTarget:(id)a4
{
  return 0;
}

- (id)beginWrappingToColumn:(id)a3 target:(id)a4 hasWrapables:(BOOL *)a5
{
  v9 = objc_alloc_init(THTextWrapCookie);
  [(THTextWrapCookie *)v9 setColumn:a3];
  [(THTextWrapCookie *)v9 setTarget:a4];
  unint64_t v24 = -[THTextWrapController zOrderOfDrawable:forTarget:](self, "zOrderOfDrawable:forTarget:", [a4 info], a4);
  v25 = self;
  id v26 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(THTextWrapController *)self floatingDrawableLayoutsForTarget:a4];
  id v10 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        if (v24 < -[THTextWrapController zOrderOfDrawable:forTarget:](v25, "zOrderOfDrawable:forTarget:", [*(id *)(*((void *)&v31 + 1) + 8 * (void)v13) info], v26))
        {
          v14 = (void *)TSUProtocolCast();
          if (v14 && (v15 = v14, ![v14 wrapContainerMode]))
          {
            long long v29 = 0u;
            long long v30 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            id v17 = [v15 descendentWrappables];
            id v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v18)
            {
              id v19 = v18;
              uint64_t v20 = *(void *)v28;
              do
              {
                v21 = 0;
                do
                {
                  if (*(void *)v28 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  [(THTextWrapCookie *)v9 addFloatingWrappable:*(void *)(*((void *)&v27 + 1) + 8 * (void)v21)];
                  *a5 = 1;
                  v21 = (char *)v21 + 1;
                }
                while (v19 != v21);
                id v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
              }
              while (v19);
            }
          }
          else
          {
            uint64_t v16 = TSUProtocolCast();
            if (v16)
            {
              [(THTextWrapCookie *)v9 addFloatingWrappable:v16];
              *a5 = 1;
            }
          }
        }
        v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      id v11 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v11);
  }
  return v9;
}

- (unsigned)splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappableAttachments:(id)a5 ignoreFloatingGraphics:(BOOL)a6 floatingCausedWrap:(BOOL *)a7 skipHint:(double *)a8 userInfo:(id)a9
{
  uint64_t v9 = __chkstk_darwin(self, a2, a4, a5, a6, a7, a8, a9, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  id v11 = v10;
  v13 = v12;
  v135 = (void *)v9;
  v136 = v14;
  uint64_t v16 = v15;
  __dst = v17;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  objc_opt_class();
  id v26 = (void *)TSUDynamicCast();
  id v27 = [v26 column];
  id v28 = [v26 target];
  long long v29 = v28;
  v130 = v13;
  id v134 = v27;
  if (v27)
  {
    if (v28) {
      goto LABEL_3;
    }
LABEL_30:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTextWrapController splitLine:lineSegmentRects:wrappableAttachments:ignoreFloatingGraphics:floatingCausedWrap:skipHint:userInfo:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTextWrapController.mm") lineNumber:187 description:@"invalid nil value for '%s'", "target"];
    if (!v13) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTextWrapController splitLine:lineSegmentRects:wrappableAttachments:ignoreFloatingGraphics:floatingCausedWrap:skipHint:userInfo:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTextWrapController.mm") lineNumber:186 description:@"invalid nil value for '%s'", "column"];
  if (!v29) {
    goto LABEL_30;
  }
LABEL_3:
  if (v13) {
LABEL_4:
  }
    double *v13 = 1.0;
LABEL_5:
  [v29 rectInRoot:v25, v23, v21, v19];
  double v31 = v30;
  CGFloat v33 = v32;
  double v35 = v34;
  double v37 = v36;
  [v27 frameBounds];
  [v29 rectInRoot:];
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  if (([v29 autosizeFlags] & 3) != 0)
  {
    [v29 maxSize];
    CGFloat v45 = v46;
  }
  v162.origin.CGFloat x = v31;
  v162.origin.CGFloat y = v33;
  v162.size.CGFloat width = v35;
  v162.size.CGFloat height = v37;
  v198.origin.CGFloat x = v39;
  v198.origin.CGFloat y = v41;
  v198.size.CGFloat width = v43;
  v198.size.CGFloat height = v45;
  if (!CGRectIntersectsRect(v162, v198))
  {
    LODWORD(v62) = 0;
    return v62;
  }
  v133 = v29;
  CGFloat *__dst = v31;
  __dst[1] = v33;
  __dst[2] = v35;
  __dst[3] = v37;
  id v47 = [v11 floatingWrappables];
  v131 = v47;
  if ([v16 count])
  {
    id v47 = [v47 mutableCopy];
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    id v48 = [v16 countByEnumeratingWithState:&v153 objects:v160 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v154;
      do
      {
        v51 = v16;
        for (i = 0; i != v49; i = (char *)i + 1)
        {
          if (*(void *)v154 != v50) {
            objc_enumerationMutation(v51);
          }
          v53 = v26;
          objc_msgSend(objc_msgSend(v26, "target"), "validatedLayoutForAnchoredDrawable:", *(void *)(*((void *)&v153 + 1) + 8 * i));
          v54 = (void *)TSUProtocolCast();
          if (v54 && (v55 = v54, ![v54 wrapContainerMode]))
          {
            long long v151 = 0u;
            long long v152 = 0u;
            long long v149 = 0u;
            long long v150 = 0u;
            id v57 = [v55 descendentWrappables];
            id v58 = [v57 countByEnumeratingWithState:&v149 objects:v159 count:16];
            if (v58)
            {
              id v59 = v58;
              uint64_t v60 = *(void *)v150;
              do
              {
                for (j = 0; j != v59; j = (char *)j + 1)
                {
                  if (*(void *)v150 != v60) {
                    objc_enumerationMutation(v57);
                  }
                  [v47 addObject:*(void *)(*((void *)&v149 + 1) + 8 * (void)j)];
                }
                id v59 = [v57 countByEnumeratingWithState:&v149 objects:v159 count:16];
              }
              while (v59);
            }
          }
          else
          {
            uint64_t v56 = TSUProtocolCast();
            if (v56) {
              [v47 addObject:v56];
            }
          }
          id v26 = v53;
        }
        uint64_t v16 = v51;
        id v49 = [v51 countByEnumeratingWithState:&v153 objects:v160 count:16];
      }
      while (v49);
    }
  }
  else
  {
    id v63 = v47;
  }
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  id v142 = [v47 countByEnumeratingWithState:&v145 objects:v158 count:16];
  if (!v142)
  {
    unint64_t v83 = 1;
LABEL_119:

    uint64_t v62 = v83;
    goto LABEL_120;
  }
  uint64_t v141 = *(void *)v146;
  uint64_t v62 = 1;
  CGFloat v132 = v31;
  double v137 = v33;
  double v129 = v35;
  do
  {
    uint64_t v64 = 0;
    do
    {
      if (*(void *)v146 != v141) {
        objc_enumerationMutation(v47);
      }
      uint64_t v143 = v64;
      v65 = *(void **)(*((void *)&v145 + 1) + 8 * v64);
      unsigned int v66 = [v65 wrapDirection];
      unsigned int v67 = [v65 wrapFitType];
      unsigned int v68 = [v65 wrapType];
      if (!v68) {
        goto LABEL_78;
      }
      int v69 = v68;
      if (v68 == 4)
      {
        unsigned int v70 = [v135 p_shouldTextFlowAroundWrappable:v65 inTarget:v133 inColumn:v134];
        int v69 = v70 ? 1 : 2;
        if (v70) {
          unsigned int v66 = 2;
        }
      }
      [v65 boundsInfluencingExteriorWrap];
      CGFloat x = v163.origin.x;
      CGFloat rect = v163.origin.y;
      CGFloat width = v163.size.width;
      CGFloat height = v163.size.height;
      v199.origin.CGFloat x = v31;
      v199.origin.CGFloat y = v33;
      v199.size.CGFloat width = v35;
      CGFloat v74 = v31;
      v199.size.CGFloat height = v37;
      if (CGRectIntersectsRect(v163, v199))
      {
        if (v136 && [v131 indexOfObject:v65] != (id)0x7FFFFFFFFFFFFFFFLL) {
          unsigned char *v136 = 1;
        }
        if (v69 == 2)
        {
          if (!v130) {
            goto LABEL_61;
          }
          double v75 = *v130;
          v164.origin.CGFloat x = x;
          v164.origin.CGFloat y = rect;
          v164.size.CGFloat width = width;
          v164.size.CGFloat height = height;
          double MaxY = CGRectGetMaxY(v164);
          v165.origin.CGFloat x = v132;
          CGFloat v33 = v137;
          v165.origin.CGFloat y = v137;
          v165.size.CGFloat width = v35;
          v165.size.CGFloat height = v37;
          unsigned int v77 = 0;
          float v78 = MaxY - CGRectGetMinY(v165);
          double v79 = (double)vcvtps_u32_f32(v78);
          if (v75 >= v79) {
            double v79 = v75;
          }
          double v31 = v132;
          double *v130 = v79;
        }
        else if (v67)
        {
          if (v67 != 1)
          {
LABEL_61:
            unsigned int v77 = 0;
LABEL_62:
            CGFloat v33 = v137;
            goto LABEL_63;
          }
          unsigned int v77 = [v135 p_splitLine:v157 lineSegmentRects:v65 wrappable:v31];
          if (!v77) {
            goto LABEL_62;
          }
          if (v69 == 3)
          {
            v166.origin.CGFloat x = x;
            v166.origin.CGFloat y = rect;
            v166.size.CGFloat width = width;
            v166.size.CGFloat height = height;
            double MinX = CGRectGetMinX(v166);
            v167.origin.CGFloat x = v31;
            v167.origin.CGFloat y = v137;
            v167.size.CGFloat width = v35;
            v167.size.CGFloat height = v37;
            double v125 = MinX - CGRectGetMinX(v167);
            v168.origin.CGFloat x = v132;
            v168.origin.CGFloat y = v137;
            v168.size.CGFloat width = v35;
            v168.size.CGFloat height = v37;
            double MaxX = CGRectGetMaxX(v168);
            v169.origin.CGFloat x = x;
            v169.origin.CGFloat y = rect;
            v169.size.CGFloat width = width;
            v169.size.CGFloat height = height;
            double v81 = MaxX - CGRectGetMaxX(v169);
            double v31 = v132;
            if (v125 < v81) {
              goto LABEL_97;
            }
          }
          else
          {
            if (v66 == 1)
            {
LABEL_97:
              v103 = &v157[v77 - 1];
              double v104 = CGRectGetMaxX(*v103);
              v192.origin.CGFloat x = x;
              v192.origin.CGFloat y = rect;
              v192.size.CGFloat width = width;
              v192.size.CGFloat height = height;
              double v105 = CGRectGetMaxX(v192);
              CGFloat v33 = v137;
              if (v77 < 2 || v104 < v105) {
                goto LABEL_63;
              }
              CGSize size = v103->size;
              v157[0].origin = v103->origin;
              v157[0].CGSize size = size;
LABEL_100:
              unsigned int v77 = 1;
              goto LABEL_63;
            }
            if (v66) {
              goto LABEL_62;
            }
          }
          double v101 = CGRectGetMinX(v157[0]);
          v191.origin.CGFloat x = x;
          v191.origin.CGFloat y = rect;
          v191.size.CGFloat width = width;
          v191.size.CGFloat height = height;
          BOOL v102 = v101 > CGRectGetMinX(v191);
          CGFloat v33 = v137;
          if (!v102) {
            goto LABEL_100;
          }
        }
        else
        {
          v171.origin.CGFloat x = v31;
          v171.origin.CGFloat y = v137;
          v171.size.CGFloat width = v35;
          v171.size.CGFloat height = v37;
          double v92 = CGRectGetMaxX(v171);
          v172.origin.CGFloat x = x;
          v172.origin.CGFloat y = rect;
          v172.size.CGFloat width = width;
          v172.size.CGFloat height = height;
          if (v92 <= CGRectGetMaxX(v172)) {
            goto LABEL_84;
          }
          v173.origin.CGFloat x = v74;
          v173.origin.CGFloat y = v137;
          v173.size.CGFloat width = v129;
          v173.size.CGFloat height = v37;
          double v93 = CGRectGetMinX(v173);
          v174.origin.CGFloat x = x;
          v174.origin.CGFloat y = rect;
          v174.size.CGFloat width = width;
          v174.size.CGFloat height = height;
          if (v93 >= CGRectGetMinX(v174))
          {
LABEL_84:
            v186.origin.CGFloat x = x;
            v186.origin.CGFloat y = rect;
            v186.size.CGFloat width = width;
            v186.size.CGFloat height = height;
            v200.origin.CGFloat x = v74;
            v200.origin.CGFloat y = v137;
            v200.size.CGFloat width = v129;
            v200.size.CGFloat height = v37;
            CGRect v187 = CGRectIntersection(v186, v200);
            double v96 = v187.size.width;
            CGFloat v97 = v187.size.height;
            CGFloat rectb = v187.origin.x;
            CGFloat y = v187.origin.y;
            double v98 = CGRectGetMaxX(v187);
            v188.origin.CGFloat x = v74;
            v188.origin.CGFloat y = v137;
            v188.size.CGFloat width = v129;
            v188.size.CGFloat height = v37;
            if (v98 >= CGRectGetMaxX(v188))
            {
              int v100 = 0;
              CGFloat v99 = v74;
            }
            else
            {
              v189.origin.CGFloat x = rectb;
              v189.origin.CGFloat y = y;
              v189.size.CGFloat width = v96;
              v189.size.CGFloat height = v97;
              CGFloat v99 = CGRectGetMaxX(v189);
              int v100 = 1;
            }
            double v31 = v74;
            double v35 = v129;
            v190.origin.CGFloat x = v99;
            CGFloat v33 = v137;
            v190.origin.CGFloat y = v137;
            v190.size.CGFloat width = v129 - v96;
            v190.size.CGFloat height = v37;
            if (CGRectGetWidth(v190) >= 20.0 && (v66 == 2 || v69 == 3 || v100 != (v66 == 0)))
            {
              v157[0].origin.CGFloat x = v99;
              v157[0].origin.CGFloat y = v137;
              unsigned int v77 = 1;
              v157[0].size.CGFloat width = v129 - v96;
              v157[0].size.CGFloat height = v37;
            }
            else
            {
              unsigned int v77 = 0;
            }
          }
          else
          {
            v175.origin.CGFloat x = v74;
            v175.origin.CGFloat y = v137;
            v175.size.CGFloat width = v129;
            v175.size.CGFloat height = v37;
            v120.CGFloat x = CGRectGetMinX(v175);
            v176.origin.CGFloat x = v74;
            v176.origin.CGFloat y = v137;
            v176.size.CGFloat width = v129;
            v176.size.CGFloat height = v37;
            v120.CGFloat y = CGRectGetMinY(v176);
            v177.origin.CGFloat x = x;
            v177.origin.CGFloat y = rect;
            v177.size.CGFloat width = width;
            v177.size.CGFloat height = height;
            double v126 = CGRectGetMinX(v177);
            v178.origin.CGFloat x = v74;
            v178.origin.CGFloat y = v137;
            v178.size.CGFloat width = v129;
            v178.size.CGFloat height = v37;
            double v122 = v126 - CGRectGetMinX(v178);
            v179.origin.CGFloat x = v74;
            v179.origin.CGFloat y = v137;
            v179.size.CGFloat width = v129;
            v179.size.CGFloat height = v37;
            CGFloat v121 = CGRectGetHeight(v179);
            v180.origin.CGFloat x = x;
            v180.origin.CGFloat y = rect;
            v180.size.CGFloat width = width;
            v180.size.CGFloat height = height;
            CGFloat v127 = CGRectGetMaxX(v180);
            v181.origin.CGFloat x = v132;
            v181.origin.CGFloat y = v137;
            v181.size.CGFloat width = v129;
            v181.size.CGFloat height = v37;
            CGFloat MinY = CGRectGetMinY(v181);
            v182.origin.CGFloat x = v132;
            v182.origin.CGFloat y = v137;
            v182.size.CGFloat width = v129;
            v182.size.CGFloat height = v37;
            double v119 = CGRectGetMaxX(v182);
            v183.origin.CGFloat x = x;
            v183.origin.CGFloat y = rect;
            v183.size.CGFloat width = width;
            v183.size.CGFloat height = height;
            double recta = v119 - CGRectGetMaxX(v183);
            v184.origin.CGFloat x = v132;
            v184.origin.CGFloat y = v137;
            v184.size.CGFloat width = v129;
            v184.size.CGFloat height = v37;
            CGFloat v94 = CGRectGetHeight(v184);
            v185.origin = v120;
            v185.size.CGFloat height = v121;
            v185.size.CGFloat width = v122;
            double v31 = v132;
            if (CGRectGetWidth(v185) >= 20.0)
            {
              CGFloat v33 = v137;
              CGFloat v95 = recta;
              double v35 = v129;
              if ((v66 & 0xFFFFFFFD) == 0) {
                goto LABEL_106;
              }
              if (v69 != 3) {
                goto LABEL_105;
              }
              v193.origin = v120;
              v193.size.CGFloat height = v121;
              v193.size.CGFloat width = v122;
              double v107 = CGRectGetWidth(v193);
              v194.origin.CGFloat y = MinY;
              v194.origin.CGFloat x = v127;
              v194.size.CGFloat width = recta;
              v194.size.CGFloat height = v94;
              BOOL v108 = v107 < CGRectGetWidth(v194);
              double v31 = v132;
              if (v108)
              {
LABEL_105:
                unsigned int v77 = 0;
              }
              else
              {
LABEL_106:
                v157[0].origin = v120;
                unsigned int v77 = 1;
                v157[0].size.CGFloat width = v122;
                v157[0].size.CGFloat height = v121;
              }
            }
            else
            {
              unsigned int v77 = 0;
              CGFloat v33 = v137;
              CGFloat v95 = recta;
              double v35 = v129;
            }
            v195.origin.CGFloat y = MinY;
            v195.origin.CGFloat x = v127;
            v195.size.CGFloat width = v95;
            v195.size.CGFloat height = v94;
            if (CGRectGetWidth(v195) >= 20.0)
            {
              if (v66 - 1 < 2) {
                goto LABEL_109;
              }
              if (v69 == 3)
              {
                v196.origin = v120;
                v196.size.CGFloat height = v121;
                v196.size.CGFloat width = v122;
                double v110 = CGRectGetWidth(v196);
                v197.origin.CGFloat y = MinY;
                v197.origin.CGFloat x = v127;
                v197.size.CGFloat width = v95;
                v197.size.CGFloat height = v94;
                BOOL v108 = v110 < CGRectGetWidth(v197);
                double v31 = v132;
                if (v108)
                {
LABEL_109:
                  v109 = &v157[v77];
                  v109->origin.CGFloat x = v127;
                  v109->origin.CGFloat y = MinY;
                  ++v77;
                  v109->size.CGFloat width = v95;
                  v109->size.CGFloat height = v94;
                }
              }
            }
          }
        }
      }
      else
      {
        v157[0].origin.CGFloat x = v31;
        v157[0].origin.CGFloat y = v33;
        unsigned int v77 = 1;
        v157[0].size.CGFloat width = v35;
        v157[0].size.CGFloat height = v37;
      }
      if (!v62) {
        goto LABEL_64;
      }
LABEL_63:
      uint64_t v82 = 0;
      unint64_t v83 = 0;
      uint64_t v84 = v62;
      do
      {
        if (v77 && v83 <= 0x80)
        {
          p_CGSize size = &v157[0].size;
          unint64_t v86 = 1;
          do
          {
            CGRect v170 = CGRectIntersection(*(CGRect *)&__dst[4 * v82], *(CGRect *)&p_size[-1].width);
            CGFloat v87 = v170.origin.x;
            CGFloat v88 = v170.origin.y;
            double v89 = v170.size.width;
            CGFloat v90 = v170.size.height;
            if (!CGRectIsEmpty(v170) && v89 >= 20.0)
            {
              v91 = (CGFloat *)&v161[2 * v83];
              CGFloat *v91 = v87;
              v91[1] = v88;
              ++v83;
              v91[2] = v89;
              v91[3] = v90;
            }
            if (v86 >= v77) {
              break;
            }
            ++v86;
            p_size += 2;
          }
          while (v83 < 0x81);
        }
        ++v82;
      }
      while (v82 != v84);
      if (v83)
      {
        memcpy(__dst, v161, 32 * v83);
        if (v83 > 0x7F) {
          goto LABEL_119;
        }
        uint64_t v62 = v83;
      }
      else
      {
LABEL_64:
        uint64_t v62 = 0;
      }
LABEL_78:
      uint64_t v64 = v143 + 1;
    }
    while ((id)(v143 + 1) != v142);
    id v111 = [v47 countByEnumeratingWithState:&v145 objects:v158 count:16];
    id v142 = v111;
  }
  while (v111);

  if (!v62) {
    return v62;
  }
LABEL_120:
  v112 = __dst + 2;
  uint64_t v113 = v62;
  do
  {
    objc_msgSend(objc_msgSend(v26, "target"), "targetRectForCanvasRect:", *(v112 - 2), *(v112 - 1), *v112, v112[1]);
    *((void *)v112 - 2) = v114;
    *((void *)v112 - 1) = v115;
    *(void *)v112 = v116;
    *((void *)v112 + 1) = v117;
    v112 += 4;
    --v113;
  }
  while (v113);
  return v62;
}

- (double)nextUnobstructedSpanStartingAt:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5
{
  return 0.0;
}

- (unsigned)p_pageIndexForTarget:(id)a3
{
  return [(id)TSUDynamicCast() pageIndex];
}

- (unsigned)p_splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappable:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = [a5 wrapPolygon];
  if (!v11)
  {
    [a5 frameInRoot];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    v39.origin.double x = x;
    v39.origin.double y = y;
    v39.size.double width = width;
    v39.size.double height = height;
    v53.origin.double x = v13;
    v53.origin.double y = v15;
    v53.size.double width = v17;
    v53.size.double height = v19;
    if (CGRectIntersectsRect(v39, v53))
    {
      v40.origin.double x = v13;
      v40.origin.double y = v15;
      v40.size.double width = v17;
      v40.size.double height = v19;
      double MinX = CGRectGetMinX(v40);
      v41.origin.double x = x;
      v41.origin.double y = y;
      v41.size.double width = width;
      v41.size.double height = height;
      CGFloat v20 = CGRectGetMinX(v41);
      v42.size.double height = v19;
      double v21 = v20;
      v42.origin.double x = v13;
      v42.origin.double y = v15;
      v42.size.double width = v17;
      CGFloat rect = v42.size.height;
      double MaxX = CGRectGetMaxX(v42);
      v43.origin.double x = x;
      v43.origin.double y = y;
      v43.size.double width = width;
      v43.size.double height = height;
      double v22 = CGRectGetMaxX(v43);
      if (MinX <= v21)
      {
        if (MaxX > v22) {
          return 0;
        }
        v50.origin.double x = v13;
        v50.origin.double y = v15;
        v50.size.double width = v17;
        v50.size.double height = rect;
        CGFloat v36 = CGRectGetMaxX(v50);
        v51.origin.double x = x;
        v51.origin.double y = y;
        v51.size.double width = width;
        v51.size.double height = height;
        double v28 = CGRectGetMaxX(v51);
        v52.origin.double x = v13;
        v52.origin.double y = v15;
        v52.size.double width = v17;
        v52.size.double height = rect;
        CGFloat v29 = CGRectGetMaxX(v52);
        a4->origin.double x = v36;
        a4->origin.double y = y;
        a4->size.double width = v28 - v29;
        p_double height = &a4->size.height;
        unsigned int result = 1;
      }
      else
      {
        v44.origin.double x = x;
        double v34 = v22;
        v44.origin.double y = y;
        v44.size.double width = width;
        v44.size.double height = height;
        CGFloat v31 = CGRectGetMinX(v44);
        v45.origin.double x = v13;
        v45.origin.double y = v15;
        v45.size.double width = v17;
        v45.size.double height = rect;
        double v23 = CGRectGetMinX(v45);
        v46.origin.double x = x;
        v46.origin.double y = y;
        v46.size.double width = width;
        v46.size.double height = height;
        CGFloat v24 = CGRectGetMinX(v46);
        a4->origin.double x = v31;
        a4->origin.double y = y;
        a4->size.double width = v23 - v24;
        a4->size.double height = height;
        if (MaxX >= v34) {
          return 1;
        }
        v47.origin.double x = v13;
        v47.origin.double y = v15;
        v47.size.double width = v17;
        v47.size.double height = rect;
        CGFloat v35 = CGRectGetMaxX(v47);
        v48.origin.double x = x;
        v48.origin.double y = y;
        v48.size.double width = width;
        v48.size.double height = height;
        double v25 = CGRectGetMaxX(v48);
        v49.origin.double x = v13;
        v49.origin.double y = v15;
        v49.size.double width = v17;
        v49.size.double height = rect;
        CGFloat v26 = CGRectGetMaxX(v49);
        a4[1].origin.double x = v35;
        a4[1].origin.double y = y;
        a4[1].size.double width = v25 - v26;
        p_double height = &a4[1].size.height;
        unsigned int result = 2;
      }
    }
    else
    {
      a4->origin.double x = x;
      a4->origin.double y = y;
      p_double height = &a4->size.height;
      unsigned int result = 1;
      a4->size.double width = width;
    }
    *p_double height = height;
    return result;
  }

  return +[TSWPTextWrapper splitLine:lineSegmentRects:polygon:type:skipHint:](TSWPTextWrapper, "splitLine:lineSegmentRects:polygon:type:skipHint:", a4, v11, 1, 0, x, y, width, height);
}

@end