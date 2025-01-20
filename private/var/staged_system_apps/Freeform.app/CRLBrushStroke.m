@interface CRLBrushStroke
+ (BOOL)brushStrokeUsesMetal;
+ (BOOL)isMoreOptimalToDrawWithOtherStrokesIfPossible;
+ (BOOL)p_isDirectContextWideColorCapable:(id)a3;
+ (CGColor)p_colorForDrawingIntoDirectContext:(id)a3 fromOriginalColor:(id)a4;
+ (Class)mutableClass;
+ (id)p_metalShaderQueue;
+ (id)p_metalTextureQueue;
+ (void)backgroundLoadAllBrushStrokes;
+ (void)p_drawColor:(id)a3 intoContext:(CGContext *)a4 usingImageAsMask:(CGImage *)a5 withRect:(CGRect)a6;
- (BOOL)canApplyToShapeRenderable;
- (BOOL)drawsInOneStep;
- (BOOL)p_isDrawingRasterizedIntoPDFWithContext:(CGContext *)a3;
- (BOOL)p_isFreehandDrawingStrokeWithFixedTileWidth;
- (BOOL)p_prefersRasterRenderingInContext:(CGContext *)a3;
- (BOOL)p_shouldDrawAsVectorInContext:(CGContext *)a3;
- (BOOL)p_shouldSplitAtSharpAngles;
- (BOOL)prefersToApplyToShapeRenderableDuringManipulation;
- (BOOL)supportsPattern;
- (CRLBrushStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(unint64_t)a6 join:(unint64_t)a7 pattern:(id)a8 miterLimit:(double)a9;
- (double)horizontalMarginForSwatch;
- (double)lineEndInsetAdjustment;
- (double)suggestedMinimumLineWidth;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)p_brushPath:(id)a3 inContext:(CGContext *)a4 orDirectly:(id)a5 parameterized:(BOOL)a6 drawRasterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8 withLayoutOptions:(id)a9;
- (id)p_metalBrushShaderForPixelFormat:(unint64_t)a3 andDevice:(id)a4;
- (id)p_metalOpacityShaderForPixelFormat:(unint64_t)a3 andDevice:(id)a4;
- (id)p_metalTextureForCurrentStrokeAndDevice:(id)a3;
- (id)strokeLineEnd:(id)a3;
- (id)strokedCopyOfPath:(id)a3;
- (int64_t)p_fastElementPercentage:(double *)a3 forOverallPercentage:(double)a4 onPath:(id)a5 withCachedCurrentElementPercentage:(id *)a6;
- (unint64_t)cap;
- (void)i_setCap:(unint64_t)a3;
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

@implementation CRLBrushStroke

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isMoreOptimalToDrawWithOtherStrokesIfPossible
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CRLMutableBrushStroke alloc];
  v5 = [(CRLSmartStroke *)self strokeName];
  v6 = [(CRLStroke *)self color];
  [(CRLStroke *)self width];
  double v8 = v7;
  unint64_t v9 = [(CRLBrushStroke *)self cap];
  unint64_t v10 = [(CRLStroke *)self join];
  v11 = [(CRLStroke *)self pattern];
  [(CRLStroke *)self miterLimit];
  v13 = [(CRLBrushStroke *)v4 initWithName:v5 color:v6 width:v9 cap:v10 join:v11 pattern:v8 miterLimit:v12];

  return v13;
}

- (CRLBrushStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(unint64_t)a6 join:(unint64_t)a7 pattern:(id)a8 miterLimit:(double)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)CRLBrushStroke;
  v19 = [(CRLSmartStroke *)&v22 initWithName:v16 color:v17 width:a6 cap:a7 join:v18 pattern:a5 miterLimit:a9];
  v20 = v19;
  if (v19) {
    [(CRLBrushStroke *)v19 i_setCap:1];
  }

  return v20;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(CRLSmartStroke *)self strokeName];
  [(CRLStroke *)self width];
  double v7 = +[NSString stringWithFormat:@"<%@ %p strokeName='%@' width=%f>", v4, self, v5, v6];

  return v7;
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
  v2 = +[CRLCapabilities currentCapabilities];
  unsigned __int8 v3 = [v2 isMetalCapable];

  return v3;
}

- (BOOL)supportsPattern
{
  return 0;
}

- (unint64_t)cap
{
  unint64_t v2 = [(CRLStroke *)self i_cap];
  if (v2 != 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB700);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B5750();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB720);
    }
    unsigned __int8 v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke cap]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:267 isFatal:0 description:"CRLBrushStroke should only ever have a round cap."];
  }
  return v2;
}

- (void)i_setCap:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CRLBrushStroke;
  [(CRLStroke *)&v3 i_setCap:1];
}

- (double)horizontalMarginForSwatch
{
  v8.receiver = self;
  v8.super_class = (Class)CRLBrushStroke;
  [(CRLStroke *)&v8 horizontalMarginForSwatch];
  double v4 = v3;
  v5 = [(CRLSmartStroke *)self strokeName];
  unsigned int v6 = [v5 isEqualToString:@"Pen"];

  double result = 7.0;
  if (!v6) {
    return v4;
  }
  return result;
}

- (BOOL)p_shouldSplitAtSharpAngles
{
  unint64_t v2 = [(CRLSmartStroke *)self strokeName];
  double v3 = +[CRLBrushStrokeLoader storageForBrushStrokeNamed:v2];

  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB740);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B586C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB760);
    }
    double v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_shouldSplitAtSharpAngles]");
    unsigned int v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 290, 0, "invalid nil value for '%{public}s'", "storage");
  }
  double v7 = [v3 options];
  objc_super v8 = [v7 objectForKeyedSubscript:@"split-at-sharp-angles"];

  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB780);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B57D8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB7A0);
    }
    unint64_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    unint64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_shouldSplitAtSharpAngles]");
    v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 292, 0, "invalid nil value for '%{public}s'", "splitAtSharpAnglesOption");
  }
  unsigned __int8 v12 = [v8 BOOLValue];

  return v12;
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
    unsigned int v6 = [v4 identifier];
    double v7 = (char *)[v6 rangeOfString:@":"];
    if (v7 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = [v6 substringFromIndex:&v7[v8]];

      unsigned int v6 = (void *)v9;
    }
    unint64_t v10 = [(CRLSmartStroke *)self strokeName];
    v11 = +[CRLBrushStrokeLoader storageForBrushStrokeNamed:v10];

    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FB7C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B5994();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FB7E0);
      }
      unsigned __int8 v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke strokeLineEnd:]");
      v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 312, 0, "invalid nil value for '%{public}s'", "storage");
    }
    v15 = [v11 lineEnds];
    id v16 = [v15 objectForKeyedSubscript:v6];

    id v17 = v16;
    if (!v16)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FB800);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B5900();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FB820);
      }
      id v18 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v19 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke strokeLineEnd:]");
      v20 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 314, 0, "invalid nil value for '%{public}s'", "strokedLineEnd");

      id v17 = v4;
    }
    id v5 = v17;
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
    id v18 = (char *)[v17 rangeOfString:@":"];
    if (v18 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v20 = [v17 substringFromIndex:&v18[v19]];

      uint64_t v21 = +[CRLLineEnd lineEndWithIdentifier:v20];

      id v17 = (void *)v20;
      id v16 = (void *)v21;
    }
    v24.receiver = self;
    v24.super_class = (Class)CRLBrushStroke;
    -[CRLStroke paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:](&v24, "paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:", v16, a7, 1, x, y, a5, a6);
  }
  else
  {
    uint64_t v22 = [(CRLBrushStroke *)self strokeLineEnd:v15];

    v23.receiver = self;
    v23.super_class = (Class)CRLBrushStroke;
    id v16 = (void *)v22;
    -[CRLStroke paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:](&v23, "paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:", v22, a7, 0, x, y, a5, a6);
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
  id v15 = objc_alloc_init(CRLBrushStrokeLayoutOptions);
  [(CRLBrushStroke *)self paintPath:a3 wantsInteriorStroke:v12 inContext:a5 useFastDrawing:v10 parameterized:v9 shouldReverseDrawOrder:v8 withLayoutOptions:v15];
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
    v19.receiver = self;
    v19.super_class = (Class)CRLBrushStroke;
    [(CRLStroke *)&v19 paintPath:a3 wantsInteriorStroke:v13 inContext:a5 useFastDrawing:1 parameterized:v10 shouldReverseDrawOrder:v9];
  }
  else if ([(CRLStroke *)self shouldRender])
  {
    if ([(CRLBrushStroke *)self p_shouldDrawAsVectorInContext:a5])
    {
      id v17 = +[CRLBezierPath bezierPathWithCGPath:a3];
      id v18 = [(CRLBrushStroke *)self p_brushPath:v17 inContext:a5 orDirectly:0 parameterized:v10 drawRasterized:0 shouldReverseDrawOrder:0 withLayoutOptions:v16];
    }
    else
    {
      [(CRLBrushStroke *)self p_rasterBrushPath:a3 inContext:a5 orDirectly:0 parameterized:v10 shouldReverseDrawOrder:v9 withLayoutOptions:v16];
    }
  }
}

- (id)strokedCopyOfPath:(id)a3
{
  id v4 = a3;
  if (![(CRLStroke *)self shouldRender]) {
    goto LABEL_6;
  }
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB840);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B5A28();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB860);
    }
    BOOL v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke strokedCopyOfPath:]");
    id v5 = (CRLBrushStrokeLayoutOptions *)objc_claimAutoreleasedReturnValue();
    unsigned int v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 368, 0, "invalid nil value for '%{public}s'", "inputPath");
    goto LABEL_16;
  }
  if (![v4 containsElementsOtherThanMoveAndClose])
  {
LABEL_6:
    double v7 = 0;
    goto LABEL_18;
  }
  id v5 = objc_alloc_init(CRLBrushStrokeLayoutOptions);
  unsigned int v6 = [(CRLBrushStroke *)self p_brushPath:v4 inContext:0 orDirectly:0 parameterized:0 drawRasterized:0 shouldReverseDrawOrder:0 withLayoutOptions:v5];
  if (!v6)
  {
LABEL_16:
    double v7 = 0;
    goto LABEL_17;
  }
  double v7 = +[CRLBezierPathBooleanOperationHelper pathByNormalizingPath:v6];
LABEL_17:

LABEL_18:

  return v7;
}

+ (void)backgroundLoadAllBrushStrokes
{
}

- (id)p_brushPath:(id)a3 inContext:(CGContext *)a4 orDirectly:(id)a5 parameterized:(BOOL)a6 drawRasterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8 withLayoutOptions:(id)a9
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v12 = a3;
  id v90 = a5;
  id v94 = a9;
  BOOL v83 = v10;
  if (v10 && !v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB880);
    }
    BOOL v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      sub_1010B5CF4();
    }

    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FB8A0);
    }
    v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = +[CRLAssertionHandler packedBacktraceString];
      sub_10107C04C(v15);
    }

    id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]");
    id v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:395 isFatal:0 description:"Parameterized strokes must draw rasterized."];
  }
  if (v94) {
    BOOL v18 = !v9;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18 && ([v94 strokeEnd], v19 <= 0.0) || (objc_msgSend(v12, "length"), v20 == 0.0))
  {
    id v21 = 0;
    goto LABEL_110;
  }
  if (v83)
  {
    uint64_t v22 = [v12 bezierPathByFlatteningPathWithFlatness:0.1];

    if ([v22 isEffectivelyClosed]
      && ([v22 isClockwise] & 1) == 0)
    {
      uint64_t v23 = [v22 bezierPathByReversingPath];

      id v12 = (id)v23;
    }
    else
    {
      id v12 = v22;
    }
  }
  if (v90)
  {
    [v90 transform];
    double v24 = sub_10007F808(v99);
    [v90 contentsScale];
LABEL_26:
    double v26 = v24 / v25;
    goto LABEL_27;
  }
  if (a4)
  {
    if (!-[CRLBrushStroke p_isDrawingRasterizedIntoPDFWithContext:](self, "p_isDrawingRasterizedIntoPDFWithContext:"))
    {
      CGContextGetCTM(&v98, a4);
      double v24 = sub_10007F808(&v98.a);
      double v25 = sub_100458664((uint64_t)a4);
      goto LABEL_26;
    }
    double v26 = 3.0;
  }
  else
  {
    double v26 = 1.0;
  }
LABEL_27:
  double v87 = v26;
  if (v9) {
    operator new();
  }
  v27 = +[CRLBezierPath bezierPath];
  [v27 setWindingRule:0];
  id v28 = [v12 copy];
  id v89 = v27;

  [(CRLStroke *)self width];
  [v28 setLineWidth:];
  [(CRLStroke *)self miterLimit];
  [v28 setMiterLimit:];
  id v12 = v28;
  uint64_t v97 = 0;
  [v28 length];
  double v30 = v29;
  unsigned int v93 = [(CRLBrushStroke *)self p_shouldSplitAtSharpAngles];
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  CGPoint v96 = CGPointZero;
  uint64_t v33 = (uint64_t)[v28 elementCount];
  v95[0] = 0;
  v95[1] = (id)1;
  v95[2] = 0;
  if (v33 >= 1)
  {
    uint64_t v91 = 0;
    unint64_t v34 = 0;
    unint64_t v35 = 0;
    double v36 = 0.0;
    double v37 = 0.0;
    while (1)
    {
      double v38 = v37;
      id v39 = [v12 elementAtIndex:v35 associatedPoints:&v109];
      [v12 lengthOfElement:v35];
      double v41 = v40 / v30;
      double v37 = v37 + v41;
      if (v39 == (id)3)
      {
        CGPoint v109 = v96;
      }
      else
      {
        if (v39 == (id)2)
        {
          if (v93)
          {
            double v84 = x;
            double v85 = v36;
            double v42 = y;
            double v86 = v38 + v41;
            double v43 = v108.x;
            double v44 = sub_100064680(v109.x, v109.y, v108.x);
            double v46 = v45;
            double v47 = sub_100065398(v44, v45);
            if (v47 >= 1.0)
            {
              double v50 = sub_1000646A4(v44, v46, 1.0 / v47);
            }
            else
            {
              double v48 = sub_100064680(v110, v111, v43);
              double v50 = sub_100064660(v48, v49);
            }
            if (v35 < 2)
            {
              double v38 = v85;
              double v37 = v86;
            }
            else if (sub_10006468C(v84, v42, v50, v51) < 0.99)
            {
              double v37 = v86;
              if ((uint64_t)(v35 - 1 - v34) < 1 || v38 - v85 <= 0.0)
              {
                double v38 = v85;
              }
              else
              {
                -[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:](self, "p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:", v12, v34, v35 - v34, v27, 0, &v97, v85, v38 - v85, v87, v94, v91, v95);
                unint64_t v34 = v35 - 1;
              }
            }
            else
            {
              double v38 = v85;
              double v37 = v86;
            }
            double v64 = sub_100064680(v112.x, v112.y, v110);
            double x = sub_100064660(v64, v65);
            double y = v66;
            double v36 = v38;
          }
          CGPoint v108 = v112;
          goto LABEL_74;
        }
        if (!v39)
        {
          if ((uint64_t)(v35 - v34) >= 1)
          {
            if ([(CRLBrushStroke *)self p_isFreehandDrawingStrokeWithFixedTileWidth])
            {
              uint64_t v97 = 0;
            }
            else
            {
              v57 = [v94 patternOffsetsBySubpath];
              BOOL v58 = v57 == 0;

              if (!v58)
              {
                unsigned int v59 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014FB8C0);
                }
                v60 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109890;
                  unsigned int v101 = v59;
                  __int16 v102 = 2082;
                  v103 = "-[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDra"
                         "wOrder:withLayoutOptions:]";
                  __int16 v104 = 2082;
                  v105 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm";
                  __int16 v106 = 1024;
                  int v107 = 478;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v60, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d If there is a patternOffsetsBySubpath array, this should be a freehand drawing stroke.", buf, 0x22u);
                }

                if (qword_101719A70 != -1) {
                  dispatch_once(&qword_101719A70, &stru_1014FB8E0);
                }
                v61 = off_10166B4A0;
                if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
                {
                  v67 = +[CRLAssertionHandler packedBacktraceString];
                  *(_DWORD *)buf = 67109378;
                  unsigned int v101 = v59;
                  __int16 v102 = 2114;
                  v103 = v67;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v61, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
                }
                v62 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]");
                v63 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v62, v63, 478, 0, "If there is a patternOffsetsBySubpath array, this should be a freehand drawing stroke.");
              }
            }
            [(CRLBrushStroke *)self p_brushPath:v12 withScaling:v34 inElementRange:v35 - v34 intoPath:v27 orIntoVector:v36 sectionIndex:v37 - v36 viewScale:v87 withLayoutOptions:v94 currentSubpathIndex:v91++ cachedCurrentElementPercentage:v95];
            double v36 = v37;
            unint64_t v34 = v35;
          }
          CGPoint v108 = v109;
          CGPoint v96 = v109;
          goto LABEL_74;
        }
      }
      if (!v93) {
        break;
      }
      double v52 = sub_100064680(v109.x, v109.y, v108.x);
      double v55 = sub_100064660(v52, v53);
      double v56 = v54;
      if (v35 < 2 || sub_10006468C(x, y, v55, v54) >= 0.99 || (uint64_t)(v35 - 1 - v34) < 1 || v38 - v36 <= 0.0) {
        goto LABEL_48;
      }
      -[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:](self, "p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:", v12, v34, v35 - v34, v27, 0, &v97, v36, v38 - v36, v87, v94, v91, v95);
      unint64_t v34 = v35 - 1;
LABEL_49:
      CGPoint v108 = v109;
      double x = v55;
      double y = v56;
      double v36 = v38;
LABEL_74:
      if (++v35 == v33) {
        goto LABEL_80;
      }
    }
    double v55 = x;
    double v56 = y;
LABEL_48:
    double v38 = v36;
    goto LABEL_49;
  }
  uint64_t v33 = 0;
  unint64_t v34 = 0;
  uint64_t v91 = 0;
  double v37 = 0.0;
  double v36 = 0.0;
LABEL_80:
  uint64_t v68 = v33 + ~v34;
  if (v68 >= 1)
  {
    if ([(CRLBrushStroke *)self p_isFreehandDrawingStrokeWithFixedTileWidth])
    {
      uint64_t v97 = 0;
    }
    else
    {
      v69 = [v94 patternOffsetsBySubpath];
      BOOL v70 = v69 == 0;

      if (!v70)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FB900);
        }
        v71 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_ERROR)) {
          sub_1010B5C6C();
        }

        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FB920);
        }
        v72 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_ERROR))
        {
          v73 = +[CRLAssertionHandler packedBacktraceString];
          sub_10107C04C(v73);
        }

        v74 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]");
        v75 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v74, v75, 552, 0, "If there is a patternOffsetsBySubpath array, this should be a freehand drawing stroke.");
      }
    }
    [(CRLBrushStroke *)self p_brushPath:v12 withScaling:v34 inElementRange:v68 intoPath:v27 orIntoVector:v36 sectionIndex:v37 - v36 viewScale:v87 withLayoutOptions:v94 currentSubpathIndex:v91 cachedCurrentElementPercentage:v95];
  }
  if (a4)
  {
    v76 = v27;
    if (!v27)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FB9C0);
      }
      v77 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v77, OS_LOG_TYPE_ERROR)) {
        sub_1010B5BD8();
      }

      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FB9E0);
      }
      v78 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v79 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:inContext:orDirectly:parameterized:drawRasterized:shouldReverseDrawOrder:withLayoutOptions:]");
      v80 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v79, v80, 577, 0, "invalid nil value for '%{public}s'", "resultPath");

      v76 = 0;
    }
    CGContextAddPath(a4, (CGPathRef)[v76 CGPath]);
    v81 = [(CRLStroke *)self color];
    CGContextSetFillColorWithColor(a4, (CGColorRef)[v81 CGColor]);

    CGContextFillPath(a4);
  }
  id v21 = v89;

LABEL_110:

  return v21;
}

- (void)p_brushPath:(id)a3 withScaling:(id)a4 inElementRange:(_NSRange)a5 intoPath:(id)a6 orIntoVector:(void *)a7 sectionIndex:(unint64_t *)a8 viewScale:(double)a9 withLayoutOptions:(id)a10 currentSubpathIndex:(unint64_t)a11 cachedCurrentElementPercentage:(id *)a12
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v20 = a3;
  id v109 = a6;
  id v21 = a10;
  if ((uint64_t)[v20 elementCount] >= 2)
  {
    uint64_t v22 = [v21 patternOffsetsBySubpath];
    double v101 = var0;
    if (v22)
    {
      unsigned __int8 v23 = [(CRLBrushStroke *)self p_isFreehandDrawingStrokeWithFixedTileWidth];

      if ((v23 & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FBA00);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B5E10();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FBA20);
        }
        double v24 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        double v25 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:]");
        double v26 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v25 file:v26 lineNumber:592 isFatal:0 description:"We only know how to adjust the pattern of constant width layout brush strokes."];
      }
    }
    [(CRLStroke *)self width];
    double v28 = v27;
    double v29 = [(CRLSmartStroke *)self strokeName];
    double v102 = v28;
    __int16 v104 = +[CRLBrushStrokeLoader storageForBrushStrokeNamed:v29];

    double v30 = v104;
    if (!v104)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FBA40);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B5D7C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FBA60);
      }
      v31 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      v32 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:]");
      uint64_t v33 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 597, 0, "invalid nil value for '%{public}s'", "storage");

      double v30 = 0;
    }
    int v107 = [v30 paths];
    v105 = [v30 bounds];
    __int16 v106 = [v107 objectForKey:@"middle"];
    unint64_t v34 = [v107 objectForKey:@"start"];
    if (v34)
    {
      unint64_t v35 = [v107 objectForKey:@"end"];
      BOOL v36 = v35 != 0;
    }
    else
    {
      BOOL v36 = 0;
    }

    double v37 = 5.0;
    double v38 = v28;
    if (v28 >= 5.0)
    {
      CFStringRef v42 = @"middle";
    }
    else
    {
      id v39 = [v107 objectForKey:@"small" 5.0 v28];
      double v40 = v39;
      if (v39)
      {
        id v41 = v39;

        BOOL v36 = 0;
        CFStringRef v42 = @"small";
        __int16 v106 = v41;
      }
      else
      {
        CFStringRef v42 = @"middle";
      }
    }
    [v20 length:v37, v38];
    double v44 = v43;
    double v45 = v101 + var1;
    if (v36)
    {
      double v46 = [v105 objectForKeyedSubscript:@"start"];
      double v47 = [v46 lastObject];
      [v47 CGRectValue];
      double v49 = v48;
      double v51 = v50;

      double v52 = [v105 objectForKeyedSubscript:@"end"];
      double v53 = [v52 lastObject];
      [v53 CGRectValue];
      double v55 = v54;
      double v57 = v56;

      double v58 = v49 / v51;
      double v59 = var1 * v44 * 0.5;
      double v60 = v101 + fmin(v102 * v58, v59) / v44;
      [(CRLBrushStroke *)self p_brushSection:@"start" sectionIndex:0 ontoPath:v20 inElementRange:location intoPath:length orIntoVector:v109 viewScale:a9 strokeTileLayout:a7 cachedCurrentElementPercentage:a12];
      double v61 = v45 - fmin(v102 * (v55 / v57), v59) / v44;
      [(CRLBrushStroke *)self p_brushSection:@"end", 0, v20, location, length, v109, a9, v61, v45, 0.0, 1.0, a7, a12 sectionIndex ontoPath inElementRange intoPath orIntoVector viewScale strokeTileLayout cachedCurrentElementPercentage];
      double v45 = v61;
    }
    else
    {
      double v60 = v101;
    }
    unint64_t v62 = (unint64_t)[v106 count];
    if (!v62 || v45 <= v60) {
      goto LABEL_79;
    }
    v63 = [v105 objectForKeyedSubscript:v42];
    double v64 = [v63 lastObject];
    [v64 CGRectValue];
    double v66 = v65;
    double v68 = v67;

    double v69 = v66 / v68;
    double v70 = v45 - v60;
    double v71 = v44 * (v45 - v60);
    double v72 = v102 * v69;
    unint64_t v73 = (unint64_t)(v71 / (v102 * v69) + 1.0);
    if (v62 <= 1) {
      unint64_t v73 = 1;
    }
    unint64_t v103 = v73;
    v74 = [v21 patternOffsetsBySubpath];
    BOOL v75 = v74 == 0;

    if (v75)
    {
      double v81 = 0.0;
LABEL_56:
      if ([(CRLBrushStroke *)self p_isFreehandDrawingStrokeWithFixedTileWidth])
      {
        double v86 = v70 * (v72 / v71);
        if (v81 > 0.0 && v81 > v86)
        {
          unint64_t v87 = *a8;
          do
          {
            double v81 = v81 - v86;
            unint64_t v88 = (1664525 * v87 + 1013904223);
            if (v88 % v62 == v87 % v62) {
              unint64_t v87 = v88 + 1;
            }
            else {
              unint64_t v87 = (1664525 * v87 + 1013904223);
            }
          }
          while (v81 > 0.0 && v81 > v86);
          *a8 = v87;
        }
      }
      else
      {
        double v86 = v70 / (double)v103;
      }
      if (vabdd_f64(v60, v45) > 0.00000999999975)
      {
        do
        {
          unsigned int v89 = [(CRLBrushStroke *)self p_isFreehandDrawingStrokeWithFixedTileWidth];
          double v90 = fmin(v45, v86 + v60);
          double v91 = 1.0;
          double v92 = 0.0;
          if (v89)
          {
            if (v81 > 0.0)
            {
              double v93 = v81 / v86;
              double v81 = 0.0;
              double v92 = v93 + 0.0;
            }
            double v94 = v90 - v60;
            double v95 = v86 * (1.0 - v92);
            if (v90 - v60 <= v95)
            {
              if (v90 - v60 < v95) {
                double v91 = 1.0 - (v95 - v94) / v86;
              }
            }
            else
            {
              double v90 = v90 - (v94 - v95);
            }
          }
          -[CRLBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:](self, "p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:", v42, *a8 % v62, v20, location, length, v109, a9, v60, v90, v92, v91, a7, a12);
          unint64_t v96 = 1664525 * *a8 + 1013904223;
          if (v96 % v62 == *a8 % v62) {
            unint64_t v97 = v96 + 1;
          }
          else {
            unint64_t v97 = 1664525 * *a8 + 1013904223;
          }
          *a8 = v97;
          double v60 = v90;
        }
        while (vabdd_f64(v90, v45) > 0.00000999999975);
      }
LABEL_79:

      goto LABEL_80;
    }
    v76 = [v21 patternOffsetsBySubpath];
    BOOL v77 = (unint64_t)[v76 count] > a11;

    if (v77)
    {
      v78 = [v21 patternOffsetsBySubpath];
      v79 = [v78 objectAtIndexedSubscript:a11];
      [v79 crl_CGFloatValue];
    }
    else
    {
      v82 = [v21 patternOffsetsBySubpath];
      BOOL v83 = [v82 count] == (id)1;

      if (!v83)
      {
        unsigned int v100 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FBA80);
        }
        double v84 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v84, OS_LOG_TYPE_ERROR))
        {
          v99 = [v21 patternOffsetsBySubpath];
          *(_DWORD *)buf = 67110402;
          unsigned int v111 = v100;
          __int16 v112 = 2082;
          v113 = "-[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:wi"
                 "thLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:]";
          __int16 v114 = 2082;
          v115 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm";
          __int16 v116 = 1024;
          int v117 = 702;
          __int16 v118 = 2048;
          id v119 = [v99 count];
          __int16 v120 = 2048;
          unint64_t v121 = a11;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v84, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Not enough pattern offsets for each subpath. Got %zi for index %zi", buf, 0x36u);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FBAA0);
        }
        double v85 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v85, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        v78 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushPath:withScaling:inElementRange:intoPath:orIntoVector:sectionIndex:viewScale:withLayoutOptions:currentSubpathIndex:cachedCurrentElementPercentage:]");
        v79 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
        CGAffineTransform v98 = [v21 patternOffsetsBySubpath];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v78, v79, 702, 0, "Not enough pattern offsets for each subpath. Got %zi for index %zi", [v98 count], a11);

        double v81 = 0.0;
        goto LABEL_55;
      }
      v78 = [v21 patternOffsetsBySubpath];
      v79 = [v78 objectAtIndexedSubscript:0];
      [v79 crl_CGFloatValue];
    }
    double v81 = v80 / v44;
LABEL_55:

    goto LABEL_56;
  }
LABEL_80:
}

- (void)p_brushSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 inElementRange:(_NSRange)a6 intoPath:(id)a7 orIntoVector:(void *)a8 viewScale:(double)a9 strokeTileLayout:(id)a10 cachedCurrentElementPercentage:(id *)a11
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  double var3 = a10.var3;
  double var2 = a10.var2;
  double var1 = a10.var1;
  double var0 = a10.var0;
  id v39 = a3;
  id v40 = a5;
  id v22 = a7;
  double v38 = v22;
  if (a8)
  {
    if (v22)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FBAC0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B5FB4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FBAE0);
      }
      unsigned __int8 v23 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      double v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]");
      double v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 759, 0, "expected nil value for '%{public}s'", "resultPath");
    }
    -[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:](self, "p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:", v39, a4, v40, location, length, a8, a9, var0, var1, var2, var3, a11);
  }
  else
  {
    if (v22)
    {
      double v26 = [(CRLSmartStroke *)self strokeName];
      double v27 = +[CRLBrushStrokeLoader storageForBrushStrokeNamed:v26];

      if (!v27)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FBB00);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B5F20();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FBB20);
        }
        double v28 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_1010663B0();
        }

        double v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]");
        double v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 763, 0, "invalid nil value for '%{public}s'", "storage");
      }
      v31 = [v27 paths];
      v32 = [v31 objectForKeyedSubscript:v39];
      uint64_t v33 = [v32 objectAtIndexedSubscript:a4];

      [(CRLStroke *)self width];
      if (v34 < 15.0)
      {
        BOOL v36 = [v33 pathWithPossibleSmoothing];
        unint64_t v35 = v38;
      }
      else
      {
        unint64_t v35 = v38;
        BOOL v36 = [v33 originalPath];
      }
      [v36 recursiveSubdivideOntoPath:v40 withScaling:location length:length inElementRange:v35 into:var0, var1 - var0];
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FBB40);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B5E98();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FBB60);
      }
      double v37 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_1010663B0();
      }

      double v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_brushSection:sectionIndex:ontoPath:inElementRange:intoPath:orIntoVector:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]");
      v31 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v27 file:v31 lineNumber:769 isFatal:0 description:"resultPath and resultVector are both nil!"];
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
    CGContextGetCTM(&v21, a4);
  }
  double v16 = sqrt(v21.b * v21.b + v21.a * v21.a);
  if (a4
    && [(CRLBrushStroke *)self p_isDrawingRasterizedIntoPDFWithContext:a4])
  {
    double v16 = 3.0;
  }
  if (v14 || v10 || ([(CRLStroke *)self width], v17 > 0.5 / v16))
  {
    BOOL v18 = +[CRLBezierPath bezierPathWithCGPath:a3];
    id v19 = [(CRLBrushStroke *)self p_brushPath:v18 inContext:a4 orDirectly:v14 parameterized:v10 drawRasterized:1 shouldReverseDrawOrder:v9 withLayoutOptions:v15];
  }
  else if (a4)
  {
    v20.receiver = self;
    v20.super_class = (Class)CRLBrushStroke;
    [(CRLStroke *)&v20 paintPath:a3 wantsInteriorStroke:0 inContext:a4 useFastDrawing:0 parameterized:0 shouldReverseDrawOrder:0];
  }
}

- (void)p_rasterRenderSection:(id)a3 sectionIndex:(unint64_t)a4 ontoPath:(id)a5 inElementRange:(_NSRange)a6 into:(void *)a7 viewScale:(double)a8 strokeTileLayout:(id)a9 cachedCurrentElementPercentage:(id *)a10
{
  NSUInteger length = a6.length;
  int64_t location = a6.location;
  double var3 = a9.var3;
  double var2 = a9.var2;
  double var1 = a9.var1;
  double var0 = a9.var0;
  id v337 = a3;
  id v370 = a5;
  int64_t v16 = location + length;
  while (location < (uint64_t)[v370 elementCount])
  {
    [v370 lengthOfElement:location];
    if (v17 != 0.0) {
      break;
    }
    ++location;
  }
  while (v16 > location)
  {
    [v370 lengthOfElement:v16];
    if (v18 != 0.0) {
      break;
    }
    --v16;
  }
  if (v16 < location) {
    goto LABEL_293;
  }
  double v377 = 0.0;
  double v376 = 0.0;
  int64_t v353 = [(CRLBrushStroke *)self p_fastElementPercentage:&v377 forOverallPercentage:v370 onPath:a10 withCachedCurrentElementPercentage:var0];
  int64_t v19 = [(CRLBrushStroke *)self p_fastElementPercentage:&v376 forOverallPercentage:v370 onPath:a10 withCachedCurrentElementPercentage:var1];
  if (v353 < location)
  {
    double v377 = 0.0;
    int64_t v353 = location;
  }
  if (v19 > v16)
  {
    double v376 = 1.0;
    int64_t v19 = v16;
  }
  if (v19 > v353)
  {
    if (v377 == 1.0 || fabs(v377 + -1.0) < 0.000000999999997)
    {
      double v377 = 0.0;
      ++v353;
    }
    double v20 = v376;
    if (v376 == 0.0)
    {
      double v376 = 1.0;
      --v19;
    }
  }
  int64_t v341 = v19;
  CGAffineTransform v21 = +[CRLBezierPath bezierPath];
  [v21 appendBezierPath:v370 fromSegment:v353 t:v341 toSegment:0 t:v377 withoutMove:v376];
  CGAffineTransformMakeScale(&v375, a8, a8);
  [v21 transformUsingAffineTransform:&v375];
  v359 = [v21 bezierPathByFlatteningPathWithFlatness:0.1];

  CGAffineTransformMakeScale(&v374, 1.0 / a8, 1.0 / a8);
  [v359 transformUsingAffineTransform:&v374];
  [(CRLStroke *)self width];
  double v22 = 0.5 / a8;
  if (v23 > 0.5 / a8)
  {
    [(CRLStroke *)self width];
    double v22 = v24;
  }
  double v338 = 1.0 / a8;
  double v339 = v22;
  __p = 0;
  v372 = 0;
  v373 = 0;
  CGFloat y = CGPointZero.y;
  CGFloat x = CGPointZero.x;
  double v26 = (char *)[v359 elementCount];
  double v27 = v26;
  double v357 = var3;
  double v360 = a8;
  if (v26)
  {
    double v28 = 0;
    *(void *)&double v354 = v26 - 1;
    double v29 = 1.0;
    do
    {
      v379[0] = xmmword_101175160;
      v379[1] = xmmword_101175160;
      v379[2] = xmmword_101175160;
      id v30 = [v359 elementAtIndex:v28 associatedPoints:v379];
      unint64_t v31 = (unint64_t)v30;
      double v32 = *((double *)v379 + 1);
      double v33 = *(double *)v379;
      if (!v30)
      {
LABEL_43:
        CFStringRef v42 = v372;
        if (v372 >= v373)
        {
          double v84 = __p;
          uint64_t v85 = (v372 - (char *)__p) >> 4;
          unint64_t v86 = v85 + 1;
          if ((unint64_t)(v85 + 1) >> 60) {
            sub_100004E40();
          }
          uint64_t v87 = v373 - (char *)__p;
          if ((v373 - (char *)__p) >> 3 > v86) {
            unint64_t v86 = v87 >> 3;
          }
          if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v88 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v88 = v86;
          }
          if (v88)
          {
            unsigned int v89 = (char *)sub_10001EAB0((uint64_t)&v373, v88);
            double v84 = __p;
            CFStringRef v42 = v372;
          }
          else
          {
            unsigned int v89 = 0;
          }
          double v90 = (double *)&v89[16 * v85];
          *double v90 = v33;
          v90[1] = v32;
          double v91 = v90;
          if (v42 != (char *)v84)
          {
            do
            {
              *((_OWORD *)v91 - 1) = *((_OWORD *)v42 - 1);
              v91 -= 2;
              v42 -= 16;
            }
            while (v42 != (char *)v84);
            double v84 = __p;
          }
          double v43 = (char *)(v90 + 2);
          __p = v91;
          v373 = &v89[16 * v88];
          if (v84) {
            operator delete(v84);
          }
        }
        else
        {
          *(double *)v372 = v33;
          *((double *)v372 + 1) = v32;
          double v43 = v372 + 16;
        }
        v372 = v43;
        goto LABEL_96;
      }
      if (v30 != (id)1)
      {
        if (v30 == (id)3) {
          goto LABEL_36;
        }
        unsigned int v34 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FBB80);
        }
        unint64_t v35 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&uint8_t buf[4] = v34;
          *(_WORD *)&buf[8] = 2082;
          *(void *)&buf[10] = "-[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewSca"
                                "le:strokeTileLayout:cachedCurrentElementPercentage:]";
          *(_WORD *)&buf[18] = 2082;
          *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm";
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = 867;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Path should be flat by now.", buf, 0x22u);
        }

        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FBBA0);
        }
        BOOL v36 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
        {
          id v92 = +[CRLAssertionHandler packedBacktraceString];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v34;
          *(_WORD *)&buf[8] = 2114;
          *(void *)&buf[10] = v92;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v36, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
        }
        double v37 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]");
        double v38 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v37 file:v38 lineNumber:867 isFatal:0 description:"Path should be flat by now."];

        if (!v31) {
          goto LABEL_43;
        }
        if (v31 == 3)
        {
LABEL_36:
          double v32 = y;
          double v33 = x;
        }
      }
      id v39 = (double *)v372;
      double v40 = sub_1000643CC(v33, v32, *((double *)v372 - 2), *((double *)v372 - 1)) * a8 * a8;
      if (v40 > 0.000000999999997 && v40 <= v29)
      {
        if (v28 == *(char **)&v354) {
          goto LABEL_48;
        }
        *(_OWORD *)buf = xmmword_101175160;
        *(_OWORD *)&buf[16] = xmmword_101175160;
        *(_OWORD *)&buf[32] = xmmword_101175160;
        if (![v359 elementAtIndex:v28 + 1 associatedPoints:buf])
        {
          double v32 = y;
          double v33 = x;
          a8 = v360;
          goto LABEL_96;
        }
        id v39 = (double *)v372;
        double v44 = *(double *)buf;
        double v45 = *(double *)&buf[8];
        double v46 = sub_100064680(v33, v32, *((double *)v372 - 2));
        double v48 = sub_100064660(v46, v47);
        double v50 = v49;
        double v51 = v45;
        double var3 = v357;
        double v52 = sub_100064680(v44, v51, v33);
        double v54 = sub_100064660(v52, v53);
        double v55 = v48;
        double v29 = 1.0;
        double v57 = sub_10006468C(v55, v50, v54, v56);
        a8 = v360;
        if (v57 < 0.99)
        {
LABEL_48:
          if ((v31 | 2) != 3)
          {
            unsigned int v58 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014FBBC0);
            }
            double v59 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)v59, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)&uint8_t buf[4] = v58;
              *(_WORD *)&buf[8] = 2082;
              *(void *)&buf[10] = "-[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:vie"
                                    "wScale:strokeTileLayout:cachedCurrentElementPercentage:]";
              *(_WORD *)&buf[18] = 2082;
              *(void *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm";
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = 910;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v59, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Should only have line and close elements by now.", buf, 0x22u);
            }

            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014FBBE0);
            }
            double v60 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR))
            {
              id v93 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = v58;
              *(_WORD *)&buf[8] = 2114;
              *(void *)&buf[10] = v93;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v60, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            double v61 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]");
            unint64_t v62 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
            +[CRLAssertionHandler handleFailureInFunction:v61 file:v62 lineNumber:910 isFatal:0 description:"Should only have line and close elements by now."];

            id v39 = (double *)v372;
          }
          double v63 = sqrt(v40) / 50.0;
          if (v63 < v29) {
            double v63 = v29;
          }
          uint64_t v64 = (uint64_t)v63;
          if ((uint64_t)v63 >= 1)
          {
            double v65 = *(v39 - 2);
            double v66 = *(v39 - 1);
            double v67 = sub_100064680(v33, v32, v65);
            double v69 = v68;
            uint64_t v70 = 0;
            do
            {
              double v71 = sub_1000646A4(v67, v69, (double)++v70 / (double)v64);
              double v72 = sub_100064698(v65, v66, v71);
              double v74 = v72;
              uint64_t v75 = v73;
              if (v39 >= (double *)v373)
              {
                v76 = __p;
                uint64_t v77 = ((char *)v39 - (char *)__p) >> 4;
                unint64_t v78 = v77 + 1;
                if ((unint64_t)(v77 + 1) >> 60) {
                  sub_100004E40();
                }
                uint64_t v79 = v373 - (char *)__p;
                if ((v373 - (char *)__p) >> 3 > v78) {
                  unint64_t v78 = v79 >> 3;
                }
                if ((unint64_t)v79 >= 0x7FFFFFFFFFFFFFF0) {
                  unint64_t v80 = 0xFFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v80 = v78;
                }
                if (v80)
                {
                  double v81 = (char *)sub_10001EAB0((uint64_t)&v373, v80);
                  v76 = __p;
                  id v39 = (double *)v372;
                }
                else
                {
                  double v81 = 0;
                }
                v82 = &v81[16 * v77];
                *(double *)v82 = v74;
                *((void *)v82 + 1) = v75;
                BOOL v83 = v82;
                if (v39 != v76)
                {
                  do
                  {
                    *((_OWORD *)v83 - 1) = *((_OWORD *)v39 - 1);
                    v83 -= 16;
                    v39 -= 2;
                  }
                  while (v39 != v76);
                  v76 = __p;
                }
                id v39 = (double *)(v82 + 16);
                __p = (double *)v83;
                v373 = &v81[16 * v80];
                if (v76) {
                  operator delete(v76);
                }
              }
              else
              {
                *id v39 = v72;
                *((void *)v39 + 1) = v73;
                v39 += 2;
              }
              v372 = (char *)v39;
            }
            while (v70 != v64);
            double v32 = y;
            double v33 = x;
            double var3 = v357;
            a8 = v360;
            double v29 = 1.0;
            goto LABEL_96;
          }
        }
      }
      else if (v40 > v29)
      {
        goto LABEL_48;
      }
      double v32 = y;
      double v33 = x;
LABEL_96:
      ++v28;
      CGFloat x = v33;
      CGFloat y = v32;
    }
    while (v28 != v27);
  }
  double v94 = __p;
  uint64_t v95 = v372 - (char *)__p;
  if ((unint64_t)(v372 - (char *)__p) >= 0x20)
  {
    unint64_t v96 = [(CRLSmartStroke *)self strokeName];
    v336 = +[CRLBrushStrokeLoader storageForBrushStrokeNamed:v96];

    unint64_t v97 = v336;
    if (!v336)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FBC00);
      }
      CGAffineTransform v98 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v98, OS_LOG_TYPE_ERROR)) {
        sub_1010B60DC();
      }

      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FBC20);
      }
      v99 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v99, OS_LOG_TYPE_ERROR))
      {
        unsigned int v100 = +[CRLAssertionHandler packedBacktraceString];
        sub_10107C04C(v100);
      }

      double v101 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]");
      double v102 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v101, v102, 928, 0, "invalid nil value for '%{public}s'", "storage");

      unint64_t v97 = 0;
    }
    unint64_t v103 = [v97 textureIndices];
    __int16 v104 = [v103 objectForKeyedSubscript:v337];
    v105 = [v104 objectAtIndexedSubscript:a4];
    id v368 = [v105 unsignedIntegerValue];

    id v366 = [v336 totalSectionCount];
    LODWORD(v105) = (int)log2(64.0) - 1;
    double v106 = log2((v339 + v339) * a8);
    double v107 = 1.0;
    uint64_t v108 = v95 >> 4;
    float v109 = (float)((int)v105 - (int)sub_100407E48(ceil(v106), 1.0, (double)(int)v105));
    float v355 = exp2f(-v109);
    float v362 = v109;
    LODWORD(v354) = exp2f(-(float)(v109 + 1.0));
    unint64_t v348 = v95 >> 4;
    uint64_t v110 = (v95 >> 4) - 1;
    if (v108 == 1)
    {
      float v114 = 0.0;
    }
    else
    {
      double v111 = *__p;
      double v112 = __p[1];
      v113 = __p + 3;
      float v114 = 0.0;
      uint64_t v115 = v108 - 1;
      do
      {
        double v116 = *(v113 - 1);
        double v117 = *v113;
        float v114 = sub_1000653B4(v116, *v113, v111, v112) + v114;
        v113 += 2;
        double v112 = v117;
        double v111 = v116;
        --v115;
      }
      while (v115);
    }
    __int16 v118 = [v336 paths];
    id v119 = [v118 objectForKeyedSubscript:v337];
    __int16 v120 = [v119 objectAtIndexedSubscript:a4];
    unint64_t v121 = [v120 originalPath];

    if (!v121)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FBC40);
      }
      v122 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v122, OS_LOG_TYPE_ERROR)) {
        sub_1010B6048();
      }

      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FBC60);
      }
      v123 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v123, OS_LOG_TYPE_ERROR))
      {
        v124 = +[CRLAssertionHandler packedBacktraceString];
        sub_10107C04C(v124);
      }

      __int16 v118 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_rasterRenderSection:sectionIndex:ontoPath:inElementRange:into:viewScale:strokeTileLayout:cachedCurrentElementPercentage:]");
      v125 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v118, v125, 985, 0, "invalid nil value for '%{public}s'", "originalPathForSection");
    }
    [v121 bounds];
    float v126 = v114 / (var3 - var2);
    double v127 = fmin(v380.origin.x, 0.0);
    double v128 = fmax(CGRectGetMaxX(v380), 1.0) + -1.0;
    if (var2 >= 0.001)
    {
      double var2 = (var2 - v127) / (1.0 - v127 + v128);
    }
    else
    {
      double v129 = *__p;
      double v130 = __p[1];
      double v131 = sub_100064680(*__p, v130, __p[2]);
      double v133 = sub_100064660(v131, v132);
      double v135 = sub_1000646A4(v133, v134, v126 * -v127);
      double *__p = sub_100064698(v129, v130, v135);
      *((void *)__p + 1) = v136;
    }
    if (v357 <= 0.999)
    {
      double v146 = (v357 - v127) / (1.0 - v127 + v128);
    }
    else
    {
      v137 = &__p[2 * v110];
      double v138 = *v137;
      double v139 = v137[1];
      double v140 = sub_100064680(*v137, v139, __p[2 * v348 - 4]);
      double v142 = sub_100064660(v140, v141);
      double v144 = sub_1000646A4(v142, v143, v128 * v126);
      double *v137 = sub_100064698(v138, v139, v144);
      *((void *)v137 + 1) = v145;
      double v146 = v357;
    }

    sub_10046B9A0(v379, v348);
    uint64_t v147 = *(void *)&v379[0];
    **(_DWORD **)&v379[0] = 0;
    if (v110)
    {
      double v148 = *__p;
      double v149 = __p[1];
      v150 = (float *)(v147 + 4);
      v151 = __p + 3;
      float v152 = 0.0;
      do
      {
        double v153 = *(v151 - 1);
        double v154 = *v151;
        float v152 = sub_1000653B4(v153, *v151, v148, v149) + v152;
        *v150++ = v152;
        v151 += 2;
        double v149 = v154;
        double v148 = v153;
        --v110;
      }
      while (v110);
    }
    else
    {
      float v152 = 0.0;
    }
    v155 = (_OWORD *)*((void *)a7 + 1);
    uint64_t v156 = (uint64_t)v155 - *(void *)a7;
    BOOL v157 = v155 != *(_OWORD **)a7;
    if (v155 != *(_OWORD **)a7)
    {
      v158 = v155 - 2;
      unint64_t v159 = *((void *)a7 + 2);
      if ((unint64_t)v155 >= v159)
      {
        uint64_t v162 = v156 >> 5;
        unint64_t v163 = (v156 >> 5) + 1;
        if (v163 >> 59) {
          sub_100004E40();
        }
        uint64_t v164 = v159 - *(void *)a7;
        if (v164 >> 4 > v163) {
          unint64_t v163 = v164 >> 4;
        }
        if ((unint64_t)v164 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v165 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v165 = v163;
        }
        if (v165) {
          v166 = (char *)sub_100148898((uint64_t)a7 + 16, v165);
        }
        else {
          v166 = 0;
        }
        v167 = &v166[32 * v162];
        v168 = &v166[32 * v165];
        long long v169 = v158[1];
        *(_OWORD *)v167 = *v158;
        *((_OWORD *)v167 + 1) = v169;
        v161 = v167 + 32;
        v171 = *(char **)a7;
        v170 = (char *)*((void *)a7 + 1);
        if (v170 != *(char **)a7)
        {
          do
          {
            long long v172 = *((_OWORD *)v170 - 1);
            *((_OWORD *)v167 - 2) = *((_OWORD *)v170 - 2);
            *((_OWORD *)v167 - 1) = v172;
            v167 -= 32;
            v170 -= 32;
          }
          while (v170 != v171);
          v170 = *(char **)a7;
        }
        *(void *)a7 = v167;
        *((void *)a7 + 1) = v161;
        *((void *)a7 + 2) = v168;
        if (v170) {
          operator delete(v170);
        }
      }
      else
      {
        long long v160 = *(v155 - 1);
        _OWORD *v155 = *v158;
        v155[1] = v160;
        v161 = v155 + 2;
      }
      *((void *)a7 + 1) = v161;
    }
    unsigned __int8 v173 = [(CRLBrushStroke *)self p_shouldSplitAtSharpAngles];
    double v174 = v377;
    if (v173)
    {
      if (v377 > 0.99 && v353 < v16)
      {
        ++v353;
        double v377 = 0.0;
        double v174 = 0.0;
      }
      double v176 = v376;
      if (v376 < 0.01 && v341 > location)
      {
        --v341;
        double v376 = 1.0;
      }
    }
    else
    {
      if (v377 < 0.01 && v353 > location)
      {
        --v353;
        double v377 = 1.0;
        double v174 = 1.0;
      }
      double v176 = v376;
      if (v376 > 0.99 && v341 < v16)
      {
        ++v341;
        double v376 = 0.0;
      }
    }
    double v180 = *__p;
    double v181 = __p[1];
    [v370 gradientAt:v353 fromElement:v174];
    double v346 = sub_100064680(v180, v181, v182);
    double v183 = *((double *)v372 - 2);
    double v184 = *((double *)v372 - 1);
    [v370 gradientAt:v341 fromElement:v376];
    double v344 = sub_100064698(v183, v184, v185);
    double v343 = v186;
    v187 = [(CRLSmartStroke *)self strokeName];
    unsigned __int8 v188 = [v187 isEqualToString:@"Basic"];
    double v358 = v146;
    if (v188)
    {
      int v189 = 0;
    }
    else
    {
      unint64_t v121 = [(CRLSmartStroke *)self strokeName];
      if ([v121 isEqualToString:@"Basic Rounded"])
      {
        int v189 = 0;
      }
      else
      {
        __int16 v118 = [(CRLSmartStroke *)self strokeName];
        if (([v118 isEqualToString:@"Basic Square"] & 1) == 0)
        {

          v191 = v336;
          goto LABEL_191;
        }
        int v189 = 1;
      }
    }
    unsigned int v190 = [v370 isEffectivelyClosed];
    if (v189) {

    }
    if (v188)
    {

      v191 = v336;
      if (!v190)
      {
LABEL_191:
        uint64_t v200 = 0;
        double v201 = 4.0 * v362;
        float v202 = 4.0 * 4.0 + 64.0;
        float v203 = v201 + (v107 - v355) * 64.0;
        *(float *)&double v201 = v201 + (v107 - *(float *)&v354) * 64.0;
        float v204 = 1.0 - (float)(v203 / v202);
        *(float *)&double v201 = 1.0 - (float)(*(float *)&v201 / v202);
        float v205 = vabds_f32(*(float *)&v201, v204);
        double v206 = v204;
        double v207 = *(float *)&v201;
        double v208 = v205 / (v339 * a8);
        double v209 = v107 / (float)((float)(unint64_t)v366 * v202);
        float v210 = v208 + v206;
        *(float *)&double v208 = v207 - v208;
        double v211 = v209 + v206;
        double v212 = v207 - v209;
        *(float *)&double v207 = (float)((unint64_t)v366 - 1);
        double v213 = (double)((unint64_t)v366 - 1);
        float v364 = 1.0
             - (float)((float)((float)(*(float *)&v207 + v210) - (float)(unint64_t)v368)
                     / (float)(unint64_t)v366);
        float v356 = 1.0
             - (float)((float)((float)(*(float *)&v207 + *(float *)&v208) - (float)(unint64_t)v368)
                     / (float)(unint64_t)v366);
        double v214 = v107 - (v212 + v213 - (double)(unint64_t)v368) / (double)(unint64_t)v366;
        double v215 = v338 + v339 * 0.5;
        double v340 = v152;
        double v342 = v215;
        *(float *)&double v211 = v107 - (v211 + v213 - (double)(unint64_t)v368) / (double)(unint64_t)v366;
        int v369 = LODWORD(v211);
        *(float *)&double v214 = v214;
        int v367 = LODWORD(v214);
        v216 = (char *)a7 + 16;
        if (v348 <= 1) {
          uint64_t v217 = 1;
        }
        else {
          uint64_t v217 = v348;
        }
        double v218 = 1.0;
        do
        {
          double v219 = v346;
          if (v200) {
            double v219 = __p[2 * v200 - 2];
          }
          uint64_t v220 = v200 + 1;
          double v221 = v344;
          double v222 = v343;
          if (v200 + 1 < v348)
          {
            v223 = &__p[2 * v220];
            double v221 = *v223;
            double v222 = v223[1];
          }
          v224 = &__p[2 * v200];
          double v225 = *v224;
          double v226 = v224[1];
          double v227 = sub_100064680(*v224, v226, v219);
          double v229 = sub_100064660(v227, v228);
          double v231 = v230;
          double v232 = sub_100064680(v221, v222, v225);
          double v234 = sub_100064660(v232, v233);
          double v236 = v235;
          double v237 = sub_1000646A4(v234, v235, -1.0);
          double v239 = sub_10006468C(v229, v231, v237, v238);
          long double v240 = acos(fmin(fmax(v239, -1.0), v218));
          double v241 = sin(v240 * 0.5);
          [(CRLStroke *)self miterLimit];
          double v361 = v242 * 0.995;
          double v363 = v218 / v241;
          if (v218 / v241 <= v242 * 0.995)
          {
            double v254 = sub_100064D34(v229, v231, v234);
            double v256 = sub_100066394(0, v254, v255);
            double v258 = sub_100064660(v256, v257);
            double v251 = sub_1000646A4(v258, v259, v342 / v241);
          }
          else
          {
            double v243 = sub_100066394(0, v229, v231);
            double v245 = v244;
            double v246 = sub_100066394(0, v234, v236);
            double v248 = v247;
            double v249 = sub_100064660(v243, v245);
            double v251 = sub_1000646A4(v249, v250, v342);
            double v252 = sub_100064660(v246, v248);
            double v354 = sub_1000646A4(v252, v253, v342);
          }
          double v260 = *(float *)(*(void *)&v379[0] + 4 * v200) / v340;
          double v261 = sub_100407E68(var0, var1, v260);
          double v262 = sub_100407E68(var2, v358, v260);
          double v263 = sub_100064698(v225, v226, v251);
          v265 = (char *)*((void *)a7 + 1);
          unint64_t v264 = *((void *)a7 + 2);
          float v266 = v262;
          float v267 = v261;
          float v268 = v263;
          float v270 = v269;
          if (v157)
          {
            if ((unint64_t)v265 >= v264)
            {
              uint64_t v271 = (uint64_t)&v265[-*(void *)a7] >> 5;
              if ((unint64_t)(v271 + 1) >> 59) {
                sub_100004E40();
              }
              uint64_t v272 = v264 - *(void *)a7;
              uint64_t v273 = v272 >> 4;
              if (v272 >> 4 <= (unint64_t)(v271 + 1)) {
                uint64_t v273 = v271 + 1;
              }
              if ((unint64_t)v272 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v274 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v274 = v273;
              }
              if (v274) {
                v275 = (char *)sub_100148898((uint64_t)a7 + 16, v274);
              }
              else {
                v275 = 0;
              }
              v276 = (float *)&v275[32 * v271];
              float *v276 = 0.0;
              v276[1] = v268;
              v276[2] = v270;
              v276[3] = v266;
              v276[4] = v364;
              *((_DWORD *)v276 + 5) = v369;
              *((_DWORD *)v276 + 6) = v367;
              v276[7] = v267;
              v278 = *(char **)a7;
              v277 = (char *)*((void *)a7 + 1);
              v279 = v276;
              if (v277 != *(char **)a7)
              {
                do
                {
                  long long v280 = *((_OWORD *)v277 - 1);
                  *((_OWORD *)v279 - 2) = *((_OWORD *)v277 - 2);
                  *((_OWORD *)v279 - 1) = v280;
                  v279 -= 8;
                  v277 -= 32;
                }
                while (v277 != v278);
                v277 = *(char **)a7;
              }
              v265 = (char *)(v276 + 8);
              *(void *)a7 = v279;
              *((void *)a7 + 1) = v276 + 8;
              *((void *)a7 + 2) = &v275[32 * v274];
              if (v277) {
                operator delete(v277);
              }
            }
            else
            {
              *(_DWORD *)v265 = 0;
              *((float *)v265 + 1) = v268;
              *((float *)v265 + 2) = v270;
              *((float *)v265 + 3) = v266;
              *((float *)v265 + 4) = v364;
              *((_DWORD *)v265 + 5) = v369;
              *((_DWORD *)v265 + 6) = v367;
              *((float *)v265 + 7) = v267;
              v265 += 32;
            }
            *((void *)a7 + 1) = v265;
            unint64_t v264 = *((void *)a7 + 2);
          }
          if ((unint64_t)v265 >= v264)
          {
            uint64_t v282 = (uint64_t)&v265[-*(void *)a7] >> 5;
            if ((unint64_t)(v282 + 1) >> 59) {
              sub_100004E40();
            }
            uint64_t v283 = v264 - *(void *)a7;
            uint64_t v284 = v283 >> 4;
            if (v283 >> 4 <= (unint64_t)(v282 + 1)) {
              uint64_t v284 = v282 + 1;
            }
            if ((unint64_t)v283 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v285 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v285 = v284;
            }
            if (v285) {
              v286 = (char *)sub_100148898((uint64_t)a7 + 16, v285);
            }
            else {
              v286 = 0;
            }
            v287 = (float *)&v286[32 * v282];
            float *v287 = 0.0;
            v287[1] = v268;
            v287[2] = v270;
            v287[3] = v266;
            v287[4] = v364;
            *((_DWORD *)v287 + 5) = v369;
            *((_DWORD *)v287 + 6) = v367;
            v287[7] = v267;
            v289 = *(char **)a7;
            v288 = (char *)*((void *)a7 + 1);
            v290 = v287;
            if (v288 != *(char **)a7)
            {
              do
              {
                long long v291 = *((_OWORD *)v288 - 1);
                *((_OWORD *)v290 - 2) = *((_OWORD *)v288 - 2);
                *((_OWORD *)v290 - 1) = v291;
                v290 -= 8;
                v288 -= 32;
              }
              while (v288 != v289);
              v288 = *(char **)a7;
            }
            v281 = (char *)(v287 + 8);
            *(void *)a7 = v290;
            *((void *)a7 + 1) = v287 + 8;
            *((void *)a7 + 2) = &v286[32 * v285];
            if (v288) {
              operator delete(v288);
            }
          }
          else
          {
            char *v265 = 0;
            v265[3] = 0;
            *(_WORD *)(v265 + 1) = 0;
            *((float *)v265 + 1) = v268;
            *((float *)v265 + 2) = v270;
            *((float *)v265 + 3) = v266;
            *((float *)v265 + 4) = v364;
            *((_DWORD *)v265 + 5) = v369;
            *((_DWORD *)v265 + 6) = v367;
            *((float *)v265 + 7) = v267;
            v281 = v265 + 32;
          }
          *((void *)a7 + 1) = v281;
          float v292 = sub_100064680(v225, v226, v251);
          float v294 = v293;
          unint64_t v295 = *((void *)a7 + 2);
          if ((unint64_t)v281 >= v295)
          {
            uint64_t v297 = (uint64_t)&v281[-*(void *)a7] >> 5;
            if ((unint64_t)(v297 + 1) >> 59) {
              sub_100004E40();
            }
            uint64_t v298 = v295 - *(void *)a7;
            uint64_t v299 = v298 >> 4;
            if (v298 >> 4 <= (unint64_t)(v297 + 1)) {
              uint64_t v299 = v297 + 1;
            }
            if ((unint64_t)v298 >= 0x7FFFFFFFFFFFFFE0) {
              unint64_t v300 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v300 = v299;
            }
            if (v300) {
              v301 = (char *)sub_100148898((uint64_t)a7 + 16, v300);
            }
            else {
              v301 = 0;
            }
            v302 = (float *)&v301[32 * v297];
            float *v302 = 0.0;
            v302[1] = v292;
            v302[2] = v294;
            v302[3] = v266;
            v302[4] = v356;
            *((_DWORD *)v302 + 5) = v369;
            *((_DWORD *)v302 + 6) = v367;
            v302[7] = v267;
            v304 = *(char **)a7;
            v303 = (char *)*((void *)a7 + 1);
            v305 = v302;
            double v218 = 1.0;
            if (v303 != *(char **)a7)
            {
              do
              {
                long long v306 = *((_OWORD *)v303 - 1);
                *((_OWORD *)v305 - 2) = *((_OWORD *)v303 - 2);
                *((_OWORD *)v305 - 1) = v306;
                v305 -= 8;
                v303 -= 32;
              }
              while (v303 != v304);
              v303 = *(char **)a7;
            }
            v296 = (char *)(v302 + 8);
            *(void *)a7 = v305;
            *((void *)a7 + 1) = v302 + 8;
            *((void *)a7 + 2) = &v301[32 * v300];
            if (v303) {
              operator delete(v303);
            }
          }
          else
          {
            *(_DWORD *)v281 = 0;
            *((float *)v281 + 1) = v292;
            *((float *)v281 + 2) = v294;
            *((float *)v281 + 3) = v266;
            *((float *)v281 + 4) = v356;
            *((_DWORD *)v281 + 5) = v369;
            *((_DWORD *)v281 + 6) = v367;
            v296 = v281 + 32;
            *((float *)v281 + 7) = v267;
            double v218 = 1.0;
          }
          *((void *)a7 + 1) = v296;
          if (v363 > v361)
          {
            float v307 = sub_100064698(v225, v226, v354);
            float v309 = v308;
            if ((unint64_t)v296 >= *v216)
            {
              uint64_t v311 = (uint64_t)&v296[-*(void *)a7] >> 5;
              if ((unint64_t)(v311 + 1) >> 59) {
                sub_100004E40();
              }
              uint64_t v312 = *v216 - *(void *)a7;
              uint64_t v313 = v312 >> 4;
              if (v312 >> 4 <= (unint64_t)(v311 + 1)) {
                uint64_t v313 = v311 + 1;
              }
              if ((unint64_t)v312 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v314 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v314 = v313;
              }
              if (v314) {
                v315 = (char *)sub_100148898((uint64_t)a7 + 16, v314);
              }
              else {
                v315 = 0;
              }
              v316 = (float *)&v315[32 * v311];
              float *v316 = 0.0;
              v316[1] = v307;
              v316[2] = v309;
              v316[3] = v266;
              v316[4] = v364;
              *((_DWORD *)v316 + 5) = v369;
              *((_DWORD *)v316 + 6) = v367;
              v316[7] = v267;
              v318 = *(char **)a7;
              v317 = (char *)*((void *)a7 + 1);
              v319 = v316;
              if (v317 != *(char **)a7)
              {
                do
                {
                  long long v320 = *((_OWORD *)v317 - 1);
                  *((_OWORD *)v319 - 2) = *((_OWORD *)v317 - 2);
                  *((_OWORD *)v319 - 1) = v320;
                  v319 -= 8;
                  v317 -= 32;
                }
                while (v317 != v318);
                v317 = *(char **)a7;
              }
              v310 = (char *)(v316 + 8);
              *(void *)a7 = v319;
              *((void *)a7 + 1) = v316 + 8;
              *((void *)a7 + 2) = &v315[32 * v314];
              if (v317) {
                operator delete(v317);
              }
            }
            else
            {
              *(_DWORD *)v296 = 0;
              *((float *)v296 + 1) = v307;
              *((float *)v296 + 2) = v309;
              *((float *)v296 + 3) = v266;
              *((float *)v296 + 4) = v364;
              *((_DWORD *)v296 + 5) = v369;
              *((_DWORD *)v296 + 6) = v367;
              v310 = v296 + 32;
              *((float *)v296 + 7) = v267;
            }
            *((void *)a7 + 1) = v310;
            float v321 = sub_100064680(v225, v226, v354);
            float v323 = v322;
            unint64_t v324 = *((void *)a7 + 2);
            if ((unint64_t)v310 >= v324)
            {
              uint64_t v326 = (uint64_t)&v310[-*(void *)a7] >> 5;
              if ((unint64_t)(v326 + 1) >> 59) {
                sub_100004E40();
              }
              uint64_t v327 = v324 - *(void *)a7;
              uint64_t v328 = v327 >> 4;
              if (v327 >> 4 <= (unint64_t)(v326 + 1)) {
                uint64_t v328 = v326 + 1;
              }
              if ((unint64_t)v327 >= 0x7FFFFFFFFFFFFFE0) {
                unint64_t v329 = 0x7FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v329 = v328;
              }
              if (v329) {
                v330 = (char *)sub_100148898((uint64_t)a7 + 16, v329);
              }
              else {
                v330 = 0;
              }
              v331 = (float *)&v330[32 * v326];
              float *v331 = 0.0;
              v331[1] = v321;
              v331[2] = v323;
              v331[3] = v266;
              v331[4] = v356;
              *((_DWORD *)v331 + 5) = v369;
              *((_DWORD *)v331 + 6) = v367;
              v331[7] = v267;
              v333 = *(char **)a7;
              v332 = (char *)*((void *)a7 + 1);
              v334 = v331;
              double v218 = 1.0;
              if (v332 != *(char **)a7)
              {
                do
                {
                  long long v335 = *((_OWORD *)v332 - 1);
                  *((_OWORD *)v334 - 2) = *((_OWORD *)v332 - 2);
                  *((_OWORD *)v334 - 1) = v335;
                  v334 -= 8;
                  v332 -= 32;
                }
                while (v332 != v333);
                v332 = *(char **)a7;
              }
              v325 = (char *)(v331 + 8);
              *(void *)a7 = v334;
              *((void *)a7 + 1) = v331 + 8;
              *((void *)a7 + 2) = &v330[32 * v329];
              if (v332) {
                operator delete(v332);
              }
            }
            else
            {
              *(_DWORD *)v310 = 0;
              *((float *)v310 + 1) = v321;
              *((float *)v310 + 2) = v323;
              *((float *)v310 + 3) = v266;
              *((float *)v310 + 4) = v356;
              *((_DWORD *)v310 + 5) = v369;
              *((_DWORD *)v310 + 6) = v367;
              v325 = v310 + 32;
              *((float *)v310 + 7) = v267;
              double v218 = 1.0;
            }
            *((void *)a7 + 1) = v325;
          }
          BOOL v157 = 0;
          uint64_t v200 = v220;
        }
        while (v220 != v217);
        if (*(void *)&v379[0])
        {
          *((void *)&v379[0] + 1) = *(void *)&v379[0];
          operator delete(*(void **)&v379[0]);
        }

        double v94 = __p;
        goto LABEL_290;
      }
    }
    else
    {

      v191 = v336;
      if ((v190 & 1) == 0) {
        goto LABEL_191;
      }
    }
    double v192 = *((double *)v372 - 1);
    double v347 = *((double *)v372 - 2);
    [v370 gradientAt:v341 fromElement:v376];
    double v194 = v193;
    double v195 = *__p;
    double v196 = __p[1];
    [v370 gradientAt:v353 fromElement:v377];
    double v198 = v197;
    double v346 = sub_100064680(v347, v192, v194);
    double v344 = sub_100064698(v195, v196, v198);
    double v343 = v199;
    a8 = v360;
    double v107 = 1.0;
    goto LABEL_191;
  }
LABEL_290:
  if (v94) {
    operator delete(v94);
  }

LABEL_293:
}

- (void)p_finishMetalRenderInContext:(CGContext *)a3 orDirectly:(id)a4 pathVertexData:(void *)a5 parameterized:(BOOL)a6 shouldReverseDrawOrder:(BOOL)a7 withLayoutOptions:(id)a8
{
  BOOL v9 = a6;
  id v12 = a4;
  id v174 = a8;
  unsigned __int8 v188 = (uint64_t *)a5;
  v177 = v12;
  if (*((void *)a5 + 1) != *(void *)a5)
  {
    c = a3;
    if (v12)
    {
      [v12 frame];
      [v12 transform];
      sub_100064070();
      double m11 = v231.m11;
      double m12 = v231.m12;
      long long v246 = *(_OWORD *)&v231.m21;
      long long v245 = *(_OWORD *)&v231.m13;
      long long v242 = *(_OWORD *)&v231.m13;
      long long v243 = *(_OWORD *)&v231.m21;
      if (v16 > 0.0 && v13 > 0.0)
      {
        long long v172 = [(CRLStroke *)self color];
        goto LABEL_21;
      }
    }
    else
    {
      ClipBoundingBodouble x = CGContextGetClipBoundingBox(a3);
      double width = ClipBoundingBox.size.width;
      double height = ClipBoundingBox.size.height;
      CGContextGetCTM((CGAffineTransform *)&v231, a3);
      double m11 = v231.m11;
      double m12 = v231.m12;
      long long v245 = *(_OWORD *)&v231.m13;
      long long v246 = *(_OWORD *)&v231.m21;
      if ([(CRLBrushStroke *)self p_isDrawingRasterizedIntoPDFWithContext:a3])
      {
        v244.CATransform3D a = m11;
        v244.CATransform3D b = m12;
        *(_OWORD *)&v244.c = v245;
        *(_OWORD *)&v244.tdouble x = v246;
        CGAffineTransformScale((CGAffineTransform *)&v231, &v244, 3.0, 3.0);
        double m11 = v231.m11;
        double m12 = v231.m12;
        long long v245 = *(_OWORD *)&v231.m13;
        long long v246 = *(_OWORD *)&v231.m21;
      }
      long long v242 = v245;
      long long v243 = v246;
      if (width > 0.0 && height > 0.0)
      {
        if (a3)
        {
          long long v172 = [(CRLStroke *)self colorForCGContext:a3];
        }
        else
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount];
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FBC80);
          }
          if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
            sub_1010B6170();
          }
          if (qword_101719A70 != -1) {
            dispatch_once(&qword_101719A70, &stru_1014FBCA0);
          }
          int64_t v19 = off_10166B4A0;
          if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
          {
            +[CRLAssertionHandler packedBacktraceString];
            objc_claimAutoreleasedReturnValue();
            sub_1010663B0();
          }

          double v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_finishMetalRenderInContext:orDirectly:pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:]");
          CGAffineTransform v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
          +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:1168 isFatal:0 description:"Should have either a direct context or a CGContext."];

          long long v172 = 0;
          id v12 = v177;
        }
LABEL_21:
        [(CRLStroke *)self width];
        double v23 = v22;
        [v172 alphaComponent];
        double v24 = sqrt(m12 * m12 + m11 * m11);
        float v26 = v25;
        double v27 = 1.0 / v24;
        float v28 = v23 * v24 * v26;
        if (v23 < v27) {
          float v26 = v28;
        }
        if (v9) {
          float v26 = 1.0;
        }
        float v182 = v26;
        if (v12)
        {
          uint64_t v167 = 0;
          uint64_t v162 = 0;
          double x = CGRectZero.origin.x;
          double v29 = CGRectZero.size.width;
          double y = CGRectZero.origin.y;
          double v30 = CGRectZero.size.height;
        }
        else
        {
          CGContextSaveGState(c);
          v240.CATransform3D a = m11;
          v240.CATransform3D b = m12;
          *(_OWORD *)&v240.c = v242;
          *(_OWORD *)&v240.tdouble x = v243;
          CGAffineTransformInvert(&transform, &v240);
          CGContextConcatCTM(c, &transform);
          long long v31 = *(_OWORD *)&CGAffineTransformIdentity.tx;
          long long v242 = *(_OWORD *)&CGAffineTransformIdentity.c;
          long long v243 = v31;
          CGRect v251 = CGContextGetClipBoundingBox(c);
          CGRect v252 = CGRectIntegral(v251);
          double x = v252.origin.x;
          double y = v252.origin.y;
          double v29 = v252.size.width;
          double v30 = v252.size.height;
          uint64_t v162 = (uint64_t)fmin(v252.size.width, 1024.0);
          uint64_t v167 = (uint64_t)fmin(v252.size.height, 1024.0);
        }
        double v181 = sub_1000B0C90();
        BOOL v170 = v9;
        if (v12)
        {
          double v32 = [v12 metalDeviceOverride];
          BOOL v33 = v32 == 0;

          if (!v33)
          {
            uint64_t v34 = [v177 metalDeviceOverride];

            double v181 = (void *)v34;
          }
        }
        unint64_t v35 = +[NSMutableArray array];
        uint64_t v200 = +[NSMutableArray array];
        uint64_t v36 = *((void *)a5 + 1) - *(void *)a5;
        if (v36)
        {
          unint64_t v37 = 0;
          unint64_t v38 = v36 >> 5;
          uint64_t v186 = v36 >> 5;
          do
          {
            unint64_t v39 = 0;
            uint64_t v40 = *v188;
            id v41 = (unsigned __int8 *)(*v188 + 32 * v37);
            unint64_t v42 = v37;
            do
            {
              int v43 = *v41;
              v41 += 32;
              if (v43)
              {
                if (v39) {
                  break;
                }
                ++v37;
              }
              else
              {
                ++v39;
              }
              ++v42;
            }
            while (v42 < v38);
            double v44 = (const void *)(v40 + 32 * v37);
            v37 += v39;
            memset(&v231, 0, 24);
            sub_10046BA5C(&v231, v44, v40 + 32 * v37, v39);
            CGFloat v45 = v231.m12;
            uint64_t v46 = *(void *)&v231.m12 - *(void *)&v231.m11;
            if (*(void *)&v231.m12 != *(void *)&v231.m11)
            {
              unint64_t v190 = v37;
              unint64_t v47 = 0;
              unint64_t v48 = v46 >> 5;
              unint64_t v198 = (v46 >> 5) - 3;
              do
              {
                double v49 = +[CRLGLDataBufferAttribute attributeWithName:@"position" bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
                double v50 = +[CRLGLDataBufferAttribute attributeWithName:@"textureCoordinate" bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
                double v51 = +[CRLGLDataBufferAttribute attributeWithName:@"clampedTextureCoordinate" bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
                double v52 = +[CRLGLDataBufferAttribute attributeWithName:@"percentAlongPath" bufferUsage:35044 dataType:5 normalized:1 componentCount:1];
                v249[0] = v49;
                v249[1] = v50;
                v249[2] = v51;
                v249[3] = v52;
                double v53 = +[NSArray arrayWithObjects:v249 count:4];
                uint64_t v54 = 65534;
                if (v48 - v47 <= 0xFFFE) {
                  uint64_t v54 = v48 - v47;
                }
                if (v54 + v47 <= v198 || v54 + v47 >= v48) {
                  uint64_t v56 = v54;
                }
                else {
                  uint64_t v56 = v48 - v47 - 3;
                }
                id v57 = +[CRLGPUDataBuffer newDataBufferWithVertexAttributes:v53 vertexCount:v56 indexElementCount:0 device:v181];
                [v57 setMetalDrawMode:4];
                v235[0] = _NSConcreteStackBlock;
                v235[1] = 3321888768;
                v235[2] = sub_1004693E0;
                v235[3] = &unk_1014FBCC0;
                v235[4] = v56;
                v235[5] = v47;
                BOOL v239 = a7;
                v235[6] = v48;
                double v237 = 0;
                uint64_t v238 = 0;
                __p = 0;
                sub_10046BAD8(&__p, *(const void **)&v231.m11, *(uint64_t *)&v231.m12, (uint64_t)(*(void *)&v231.m12 - *(void *)&v231.m11) >> 5);
                [v57 updateMetalDataBufferAttributes:v53 withBlock:v235];
                [v35 addObject:v57];
                v47 += v56;
                unsigned int v58 = +[NSNumber numberWithBool:v47 >= v48];
                [v200 addObject:v58];

                if (__p)
                {
                  double v237 = __p;
                  operator delete(__p);
                }
              }
              while (v47 < v48);
              CGFloat v45 = v231.m11;
              unint64_t v37 = v190;
              unint64_t v38 = v186;
            }
            if (v45 != 0.0)
            {
              v231.double m12 = v45;
              operator delete(*(void **)&v45);
            }
          }
          while (v37 < v38);
        }
        if (v177)
        {
          if (+[CRLBrushStroke p_isDirectContextWideColorCapable:v177])
          {
            uint64_t v59 = 115;
          }
          else
          {
            uint64_t v59 = 70;
          }
          double v60 = [v177 metalDrawable];
          double v61 = [v60 texture];
          id v62 = [v61 width];

          double v63 = [v177 metalDrawable];
          uint64_t v64 = [v63 texture];
          id v65 = [v64 height];
        }
        else
        {
          uint64_t v59 = 70;
          id v65 = (id)v167;
          id v62 = (id)v162;
        }
        double v66 = +[CRLCapabilities currentCapabilities];
        [v66 maximumMetalTextureSizeForDevice:v181];
        double v68 = v67;
        double v70 = v69;

        unint64_t v71 = (unint64_t)v65;
        id v72 = v62;
        if (v170
          || ((double v73 = (double)(unint64_t)v62 + (double)(unint64_t)v62,
               double v74 = (double)(unint64_t)v65 + (double)(unint64_t)v65,
               v73 <= v68)
            ? (BOOL v75 = v74 > v70)
            : (BOOL v75 = 1),
              unint64_t v71 = (unint64_t)v65,
              id v72 = v62,
              v75))
        {
          if (!v72)
          {
LABEL_87:

            goto LABEL_88;
          }
        }
        else
        {
          unint64_t v71 = (unint64_t)v74;
          if (!(unint64_t)v73) {
            goto LABEL_87;
          }
        }
        if (v71 && v62 && v65)
        {
          double v194 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:width:height:mipmapped:](MTLTextureDescriptor, "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10);
          [v194 setUsage:5];
          [v194 setStorageMode:2];
          id v189 = [v181 newTextureWithDescriptor:v194];
          double v199 = +[MTLTextureDescriptor texture2DDescriptorWithPixelFormat:v59 width:v62 height:v65 mipmapped:0];
          [v199 setUsage:5];
          [v199 setStorageMode:0];
          if (v177)
          {
            v76 = [v177 metalDrawable];
            id v191 = [v76 texture];
          }
          else
          {
            id v191 = [v181 newTextureWithDescriptor:v199];
          }
          double v185 = +[MTLRenderPassDescriptor renderPassDescriptor];
          uint64_t v77 = [v185 colorAttachments];
          v161 = [v77 objectAtIndexedSubscript:0];

          [v161 setTexture:v189];
          [v161 setStoreAction:1];
          [v161 setLoadAction:2];
          [v161 setClearColor:0.0, 0.0, 0.0, 0.0];
          [(CRLBrushStroke *)self p_metalBrushShaderForPixelFormat:10 andDevice:v181];
          v79 = unint64_t v78 = c;
          double v193 = [(CRLBrushStroke *)self p_metalOpacityShaderForPixelFormat:v59 andDevice:v181];
          id v184 = +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v181, 0.0, 0.0, (double)(unint64_t)[v191 width], (double)(unint64_t)objc_msgSend(v191, "height"), 0.0, 0.0, 1.0, 1.0);
          v232[0] = v170;
          __asm { FMOV            V0.4S, #1.0 }
          long long v233 = _Q0;
          [v174 strokeEnd];
          *(float *)&double v84 = v84;
          int v234 = LODWORD(v84);
          uint64_t v85 = (CGColor *)[v172 CGColor];
          if (v177) {
            uint64_t v85 = +[CRLBrushStroke p_colorForDrawingIntoDirectContext:v177 fromOriginalColor:v172];
          }
          Components = CGColorGetComponents(v85);
          double v88 = *Components;
          double v87 = Components[1];
          double v89 = Components[2];
          v187 = [(CRLBrushStroke *)self p_metalTextureForCurrentStrokeAndDevice:v181];
          v178 = sub_1000B0F64(v181);
          float v90 = v88;
          v91.f32[0] = v182 * v90;
          float v92 = v87;
          float v93 = v89;
          v91.f32[1] = v182 * v92;
          v91.i64[1] = __PAIR64__(LODWORD(v182), v182 * v93);
          float32x4_t v183 = v91;
          if (v177)
          {
            [v177 frame];
            double v95 = v94;
            double v97 = v96;
            long long v98 = *(_OWORD *)&CATransform3DIdentity.m13;
            *(_OWORD *)&v230.double m11 = *(_OWORD *)&CATransform3DIdentity.m11;
            *(_OWORD *)&v230.CGFloat m13 = v98;
            long long v99 = *(_OWORD *)&CATransform3DIdentity.m23;
            *(_OWORD *)&v230.CGFloat m21 = *(_OWORD *)&CATransform3DIdentity.m21;
            *(_OWORD *)&v230.m23 = v99;
            long long v100 = *(_OWORD *)&CATransform3DIdentity.m33;
            *(_OWORD *)&v230.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
            *(_OWORD *)&v230.m33 = v100;
            long long v101 = *(_OWORD *)&CATransform3DIdentity.m43;
            *(_OWORD *)&v230.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
            *(_OWORD *)&v230.CGFloat m43 = v101;
            CATransform3DScale(&v231, &v230, 2.0 / v94, -2.0 / v96, 1.0);
            CATransform3D v229 = v231;
            CATransform3DTranslate(&v231, &v229, v95 * -0.5, v97 * -0.5, 0.0);
            CATransform3D v228 = v231;
            [v177 contentsScale];
            double v103 = v102;
            [v177 contentsScale];
            CATransform3DScale(&v231, &v228, 1.0 / v103, 1.0 / v104, 1.0);
            CGFloat v105 = v231.m11;
            CGFloat v106 = v231.m12;
            CGFloat m13 = v231.m13;
            CGFloat m14 = v231.m14;
            CGFloat m21 = v231.m21;
            CGFloat m22 = v231.m22;
            long long v111 = *(_OWORD *)&v231.m23;
            long long v112 = *(_OWORD *)&v231.m31;
            long long v113 = *(_OWORD *)&v231.m33;
            long long v114 = *(_OWORD *)&v231.m41;
            CGFloat sxa = v231.m44;
            CGFloat m43 = v231.m43;
            m.CATransform3D a = m11;
            m.CATransform3D b = m12;
            *(_OWORD *)&m.tdouble x = v246;
            *(_OWORD *)&m.c = v245;
            CATransform3DMakeAffineTransform(&a, &m);
            b.double m11 = v105;
            b.double m12 = v106;
            b.CGFloat m13 = m13;
            b.CGFloat m14 = m14;
            b.CGFloat m21 = m21;
            b.CGFloat m22 = m22;
            *(_OWORD *)&b.m23 = v111;
            *(_OWORD *)&b.m31 = v112;
            *(_OWORD *)&b.m33 = v113;
            *(_OWORD *)&b.m41 = v114;
            b.CGFloat m43 = m43;
            b.m44 = sxa;
            CATransform3DConcat(&v231, &a, &b);
            *(_OWORD *)cCATransform3D a = *(_OWORD *)&v231.m23;
            float64x2_t v163 = *(float64x2_t *)&v231.m11;
            float64x2_t v166 = *(float64x2_t *)&v231.m21;
            float64x2_t v192 = *(float64x2_t *)&v231.m33;
            float64x2_t v168 = *(float64x2_t *)&v231.m31;
            float64x2_t v171 = *(float64x2_t *)&v231.m13;
            float64x2_t v196 = *(float64x2_t *)&v231.m43;
            float64x2_t v176 = *(float64x2_t *)&v231.m41;
            uint64_t v115 = [v178 commandBuffer];
            double v116 = [v115 renderCommandEncoderWithDescriptor:v185];
            v223[1] = 0;
            v223[0] = 0;
            *(double *)&v223[2] = (double)(unint64_t)[v194 width];
            *(double *)&v223[3] = (double)(unint64_t)[v194 height];
            long long v224 = xmmword_1011762C0;
            [v116 setViewport:v223];
            [v116 setFragmentTexture:v187 atIndex:0];
            *(float32x4_t *)&v231.double m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v163), v171);
            *(float32x4_t *)&v231.CGFloat m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v166), *(float64x2_t *)ca);
            *(float32x4_t *)&v231.CGFloat m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v168), v192);
            *(float32x4_t *)&v231.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v176), v196);
            [v79 setPipelineStateWithEncoder:v116 vertexBytes:&v231 fragmentBytes:v232];
            long long v222 = 0u;
            long long v221 = 0u;
            long long v220 = 0u;
            long long v219 = 0u;
            id v117 = v35;
            id v118 = [v117 countByEnumeratingWithState:&v219 objects:v248 count:16];
            if (v118)
            {
              uint64_t v119 = *(void *)v220;
              do
              {
                for (i = 0; i != v118; i = (char *)i + 1)
                {
                  if (*(void *)v220 != v119) {
                    objc_enumerationMutation(v117);
                  }
                  [*(id *)(*((void *)&v219 + 1) + 8 * i) drawWithEncoder:v116 atIndex:[v79 bufferIndex]];
                }
                id v118 = [v117 countByEnumeratingWithState:&v219 objects:v248 count:16];
              }
              while (v118);
            }

            [v116 endEncoding];
            unint64_t v121 = +[MTLRenderPassDescriptor renderPassDescriptor];
            v122 = [v121 colorAttachments];
            v123 = [v122 objectAtIndexedSubscript:0];

            [v123 setTexture:v191];
            [v123 setStoreAction:1];
            [v123 setLoadAction:2];
            [v123 setClearColor:0.0, 0.0, 0.0, 0.0];
            v124 = [v115 renderCommandEncoderWithDescriptor:v121];
            v217[1] = 0;
            v217[0] = 0;
            *(double *)&v217[2] = (double)(unint64_t)[v199 width];
            *(double *)&v217[3] = (double)(unint64_t)[v199 height];
            long long v218 = xmmword_1011762C0;
            [v124 setViewport:v217];
            [v124 setFragmentTexture:v189 atIndex:0];
            sub_10010C7E0((uint64_t)v216, 0.0, (double)(unint64_t)[v199 width], 0.0, (double)(unint64_t)[v199 height], -1.0, 1.0);
            *(float32x4_t *)&v247.double m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v216[0]), v216[1]);
            *(float32x4_t *)&v247.CGFloat m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v216[2]), v216[3]);
            *(float32x4_t *)&v247.CGFloat m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v216[4]), v216[5]);
            *(float32x4_t *)&v247.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v216[6]), v216[7]);
            float32x4_t v204 = v183;
            v205.i8[0] = 1;
            [v193 setPipelineStateWithEncoder:v124 vertexBytes:&v247 fragmentBytes:&v204];
            [v184 drawWithEncoder:v124 atIndex:[v193 bufferIndex]];
            [v124 endEncoding];
            [v115 enqueue];
            v125 = [v177 metalDrawable];
            [v115 presentDrawable:v125];

            [v115 commit];
          }
          else
          {
            int v154 = vcvtpd_s64_f64(v29 * 0.0009765625);
            if (v154 >= 1)
            {
              int v155 = 0;
              int v126 = vcvtpd_s64_f64(v30 * 0.0009765625);
              double v127 = (double)v162;
              sdouble x = 2.0 / (double)v162;
              double v128 = (double)v167;
              double v153 = (double)-v162 * 0.5;
              double v164 = (double)-v167 * 0.5;
              double v129 = 2.0 / (double)v167;
              int v156 = v126;
              do
              {
                if (v126 >= 1)
                {
                  int v169 = 0;
                  double v130 = (double)(int)(x + (double)(v155 << 10));
                  double v131 = v153 - v130;
                  do
                  {
                    memset(&v231, 0, sizeof(v231));
                    CATransform3DMakeScale(&v231, sx, v129, 1.0);
                    CATransform3D v215 = v231;
                    double v132 = (double)(int)(y + (double)(v169 << 10));
                    CATransform3DTranslate(&v247, &v215, v131, v164 - v132, 0.0);
                    CATransform3D v231 = v247;
                    v213.CATransform3D a = m11;
                    v213.CATransform3D b = m12;
                    *(_OWORD *)&v213.c = v245;
                    *(_OWORD *)&v213.tdouble x = v246;
                    CATransform3DMakeAffineTransform(&v214, &v213);
                    CATransform3D v212 = v231;
                    CATransform3DConcat(&v247, &v214, &v212);
                    unint64_t v133 = 0;
                    CATransform3D v231 = v247;
                    while (v133 < (unint64_t)objc_msgSend(v35, "count", *(void *)&v153))
                    {
                      double v197 = [v178 commandBuffer];
                      unint64_t v134 = 0;
                      while (v133 < (unint64_t)[v35 count] && v134 <= 8)
                      {
                        double v135 = [v197 renderCommandEncoderWithDescriptor:v185];
                        v210[1] = 0;
                        v210[0] = 0;
                        *(double *)&v210[2] = (double)(unint64_t)[v194 width];
                        *(double *)&v210[3] = (double)(unint64_t)[v194 height];
                        long long v211 = xmmword_1011762C0;
                        [v135 setViewport:v210];
                        [v135 setFragmentTexture:v187 atIndex:0];
                        *(float32x4_t *)&v247.double m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v231.m11), *(float64x2_t *)&v231.m13);
                        *(float32x4_t *)&v247.CGFloat m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v231.m21), *(float64x2_t *)&v231.m23);
                        *(float32x4_t *)&v247.CGFloat m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v231.m31), *(float64x2_t *)&v231.m33);
                        *(float32x4_t *)&v247.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v231.m41), *(float64x2_t *)&v231.m43);
                        [v79 setPipelineStateWithEncoder:v135 vertexBytes:&v247 fragmentBytes:v232];
                        v134 += 2;
                        unint64_t v136 = v133;
                        do
                        {
                          if (v136 >= (unint64_t)[v35 count]) {
                            break;
                          }
                          v137 = [v35 objectAtIndexedSubscript:v136];
                          objc_msgSend(v137, "drawWithEncoder:atIndex:", v135, objc_msgSend(v79, "bufferIndex"));
                          double v138 = [v200 objectAtIndexedSubscript:v136];
                          unsigned __int8 v139 = [v138 BOOLValue];

                          ++v136;
                        }
                        while ((v139 & 1) == 0);
                        [v135 endEncoding];
                        double v140 = +[MTLRenderPassDescriptor renderPassDescriptor];
                        double v141 = [v140 colorAttachments];
                        double v142 = [v141 objectAtIndexedSubscript:0];

                        [v142 setTexture:v191];
                        [v142 setStoreAction:1];
                        if (v133)
                        {
                          [v142 setLoadAction:1];
                        }
                        else
                        {
                          [v142 setLoadAction:2];
                          [v142 setClearColor:0.0, 0.0, 0.0, 0.0];
                        }
                        double v143 = [v197 renderCommandEncoderWithDescriptor:v140];
                        v208[1] = 0;
                        v208[0] = 0;
                        *(double *)&v208[2] = (double)(unint64_t)[v199 width];
                        *(double *)&v208[3] = (double)(unint64_t)[v199 height];
                        long long v209 = xmmword_1011762C0;
                        [v143 setViewport:v208];
                        [v143 setFragmentTexture:v189 atIndex:0];
                        sub_10010C7E0((uint64_t)v203, 0.0, (double)(unint64_t)[v199 width], 0.0, (double)(unint64_t)[v199 height], -1.0, 1.0);
                        float32x4_t v204 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v203[0]), v203[1]);
                        float32x4_t v205 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v203[2]), v203[3]);
                        float32x4_t v206 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v203[4]), v203[5]);
                        float32x4_t v207 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v203[6]), v203[7]);
                        float32x4_t v201 = v183;
                        char v202 = 1;
                        [v193 setPipelineStateWithEncoder:v143 vertexBytes:&v204 fragmentBytes:&v201];
                        [v184 drawWithEncoder:v143 atIndex:[v193 bufferIndex]];
                        [v143 endEncoding];

                        unint64_t v133 = v136;
                      }
                      if (v133 > (unint64_t)[v35 count])
                      {
                        unsigned int v144 = +[CRLAssertionHandler _atomicIncrementAssertCount];
                        if (qword_101719A70 != -1) {
                          dispatch_once(&qword_101719A70, &stru_1014FBCF0);
                        }
                        uint64_t v145 = off_10166B4A0;
                        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
                        {
                          LODWORD(v247.m11) = 67109890;
                          HIDWORD(v247.m11) = v144;
                          LOWORD(v247.m12) = 2082;
                          *(void *)((char *)&v247.m12 + 2) = "-[CRLBrushStroke p_finishMetalRenderInContext:orDirectly:"
                                                               "pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:]";
                          WORD1(v247.m13) = 2082;
                          *(void *)((char *)&v247.m13 + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRL"
                                                               "Canvas/CRLBrushStroke.mm";
                          WORD2(v247.m14) = 1024;
                          *(_DWORD *)((char *)&v247.m14 + 6) = 1523;
                          _os_log_error_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The buffer index should not be greater than the number of buffers.", (uint8_t *)&v247, 0x22u);
                        }
                        if (qword_101719A70 != -1) {
                          dispatch_once(&qword_101719A70, &stru_1014FBD10);
                        }
                        double v146 = off_10166B4A0;
                        if (os_log_type_enabled((os_log_t)v146, OS_LOG_TYPE_ERROR))
                        {
                          v150 = +[CRLAssertionHandler packedBacktraceString];
                          LODWORD(v247.m11) = 67109378;
                          HIDWORD(v247.m11) = v144;
                          LOWORD(v247.m12) = 2114;
                          *(void *)((char *)&v247.m12 + 2) = v150;
                          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v146, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&v247, 0x12u);
                        }
                        uint64_t v147 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_finishMetalRenderInContext:orDirectly:pathVertexData:parameterized:shouldReverseDrawOrder:withLayoutOptions:]");
                        double v148 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
                        +[CRLAssertionHandler handleFailureInFunction:v147 file:v148 lineNumber:1523 isFatal:0 description:"The buffer index should not be greater than the number of buffers."];
                      }
                      id v149 = [v35 count];
                      [v197 enqueue];
                      [v197 commit];
                      if (v133 >= (unint64_t)v149) {
                        [v197 waitUntilCompleted];
                      }

                      unint64_t v78 = c;
                    }
                    v151 = sub_1000B0D18(v191);
                    if (v170)
                    {
                      v253.origin.double x = (double)(int)(x + (double)(v155 << 10));
                      v253.origin.double y = (double)(int)(y + (double)(v169 << 10));
                      v253.size.double width = v127;
                      v253.size.double height = v128;
                      CGContextDrawImage(v78, v253, v151);
                    }
                    else
                    {
                      float v152 = [v172 colorWithAlphaComponent:1.0];
                      [objc_opt_class() p_drawColor:v152 intoContext:v78 usingImageAsMask:v151 withRect:v130, v132, v127, v128];

                      unint64_t v78 = c;
                    }
                    CGImageRelease(v151);
                    ++v169;
                  }
                  while (v169 != v156);
                }
                ++v155;
                int v126 = v156;
              }
              while (v155 != v154);
            }
            CGContextRestoreGState(v78);
          }
        }
        goto LABEL_87;
      }
    }
  }
LABEL_88:
}

+ (BOOL)p_isDirectContextWideColorCapable:(id)a3
{
  double v3 = [a3 metalDrawable];
  id v4 = [v3 texture];
  BOOL v5 = [v4 pixelFormat] == (id)115;

  return v5;
}

+ (CGColor)p_colorForDrawingIntoDirectContext:(id)a3 fromOriginalColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (CGColor *)[v7 CGColor];
  if ([v6 destinationColorSpaceOverride] || objc_msgSend(v7, "colorRGBSpace") == (id)1)
  {
    BOOL v9 = (CGColorSpace *)[v6 destinationColorSpaceOverride];
    if (!v9)
    {
      unsigned int v10 = [a1 p_isDirectContextWideColorCapable:v6];
      BOOL v11 = (CFStringRef *)&kCGColorSpaceExtendedSRGB;
      if (!v10) {
        BOOL v11 = (CFStringRef *)&kCGColorSpaceSRGB;
      }
      CGColorSpaceRef v12 = CGColorSpaceCreateWithName(*v11);
      BOOL v9 = (CGColorSpace *)CFAutorelease(v12);
    }
    CGColorRef CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v9, kCGRenderingIntentDefault, (CGColorRef)[v7 CGColor], 0);
    BOOL v8 = (CGColor *)CFAutorelease(CopyByMatchingToColorSpace);
  }

  return v8;
}

+ (void)p_drawColor:(id)a3 intoContext:(CGContext *)a4 usingImageAsMask:(CGImage *)a5 withRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v12 = a3;
  CGContextSaveGState(a4);
  size_t v13 = CGImageGetWidth(a5);
  size_t v14 = CGImageGetHeight(a5);
  id v15 = sub_100455AA8(2, (double)v13, (double)v14);
  size_t v16 = CGImageGetWidth(a5);
  size_t v17 = CGImageGetHeight(a5);
  v38.size.CGFloat width = (double)v16;
  v38.size.CGFloat height = (double)v17;
  v38.origin.CGFloat x = 0.0;
  v38.origin.CGFloat y = 0.0;
  CGContextDrawImage(v15, v38, a5);
  Image = CGBitmapContextCreateImage(v15);
  CGContextRelease(v15);
  long long v37 = xmmword_101178A30;
  size_t v19 = CGImageGetWidth(Image);
  size_t v20 = CGImageGetHeight(Image);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(Image);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(Image);
  size_t BytesPerRow = CGImageGetBytesPerRow(Image);
  DataProvider = CGImageGetDataProvider(Image);
  BOOL ShouldInterpolate = CGImageGetShouldInterpolate(Image);
  float v26 = CGImageMaskCreate(v19, v20, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, (const CGFloat *)&v37, ShouldInterpolate);
  CGImageRelease(Image);
  if (sub_1004583EC((uint64_t)a4) && !CGBitmapContextGetBitmapInfo(a4))
  {
    if (objc_msgSend(v12, "colorRGBSpace", v37) == (id)1) {
      char v34 = 35;
    }
    else {
      char v34 = 3;
    }
    size_t v35 = CGImageGetWidth(a5);
    size_t v36 = CGImageGetHeight(a5);
    double v32 = sub_100455AA8(v34, (double)v35, (double)v36);
    double v30 = (double)CGImageGetWidth(a5);
    double v31 = (double)CGImageGetHeight(a5);
    CGFloat v28 = 0.0;
    int v27 = 1;
    CGFloat v29 = 0.0;
  }
  else
  {
    int v27 = 0;
    CGFloat v28 = x;
    CGFloat v29 = y;
    double v30 = width;
    double v31 = height;
    double v32 = a4;
  }
  v39.origin.CGFloat x = v28;
  v39.origin.CGFloat y = v29;
  v39.size.CGFloat width = v30;
  v39.size.CGFloat height = v31;
  CGContextClipToMask(v32, v39, v26);
  CGImageRelease(v26);
  CGContextSetFillColorWithColor(v32, (CGColorRef)[v12 CGColor]);
  v40.origin.CGFloat x = v28;
  v40.origin.CGFloat y = v29;
  v40.size.CGFloat width = v30;
  v40.size.CGFloat height = v31;
  CGContextFillRect(v32, v40);
  if (v27)
  {
    BOOL v33 = CGBitmapContextCreateImage(v32);
    CGContextRelease(v32);
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    CGContextDrawImage(a4, v41, v33);
    CGImageRelease(v33);
  }
  CGContextRestoreGState(a4);
}

- (BOOL)p_shouldDrawAsVectorInContext:(CGContext *)a3
{
  if (a3)
  {
    int v5 = sub_1004583EC((uint64_t)a3);
    if (v5) {
      LOBYTE(v5) = ![(CRLBrushStroke *)self p_prefersRasterRenderingInContext:a3];
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FBD30);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B61F8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FBD50);
    }
    id v6 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_shouldDrawAsVectorInContext:]");
    BOOL v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1667, 0, "invalid nil value for '%{public}s'", "ctx");

    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)p_prefersRasterRenderingInContext:(CGContext *)a3
{
  if (!a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FBD70);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B628C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FBD90);
    }
    int v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_prefersRasterRenderingInContext:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1675, 0, "invalid nil value for '%{public}s'", "ctx");
  }
  if (sub_1004590FC((uint64_t)a3)) {
    return 1;
  }
  BOOL v9 = [(CRLSmartStroke *)self strokeName];
  if ([v9 isEqualToString:@"Pencil"])
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    unsigned int v10 = [(CRLSmartStroke *)self strokeName];
    unsigned __int8 v8 = [v10 isEqualToString:@"Crayon"];
  }
  return v8;
}

- (BOOL)p_isDrawingRasterizedIntoPDFWithContext:(CGContext *)a3
{
  if (!a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FBDB0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B6320();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FBDD0);
    }
    int v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_1010663B0();
    }

    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStroke p_isDrawingRasterizedIntoPDFWithContext:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1680, 0, "invalid nil value for '%{public}s'", "ctx");
  }
  int v8 = sub_1004583EC((uint64_t)a3);
  if (v8) {
    LOBYTE(v8) = ![(CRLBrushStroke *)self p_shouldDrawAsVectorInContext:a3];
  }
  return v8;
}

- (BOOL)p_isFreehandDrawingStrokeWithFixedTileWidth
{
  double v3 = [(CRLSmartStroke *)self strokeName];
  if ([v3 isEqualToString:@"Pencil"])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    int v5 = [(CRLSmartStroke *)self strokeName];
    unsigned __int8 v4 = [v5 isEqualToString:@"Crayon"];
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
  id v14 = [v10 elementPercentage:a3 forOverallPercentage:v13 startingElementIndex:a4 lengthToStartingElement:var2];
  if ((uint64_t)v14 > v13)
  {
    do
    {
      [v10 lengthOfElement:v13];
      double var2 = var2 + v15;
      ++v13;
    }
    while (v14 != (id)v13);
    objc_storeStrong(&a6->var0, a5);
    a6->unint64_t var1 = (unint64_t)v14;
    a6->double var2 = var2;
  }

  return (int64_t)v14;
}

+ (id)p_metalTextureQueue
{
  if (qword_1016A9C48 != -1) {
    dispatch_once(&qword_1016A9C48, &stru_1014FBDF0);
  }
  unint64_t v2 = (void *)qword_1016A9C40;

  return v2;
}

+ (id)p_metalShaderQueue
{
  if (qword_1016A9C58 != -1) {
    dispatch_once(&qword_1016A9C58, &stru_1014FBE10);
  }
  unint64_t v2 = (void *)qword_1016A9C50;

  return v2;
}

- (id)p_metalTextureForCurrentStrokeAndDevice:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  size_t v16 = sub_10046A6F0;
  size_t v17 = sub_10046A700;
  id v18 = 0;
  if (qword_1016A9C68 != -1) {
    dispatch_once(&qword_1016A9C68, &stru_1014FBE30);
  }
  int v5 = +[CRLBrushStroke p_metalTextureQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10046A754;
  block[3] = &unk_1014FBF18;
  double v11 = self;
  id v12 = &v13;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (id)p_metalBrushShaderForPixelFormat:(unint64_t)a3 andDevice:(id)a4
{
  id v5 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  size_t v17 = sub_10046A6F0;
  id v18 = sub_10046A700;
  id v19 = 0;
  if (qword_1016A9C78 != -1) {
    dispatch_once(&qword_1016A9C78, &stru_1014FBF38);
  }
  id v6 = +[CRLBrushStroke p_metalShaderQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10046B2DC;
  block[3] = &unk_1014FBF60;
  id v11 = v5;
  id v12 = &v14;
  unint64_t v13 = a3;
  id v7 = v5;
  dispatch_sync(v6, block);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (id)p_metalOpacityShaderForPixelFormat:(unint64_t)a3 andDevice:(id)a4
{
  id v5 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  size_t v17 = sub_10046A6F0;
  id v18 = sub_10046A700;
  id v19 = 0;
  if (qword_1016A9C88 != -1) {
    dispatch_once(&qword_1016A9C88, &stru_1014FBF80);
  }
  id v6 = +[CRLBrushStroke p_metalShaderQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10046B664;
  block[3] = &unk_1014FBF60;
  id v11 = v5;
  id v12 = &v14;
  unint64_t v13 = a3;
  id v7 = v5;
  dispatch_sync(v6, block);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

@end