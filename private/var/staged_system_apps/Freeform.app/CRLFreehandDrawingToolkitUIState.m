@interface CRLFreehandDrawingToolkitUIState
- (BOOL)eraserToolErasesWholeObjects;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFreehandDrawingToolkitUIState:(id)a3;
- (BOOL)shouldDefaultToToolType:(unint64_t)a3;
- (BOOL)shouldRestoreToolType:(unint64_t)a3;
- (CRLFreehandDrawingToolkitUIState)init;
- (double)opacityForToolType:(unint64_t)a3;
- (double)p_defaultStrokeWidthForToolType:(unint64_t)a3;
- (double)strokeWidthForToolType:(unint64_t)a3;
- (id)colorForToolType:(unint64_t)a3;
- (id)copy;
- (id)currentToolForInteractiveCanvasController:(id)a3 pencilKitCanvasViewController:(id)a4;
- (id)p_defaultColorForToolType:(unint64_t)a3;
- (id)strokeWidthsForFreehandDrawingToolType:(unint64_t)a3;
- (int64_t)strokeWidthIndexForToolType:(unint64_t)a3;
- (unint64_t)currentLassoType;
- (unint64_t)currentToolType;
- (unint64_t)hash;
- (unint64_t)mostRecentRestorableToolType;
- (unint64_t)p_defaultLassoType;
- (unint64_t)p_defaultToolType;
- (unint64_t)p_indexOfDefaultStrokeWidthForFreehandDrawingToolType:(unint64_t)a3;
- (void)p_setDefaultLassoType:(unint64_t)a3;
- (void)p_setDefaultToolType:(unint64_t)a3;
- (void)p_setupDefaultValues;
- (void)setColor:(id)a3 forToolType:(unint64_t)a4;
- (void)setCurrentLassoType:(unint64_t)a3;
- (void)setCurrentToolColor:(id)a3;
- (void)setCurrentToolOpacity:(double)a3;
- (void)setCurrentToolType:(unint64_t)a3;
- (void)setCurrentToolWidth:(double)a3;
- (void)setEraserToolErasesWholeObjects:(BOOL)a3;
- (void)setOpacity:(double)a3 forToolType:(unint64_t)a4;
- (void)setStrokeWidth:(double)a3 forToolType:(unint64_t)a4;
@end

@implementation CRLFreehandDrawingToolkitUIState

- (CRLFreehandDrawingToolkitUIState)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingToolkitUIState;
  v2 = [(CRLFreehandDrawingToolkitUIState *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CRLFreehandDrawingToolkitUIState *)v2 p_setupDefaultValues];
  }
  return v3;
}

- (void)p_setupDefaultValues
{
  unint64_t v3 = [(CRLFreehandDrawingToolkitUIState *)self p_defaultToolType];
  self->_currentToolType = v3;
  self->_mostRecentRestorableToolType = v3;
  self->_monolineToolOpacity = 1.0;
  [(CRLFreehandDrawingToolkitUIState *)self p_defaultStrokeWidthForToolType:0];
  self->_monolineToolUnscaledWidth = v4;
  self->_penToolOpacity = 1.0;
  [(CRLFreehandDrawingToolkitUIState *)self p_defaultStrokeWidthForToolType:1];
  self->_penToolUnscaledWidth = v5;
  self->_pencilToolOpacity = 0.5;
  [(CRLFreehandDrawingToolkitUIState *)self p_defaultStrokeWidthForToolType:2];
  self->_pencilToolUnscaledWidth = v6;
  self->_crayonToolOpacity = 1.0;
  [(CRLFreehandDrawingToolkitUIState *)self p_defaultStrokeWidthForToolType:3];
  self->_crayonToolUnscaledWidth = v7;
  self->_watercolorToolOpacity = 1.0;
  [(CRLFreehandDrawingToolkitUIState *)self p_defaultStrokeWidthForToolType:4];
  self->_watercolorToolUnscaledWidth = v8;
  self->_fountainPenToolOpacity = 1.0;
  [(CRLFreehandDrawingToolkitUIState *)self p_defaultStrokeWidthForToolType:5];
  self->_fountainPenToolUnscaledWidth = v9;
  self->_markerToolOpacity = 0.800000012;
  [(CRLFreehandDrawingToolkitUIState *)self p_defaultStrokeWidthForToolType:6];
  self->_markerToolUnscaledWidth = v10;
  self->_fillToolOpacity = 1.0;
  [(CRLFreehandDrawingToolkitUIState *)self p_defaultStrokeWidthForToolType:8];
  self->_eraserToolScaledWidth = v11;
  self->_eraserToolErasesWholeObjects = 0;
  self->_currentLassoType = [(CRLFreehandDrawingToolkitUIState *)self p_defaultLassoType];
  v12 = [(CRLFreehandDrawingToolkitUIState *)self p_defaultColorForToolType:0];
  [(CRLFreehandDrawingToolkitUIState *)self setColor:v12 forToolType:0];

  v13 = [(CRLFreehandDrawingToolkitUIState *)self p_defaultColorForToolType:1];
  [(CRLFreehandDrawingToolkitUIState *)self setColor:v13 forToolType:1];

  v14 = [(CRLFreehandDrawingToolkitUIState *)self p_defaultColorForToolType:2];
  [(CRLFreehandDrawingToolkitUIState *)self setColor:v14 forToolType:2];

  v15 = [(CRLFreehandDrawingToolkitUIState *)self p_defaultColorForToolType:3];
  [(CRLFreehandDrawingToolkitUIState *)self setColor:v15 forToolType:3];

  v16 = [(CRLFreehandDrawingToolkitUIState *)self p_defaultColorForToolType:4];
  [(CRLFreehandDrawingToolkitUIState *)self setColor:v16 forToolType:4];

  v17 = [(CRLFreehandDrawingToolkitUIState *)self p_defaultColorForToolType:5];
  [(CRLFreehandDrawingToolkitUIState *)self setColor:v17 forToolType:5];

  v18 = [(CRLFreehandDrawingToolkitUIState *)self p_defaultColorForToolType:6];
  [(CRLFreehandDrawingToolkitUIState *)self setColor:v18 forToolType:6];

  id v19 = [(CRLFreehandDrawingToolkitUIState *)self p_defaultColorForToolType:7];
  [(CRLFreehandDrawingToolkitUIState *)self setColor:v19 forToolType:7];
}

- (id)p_defaultColorForToolType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
    case 4uLL:
    case 5uLL:
      double v4 = +[CRLColor blackColor];
      break;
    case 2uLL:
      double v4 = +[CRLColor pencilTrayBlueColor];
      break;
    case 3uLL:
      double v4 = +[CRLColor pencilTrayRedColor];
      break;
    case 6uLL:
    case 7uLL:
      double v4 = +[CRLColor pencilTrayYellowColor];
      break;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8720);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107C918();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8740);
      }
      double v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      double v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState p_defaultColorForToolType:]");
      double v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 139, 0, "Tool type %lu does not support color", a3);

      double v4 = 0;
      break;
  }

  return v4;
}

- (double)p_defaultStrokeWidthForToolType:(unint64_t)a3
{
  unint64_t v5 = -[CRLFreehandDrawingToolkitUIState p_indexOfDefaultStrokeWidthForFreehandDrawingToolType:](self, "p_indexOfDefaultStrokeWidthForFreehandDrawingToolType:");
  double v6 = [(CRLFreehandDrawingToolkitUIState *)self strokeWidthsForFreehandDrawingToolType:a3];
  if (v5 >= (unint64_t)[v6 count])
  {
    unsigned int v7 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D8760);
    }
    double v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      unsigned int v17 = v7;
      __int16 v18 = 2082;
      id v19 = "-[CRLFreehandDrawingToolkitUIState p_defaultStrokeWidthForToolType:]";
      __int16 v20 = 2082;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m";
      __int16 v22 = 1024;
      int v23 = 149;
      __int16 v24 = 2048;
      unint64_t v25 = v5 + 1;
      __int16 v26 = 2048;
      unint64_t v27 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The app delegate must provide at least %lu widths for tool type: %lu", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D8780);
    }
    double v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    double v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState p_defaultStrokeWidthForToolType:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 149, 0, "The app delegate must provide at least %lu widths for tool type: %lu", v5 + 1, a3);
  }
  v12 = [v6 objectAtIndexedSubscript:v5];
  [v12 floatValue];
  float v14 = v13;

  return v14;
}

- (id)strokeWidthsForFreehandDrawingToolType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id result = &off_10155C1D0;
      break;
    case 1uLL:
      id result = &off_10155C248;
      break;
    case 2uLL:
      id result = &off_10155C1E8;
      break;
    case 3uLL:
      id result = &off_10155C200;
      break;
    case 4uLL:
      id result = &off_10155C218;
      break;
    case 5uLL:
      id result = &off_10155C230;
      break;
    case 6uLL:
      id result = &off_10155C260;
      break;
    case 7uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D87A0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107C9A0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D87C0);
      }
      double v4 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v4);
      }
      unint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState strokeWidthsForFreehandDrawingToolType:]");
      double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 183, 0, "Unknown tool type %lu when generating stroke widths.", a3);

      id result = &__NSArray0__struct;
      break;
    case 8uLL:
      id result = &off_10155C278;
      break;
    default:
      id result = &__NSArray0__struct;
      break;
  }
  return result;
}

- (BOOL)isEqualToFreehandDrawingToolkitUIState:(id)a3
{
  double v4 = (unsigned __int8 *)a3;
  if (*(_OWORD *)&self->_currentToolType != *((_OWORD *)v4 + 13)) {
    goto LABEL_52;
  }
  monolineToolColor = self->_monolineToolColor;
  if ((unint64_t)monolineToolColor | *((void *)v4 + 1))
  {
    if (!-[CRLColor isEqual:](monolineToolColor, "isEqual:")) {
      goto LABEL_52;
    }
  }
  double monolineToolOpacity = self->_monolineToolOpacity;
  double v7 = *((double *)v4 + 2);
  if (monolineToolOpacity != v7 && vabdd_f64(monolineToolOpacity, v7) >= fabs(v7 * 0.000000999999997)) {
    goto LABEL_52;
  }
  double monolineToolUnscaledWidth = self->_monolineToolUnscaledWidth;
  double v9 = *((double *)v4 + 3);
  if (monolineToolUnscaledWidth != v9 && vabdd_f64(monolineToolUnscaledWidth, v9) >= fabs(v9 * 0.000000999999997)) {
    goto LABEL_52;
  }
  penToolColor = self->_penToolColor;
  if ((unint64_t)penToolColor | *((void *)v4 + 4) && !-[CRLColor isEqual:](penToolColor, "isEqual:")) {
    goto LABEL_52;
  }
  double penToolOpacity = self->_penToolOpacity;
  double v12 = *((double *)v4 + 5);
  if (penToolOpacity != v12 && vabdd_f64(penToolOpacity, v12) >= fabs(v12 * 0.000000999999997)) {
    goto LABEL_52;
  }
  double penToolUnscaledWidth = self->_penToolUnscaledWidth;
  double v14 = *((double *)v4 + 6);
  if (penToolUnscaledWidth != v14 && vabdd_f64(penToolUnscaledWidth, v14) >= fabs(v14 * 0.000000999999997)) {
    goto LABEL_52;
  }
  pencilToolColor = self->_pencilToolColor;
  if ((unint64_t)pencilToolColor | *((void *)v4 + 7) && !-[CRLColor isEqual:](pencilToolColor, "isEqual:")) {
    goto LABEL_52;
  }
  double pencilToolOpacity = self->_pencilToolOpacity;
  double v17 = *((double *)v4 + 8);
  if (pencilToolOpacity != v17 && vabdd_f64(pencilToolOpacity, v17) >= fabs(v17 * 0.000000999999997)) {
    goto LABEL_52;
  }
  double pencilToolUnscaledWidth = self->_pencilToolUnscaledWidth;
  double v19 = *((double *)v4 + 9);
  if (pencilToolUnscaledWidth != v19 && vabdd_f64(pencilToolUnscaledWidth, v19) >= fabs(v19 * 0.000000999999997)) {
    goto LABEL_52;
  }
  crayonToolColor = self->_crayonToolColor;
  if ((unint64_t)crayonToolColor | *((void *)v4 + 10) && !-[CRLColor isEqual:](crayonToolColor, "isEqual:")) {
    goto LABEL_52;
  }
  double crayonToolOpacity = self->_crayonToolOpacity;
  double v22 = *((double *)v4 + 11);
  if (crayonToolOpacity != v22 && vabdd_f64(crayonToolOpacity, v22) >= fabs(v22 * 0.000000999999997)) {
    goto LABEL_52;
  }
  double crayonToolUnscaledWidth = self->_crayonToolUnscaledWidth;
  double v24 = *((double *)v4 + 12);
  if (crayonToolUnscaledWidth != v24 && vabdd_f64(crayonToolUnscaledWidth, v24) >= fabs(v24 * 0.000000999999997)) {
    goto LABEL_52;
  }
  watercolorToolColor = self->_watercolorToolColor;
  if ((unint64_t)watercolorToolColor | *((void *)v4 + 13)
    && !-[CRLColor isEqual:](watercolorToolColor, "isEqual:"))
  {
    goto LABEL_52;
  }
  double watercolorToolOpacity = self->_watercolorToolOpacity;
  double v27 = *((double *)v4 + 14);
  if (watercolorToolOpacity != v27 && vabdd_f64(watercolorToolOpacity, v27) >= fabs(v27 * 0.000000999999997)) {
    goto LABEL_52;
  }
  double watercolorToolUnscaledWidth = self->_watercolorToolUnscaledWidth;
  double v29 = *((double *)v4 + 15);
  if (watercolorToolUnscaledWidth != v29
    && vabdd_f64(watercolorToolUnscaledWidth, v29) >= fabs(v29 * 0.000000999999997))
  {
    goto LABEL_52;
  }
  fountainPenToolColor = self->_fountainPenToolColor;
  if ((unint64_t)fountainPenToolColor | *((void *)v4 + 16)
    && !-[CRLColor isEqual:](fountainPenToolColor, "isEqual:"))
  {
    goto LABEL_52;
  }
  double fountainPenToolOpacity = self->_fountainPenToolOpacity;
  double v32 = *((double *)v4 + 17);
  if (fountainPenToolOpacity != v32 && vabdd_f64(fountainPenToolOpacity, v32) >= fabs(v32 * 0.000000999999997)) {
    goto LABEL_52;
  }
  double fountainPenToolUnscaledWidth = self->_fountainPenToolUnscaledWidth;
  double v34 = *((double *)v4 + 18);
  if (fountainPenToolUnscaledWidth != v34
    && vabdd_f64(fountainPenToolUnscaledWidth, v34) >= fabs(v34 * 0.000000999999997))
  {
    goto LABEL_52;
  }
  markerToolColor = self->_markerToolColor;
  if ((unint64_t)markerToolColor | *((void *)v4 + 19) && !-[CRLColor isEqual:](markerToolColor, "isEqual:")) {
    goto LABEL_52;
  }
  double markerToolOpacity = self->_markerToolOpacity;
  double v37 = *((double *)v4 + 20);
  if (markerToolOpacity != v37 && vabdd_f64(markerToolOpacity, v37) >= fabs(v37 * 0.000000999999997)) {
    goto LABEL_52;
  }
  if (((double markerToolUnscaledWidth = self->_markerToolUnscaledWidth,
         double v39 = *((double *)v4 + 21),
         markerToolUnscaledWidth == v39)
     || vabdd_f64(markerToolUnscaledWidth, v39) < fabs(v39 * 0.000000999999997))
    && ((fillToolColor = self->_fillToolColor, !((unint64_t)fillToolColor | *((void *)v4 + 22)))
     || -[CRLColor isEqual:](fillToolColor, "isEqual:"))
    && ((double fillToolOpacity = self->_fillToolOpacity, v42 = *((double *)v4 + 23), fillToolOpacity == v42)
     || vabdd_f64(fillToolOpacity, v42) < fabs(v42 * 0.000000999999997))
    && ((double eraserToolScaledWidth = self->_eraserToolScaledWidth, v44 = *((double *)v4 + 24), eraserToolScaledWidth == v44)
     || vabdd_f64(eraserToolScaledWidth, v44) < fabs(v44 * 0.000000999999997))
    && self->_eraserToolErasesWholeObjects == v4[200])
  {
    BOOL v45 = self->_currentLassoType == *((void *)v4 + 28);
  }
  else
  {
LABEL_52:
    BOOL v45 = 0;
  }

  return v45;
}

- (unint64_t)p_indexOfDefaultStrokeWidthForFreehandDrawingToolType:(unint64_t)a3
{
  unint64_t v3 = a3;
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      return v3;
    case 2uLL:
    case 8uLL:
      unint64_t v3 = 0;
      break;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      unint64_t v3 = 2;
      break;
    case 6uLL:
      unint64_t v3 = 1;
      break;
    case 7uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D87E0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107CA28();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8800);
      }
      double v4 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v4);
      }
      unint64_t v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState p_indexOfDefaultStrokeWidthForFreehandDrawingToolType:]");
      double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 262, 0, "Unknown tool type %lu when generating stroke widths.", v3);

      goto LABEL_13;
    default:
LABEL_13:
      unint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }
  return v3;
}

- (unint64_t)p_defaultToolType
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unint64_t v3 = [v2 objectForKey:@"CRLFreehandDrawingToolkitUIStateDefaultToolKey"];

  if (v3)
  {
    double v4 = (objc_class *)objc_opt_class();
    unint64_t v5 = [v2 objectForKey:@"CRLFreehandDrawingToolkitUIStateDefaultToolKey"];
    double v6 = sub_10024715C(v4, v5);

    unint64_t v7 = (unint64_t)[v6 unsignedIntegerValue];
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

- (unint64_t)p_defaultLassoType
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"CRLFreehandDrawingToolkitUIStateDefaultLassoTypeKey"];

  if (v3)
  {
    double v4 = (objc_class *)objc_opt_class();
    unint64_t v5 = [v2 objectForKey:@"CRLFreehandDrawingToolkitUIStateDefaultLassoTypeKey"];
    double v6 = sub_10024715C(v4, v5);

    id v3 = [v6 unsignedIntegerValue];
  }

  return (unint64_t)v3;
}

- (void)p_setDefaultToolType:(unint64_t)a3
{
  id v5 = +[NSUserDefaults standardUserDefaults];
  double v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"CRLFreehandDrawingToolkitUIStateDefaultToolKey"];
}

- (void)p_setDefaultLassoType:(unint64_t)a3
{
  id v5 = +[NSUserDefaults standardUserDefaults];
  double v4 = +[NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKey:@"CRLFreehandDrawingToolkitUIStateDefaultLassoTypeKey"];
}

- (void)setCurrentToolType:(unint64_t)a3
{
  if (self->_currentToolType != a3)
  {
    if (-[CRLFreehandDrawingToolkitUIState shouldRestoreToolType:](self, "shouldRestoreToolType:")) {
      self->_mostRecentRestorableToolType = a3;
    }
    if ([(CRLFreehandDrawingToolkitUIState *)self shouldDefaultToToolType:a3]) {
      [(CRLFreehandDrawingToolkitUIState *)self p_setDefaultToolType:a3];
    }
    self->_currentToolType = a3;
  }
}

- (BOOL)shouldRestoreToolType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 8;
}

- (BOOL)shouldDefaultToToolType:(unint64_t)a3
{
  return 1;
}

- (void)setCurrentLassoType:(unint64_t)a3
{
  if (self->_currentLassoType != a3)
  {
    self->_currentLassoType = a3;
    -[CRLFreehandDrawingToolkitUIState p_setDefaultLassoType:](self, "p_setDefaultLassoType:");
  }
}

- (void)setCurrentToolColor:(id)a3
{
}

- (void)setCurrentToolOpacity:(double)a3
{
}

- (void)setCurrentToolWidth:(double)a3
{
}

- (id)currentToolForInteractiveCanvasController:(id)a3 pencilKitCanvasViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(self->_currentToolType)
  {
    case 0uLL:
      double v8 = [CRLFreehandDrawingToolStroke alloc];
      unint64_t currentToolType = self->_currentToolType;
      double monolineToolOpacity = self->_monolineToolOpacity;
      double monolineToolUnscaledWidth = self->_monolineToolUnscaledWidth;
      goto LABEL_10;
    case 1uLL:
      double v8 = [CRLFreehandDrawingToolStroke alloc];
      unint64_t currentToolType = self->_currentToolType;
      double monolineToolOpacity = self->_penToolOpacity;
      double monolineToolUnscaledWidth = self->_penToolUnscaledWidth;
      goto LABEL_10;
    case 2uLL:
      double v8 = [CRLFreehandDrawingToolStroke alloc];
      unint64_t currentToolType = self->_currentToolType;
      double monolineToolOpacity = self->_pencilToolOpacity;
      double monolineToolUnscaledWidth = self->_pencilToolUnscaledWidth;
      goto LABEL_10;
    case 3uLL:
      double v8 = [CRLFreehandDrawingToolStroke alloc];
      unint64_t currentToolType = self->_currentToolType;
      double monolineToolOpacity = self->_crayonToolOpacity;
      double monolineToolUnscaledWidth = self->_crayonToolUnscaledWidth;
      goto LABEL_10;
    case 4uLL:
      double v8 = [CRLFreehandDrawingToolStroke alloc];
      unint64_t currentToolType = self->_currentToolType;
      double monolineToolOpacity = self->_watercolorToolOpacity;
      double monolineToolUnscaledWidth = self->_watercolorToolUnscaledWidth;
      goto LABEL_10;
    case 5uLL:
      double v8 = [CRLFreehandDrawingToolStroke alloc];
      unint64_t currentToolType = self->_currentToolType;
      double monolineToolOpacity = self->_fountainPenToolOpacity;
      double monolineToolUnscaledWidth = self->_fountainPenToolUnscaledWidth;
      goto LABEL_10;
    case 6uLL:
      double v8 = [CRLFreehandDrawingToolStroke alloc];
      unint64_t currentToolType = self->_currentToolType;
      double monolineToolOpacity = self->_markerToolOpacity;
      double monolineToolUnscaledWidth = self->_markerToolUnscaledWidth;
LABEL_10:
      float v13 = [(CRLFreehandDrawingToolStroke *)v8 initWithInteractiveCanvasController:v6 pencilKitCanvasViewController:v7 strokeToolType:currentToolType opacity:monolineToolOpacity unscaledWidth:monolineToolUnscaledWidth];
      goto LABEL_11;
    case 7uLL:
      float v13 = [[CRLFreehandDrawingToolFillAndLegacyStroke alloc] initWithInteractiveCanvasController:v6 pencilKitCanvasViewController:v7 insertionToolType:self->_currentToolType opacity:self->_fillToolOpacity unscaledWidth:0.0];
      goto LABEL_11;
    case 8uLL:
      if (self->_eraserToolErasesWholeObjects) {
        float v13 = [[CRLFreehandDrawingToolEraser alloc] initWithInteractiveCanvasController:v6 scaledWidthForSlicingEraser:self->_eraserToolErasesWholeObjects wholeObject:self->_eraserToolScaledWidth];
      }
      else {
        float v13 = [[CRLFreehandDrawingToolPixelEraser alloc] initWithInteractiveCanvasController:v6 pencilKitCanvasViewController:v7 scaledWidthForSlicingEraser:self->_eraserToolScaledWidth];
      }
      goto LABEL_11;
    case 9uLL:
      float v13 = [[CRLFreehandDrawingToolMarquee alloc] initWithInteractiveCanvasController:v6];
LABEL_11:
      double v12 = v13;
      break;
    default:
      double v12 = 0;
      break;
  }

  return v12;
}

- (id)colorForToolType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      monolineToolColor = self->_monolineToolColor;
      goto LABEL_22;
    case 1uLL:
      monolineToolColor = self->_penToolColor;
      goto LABEL_22;
    case 2uLL:
      monolineToolColor = self->_pencilToolColor;
      goto LABEL_22;
    case 3uLL:
      monolineToolColor = self->_crayonToolColor;
      goto LABEL_22;
    case 4uLL:
      monolineToolColor = self->_watercolorToolColor;
      goto LABEL_22;
    case 5uLL:
      monolineToolColor = self->_fountainPenToolColor;
      goto LABEL_22;
    case 6uLL:
      monolineToolColor = self->_markerToolColor;
      goto LABEL_22;
    case 7uLL:
      monolineToolColor = self->_fillToolColor;
LABEL_22:
      double v8 = monolineToolColor;
      goto LABEL_23;
    case 8uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8820);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107CAB0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8840);
      }
      id v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState colorForToolType:]");
      id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 469, 0, "Cannot get color for current tool (%zd)", self->_currentToolType);

      double v8 = +[CRLColor clearColor];
LABEL_23:
      break;
    default:
      double v8 = 0;
      break;
  }
  return v8;
}

- (double)opacityForToolType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      double result = self->_monolineToolOpacity;
      break;
    case 1uLL:
      double result = self->_penToolOpacity;
      break;
    case 2uLL:
      double result = self->_pencilToolOpacity;
      break;
    case 3uLL:
      double result = self->_crayonToolOpacity;
      break;
    case 4uLL:
      double result = self->_watercolorToolOpacity;
      break;
    case 5uLL:
      double result = self->_fountainPenToolOpacity;
      break;
    case 6uLL:
      double result = self->_markerToolOpacity;
      break;
    case 7uLL:
      double result = self->_fillToolOpacity;
      break;
    case 8uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8860);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107CB38();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8880);
      }
      double v4 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v4);
      }
      id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState opacityForToolType:]");
      id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 507, 0, "Cannot get opacity for current tool (%zd)", self->_currentToolType);

      double result = 0.0;
      break;
    default:
      double result = 1.0;
      break;
  }
  return result;
}

- (double)strokeWidthForToolType:(unint64_t)a3
{
  double monolineToolUnscaledWidth = 0.0;
  switch(a3)
  {
    case 0uLL:
      double monolineToolUnscaledWidth = self->_monolineToolUnscaledWidth;
      break;
    case 1uLL:
      double monolineToolUnscaledWidth = self->_penToolUnscaledWidth;
      break;
    case 2uLL:
      double monolineToolUnscaledWidth = self->_pencilToolUnscaledWidth;
      break;
    case 3uLL:
      double monolineToolUnscaledWidth = self->_crayonToolUnscaledWidth;
      break;
    case 4uLL:
      double monolineToolUnscaledWidth = self->_watercolorToolUnscaledWidth;
      break;
    case 5uLL:
      double monolineToolUnscaledWidth = self->_fountainPenToolUnscaledWidth;
      break;
    case 6uLL:
      double monolineToolUnscaledWidth = self->_markerToolUnscaledWidth;
      break;
    case 7uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D88A0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107CBC0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D88C0);
      }
      id v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState strokeWidthForToolType:]");
      id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 545, 0, "Cannot get width for current tool (%zd)", self->_currentToolType);

      break;
    case 8uLL:
      double monolineToolUnscaledWidth = self->_eraserToolScaledWidth;
      break;
    default:
      return monolineToolUnscaledWidth;
  }
  return monolineToolUnscaledWidth;
}

- (void)setColor:(id)a3 forToolType:(unint64_t)a4
{
  id v6 = [a3 colorWithAlphaComponent:1.0];
  switch(a4)
  {
    case 0uLL:
      monolineToolColor = self->_monolineToolColor;
      p_monolineToolColor = &self->_monolineToolColor;
      double v10 = monolineToolColor;
      goto LABEL_19;
    case 1uLL:
      penToolColor = self->_penToolColor;
      p_monolineToolColor = &self->_penToolColor;
      double v10 = penToolColor;
      goto LABEL_19;
    case 2uLL:
      pencilToolColor = self->_pencilToolColor;
      p_monolineToolColor = &self->_pencilToolColor;
      double v10 = pencilToolColor;
      goto LABEL_19;
    case 3uLL:
      crayonToolColor = self->_crayonToolColor;
      p_monolineToolColor = &self->_crayonToolColor;
      double v10 = crayonToolColor;
      goto LABEL_19;
    case 4uLL:
      watercolorToolColor = self->_watercolorToolColor;
      p_monolineToolColor = &self->_watercolorToolColor;
      double v10 = watercolorToolColor;
      goto LABEL_19;
    case 5uLL:
      fountainPenToolColor = self->_fountainPenToolColor;
      p_monolineToolColor = &self->_fountainPenToolColor;
      double v10 = fountainPenToolColor;
      goto LABEL_19;
    case 6uLL:
      markerToolColor = self->_markerToolColor;
      p_monolineToolColor = &self->_markerToolColor;
      double v10 = markerToolColor;
      goto LABEL_19;
    case 7uLL:
      fillToolColor = self->_fillToolColor;
      p_monolineToolColor = &self->_fillToolColor;
      double v10 = fillToolColor;
LABEL_19:
      if (![(CRLColor *)v10 isEqual:v6]) {
        objc_storeStrong((id *)p_monolineToolColor, v6);
      }
      break;
    case 8uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D88E0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107CC48();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8900);
      }
      id v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v7);
      }
      double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState setColor:forToolType:]");
      double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 601, 0, "Cannot set color for given tool (%zd)", a4);

      break;
    default:
      break;
  }
}

- (void)setOpacity:(double)a3 forToolType:(unint64_t)a4
{
  switch(a4)
  {
    case 0uLL:
      self->_double monolineToolOpacity = a3;
      break;
    case 1uLL:
      self->_double penToolOpacity = a3;
      break;
    case 2uLL:
      self->_double pencilToolOpacity = a3;
      break;
    case 3uLL:
      self->_double crayonToolOpacity = a3;
      break;
    case 4uLL:
      self->_double watercolorToolOpacity = a3;
      break;
    case 5uLL:
      self->_double fountainPenToolOpacity = a3;
      break;
    case 6uLL:
      self->_double markerToolOpacity = a3;
      break;
    case 7uLL:
      self->_double fillToolOpacity = a3;
      break;
    case 8uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8920);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107CCD0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8940);
      }
      id v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState setOpacity:forToolType:]");
      id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 634, 0, "Cannot set opacity for tool (%zd)", self->_currentToolType);

      break;
    default:
      return;
  }
}

- (void)setStrokeWidth:(double)a3 forToolType:(unint64_t)a4
{
  switch(a4)
  {
    case 0uLL:
      self->_double monolineToolUnscaledWidth = a3;
      break;
    case 1uLL:
      self->_double penToolUnscaledWidth = a3;
      break;
    case 2uLL:
      self->_double pencilToolUnscaledWidth = a3;
      break;
    case 3uLL:
      self->_double crayonToolUnscaledWidth = a3;
      break;
    case 4uLL:
      self->_double watercolorToolUnscaledWidth = a3;
      break;
    case 5uLL:
      self->_double fountainPenToolUnscaledWidth = a3;
      break;
    case 6uLL:
      self->_double markerToolUnscaledWidth = a3;
      break;
    case 7uLL:
    case 9uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8960);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107CD58();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D8980);
      }
      id v5 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v5);
      }
      id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState setStrokeWidth:forToolType:]");
      id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 667, 0, "Cannot set width for tool (%zd)", self->_currentToolType);

      break;
    case 8uLL:
      self->_double eraserToolScaledWidth = a3;
      break;
    default:
      return;
  }
}

- (int64_t)strokeWidthIndexForToolType:(unint64_t)a3
{
  id v5 = -[CRLFreehandDrawingToolkitUIState strokeWidthsForFreehandDrawingToolType:](self, "strokeWidthsForFreehandDrawingToolType:");
  if (![v5 count])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D89A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107CDE0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D89C0);
    }
    v21 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v21);
    }
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Should have at least one stroke width option.", v22, v23, v24, v25, v26, v27, v28, (uint64_t)"-[CRLFreehandDrawingToolkitUIState strokeWidthIndexForToolType:]");
    double v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkitUIState strokeWidthIndexForToolType:]");
    v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkitUIState.m"];
    +[CRLAssertionHandler handleFailureInFunction:v29 file:v30 lineNumber:676 isFatal:1 description:"Should have at least one stroke width option."];

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v31, v32);
    abort();
  }
  [(CRLFreehandDrawingToolkitUIState *)self strokeWidthForToolType:a3];
  double v7 = v6;
  int64_t v8 = 0;
  if ([v5 count])
  {
    unint64_t v9 = 0;
    double v10 = 1.79769313e308;
    do
    {
      double v11 = [v5 objectAtIndexedSubscript:v9];
      [v11 crl_CGFloatValue];
      double v13 = v12;

      double v14 = vabdd_f64(v13, v7);
      if (v14 < v10)
      {
        double v10 = v14;
        int64_t v8 = v9;
      }
      ++v9;
    }
    while (v9 < (unint64_t)[v5 count]);
  }
  v15 = [v5 objectAtIndexedSubscript:v8];
  [v15 crl_CGFloatValue];
  if (v16 == v7)
  {
  }
  else
  {
    double v17 = fabs(v7 * 0.000000999999997);
    double v18 = vabdd_f64(v16, v7);

    if (v18 >= v17)
    {
      if (qword_101719A68 != -1) {
        dispatch_once(&qword_101719A68, &stru_1014D89E0);
      }
      double v19 = off_10166B498;
      if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Should have been able to find exact match for stroke width. Returning closest match.", buf, 2u);
      }
    }
  }

  return v8;
}

- (void)setEraserToolErasesWholeObjects:(BOOL)a3
{
  if (self->_eraserToolErasesWholeObjects != a3) {
    self->_eraserToolErasesWholeObjects = a3;
  }
}

- (unint64_t)currentLassoType
{
  return self->_currentLassoType;
}

- (id)copy
{
  uint64_t v3 = objc_alloc_init(CRLFreehandDrawingToolkitUIState);
  v3->_unint64_t currentToolType = self->_currentToolType;
  v3->_mostRecentRestorableToolType = self->_mostRecentRestorableToolType;
  double v4 = (CRLColor *)[(CRLColor *)self->_monolineToolColor copy];
  monolineToolColor = v3->_monolineToolColor;
  v3->_monolineToolColor = v4;

  v3->_double monolineToolOpacity = self->_monolineToolOpacity;
  v3->_double monolineToolUnscaledWidth = self->_monolineToolUnscaledWidth;
  double v6 = (CRLColor *)[(CRLColor *)self->_penToolColor copy];
  penToolColor = v3->_penToolColor;
  v3->_penToolColor = v6;

  v3->_double penToolOpacity = self->_penToolOpacity;
  v3->_double penToolUnscaledWidth = self->_penToolUnscaledWidth;
  int64_t v8 = (CRLColor *)[(CRLColor *)self->_pencilToolColor copy];
  pencilToolColor = v3->_pencilToolColor;
  v3->_pencilToolColor = v8;

  v3->_double pencilToolOpacity = self->_pencilToolOpacity;
  v3->_double pencilToolUnscaledWidth = self->_pencilToolUnscaledWidth;
  double v10 = (CRLColor *)[(CRLColor *)self->_crayonToolColor copy];
  crayonToolColor = v3->_crayonToolColor;
  v3->_crayonToolColor = v10;

  v3->_double crayonToolOpacity = self->_crayonToolOpacity;
  v3->_double crayonToolUnscaledWidth = self->_crayonToolUnscaledWidth;
  double v12 = (CRLColor *)[(CRLColor *)self->_watercolorToolColor copy];
  watercolorToolColor = v3->_watercolorToolColor;
  v3->_watercolorToolColor = v12;

  v3->_double watercolorToolOpacity = self->_watercolorToolOpacity;
  v3->_double watercolorToolUnscaledWidth = self->_watercolorToolUnscaledWidth;
  double v14 = (CRLColor *)[(CRLColor *)self->_fountainPenToolColor copy];
  fountainPenToolColor = v3->_fountainPenToolColor;
  v3->_fountainPenToolColor = v14;

  v3->_double fountainPenToolOpacity = self->_fountainPenToolOpacity;
  v3->_double fountainPenToolUnscaledWidth = self->_fountainPenToolUnscaledWidth;
  double v16 = (CRLColor *)[(CRLColor *)self->_markerToolColor copy];
  markerToolColor = v3->_markerToolColor;
  v3->_markerToolColor = v16;

  v3->_double markerToolOpacity = self->_markerToolOpacity;
  v3->_double markerToolUnscaledWidth = self->_markerToolUnscaledWidth;
  double v18 = (CRLColor *)[(CRLColor *)self->_fillToolColor copy];
  fillToolColor = v3->_fillToolColor;
  v3->_fillToolColor = v18;

  v3->_double fillToolOpacity = self->_fillToolOpacity;
  v3->_double eraserToolScaledWidth = self->_eraserToolScaledWidth;
  v3->_eraserToolErasesWholeObjects = self->_eraserToolErasesWholeObjects;
  v3->_currentLassoType = self->_currentLassoType;
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (CRLFreehandDrawingToolkitUIState *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(CRLFreehandDrawingToolkitUIState *)self isEqualToFreehandDrawingToolkitUIState:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = sub_1000C8048((char *)&self->_currentToolType, 8);
  uint64_t v4 = sub_1000C8080((char *)&self->_mostRecentRestorableToolType, 8, v3);
  uint64_t v5 = sub_1000C8080((char *)&self->_eraserToolErasesWholeObjects, 1, v4);

  return sub_1000C8080((char *)&self->_currentLassoType, 8, v5);
}

- (unint64_t)currentToolType
{
  return self->_currentToolType;
}

- (unint64_t)mostRecentRestorableToolType
{
  return self->_mostRecentRestorableToolType;
}

- (BOOL)eraserToolErasesWholeObjects
{
  return self->_eraserToolErasesWholeObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillToolColor, 0);
  objc_storeStrong((id *)&self->_markerToolColor, 0);
  objc_storeStrong((id *)&self->_fountainPenToolColor, 0);
  objc_storeStrong((id *)&self->_watercolorToolColor, 0);
  objc_storeStrong((id *)&self->_crayonToolColor, 0);
  objc_storeStrong((id *)&self->_pencilToolColor, 0);
  objc_storeStrong((id *)&self->_penToolColor, 0);

  objc_storeStrong((id *)&self->_monolineToolColor, 0);
}

@end