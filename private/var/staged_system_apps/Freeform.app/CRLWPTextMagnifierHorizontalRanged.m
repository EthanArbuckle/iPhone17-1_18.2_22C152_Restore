@interface CRLWPTextMagnifierHorizontalRanged
- (BOOL)shouldHideCanvasLayer;
- (CRLWPTextMagnifierHorizontalRanged)init;
- (double)currentOffset;
- (id)maskImageName;
- (id)overlayImageName;
- (id)underlayImageName;
- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6;
- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4;
- (void)stopMagnifying:(BOOL)a3;
- (void)updateFrame;
- (void)zoomDownAnimation;
- (void)zoomUpAnimation;
@end

@implementation CRLWPTextMagnifierHorizontalRanged

- (CRLWPTextMagnifierHorizontalRanged)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRLWPTextMagnifierHorizontalRanged;
  return -[CRLWPTextMagnifierRanged initWithFrame:](&v3, "initWithFrame:", 0.0, 0.0, 145.0, 59.0);
}

- (void)zoomUpAnimation
{
  memset(&v8, 0, sizeof(v8));
  [(CRLWPTextMagnifierHorizontalRanged *)self bounds];
  CGFloat MaxY = CGRectGetMaxY(v9);
  CGAffineTransformMakeTranslation(&v8, 0.0, MaxY * 0.5);
  CGAffineTransform v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  CGAffineTransform v8 = v7;
  CGAffineTransform v5 = v7;
  [(CRLWPTextMagnifierHorizontalRanged *)self setTransform:&v5];
  [(CRLWPTextMagnifierHorizontalRanged *)self setAlpha:0.0];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A8688;
  v4[3] = &unk_1014D0800;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:0.1];
}

- (void)zoomDownAnimation
{
  [(CRLWPTextMagnifierRanged *)self animationPoint];
  self->super._magnificationPoint.x = v4;
  self->super._magnificationPoint.y = v3 + 8.0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A87D0;
  v6[3] = &unk_1014D0800;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A8888;
  v5[3] = &unk_1014D0828;
  v5[4] = self;
  +[UIView animateWithDuration:v6 animations:v5 completion:0.2];
}

- (double)currentOffset
{
  double result = 19.0;
  if (!self->super._inPlace)
  {
    [(CRLWPTextMagnifierRanged *)self offset];
    return v3 + 41.0 + 7.0;
  }
  return result;
}

- (void)updateFrame
{
  double v3 = [(CRLWPTextMagnifierHorizontalRanged *)self superview];
  [(CRLWPTextMagnifierRanged *)self magnificationPoint];
  double v5 = v4;
  double v7 = v6;
  CGAffineTransform v8 = [(CRLWPTextMagnifierRanged *)self target];
  CGRect v9 = [v8 interactiveCanvasController];
  v10 = [v9 layerHost];
  v11 = [v10 canvasView];
  [v3 convertPoint:v11 fromView:v5];
  double v13 = v12;
  double v15 = v14;

  [(CRLWPTextMagnifierHorizontalRanged *)self bounds];
  double v17 = v16 * 0.5;
  self->super._inPlace = v15 + v16 * 0.5 + -41.0 < 45.0;
  [(CRLWPTextMagnifierHorizontalRanged *)self currentOffset];
  double v19 = v15 - v18;
  if (v19 >= v17) {
    double v20 = v19;
  }
  else {
    double v20 = v17;
  }
  double v21 = round(v13) + 0.5;
  double v22 = round(v20) + 0.5;

  -[CRLWPTextMagnifierHorizontalRanged setCenter:](self, "setCenter:", v21, v22);
}

- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  id v12 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLWPTextMagnifierHorizontalRanged;
  -[CRLWPTextMagnifierRanged beginMagnifyingTarget:magnificationPoint:offset:animated:](&v14, "beginMagnifyingTarget:magnificationPoint:offset:animated:", v12, v6, v10, v9, x, y);
  if (y >= 0.0) {
    double v13 = y;
  }
  else {
    double v13 = 0.0;
  }
  -[CRLWPTextMagnifierRanged setOffset:](self, "setOffset:", round(x), round(v13));
  -[CRLWPTextMagnifierRanged setMagnificationPoint:](self, "setMagnificationPoint:", v10, v9);
  if (v6) {
    [(CRLWPTextMagnifierHorizontalRanged *)self zoomUpAnimation];
  }
}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3)
  {
    [(CRLWPTextMagnifierHorizontalRanged *)self zoomDownAnimation];
  }
  else
  {
    [(CRLWPTextMagnifierRanged *)self remove];
    [(CRLWPTextMagnifierRanged *)self setTarget:0];
  }
  self->super._magnificationPoint = (CGPoint)xmmword_101175150;
  double y = CGPointZero.y;

  -[CRLWPTextMagnifierRanged setOffset:](self, "setOffset:", CGPointZero.x, y);
}

- (id)underlayImageName
{
  return @"kb-magnifier-ranged-lo";
}

- (id)overlayImageName
{
  return @"kb-magnifier-ranged-hi";
}

- (id)maskImageName
{
  return @"kb-magnifier-ranged-mask";
}

- (BOOL)shouldHideCanvasLayer
{
  v2 = [(CRLWPTextMagnifierRanged *)self target];
  double v3 = [v2 interactiveCanvasController];

  uint64_t v4 = objc_opt_class();
  double v5 = sub_1002469D0(v4, v3);
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    double v7 = [v5 layerHost];
    CGAffineTransform v8 = sub_1002469D0(v6, v7);

    if (v8) {
      unsigned __int8 v9 = [v8 shouldHideCanvasLayerInMagnifier];
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v6 = [(CRLWPTextMagnifierRanged *)self target];
  if (v6)
  {
    unsigned __int8 v7 = [(CRLWPTextMagnifierRanged *)self isMagnifierStopping];

    if ((v7 & 1) == 0)
    {
      CGAffineTransform v8 = [(CRLWPTextMagnifierRanged *)self target];
      unsigned __int8 v9 = [v8 interactiveCanvasController];

      uint64_t v10 = objc_opt_class();
      v11 = [v9 layerHost];
      id v12 = sub_1002469D0(v10, v11);

      double v13 = [v9 layerHost];
      v69 = [v13 canvasView];

      [(CRLWPTextMagnifierHorizontalRanged *)self frame];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v22 = [(CRLWPTextMagnifierHorizontalRanged *)self superview];
      [v69 convertRect:v22 fromView:v15, v17 + 3.0, v19, v21 + -3.0 + -18.0];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;

      CGContextSaveGState(a4);
      [(CRLWPTextMagnifierHorizontalRanged *)self frame];
      CGFloat v32 = v31;
      [(CRLWPTextMagnifierHorizontalRanged *)self frame];
      CGFloat v34 = v33;
      v35 = [(CRLWPTextMagnifierHorizontalRanged *)self maskImageName];
      v36 = +[UIImage imageNamed:v35];

      id v68 = v36;
      v37 = (CGImage *)[v68 CGImage];
      v75.origin.double x = 0.0;
      v75.origin.double y = 0.0;
      v75.size.width = v32;
      v75.size.height = v34;
      CGContextClipToMask(a4, v75, v37);
      if (v9)
      {
        v38 = [v12 backgroundColorForMagnifier];
        v39 = v38;
        if (v38)
        {
          CGContextSetFillColorWithColor(a4, (CGColorRef)[v38 CGColor]);
          v76.origin.double x = 0.0;
          v76.origin.double y = 0.0;
          v76.size.width = v32;
          v76.size.height = v34;
          CGContextFillRect(a4, v76);
        }
      }
      CGContextScaleCTM(a4, 1.2, 1.2);
      [(CRLWPTextMagnifierHorizontalRanged *)self currentOffset];
      double v41 = v40;
      uint64_t v42 = objc_opt_class();
      v43 = [(CRLWPTextMagnifierRanged *)self target];
      v44 = sub_1002469D0(v42, v43);
      double v45 = -v26 - v41;

      if (v44)
      {
        uint64_t v46 = objc_opt_class();
        v47 = [v9 editorController];
        v48 = [v47 textInputEditor];
        v49 = sub_1002469D0(v46, v48);

        v65 = v49;
        v50 = [v49 selection];
        v66 = v12;
        v67 = v9;
        v51 = [v44 currentKnobTracker];
        v52 = [v51 knob];
        id v53 = [v52 tag];

        if ([v50 isVisual])
        {
          if (v53 == (id)11) {
            id v54 = [v50 headCharIndex];
          }
          else {
            id v54 = [v50 tailCharIndex];
          }
        }
        else if (v53 == (id)11)
        {
          id v54 = [v50 start];
        }
        else
        {
          id v54 = [v50 end];
        }
        id v55 = v54;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        v56 = [v44 columns];
        id v57 = [v56 countByEnumeratingWithState:&v70 objects:v74 count:16];
        if (v57)
        {
          uint64_t v58 = *(void *)v71;
          while (2)
          {
            for (i = 0; i != v57; i = (char *)i + 1)
            {
              if (*(void *)v71 != v58) {
                objc_enumerationMutation(v56);
              }
              v60 = [*(id *)(*((void *)&v70 + 1) + 8 * i) lineFragmentForCharIndex:v55 knobTag:v53 selectionType:[v50 type]];
              if (v60)
              {

                id v12 = v66;
                unsigned __int8 v9 = v67;
                [v44 convertNaturalPointToUnscaledCanvas:0.0 v60[4]];
                [v67 convertUnscaledToBoundsPoint:];
                double v62 = v61;
                v77.origin.double x = v24;
                v77.origin.double y = v26;
                v77.size.width = v28;
                v77.size.height = v30;
                double v45 = CGRectGetHeight(v77) - v62 + -7.0;
                goto LABEL_25;
              }
            }
            id v57 = [v56 countByEnumeratingWithState:&v70 objects:v74 count:16];
            if (v57) {
              continue;
            }
            break;
          }
        }

        id v12 = v66;
        unsigned __int8 v9 = v67;
LABEL_25:
      }
      CGContextTranslateCTM(a4, -v24, v45);
      CGContextTranslateCTM(a4, v28 * -0.100000001, v30 * -0.100000001);
      v63 = [v9 layerHost];
      v64 = [v63 canvasLayer];
      [v64 renderInContext:a4];

      CGContextRestoreGState(a4);
    }
  }
}

@end