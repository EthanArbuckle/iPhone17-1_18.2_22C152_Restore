@interface CRLShapeRepHelperDefault
- (BOOL)drawsInOneStep;
- (BOOL)hasLegacyFreehandDrawingBrushStroke;
- (CRLShapeRepHelperDefault)initWithShapeRep:(id)a3;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 usingPathOverride:(id)a7 patternOffsetsBySubpathOverride:(id)a8 transparencyLayersBySubpath:(id)a9;
- (void)dynamicOperationDidEnd;
@end

@implementation CRLShapeRepHelperDefault

- (CRLShapeRepHelperDefault)initWithShapeRep:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLShapeRepHelperDefault;
  v5 = [(CRLShapeRepHelperDefault *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shapeRep, v4);
    v7 = [v4 shapeLayout];
    objc_storeWeak((id *)&v6->_shapeLayout, v7);

    v8 = [v4 shapeInfo];
    objc_storeWeak((id *)&v6->_shapeInfo, v8);

    CGSize size = CGRectNull.size;
    v6->_committedPathImageUnscaledRect.origin = CGRectNull.origin;
    v6->_committedPathImageUnscaledRect.CGSize size = size;
  }

  return v6;
}

- (void)dealloc
{
  CGContextRelease(self->_committedPathContext);
  CGImageRelease(self->_committedPathImage);
  v3.receiver = self;
  v3.super_class = (Class)CRLShapeRepHelperDefault;
  [(CRLShapeRepHelperDefault *)&v3 dealloc];
}

- (BOOL)drawsInOneStep
{
  p_shapeLayout = &self->_shapeLayout;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  v5 = [WeakRetained fill];

  if (v5) {
    unsigned int v6 = [v5 isClear] ^ 1;
  }
  else {
    unsigned int v6 = 0;
  }
  p_shapeInfo = &self->_shapeInfo;
  id v8 = objc_loadWeakRetained((id *)&self->_shapeInfo);
  v9 = [v8 stroke];

  if (([v9 shouldRender] & 1) == 0)
  {

    v9 = 0;
  }
  if (v9) {
    int v10 = v6 ^ 1;
  }
  else {
    int v10 = 1;
  }
  id v11 = objc_loadWeakRetained((id *)p_shapeLayout);
  if ([v11 pathIsOpen])
  {
    id v12 = objc_loadWeakRetained((id *)p_shapeInfo);
    v13 = [v12 headLineEnd];
    if (v13)
    {
      BOOL v14 = 0;
    }
    else
    {
      id v15 = objc_loadWeakRetained((id *)p_shapeInfo);
      v16 = [v15 tailLineEnd];
      BOOL v14 = v16 == 0;
    }
  }
  else
  {
    BOOL v14 = 1;
  }

  if ((v10 & v14) == 1)
  {
    if (v6)
    {
      v17 = v5;
    }
    else
    {
      if (!v9)
      {
        unsigned __int8 v18 = 1;
        goto LABEL_23;
      }
      v17 = v9;
    }
    unsigned __int8 v18 = [v17 drawsInOneStep];
  }
  else
  {
    unsigned __int8 v18 = 0;
  }
LABEL_23:

  return v18;
}

- (BOOL)hasLegacyFreehandDrawingBrushStroke
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shapeInfo);
  unsigned int v4 = [WeakRetained isFreehandDrawingShape];

  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = objc_loadWeakRetained((id *)&self->_shapeLayout);
    v7 = [v6 stroke];
    id v8 = sub_1002469D0(v5, v7);

    if (v8)
    {
      v9 = [v8 strokeName];
      if ([v9 isEqualToString:@"Pencil"])
      {
        LOBYTE(v4) = 1;
      }
      else
      {
        int v10 = [v8 strokeName];
        LOBYTE(v4) = [v10 isEqualToString:@"Crayon"];
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (void)drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 usingPathOverride:(id)a7 patternOffsetsBySubpathOverride:(id)a8 transparencyLayersBySubpath:(id)a9
{
  BOOL v10 = a6;
  BOOL v235 = a4;
  id v14 = a7;
  id v15 = (id *)a8;
  id v16 = a9;
  p_shapeRep = &self->_shapeRep;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shapeRep);
  v19 = [WeakRetained canvas];

  v239 = v19;
  unsigned int v231 = [v19 shouldSuppressBackgrounds];
  v240 = self;
  if (v231 != sub_1004582B0((uint64_t)a3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5C08);
    }
    v20 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR)) {
      sub_1010AC3F4();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F5C28);
    }
    v21 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
      sub_101087CBC();
    }

    v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRepHelperDefault drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:]");
    v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRepHelperDefault.m"];
    +[CRLAssertionHandler handleFailureInFunction:v22 file:v23 lineNumber:109 isFatal:0 description:"Canvas and CGContext disagree about whether we are suppressing backgrounds"];

    p_shapeRep = &self->_shapeRep;
  }
  p_shapeLayout = &self->_shapeLayout;
  id v25 = objc_loadWeakRetained((id *)p_shapeLayout);
  v26 = [v25 path];
  if (![v26 containsElementsOtherThanMoveAndClose])
  {

    goto LABEL_161;
  }
  location = (id *)p_shapeLayout;

  if ((a5 & 3) != 0 || (a5 & 4) != 0 || v235)
  {
    CGContextSaveGState(a3);
    id v27 = objc_loadWeakRetained((id *)p_shapeRep);
    v28 = [v27 freehandDrawingDynamicFillErasingDelegate];

    v29 = v240;
    unint64_t v227 = a5;
    if (v28)
    {
      v30 = v15;
      BOOL v31 = v10;
      id v32 = v14;
      id v33 = objc_loadWeakRetained((id *)p_shapeRep);
      [v33 freehandDrawingDynamicFillErasingDelegate];
      v35 = v34 = a3;
      v36 = [v35 maskImageForErasing];

      a3 = v34;
      if (v36)
      {
        id v37 = objc_loadWeakRetained(location);
        v38 = v37;
        if (v37) {
          [v37 transformInRoot];
        }
        else {
          memset(&v250, 0, sizeof(v250));
        }
        CGAffineTransformInvert(&transform, &v250);
        CGContextConcatCTM(v34, &transform);

        id v39 = objc_loadWeakRetained((id *)p_shapeRep);
        v40 = [v39 freehandDrawingDynamicFillErasingDelegate];
        [v40 unscaledRectForMaskImageForErasing];
        CGFloat v42 = v41;
        CGFloat v44 = v43;
        CGFloat v46 = v45;
        CGFloat v48 = v47;
        v49 = (CGImage *)[v36 CGImage];
        v253.origin.double x = v42;
        v253.origin.CGFloat y = v44;
        v253.size.double width = v46;
        v253.size.double height = v48;
        CGContextClipToMask(v34, v253, v49);

        id v50 = objc_loadWeakRetained(location);
        v51 = v50;
        if (v50) {
          [v50 transformInRoot];
        }
        else {
          memset(&v249, 0, sizeof(v249));
        }
        v29 = v240;
        a3 = v34;
        CGContextConcatCTM(v34, &v249);
      }
      id v14 = v32;
      BOOL v10 = v31;
      id v15 = v30;
      a5 = v227;
    }
    if (v10)
    {
      id v52 = objc_loadWeakRetained((id *)p_shapeRep);
      unsigned int v222 = [v52 i_beginApplyOpacity:a3 forDrawingInOneStep:[v29 drawsInOneStep]];
    }
    else
    {
      unsigned int v222 = 0;
    }
    id v53 = objc_loadWeakRetained(location);
    [v53 pathBounds];
    double v55 = v54;
    double v57 = v56;

    CGContextTranslateCTM(a3, -v55, -v57);
    [v239 viewScale];
    double v59 = v58;
    double v60 = sub_100458664((uint64_t)a3);
    CGPoint v247 = CGPointZero;
    CGPoint v248 = v247;
    id v61 = objc_loadWeakRetained(location);
    v62 = [v61 stroke];

    if (([v62 shouldRender] & 1) == 0)
    {

      v62 = 0;
    }
    double v63 = v59 * v60;
    id v234 = v14;
    v225 = v62;
    if (v14)
    {
      id v226 = [v14 copy];
      id v64 = [v62 copy];
    }
    else
    {
      v65 = a3;
      id v66 = objc_loadWeakRetained((id *)&v240->_shapeInfo);
      unsigned int v67 = [v66 isFreehandDrawingShape];

      id v68 = objc_loadWeakRetained(location);
      v69 = v68;
      if (v67)
      {
        v70 = [v68 path];
        id v226 = [v70 copy];

        id v64 = [v62 copy];
      }
      else
      {
        id v245 = 0;
        id v246 = 0;
        [v68 aliasPathForScale:&v246 adjustedStroke:&v245 adjustedPath:&v248 startDelta:&v247 endDelta:v59 * v60];
        id v64 = v246;
        id v226 = v245;
      }
      a3 = v65;
    }
    v71 = (objc_class *)objc_opt_class();
    v224 = v64;
    id v72 = [v64 mutableCopy];
    v73 = sub_10024715C(v71, v72);

    uint64_t v74 = objc_opt_class();
    v228 = v73;
    v229 = sub_100246DEC(v73, v74, 1, v75, v76, v77, v78, v79, (uint64_t)&OBJC_PROTOCOL___CRLMutableStroke);
    id v238 = v16;
    if (v229)
    {
      v80 = v15;
      id v81 = objc_loadWeakRetained((id *)&v240->_shapeInfo);
      v82 = [v81 pathSource];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v83 = objc_loadWeakRetained((id *)&v240->_shapeInfo);
        [v83 pathSource];
        v84 = p_shapeRep;
        BOOL v85 = v10;
        v87 = v86 = a3;
        unsigned int v88 = [v87 isCurveContinuous];

        a3 = v86;
        BOOL v10 = v85;
        p_shapeRep = v84;

        id v15 = v80;
        id v16 = v238;
        a5 = v227;
        if (v88)
        {
          [v229 width];
          double v90 = v89;
          [v239 viewScale];
          if (v90 * v91 < 1.1)
          {
            [v229 width];
            [v229 setWidth:v92 + 0.1];
          }
        }
      }
      else
      {

        id v15 = v80;
        a5 = v227;
      }
    }
    id v93 = objc_loadWeakRetained(location);
    if ([v93 pathIsOpen])
    {
      v94 = v15;
      id v95 = objc_loadWeakRetained((id *)&v240->_shapeInfo);
      v96 = [v95 headLineEnd];
      if (v96)
      {
        BOOL v223 = 1;
      }
      else
      {
        id v97 = objc_loadWeakRetained((id *)&v240->_shapeInfo);
        v98 = [v97 tailLineEnd];
        BOOL v223 = v98 != 0;
      }
      id v15 = v94;
      a5 = v227;
    }
    else
    {
      BOOL v223 = 0;
    }
    v99 = v225;

    id v14 = v234;
    v100 = v229;
    if (v235)
    {
      id v101 = objc_loadWeakRetained(location);
      v102 = [v101 fill];

      if (v102 && (([v102 isClear] | v231) & 1) == 0)
      {
        if ([v102 fillType] == (id)1
          && (v103 = (objc_class *)objc_opt_class(),
              sub_10024715C(v103, v102),
              v104 = objc_claimAutoreleasedReturnValue(),
              id v105 = [v104 gradientType],
              v104,
              BOOL v106 = v105 == (id)1,
              v100 = v229,
              v106))
        {
          id v107 = objc_loadWeakRetained((id *)p_shapeRep);
          [v107 boundsForStandardKnobs];
          CGRect v255 = CGRectOffset(v254, v55, v57);
          double x = v255.origin.x;
          double v236 = v63;
          CGFloat y = v255.origin.y;
          double width = v255.size.width;
          double height = v255.size.height;

          id v112 = [v226 CGPath];
          id v113 = [v239 isDrawingIntoPDF];
          double v114 = y;
          double v63 = v236;
          [v102 paintPath:v112 naturalBounds:a3 inContext:v113 isPDF:x width:width height:height];
        }
        else
        {
          [v102 paintPath:[v226 CGPath] inContext:a3];
        }
      }

      id v16 = v238;
    }
    if (!v100) {
      goto LABEL_158;
    }
    unsigned int v115 = [v100 shouldRender];
    if ((a5 & 7) == 0 || !v115) {
      goto LABEL_158;
    }
    char v116 = !v223;
    if ((a5 & 1) == 0) {
      char v116 = 1;
    }
    if (v116)
    {
      BOOL v119 = 0;
    }
    else
    {
      v117 = [v100 color];
      [v117 alphaComponent];
      BOOL v119 = (a5 & 8) == 0 && v118 < 1.0;
    }
    id v120 = objc_loadWeakRetained((id *)p_shapeRep);
    if (objc_msgSend(v120, "i_isCurrentlyBeingFreehandDrawn"))
    {
      v121 = [v229 color];
      [v121 alphaComponent];
      BOOL v123 = v122 < 1.0;
    }
    else
    {
      BOOL v123 = 0;
    }

    int v237 = v123 || v119;
    if (v123 || v119)
    {
      CGContextSaveGState(a3);
      v124 = [v229 color];
      [v124 alphaComponent];
      CGContextSetAlpha(a3, v125);

      CGContextBeginTransparencyLayer(a3, 0);
      v99 = v225;
      if (v228 == v225)
      {
        uint64_t v127 = objc_opt_class();
        id v128 = [v225 mutableCopy];
        v129 = sub_1002469D0(v127, v128);

        uint64_t v130 = objc_opt_class();
        v228 = v129;
        v126 = sub_100246DEC(v129, v130, 1, v131, v132, v133, v134, v135, (uint64_t)&OBJC_PROTOCOL___CRLMutableStroke);

        if (!v126)
        {
          v100 = 0;
          goto LABEL_80;
        }
        v229 = v126;
      }
      else
      {
        v126 = v229;
      }
      v136 = [v126 color];
      v137 = [v136 colorWithAlphaComponent:1.0];
      [v126 setColor:v137];
    }
    else
    {
      v99 = v225;
    }
    v100 = v229;
LABEL_80:
    id v138 = objc_loadWeakRetained((id *)p_shapeRep);
    if ([v138 isBeingResized])
    {
      if ((uint64_t)[v226 elementCount] <= 20)
      {
        id v139 = objc_loadWeakRetained((id *)&v240->_shapeInfo);
        unsigned int v219 = [v139 isFreehandDrawingShape];
      }
      else
      {
        unsigned int v219 = 1;
      }
    }
    else
    {
      unsigned int v219 = 0;
    }

    if (a5)
    {
      id v140 = objc_loadWeakRetained((id *)p_shapeRep);
      v141 = [v140 i_strokeForRenderingIncludingPlaybackFromStroke:v228];

      v230 = v100;
      if ((a5 & 8) != 0)
      {
        id v142 = objc_loadWeakRetained((id *)p_shapeRep);
        v228 = [v142 i_brushStrokeFromStroke:v141];
      }
      else
      {
        v228 = v141;
      }
      CGContextSaveGState(a3);
      id v143 = objc_loadWeakRetained((id *)&v240->_shapeInfo);
      v144 = [v143 pathSource];
      objc_opt_class();
      p_shapeInfo = (id *)&v240->_shapeInfo;
      if (objc_opt_isKindOfClass())
      {
        v220 = v15;
        v145 = a3;
        id v146 = objc_loadWeakRetained((id *)&v240->_shapeInfo);
        v147 = [v146 pathSource];
        if ([v147 isCurveContinuous])
        {
          id v148 = objc_loadWeakRetained(location);
          v149 = v148;
          if (v148) {
            [v148 transformInRoot];
          }
          else {
            memset(v244, 0, sizeof(v244));
          }
          BOOL v150 = sub_10007F964((double *)v244);

          a3 = v145;
          id v15 = v220;
          if (v150)
          {
            CGAffineTransformMakeRotation(&v243, 0.000001);
            CGContextConcatCTM(v145, &v243);
          }
        }
        else
        {

          a3 = v145;
          id v15 = v220;
        }
      }
      else
      {
      }
      id v151 = objc_loadWeakRetained((id *)p_shapeRep);
      unsigned int v152 = [v151 i_isCurrentlyBeingFreehandDrawn];

      v100 = v230;
      if (v152)
      {
        id v153 = objc_loadWeakRetained((id *)p_shapeRep);
        v154 = [v153 interactiveCanvasController];

        id v155 = objc_loadWeakRetained((id *)p_shapeRep);
        [v155 i_uncommittedFreehandDrawingPointRange];
        unint64_t v157 = v156;

        v99 = v225;
        v218 = v154;
        if (v157 >= 5)
        {
          if (!v240->_committedPathContext)
          {
            id v158 = objc_loadWeakRetained((id *)p_shapeRep);
            [v158 i_scaledFrameForFreehandCommittedPathImage];
            [v154 convertBoundsToUnscaledRect:];
            v240->_committedPathImageUnscaledRect.origin.double x = v159;
            v240->_committedPathImageUnscaledRect.origin.CGFloat y = v160;
            v240->_committedPathImageUnscaledRect.size.double width = v161;
            v240->_committedPathImageUnscaledRect.size.double height = v162;

            double v163 = sub_1000646A4(v240->_committedPathImageUnscaledRect.size.width, v240->_committedPathImageUnscaledRect.size.height, v63);
            double v165 = v164;
            id v166 = objc_loadWeakRetained((id *)p_shapeRep);
            v240->_committedPathContext = sub_100455AA8((char)[v166 i_bitmapContextOptionsForContextDestinedToDrawIntoCALayerContextForDrawingStroke:v228], v163, v165);
          }
          id v167 = objc_loadWeakRetained((id *)p_shapeRep);
          id v168 = [v167 i_commitAvailableFreehandDrawingPointsIfPossible];
          uint64_t v170 = v169;

          v100 = v230;
          if (v170)
          {
            v171 = p_shapeRep;
            id v172 = [v226 copyWithPointsInRange:v168, v170];
            CGContextSaveGState(v240->_committedPathContext);
            CGContextScaleCTM(v240->_committedPathContext, v63, v63);
            CGContextTranslateCTM(v240->_committedPathContext, -v240->_committedPathImageUnscaledRect.origin.x, -v240->_committedPathImageUnscaledRect.origin.y);
            committedPathContext = v240->_committedPathContext;
            id v174 = objc_loadWeakRetained(location);
            v175 = v174;
            if (v174) {
              [v174 transformInRoot];
            }
            else {
              memset(&v242, 0, sizeof(v242));
            }
            CGContextConcatCTM(committedPathContext, &v242);

            CGContextTranslateCTM(v240->_committedPathContext, -v55, -v57);
            id v196 = v172;
            [v228 paintPath:[v196 CGPath] wantsInteriorStroke:0 inContext:v240->_committedPathContext useFastDrawing:v219 parameterized:(a5 >> 3) & 1 shouldReverseDrawOrder:(a5 >> 4) & 1];
            CGContextRestoreGState(v240->_committedPathContext);
            CGImageRelease(v240->_committedPathImage);
            v240->_committedPathImage = CGBitmapContextCreateImage(v240->_committedPathContext);

            p_shapeRep = v171;
            v99 = v225;
            v100 = v230;
          }
        }
        if (v240->_committedPathImage)
        {
          CGContextSaveGState(a3);
          CGContextTranslateCTM(a3, v55, v57);
          id v197 = objc_loadWeakRetained((id *)p_shapeRep);
          [v197 convertNaturalRectFromUnscaledCanvas:v240->_committedPathImageUnscaledRect.origin.x, v240->_committedPathImageUnscaledRect.origin.y, v240->_committedPathImageUnscaledRect.size.width, v240->_committedPathImageUnscaledRect.size.height];
          CGContextDrawImage(a3, v256, v240->_committedPathImage);

          CGContextRestoreGState(a3);
        }
        id v198 = objc_loadWeakRetained((id *)p_shapeRep);
        [v198 i_uncommittedFreehandDrawingPointRange];
        uint64_t v200 = v199;

        if (v200)
        {
          v201 = p_shapeRep;
          id v202 = objc_loadWeakRetained((id *)p_shapeRep);
          id v203 = [v202 i_uncommittedFreehandDrawingPointRange];
          id v205 = [v226 copyWithPointsInRange:v203, v204];

          p_shapeRep = v201;
          v206 = v205;
          v100 = v230;
          id v226 = v206;
          [v228 paintPath:[v226 CGPath] wantsInteriorStroke:0 inContext:a3 useFastDrawing:v219 parameterized:(a5 >> 3) & 1 shouldReverseDrawOrder:(a5 >> 4) & 1];
        }
        id v16 = v238;
        id v14 = v234;
      }
      else
      {
        id v176 = objc_loadWeakRetained(location);
        v177 = [v176 dynamicPatternOffsetsBySubpath];

        if (v177)
        {
          id v178 = objc_loadWeakRetained(location);
          v179 = [v178 dynamicPatternOffsetsBySubpath];
        }
        else
        {
          v179 = 0;
        }
        v99 = v225;
        if (v15)
        {
          v180 = v15;

          v218 = v180;
        }
        else
        {
          v218 = (id *)v179;
        }
        v221 = (id *)p_shapeRep;
        uint64_t v181 = objc_opt_class();
        sub_1002469D0(v181, v228);
        locationa = (id *)objc_claimAutoreleasedReturnValue();
        if (locationa)
        {
          v182 = objc_alloc_init(CRLBrushStrokeLayoutOptions);
          id v183 = objc_loadWeakRetained(v221);
          [v183 strokeEnd];
          -[CRLBrushStrokeLayoutOptions setStrokeEnd:](v182, "setStrokeEnd:");

          if ([(CRLShapeRepHelperDefault *)v240 hasLegacyFreehandDrawingBrushStroke])
          {
            [(CRLBrushStrokeLayoutOptions *)v182 setTransparencyLayersBySubpath:v238];
            if (v218)
            {
              -[CRLBrushStrokeLayoutOptions setPatternOffsetsBySubpath:](v182, "setPatternOffsetsBySubpath:");
            }
            else
            {
              id v207 = objc_loadWeakRetained(p_shapeInfo);
              [v207 strokePatternOffsetDistance];
              v208 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
              v252 = v208;
              v209 = +[NSArray arrayWithObjects:&v252 count:1];
              [(CRLBrushStrokeLayoutOptions *)v182 setPatternOffsetsBySubpath:v209];

              v100 = v230;
            }
          }
          id v226 = v226;
          v210 = locationa;
          [locationa paintPath:[v226 CGPath] wantsInteriorStroke:0 inContext:a3 useFastDrawing:v219 parameterized:(a5 >> 3) & 1 shouldReverseDrawOrder:(a5 >> 4) & 1 withLayoutOptions:v182];

          p_shapeRep = (CRLShapeRep **)v221;
          id v14 = v234;
        }
        else
        {
          if (v238)
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F5C48);
            }
            v184 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)v184, OS_LOG_TYPE_ERROR)) {
              sub_1010AC344();
            }

            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014F5C68);
            }
            v100 = v230;
            v185 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)v185, OS_LOG_TYPE_ERROR)) {
              sub_101087CBC();
            }

            v186 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRepHelperDefault drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:]");
            v187 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRepHelperDefault.m"];
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v186, v187, 339, 0, "expected nil value for '%{public}s'", "transparencyLayersBySubpath", p_shapeInfo);

            v99 = v225;
          }
          p_shapeRep = (CRLShapeRep **)v221;
          id v188 = objc_loadWeakRetained(v221);
          [v188 strokeEnd];
          double v190 = v189;

          if (v190 >= 1.0)
          {
            id v14 = v234;
            v195 = v226;
          }
          else
          {
            id v191 = objc_loadWeakRetained(v221);
            [v191 strokeEnd];
            double v193 = v192;

            id v14 = v234;
            if (v193 >= 0.0001)
            {
              double v241 = 0.0;
              id v211 = objc_loadWeakRetained(v221);
              [v211 strokeEnd];
              id v212 = [v226 elementPercentage:&v241];

              id v194 = [v226 copyFromSegment:0 t:v212 toSegment:0.0 t:v241];
              v100 = v230;
            }
            else
            {
              id v194 = +[CRLBezierPath bezierPath];
            }
            v195 = v194;
          }
          id v226 = v195;
          [v228 paintPath:[v226 CGPath] wantsInteriorStroke:0 inContext:a3 useFastDrawing:v219 parameterized:(a5 >> 3) & 1 shouldReverseDrawOrder:(a5 >> 4) & 1];
          v210 = 0;
        }

        id v16 = v238;
      }

      CGContextRestoreGState(a3);
    }
    else
    {
      id v16 = v238;
    }
    if (v223)
    {
      if (v231) {
        [(id)objc_opt_class() colorOnSuppressedBackgrounds];
      }
      else {
      id v213 = [v100 color];
      }

      CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v213 CGColor]);
      CGContextSetFillColorWithColor(a3, (CGColorRef)[v213 CGColor]);
      if ((a5 & 2) != 0 && v228)
      {
        id v214 = objc_loadWeakRetained((id *)p_shapeRep);
        [v214 i_drawLineEndForHead:1 withDelta:v100 andStroke:a3 inContext:v219 useFastDrawing:v247];
      }
      if ((a5 & 4) != 0 && v228)
      {
        id v215 = objc_loadWeakRetained((id *)p_shapeRep);
        [v215 i_drawLineEndForHead:0 withDelta:v100 andStroke:a3 inContext:v219 useFastDrawing:v248];
      }
      id v16 = v238;
    }
    if (v237)
    {
      CGContextEndTransparencyLayer(a3);
      CGContextRestoreGState(a3);
    }
LABEL_158:
    if (v10)
    {
      id v216 = objc_loadWeakRetained((id *)p_shapeRep);
      [v216 i_endApplyOpacity:a3 appliedTransparencyLayer:v222];
    }
    CGContextRestoreGState(a3);
  }
LABEL_161:
}

- (void)dynamicOperationDidEnd
{
  committedPathContext = self->_committedPathContext;
  if (committedPathContext)
  {
    CFRelease(committedPathContext);
    self->_committedPathContext = 0;
  }
  committedPathImage = self->_committedPathImage;
  if (committedPathImage)
  {
    CFRelease(committedPathImage);
    self->_committedPathImage = 0;
  }
  CGSize size = CGRectNull.size;
  self->_committedPathImageUnscaledRect.origin = CGRectNull.origin;
  self->_committedPathImageUnscaledRect.CGSize size = size;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shapeInfo);
  objc_destroyWeak((id *)&self->_shapeLayout);

  objc_destroyWeak((id *)&self->_shapeRep);
}

@end