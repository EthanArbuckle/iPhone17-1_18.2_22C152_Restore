@interface CRLStyledRep
- (BOOL)isInvisible;
- (BOOL)shouldHideSelectionHighlightDueToRectangularPath;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)shouldShowShadow;
- (CGRect)clipRect;
- (CGRect)p_clipRectInRootForTransform:(CGAffineTransform *)a3 includeShadow:(BOOL)a4;
- (CGRect)p_rectWithEffectsAppliedToRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4 includeShadow:(BOOL)a5;
- (CGRect)rectWithEffectsAppliedToRect:(CGRect)a3;
- (NSString)description;
- (double)opacity;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5;
- (id)pathSourceForSelectionHighlightBehavior;
- (id)shadow;
- (void)drawInContext:(CGContext *)a3;
- (void)drawInContextWithoutEffects:(CGContext *)a3;
- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8 keepingChildrenPassingTest:(id)a9;
- (void)drawInContextWithoutEffectsForAlphaOnly:(CGContext *)a3;
- (void)drawInContextWithoutEffectsOrChildren:(CGContext *)a3;
- (void)drawInContextWithoutEffectsOrChildrenForAlphaOnly:(CGContext *)a3;
- (void)drawShadowInContext:(CGContext *)a3 withChildren:(BOOL)a4 withDrawableOpacity:(BOOL)a5;
- (void)dynamicShadowChangeDidBegin;
- (void)dynamicShadowChangeDidEnd;
- (void)dynamicShadowUpdateToValue:(id)a3;
- (void)processChangedProperty:(unint64_t)a3;
- (void)setNeedsDisplay;
@end

@implementation CRLStyledRep

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(CRLCanvasRep *)self info];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [(CRLCanvasRep *)self info];
  v9 = [(CRLCanvasRep *)self layout];
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v12 = [(CRLCanvasRep *)self layout];
  [(CRLCanvasRep *)self frameInUnscaledCanvas];
  v13 = NSStringFromCGRect(v17);
  v14 = +[NSString stringWithFormat:@"<%@ %p info=<%@ %p> layout=<%@ %p> frameInUnscaledCanvas=%@>", v4, self, v7, v8, v11, v12, v13];

  return (NSString *)v14;
}

- (CGRect)clipRect
{
  [(CRLStyledRep *)self clipRectWithoutEffects];

  -[CRLStyledRep rectWithEffectsAppliedToRect:](self, "rectWithEffectsAppliedToRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_clipRectInRootForTransform:(CGAffineTransform *)a3 includeShadow:(BOOL)a4
{
  BOOL v4 = a4;
  [(CRLStyledRep *)self clipRectWithoutEffects];
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v13.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v13.c = v7;
  *(_OWORD *)&v13.tx = *(_OWORD *)&a3->tx;
  CGRect v15 = CGRectApplyAffineTransform(v14, &v13);
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v13.c = v8;
  *(_OWORD *)&v13.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[CRLStyledRep p_rectWithEffectsAppliedToRect:additionalTransform:includeShadow:](self, "p_rectWithEffectsAppliedToRect:additionalTransform:includeShadow:", &v13, v4, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (double)opacity
{
  v2 = [(CRLStyledRep *)self styledLayout];
  [v2 opacity];
  double v4 = v3;

  return v4;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null];
}

- (CGRect)rectWithEffectsAppliedToRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v8 = [(CRLCanvasRep *)self layout];
  double v9 = v8;
  if (v8) {
    [v8 transformInRoot];
  }
  else {
    memset(&v22, 0, sizeof(v22));
  }
  CGAffineTransformInvert(&v23, &v22);
  -[CRLStyledRep p_rectWithEffectsAppliedToRect:additionalTransform:includeShadow:](self, "p_rectWithEffectsAppliedToRect:additionalTransform:includeShadow:", &v23, 1, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)p_rectWithEffectsAppliedToRect:(CGRect)a3 additionalTransform:(CGAffineTransform *)a4 includeShadow:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a5)
  {
    double v11 = [(CRLCanvasRep *)self info];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      double v13 = [(CRLStyledRep *)self shadow];
      double v14 = v13;
      if (v13 && [v13 isEnabled])
      {
        long long v15 = *(_OWORD *)&a4->c;
        v24[0] = *(_OWORD *)&a4->a;
        v24[1] = v15;
        v24[2] = *(_OWORD *)&a4->tx;
        [v14 shadowBoundsForRect:v24 additionalTransform:x, y, width, height];
        double x = v16;
        double y = v17;
        double width = v18;
        double height = v19;
      }
    }
  }
  double v20 = x;
  double v21 = y;
  double v22 = width;
  double v23 = height;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (id)shadow
{
  if (self->mIsUpdatingShadow)
  {
    v2 = self->mDynamicShadow;
  }
  else
  {
    double v3 = [(CRLStyledRep *)self styledInfo];
    v2 = [v3 shadow];
  }

  return v2;
}

- (BOOL)shouldShowShadow
{
  double v3 = [(CRLStyledRep *)self styledLayout];
  unsigned __int8 v4 = [v3 isInvisible];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLStyledRep;
  return [(CRLCanvasRep *)&v6 shouldShowShadow];
}

- (BOOL)isInvisible
{
  return 0;
}

- (void)drawShadowInContext:(CGContext *)a3 withChildren:(BOOL)a4 withDrawableOpacity:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double v9 = [(CRLStyledRep *)self shadow];
  double v10 = v9;
  if (v9)
  {
    if ([v9 isEnabled])
    {
      if ([(CRLStyledRep *)self shouldShowShadow])
      {
        [v10 boundsInNaturalSpaceForRep:self];
        CGFloat x = v11;
        CGFloat y = v13;
        CGFloat width = v15;
        CGFloat height = v17;
        double v19 = -[CRLCanvasRep newShadowImageWithSize:unflipped:withChildren:](self, "newShadowImageWithSize:unflipped:withChildren:", 0, v6, v15, v17);
        if (v19)
        {
          double v20 = v19;
          CGContextSaveGState(a3);
          [v10 opacity];
          double v22 = v21;
          if (v5)
          {
            [(CRLStyledRep *)self opacity];
            double v22 = v22 * v23;
          }
          if (v22 < 1.0) {
            CGContextSetAlpha(a3, v22);
          }
          if ([v10 isDropShadow])
          {
            [v10 offsetDelta];
            double v25 = v24;
            double v27 = v26;
            v28 = [(CRLStyledRep *)self styledLayout];
            v29 = v28;
            if (v28) {
              [v28 transformInRoot];
            }
            else {
              memset(&v67, 0, sizeof(v67));
            }
            CGAffineTransformInvert(&v68, &v67);
            double v53 = sub_1000664E0((float64x2_t *)&v68, v25, v27);
            CGFloat v55 = v54;

            v69.origin.CGFloat x = x;
            v69.origin.CGFloat y = y;
            v69.size.CGFloat width = width;
            v69.size.CGFloat height = height;
            CGRect v70 = CGRectOffset(v69, v53, v55);
            CGFloat x = v70.origin.x;
            CGFloat y = v70.origin.y;
            CGFloat width = v70.size.width;
            CGFloat height = v70.size.height;
            sub_10007FA0C(0, 1, (uint64_t)&transform, v70.origin.x, v70.origin.y, v70.size.width, v70.size.height);
            p_CGAffineTransform transform = &transform;
          }
          else
          {
            if ([v10 isContactShadow])
            {
              v30 = [(CRLStyledRep *)self styledLayout];
              [v30 alignmentFrameInRoot];
              double v32 = v31;

              v33 = [(CRLStyledRep *)self styledLayout];
              [v33 alignmentFrameInRoot];
              CGFloat v35 = v34;
              CGFloat v37 = v36;

              v38 = [(CRLCanvasRep *)self layout];
              v39 = v38;
              if (v38) {
                [v38 transformInRoot];
              }
              else {
                memset(&v64, 0, sizeof(v64));
              }
              CGAffineTransformInvert(&v65, &v64);
              CGContextConcatCTM(a3, &v65);

              CGContextTranslateCTM(a3, v35, v37);
              [v10 offset];
              CGContextTranslateCTM(a3, 0.0, v32 + v57);
              CGContextTranslateCTM(a3, 0.0, v32);
              CGContextScaleCTM(a3, 1.0, -1.0);
              goto LABEL_25;
            }
            if (![v10 isCurvedShadow])
            {
LABEL_25:
              v71.origin.CGFloat x = x;
              v71.origin.CGFloat y = y;
              v71.size.CGFloat width = width;
              v71.size.CGFloat height = height;
              CGContextDrawImage(a3, v71, v20);
              CGImageRelease(v20);
              CGContextRestoreGState(a3);
              goto LABEL_26;
            }
            v40 = [(CRLCanvasRep *)self layout];
            v41 = [v40 geometry];
            [v41 frame];
            CGFloat v43 = v42;
            CGFloat v45 = v44;

            v46 = [(CRLCanvasRep *)self layout];
            v47 = [v46 parent];

            if (v47)
            {
              v48 = [(CRLCanvasRep *)self layout];
              [v48 frameInRoot];
              CGFloat v43 = v49;
              CGFloat v45 = v50;
            }
            v51 = [(CRLCanvasRep *)self layout];
            v52 = v51;
            if (v51) {
              [v51 transformInRoot];
            }
            else {
              memset(&v62, 0, sizeof(v62));
            }
            CGAffineTransformInvert(&v63, &v62);
            CGContextConcatCTM(a3, &v63);

            CGContextTranslateCTM(a3, v43, v45);
            [v10 offsetDelta];
            CGFloat v59 = v58;
            [v10 offsetDelta];
            CGContextTranslateCTM(a3, v59, v60);
            sub_10007FA0C(0, 1, (uint64_t)v61, x, y, width, height);
            p_CGAffineTransform transform = (CGAffineTransform *)v61;
          }
          CGContextConcatCTM(a3, p_transform);
          goto LABEL_25;
        }
      }
    }
  }
LABEL_26:
}

- (void)drawInContext:(CGContext *)a3
{
  BOOL v5 = [(CRLStyledRep *)self styledLayout];
  unsigned __int8 v6 = [v5 isInvisible];

  if ((v6 & 1) == 0)
  {
    [(CRLStyledRep *)self drawShadowInContext:a3 withChildren:1 withDrawableOpacity:1];
    [(CRLStyledRep *)self drawInContextWithoutEffects:a3 withContent:1 strokeDrawOptions:7 withOpacity:1 forAlphaOnly:0 drawChildren:0 keepingChildrenPassingTest:0];
  }
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 strokeDrawOptions:(unint64_t)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8 keepingChildrenPassingTest:(id)a9
{
  id v9 = a9;
  unsigned int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DADD0);
  }
  double v11 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    char v12 = v11;
    double v13 = (objc_class *)objc_opt_class();
    double v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 67110146;
    unsigned int v27 = v10;
    __int16 v28 = 2082;
    v29 = "-[CRLStyledRep drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren"
          ":keepingChildrenPassingTest:]";
    __int16 v30 = 2082;
    double v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledRep.m";
    __int16 v32 = 1024;
    int v33 = 201;
    __int16 v34 = 2114;
    CGFloat v35 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014DADF0);
  }
  double v15 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    double v16 = v15;
    double v17 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v27 = v10;
    __int16 v28 = 2114;
    v29 = v17;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  double v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledRep drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:]");
  double v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledRep.m"];
  double v20 = (objc_class *)objc_opt_class();
  double v21 = NSStringFromClass(v20);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 201, 0, "Abstract method not overridden by %{public}@", v21);

  double v22 = (objc_class *)objc_opt_class();
  double v23 = NSStringFromClass(v22);
  double v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v23, "-[CRLStyledRep drawInContextWithoutEffects:withContent:strokeDrawOptions:withOpacity:forAlphaOnly:drawChildren:keepingChildrenPassingTest:]");
  id v25 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v24 userInfo:0];

  objc_exception_throw(v25);
}

- (void)drawInContextWithoutEffects:(CGContext *)a3
{
}

- (void)drawInContextWithoutEffectsOrChildren:(CGContext *)a3
{
}

- (void)drawInContextWithoutEffectsForAlphaOnly:(CGContext *)a3
{
}

- (void)drawInContextWithoutEffectsOrChildrenForAlphaOnly:(CGContext *)a3
{
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)CRLStyledRep;
  [(CRLCanvasRep *)&v3 setNeedsDisplay];
  [(CRLCanvasRep *)self invalidateShadowRenderable];
}

- (void)processChangedProperty:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRLStyledRep;
  -[CRLCanvasRep processChangedProperty:](&v7, "processChangedProperty:");
  if (a3 == 17)
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLStyledRep;
    [(CRLCanvasRep *)&v6 setNeedsDisplay];
  }
  else
  {
    if (a3 != 16) {
      return;
    }
    if (self->mIsUpdatingShadow) {
      [(CRLCanvasRep *)self invalidateShadowRenderable];
    }
  }
  BOOL v5 = [(CRLCanvasRep *)self canvas];
  [v5 canvasInvalidatedForRep:self];
}

- (BOOL)shouldHideSelectionHighlightDueToRectangularPath
{
  objc_super v3 = [(CRLCanvasRep *)self layout];
  unsigned __int8 v4 = [v3 i_wrapPath];

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DAE10);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010802D0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DAE30);
    }
    BOOL v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    objc_super v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledRep shouldHideSelectionHighlightDueToRectangularPath]");
    objc_super v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 253, 0, "invalid nil value for '%{public}s'", "wrapPath");
  }
  if ([v4 isRectangular])
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    unsigned int v10 = [(CRLStyledRep *)self pathSourceForSelectionHighlightBehavior];
    double v11 = sub_1002469D0(v9, v10);

    BOOL v8 = 0;
    if (v11)
    {
      if (![v11 type])
      {
        if (![v11 shouldShowKnob]
          || ([v11 scalar],
              double v14 = v13,
              [(CRLCanvasRep *)self canvas],
              double v15 = objc_claimAutoreleasedReturnValue(),
              [v15 viewScale],
              double v17 = v14 * v16,
              v15,
              v17 < 10.0))
        {
          BOOL v8 = 1;
        }
      }
    }
  }
  return v8;
}

- (BOOL)shouldShowSelectionHighlight
{
  if ([(CRLStyledRep *)self shouldHideSelectionHighlightDueToRectangularPath])
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRLStyledRep;
  return [(CRLCanvasRep *)&v4 shouldShowSelectionHighlight];
}

- (id)pathSourceForSelectionHighlightBehavior
{
  return 0;
}

- (void)dynamicShadowChangeDidBegin
{
  objc_super v3 = [(CRLStyledRep *)self styledInfo];
  id v6 = [v3 shadow];

  objc_super v4 = (CRLShadow *)[v6 copy];
  mDynamicShadow = self->mDynamicShadow;
  self->mDynamicShadow = v4;

  self->mIsUpdatingShadow = 1;
}

- (void)dynamicShadowUpdateToValue:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DAE50);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101080380();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DAE70);
    }
    BOOL v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledRep dynamicShadowUpdateToValue:]");
    objc_super v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 292, 0, "invalid nil value for '%{public}s'", "shadow");
  }
  BOOL v8 = (CRLShadow *)[v4 copy];
  mDynamicShadow = self->mDynamicShadow;
  self->mDynamicShadow = v8;

  [(CRLStyledRep *)self processChangedProperty:16];
}

- (void)dynamicShadowChangeDidEnd
{
  self->mIsUpdatingShadow = 0;
  mDynamicShadow = self->mDynamicShadow;
  self->mDynamicShadow = 0;
}

- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  id v10 = a5;
  if ((unint64_t)[v9 tag] < 0xC || (unint64_t)objc_msgSend(v9, "tag") > 0x10)
  {
    v17.receiver = self;
    v17.super_class = (Class)CRLStyledRep;
    double v15 = -[CRLCanvasRep cursorAtPoint:forKnob:withCursorPlatformObject:](&v17, "cursorAtPoint:forKnob:withCursorPlatformObject:", v9, v10, x, y);
  }
  else
  {
    uint64_t v11 = objc_opt_class();
    char v12 = [(CRLStyledRep *)self pathSourceForSelectionHighlightBehavior];
    double v13 = sub_1002469D0(v11, v12);

    if (v13 && ![v13 type])
    {
      uint64_t v14 = [v9 resizeCursor];
    }
    else
    {
      [v9 cursorActiveScaledRect];
      uint64_t v14 = +[CRLCursor moveCursorWithActiveScaledRect:](CRLCursor, "moveCursorWithActiveScaledRect:");
    }
    double v15 = (void *)v14;
  }

  return v15;
}

- (void).cxx_destruct
{
}

@end