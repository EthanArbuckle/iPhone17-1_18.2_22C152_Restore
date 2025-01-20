@interface CRLFreehandDrawingSnapToShapeHelper
- (CRLFreehandDrawingSnapToShapeHelper)initWithInteractiveCanvasController:(id)a3;
- (id)bezierPathsBySnappingOutlineFillBezierPath:(id)a3;
- (id)commandForSnappingShapeItem:(id)a3 toPathsInParentSpace:(id)a4 outCreatedAndModifiedShapes:(id *)a5;
- (id)commandForSnappingShapeItem:(id)a3 toStrokesInUnscaledSpace:(id)a4 outCreatedAndModifiedShapes:(id *)a5;
- (id)p_snapToShapeWithPKStrokes:(id)a3 isBezierPathFromOutlineFill:(BOOL)a4;
- (id)p_strokesByClippingMaskedStrokes:(id)a3;
- (id)p_strokesBySnappingBezierPath:(id)a3 isBezierPathFromOutlineFill:(BOOL)a4 strokePathCompactData:(id)a5 maskPath:(id)a6 stroke:(id)a7;
- (id)unscaledPKStrokesBySnappingShapeItem:(id)a3;
- (int64_t)p_freehandDrawingShapeTypeFromDrawingShapeItem:(id)a3 isShapeItemFromOutlineFill:(BOOL)a4;
@end

@implementation CRLFreehandDrawingSnapToShapeHelper

- (CRLFreehandDrawingSnapToShapeHelper)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLFreehandDrawingSnapToShapeHelper;
  v5 = [(CRLFreehandDrawingSnapToShapeHelper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_icc, v4);
  }

  return v6;
}

- (id)bezierPathsBySnappingOutlineFillBezierPath:(id)a3
{
  v3 = [(CRLFreehandDrawingSnapToShapeHelper *)self p_strokesBySnappingBezierPath:a3 isBezierPathFromOutlineFill:1 strokePathCompactData:0 maskPath:0 stroke:0];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    v5 = +[NSMutableArray array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = +[CRLPKStrokeConverter pathFromPKStroke:pencilKitStrokePathData:](CRLPKStrokeConverter, "pathFromPKStroke:pencilKitStrokePathData:", *(void *)(*((void *)&v13 + 1) + 8 * i), 0, (void)v13);
          [v5 addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)p_strokesBySnappingBezierPath:(id)a3 isBezierPathFromOutlineFill:(BOOL)a4 strokePathCompactData:(id)a5 maskPath:(id)a6 stroke:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  long long v15 = (CRLPencilKitInkStroke *)a7;
  if (!v15)
  {
    long long v16 = [CRLPencilKitInkStroke alloc];
    v17 = +[CRLColor blackColor];
    long long v15 = [(CRLPencilKitInkStroke *)v16 initWithInkType:PKInkTypePen color:v17 adjustedWidth:1.0];
  }
  v18 = +[CRLPKStrokeConverter pencilKitStrokesFromPath:v12 inkStroke:v15 strokePathCompactData:v13 maskPath:v14];
  v19 = [(CRLFreehandDrawingSnapToShapeHelper *)self p_snapToShapeWithPKStrokes:v18 isBezierPathFromOutlineFill:v10];
  if ([v19 count]) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = !v10;
  }
  if (!v20)
  {
    v21 = [v12 pathByNormalizingClosedPathToRemoveSelfIntersections];
    v22 = +[CRLPKStrokeConverter pencilKitStrokesFromPath:v21 inkStroke:v15 strokePathCompactData:v13 maskPath:v14];

    uint64_t v23 = [(CRLFreehandDrawingSnapToShapeHelper *)self p_snapToShapeWithPKStrokes:v22 isBezierPathFromOutlineFill:1];

    v19 = (void *)v23;
  }
  if ([v19 count]) {
    id v24 = v19;
  }
  else {
    id v24 = 0;
  }

  return v24;
}

- (id)p_snapToShapeWithPKStrokes:(id)a3 isBezierPathFromOutlineFill:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[NSMutableArray array];
  p_icc = &self->_icc;
  id WeakRetained = objc_loadWeakRetained((id *)p_icc);

  if (!WeakRetained)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3B90);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108E050();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3BB0);
    }
    BOOL v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v10);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingSnapToShapeHelper p_snapToShapeWithPKStrokes:isBezierPathFromOutlineFill:]");
    id v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingSnapToShapeHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 80, 0, "invalid nil value for '%{public}s'", "_icc");
  }
  id v13 = objc_loadWeakRetained((id *)p_icc);
  [v13 viewScale];
  double v14 = 1.0;
  if (v15 > 0.0)
  {
    id v16 = objc_loadWeakRetained((id *)p_icc);
    [v16 viewScale];
    double v14 = 1.0 / v17;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v6;
  id v18 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v45;
    v21 = &off_1014C1000;
    v22 = &off_1014C1000;
    uint64_t v36 = *(void *)v45;
    v37 = v7;
    do
    {
      uint64_t v23 = 0;
      id v38 = v19;
      do
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(obj);
        }
        id v24 = v21[154];
        uint64_t v49 = *(void *)(*((void *)&v44 + 1) + 8 * (void)v23);
        v25 = [(__objc2_class *)v22[35] arrayWithObjects:&v49 count:1];
        v26 = [(__objc2_class *)v24 _snapToShape:v25 inputScale:v14];

        if (v26)
        {
          if (v4)
          {
            BOOL v27 = v4;
            id v28 = +[NSMutableArray array];
            long long v40 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            id v29 = v26;
            id v30 = [v29 countByEnumeratingWithState:&v40 objects:v48 count:16];
            if (v30)
            {
              id v31 = v30;
              uint64_t v32 = *(void *)v41;
              do
              {
                for (i = 0; i != v31; i = (char *)i + 1)
                {
                  if (*(void *)v41 != v32) {
                    objc_enumerationMutation(v29);
                  }
                  v34 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                  if ([PKShape isFillableForShapeType:[v34 _shapeType]])[v28 addObject:v34];
                }
                  }
                id v31 = [v29 countByEnumeratingWithState:&v40 objects:v48 count:16];
              }
              while (v31);
            }

            BOOL v4 = v27;
            uint64_t v20 = v36;
            id v7 = v37;
            v21 = &off_1014C1000;
            id v19 = v38;
            v22 = &off_1014C1000;
          }
          else
          {
            id v28 = v26;
          }
          [v7 addObjectsFromArray:v28];
        }
        uint64_t v23 = (char *)v23 + 1;
      }
      while (v23 != v19);
      id v19 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v19);
  }

  return v7;
}

- (id)unscaledPKStrokesBySnappingShapeItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 pathSource];
  id v6 = [v5 bezierPath];
  id v7 = [v6 copy];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  uint64_t v9 = [WeakRetained layoutForInfo:v4];

  BOOL v10 = [v9 pureGeometryInRoot];
  v11 = v10;
  if (v10)
  {
    [v10 transform];
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
  }
  [v7 transformUsingAffineTransform:&v21];

  if (v7)
  {
    id v12 = [v4 maskPath];
    id v13 = [v4 pencilKitStrokePathCompactData];
    id v14 = [v4 isTreatedAsFillForFreehandDrawing];
    uint64_t v15 = objc_opt_class();
    id v16 = [v4 stroke];
    double v17 = sub_1002469D0(v15, v16);

    id v18 = [(CRLFreehandDrawingSnapToShapeHelper *)self p_strokesBySnappingBezierPath:v7 isBezierPathFromOutlineFill:v14 strokePathCompactData:v13 maskPath:v12 stroke:v17];
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3BD0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108E100();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E3BF0);
    }
    id v19 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v19);
    }
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingSnapToShapeHelper unscaledPKStrokesBySnappingShapeItem:]", v21, v22, v23);
    id v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingSnapToShapeHelper.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:111 isFatal:0 description:"Expected a valid bezierPath"];
    id v18 = 0;
  }

  return v18;
}

- (id)commandForSnappingShapeItem:(id)a3 toPathsInParentSpace:(id)a4 outCreatedAndModifiedShapes:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [[_TtC8Freeform15CRLCommandGroup alloc] initWithCommands:&__NSArray0__struct];
  BOOL v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Snap to Shape" value:0 table:@"UndoStrings"];
  [(CRLCommandGroup *)v9 setActionString:v11];

  v52 = +[NSMutableArray array];
  id v51 = v8;
  if ([v8 count])
  {
    unint64_t v12 = 0;
    do
    {
      id v13 = [v8 objectAtIndexedSubscript:v12];
      [v13 bounds];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      v53 = v13;
      v55 = +[CRLBezierPathSource pathSourceWithBezierPath:v13];
      if (v12)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
        long long v23 = [WeakRetained editingCoordinator];
        [v23 boardItemFactory];
        id v24 = v7;
        v25 = (CRLCanvasInfoGeometry *)objc_claimAutoreleasedReturnValue();

        v26 = (objc_class *)objc_opt_class();
        BOOL v27 = [v24 stroke];
        id v28 = [v24 fill];
        v54 = v25;
        id v29 = -[CRLCanvasInfoGeometry makeShapeItemForFreehandDrawingWithPathSource:position:stroke:fill:pencilKitStrokePathCompactData:maskPath:](v25, "makeShapeItemForFreehandDrawingWithPathSource:position:stroke:fill:pencilKitStrokePathCompactData:maskPath:", v55, v27, v28, 0, 0, v15, v17);
        sub_10024715C(v26, v29);
        id v30 = (_TtC8Freeform25CRLCommandSetInfoGeometry *)objc_claimAutoreleasedReturnValue();

        id v7 = v24;
        id v8 = v51;

        [v52 addObject:v30];
      }
      else
      {
        v54 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v15, v17, v19, v21);
        id v30 = [[_TtC8Freeform25CRLCommandSetInfoGeometry alloc] initWithBoardItem:v7 geometry:v54];
        [(CRLCommandGroup *)v9 addCommand:v30];
        id v31 = [[_TtC8Freeform23CRLCommandSetPathSource alloc] initWithShapeItem:v7 pathSource:v55];
        [(CRLCommandGroup *)v9 addCommand:v31];
        uint64_t v32 = [[_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType alloc] initWithFreehandDrawingShapeItem:v7 snappedShapeType:[(CRLFreehandDrawingSnapToShapeHelper *)self p_freehandDrawingShapeTypeFromDrawingShapeItem:v7 isShapeItemFromOutlineFill:1]];
        [(CRLCommandGroup *)v9 addCommand:v32];
      }
      ++v12;
    }
    while (v12 < (unint64_t)[v8 count]);
  }
  v33 = v52;
  if ([v52 count])
  {
    v34 = [v7 containingGroup];
    v35 = [v34 childInfos];
    uint64_t v36 = (char *)[v35 indexOfObject:v7];

    id v49 = v7;
    if (v36 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v37 = [v34 childInfos];
      id v38 = [v37 count];
    }
    else
    {
      id v38 = v36 + 1;
    }
    v56 = [[_TtC8Freeform26CRLCommandInsertBoardItems alloc] initWithParentContainer:v34 boardItems:v52 index:v38];
    -[CRLCommandGroup addCommand:](v9, "addCommand:");
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v39 = v52;
    id v40 = [v39 countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v58;
      do
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v58 != v42) {
            objc_enumerationMutation(v39);
          }
          long long v44 = -[CRLCommandSetFreehandDrawingShapeItemSnappedShapeType initWithFreehandDrawingShapeItem:snappedShapeType:]([_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType alloc], "initWithFreehandDrawingShapeItem:snappedShapeType:", *(void *)(*((void *)&v57 + 1) + 8 * i), -[CRLFreehandDrawingSnapToShapeHelper p_freehandDrawingShapeTypeFromDrawingShapeItem:isShapeItemFromOutlineFill:](self, "p_freehandDrawingShapeTypeFromDrawingShapeItem:isShapeItemFromOutlineFill:", *(void *)(*((void *)&v57 + 1) + 8 * i), 1, v49));
          [(CRLCommandGroup *)v9 addCommand:v44];
        }
        id v41 = [v39 countByEnumeratingWithState:&v57 objects:v61 count:16];
      }
      while (v41);
    }

    id v7 = v49;
    id v8 = v51;
    v33 = v52;
  }
  if (a5)
  {
    long long v45 = +[NSMutableArray array];
    [v45 addObject:v7];
    [v45 addObjectsFromArray:v33];
    long long v46 = v45;
    id v8 = v51;
    id v47 = v46;
    *a5 = v47;
  }

  return v9;
}

- (id)commandForSnappingShapeItem:(id)a3 toStrokesInUnscaledSpace:(id)a4 outCreatedAndModifiedShapes:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [[_TtC8Freeform15CRLCommandGroup alloc] initWithCommands:&__NSArray0__struct];
  BOOL v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Snap to Shape" value:0 table:@"UndoStrings"];
  v63 = v9;
  [(CRLCommandGroup *)v9 setActionString:v11];

  v61 = +[NSMutableArray array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  id v13 = [WeakRetained editingCoordinator];
  long long v58 = [v13 boardItemFactory];

  double v14 = (objc_class *)objc_opt_class();
  double v15 = [v7 parentInfo];
  uint64_t v16 = sub_10024715C(v14, v15);

  id v17 = objc_loadWeakRetained((id *)&self->_icc);
  v55 = (void *)v16;
  double v18 = [v17 layoutForInfo:v16];

  double v19 = [CRLCanvasInfoGeometry alloc];
  v52 = v18;
  double v20 = [v18 geometryInRoot];
  double v21 = [(CRLCanvasInfoGeometry *)v19 initWithLayoutGeometry:v20];

  v62 = self;
  v54 = v8;
  [(CRLFreehandDrawingSnapToShapeHelper *)self p_strokesByClippingMaskedStrokes:v8];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v59 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
  if (v59)
  {
    uint64_t v57 = *(void *)v73;
    char v22 = 1;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v73 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v60 = v23;
        uint64_t v24 = *(void *)(*((void *)&v72 + 1) + 8 * v23);
        v25 = [v7 stroke];
        [v25 width];
        v26 = [v58 makeShapeItemsForFreehandDrawingWithPKStroke:v24];

        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v27 = v26;
        id v28 = [v27 countByEnumeratingWithState:&v68 objects:v77 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v69;
          char v31 = v22;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v69 != v30) {
                objc_enumerationMutation(v27);
              }
              v33 = *(void **)(*((void *)&v68 + 1) + 8 * i);
              v34 = [v33 geometry];
              v35 = [v34 geometryRelativeToGeometry:v21];
              [v33 setGeometry:v35];

              if (v31)
              {
                uint64_t v36 = [v7 commandsToUpdateModelToMatch:v33];
                [(CRLCommandGroup *)v63 addCommand:v36];

                v37 = [[_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType alloc] initWithFreehandDrawingShapeItem:v7 snappedShapeType:[(CRLFreehandDrawingSnapToShapeHelper *)v62 p_freehandDrawingShapeTypeFromDrawingShapeItem:v7 isShapeItemFromOutlineFill:0]];
                [(CRLCommandGroup *)v63 addCommand:v37];
              }
              else
              {
                [v61 addObject:v33];
              }
              char v31 = 0;
            }
            id v29 = [v27 countByEnumeratingWithState:&v68 objects:v77 count:16];
            char v31 = 0;
            char v22 = 0;
          }
          while (v29);
        }

        uint64_t v23 = v60 + 1;
      }
      while ((id)(v60 + 1) != v59);
      id v59 = [obj countByEnumeratingWithState:&v72 objects:v78 count:16];
    }
    while (v59);
  }
  if ([v61 count])
  {
    id v38 = [v55 childInfos];
    id v39 = (char *)[v38 indexOfObject:v7];

    if (v39 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      id v40 = [v55 childInfos];
      id v41 = [v40 count];
    }
    else
    {
      id v41 = v39 + 1;
    }
    uint64_t v42 = [[_TtC8Freeform26CRLCommandInsertBoardItems alloc] initWithParentContainer:v55 boardItems:v61 index:v41];
    [(CRLCommandGroup *)v63 addCommand:v42];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    id v43 = v61;
    id v44 = [v43 countByEnumeratingWithState:&v64 objects:v76 count:16];
    if (v44)
    {
      id v45 = v44;
      uint64_t v46 = *(void *)v65;
      do
      {
        for (j = 0; j != v45; j = (char *)j + 1)
        {
          if (*(void *)v65 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = [[_TtC8Freeform53CRLCommandSetFreehandDrawingShapeItemSnappedShapeType alloc] initWithFreehandDrawingShapeItem:*(void *)(*((void *)&v64 + 1) + 8 * (void)j) snappedShapeType:[(CRLFreehandDrawingSnapToShapeHelper *)v62 p_freehandDrawingShapeTypeFromDrawingShapeItem:*(void *)(*((void *)&v64 + 1) + 8 * (void)j) isShapeItemFromOutlineFill:0]];
          [(CRLCommandGroup *)v63 addCommand:v48];
        }
        id v45 = [v43 countByEnumeratingWithState:&v64 objects:v76 count:16];
      }
      while (v45);
    }
  }
  if (a5)
  {
    id v49 = +[NSMutableArray array];
    [v49 addObject:v7];
    [v49 addObjectsFromArray:v61];
    id v50 = v49;
    *a5 = v50;
  }

  return v63;
}

- (id)p_strokesByClippingMaskedStrokes:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v10 _isMaskedStroke])
        {
          id v11 = objc_alloc((Class)PKDrawing);
          id v29 = v10;
          unint64_t v12 = +[NSArray arrayWithObjects:&v29 count:1];
          id v13 = [v11 initWithStrokes:v12];

          [v13 _clipMaskedStrokes];
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          double v14 = [v13 strokes];
          id v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v21;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v21 != v17) {
                  objc_enumerationMutation(v14);
                }
                [v4 addObject:*(void *)(*((void *)&v20 + 1) + 8 * (void)j)];
              }
              id v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v16);
          }
        }
        else
        {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v7);
  }

  return v4;
}

- (int64_t)p_freehandDrawingShapeTypeFromDrawingShapeItem:(id)a3 isShapeItemFromOutlineFill:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 pathSource];
  uint64_t v8 = [v7 bezierPath];
  uint64_t v9 = [v6 pencilKitStrokePathCompactData];
  BOOL v10 = [v6 maskPath];

  id v11 = [(CRLFreehandDrawingSnapToShapeHelper *)self p_strokesBySnappingBezierPath:v8 isBezierPathFromOutlineFill:v4 strokePathCompactData:v9 maskPath:v10 stroke:0];

  if (v11 && [v11 count])
  {
    unint64_t v12 = [v11 firstObject];
    id v13 = [v12 _shapeType];
    if ((unint64_t)v13 >= 0xD)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E3C10);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108E194();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E3C30);
      }
      double v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v14);
      }
      id v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingSnapToShapeHelper p_freehandDrawingShapeTypeFromDrawingShapeItem:isShapeItemFromOutlineFill:]");
      id v16 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingSnapToShapeHelper.m"];
      +[CRLAssertionHandler handleFailureInFunction:v15 file:v16 lineNumber:307 isFatal:0 description:"Unknown pk shape type"];

      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return (int64_t)v13;
}

- (void).cxx_destruct
{
}

@end