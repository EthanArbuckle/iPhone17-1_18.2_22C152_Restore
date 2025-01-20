@interface TSDBrushStroke
+ (BOOL)brushStrokeUsesMetal;
+ (Class)mutableClass;
+ (id)p_metalShaderQueue;
+ (id)p_metalTextureQueue;
+ (void)p_drawColor:(id)a3 intoContext:(CGContext *)a4 usingImageAsMask:(CGImage *)a5 withRect:(CGRect)a6;
- (BOOL)canApplyToShapeRenderable;
- (BOOL)drawsInOneStep;
- (BOOL)needsToExtendJoinsForBoundsCalculation;
- (BOOL)p_isDrawingRasterizedIntoPDFWithContext:(CGContext *)a3;
- (BOOL)p_isFreehandDrawingStrokeWithFixedTileWidth;
- (BOOL)p_prefersRasterRenderingInContext:(CGContext *)a3;
- (BOOL)p_shouldDrawAsVectorInContext:(CGContext *)a3;
- (BOOL)prefersToApplyToShapeRenderableDuringManipulation;
- (BOOL)supportsPattern;
- (TSDBrushStroke)initWithArchive:(const StrokeArchive *)a3 unarchiver:(id)a4;
- (TSDBrushStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(int)a6 join:(int)a7 pattern:(id)a8 miterLimit:(double)a9;
- (double)horizontalMarginForSwatch;
- (double)lineEndInsetAdjustment;
- (double)suggestedMinimumLineWidth;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)p_metalBrushShaderForPixelFormat:(unint64_t)a3 andDevice:(id)a4;
- (id)p_metalOpacityShaderForPixelFormat:(unint64_t)a3 andDevice:(id)a4;
- (id)p_metalTextureForCurrentStrokeAndDevice:(id)a3;
- (id)strokeLineEnd:(id)a3;
- (int)cap;
- (int64_t)p_fastElementPercentage:(double *)a3 forOverallPercentage:(double)a4 onPath:(id)a5 withCachedCurrentElementPercentage:(id *)a6;
- (void)i_setCap:(int)a3;
- (void)p_brushPath:(CGPath *)a3 inContext:(CGContext *)a4 orDirectly:(id)a5 parameterized:(BOOL)a6 drawRasterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8 withLayoutOptions:(id)a9;
- (void)p_brushPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 intoPath:(id)a6 orIntoVector:(void *)a7 sectionIndex:(unint64_t *)a8 viewScale:(double)a9 withLayoutOptions:(id)a10 currentSubpathIndex:(unint64_t)a11 cachedCurrentElementPercentage:(id *)a12;
- (void)p_brushSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 inElementRange:(_NSRange)a6 intoPath:(id)a7 orIntoVector:(void *)a8 viewScale:(double)a9 strokeTileLayout:(id)a10 cachedCurrentElementPercentage:(id *)a11;
- (void)p_finishMetalRenderInContext:(CGContext *)a3 orDirectly:(id)a4 pathVertexData:(void *)a5 parameterized:(BOOL)a6 shouldReverseDrawOrder:(BOOL)a7 withLayoutOptions:(id)a8;
- (void)p_rasterBrushPath:(CGPath *)a3 inContext:(CGContext *)a4 orDirectly:(id)a5 parameterized:(BOOL)a6 shouldReverseDrawOrder:(BOOL)a7 withLayoutOptions:(id)a8;
- (void)p_rasterRenderSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 inElementRange:(_NSRange)a6 into:(void *)a7 viewScale:(double)a8 strokeTileLayout:(id)a9 cachedCurrentElementPercentage:(id *)a10;
- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8;
- (void)paintPath:(CGPath *)a3 directlyUsingContext:(id)a4 withLayoutOptions:(id)a5;
- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8;
- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8 withLayoutOptions:(id)a9;
@end

@implementation TSDBrushStroke

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [TSDMutableBrushStroke alloc];
  v5 = [(TSDSmartStroke *)self strokeName];
  v6 = [(TSDStroke *)self color];
  [(TSDStroke *)self width];
  double v8 = v7;
  uint64_t v9 = [(TSDBrushStroke *)self cap];
  uint64_t v10 = [(TSDStroke *)self join];
  v11 = [(TSDStroke *)self pattern];
  [(TSDStroke *)self miterLimit];
  v13 = [(TSDBrushStroke *)v4 initWithName:v5 color:v6 width:v9 cap:v10 join:v11 pattern:v8 miterLimit:v12];

  return v13;
}

- (TSDBrushStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(int)a6 join:(int)a7 pattern:(id)a8 miterLimit:(double)a9
{
  uint64_t v11 = *(void *)&a7;
  uint64_t v12 = *(void *)&a6;
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)TSDBrushStroke;
  v19 = [(TSDSmartStroke *)&v22 initWithName:v16 color:v17 width:v12 cap:v11 join:v18 pattern:a5 miterLimit:a9];
  v20 = v19;
  if (v19) {
    [(TSDBrushStroke *)v19 i_setCap:1];
  }

  return v20;
}

- (TSDBrushStroke)initWithArchive:(const StrokeArchive *)a3 unarchiver:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)TSDBrushStroke;
  double v7 = [(TSDBrushStroke *)&v10 initWithArchive:a3 unarchiver:v6];
  double v8 = v7;
  if (v7) {
    [(TSDBrushStroke *)v7 i_setCap:1];
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(TSDSmartStroke *)self strokeName];
  [(TSDStroke *)self width];
  double v8 = [v3 stringWithFormat:@"<%@ %p strokeName='%@' width=%f>", v5, self, v6, v7];

  return v8;
}

- (double)lineEndInsetAdjustment
{
  return 0.0;
}

- (double)suggestedMinimumLineWidth
{
  return 8.0;
}

- (BOOL)canApplyToShapeRenderable
{
  return 1;
}

- (BOOL)prefersToApplyToShapeRenderableDuringManipulation
{
  return 0;
}

- (BOOL)drawsInOneStep
{
  return 0;
}

+ (BOOL)brushStrokeUsesMetal
{
  v2 = +[TSDCapabilities currentCapabilities];
  char v3 = [v2 isMetalCapable];

  return v3;
}

- (BOOL)supportsPattern
{
  return 0;
}

- (int)cap
{
  int v2 = [(TSDStroke *)self i_cap];
  if (v2 != 1)
  {
    char v3 = [MEMORY[0x263F7C7F0] currentHandler];
    v4 = [NSString stringWithUTF8String:"-[TSDBrushStroke cap]"];
    v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:295 description:@"TSDBrushStroke should only ever have a round cap."];
  }
  return v2;
}

- (void)i_setCap:(int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSDBrushStroke;
  [(TSDStroke *)&v3 i_setCap:1];
}

- (double)horizontalMarginForSwatch
{
  v8.receiver = self;
  v8.super_class = (Class)TSDBrushStroke;
  [(TSDStroke *)&v8 horizontalMarginForSwatch];
  double v4 = v3;
  v5 = [(TSDSmartStroke *)self strokeName];
  int v6 = [v5 isEqualToString:@"Pen"];

  double result = 7.0;
  if (!v6) {
    return v4;
  }
  return result;
}

- (BOOL)needsToExtendJoinsForBoundsCalculation
{
  double v3 = +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread];
  double v4 = [(TSDSmartStroke *)self strokeName];
  v5 = [v3 optionsForStroke:v4];
  int v6 = [v5 objectForKeyedSubscript:@"split-at-sharp-angles"];
  char v7 = [v6 BOOLValue];

  return v7;
}

- (id)strokeLineEnd:(id)a3
{
  id v4 = a3;
  if ([v4 isNone])
  {
    id v5 = v4;
  }
  else
  {
    int v6 = [v4 identifier];
    uint64_t v7 = [v6 rangeOfString:@":"];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = [v6 substringFromIndex:v7 + v8];

      int v6 = (void *)v9;
    }
    objc_super v10 = +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread];
    uint64_t v11 = [(TSDSmartStroke *)self strokeName];
    id v5 = [v10 lineEnd:v6 forStroke:v11];
  }

  return v5;
}

- (void)paintLineEnd:(id)a3 atPoint:(CGPoint)a4 atAngle:(double)a5 withScale:(double)a6 inContext:(CGContext *)a7 useFastDrawing:(BOOL)a8
{
  BOOL v8 = a8;
  double y = a4.y;
  double x = a4.x;
  id v15 = a3;
  id v16 = v15;
  if (v8)
  {
    id v17 = [v15 identifier];
    uint64_t v18 = [v17 rangeOfString:@":"];
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v20 = [v17 substringFromIndex:v18 + v19];

      uint64_t v21 = +[TSDLineEnd lineEndWithIdentifier:v20];

      id v17 = (void *)v20;
      id v16 = (void *)v21;
    }
    v24.receiver = self;
    v24.super_class = (Class)TSDBrushStroke;
    -[TSDStroke paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:](&v24, sel_paintLineEnd_atPoint_atAngle_withScale_inContext_useFastDrawing_, v16, a7, 1, x, y, a5, a6);
  }
  else
  {
    uint64_t v22 = [(TSDBrushStroke *)self strokeLineEnd:v15];

    v23.receiver = self;
    v23.super_class = (Class)TSDBrushStroke;
    id v16 = (void *)v22;
    -[TSDStroke paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:](&v23, sel_paintLineEnd_atPoint_atAngle_withScale_inContext_useFastDrawing_, v22, a7, 0, x, y, a5, a6);
  }
}

- (void)paintPath:(CGPath *)a3 directlyUsingContext:(id)a4 withLayoutOptions:(id)a5
{
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v12 = a4;
  id v15 = objc_alloc_init(TSDBrushStrokeLayoutOptions);
  [(TSDBrushStroke *)self paintPath:a3 wantsInteriorStroke:v12 inContext:a5 useFastDrawing:v10 parameterized:v9 shouldReverseDrawOrder:v8 withLayoutOptions:v15];
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8 withLayoutOptions:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  BOOL v13 = a4;
  id v16 = a9;
  if (v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)TSDBrushStroke;
    [(TSDStroke *)&v17 paintPath:a3 wantsInteriorStroke:v13 inContext:a5 useFastDrawing:1 parameterized:v10 shouldReverseDrawOrder:v9];
  }
  else if ([(TSDStroke *)self shouldRender])
  {
    if ([(TSDBrushStroke *)self p_shouldDrawAsVectorInContext:a5]) {
      [(TSDBrushStroke *)self p_brushPath:a3 inContext:a5 orDirectly:0 parameterized:v10 drawRasterized:0 shouldReverseDrawOrder:0 withLayoutOptions:v16];
    }
    else {
      [(TSDBrushStroke *)self p_rasterBrushPath:a3 inContext:a5 orDirectly:0 parameterized:v10 shouldReverseDrawOrder:v9 withLayoutOptions:v16];
    }
  }
}

- (void)p_brushPath:(CGPath *)a3 inContext:(CGContext *)a4 orDirectly:(id)a5 parameterized:(BOOL)a6 drawRasterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8 withLayoutOptions:(id)a9
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v87 = a5;
  id v91 = a9;
  BOOL v79 = v10;
  BOOL v86 = v9;
  if (v10 && !v9)
  {
    BOOL v12 = [MEMORY[0x263F7C7F0] currentHandler];
    BOOL v13 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]"];
    v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
    [v12 handleFailureInFunction:v13 file:v14 lineNumber:394 description:@"Parameterized strokes must draw rasterized."];

    BOOL v9 = v86;
  }
  if (v91) {
    BOOL v15 = !v9;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15 || ([v91 strokeEnd], v16 > 0.0))
  {
    objc_super v17 = +[TSDBezierPath bezierPathWithCGPath:a3];
    [v17 length];
    if (v18 == 0.0)
    {
LABEL_76:

      goto LABEL_77;
    }
    if (v79)
    {
      uint64_t v19 = [v17 bezierPathByFlatteningPathWithFlatness:0.1];

      if ([v19 isEffectivelyClosed] && (objc_msgSend(v19, "isClockwise") & 1) == 0)
      {
        uint64_t v20 = [v19 bezierPathByReversingPath];

        objc_super v17 = (void *)v20;
      }
      else
      {
        objc_super v17 = v19;
      }
    }
    [(TSDStroke *)self width];
    objc_msgSend(v17, "setLineWidth:");
    [(TSDStroke *)self miterLimit];
    objc_msgSend(v17, "setMiterLimit:");
    if (v87)
    {
      [v87 transform];
      double v21 = TSDTransformScale(v96);
      [v87 contentsScale];
    }
    else
    {
      if (!a4)
      {
        double v23 = 0.0;
        goto LABEL_18;
      }
      double v83 = 3.0;
      if (-[TSDBrushStroke p_isDrawingRasterizedIntoPDFWithContext:](self, "p_isDrawingRasterizedIntoPDFWithContext:")) {
        goto LABEL_19;
      }
      CGContextGetCTM(&v95, a4);
      double v21 = TSDTransformScale(&v95.a);
      double v22 = TSDCGContextAssociatedScreenScale((uint64_t)a4);
    }
    double v23 = v21 / v22;
LABEL_18:
    double v83 = v23;
LABEL_19:
    if (v86) {
      operator new();
    }
    objc_super v24 = +[TSDBezierPath bezierPath];
    [v17 lineWidth];
    objc_msgSend(v24, "setLineWidth:");
    [v24 setWindingRule:0];
    v85 = v24;
    uint64_t v94 = 0;
    [v17 length];
    double v26 = v25;
    v27 = +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread];
    v28 = [(TSDSmartStroke *)self strokeName];
    v29 = [v27 optionsForStroke:v28];
    v30 = [v29 objectForKeyedSubscript:@"split-at-sharp-angles"];
    int v89 = [v30 BOOLValue];

    double v31 = *MEMORY[0x263F00148];
    double v32 = *(double *)(MEMORY[0x263F00148] + 8);
    long long v93 = *MEMORY[0x263F00148];
    uint64_t v33 = [v17 elementCount];
    v92[0] = 0;
    v92[1] = (id)1;
    v92[2] = 0;
    if (v33 >= 1)
    {
      uint64_t v88 = 0;
      unint64_t v34 = 0;
      unint64_t v35 = 0;
      double v36 = 0.0;
      unint64_t v37 = 0x263F08000uLL;
      double v38 = 0.0;
      while (1)
      {
        unint64_t v39 = v37;
        double v40 = v38;
        uint64_t v41 = [v17 elementAtIndex:v35 associatedPoints:&v98];
        [v17 lengthOfElement:v35];
        double v43 = v42 / v26;
        double v38 = v38 + v43;
        switch(v41)
        {
          case 3:
            long long v98 = v93;
            break;
          case 2:
            if (v89)
            {
              double v80 = v40 + v43;
              double v81 = v31;
              double v44 = v32;
              double v82 = v36;
              double v45 = *(double *)&v97;
              double v46 = TSDSubtractPoints(*(double *)&v98, *((double *)&v98 + 1), *(double *)&v97);
              double v48 = v47;
              double v49 = TSDPointLength(v46, v47);
              if (v49 >= 1.0)
              {
                double v52 = TSDMultiplyPointScalar(v46, v48, 1.0 / v49);
              }
              else
              {
                double v50 = TSDSubtractPoints(v99, v100, v45);
                double v52 = TSDNormalizePoint(v50, v51);
              }
              if (v35 < 2)
              {
                double v40 = v82;
LABEL_53:
                double v38 = v80;
              }
              else
              {
                if (TSDDotPoints(v81, v44, v52, v53) >= 0.99)
                {
                  double v40 = v82;
                  goto LABEL_53;
                }
                double v38 = v80;
                if ((uint64_t)(v35 - 1 - v34) < 1 || v40 - v82 <= 0.0)
                {
                  double v40 = v82;
                }
                else
                {
                  -[TSDBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:](self, "p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:", v17, v34, v35 - v34, v85, 0, &v94, v82, v40 - v82, v83, v91, v88, v92);
                  unint64_t v34 = v35 - 1;
                }
              }
              double v64 = TSDSubtractPoints(*(double *)&v101, *((double *)&v101 + 1), v99);
              double v31 = TSDNormalizePoint(v64, v65);
              double v32 = v66;
              double v36 = v40;
            }
            long long v97 = v101;
            goto LABEL_59;
          case 0:
            if ((uint64_t)(v35 - v34) >= 1)
            {
              if ([(TSDBrushStroke *)self p_isFreehandDrawingStrokeWithFixedTileWidth])
              {
                uint64_t v94 = 0;
              }
              else
              {
                v59 = [v91 patternOffsetsBySubpath];
                BOOL v60 = v59 == 0;

                if (!v60)
                {
                  v61 = [MEMORY[0x263F7C7F0] currentHandler];
                  v62 = [*(id *)(v39 + 2880) stringWithUTF8String:"-[TSDBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]"];
                  v63 = [*(id *)(v39 + 2880) stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
                  [v61 handleFailureInFunction:v62, v63, 475, @"If there is a patternOffsetsBySubpath array, this should be a freehand drawing stroke." file lineNumber description];
                }
              }
              [(TSDBrushStroke *)self p_brushPath:v17 withScaling:v34 inElementRange:v35 - v34 intoPath:v85 orIntoVector:v36 sectionIndex:v38 - v36 viewScale:v83 withLayoutOptions:v91 currentSubpathIndex:v88++ cachedCurrentElementPercentage:v92];
              double v36 = v38;
              unint64_t v34 = v35;
              unint64_t v37 = v39;
            }
            long long v97 = v98;
            long long v93 = v98;
            goto LABEL_59;
        }
        if (!v89) {
          break;
        }
        TSUSubtractPoints();
        double v57 = TSDNormalizePoint(v54, v55);
        double v58 = v56;
        if (v35 < 2 || TSDDotPoints(v31, v32, v57, v56) >= 0.99 || (uint64_t)(v35 - 1 - v34) < 1 || v40 - v36 <= 0.0) {
          goto LABEL_40;
        }
        -[TSDBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:](self, "p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:", v17, v34, v35 - v34, v85, 0, &v94, v36, v40 - v36, v83, v91, v88, v92);
        unint64_t v34 = v35 - 1;
LABEL_41:
        long long v97 = v98;
        double v31 = v57;
        double v32 = v58;
        double v36 = v40;
LABEL_59:
        if (++v35 == v33) {
          goto LABEL_65;
        }
      }
      double v57 = v31;
      double v58 = v32;
LABEL_40:
      double v40 = v36;
      goto LABEL_41;
    }
    uint64_t v33 = 0;
    unint64_t v34 = 0;
    uint64_t v88 = 0;
    double v38 = 0.0;
    double v36 = 0.0;
LABEL_65:
    unint64_t v67 = v34;
    uint64_t v68 = v33 + ~v34;
    if (v68 >= 1)
    {
      if ([(TSDBrushStroke *)self p_isFreehandDrawingStrokeWithFixedTileWidth])
      {
        uint64_t v94 = 0;
      }
      else
      {
        v69 = [v91 patternOffsetsBySubpath];
        BOOL v70 = v69 == 0;

        if (!v70)
        {
          v71 = [MEMORY[0x263F7C7F0] currentHandler];
          v72 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]"];
          v73 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
          [v71 handleFailureInFunction:v72, v73, 549, @"If there is a patternOffsetsBySubpath array, this should be a freehand drawing stroke." file lineNumber description];
        }
      }
      [(TSDBrushStroke *)self p_brushPath:v17 withScaling:v67 inElementRange:v68 intoPath:v85 orIntoVector:v36 sectionIndex:v38 - v36 viewScale:v83 withLayoutOptions:v91 currentSubpathIndex:v88 cachedCurrentElementPercentage:v92];
    }
    v74 = v85;
    if (!v85)
    {
      v75 = [MEMORY[0x263F7C7F0] currentHandler];
      v76 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]"];
      v77 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
      objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, v77, 567, @"invalid nil value for '%s'", "resultPath");

      v74 = 0;
    }
    CGContextAddPath(a4, (CGPathRef)[v74 CGPath]);
    v78 = [(TSDStroke *)self color];
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v78 CGColor]);

    CGContextFillPath(a4);
    goto LABEL_76;
  }
LABEL_77:
}

- (void)p_brushPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 intoPath:(id)a6 orIntoVector:(void *)a7 sectionIndex:(unint64_t *)a8 viewScale:(double)a9 withLayoutOptions:(id)a10 currentSubpathIndex:(unint64_t)a11 cachedCurrentElementPercentage:(id *)a12
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v105 = a3;
  id v21 = a6;
  id v103 = a10;
  if ([v105 elementCount] >= 2)
  {
    double v22 = [v103 patternOffsetsBySubpath];
    if (v22)
    {
      BOOL v23 = [(TSDBrushStroke *)self p_isFreehandDrawingStrokeWithFixedTileWidth];

      if (!v23)
      {
        objc_super v24 = [MEMORY[0x263F7C7F0] currentHandler];
        double v25 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:]"];
        double v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
        [v24 handleFailureInFunction:v25 file:v26 lineNumber:579 description:@"We only know how to adjust the pattern of constant width layout brush strokes."];
      }
    }
    [v105 lineWidth];
    double v98 = v27;
    v28 = +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread];
    v29 = [(TSDSmartStroke *)self strokeName];
    uint64_t v102 = [v28 pathsForStroke:v29];

    v30 = +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread];
    double v31 = [(TSDSmartStroke *)self strokeName];
    double v100 = [v30 boundsForStroke:v31];

    long long v101 = [v102 objectForKey:@"middle"];
    double v32 = [v102 objectForKey:@"start"];
    if (v32)
    {
      uint64_t v33 = [v102 objectForKey:@"end"];
      BOOL v34 = v33 != 0;
    }
    else
    {
      BOOL v34 = 0;
    }

    double v35 = 5.0;
    double v36 = v98;
    if (v98 >= 5.0)
    {
      double v40 = @"middle";
    }
    else
    {
      unint64_t v37 = objc_msgSend(v102, "objectForKey:", @"small", 5.0, v98);
      double v38 = v37;
      if (v37)
      {
        id v39 = v37;

        BOOL v34 = 0;
        double v40 = @"small";
        long long v101 = v39;
      }
      else
      {
        double v40 = @"middle";
      }
    }
    objc_msgSend(v105, "length", v35, v36);
    double v42 = v41;
    double v43 = var1;
    double v44 = var0 + var1;
    double v104 = a9;
    if (v34)
    {
      double v45 = [v100 objectForKeyedSubscript:@"start"];
      double v46 = [v45 lastObject];
      [v46 CGRectValue];
      double v48 = v47;
      double v50 = v49;

      double v51 = [v100 objectForKeyedSubscript:@"end"];
      double v52 = [v51 lastObject];
      [v52 CGRectValue];
      double v96 = v53;
      double v55 = v54;
      double v56 = v42;
      double v57 = v98 * (v48 / v50);
      double v58 = v43 * v42 * 0.5;
      double v59 = fmin(v57, v58);

      double v60 = var0 + v59 / v42;
      [(TSDBrushStroke *)self p_brushSection:@"start", 0, v105, location, length, v21, v104, var0, v60, 0.0, 1.0, a7, a12 sectionIndex ontoPath inElementRange intoPath orIntoVector viewScale strokeTileLayout cachedCurrentElementPercentage];
      double v61 = v44 - fmin(v98 * (v96 / v55), v58) / v42;
      [(TSDBrushStroke *)self p_brushSection:@"end", 0, v105, location, length, v21, v104, v61, v44, 0.0, 1.0, a7, a12 sectionIndex ontoPath inElementRange intoPath orIntoVector viewScale strokeTileLayout cachedCurrentElementPercentage];
      double v44 = v61;
    }
    else
    {
      double v60 = var0;
      double v56 = v41;
    }
    unint64_t v62 = [v101 count];
    if (!v62 || v44 <= v60) {
      goto LABEL_54;
    }
    v63 = [v100 objectForKeyedSubscript:v40];
    double v64 = [v63 lastObject];
    [v64 CGRectValue];
    double v66 = v65;
    double v68 = v67;

    double v69 = v66 / v68;
    double v70 = v44 - v60;
    double v71 = v56 * (v44 - v60);
    double v72 = v98 * v69;
    unint64_t v73 = (unint64_t)(v71 / (v98 * v69) + 1.0);
    if (v62 <= 1) {
      unint64_t v73 = 1;
    }
    unint64_t v99 = v73;
    v74 = [v103 patternOffsetsBySubpath];

    if (!v74)
    {
      double v80 = 0.0;
LABEL_30:
      if ([(TSDBrushStroke *)self p_isFreehandDrawingStrokeWithFixedTileWidth])
      {
        double v83 = v70 * (v72 / v71);
        if (v80 > 0.0 && v80 > v83)
        {
          unint64_t v84 = *a8;
          do
          {
            double v80 = v80 - v83;
            unint64_t v85 = (1664525 * v84 + 1013904223);
            if (v85 % v62 == v84 % v62) {
              unint64_t v84 = v85 + 1;
            }
            else {
              unint64_t v84 = (1664525 * v84 + 1013904223);
            }
          }
          while (v80 > 0.0 && v80 > v83);
          *a8 = v84;
        }
      }
      else
      {
        double v83 = v70 / (double)v99;
      }
      if (vabdd_f64(v60, v44) > 0.00000999999975)
      {
        do
        {
          BOOL v86 = [(TSDBrushStroke *)self p_isFreehandDrawingStrokeWithFixedTileWidth];
          double v87 = fmin(v44, v83 + v60);
          double v88 = 0.0;
          if (v86)
          {
            if (v80 > 0.0)
            {
              double v89 = v80 / v83;
              double v80 = 0.0;
              double v88 = v89 + 0.0;
            }
            double v90 = v83 * (1.0 - v88);
            id v91 = a12;
            if (v87 - v60 > v90) {
              double v87 = v87 - (v87 - v60 - v90);
            }
          }
          else
          {
            id v91 = a12;
          }
          -[TSDBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:](self, "p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:", v40, *a8 % v62, v105, location, length, v21, v104, v60, v87, a7, v91);
          unint64_t v92 = 1664525 * *a8 + 1013904223;
          if (v92 % v62 == *a8 % v62) {
            unint64_t v93 = v92 + 1;
          }
          else {
            unint64_t v93 = 1664525 * *a8 + 1013904223;
          }
          *a8 = v93;
          double v60 = v87;
        }
        while (vabdd_f64(v87, v44) > 0.00000999999975);
      }
LABEL_54:

      goto LABEL_55;
    }
    v75 = [v103 patternOffsetsBySubpath];
    unint64_t v76 = [v75 count];

    if (v76 <= a11)
    {
      double v81 = [v103 patternOffsetsBySubpath];
      uint64_t v82 = [v81 count];

      if (v82 != 1)
      {
        CGAffineTransform v95 = [MEMORY[0x263F7C7F0] currentHandler];
        v78 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:]"];
        long long v97 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
        v77 = v95;
        uint64_t v94 = [v103 patternOffsetsBySubpath];
        objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v78, v97, 686, @"Not enough pattern offsets for each subpath. Got %zi for index %zi", objc_msgSend(v94, "count"), a11);

        double v80 = 0.0;
        goto LABEL_29;
      }
      v77 = [v103 patternOffsetsBySubpath];
      v78 = [v77 objectAtIndexedSubscript:0];
      objc_msgSend(v78, "tsu_CGFloatValue");
    }
    else
    {
      v77 = [v103 patternOffsetsBySubpath];
      v78 = [v77 objectAtIndexedSubscript:a11];
      objc_msgSend(v78, "tsu_CGFloatValue");
    }
    double v80 = v79 / v56;
LABEL_29:

    goto LABEL_30;
  }
LABEL_55:
}

- (void)p_brushSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 inElementRange:(_NSRange)a6 intoPath:(id)a7 orIntoVector:(void *)a8 viewScale:(double)a9 strokeTileLayout:(id)a10 cachedCurrentElementPercentage:(id *)a11
{
  double var3 = a10.var3;
  double var2 = a10.var2;
  double var1 = a10.var1;
  double var0 = a10.var0;
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v38 = a3;
  id v22 = a5;
  id v23 = a7;
  objc_super v24 = v23;
  if (a8)
  {
    if (v23)
    {
      NSUInteger v25 = length;
      double v26 = [MEMORY[0x263F7C7F0] currentHandler];
      id v37 = v22;
      double v27 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]"];
      v28 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, v28, 743, @"expected nil value for '%s'", "resultPath");

      NSUInteger length = v25;
      id v22 = v37;
    }
    -[TSDBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:](self, "p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:", v38, a4, v22, location, length, a8, a9, var0, var1, var2, var3, a11);
  }
  else
  {
    if (v23)
    {
      v29 = +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread];
      v30 = [(TSDSmartStroke *)self strokeName];
      double v31 = [v29 pathsForStroke:v30];

      double v32 = [v31 objectForKeyedSubscript:v38];
      uint64_t v33 = [v32 objectAtIndexedSubscript:a4];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v22 lineWidth];
        uint64_t v35 = [v33 objectAtIndexedSubscript:v34 < 15.0];

        uint64_t v33 = (void *)v35;
      }
      objc_msgSend(v33, "recursiveSubdivideOntoPath:withScaling:inElementRange:into:", v22, location, length, v24, var0, var1 - var0);
    }
    else
    {
      double v31 = [MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v33 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]"];
      double v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
      [v31 handleFailureInFunction:v33 file:v36 lineNumber:755 description:@"resultPath and resultVector are both nil!"];
    }
  }
}

- (void)p_rasterBrushPath:(CGPath *)a3 inContext:(CGContext *)a4 orDirectly:(id)a5 parameterized:(BOOL)a6 shouldReverseDrawOrder:(BOOL)a7 withLayoutOptions:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a5;
  id v15 = a8;
  if (v14) {
    [v14 transform];
  }
  else {
    CGContextGetCTM(&v19, a4);
  }
  double v16 = sqrt(v19.b * v19.b + v19.a * v19.a);
  if (a4
    && [(TSDBrushStroke *)self p_isDrawingRasterizedIntoPDFWithContext:a4])
  {
    double v16 = 3.0;
  }
  if (v14 || v10 || ([(TSDStroke *)self width], v17 > 0.5 / v16))
  {
    [(TSDBrushStroke *)self p_brushPath:a3 inContext:a4 orDirectly:v14 parameterized:v10 drawRasterized:1 shouldReverseDrawOrder:v9 withLayoutOptions:v15];
  }
  else if (a4)
  {
    v18.receiver = self;
    v18.super_class = (Class)TSDBrushStroke;
    [(TSDStroke *)&v18 paintPath:a3 wantsInteriorStroke:0 inContext:a4 useFastDrawing:0 parameterized:0 shouldReverseDrawOrder:0];
  }
}

- (void)p_rasterRenderSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 inElementRange:(_NSRange)a6 into:(void *)a7 viewScale:(double)a8 strokeTileLayout:(id)a9 cachedCurrentElementPercentage:(id *)a10
{
  NSUInteger length = a6.length;
  int64_t location = a6.location;
  double var3 = a9.var3;
  double var2 = a9.var2;
  double var0 = a9.var0;
  double var1 = a9.var1;
  uint64_t v365 = *MEMORY[0x263EF8340];
  id v327 = a3;
  id v353 = a5;
  int64_t v17 = location + length;
  while (location < [v353 elementCount])
  {
    [v353 lengthOfElement:location];
    if (v18 != 0.0) {
      break;
    }
    ++location;
  }
  while (v17 > location)
  {
    [v353 lengthOfElement:v17];
    if (v19 != 0.0) {
      break;
    }
    --v17;
  }
  if (v17 < location) {
    goto LABEL_241;
  }
  double v359 = 0.0;
  double v360 = 0.0;
  int64_t v337 = [(TSDBrushStroke *)self p_fastElementPercentage:&v360 forOverallPercentage:v353 onPath:a10 withCachedCurrentElementPercentage:var0];
  int64_t v20 = [(TSDBrushStroke *)self p_fastElementPercentage:&v359 forOverallPercentage:v353 onPath:a10 withCachedCurrentElementPercentage:var1];
  if (v337 < location)
  {
    double v360 = 0.0;
    int64_t v337 = location;
  }
  if (v20 > v17)
  {
    double v359 = 1.0;
    int64_t v20 = v17;
  }
  unint64_t v329 = a4;
  int64_t v330 = v20;
  if (v20 > v337)
  {
    if (v360 == 1.0 || fabs(v360 + -1.0) < 0.000000999999997)
    {
      double v360 = 0.0;
      ++v337;
    }
    double v21 = v359;
    if (v359 == 0.0)
    {
      double v359 = 1.0;
      int64_t v330 = v20 - 1;
    }
  }
  id v22 = +[TSDBezierPath bezierPath];
  [v22 appendBezierPath:v353 fromSegment:v337 t:v330 toSegment:0 t:v360 withoutMove:v359];
  CGAffineTransformMakeScale(&v358, a8, a8);
  [v22 transformUsingAffineTransform:&v358];
  v341 = [v22 bezierPathByFlatteningPathWithFlatness:0.1];

  double v326 = 1.0 / a8;
  CGAffineTransformMakeScale(&v357, 1.0 / a8, 1.0 / a8);
  [v341 transformUsingAffineTransform:&v357];
  [(TSDStroke *)self width];
  double v23 = 0.5 / a8;
  if (v24 > 0.5 / a8)
  {
    [(TSDStroke *)self width];
    double v23 = v25;
  }
  double v328 = v23;
  __p = 0;
  v355 = 0;
  v356 = 0;
  double v26 = *(double *)(MEMORY[0x263F00148] + 8);
  double v350 = *MEMORY[0x263F00148];
  double v342 = a8;
  uint64_t v347 = [v341 elementCount];
  if (v347)
  {
    uint64_t v27 = 0;
    *(void *)&double v338 = v347 - 1;
    double v28 = 1.0;
    double v335 = var3;
    do
    {
      long long v362 = *MEMORY[0x263F7C920];
      long long v363 = v362;
      long long v364 = v362;
      uint64_t v29 = [v341 elementAtIndex:v27 associatedPoints:&v362];
      uint64_t v30 = v29;
      double v31 = *((double *)&v362 + 1);
      double v32 = *(double *)&v362;
      if (!v29)
      {
LABEL_35:
        id v39 = v355;
        if (v355 >= v356)
        {
          v78 = __p;
          uint64_t v79 = (v355 - (char *)__p) >> 4;
          unint64_t v80 = v79 + 1;
          if ((unint64_t)(v79 + 1) >> 60) {
            abort();
          }
          uint64_t v81 = v356 - (char *)__p;
          if ((v356 - (char *)__p) >> 3 > v80) {
            unint64_t v80 = v81 >> 3;
          }
          if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v82 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v82 = v80;
          }
          if (v82)
          {
            double v83 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)&v356, v82);
            v78 = __p;
            id v39 = v355;
          }
          else
          {
            double v83 = 0;
          }
          unint64_t v84 = (double *)&v83[16 * v79];
          *unint64_t v84 = v32;
          v84[1] = v31;
          unint64_t v85 = v84;
          if (v39 != (char *)v78)
          {
            do
            {
              *((_OWORD *)v85 - 1) = *((_OWORD *)v39 - 1);
              v85 -= 2;
              v39 -= 16;
            }
            while (v39 != (char *)v78);
            v78 = __p;
          }
          double v40 = (char *)(v84 + 2);
          __p = v85;
          v356 = &v83[16 * v82];
          if (v78) {
            operator delete(v78);
          }
        }
        else
        {
          *(double *)v355 = v32;
          *((double *)v355 + 1) = v31;
          double v40 = v355 + 16;
        }
        v355 = v40;
        goto LABEL_80;
      }
      if (v29 != 1)
      {
        if (v29 == 3) {
          goto LABEL_28;
        }
        uint64_t v33 = [MEMORY[0x263F7C7F0] currentHandler];
        double v34 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]"];
        uint64_t v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
        [v33 handleFailureInFunction:v34 file:v35 lineNumber:854 description:@"Path should be flat by now."];

        if (!v30) {
          goto LABEL_35;
        }
        if (v30 == 3)
        {
LABEL_28:
          double v31 = v26;
          double v32 = v350;
        }
      }
      double v36 = (double *)v355;
      double v37 = TSDDistanceSquared(v32, v31, *((double *)v355 - 2), *((double *)v355 - 1)) * a8 * a8;
      if (v37 > 0.000000999999997 && v37 <= v28)
      {
        if (v27 == *(void *)&v338) {
          goto LABEL_40;
        }
        v361[0] = *MEMORY[0x263F7C920];
        v361[1] = v361[0];
        v361[2] = v361[0];
        if (![v341 elementAtIndex:v27 + 1 associatedPoints:v361])
        {
          double v31 = v26;
          double v32 = v350;
          a8 = v342;
          goto LABEL_80;
        }
        double v36 = (double *)v355;
        TSUSubtractPoints();
        double v43 = TSDNormalizePoint(v41, v42);
        double v45 = v44;
        TSUSubtractPoints();
        double v48 = TSDNormalizePoint(v46, v47);
        double v49 = v43;
        double v28 = 1.0;
        double v51 = TSDDotPoints(v49, v45, v48, v50);
        a8 = v342;
        if (v51 < 0.99)
        {
LABEL_40:
          if ((v30 | 2) != 3)
          {
            double v52 = [MEMORY[0x263F7C7F0] currentHandler];
            double v53 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]"];
            double v54 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
            [v52 handleFailureInFunction:v53 file:v54 lineNumber:897 description:@"Should only have line and close elements by now."];

            double v36 = (double *)v355;
          }
          double v55 = sqrt(v37) / 50.0;
          if (v55 < v28) {
            double v55 = v28;
          }
          uint64_t v56 = (uint64_t)v55;
          if ((uint64_t)v55 >= 1)
          {
            double v57 = *(v36 - 2);
            double v58 = *(v36 - 1);
            TSUSubtractPoints();
            double v60 = v59;
            double v62 = v61;
            uint64_t v63 = 0;
            do
            {
              double v64 = TSDMultiplyPointScalar(v60, v62, (double)++v63 / (double)v56);
              double v65 = TSDAddPoints(v57, v58, v64);
              double v67 = v65;
              uint64_t v68 = v66;
              if (v36 >= (double *)v356)
              {
                double v69 = __p;
                uint64_t v70 = ((char *)v36 - (char *)__p) >> 4;
                unint64_t v71 = v70 + 1;
                if ((unint64_t)(v70 + 1) >> 60) {
                  abort();
                }
                uint64_t v72 = v356 - (char *)__p;
                if ((v356 - (char *)__p) >> 3 > v71) {
                  unint64_t v71 = v72 >> 3;
                }
                if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v73 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v73 = v71;
                }
                if (v73)
                {
                  v74 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)&v356, v73);
                  double v69 = __p;
                  double v36 = (double *)v355;
                }
                else
                {
                  v74 = 0;
                }
                v75 = &v74[16 * v70];
                *(double *)v75 = v67;
                *((void *)v75 + 1) = v68;
                unint64_t v76 = v75;
                if (v36 != v69)
                {
                  do
                  {
                    *((_OWORD *)v76 - 1) = *((_OWORD *)v36 - 1);
                    v76 -= 16;
                    v36 -= 2;
                  }
                  while (v36 != v69);
                  double v69 = __p;
                }
                double v36 = (double *)(v75 + 16);
                __p = (double *)v76;
                v356 = &v74[16 * v73];
                if (v69) {
                  operator delete(v69);
                }
              }
              else
              {
                *double v36 = v65;
                *((void *)v36 + 1) = v66;
                v36 += 2;
              }
              v355 = (char *)v36;
            }
            while (v63 != v56);
            double v31 = v26;
            double v32 = v350;
            double var3 = v335;
            a8 = v342;
            uint64_t v77 = v347;
            double v28 = 1.0;
            goto LABEL_81;
          }
        }
      }
      else if (v37 > v28)
      {
        goto LABEL_40;
      }
      double v31 = v26;
      double v32 = v350;
LABEL_80:
      uint64_t v77 = v347;
LABEL_81:
      ++v27;
      double v350 = v32;
      double v26 = v31;
    }
    while (v27 != v77);
  }
  BOOL v86 = __p;
  uint64_t v351 = v355 - (char *)__p;
  if ((unint64_t)(v355 - (char *)__p) >= 0x20)
  {
    double v87 = +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread];
    double v88 = [(TSDSmartStroke *)self strokeName];
    double v89 = [v87 textureIndexForStroke:v88];
    double v90 = [v89 objectForKeyedSubscript:v327];
    id v91 = [v90 objectAtIndexedSubscript:v329];
    unint64_t v348 = [v91 unsignedIntegerValue];

    unint64_t v92 = +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread];
    unint64_t v93 = [(TSDSmartStroke *)self strokeName];
    uint64_t v94 = [v92 textureIndexForStroke:v93];
    CGAffineTransform v95 = [v94 objectForKeyedSubscript:@"section-count"];
    unint64_t v345 = [v95 unsignedIntegerValue];

    LODWORD(v95) = (int)log2(64.0) - 1;
    log2((v328 + v328) * a8);
    double v96 = 1.0;
    TSUClamp();
    unint64_t v98 = v351 >> 4;
    float v99 = (float)((int)v95 - (int)v97);
    LODWORD(v338) = exp2f(-v99);
    float v339 = v99;
    float v325 = exp2f(-(float)(v99 + 1.0));
    uint64_t v100 = (v351 >> 4) - 1;
    if (v351 >> 4 == 1)
    {
      float v102 = 0.0;
    }
    else
    {
      long long v101 = __p + 3;
      float v102 = 0.0;
      unint64_t v103 = v98 - 1;
      do
      {
        TSUDistance();
        float v102 = v104 + v102;
        v101 += 2;
        --v103;
      }
      while (v103);
    }
    double v105 = *MEMORY[0x263F001A8];
    CGFloat v106 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v107 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v108 = *(double *)(MEMORY[0x263F001A8] + 24);
    v109 = +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread];
    v110 = [(TSDSmartStroke *)self strokeName];
    v111 = [v109 pathsForStroke:v110];
    v112 = [v111 objectForKeyedSubscript:v327];
    v113 = [v112 objectAtIndexedSubscript:v329];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v113 bounds];
      double v105 = v114;
      CGFloat v106 = v115;
      CGFloat v107 = v116;
      CGFloat v108 = v117;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v118 = [v113 firstObject];
        [v118 bounds];
        double v105 = v119;
        CGFloat v106 = v120;
        CGFloat v107 = v121;
        CGFloat v108 = v122;
      }
      else
      {
        v123 = [MEMORY[0x263F7C7F0] currentHandler];
        v124 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]"];
        v125 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
      }
    }
    v366.origin.double x = v105;
    v366.origin.double y = v106;
    v366.size.width = v107;
    v366.size.height = v108;
    float v126 = v102 / (var3 - var2);
    double v127 = fmin(v105, 0.0);
    double v128 = fmax(CGRectGetMaxX(v366), 1.0) + -1.0;
    if (var2 < 0.001)
    {
      double v129 = *__p;
      double v130 = __p[1];
      TSUSubtractPoints();
      double v133 = TSDNormalizePoint(v131, v132);
      double v96 = 1.0;
      double v135 = TSDMultiplyPointScalar(v133, v134, v126 * -v127);
      double *__p = TSDAddPoints(v129, v130, v135);
      *((void *)__p + 1) = v136;
    }
    if (var3 > 0.999)
    {
      v137 = &__p[2 * v100];
      double v138 = *v137;
      double v139 = v137[1];
      TSUSubtractPoints();
      double v142 = TSDNormalizePoint(v140, v141);
      double v144 = TSDMultiplyPointScalar(v142, v143, v128 * v126);
      double *v137 = TSDAddPoints(v138, v139, v144);
      *((void *)v137 + 1) = v145;
    }

    long long v362 = 0uLL;
    *(void *)&long long v363 = 0;
    std::vector<EQKitTypes::Notation::Enum>::__vallocate[abi:nn180100](&v362, v98);
    uint64_t v146 = *((void *)&v362 + 1);
    bzero(*((void **)&v362 + 1), v351 >> 2);
    *((void *)&v362 + 1) = v146 + (v351 >> 2);
    uint64_t v147 = v362;
    *(_DWORD *)long long v362 = 0;
    if (v98 != 1)
    {
      v148 = (float *)(v147 + 4);
      v149 = __p + 3;
      float v150 = 0.0;
      do
      {
        TSUDistance();
        float v150 = v151 + v150;
        *v148++ = v150;
        v149 += 2;
        --v100;
      }
      while (v100);
    }
    v152 = (_OWORD *)*((void *)a7 + 1);
    uint64_t v153 = (uint64_t)v152 - *(void *)a7;
    BOOL v154 = v152 != *(_OWORD **)a7;
    if (v152 != *(_OWORD **)a7)
    {
      v155 = v152 - 2;
      unint64_t v156 = *((void *)a7 + 2);
      if ((unint64_t)v152 >= v156)
      {
        uint64_t v159 = v153 >> 5;
        unint64_t v160 = (v153 >> 5) + 1;
        if (v160 >> 59) {
          abort();
        }
        uint64_t v161 = v156 - *(void *)a7;
        if (v161 >> 4 > v160) {
          unint64_t v160 = v161 >> 4;
        }
        if ((unint64_t)v161 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v162 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v162 = v160;
        }
        if (v162) {
          v163 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)a7 + 16, v162);
        }
        else {
          v163 = 0;
        }
        v164 = &v163[32 * v159];
        v165 = &v163[32 * v162];
        long long v166 = v155[1];
        *(_OWORD *)v164 = *v155;
        *((_OWORD *)v164 + 1) = v166;
        v158 = v164 + 32;
        v168 = *(char **)a7;
        v167 = (char *)*((void *)a7 + 1);
        if (v167 != *(char **)a7)
        {
          do
          {
            long long v169 = *((_OWORD *)v167 - 1);
            *((_OWORD *)v164 - 2) = *((_OWORD *)v167 - 2);
            *((_OWORD *)v164 - 1) = v169;
            v164 -= 32;
            v167 -= 32;
          }
          while (v167 != v168);
          v167 = *(char **)a7;
        }
        *(void *)a7 = v164;
        *((void *)a7 + 1) = v158;
        *((void *)a7 + 2) = v165;
        if (v167) {
          operator delete(v167);
        }
      }
      else
      {
        long long v157 = *(v152 - 1);
        _OWORD *v152 = *v155;
        v152[1] = v157;
        v158 = v152 + 2;
      }
      *((void *)a7 + 1) = v158;
    }
    v170 = +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread];
    v171 = [(TSDSmartStroke *)self strokeName];
    v172 = [v170 optionsForStroke:v171];
    v173 = [v172 objectForKeyedSubscript:@"split-at-sharp-angles"];
    char v174 = [v173 BOOLValue];

    double v175 = v360;
    if (v174)
    {
      if (v360 <= 0.99)
      {
        v176 = v353;
      }
      else
      {
        v176 = v353;
        if (v337 < v17)
        {
          ++v337;
          double v360 = 0.0;
          double v175 = 0.0;
        }
      }
      double v177 = v359;
      if (v359 < 0.01 && v330 > location)
      {
        --v330;
        double v359 = 1.0;
      }
    }
    else
    {
      if (v360 >= 0.01)
      {
        v176 = v353;
      }
      else
      {
        v176 = v353;
        if (v337 > location)
        {
          --v337;
          double v360 = 1.0;
          double v175 = 1.0;
        }
      }
      double v177 = v359;
      if (v359 > 0.99 && v330 < v17)
      {
        ++v330;
        double v359 = 0.0;
      }
    }
    objc_msgSend(v176, "gradientAt:fromElement:", v337, v175, v177);
    TSUSubtractPoints();
    double v178 = *((double *)v355 - 2);
    double v179 = *((double *)v355 - 1);
    [v176 gradientAt:v330 fromElement:v359];
    TSDAddPoints(v178, v179, v180);
    v181 = [(TSDSmartStroke *)self strokeName];
    char v182 = [v181 isEqualToString:@"Basic"];
    if ((v182 & 1) != 0
      || ([(TSDSmartStroke *)self strokeName],
          v171 = objc_claimAutoreleasedReturnValue(),
          ([v171 isEqualToString:@"Basic Rounded"] & 1) != 0))
    {
      int v183 = [v176 isEffectivelyClosed];
      if (v182)
      {

        if (!v183)
        {
LABEL_143:
          uint64_t v188 = 0;
          double v189 = 4.0 * v339;
          float v190 = 4.0 * 4.0 + 64.0;
          float v191 = v189 + (v96 - *(float *)&v338) * 64.0;
          *(float *)&double v189 = v189 + (v96 - v325) * 64.0;
          float v192 = 1.0 - (float)(v191 / v190);
          *(float *)&double v189 = 1.0 - (float)(*(float *)&v189 / v190);
          float v193 = vabds_f32(*(float *)&v189, v192);
          double v194 = v192;
          double v195 = *(float *)&v189;
          double v196 = v193 / (v328 * a8);
          double v197 = v96 / (float)((float)v345 * v190);
          float v198 = v196 + v194;
          *(float *)&double v196 = v195 - v196;
          double v199 = v197 + v194;
          double v200 = v195 - v197;
          *(float *)&double v195 = (float)(v345 - 1);
          double v201 = (double)(v345 - 1);
          float v202 = (float)(*(float *)&v195 + v198) - (float)v348;
          *(float *)&double v195 = (float)((float)(*(float *)&v195 + *(float *)&v196) - (float)v348) / (float)v345;
          double v203 = (v199 + v201 - (double)v348) / (double)v345;
          double v204 = (v200 + v201 - (double)v348) / (double)v345;
          float v346 = 1.0 - (float)(v202 / (float)v345);
          float v340 = 1.0 - *(float *)&v195;
          double v331 = v326 + v328 * 0.5;
          *(float *)&double v203 = v96 - v203;
          int v352 = LODWORD(v203);
          *(float *)&double v204 = v96 - v204;
          int v349 = LODWORD(v204);
          v205 = (char *)a7 + 16;
          if (v98 <= 1) {
            uint64_t v206 = 1;
          }
          else {
            uint64_t v206 = v98;
          }
          double v207 = 1.0;
          do
          {
            uint64_t v208 = v188 + 1;
            v209 = &__p[2 * v188];
            double v210 = *v209;
            double v211 = v209[1];
            TSUSubtractPoints();
            double v214 = TSDNormalizePoint(v212, v213);
            double v216 = v215;
            TSUSubtractPoints();
            double v219 = TSDNormalizePoint(v217, v218);
            double v221 = v220;
            double v222 = TSDMultiplyPointScalar(v219, v220, -1.0);
            double v224 = TSDDotPoints(v214, v216, v222, v223);
            long double v225 = acos(fmin(fmax(v224, -1.0), v207));
            double v226 = sin(v225 * 0.5);
            [(TSDStroke *)self miterLimit];
            double v343 = v227 * 0.995;
            double v344 = v207 / v226;
            if (v207 / v226 <= v227 * 0.995)
            {
              double v239 = TSDAveragePoints(v214, v216, v219);
              double v241 = TSDRotatePoint90Degrees(0, v239, v240);
              double v243 = TSDNormalizePoint(v241, v242);
              double v236 = TSDMultiplyPointScalar(v243, v244, v331 / v226);
            }
            else
            {
              double v228 = TSDRotatePoint90Degrees(0, v214, v216);
              double v230 = v229;
              double v231 = TSDRotatePoint90Degrees(0, v219, v221);
              double v233 = v232;
              double v234 = TSDNormalizePoint(v228, v230);
              double v236 = TSDMultiplyPointScalar(v234, v235, v331);
              double v237 = TSDNormalizePoint(v231, v233);
              double v338 = TSDMultiplyPointScalar(v237, v238, v331);
            }
            TSUMix();
            double v246 = v245;
            TSUMix();
            double v248 = v247;
            double v249 = TSDAddPoints(v210, v211, v236);
            v251 = (char *)*((void *)a7 + 1);
            unint64_t v250 = *((void *)a7 + 2);
            float v252 = v248;
            float v253 = v246;
            float v254 = v249;
            float v256 = v255;
            if (v154)
            {
              if ((unint64_t)v251 >= v250)
              {
                uint64_t v257 = (uint64_t)&v251[-*(void *)a7] >> 5;
                if ((unint64_t)(v257 + 1) >> 59) {
                  abort();
                }
                uint64_t v258 = v250 - *(void *)a7;
                uint64_t v259 = v258 >> 4;
                if (v258 >> 4 <= (unint64_t)(v257 + 1)) {
                  uint64_t v259 = v257 + 1;
                }
                if ((unint64_t)v258 >= 0x7FFFFFFFFFFFFFE0) {
                  unint64_t v260 = 0x7FFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v260 = v259;
                }
                if (v260) {
                  v261 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)a7 + 16, v260);
                }
                else {
                  v261 = 0;
                }
                v262 = (float *)&v261[32 * v257];
                float *v262 = 0.0;
                v262[1] = v254;
                v262[2] = v256;
                v262[3] = v252;
                v262[4] = v346;
                *((_DWORD *)v262 + 5) = v352;
                *((_DWORD *)v262 + 6) = v349;
                v262[7] = v253;
                v264 = *(char **)a7;
                v263 = (char *)*((void *)a7 + 1);
                v265 = v262;
                if (v263 != *(char **)a7)
                {
                  do
                  {
                    long long v266 = *((_OWORD *)v263 - 1);
                    *((_OWORD *)v265 - 2) = *((_OWORD *)v263 - 2);
                    *((_OWORD *)v265 - 1) = v266;
                    v265 -= 8;
                    v263 -= 32;
                  }
                  while (v263 != v264);
                  v263 = *(char **)a7;
                }
                v251 = (char *)(v262 + 8);
                *(void *)a7 = v265;
                *((void *)a7 + 1) = v262 + 8;
                *((void *)a7 + 2) = &v261[32 * v260];
                if (v263) {
                  operator delete(v263);
                }
              }
              else
              {
                *(_DWORD *)v251 = 0;
                *((float *)v251 + 1) = v254;
                *((float *)v251 + 2) = v256;
                *((float *)v251 + 3) = v252;
                *((float *)v251 + 4) = v346;
                *((_DWORD *)v251 + 5) = v352;
                *((_DWORD *)v251 + 6) = v349;
                *((float *)v251 + 7) = v253;
                v251 += 32;
              }
              *((void *)a7 + 1) = v251;
              unint64_t v250 = *((void *)a7 + 2);
            }
            BYTE2(v361[0]) = 0;
            LOWORD(v361[0]) = 0;
            if ((unint64_t)v251 >= v250)
            {
              uint64_t v269 = (uint64_t)&v251[-*(void *)a7] >> 5;
              if ((unint64_t)(v269 + 1) >> 59) {
                abort();
              }
              uint64_t v270 = v250 - *(void *)a7;
              uint64_t v271 = v270 >> 4;
              if (v270 >> 4 <= (unint64_t)(v269 + 1)) {
                uint64_t v271 = v269 + 1;
              }
              if ((unint64_t)v270 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v272 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v272 = v271;
              }
              if (v272) {
                v273 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)a7 + 16, v272);
              }
              else {
                v273 = 0;
              }
              v274 = (float *)&v273[32 * v269];
              float *v274 = 0.0;
              v274[1] = v254;
              v274[2] = v256;
              v274[3] = v252;
              v274[4] = v346;
              *((_DWORD *)v274 + 5) = v352;
              *((_DWORD *)v274 + 6) = v349;
              v274[7] = v253;
              v276 = *(char **)a7;
              v275 = (char *)*((void *)a7 + 1);
              v277 = v274;
              if (v275 != *(char **)a7)
              {
                do
                {
                  long long v278 = *((_OWORD *)v275 - 1);
                  *((_OWORD *)v277 - 2) = *((_OWORD *)v275 - 2);
                  *((_OWORD *)v277 - 1) = v278;
                  v277 -= 8;
                  v275 -= 32;
                }
                while (v275 != v276);
                v275 = *(char **)a7;
              }
              v268 = (char *)(v274 + 8);
              *(void *)a7 = v277;
              *((void *)a7 + 1) = v274 + 8;
              *((void *)a7 + 2) = &v273[32 * v272];
              if (v275) {
                operator delete(v275);
              }
            }
            else
            {
              char *v251 = 0;
              __int16 v267 = v361[0];
              v251[3] = BYTE2(v361[0]);
              *(_WORD *)(v251 + 1) = v267;
              *((float *)v251 + 1) = v254;
              *((float *)v251 + 2) = v256;
              *((float *)v251 + 3) = v252;
              *((float *)v251 + 4) = v346;
              *((_DWORD *)v251 + 5) = v352;
              *((_DWORD *)v251 + 6) = v349;
              *((float *)v251 + 7) = v253;
              v268 = v251 + 32;
            }
            *((void *)a7 + 1) = v268;
            TSUSubtractPoints();
            float v280 = v279;
            float v282 = v281;
            unint64_t v283 = *((void *)a7 + 2);
            if ((unint64_t)v268 >= v283)
            {
              uint64_t v285 = (uint64_t)&v268[-*(void *)a7] >> 5;
              if ((unint64_t)(v285 + 1) >> 59) {
                abort();
              }
              uint64_t v286 = v283 - *(void *)a7;
              uint64_t v287 = v286 >> 4;
              if (v286 >> 4 <= (unint64_t)(v285 + 1)) {
                uint64_t v287 = v285 + 1;
              }
              if ((unint64_t)v286 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v288 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v288 = v287;
              }
              if (v288) {
                v289 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)a7 + 16, v288);
              }
              else {
                v289 = 0;
              }
              v290 = (float *)&v289[32 * v285];
              float *v290 = 0.0;
              v290[1] = v280;
              v290[2] = v282;
              v290[3] = v252;
              v290[4] = v340;
              *((_DWORD *)v290 + 5) = v352;
              *((_DWORD *)v290 + 6) = v349;
              v290[7] = v253;
              v292 = *(char **)a7;
              v291 = (char *)*((void *)a7 + 1);
              v293 = v290;
              double v207 = 1.0;
              if (v291 != *(char **)a7)
              {
                do
                {
                  long long v294 = *((_OWORD *)v291 - 1);
                  *((_OWORD *)v293 - 2) = *((_OWORD *)v291 - 2);
                  *((_OWORD *)v293 - 1) = v294;
                  v293 -= 8;
                  v291 -= 32;
                }
                while (v291 != v292);
                v291 = *(char **)a7;
              }
              v284 = (char *)(v290 + 8);
              *(void *)a7 = v293;
              *((void *)a7 + 1) = v290 + 8;
              *((void *)a7 + 2) = &v289[32 * v288];
              if (v291) {
                operator delete(v291);
              }
            }
            else
            {
              *(_DWORD *)v268 = 0;
              *((float *)v268 + 1) = v280;
              *((float *)v268 + 2) = v282;
              *((float *)v268 + 3) = v252;
              *((float *)v268 + 4) = v340;
              *((_DWORD *)v268 + 5) = v352;
              *((_DWORD *)v268 + 6) = v349;
              v284 = v268 + 32;
              *((float *)v268 + 7) = v253;
              double v207 = 1.0;
            }
            *((void *)a7 + 1) = v284;
            if (v344 > v343)
            {
              float v295 = TSDAddPoints(v210, v211, v338);
              float v297 = v296;
              if ((unint64_t)v284 >= *v205)
              {
                uint64_t v299 = (uint64_t)&v284[-*(void *)a7] >> 5;
                if ((unint64_t)(v299 + 1) >> 59) {
                  abort();
                }
                uint64_t v300 = *v205 - *(void *)a7;
                uint64_t v301 = v300 >> 4;
                if (v300 >> 4 <= (unint64_t)(v299 + 1)) {
                  uint64_t v301 = v299 + 1;
                }
                if ((unint64_t)v300 >= 0x7FFFFFFFFFFFFFE0) {
                  unint64_t v302 = 0x7FFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v302 = v301;
                }
                if (v302) {
                  v303 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)a7 + 16, v302);
                }
                else {
                  v303 = 0;
                }
                v304 = (float *)&v303[32 * v299];
                float *v304 = 0.0;
                v304[1] = v295;
                v304[2] = v297;
                v304[3] = v252;
                v304[4] = v346;
                *((_DWORD *)v304 + 5) = v352;
                *((_DWORD *)v304 + 6) = v349;
                v304[7] = v253;
                v306 = *(char **)a7;
                v305 = (char *)*((void *)a7 + 1);
                v307 = v304;
                if (v305 != *(char **)a7)
                {
                  do
                  {
                    long long v308 = *((_OWORD *)v305 - 1);
                    *((_OWORD *)v307 - 2) = *((_OWORD *)v305 - 2);
                    *((_OWORD *)v307 - 1) = v308;
                    v307 -= 8;
                    v305 -= 32;
                  }
                  while (v305 != v306);
                  v305 = *(char **)a7;
                }
                v298 = (char *)(v304 + 8);
                *(void *)a7 = v307;
                *((void *)a7 + 1) = v304 + 8;
                *((void *)a7 + 2) = &v303[32 * v302];
                if (v305) {
                  operator delete(v305);
                }
              }
              else
              {
                *(_DWORD *)v284 = 0;
                *((float *)v284 + 1) = v295;
                *((float *)v284 + 2) = v297;
                *((float *)v284 + 3) = v252;
                *((float *)v284 + 4) = v346;
                *((_DWORD *)v284 + 5) = v352;
                *((_DWORD *)v284 + 6) = v349;
                v298 = v284 + 32;
                *((float *)v284 + 7) = v253;
              }
              *((void *)a7 + 1) = v298;
              TSUSubtractPoints();
              float v310 = v309;
              float v312 = v311;
              unint64_t v313 = *((void *)a7 + 2);
              if ((unint64_t)v298 >= v313)
              {
                uint64_t v315 = (uint64_t)&v298[-*(void *)a7] >> 5;
                if ((unint64_t)(v315 + 1) >> 59) {
                  abort();
                }
                uint64_t v316 = v313 - *(void *)a7;
                uint64_t v317 = v316 >> 4;
                if (v316 >> 4 <= (unint64_t)(v315 + 1)) {
                  uint64_t v317 = v315 + 1;
                }
                if ((unint64_t)v316 >= 0x7FFFFFFFFFFFFFE0) {
                  unint64_t v318 = 0x7FFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v318 = v317;
                }
                if (v318) {
                  v319 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKit::OpticalKern::Edge::CGPointVector>>((uint64_t)a7 + 16, v318);
                }
                else {
                  v319 = 0;
                }
                v320 = (float *)&v319[32 * v315];
                float *v320 = 0.0;
                v320[1] = v310;
                v320[2] = v312;
                v320[3] = v252;
                v320[4] = v340;
                *((_DWORD *)v320 + 5) = v352;
                *((_DWORD *)v320 + 6) = v349;
                v320[7] = v253;
                v322 = *(char **)a7;
                v321 = (char *)*((void *)a7 + 1);
                v323 = v320;
                double v207 = 1.0;
                if (v321 != *(char **)a7)
                {
                  do
                  {
                    long long v324 = *((_OWORD *)v321 - 1);
                    *((_OWORD *)v323 - 2) = *((_OWORD *)v321 - 2);
                    *((_OWORD *)v323 - 1) = v324;
                    v323 -= 8;
                    v321 -= 32;
                  }
                  while (v321 != v322);
                  v321 = *(char **)a7;
                }
                v314 = (char *)(v320 + 8);
                *(void *)a7 = v323;
                *((void *)a7 + 1) = v320 + 8;
                *((void *)a7 + 2) = &v319[32 * v318];
                if (v321) {
                  operator delete(v321);
                }
              }
              else
              {
                *(_DWORD *)v298 = 0;
                *((float *)v298 + 1) = v310;
                *((float *)v298 + 2) = v312;
                *((float *)v298 + 3) = v252;
                *((float *)v298 + 4) = v340;
                *((_DWORD *)v298 + 5) = v352;
                *((_DWORD *)v298 + 6) = v349;
                v314 = v298 + 32;
                *((float *)v298 + 7) = v253;
                double v207 = 1.0;
              }
              *((void *)a7 + 1) = v314;
            }
            BOOL v154 = 0;
            uint64_t v188 = v208;
          }
          while (v208 != v206);
          if ((void)v362)
          {
            *((void *)&v362 + 1) = v362;
            operator delete((void *)v362);
          }
          BOOL v86 = __p;
          goto LABEL_238;
        }
      }
      else
      {

        if ((v183 & 1) == 0) {
          goto LABEL_143;
        }
      }
      [v353 gradientAt:v330 fromElement:v359];
      double v184 = *__p;
      double v185 = __p[1];
      [v353 gradientAt:v337 fromElement:v360];
      double v187 = v186;
      TSUSubtractPoints();
      TSDAddPoints(v184, v185, v187);
      a8 = v342;
      double v96 = 1.0;
      goto LABEL_143;
    }

    goto LABEL_143;
  }
LABEL_238:
  if (v86) {
    operator delete(v86);
  }

LABEL_241:
}

- (void)p_finishMetalRenderInContext:(CGContext *)a3 orDirectly:(id)a4 pathVertexData:(void *)a5 parameterized:(BOOL)a6 shouldReverseDrawOrder:(BOOL)a7 withLayoutOptions:(id)a8
{
  BOOL v176 = a6;
  v252[4] = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v172 = a8;
  context = (void *)MEMORY[0x223CB9570]();
  char v182 = v12;
  int v183 = (uint64_t *)a5;
  if (*((void *)a5 + 1) == *(void *)a5) {
    goto LABEL_84;
  }
  v173 = self;
  c = a3;
  if (v12)
  {
    [v12 frame];
    TSURectWithSize();
    double v14 = v13;
    double v16 = v15;
    [v12 transform];
    double m11 = v235.m11;
    double m12 = v235.m12;
    long long v249 = *(_OWORD *)&v235.m13;
    long long v250 = *(_OWORD *)&v235.m21;
    long long v246 = *(_OWORD *)&v235.m13;
    long long v247 = *(_OWORD *)&v235.m21;
    if (v14 <= 0.0 || v16 <= 0.0) {
      goto LABEL_84;
    }
    v170 = [(TSDStroke *)self color];
LABEL_13:
    [(TSDStroke *)self width];
    double v25 = v24;
    [v170 alphaComponent];
    double v27 = sqrt(m12 * m12 + m11 * m11);
    double v28 = 1.0 / v27;
    double v29 = v25 * v27;
    if (v25 >= v28) {
      double v29 = 1.0;
    }
    double v30 = v29 * v26;
    if (v176) {
      double v31 = 1.0;
    }
    else {
      double v31 = v30;
    }
    if (v12)
    {
      uint64_t v157 = 0;
      uint64_t v155 = 0;
      double x = *MEMORY[0x263F001A8];
      double width = *(double *)(MEMORY[0x263F001A8] + 16);
      double y = *(double *)(MEMORY[0x263F001A8] + 8);
      double height = *(double *)(MEMORY[0x263F001A8] + 24);
    }
    else
    {
      CGContextSaveGState(c);
      v244.CATransform3D a = m11;
      v244.CATransform3D b = m12;
      *(_OWORD *)&v244.c = v246;
      *(_OWORD *)&v244.tdouble x = v247;
      CGAffineTransformInvert(&transform, &v244);
      CGContextConcatCTM(c, &transform);
      long long v34 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      long long v246 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      long long v247 = v34;
      ClipBoundingBodouble x = CGContextGetClipBoundingBox(c);
      CGRect v255 = CGRectIntegral(ClipBoundingBox);
      double x = v255.origin.x;
      double y = v255.origin.y;
      double width = v255.size.width;
      double height = v255.size.height;
      uint64_t v155 = (uint64_t)fmin(v255.size.width, 1024.0);
      uint64_t v157 = (uint64_t)fmin(v255.size.height, 1024.0);
    }
    double v185 = TSDMetalDevicePreferringLowPower();
    if (v12)
    {
      uint64_t v35 = [v12 metalDeviceOverride];
      BOOL v36 = v35 == 0;

      if (!v36)
      {
        uint64_t v37 = [v182 metalDeviceOverride];

        double v185 = (void *)v37;
      }
    }
    double v207 = [MEMORY[0x263EFF980] array];
    uint64_t v206 = [MEMORY[0x263EFF980] array];
    uint64_t v38 = *((void *)a5 + 1) - *(void *)a5;
    if (v38)
    {
      unint64_t v39 = 0;
      unint64_t v40 = v38 >> 5;
      uint64_t v179 = v38 >> 5;
      do
      {
        uint64_t v41 = 0;
        uint64_t v42 = *v183;
        double v43 = (unsigned __int8 *)(*v183 + 32 * v39);
        unint64_t v44 = v39;
        do
        {
          int v45 = *v43;
          v43 += 32;
          if (v45)
          {
            if (v41) {
              break;
            }
            ++v39;
          }
          else
          {
            ++v41;
          }
          ++v44;
        }
        while (v44 < v40);
        double v46 = (unsigned char *)(v42 + 32 * v39);
        v39 += v41;
        std::vector<TSDBrushVertexData>::vector<std::__wrap_iter<TSDBrushVertexData*>,0>((uint64_t)&v235, v46, (unsigned char *)(v42 + 32 * v39));
        CGFloat v47 = v235.m12;
        uint64_t v48 = *(void *)&v235.m12 - *(void *)&v235.m11;
        if (*(void *)&v235.m12 != *(void *)&v235.m11)
        {
          unint64_t v186 = v39;
          unint64_t v49 = 0;
          unint64_t v204 = v48 >> 5;
          unint64_t v193 = (v48 >> 5) - 3;
          do
          {
            double v50 = +[TSDGPUDataBufferAttribute attributeWithName:@"position" bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
            double v51 = +[TSDGPUDataBufferAttribute attributeWithName:@"textureCoordinate" bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
            double v200 = +[TSDGPUDataBufferAttribute attributeWithName:@"clampedTextureCoordinate" bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
            double v52 = +[TSDGPUDataBufferAttribute attributeWithName:@"percentAlongPath" bufferUsage:35044 dataType:5 normalized:1 componentCount:1];
            v252[0] = v50;
            v252[1] = v51;
            v252[2] = v200;
            v252[3] = v52;
            uint64_t v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v252 count:4];
            uint64_t v54 = 65534;
            if (v204 - v49 <= 0xFFFE) {
              uint64_t v54 = v204 - v49;
            }
            if (v54 + v49 <= v193 || v54 + v49 >= v204) {
              uint64_t v56 = v54;
            }
            else {
              uint64_t v56 = v204 - v49 - 3;
            }
            double v196 = (void *)v53;
            id v198 = +[TSDGPUDataBuffer newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:](TSDGPUDataBuffer, "newDataBufferWithVertexAttributes:vertexCount:indexElementCount:device:");
            [v198 setMetalDrawMode:4];
            v239[0] = MEMORY[0x263EF8330];
            v239[1] = 3321888768;
            v239[2] = __128__TSDBrushStroke_p_finishMetalRenderInContext_orDirectly_pathVertexData_parameterized_shouldReverseDrawOrder_withLayoutOptions___block_invoke;
            v239[3] = &__block_descriptor_81_ea8_56c60_ZTSNSt3__16vectorI18TSDBrushVertexDataNS_9allocatorIS1_EEEE_e37_v24__0____qQB_QQQB__NSRange_QQ_Q_8Q16l;
            v239[4] = v56;
            v239[5] = v49;
            BOOL v243 = a7;
            v239[6] = v204;
            double v241 = 0;
            uint64_t v242 = 0;
            double v240 = 0;
            CGFloat v57 = v235.m11;
            int64_t v58 = *(void *)&v235.m12 - *(void *)&v235.m11;
            if (*(void *)&v235.m12 != *(void *)&v235.m11)
            {
              std::vector<TSDBrushVertexData>::__vallocate[abi:nn180100](&v240, v58 >> 5);
              double v59 = v241;
              memmove(v241, *(const void **)&v57, v58);
              double v241 = &v59[32 * (v58 >> 5)];
            }
            [v198 updateMetalDataBufferAttributes:v196 withBlock:v239];
            [v207 addObject:v198];
            v49 += v56;
            double v60 = [NSNumber numberWithBool:v49 >= v204];
            [v206 addObject:v60];

            if (v240)
            {
              double v241 = v240;
              operator delete(v240);
            }
          }
          while (v49 < v204);
          CGFloat v47 = v235.m11;
          unint64_t v39 = v186;
          unint64_t v40 = v179;
        }
        if (v47 != 0.0)
        {
          v235.double m12 = v47;
          operator delete(*(void **)&v47);
        }
      }
      while (v39 < v40);
    }
    if (!v182)
    {
      uint64_t v66 = 70;
      unint64_t v67 = v157;
      unint64_t v68 = v155;
LABEL_65:
      uint64_t v79 = +[TSDCapabilities currentCapabilities];
      [v79 maximumMetalTextureSizeForDevice:v185];
      double v81 = v80;
      double v83 = v82;

      unint64_t v84 = v67;
      unint64_t v85 = v68;
      if (!v176)
      {
        double v86 = (double)v68 + (double)v68;
        double v87 = (double)v67 + (double)v67;
        BOOL v88 = v86 > v81 || v87 > v83;
        unint64_t v84 = v67;
        unint64_t v85 = v68;
        if (!v88)
        {
          unint64_t v85 = (unint64_t)v86;
          unint64_t v84 = (unint64_t)v87;
        }
      }
      double v199 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v66 width:v85 height:v84 mipmapped:0];
      [v199 setUsage:5];
      [v199 setStorageMode:2];
      float v190 = (void *)[v185 newTextureWithDescriptor:v199];
      v205 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:v66 width:v68 height:v67 mipmapped:0];
      [v205 setUsage:5];
      [v205 setStorageMode:0];
      if (v182)
      {
        double v89 = [v182 surface];
        float v192 = (void *)[v185 newTextureWithDescriptor:v205 iosurface:v89 plane:0];
      }
      else
      {
        float v192 = (void *)[v185 newTextureWithDescriptor:v205];
      }
      uint64_t v188 = [MEMORY[0x263F129A0] renderPassDescriptor];
      double v90 = [v188 colorAttachments];
      v163 = [v90 objectAtIndexedSubscript:0];

      [v163 setTexture:v190];
      [v163 setStoreAction:1];
      [v163 setLoadAction:2];
      objc_msgSend(v163, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
      id v91 = [(TSDBrushStroke *)v173 p_metalBrushShaderForPixelFormat:v66 andDevice:v185];
      double v197 = [(TSDBrushStroke *)v173 p_metalOpacityShaderForPixelFormat:v66 andDevice:v185];
      unint64_t v92 = [v192 width];
      unint64_t v93 = [v192 height];
      id v187 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v185, 0.0, 0.0, (double)v92, (double)v93, *MEMORY[0x263F7C928], *(double *)(MEMORY[0x263F7C928] + 8), *(double *)(MEMORY[0x263F7C928] + 16), *(double *)(MEMORY[0x263F7C928] + 24));
      v236[0] = v176;
      Components = (float64x2_t *)CGColorGetComponents((CGColorRef)[v170 CGColor]);
      *(float32x2_t *)&long long v95 = vcvt_f32_f64(*Components);
      *(float *)&unsigned int v96 = Components[1].f64[0];
      *((void *)&v95 + 1) = __PAIR64__(1.0, v96);
      long long v237 = v95;
      [v172 strokeEnd];
      *(float *)&double v97 = v97;
      int v238 = LODWORD(v97);
      double v189 = [(TSDBrushStroke *)v173 p_metalTextureForCurrentStrokeAndDevice:v185];
      double v184 = TSDMetalCommandQueueForRenderingDrawables(v185);
      if (v182)
      {
        [v182 frame];
        double v99 = v98;
        double v101 = v100;
        long long v102 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
        *(_OWORD *)&v234.double m11 = *MEMORY[0x263F15740];
        *(_OWORD *)&v234.CGFloat m13 = v102;
        long long v103 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
        *(_OWORD *)&v234.CGFloat m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
        *(_OWORD *)&v234.CGFloat m23 = v103;
        long long v104 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
        *(_OWORD *)&v234.CGFloat m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
        *(_OWORD *)&v234.m33 = v104;
        long long v105 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
        *(_OWORD *)&v234.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
        *(_OWORD *)&v234.CGFloat m43 = v105;
        CATransform3DScale(&v235, &v234, 2.0 / v98, -2.0 / v100, 1.0);
        CATransform3D v233 = v235;
        CATransform3DTranslate(&v235, &v233, v99 * -0.5, v101 * -0.5, 0.0);
        double v180 = v31;
        CGFloat v194 = m12;
        CGFloat v201 = m11;
        CATransform3D v232 = v235;
        [v182 contentsScale];
        double v107 = v106;
        [v182 contentsScale];
        CATransform3DScale(&v235, &v232, 1.0 / v107, 1.0 / v108, 1.0);
        CGFloat v109 = v235.m11;
        CGFloat v110 = v235.m12;
        CGFloat m13 = v235.m13;
        CGFloat m14 = v235.m14;
        CGFloat m21 = v235.m21;
        CGFloat m22 = v235.m22;
        CGFloat m23 = v235.m23;
        CGFloat m24 = v235.m24;
        CGFloat m31 = v235.m31;
        CGFloat m32 = v235.m32;
        CGFloat ca = v235.m33;
        CGFloat m34 = v235.m34;
        sdouble x = v235.m41;
        CGFloat m42 = v235.m42;
        CGFloat m44 = v235.m44;
        CGFloat m43 = v235.m43;
        m.CATransform3D a = v201;
        m.CATransform3D b = v194;
        *(_OWORD *)&m.tdouble x = v250;
        *(_OWORD *)&m.c = v249;
        CATransform3DMakeAffineTransform(&a, &m);
        b.double m11 = v109;
        b.double m12 = v110;
        b.CGFloat m13 = m13;
        b.CGFloat m14 = m14;
        b.CGFloat m21 = m21;
        b.CGFloat m22 = m22;
        b.CGFloat m23 = m23;
        b.CGFloat m24 = m24;
        b.CGFloat m31 = m31;
        b.CGFloat m32 = m32;
        b.m33 = ca;
        b.CGFloat m34 = m34;
        b.m41 = sx;
        b.CGFloat m42 = m42;
        b.CGFloat m43 = m43;
        b.CGFloat m44 = m44;
        CATransform3DConcat(&v235, &a, &b);
        float64x2_t v159 = *(float64x2_t *)&v235.m11;
        float64x2_t sxa = *(float64x2_t *)&v235.m21;
        float64x2_t v195 = *(float64x2_t *)&v235.m33;
        float64x2_t v166 = *(float64x2_t *)&v235.m31;
        *(_OWORD *)cCATransform3D b = *(_OWORD *)&v235.m13;
        float64x2_t v202 = *(float64x2_t *)&v235.m43;
        float64x2_t v175 = *(float64x2_t *)&v235.m41;
        float64x2_t v178 = *(float64x2_t *)&v235.m23;
        double v117 = [v184 commandBuffer];
        v118 = [v117 renderCommandEncoderWithDescriptor:v188];
        v227[1] = 0.0;
        v227[0] = 0.0;
        v227[2] = (double)(unint64_t)[v199 width];
        v227[3] = (double)(unint64_t)[v199 height];
        long long v228 = xmmword_22383A500;
        [v118 setViewport:v227];
        [v118 setFragmentTexture:v189 atIndex:0];
        *(float32x4_t *)&v235.double m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v159), *(float64x2_t *)cb);
        *(float32x4_t *)&v235.CGFloat m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(sxa), v178);
        *(float32x4_t *)&v235.CGFloat m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v166), v195);
        *(float32x4_t *)&v235.CGFloat m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v175), v202);
        [v91 setPipelineStateWithEncoder:v118 vertexBytes:&v235 fragmentBytes:v236];
        long long v225 = 0u;
        long long v226 = 0u;
        long long v223 = 0u;
        long long v224 = 0u;
        id v119 = v207;
        uint64_t v120 = [v119 countByEnumeratingWithState:&v223 objects:v251 count:16];
        if (v120)
        {
          uint64_t v121 = *(void *)v224;
          do
          {
            for (uint64_t i = 0; i != v120; ++i)
            {
              if (*(void *)v224 != v121) {
                objc_enumerationMutation(v119);
              }
              objc_msgSend(*(id *)(*((void *)&v223 + 1) + 8 * i), "drawWithEncoder:atIndex:", v118, objc_msgSend(v91, "bufferIndex"));
            }
            uint64_t v120 = [v119 countByEnumeratingWithState:&v223 objects:v251 count:16];
          }
          while (v120);
        }

        [v118 endEncoding];
        v123 = [MEMORY[0x263F129A0] renderPassDescriptor];
        v124 = [v123 colorAttachments];
        v125 = [v124 objectAtIndexedSubscript:0];

        [v125 setTexture:v192];
        [v125 setStoreAction:1];
        [v125 setLoadAction:2];
        objc_msgSend(v125, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
        float v126 = [v117 renderCommandEncoderWithDescriptor:v123];
        v221[1] = 0.0;
        v221[0] = 0.0;
        v221[2] = (double)(unint64_t)[v205 width];
        v221[3] = (double)(unint64_t)[v205 height];
        long long v222 = xmmword_22383A500;
        [v126 setViewport:v221];
        [v126 setFragmentTexture:v190 atIndex:0];
        TSDTransform3DMakeOrtho((uint64_t)v220, 0.0, (double)(unint64_t)[v205 width], 0.0, (double)(unint64_t)objc_msgSend(v205, "height"), -1.0, 1.0);
        *(float32x4_t *)&v219.double m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v220[0]), v220[1]);
        *(float32x4_t *)&v219.CGFloat m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v220[2]), v220[3]);
        *(float32x4_t *)&v219.CGFloat m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v220[4]), v220[5]);
        *(float32x4_t *)&v219.CGFloat m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v220[6]), v220[7]);
        float32_t v127 = v180;
        v210[0].f32[0] = v127;
        [v197 setPipelineStateWithEncoder:v126 vertexBytes:&v219 fragmentBytes:v210];
        objc_msgSend(v187, "drawWithEncoder:atIndex:", v126, objc_msgSend(v197, "bufferIndex"));
        [v126 endEncoding];
        [v117 enqueue];
        [v117 commit];
        [v117 waitUntilCompleted];
      }
      else
      {
        int v150 = vcvtpd_s64_f64(width * 0.0009765625);
        if (v150 >= 1)
        {
          int v151 = 0;
          int v128 = vcvtpd_s64_f64(height * 0.0009765625);
          double v129 = (double)v157;
          double v160 = (double)-v157 * 0.5;
          float v130 = v31;
          int v154 = v128;
          do
          {
            if (v128 >= 1)
            {
              int v181 = 0;
              double v131 = (double)(int)(x + (double)(v151 << 10));
              do
              {
                memset(&v235, 0, sizeof(v235));
                CATransform3DMakeScale(&v235, 2.0 / (double)v155, 2.0 / v129, 1.0);
                CATransform3D v218 = v235;
                double v132 = (double)(int)(y + (double)(v181 << 10));
                CATransform3DTranslate(&v219, &v218, (double)-v155 * 0.5 - v131, v160 - v132, 0.0);
                CATransform3D v235 = v219;
                v216.CATransform3D a = m11;
                v216.CATransform3D b = m12;
                *(_OWORD *)&v216.c = v249;
                *(_OWORD *)&v216.tdouble x = v250;
                CATransform3DMakeAffineTransform(&v217, &v216);
                CATransform3D v215 = v235;
                CATransform3DConcat(&v219, &v217, &v215);
                unint64_t v133 = 0;
                CATransform3D v235 = v219;
                while (v133 < [v207 count])
                {
                  double v203 = [v184 commandBuffer];
                  unint64_t v134 = 0;
                  while (v133 < [v207 count] && v134 <= 8)
                  {
                    double v135 = [v203 renderCommandEncoderWithDescriptor:v188];
                    v213[0] = 0.0;
                    v213[1] = 0.0;
                    v213[2] = (double)(unint64_t)[v199 width];
                    v213[3] = (double)(unint64_t)[v199 height];
                    long long v214 = xmmword_22383A500;
                    [v135 setViewport:v213];
                    [v135 setFragmentTexture:v189 atIndex:0];
                    *(float32x4_t *)&v219.double m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v235.m11), *(float64x2_t *)&v235.m13);
                    *(float32x4_t *)&v219.CGFloat m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v235.m21), *(float64x2_t *)&v235.m23);
                    *(float32x4_t *)&v219.CGFloat m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v235.m31), *(float64x2_t *)&v235.m33);
                    *(float32x4_t *)&v219.CGFloat m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v235.m41), *(float64x2_t *)&v235.m43);
                    [v91 setPipelineStateWithEncoder:v135 vertexBytes:&v219 fragmentBytes:v236];
                    v134 += 2;
                    unint64_t v136 = v133;
                    do
                    {
                      if (v136 >= [v207 count]) {
                        break;
                      }
                      v137 = [v207 objectAtIndexedSubscript:v136];
                      objc_msgSend(v137, "drawWithEncoder:atIndex:", v135, objc_msgSend(v91, "bufferIndex"));
                      double v138 = [v206 objectAtIndexedSubscript:v136];
                      char v139 = [v138 BOOLValue];

                      ++v136;
                    }
                    while ((v139 & 1) == 0);
                    [v135 endEncoding];
                    double v140 = [MEMORY[0x263F129A0] renderPassDescriptor];
                    double v141 = [v140 colorAttachments];
                    double v142 = [v141 objectAtIndexedSubscript:0];

                    [v142 setTexture:v192];
                    [v142 setStoreAction:1];
                    if (v133)
                    {
                      [v142 setLoadAction:1];
                    }
                    else
                    {
                      [v142 setLoadAction:2];
                      objc_msgSend(v142, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
                    }
                    double v143 = [v203 renderCommandEncoderWithDescriptor:v140];
                    v211[0] = 0.0;
                    v211[1] = 0.0;
                    v211[2] = (double)(unint64_t)[v205 width];
                    v211[3] = (double)(unint64_t)[v205 height];
                    long long v212 = xmmword_22383A500;
                    [v143 setViewport:v211];
                    [v143 setFragmentTexture:v190 atIndex:0];
                    TSDTransform3DMakeOrtho((uint64_t)v209, 0.0, (double)(unint64_t)[v205 width], 0.0, (double)(unint64_t)objc_msgSend(v205, "height"), -1.0, 1.0);
                    v210[0] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v209[0]), v209[1]);
                    v210[1] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v209[2]), v209[3]);
                    v210[2] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v209[4]), v209[5]);
                    v210[3] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v209[6]), v209[7]);
                    float v208 = v130;
                    [v197 setPipelineStateWithEncoder:v143 vertexBytes:v210 fragmentBytes:&v208];
                    objc_msgSend(v187, "drawWithEncoder:atIndex:", v143, objc_msgSend(v197, "bufferIndex"));
                    [v143 endEncoding];

                    unint64_t v133 = v136;
                  }
                  if (v133 > [v207 count])
                  {
                    double v144 = [MEMORY[0x263F7C7F0] currentHandler];
                    uint64_t v145 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_finishMetalRenderInContext:orDirectly:pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:]"];
                    uint64_t v146 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
                    [v144 handleFailureInFunction:v145 file:v146 lineNumber:1524 description:@"The buffer index should not be greater than the number of buffers."];
                  }
                  unint64_t v147 = [v207 count];
                  [v203 enqueue];
                  [v203 commit];
                  if (v133 >= v147) {
                    [v203 waitUntilCompleted];
                  }
                }
                CGImageFromTexture = TSDMetalCreateCGImageFromTexture(v192);
                if (v176)
                {
                  v256.origin.double x = (double)(int)(x + (double)(v151 << 10));
                  v256.origin.double y = (double)(int)(y + (double)(v181 << 10));
                  v256.size.double width = (double)v155;
                  v256.size.double height = v129;
                  CGContextDrawImage(c, v256, CGImageFromTexture);
                }
                else
                {
                  v149 = [v170 colorWithAlphaComponent:1.0];
                  objc_msgSend((id)objc_opt_class(), "p_drawColor:intoContext:usingImageAsMask:withRect:", v149, c, CGImageFromTexture, v131, v132, (double)v155, v129);
                }
                CGImageRelease(CGImageFromTexture);
                ++v181;
              }
              while (v181 != v154);
            }
            ++v151;
            int v128 = v154;
          }
          while (v151 != v150);
        }
        CGContextRestoreGState(c);
      }

      goto LABEL_84;
    }
    double v61 = [v182 surface];
    BOOL v62 = [v61 pixelFormat] == 1380411457;

    if (v62)
    {
      uint64_t v63 = [v182 surface];
      BOOL v64 = [v63 bytesPerElement] == 8;

      if (v64)
      {
        int v65 = 1;
        uint64_t v66 = 115;
LABEL_58:
        if ([v182 destinationColorSpaceOverride])
        {
          uint64_t v72 = (CGColorSpace *)[v182 destinationColorSpaceOverride];
          if (!v72)
          {
            unint64_t v73 = (CFStringRef *)MEMORY[0x263F00238];
            if (!v65) {
              unint64_t v73 = (CFStringRef *)MEMORY[0x263F002D8];
            }
            CGColorSpaceRef v74 = CGColorSpaceCreateWithName(*v73);
            uint64_t v72 = (CGColorSpace *)CFAutorelease(v74);
          }
          CGColorRef CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v72, kCGRenderingIntentDefault, (CGColorRef)[v170 CGColor], 0);
          uint64_t v76 = [MEMORY[0x263F7C808] colorWithCGColor:CFAutorelease(CopyByMatchingToColorSpace)];

          v170 = (void *)v76;
        }
        uint64_t v77 = [v182 surface];
        unint64_t v68 = [v77 width];

        v78 = [v182 surface];
        unint64_t v67 = [v78 height];

        goto LABEL_65;
      }
      double v69 = [MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v70 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_finishMetalRenderInContext:orDirectly:pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:]"];
      unint64_t v71 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
      [v69 handleFailureInFunction:v70 file:v71 lineNumber:1298 description:@"Half float precision requires 8 bytes per element."];
    }
    int v65 = 0;
    uint64_t v66 = 70;
    goto LABEL_58;
  }
  CGRect v253 = CGContextGetClipBoundingBox(a3);
  double v19 = v253.size.width;
  double v20 = v253.size.height;
  CGContextGetCTM((CGAffineTransform *)&v235, a3);
  double m11 = v235.m11;
  double m12 = v235.m12;
  long long v249 = *(_OWORD *)&v235.m13;
  long long v250 = *(_OWORD *)&v235.m21;
  if ([(TSDBrushStroke *)self p_isDrawingRasterizedIntoPDFWithContext:a3])
  {
    v248.CATransform3D a = m11;
    v248.CATransform3D b = m12;
    *(_OWORD *)&v248.c = v249;
    *(_OWORD *)&v248.tdouble x = v250;
    CGAffineTransformScale((CGAffineTransform *)&v235, &v248, 3.0, 3.0);
    double m11 = v235.m11;
    double m12 = v235.m12;
    long long v249 = *(_OWORD *)&v235.m13;
    long long v250 = *(_OWORD *)&v235.m21;
  }
  long long v246 = v249;
  long long v247 = v250;
  if (v19 > 0.0 && v20 > 0.0)
  {
    if (a3)
    {
      v170 = -[TSDStroke colorForCGContext:](self, "colorForCGContext:");
    }
    else
    {
      double v21 = [MEMORY[0x263F7C7F0] currentHandler];
      id v22 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_finishMetalRenderInContext:orDirectly:pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:]"];
      double v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
      [v21 handleFailureInFunction:v22 file:v23 lineNumber:1162 description:@"Should have either a direct context or a CGContext."];

      v170 = 0;
      id v12 = v182;
    }
    goto LABEL_13;
  }
LABEL_84:
}

void __128__TSDBrushStroke_p_finishMetalRenderInContext_orDirectly_pathVertexData_parameterized_shouldReverseDrawOrder_withLayoutOptions___block_invoke(uint64_t a1, long long *a2)
{
  long long v2 = a2[3];
  long long v49 = a2[2];
  long long v50 = v2;
  long long v51 = a2[4];
  uint64_t v52 = *((void *)a2 + 10);
  long long v3 = a2[1];
  long long v47 = *a2;
  long long v48 = v3;
  long long v4 = *(long long *)((char *)a2 + 136);
  long long v43 = *(long long *)((char *)a2 + 120);
  long long v44 = v4;
  long long v45 = *(long long *)((char *)a2 + 152);
  uint64_t v46 = *((void *)a2 + 21);
  long long v5 = *(long long *)((char *)a2 + 104);
  long long v41 = *(long long *)((char *)a2 + 88);
  long long v42 = v5;
  long long v6 = a2[14];
  long long v37 = a2[13];
  long long v38 = v6;
  long long v39 = a2[15];
  uint64_t v40 = *((void *)a2 + 32);
  long long v7 = a2[12];
  long long v35 = a2[11];
  long long v36 = v7;
  long long v8 = *(long long *)((char *)a2 + 312);
  long long v31 = *(long long *)((char *)a2 + 296);
  long long v32 = v8;
  long long v33 = *(long long *)((char *)a2 + 328);
  uint64_t v34 = *((void *)a2 + 43);
  long long v9 = *(long long *)((char *)a2 + 280);
  long long v29 = *(long long *)((char *)a2 + 264);
  long long v30 = v9;
  if (*(void *)(a1 + 32))
  {
    unint64_t v11 = 0;
    do
    {
      unint64_t v12 = *(void *)(a1 + 40) + v11;
      if (!*(unsigned char *)(a1 + 80)) {
        unint64_t v12 = *(void *)(a1 + 48) + ~v12;
      }
      double v13 = (float *)(*(void *)(a1 + 56) + 32 * v12);
      float v14 = v13[1];
      float v15 = v13[2];
      float v16 = v13[3];
      float v17 = v13[4];
      float v18 = v13[5];
      float v19 = v13[6];
      float v20 = v13[7];
      v27[2] = v49;
      v27[3] = v50;
      v27[4] = v51;
      uint64_t v28 = v52;
      v27[0] = v47;
      v27[1] = v48;
      TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)v27, v11, v14, v15);
      v25[2] = v43;
      v25[3] = v44;
      v25[4] = v45;
      uint64_t v26 = v46;
      v25[0] = v41;
      v25[1] = v42;
      TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)v25, v11, v16, v17);
      v23[2] = v37;
      v23[3] = v38;
      v23[4] = v39;
      uint64_t v24 = v40;
      v23[0] = v35;
      v23[1] = v36;
      TSDGPUUpdateDataSetMetalPoint2DAtIndex((uint64_t)v23, v11, v18, v19);
      v21[2] = v31;
      v21[3] = v32;
      v21[4] = v33;
      uint64_t v22 = v34;
      v21[0] = v29;
      v21[1] = v30;
      TSDGPUUpdateDataSetMetalFloatAtIndex((uint64_t)v21, v11++, v20);
    }
    while (v11 < *(void *)(a1 + 32));
  }
}

+ (void)p_drawColor:(id)a3 intoContext:(CGContext *)a4 usingImageAsMask:(CGImage *)a5 withRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v12 = a3;
  CGContextSaveGState(a4);
  size_t v13 = CGImageGetWidth(a5);
  CGImageGetHeight(a5);
  float v14 = TSDBitmapContextCreate(2, (double)v13);
  size_t v15 = CGImageGetWidth(a5);
  size_t v16 = CGImageGetHeight(a5);
  v36.size.CGFloat width = (double)v15;
  v36.size.CGFloat height = (double)v16;
  v36.origin.CGFloat x = 0.0;
  v36.origin.CGFloat y = 0.0;
  CGContextDrawImage(v14, v36, a5);
  Image = CGBitmapContextCreateImage(v14);
  CGContextRelease(v14);
  long long v34 = xmmword_223839400;
  size_t v18 = CGImageGetWidth(Image);
  size_t v19 = CGImageGetHeight(Image);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(Image);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(Image);
  size_t BytesPerRow = CGImageGetBytesPerRow(Image);
  DataProvider = CGImageGetDataProvider(Image);
  BOOL ShouldInterpolate = CGImageGetShouldInterpolate(Image);
  double v25 = CGImageMaskCreate(v18, v19, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, (const CGFloat *)&v34, ShouldInterpolate);
  CGImageRelease(Image);
  int IsPDFContext = TSDCGContextIsPDFContext((uint64_t)a4);
  if (IsPDFContext)
  {
    size_t v27 = CGImageGetWidth(a5);
    CGImageGetHeight(a5);
    uint64_t v28 = TSDBitmapContextCreate(3, (double)v27);
    double v29 = (double)CGImageGetWidth(a5);
    double v30 = (double)CGImageGetHeight(a5);
    CGFloat v31 = 0.0;
    CGFloat v32 = 0.0;
  }
  else
  {
    CGFloat v31 = x;
    CGFloat v32 = y;
    double v29 = width;
    double v30 = height;
    uint64_t v28 = a4;
  }
  v37.origin.CGFloat x = v31;
  v37.origin.CGFloat y = v32;
  v37.size.CGFloat width = v29;
  v37.size.CGFloat height = v30;
  CGContextClipToMask(v28, v37, v25);
  CGImageRelease(v25);
  CGContextSetFillColorWithColor(v28, (CGColorRef)objc_msgSend(v12, "CGColor", v34));
  v38.origin.CGFloat x = v31;
  v38.origin.CGFloat y = v32;
  v38.size.CGFloat width = v29;
  v38.size.CGFloat height = v30;
  CGContextFillRect(v28, v38);
  if (IsPDFContext)
  {
    long long v33 = CGBitmapContextCreateImage(v28);
    CGContextRelease(v28);
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    CGContextDrawImage(a4, v39, v33);
    CGImageRelease(v33);
  }
  CGContextRestoreGState(a4);
}

- (BOOL)p_shouldDrawAsVectorInContext:(CGContext *)a3
{
  if (a3)
  {
    int IsPDFContext = TSDCGContextIsPDFContext((uint64_t)a3);
    if (IsPDFContext) {
      LOBYTE(IsPDFContext) = ![(TSDBrushStroke *)self p_prefersRasterRenderingInContext:a3];
    }
  }
  else
  {
    long long v6 = [MEMORY[0x263F7C7F0] currentHandler];
    long long v7 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_shouldDrawAsVectorInContext:]"];
    long long v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 1638, @"invalid nil value for '%s'", "ctx");

    LOBYTE(IsPDFContext) = 0;
  }
  return IsPDFContext;
}

- (BOOL)p_prefersRasterRenderingInContext:(CGContext *)a3
{
  if (!a3)
  {
    long long v5 = [MEMORY[0x263F7C7F0] currentHandler];
    long long v6 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_prefersRasterRenderingInContext:]"];
    long long v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 1647, @"invalid nil value for '%s'", "ctx");
  }
  if (TSDCGContextPrefersRasterRendering((uint64_t)a3)) {
    return 1;
  }
  long long v9 = [(TSDSmartStroke *)self strokeName];
  if ([v9 isEqualToString:@"Pencil"])
  {
    char v8 = 1;
  }
  else
  {
    BOOL v10 = [(TSDSmartStroke *)self strokeName];
    char v8 = [v10 isEqualToString:@"Crayon"];
  }
  return v8;
}

- (BOOL)p_isDrawingRasterizedIntoPDFWithContext:(CGContext *)a3
{
  if (!a3)
  {
    long long v5 = [MEMORY[0x263F7C7F0] currentHandler];
    long long v6 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_isDrawingRasterizedIntoPDFWithContext:]"];
    long long v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 1652, @"invalid nil value for '%s'", "ctx");
  }
  int IsPDFContext = TSDCGContextIsPDFContext((uint64_t)a3);
  if (IsPDFContext) {
    LOBYTE(IsPDFContext) = ![(TSDBrushStroke *)self p_shouldDrawAsVectorInContext:a3];
  }
  return IsPDFContext;
}

- (BOOL)p_isFreehandDrawingStrokeWithFixedTileWidth
{
  long long v3 = [(TSDSmartStroke *)self strokeName];
  if ([v3 isEqualToString:@"Pencil"])
  {
    char v4 = 1;
  }
  else
  {
    long long v5 = [(TSDSmartStroke *)self strokeName];
    char v4 = [v5 isEqualToString:@"Crayon"];
  }
  return v4;
}

- (int64_t)p_fastElementPercentage:(double *)a3 forOverallPercentage:(double)a4 onPath:(id)a5 withCachedCurrentElementPercentage:(id *)a6
{
  id v10 = a5;
  [v10 length];
  double var2 = 0.0;
  if (a6->var0 == v10 && a6->var2 <= v11 * a4)
  {
    unint64_t var1 = a6->var1;
    if (var1 <= 1) {
      int64_t v13 = 1;
    }
    else {
      int64_t v13 = a6->var1;
    }
    if (var1 <= 1) {
      double var2 = 0.0;
    }
    else {
      double var2 = a6->var2;
    }
  }
  else
  {
    int64_t v13 = 1;
  }
  uint64_t v14 = [v10 elementPercentage:a3 forOverallPercentage:v13 startingElementIndex:a4 lengthToStartingElement:var2];
  if (v14 > v13)
  {
    do
    {
      [v10 lengthOfElement:v13];
      double var2 = var2 + v15;
      ++v13;
    }
    while (v14 != v13);
    objc_storeStrong(&a6->var0, a5);
    a6->unint64_t var1 = v14;
    a6->double var2 = var2;
  }

  return v14;
}

+ (id)p_metalTextureQueue
{
  if (+[TSDBrushStroke p_metalTextureQueue]::onceToken != -1) {
    dispatch_once(&+[TSDBrushStroke p_metalTextureQueue]::onceToken, &__block_literal_global_47);
  }
  long long v2 = (void *)+[TSDBrushStroke p_metalTextureQueue]::sMetalTextureQueue;

  return v2;
}

uint64_t __37__TSDBrushStroke_p_metalTextureQueue__block_invoke()
{
  +[TSDBrushStroke p_metalTextureQueue]::sMetalTextureQueue = (uint64_t)dispatch_queue_create("com.apple.iwork.TSDBrushStrokeMetalTextureQueue", 0);

  return MEMORY[0x270F9A758]();
}

+ (id)p_metalShaderQueue
{
  if (+[TSDBrushStroke p_metalShaderQueue]::onceToken != -1) {
    dispatch_once(&+[TSDBrushStroke p_metalShaderQueue]::onceToken, &__block_literal_global_181);
  }
  long long v2 = (void *)+[TSDBrushStroke p_metalShaderQueue]::sMetalShaderQueue;

  return v2;
}

uint64_t __36__TSDBrushStroke_p_metalShaderQueue__block_invoke()
{
  +[TSDBrushStroke p_metalShaderQueue]::sMetalShaderQueue = (uint64_t)dispatch_queue_create("com.apple.iwork.TSDBrushStrokeMetalShaderQueue", 0);

  return MEMORY[0x270F9A758]();
}

- (id)p_metalTextureForCurrentStrokeAndDevice:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  size_t v16 = __Block_byref_object_copy__15;
  float v17 = __Block_byref_object_dispose__15;
  id v18 = 0;
  if (-[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]::onceToken != -1) {
    dispatch_once(&-[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]::onceToken, &__block_literal_global_184);
  }
  long long v5 = +[TSDBrushStroke p_metalTextureQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__TSDBrushStroke_p_metalTextureForCurrentStrokeAndDevice___block_invoke_2;
  block[3] = &unk_2646B2060;
  double v11 = self;
  id v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

uint64_t __58__TSDBrushStroke_p_metalTextureForCurrentStrokeAndDevice___block_invoke()
{
  -[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]::sTexturesForDevicesAndStrokes = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:0 capacity:16];

  return MEMORY[0x270F9A758]();
}

void __58__TSDBrushStroke_p_metalTextureForCurrentStrokeAndDevice___block_invoke_2(uint64_t a1)
{
  v25[2] = *MEMORY[0x263EF8340];
  long long v2 = [(id)-[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]::sTexturesForDevicesAndStrokes objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (!v2)
  {
    long long v2 = [MEMORY[0x263EFF9A0] dictionary];
    objc_msgSend((id)-[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]::sTexturesForDevicesAndStrokes, "setObject:forKeyedSubscript:");
  }
  long long v3 = [*(id *)(a1 + 40) strokeName];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = +[TSDBrushStrokeLoader brushStrokeLoaderForCurrentThread];
    char v8 = [*(id *)(a1 + 40) strokeName];
    long long v9 = [v7 imageForStroke:v8];

    id v10 = (void *)[objc_alloc(MEMORY[0x263F12D88]) initWithDevice:*(void *)(a1 + 32)];
    uint64_t v11 = [v9 CGImage];
    uint64_t v12 = *MEMORY[0x263F12D70];
    uint64_t v13 = *MEMORY[0x263F12D50];
    v24[0] = *MEMORY[0x263F12D48];
    v24[1] = v13;
    v25[0] = v12;
    v25[1] = MEMORY[0x263EFFA80];
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    id v23 = 0;
    uint64_t v15 = [v10 newTextureWithCGImage:v11 options:v14 error:&v23];
    id v16 = v23;
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v15;

    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v19)
    {
      float v20 = [*(id *)(a1 + 40) strokeName];
      [v2 setObject:v19 forKeyedSubscript:v20];
    }
    else
    {
      float v20 = [MEMORY[0x263F7C7F0] currentHandler];
      double v21 = [NSString stringWithUTF8String:"-[TSDBrushStroke p_metalTextureForCurrentStrokeAndDevice:]_block_invoke_2"];
      uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
      [v20 handleFailureInFunction:v21, v22, 1735, @"Unable to load brush texture with error %@", v16 file lineNumber description];
    }
  }
}

- (id)p_metalBrushShaderForPixelFormat:(unint64_t)a3 andDevice:(id)a4
{
  id v5 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__15;
  id v18 = __Block_byref_object_dispose__15;
  id v19 = 0;
  if (-[TSDBrushStroke p_metalBrushShaderForPixelFormat:andDevice:]::onceToken != -1) {
    dispatch_once(&-[TSDBrushStroke p_metalBrushShaderForPixelFormat:andDevice:]::onceToken, &__block_literal_global_194);
  }
  id v6 = +[TSDBrushStroke p_metalShaderQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__TSDBrushStroke_p_metalBrushShaderForPixelFormat_andDevice___block_invoke_2;
  block[3] = &unk_2646B2088;
  id v11 = v5;
  uint64_t v12 = &v14;
  unint64_t v13 = a3;
  id v7 = v5;
  dispatch_sync(v6, block);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

uint64_t __61__TSDBrushStroke_p_metalBrushShaderForPixelFormat_andDevice___block_invoke()
{
  -[TSDBrushStroke p_metalBrushShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:0 capacity:16];

  return MEMORY[0x270F9A758]();
}

void __61__TSDBrushStroke_p_metalBrushShaderForPixelFormat_andDevice___block_invoke_2(void *a1)
{
  id v12 = [(id)-[TSDBrushStroke p_metalBrushShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats objectForKeyedSubscript:a1[4]];
  if (!v12)
  {
    id v12 = [MEMORY[0x263EFF9A0] dictionary];
    objc_msgSend((id)-[TSDBrushStroke p_metalBrushShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats, "setObject:forKeyedSubscript:");
  }
  long long v2 = [NSNumber numberWithUnsignedInteger:a1[6]];
  uint64_t v3 = [v12 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    id v6 = objc_alloc_init(MEMORY[0x263F129B0]);
    [v6 setPixelFormat:a1[6]];
    [v6 setBlendingEnabled:1];
    [v6 setDestinationAlphaBlendFactor:5];
    [v6 setDestinationRGBBlendFactor:5];
    id v7 = [[TSDMetalShader alloc] initDefaultShaderWithVertexShader:@"brushStrokeVertexShader" fragmentShader:@"brushStrokeFragmentShader" device:a1[4] colorAttachment:v6];
    uint64_t v8 = *(void *)(a1[5] + 8);
    long long v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 40);
    id v11 = [NSNumber numberWithUnsignedInteger:a1[6]];
    [v12 setObject:v10 forKeyedSubscript:v11];
  }
}

- (id)p_metalOpacityShaderForPixelFormat:(unint64_t)a3 andDevice:(id)a4
{
  id v5 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__15;
  id v18 = __Block_byref_object_dispose__15;
  id v19 = 0;
  if (-[TSDBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:]::onceToken != -1) {
    dispatch_once(&-[TSDBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:]::onceToken, &__block_literal_global_204);
  }
  id v6 = +[TSDBrushStroke p_metalShaderQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__TSDBrushStroke_p_metalOpacityShaderForPixelFormat_andDevice___block_invoke_2;
  block[3] = &unk_2646B2088;
  id v11 = v5;
  id v12 = &v14;
  unint64_t v13 = a3;
  id v7 = v5;
  dispatch_sync(v6, block);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

uint64_t __63__TSDBrushStroke_p_metalOpacityShaderForPixelFormat_andDevice___block_invoke()
{
  -[TSDBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:512 valueOptions:0 capacity:16];

  return MEMORY[0x270F9A758]();
}

void __63__TSDBrushStroke_p_metalOpacityShaderForPixelFormat_andDevice___block_invoke_2(void *a1)
{
  id v12 = [(id)-[TSDBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats objectForKeyedSubscript:a1[4]];
  if (!v12)
  {
    id v12 = [MEMORY[0x263EFF9A0] dictionary];
    objc_msgSend((id)-[TSDBrushStroke p_metalOpacityShaderForPixelFormat:andDevice:]::sTexturesForDevicesAndPixelFormats, "setObject:forKeyedSubscript:");
  }
  long long v2 = [NSNumber numberWithUnsignedInteger:a1[6]];
  uint64_t v3 = [v12 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(a1[5] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    id v6 = objc_alloc_init(MEMORY[0x263F129B0]);
    [v6 setPixelFormat:a1[6]];
    [v6 setBlendingEnabled:1];
    [v6 setDestinationAlphaBlendFactor:5];
    [v6 setDestinationRGBBlendFactor:5];
    id v7 = [[TSDMetalShader alloc] initDefaultTextureAndOpacityShaderWithDevice:a1[4] colorAttachment:v6];
    uint64_t v8 = *(void *)(a1[5] + 8);
    long long v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 40);
    id v11 = [NSNumber numberWithUnsignedInteger:a1[6]];
    [v12 setObject:v10 forKeyedSubscript:v11];
  }
}

@end