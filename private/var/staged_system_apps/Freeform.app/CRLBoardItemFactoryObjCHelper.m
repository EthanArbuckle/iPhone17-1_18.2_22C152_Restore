@interface CRLBoardItemFactoryObjCHelper
+ (id)freehandDrawingShapeItemsFromPKStroke:(id)a3 adjustedBaseWidth:(double)a4 boardItemFactory:(id)a5;
+ (id)freehandDrawingShapeItemsFromPKStroke:(id)a3 unadjustedPencilKitBaseWidth:(double)a4 boardItemFactory:(id)a5;
+ (id)p_bezierAndStrokePathDataSubpathsByClippingBezier:(id)a3 andStrokePathData:(id)a4 toPath:(id)a5;
+ (id)p_strokePathCompactData:(id)a3 byTrimmingToMap:(id)a4;
@end

@implementation CRLBoardItemFactoryObjCHelper

+ (id)freehandDrawingShapeItemsFromPKStroke:(id)a3 adjustedBaseWidth:(double)a4 boardItemFactory:(id)a5
{
  id v8 = a3;
  id v47 = a5;
  id v48 = +[NSMutableArray array];
  id v55 = 0;
  uint64_t v9 = +[CRLPKStrokeConverter pathFromPKStroke:v8 pencilKitStrokePathData:&v55];
  id v10 = v55;
  v11 = [CRLPencilKitInkStroke alloc];
  v12 = [v8 ink];
  v46 = [(CRLPencilKitInkStroke *)v11 initWithInk:v12 adjustedWidth:a4];

  id v13 = [v8 mask];
  id v14 = [v13 CGPath];

  if (v14)
  {
    v15 = +[CRLBezierPath bezierPathWithCGPath:v14];
    if (v8)
    {
LABEL_3:
      [v8 transform];
      goto LABEL_6;
    }
  }
  else
  {
    v15 = 0;
    if (v8) {
      goto LABEL_3;
    }
  }
  memset(v54, 0, sizeof(v54));
LABEL_6:
  [v15 transformUsingAffineTransform:v54];
  v42 = v10;
  v43 = (void *)v9;
  if (v15)
  {
    [v8 crl_maximumActualWidth];
    v17 = [v15 bezierPathByOffsettingPath:1 joinStyle:v16 * 0.5];
    [a1 p_bezierAndStrokePathDataSubpathsByClippingBezier:v9 andStrokePathData:v10 toPath:v17];
  }
  else
  {
    v17 = +[CRLPair pairWithFirst:v9 second:v10];
    v57 = v17;
    +[NSArray arrayWithObjects:&v57 count:1];
  v18 = };

  v44 = v8;
  [v8 crl_anchorPointForTexture];
  double v20 = v19;
  double v22 = v21;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v18;
  id v23 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v51;
    double y = CGPointZero.y;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v51 != v25) {
          objc_enumerationMutation(obj);
        }
        v28 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        v29 = [v28 first];
        v30 = [v28 second];
        [v29 bounds];
        double v32 = v31;
        double v34 = v33;
        v35 = +[CRLBezierPathSource pathSourceWithBezierPath:v29];
        if (v15)
        {
          id v36 = [v15 copy];
          if (v32 != CGPointZero.x || v34 != y)
          {
            CGAffineTransformMakeTranslation(&v49, -v32, -v34);
            [v36 transformUsingAffineTransform:&v49];
          }
        }
        else
        {
          id v36 = 0;
        }
        [v30 setAnchorPointForTexture:sub_100064680(v20, v22, v32)];
        v38 = (objc_class *)objc_opt_class();
        v39 = [v47 makeShapeItemForFreehandDrawingWithPathSource:v35 position:v46 stroke:0 fill:v30 pencilKitStrokePathCompactData:v36 maskPath:v32];
        v40 = sub_10024715C(v38, v39);

        [v48 addObject:v40];
      }
      id v24 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v24);
  }

  return v48;
}

+ (id)freehandDrawingShapeItemsFromPKStroke:(id)a3 unadjustedPencilKitBaseWidth:(double)a4 boardItemFactory:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 ink];
  v11 = [v10 inkType];
  +[CRLPencilKitInkStroke adjustedStrokeWidthFromWidth:v11 forInkType:a4];
  double v13 = v12;

  id v14 = [a1 freehandDrawingShapeItemsFromPKStroke:v9 adjustedBaseWidth:v8 boardItemFactory:v13];

  return v14;
}

+ (id)p_bezierAndStrokePathDataSubpathsByClippingBezier:(id)a3 andStrokePathData:(id)a4 toPath:(id)a5
{
  id v35 = a4;
  id v40 = 0;
  v7 = +[CRLBezierPathBooleanOperationHelper linePathWithLinePath:a3 intersectedWithFilledPath:a5 outMapToInputPaths:&v40];
  id v34 = v40;
  id v8 = [v34 elementCount];
  if (v8 != [v7 elementCount])
  {
    int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB440);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066AE4(v9, v10);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CB460);
    }
    v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101066770(v11, v9);
    }
    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBoardItemFactoryObjCHelper p_bezierAndStrokePathDataSubpathsByClippingBezier:andStrokePathData:toPath:]");
    double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLBoardItemFactoryObjCHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 125, 0, "expected equality between %{public}s and %{public}s", "BOOLeanPathMap.elementCount", "clippedPath.elementCount");
  }
  if ([v7 containsElementsOtherThanMoveAndClose])
  {
    id v33 = +[NSMutableArray array];
    id v14 = [v7 rangesOfSubpaths];
    v15 = [v14 crl_arrayOfObjectsPassingTest:&stru_1014CB4A0];

    id v16 = [v15 count];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v17 = v15;
    id v18 = [v17 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (!v18) {
      goto LABEL_25;
    }
    id v19 = v18;
    uint64_t v20 = *(void *)v37;
    while (1)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v36 + 1) + 8 * i) rangeValue];
        if (v16 == (id)1)
        {
          id v24 = v7;
          if (([v24 containsElementsOtherThanMoveAndClose] & 1) == 0) {
            goto LABEL_23;
          }
          id v25 = v34;
        }
        else
        {
          id v26 = v22;
          uint64_t v27 = v23;
          id v24 = [v7 copyWithPointsInRange:v22, v23];
          if (([v24 containsElementsOtherThanMoveAndClose] & 1) == 0) {
            goto LABEL_23;
          }
          id v25 = [v34 copyWithElementsInRange:v26, v27];
        }
        v28 = v25;
        v29 = [a1 p_strokePathCompactData:v35 byTrimmingToMap:v25];
        v30 = +[CRLPair pairWithFirst:v24 second:v29];
        [v33 addObject:v30];

LABEL_23:
      }
      id v19 = [v17 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (!v19)
      {
LABEL_25:

        goto LABEL_27;
      }
    }
  }
  id v33 = &__NSArray0__struct;
LABEL_27:

  return v33;
}

+ (id)p_strokePathCompactData:(id)a3 byTrimmingToMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (uint64_t)[v6 elementCount];
  id v8 = [CRLPKStrokePathCompactData alloc];
  id v9 = [v5 randomSeed];
  id v10 = [v5 creationDate];
  v11 = [(CRLPKStrokePathCompactData *)v8 initWithCapacity:v7 randomSeed:v9 creationDate:v10];

  [v5 renderScaleX];
  -[CRLPKStrokePathCompactData setRenderScaleX:](v11, "setRenderScaleX:");
  [v5 renderScaleY];
  -[CRLPKStrokePathCompactData setRenderScaleY:](v11, "setRenderScaleY:");
  double v12 = [v5 renderGroupID];
  [(CRLPKStrokePathCompactData *)v11 setRenderGroupID:v12];

  -[CRLPKStrokePathCompactData setShouldSolveMath:](v11, "setShouldSolveMath:", [v5 shouldSolveMath]);
  if (v7 >= 1)
  {
    uint64_t v13 = 0;
    double v14 = -1.0;
    do
    {
      double v24 = NAN;
      id v15 = [v6 inputPathIndexForOutputElementIndex:v13 outInputT:&v24];
      uint64_t v16 = vcvtmd_s64_f64(v24);
      if (v15) {
        uint64_t v16 = -1;
      }
      else {
        double v14 = v24;
      }
      BOOL v17 = v14 >= 0.0 && v16 < 0;
      unint64_t v18 = vcvtmd_s64_f64(v14);
      if (v17) {
        uint64_t v19 = v18;
      }
      else {
        uint64_t v19 = v16;
      }
      if (v19 < 0 && v13 + 1 < v7)
      {
        v23[5] = 0x7FF8000000000000;
        id v20 = [v6 inputPathIndexForOutputElementIndex:v20];
        unint64_t v21 = vcvtmd_s64_f64(*(double *)&v23[5]);
        if (!v20) {
          uint64_t v19 = v21;
        }
      }
      memset(&v23[5], 0, 28);
      if (v5) {
        [v5 strokePointCompactDataAtIndex:v19 & ~(v19 >> 63)];
      }
      *(_OWORD *)uint64_t v23 = *(_OWORD *)&v23[5];
      *(_OWORD *)((char *)&v23[1] + 4) = *(_OWORD *)((char *)&v23[6] + 4);
      [(CRLPKStrokePathCompactData *)v11 appendStrokePointCompactData:v23];
      ++v13;
    }
    while (v7 != v13);
  }

  return v11;
}

@end