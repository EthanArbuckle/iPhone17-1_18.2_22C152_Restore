@interface SXTextTangierTextWrapper
- (BOOL)textShouldFlowAroundWrappable:(id)a3 inTarget:(id)a4 inColumn:(id)a5;
- (CGAffineTransform)canvasSpaceToWrapSpace;
- (CGAffineTransform)wrapSpaceToCanvasSpace;
- (NSArray)exclusionPaths;
- (NSMutableArray)tangierExclusionPaths;
- (double)nextUnobstructedSpanStartingAt:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5;
- (id)beginWrappingToColumn:(id)a3 target:(id)a4 hasWrapables:(BOOL *)a5;
- (id)collectWrappables:(id)a3 target:(id)a4;
- (id)groupInfoContainingWrappable:(id)a3;
- (unint64_t)intersectRects:(CGRect *)a3 rects1Count:(unint64_t)a4 rects2:(const CGRect *)a5 rects2Count:(unint64_t)a6 minSize:(double)a7;
- (unint64_t)splitLineRect:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappable:(id)a5 wrapContext:(id)a6;
- (unint64_t)splitLineRect:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappableRect:(CGRect)a5;
- (unsigned)splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappableAttachments:(id)a5 ignoreFloatingGraphics:(BOOL)a6 floatingCausedWrap:(BOOL *)a7 skipHint:(double *)a8 userInfo:(id)a9;
- (void)setCanvasSpaceToWrapSpace:(CGAffineTransform *)a3;
- (void)setExclusionPaths:(id)a3;
- (void)setTangierExclusionPaths:(id)a3;
- (void)setWrapSpaceToCanvasSpace:(CGAffineTransform *)a3;
@end

@implementation SXTextTangierTextWrapper

- (void)setExclusionPaths:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_exclusionPaths, a3);
  v6 = [(SXTextTangierTextWrapper *)self tangierExclusionPaths];
  [v6 removeAllObjects];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = [(SXTextTangierTextWrapper *)self exclusionPaths];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = -[SXTextExclusionPath path](*(double **)(*((void *)&v14 + 1) + 8 * v10));
        v12 = [v11 TSDBezierPath];

        v13 = [(SXTextTangierTextWrapper *)self tangierExclusionPaths];
        [v13 addObject:v12];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (id)beginWrappingToColumn:(id)a3 target:(id)a4 hasWrapables:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [[SXTextTangierTextWrapContext alloc] initWithColumn:v8 targetLayout:v9];
  long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&self->_canvasSpaceToWrapSpace.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&self->_canvasSpaceToWrapSpace.c = v12;
  *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx = v11;
  if ([v9 textIsVertical])
  {
    p_canvasSpaceToWrapSpace = &self->_canvasSpaceToWrapSpace;
    long long v14 = *(_OWORD *)&p_canvasSpaceToWrapSpace->c;
    *(_OWORD *)&v19.a = *(_OWORD *)&p_canvasSpaceToWrapSpace->a;
    *(_OWORD *)&v19.c = v14;
    *(_OWORD *)&v19.tx = *(_OWORD *)&p_canvasSpaceToWrapSpace->tx;
    CGAffineTransformRotate(&v20, &v19, -1.57079633);
    long long v15 = *(_OWORD *)&v20.c;
    *(_OWORD *)&p_canvasSpaceToWrapSpace->a = *(_OWORD *)&v20.a;
    *(_OWORD *)&p_canvasSpaceToWrapSpace->c = v15;
    *(_OWORD *)&p_canvasSpaceToWrapSpace->tx = *(_OWORD *)&v20.tx;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    long long v16 = [v9 info];
    long long v17 = TSUDynamicCast();

    if (v17 && [v17 attachmentCount]) {
      *a5 = 1;
    }
  }
  return v10;
}

- (unsigned)splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappableAttachments:(id)a5 ignoreFloatingGraphics:(BOOL)a6 floatingCausedWrap:(BOOL *)a7 skipHint:(double *)a8 userInfo:(id)a9
{
  uint64_t v9 = MEMORY[0x270FA5388](self, a2, a4, a5, a6, a7, a8, a9, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  long long v11 = v10;
  v13 = v12;
  v92 = v14;
  double v16 = v15;
  double v98 = v17;
  double v99 = v18;
  double v20 = v19;
  uint64_t v100 = v9;
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v89 = v21;
  id v84 = v11;
  objc_opt_class();
  v95 = TSUDynamicCast();
  v91 = [v95 column];
  v93 = [v95 target];
  if (v13) {
    double *v13 = 1.0;
  }
  double *v92 = v98;
  v92[1] = v20;
  v92[2] = v99;
  v92[3] = v16;
  v22 = [v95 interiorWrapPolygon];
  v23 = (void *)[v22 copy];

  v85 = v23;
  if (v23)
  {
    long long v24 = *(_OWORD *)(v100 + 40);
    v107[0] = *(_OWORD *)(v100 + 24);
    v107[1] = v24;
    v107[2] = *(_OWORD *)(v100 + 56);
    [v23 transformUsingAffineTransform:v107];
    unint64_t v96 = objc_msgSend((id)v100, "intersectRects:rects1Count:rects2:rects2Count:minSize:", v92, 1, rect, objc_msgSend(MEMORY[0x263F7C7A0], "splitLine:lineSegmentRects:polygon:type:skipHint:", rect, v23, 0, 0, v98, v20, v99, v16), 0.01);
  }
  else
  {
    unint64_t v96 = 1;
  }
  [(id)v100 collectWrappables:v89 target:v93];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [obj countByEnumeratingWithState:&v103 objects:v108 count:16];
  if (v25)
  {
    v90 = v13;
    uint64_t v97 = *(void *)v104;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v104 != v97) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v103 + 1) + 8 * v26);
        int v28 = objc_msgSend(v27, "wrapDirection", v78);
        int v29 = [v27 wrapFitType];
        int v30 = [v27 wrapType];
        objc_opt_class();
        v78 = &unk_26D5AAA80;
        v31 = TSUClassAndProtocolCast();
        if (v31)
        {
          v32 = objc_msgSend((id)v100, "groupInfoContainingWrappable:", v31, &unk_26D5AAA80);
          v33 = v32;
          if (v32)
          {
            v34 = [v32 exteriorTextWrap];
            if (([v34 isHTMLWrap] & 1) != 0 || objc_msgSend(v33, "isInlineWithText"))
            {
              if (v34)
              {
                int v28 = [v34 direction];
                int v29 = [v34 fitType];
                int v30 = [v34 type];
              }
              else
              {
                int v30 = 0;
                int v29 = 0;
                int v28 = 2;
              }
            }
          }
        }
        if (v30) {
          BOOL v35 = v30 == 5;
        }
        else {
          BOOL v35 = 1;
        }
        if (v35) {
          goto LABEL_65;
        }
        if (v30 == 4)
        {
          if ([(id)v100 textShouldFlowAroundWrappable:v27 inTarget:v93 inColumn:v91])
          {
            int v28 = 2;
            int v30 = 1;
          }
          else
          {
            int v30 = 2;
          }
        }
        objc_msgSend(v27, "boundsInfluencingExteriorWrap", v78);
        CGFloat v37 = v36;
        CGFloat v39 = v38;
        CGFloat v41 = v40;
        CGFloat v43 = v42;
        if (v95) {
          [v95 targetInverseTransformInRoot];
        }
        else {
          memset(&v102, 0, sizeof(v102));
        }
        v111.origin.CGFloat x = v37;
        v111.origin.CGFloat y = v39;
        v111.size.CGFloat width = v41;
        v111.size.CGFloat height = v43;
        CGRect v112 = CGRectApplyAffineTransform(v111, &v102);
        long long v44 = *(_OWORD *)(v100 + 40);
        *(_OWORD *)&v101.a = *(_OWORD *)(v100 + 24);
        *(_OWORD *)&v101.c = v44;
        *(_OWORD *)&v101.tCGFloat x = *(_OWORD *)(v100 + 56);
        CGRect v113 = CGRectApplyAffineTransform(v112, &v101);
        CGFloat x = v113.origin.x;
        CGFloat y = v113.origin.y;
        CGFloat width = v113.size.width;
        CGFloat height = v113.size.height;
        v147.origin.CGFloat x = v98;
        v147.size.CGFloat width = v99;
        v147.origin.CGFloat y = v20;
        v147.size.CGFloat height = v16;
        if (!CGRectIntersectsRect(v113, v147))
        {
          rect[0].origin.CGFloat x = v98;
          rect[0].origin.CGFloat y = v20;
          rect[0].size.CGFloat width = v99;
          rect[0].size.CGFloat height = v16;
          goto LABEL_65;
        }
        if (v30 == 2)
        {
          if (!v90) {
            goto LABEL_63;
          }
          double v49 = *v90;
          v114.origin.CGFloat x = x;
          v114.origin.CGFloat y = y;
          v114.size.CGFloat width = width;
          v114.size.CGFloat height = height;
          double MaxY = CGRectGetMaxY(v114);
          v115.origin.CGFloat x = v98;
          v115.size.CGFloat width = v99;
          v115.origin.CGFloat y = v20;
          v115.size.CGFloat height = v16;
          uint64_t v51 = 0;
          double v52 = ceil(MaxY - CGRectGetMinY(v115));
          if (v49 >= v52) {
            double v52 = v49;
          }
          double *v90 = v52;
        }
        else if (v29)
        {
          if (v29 != 1) {
            goto LABEL_63;
          }
          uint64_t v51 = objc_msgSend((id)v100, "splitLineRect:lineSegmentRects:wrappable:wrapContext:", rect, v27, v95, v98, v20, v99, v16);
          if (!v51) {
            goto LABEL_64;
          }
          if (v30 == 3)
          {
            v116.origin.CGFloat x = x;
            v116.origin.CGFloat y = y;
            v116.size.CGFloat width = width;
            v116.size.CGFloat height = height;
            double MinX = CGRectGetMinX(v116);
            v117.origin.CGFloat x = v98;
            v117.size.CGFloat width = v99;
            v117.origin.CGFloat y = v20;
            v117.size.CGFloat height = v16;
            double v53 = CGRectGetMinX(v117);
            v118.origin.CGFloat x = v98;
            v118.size.CGFloat width = v99;
            v118.origin.CGFloat y = v20;
            v118.size.CGFloat height = v16;
            double MaxX = CGRectGetMaxX(v118);
            v119.origin.CGFloat x = x;
            v119.origin.CGFloat y = y;
            v119.size.CGFloat width = width;
            v119.size.CGFloat height = height;
            if (MinX - v53 >= MaxX - CGRectGetMaxX(v119)) {
              goto LABEL_61;
            }
          }
          else if (v28 != 1)
          {
            if (v28) {
              goto LABEL_64;
            }
LABEL_61:
            double v70 = CGRectGetMinX(rect[0]);
            v142.origin.CGFloat x = x;
            v142.origin.CGFloat y = y;
            v142.size.CGFloat width = width;
            v142.size.CGFloat height = height;
            uint64_t v51 = v70 <= CGRectGetMinX(v142);
            goto LABEL_64;
          }
          v71 = &rect[v51 - 1];
          double v72 = CGRectGetMaxX(*v71);
          v143.origin.CGFloat x = x;
          v143.origin.CGFloat y = y;
          v143.size.CGFloat width = width;
          v143.size.CGFloat height = height;
          if (v72 < CGRectGetMaxX(v143)) {
            goto LABEL_63;
          }
          CGSize size = rect[v51 - 1].size;
          rect[0].origin = v71->origin;
          rect[0].CGSize size = size;
          uint64_t v51 = 1;
        }
        else
        {
          v120.origin.CGFloat x = v98;
          v120.size.CGFloat width = v99;
          v120.origin.CGFloat y = v20;
          v120.size.CGFloat height = v16;
          double v55 = CGRectGetMaxX(v120);
          v121.origin.CGFloat x = x;
          v121.origin.CGFloat y = y;
          v121.size.CGFloat width = width;
          v121.size.CGFloat height = height;
          if (v55 <= CGRectGetMaxX(v121)) {
            goto LABEL_51;
          }
          v122.origin.CGFloat x = v98;
          v122.size.CGFloat width = v99;
          v122.origin.CGFloat y = v20;
          v122.size.CGFloat height = v16;
          double v56 = CGRectGetMinX(v122);
          v123.origin.CGFloat x = x;
          v123.origin.CGFloat y = y;
          v123.size.CGFloat width = width;
          v123.size.CGFloat height = height;
          if (v56 >= CGRectGetMinX(v123))
          {
LABEL_51:
            v137.origin.CGFloat x = x;
            v137.origin.CGFloat y = y;
            v137.size.CGFloat width = width;
            v137.size.CGFloat height = height;
            v148.origin.CGFloat x = v98;
            v148.size.CGFloat width = v99;
            v148.origin.CGFloat y = v20;
            v148.size.CGFloat height = v16;
            CGRect v138 = CGRectIntersection(v137, v148);
            CGFloat v62 = v138.origin.x;
            CGFloat v63 = v138.origin.y;
            double v64 = v138.size.width;
            CGFloat v65 = v138.size.height;
            double v66 = CGRectGetMaxX(v138);
            v139.origin.CGFloat x = v98;
            v139.size.CGFloat width = v99;
            v139.origin.CGFloat y = v20;
            v139.size.CGFloat height = v16;
            if (v66 >= CGRectGetMaxX(v139))
            {
              int v68 = 0;
              CGFloat v67 = v98;
            }
            else
            {
              v140.origin.CGFloat x = v62;
              v140.origin.CGFloat y = v63;
              v140.size.CGFloat width = v64;
              v140.size.CGFloat height = v65;
              CGFloat v67 = CGRectGetMaxX(v140);
              int v68 = 1;
            }
            double v69 = v99 - v64;
            v141.origin.CGFloat x = v67;
            v141.origin.CGFloat y = v20;
            v141.size.CGFloat width = v69;
            v141.size.CGFloat height = v16;
            if (CGRectGetWidth(v141) >= 20.0 && (v28 == 2 || v30 == 3 || v68 != (v28 == 0)))
            {
              rect[0].origin.CGFloat x = v67;
              rect[0].origin.CGFloat y = v20;
              uint64_t v51 = 1;
              rect[0].size.CGFloat width = v69;
              rect[0].size.CGFloat height = v16;
              goto LABEL_64;
            }
LABEL_63:
            uint64_t v51 = 0;
            goto LABEL_64;
          }
          v124.origin.CGFloat x = v98;
          v124.origin.CGFloat y = v20;
          v124.size.CGFloat width = v99;
          v124.size.CGFloat height = v16;
          CGFloat v81 = CGRectGetMinX(v124);
          v125.origin.CGFloat x = v98;
          v125.origin.CGFloat y = v20;
          v125.size.CGFloat width = v99;
          v125.size.CGFloat height = v16;
          CGFloat MinY = CGRectGetMinY(v125);
          v126.origin.CGFloat x = x;
          v126.origin.CGFloat y = y;
          v126.size.CGFloat width = width;
          v126.size.CGFloat height = height;
          double v80 = CGRectGetMinX(v126);
          v127.origin.CGFloat x = v98;
          v127.origin.CGFloat y = v20;
          v127.size.CGFloat width = v99;
          v127.size.CGFloat height = v16;
          double v79 = CGRectGetMinX(v127);
          v128.origin.CGFloat x = v98;
          v128.origin.CGFloat y = v20;
          v128.size.CGFloat width = v99;
          v128.size.CGFloat height = v16;
          CGFloat v82 = CGRectGetHeight(v128);
          v129.origin.CGFloat x = x;
          v129.origin.CGFloat y = y;
          v129.size.CGFloat width = width;
          v129.size.CGFloat height = height;
          CGFloat v88 = CGRectGetMaxX(v129);
          v130.origin.CGFloat x = v98;
          v130.size.CGFloat width = v99;
          v130.origin.CGFloat y = v20;
          v130.size.CGFloat height = v16;
          CGFloat v86 = CGRectGetMinY(v130);
          v131.origin.CGFloat x = v98;
          v131.size.CGFloat width = v99;
          v131.origin.CGFloat y = v20;
          v131.size.CGFloat height = v16;
          double v57 = CGRectGetMaxX(v131);
          v132.origin.CGFloat x = x;
          v132.origin.CGFloat y = y;
          v132.size.CGFloat width = width;
          v132.size.CGFloat height = height;
          double v58 = CGRectGetMaxX(v132);
          v133.origin.CGFloat x = v98;
          v133.size.CGFloat width = v99;
          v133.origin.CGFloat y = v20;
          v133.size.CGFloat height = v16;
          CGFloat v59 = CGRectGetHeight(v133);
          v134.origin.CGFloat x = v81;
          v134.size.CGFloat height = v82;
          v134.origin.CGFloat y = MinY;
          v134.size.CGFloat width = v80 - v79;
          double v60 = v57 - v58;
          if (CGRectGetWidth(v134) < 20.0) {
            goto LABEL_50;
          }
          if ((v28 & 0xFFFFFFFD) == 0) {
            goto LABEL_68;
          }
          if (v30 != 3) {
            goto LABEL_50;
          }
          v135.origin.CGFloat x = v81;
          v135.size.CGFloat height = v82;
          v135.origin.CGFloat y = MinY;
          v135.size.CGFloat width = v80 - v79;
          double v61 = CGRectGetWidth(v135);
          v136.origin.CGFloat y = v86;
          v136.origin.CGFloat x = v88;
          v136.size.CGFloat width = v60;
          v136.size.CGFloat height = v59;
          if (v61 >= CGRectGetWidth(v136))
          {
LABEL_68:
            rect[0].origin.CGFloat x = v88;
            rect[0].origin.CGFloat y = v86;
            uint64_t v51 = 1;
            rect[0].size.CGFloat width = v60;
            rect[0].size.CGFloat height = v59;
          }
          else
          {
LABEL_50:
            uint64_t v51 = 0;
          }
          v144.origin.CGFloat y = v86;
          v144.origin.CGFloat x = v88;
          v144.size.CGFloat width = v60;
          v144.size.CGFloat height = v59;
          if (CGRectGetWidth(v144) >= 20.0)
          {
            if ((v28 - 1) < 2) {
              goto LABEL_71;
            }
            if (v30 == 3)
            {
              v145.origin.CGFloat x = v81;
              v145.size.CGFloat height = v82;
              v145.origin.CGFloat y = MinY;
              v145.size.CGFloat width = v80 - v79;
              double v75 = CGRectGetWidth(v145);
              v146.origin.CGFloat y = v86;
              v146.origin.CGFloat x = v88;
              v146.size.CGFloat width = v60;
              v146.size.CGFloat height = v59;
              if (v75 < CGRectGetWidth(v146))
              {
LABEL_71:
                v74 = &rect[v51];
                v74->origin.CGFloat x = v88;
                v74->origin.CGFloat y = v86;
                ++v51;
                v74->size.CGFloat width = v60;
                v74->size.CGFloat height = v59;
              }
            }
          }
        }
LABEL_64:
        unint64_t v96 = [(id)v100 intersectRects:v92 rects1Count:v96 rects2:rect rects2Count:v51 minSize:20.0];
        if (v96 >= 0x80)
        {

          goto LABEL_78;
        }
LABEL_65:

        ++v26;
      }
      while (v25 != v26);
      uint64_t v76 = [obj countByEnumeratingWithState:&v103 objects:v108 count:16];
      uint64_t v25 = v76;
    }
    while (v76);
  }
LABEL_78:

  return v96;
}

- (double)nextUnobstructedSpanStartingAt:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v73 = a4;
  id v71 = a5;
  objc_opt_class();
  v74 = TSUDynamicCast();
  double v75 = [v74 target];
  double v72 = -[SXTextTangierTextWrapper collectWrappables:target:](self, "collectWrappables:target:", v73);
  long long v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v72, "count"));
  objc_msgSend(v75, "rectInRoot:", x, y, width, height);
  long long v12 = *(_OWORD *)&self->_canvasSpaceToWrapSpace.c;
  *(_OWORD *)&v87.a = *(_OWORD *)&self->_canvasSpaceToWrapSpace.a;
  *(_OWORD *)&v87.c = v12;
  *(_OWORD *)&v87.tdouble x = *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx;
  CGRect v91 = CGRectApplyAffineTransform(v90, &v87);
  CGFloat v13 = v91.origin.x;
  CGFloat v14 = v91.origin.y;
  CGFloat v15 = v91.size.width;
  CGFloat v16 = v91.size.height;
  double v17 = [v74 column];
  double v59 = v16;
  double v60 = v15;
  double v61 = v14;
  double v62 = v13;
  double v63 = x;
  double v64 = y;
  double v65 = width;
  double rect = height;
  [v17 frameBounds];
  objc_msgSend(v75, "rectInRoot:");
  double v69 = self;
  p_canvasSpaceToWrapSpace = &self->_canvasSpaceToWrapSpace;
  long long v19 = *(_OWORD *)&self->_canvasSpaceToWrapSpace.c;
  *(_OWORD *)&v86.a = *(_OWORD *)&self->_canvasSpaceToWrapSpace.a;
  *(_OWORD *)&v86.c = v19;
  *(_OWORD *)&v86.tdouble x = *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx;
  CGRect v93 = CGRectApplyAffineTransform(v92, &v86);
  double v20 = v93.origin.x;
  double v21 = v93.origin.y;
  double v22 = v93.size.width;
  double v23 = v93.size.height;

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id v24 = v72;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v82 objects:v88 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v83 != v26) {
          objc_enumerationMutation(v24);
        }
        int v28 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        [v28 boundsInfluencingExteriorWrap];
        long long v29 = *(_OWORD *)&p_canvasSpaceToWrapSpace->c;
        *(_OWORD *)&v81.a = *(_OWORD *)&p_canvasSpaceToWrapSpace->a;
        *(_OWORD *)&v81.c = v29;
        *(_OWORD *)&v81.tdouble x = *(_OWORD *)&p_canvasSpaceToWrapSpace->tx;
        CGRect v95 = CGRectApplyAffineTransform(v94, &v81);
        double v30 = v95.origin.x;
        double v31 = v95.origin.y;
        double v32 = v95.size.width;
        double v33 = v95.size.height;
        v97.origin.double x = v20;
        v97.origin.double y = v21;
        v97.size.double width = v22;
        v97.size.double height = v23;
        if (CGRectIntersectsRect(v95, v97))
        {
          int v34 = [v28 wrapFitType];
          if ([v28 wrapType] == 2)
          {
            uint64_t v35 = objc_msgSend(MEMORY[0x263F7C690], "bezierPathWithRect:", v20, v31, v22, v33);
            goto LABEL_14;
          }
          if (v34)
          {
            if (v34 == 1)
            {
              double v36 = [v28 wrapPolygon];
              CGFloat v37 = [v36 bezierPath];
              double v38 = (void *)[v37 copy];

              long long v39 = *(_OWORD *)&p_canvasSpaceToWrapSpace->c;
              v80[0] = *(_OWORD *)&p_canvasSpaceToWrapSpace->a;
              v80[1] = v39;
              v80[2] = *(_OWORD *)&p_canvasSpaceToWrapSpace->tx;
              [v38 transformUsingAffineTransform:v80];
              if (!v38) {
                goto LABEL_17;
              }
LABEL_15:
              [v11 addObject:v38];
            }
            else
            {
              double v38 = 0;
            }
          }
          else
          {
            uint64_t v35 = objc_msgSend(MEMORY[0x263F7C690], "bezierPathWithRect:", v30, v31, v32, v33);
LABEL_14:
            double v38 = (void *)v35;
            if (v35) {
              goto LABEL_15;
            }
          }
LABEL_17:

          continue;
        }
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v82 objects:v88 count:16];
    }
    while (v25);
  }

  if ([v11 count])
  {
    long long v40 = *(_OWORD *)&v69->_wrapSpaceToCanvasSpace.c;
    *(_OWORD *)&v79.a = *(_OWORD *)&v69->_wrapSpaceToCanvasSpace.a;
    *(_OWORD *)&v79.c = v40;
    *(_OWORD *)&v79.tdouble x = *(_OWORD *)&v69->_wrapSpaceToCanvasSpace.tx;
    double v41 = v63;
    *(double *)&long long v40 = v64;
    double v42 = v65;
    double v43 = rect;
    CGRect v96 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v40 - 8), &v79);
  }
  else
  {
    long long v44 = [MEMORY[0x263F7C690] uniteBezierPaths:v11];
    objc_msgSend(MEMORY[0x263F7C7A0], "unobstructedSpanForPath:startingSpan:columnBounds:", v44, v62, v61, v60, v59, v20, v21, v22, v23);
    double v46 = v45;
    double b = v69->_wrapSpaceToCanvasSpace.b;
    double d = v69->_wrapSpaceToCanvasSpace.d;
    tdouble y = v69->_wrapSpaceToCanvasSpace.ty;
    if (v74)
    {
      [v74 targetInverseTransformInRoot];
      float64x2_t v66 = v77;
      float64x2_t recta = v76;
      float64x2_t v70 = v78;
    }
    else
    {
      float64x2_t recta = 0u;
      float64x2_t v70 = 0u;
      float64x2_t v66 = 0u;
    }

    v96.origin.double y = vaddq_f64(v70, vmlaq_f64(vmulq_n_f64(v66, ty + v46 * d + b * 0.0), (float64x2_t)0, recta)).f64[1];
  }
  if ((*(void *)&v96.origin.y & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL) {
    goto LABEL_31;
  }
  if (v96.origin.y > 0.0 && v96.origin.y > 3.40282347e38)
  {
    double v52 = [MEMORY[0x263F7C7F0] currentHandler];
    double v53 = [NSString stringWithUTF8String:"-[SXTextTangierTextWrapper nextUnobstructedSpanStartingAt:wrappableAttachments:userInfo:]"];
    v54 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierTextWrapper.mm"];
    [v52 handleFailureInFunction:v53 file:v54 lineNumber:361 description:@"Out-of-bounds type assignment was clamped to max"];

    *(float *)&int v55 = 3.4028e38;
LABEL_35:
    float v50 = *(float *)&v55;
    goto LABEL_32;
  }
  if (v96.origin.y < 0.0 && v96.origin.y < -3.40282347e38)
  {
    double v56 = [MEMORY[0x263F7C7F0] currentHandler];
    double v57 = [NSString stringWithUTF8String:"-[SXTextTangierTextWrapper nextUnobstructedSpanStartingAt:wrappableAttachments:userInfo:]"];
    double v58 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierTextWrapper.mm"];
    [v56 handleFailureInFunction:v57 file:v58 lineNumber:361 description:@"Out-of-bounds type assignment was clamped to min"];

    *(float *)&int v55 = -3.4028e38;
    goto LABEL_35;
  }
LABEL_31:
  float v50 = v96.origin.y;
LABEL_32:

  return v50;
}

- (id)collectWrappables:(id)a3 target:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v27 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v37;
    do
    {
      uint64_t v9 = 0;
      uint64_t v25 = v7;
      do
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = [v27 validatedLayoutForAnchoredDrawable:*(void *)(*((void *)&v36 + 1) + 8 * v9)];
        long long v11 = TSUProtocolCast();
        long long v12 = TSUProtocolCast();
        CGFloat v13 = v12;
        if (v11)
        {
          [v6 addObject:v11];
        }
        else if (v12)
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          CGFloat v14 = [v12 descendentWrappables];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v33 != v16) {
                  objc_enumerationMutation(v14);
                }
                [v6 addObject:*(void *)(*((void *)&v32 + 1) + 8 * i)];
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
            }
            while (v15);
          }

          uint64_t v7 = v25;
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v7);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v18 = [(SXTextTangierTextWrapper *)self exclusionPaths];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v18);
        }
        double v22 = -[SXTextExclusionPath wrappable](*(void **)(*((void *)&v28 + 1) + 8 * j));
        [v6 addObject:v22];
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v19);
  }

  return v6;
}

- (unint64_t)intersectRects:(CGRect *)a3 rects1Count:(unint64_t)a4 rects2:(const CGRect *)a5 rects2Count:(unint64_t)a6 minSize:(double)a7
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!a4) {
    return 0;
  }
  unint64_t v11 = 0;
  uint64_t v12 = 0;
  p_CGSize size = &a5->size;
  do
  {
    if (a6 && v11 <= 0x7F)
    {
      CGFloat v14 = p_size;
      unint64_t v15 = 1;
      do
      {
        CGRect v24 = CGRectIntersection(a3[v12], *(CGRect *)&v14[-1].width);
        CGFloat x = v24.origin.x;
        CGFloat y = v24.origin.y;
        double width = v24.size.width;
        CGFloat height = v24.size.height;
        if (!CGRectIsEmpty(v24) && width >= a7)
        {
          uint64_t v20 = (CGFloat *)&v22[2 * v11];
          *uint64_t v20 = x;
          v20[1] = y;
          ++v11;
          v20[2] = width;
          v20[3] = height;
        }
        if (v15 >= a6) {
          break;
        }
        ++v15;
        v14 += 2;
      }
      while (v11 < 0x80);
    }
    ++v12;
  }
  while (v12 != a4);
  if (v11) {
    memcpy(a3, v22, 32 * v11);
  }
  return v11;
}

- (id)groupInfoContainingWrappable:(id)a3
{
  v3 = [a3 info];
  id v4 = [v3 parentInfo];

  if (v4)
  {
    while (![v4 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v5 = [v4 parentInfo];

      id v4 = (id)v5;
      if (!v5) {
        goto LABEL_6;
      }
    }
    id v4 = v4;
  }
LABEL_6:

  return v4;
}

- (BOOL)textShouldFlowAroundWrappable:(id)a3 inTarget:(id)a4 inColumn:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([v8 hasAlpha] & 1) == 0)
  {
    [v8 boundsInRoot];
    long long v12 = *(_OWORD *)&self->_canvasSpaceToWrapSpace.c;
    *(_OWORD *)&v27.a = *(_OWORD *)&self->_canvasSpaceToWrapSpace.a;
    *(_OWORD *)&v27.c = v12;
    *(_OWORD *)&v27.tCGFloat x = *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx;
    CGRect v29 = CGRectApplyAffineTransform(v28, &v27);
    CGFloat y = v29.origin.y;
    CGFloat width = v29.size.width;
    CGFloat height = v29.size.height;
    recta[0] = *(void *)&v29.origin.x;
    double v24 = CGRectGetWidth(v29);
    [v10 frameBounds];
    objc_msgSend(v9, "rectInRoot:");
    long long v16 = *(_OWORD *)&self->_canvasSpaceToWrapSpace.c;
    *(_OWORD *)&recta[1] = *(_OWORD *)&self->_canvasSpaceToWrapSpace.a;
    *(_OWORD *)&recta[3] = v16;
    *(_OWORD *)&recta[5] = *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx;
    CGRect v31 = CGRectApplyAffineTransform(v30, (CGAffineTransform *)&recta[1]);
    CGFloat x = v31.origin.x;
    CGFloat v18 = v31.origin.y;
    CGFloat v19 = v31.size.width;
    CGFloat v20 = v31.size.height;
    double v25 = CGRectGetWidth(v31);
    *(void *)&v32.origin.CGFloat x = recta[0];
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = v18;
    v33.size.CGFloat width = v19;
    v33.size.CGFloat height = v20;
    if (MinX - CGRectGetMinX(v33) < 1.0) {
      goto LABEL_5;
    }
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = v18;
    v34.size.CGFloat width = v19;
    v34.size.CGFloat height = v20;
    double MaxX = CGRectGetMaxX(v34);
    *(void *)&v35.origin.CGFloat x = recta[0];
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    if (MaxX - CGRectGetMaxX(v35) < 1.0)
    {
LABEL_5:
      v36.origin.CGFloat x = x;
      v36.origin.CGFloat y = v18;
      v36.size.CGFloat width = v19;
      v36.size.CGFloat height = v20;
      *(void *)&v38.origin.CGFloat x = recta[0];
      v38.origin.CGFloat y = y;
      v38.size.CGFloat width = width;
      v38.size.CGFloat height = height;
      CGRect v37 = CGRectIntersection(v36, v38);
      BOOL v11 = CGRectGetWidth(v37) < v25 * 0.800000012;
      goto LABEL_6;
    }
    if (v24 >= v25 * 0.333333343)
    {
      BOOL v11 = 0;
      goto LABEL_6;
    }
  }
  BOOL v11 = 1;
LABEL_6:

  return v11;
}

- (unint64_t)splitLineRect:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappableRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  if (CGRectIntersectsRect(a3, a5))
  {
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v32);
    v33.origin.CGFloat x = v13;
    v33.origin.CGFloat y = v12;
    v33.size.CGFloat width = v11;
    v33.size.CGFloat height = v10;
    CGFloat v14 = CGRectGetMinX(v33);
    v34.size.CGFloat height = height;
    double v15 = v14;
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    CGFloat rect = v34.size.height;
    double MaxX = CGRectGetMaxX(v34);
    v35.origin.CGFloat x = v13;
    v35.origin.CGFloat y = v12;
    v35.size.CGFloat width = v11;
    v35.size.CGFloat height = v10;
    double v16 = CGRectGetMaxX(v35);
    if (MinX <= v15)
    {
      if (MaxX > v16) {
        return 0;
      }
      v42.origin.CGFloat x = x;
      v42.origin.CGFloat y = y;
      v42.size.CGFloat width = width;
      v42.size.CGFloat height = rect;
      CGFloat v30 = CGRectGetMaxX(v42);
      v43.origin.CGFloat x = v13;
      v43.origin.CGFloat y = v12;
      v43.size.CGFloat width = v11;
      v43.size.CGFloat height = v10;
      double v23 = CGRectGetMaxX(v43);
      v44.origin.CGFloat x = x;
      v44.origin.CGFloat y = y;
      v44.size.CGFloat width = width;
      v44.size.CGFloat height = rect;
      CGFloat v24 = CGRectGetMaxX(v44);
      a4->origin.CGFloat x = v30;
      a4->origin.CGFloat y = v12;
      a4->size.CGFloat width = v23 - v24;
      p_CGFloat height = &a4->size.height;
      unint64_t result = 1;
    }
    else
    {
      v36.origin.CGFloat x = v13;
      double v28 = v16;
      v36.origin.CGFloat y = v12;
      v36.size.CGFloat width = v11;
      v36.size.CGFloat height = v10;
      CGFloat v25 = CGRectGetMinX(v36);
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.CGFloat width = width;
      v37.size.CGFloat height = rect;
      double v17 = CGRectGetMinX(v37);
      v38.origin.CGFloat x = v13;
      v38.origin.CGFloat y = v12;
      v38.size.CGFloat width = v11;
      v38.size.CGFloat height = v10;
      CGFloat v18 = CGRectGetMinX(v38);
      a4->origin.CGFloat x = v25;
      a4->origin.CGFloat y = v12;
      a4->size.CGFloat width = v17 - v18;
      a4->size.CGFloat height = v10;
      if (MaxX >= v28) {
        return 1;
      }
      v39.origin.CGFloat x = x;
      v39.origin.CGFloat y = y;
      v39.size.CGFloat width = width;
      v39.size.CGFloat height = rect;
      CGFloat v29 = CGRectGetMaxX(v39);
      v40.origin.CGFloat x = v13;
      v40.origin.CGFloat y = v12;
      v40.size.CGFloat width = v11;
      v40.size.CGFloat height = v10;
      double v19 = CGRectGetMaxX(v40);
      v41.origin.CGFloat x = x;
      v41.origin.CGFloat y = y;
      v41.size.CGFloat width = width;
      v41.size.CGFloat height = rect;
      CGFloat v20 = CGRectGetMaxX(v41);
      a4[1].origin.CGFloat x = v29;
      a4[1].origin.CGFloat y = v12;
      a4[1].size.CGFloat width = v19 - v20;
      p_CGFloat height = &a4[1].size.height;
      unint64_t result = 2;
    }
  }
  else
  {
    a4->origin.CGFloat x = v13;
    a4->origin.CGFloat y = v12;
    p_CGFloat height = &a4->size.height;
    unint64_t result = 1;
    a4->size.CGFloat width = v11;
  }
  *p_CGFloat height = v10;
  return result;
}

- (unint64_t)splitLineRect:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappable:(id)a5 wrapContext:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a5;
  long long v14 = *(_OWORD *)&self->_canvasSpaceToWrapSpace.c;
  v22[0] = *(_OWORD *)&self->_canvasSpaceToWrapSpace.a;
  v22[1] = v14;
  v22[2] = *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx;
  double v15 = [a6 transformedWrapPolygonForWrappable:v13 canvasSpaceToWrapSpaceTransform:v22];
  if (v15)
  {
    unint64_t v16 = objc_msgSend(MEMORY[0x263F7C7A0], "splitLine:lineSegmentRects:polygon:type:skipHint:", a4, v15, 1, 0, x, y, width, height);
  }
  else
  {
    objc_opt_class();
    double v17 = TSUClassAndProtocolCast();
    CGFloat v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "frameInRoot", &unk_26D5AAA80);
      long long v19 = *(_OWORD *)&self->_canvasSpaceToWrapSpace.c;
      *(_OWORD *)&v21.a = *(_OWORD *)&self->_canvasSpaceToWrapSpace.a;
      *(_OWORD *)&v21.c = v19;
      *(_OWORD *)&v21.tdouble x = *(_OWORD *)&self->_canvasSpaceToWrapSpace.tx;
      CGRect v24 = CGRectApplyAffineTransform(v23, &v21);
      unint64_t v16 = -[SXTextTangierTextWrapper splitLineRect:lineSegmentRects:wrappableRect:](self, "splitLineRect:lineSegmentRects:wrappableRect:", a4, x, y, width, height, v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    }
    else
    {
      unint64_t v16 = 0;
    }
  }
  return v16;
}

- (NSArray)exclusionPaths
{
  return self->_exclusionPaths;
}

- (CGAffineTransform)canvasSpaceToWrapSpace
{
  long long v3 = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[1].b;
  return self;
}

- (void)setCanvasSpaceToWrapSpace:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_canvasSpaceToWrapSpace.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_canvasSpaceToWrapSpace.c = v4;
  *(_OWORD *)&self->_canvasSpaceToWrapSpace.a = v3;
}

- (CGAffineTransform)wrapSpaceToCanvasSpace
{
  long long v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[2].b;
  return self;
}

- (void)setWrapSpaceToCanvasSpace:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_wrapSpaceToCanvasSpace.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_wrapSpaceToCanvasSpace.c = v4;
  *(_OWORD *)&self->_wrapSpaceToCanvasSpace.a = v3;
}

- (NSMutableArray)tangierExclusionPaths
{
  return self->_tangierExclusionPaths;
}

- (void)setTangierExclusionPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tangierExclusionPaths, 0);
  objc_storeStrong((id *)&self->_exclusionPaths, 0);
}

@end