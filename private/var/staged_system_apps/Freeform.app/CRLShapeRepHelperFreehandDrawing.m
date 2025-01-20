@interface CRLShapeRepHelperFreehandDrawing
- (BOOL)drawsInOneStep;
- (BOOL)hasLegacyFreehandDrawingBrushStroke;
- (CRLShapeRepHelperFreehandDrawing)initWithShapeRep:(id)a3;
- (void)drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 usingPathOverride:(id)a7 patternOffsetsBySubpathOverride:(id)a8 transparencyLayersBySubpath:(id)a9;
@end

@implementation CRLShapeRepHelperFreehandDrawing

- (CRLShapeRepHelperFreehandDrawing)initWithShapeRep:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLShapeRepHelperFreehandDrawing;
  v5 = [(CRLShapeRepHelperFreehandDrawing *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shapeRep, v4);
    v7 = [v4 shapeLayout];
    objc_storeWeak((id *)&v6->_shapeLayout, v7);

    v8 = (objc_class *)objc_opt_class();
    v9 = [v4 shapeInfo];
    v10 = sub_10024715C(v8, v9);
    objc_storeWeak((id *)&v6->_shapeInfo, v10);
  }
  return v6;
}

- (BOOL)drawsInOneStep
{
  return 1;
}

- (BOOL)hasLegacyFreehandDrawingBrushStroke
{
  return 0;
}

- (void)drawInContext:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 usingPathOverride:(id)a7 patternOffsetsBySubpathOverride:(id)a8 transparencyLayersBySubpath:(id)a9
{
  char v9 = a5;
  BOOL v10 = a4;
  CGContextSaveGState(a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shapeRep);
  v14 = [WeakRetained canvas];

  unsigned int v15 = [v14 shouldSuppressBackgrounds];
  if (v15 != sub_1004582B0((uint64_t)a3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FCED8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B7FC8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FCEF8);
    }
    v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v16);
    }
    v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRepHelperFreehandDrawing drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:]");
    v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRepHelperFreehandDrawing.m"];
    +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:77 isFatal:0 description:"Canvas and CGContext disagree about whether we are suppressing backgrounds"];
  }
  p_shapeLayout = &self->_shapeLayout;
  id v20 = objc_loadWeakRetained((id *)p_shapeLayout);
  [v20 pathBounds];
  double v22 = v21;
  double v24 = v23;

  CGContextTranslateCTM(a3, -v22, -v24);
  if (((!v10 | v15) & 1) == 0)
  {
    id v25 = objc_loadWeakRetained((id *)p_shapeLayout);
    v26 = [v25 fill];

    if (v26 && ([v26 isClear] & 1) == 0)
    {
      id v27 = objc_loadWeakRetained((id *)p_shapeLayout);
      id v28 = [v27 path];
      id v29 = [v28 CGPath];

      id v30 = v26;
      if (sub_100457C78((uint64_t)a3))
      {
        v31 = [v30 referenceColor];
        [v31 alphaComponent];
        uint64_t v33 = +[CRLColorFill colorWithWhite:0.0 alpha:v32];

        id v30 = (id)v33;
      }
      [v30 paintPath:v29 inContext:a3];
    }
  }
  id v34 = objc_loadWeakRetained((id *)p_shapeLayout);
  v35 = [v34 stroke];

  if (v35)
  {
    unsigned __int8 v36 = [v35 isNullStroke];
    if ((v9 & 1) != 0 && (v36 & 1) == 0)
    {
      id v37 = objc_loadWeakRetained((id *)p_shapeLayout);
      v38 = [v37 pencilKitStrokes];

      if (v38)
      {
        id v39 = [v14 backgroundColor];
        +[CRLPencilKitInkStroke drawStrokes:v38 inContext:a3 overTransparentCanvas:v39 == 0];
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FCF18);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010B7F18();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014FCF38);
        }
        v40 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010668E0(v40);
        }
        v41 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeRepHelperFreehandDrawing drawInContext:withContent:strokeDrawOptions:withOpacity:usingPathOverride:patternOffsetsBySubpathOverride:transparencyLayersBySubpath:]");
        v42 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeRepHelperFreehandDrawing.m"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v41, v42, 105, 0, "invalid nil value for '%{public}s'", "pencilKitStrokes");

        id v43 = objc_loadWeakRetained((id *)p_shapeLayout);
        v44 = [v43 path];

        id v39 = v44;
        [v35 paintPath:[v39 CGPath] inContext:a3];
      }
    }
  }
  CGContextRestoreGState(a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shapeInfo);
  objc_destroyWeak((id *)&self->_shapeLayout);

  objc_destroyWeak((id *)&self->_shapeRep);
}

@end