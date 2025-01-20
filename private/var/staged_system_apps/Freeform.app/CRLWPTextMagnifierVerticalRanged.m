@interface CRLWPTextMagnifierVerticalRanged
- (BOOL)shouldHideCanvasLayer;
- (CRLWPTextMagnifierVerticalRanged)init;
- (double)currentOffset;
- (id)maskImageName;
- (id)overlayImageName;
- (id)underlayImageName;
- (void)beginMagnifyingTarget:(id)a3 magnificationPoint:(CGPoint)a4 offset:(CGPoint)a5 animated:(BOOL)a6;
- (void)drawMagnifierClippedCanvasLayer:(id)a3 inContext:(CGContext *)a4;
- (void)stopMagnifying:(BOOL)a3;
- (void)updateFrame;
- (void)zoomLeftAnimation;
- (void)zoomRightAnimation;
@end

@implementation CRLWPTextMagnifierVerticalRanged

- (CRLWPTextMagnifierVerticalRanged)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRLWPTextMagnifierVerticalRanged;
  return -[CRLWPTextMagnifierRanged initWithFrame:](&v3, "initWithFrame:", 0.0, 0.0, 65.0, 150.0);
}

- (void)zoomLeftAnimation
{
  memset(&v8, 0, sizeof(v8));
  [(CRLWPTextMagnifierVerticalRanged *)self bounds];
  CGFloat MaxX = CGRectGetMaxX(v9);
  CGAffineTransformMakeTranslation(&v8, MaxX * 0.5, 0.0);
  CGAffineTransform v6 = v8;
  CGAffineTransformScale(&v7, &v6, 0.25, 0.25);
  CGAffineTransform v8 = v7;
  CGAffineTransform v5 = v7;
  [(CRLWPTextMagnifierVerticalRanged *)self setTransform:&v5];
  [(CRLWPTextMagnifierVerticalRanged *)self setAlpha:0.0];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100084438;
  v4[3] = &unk_1014D0800;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:0.1];
}

- (void)zoomRightAnimation
{
  [(CRLWPTextMagnifierRanged *)self animationPoint];
  self->super._magnificationPoint.x = v3 + -8.0;
  self->super._magnificationPoint.y = v4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100084580;
  v6[3] = &unk_1014D0800;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100084638;
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
  double v3 = [(CRLWPTextMagnifierVerticalRanged *)self superview];
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

  [(CRLWPTextMagnifierVerticalRanged *)self bounds];
  double v17 = v16 * 0.5;
  self->super._inPlace = v13 + v16 * 0.5 + -41.0 < 45.0;
  [(CRLWPTextMagnifierVerticalRanged *)self currentOffset];
  double v19 = v13 - v18;
  if (v19 < v17) {
    double v19 = v17;
  }
  double v20 = round(v19) + -0.5;
  double v21 = round(v15) + 0.5;

  -[CRLWPTextMagnifierVerticalRanged setCenter:](self, "setCenter:", v20, v21);
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
  v14.super_class = (Class)CRLWPTextMagnifierVerticalRanged;
  -[CRLWPTextMagnifierRanged beginMagnifyingTarget:magnificationPoint:offset:animated:](&v14, "beginMagnifyingTarget:magnificationPoint:offset:animated:", v12, v6, v10, v9, x, y);
  double v13 = 0.0;
  if (x >= 0.0) {
    double v13 = x;
  }
  -[CRLWPTextMagnifierRanged setOffset:](self, "setOffset:", round(v13), round(y));
  -[CRLWPTextMagnifierRanged setMagnificationPoint:](self, "setMagnificationPoint:", v10, v9);
  if (v6) {
    [(CRLWPTextMagnifierVerticalRanged *)self zoomLeftAnimation];
  }
}

- (void)stopMagnifying:(BOOL)a3
{
  if (a3)
  {
    [(CRLWPTextMagnifierVerticalRanged *)self zoomRightAnimation];
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
  return @"kb-magnifier-vertical-ranged-lo";
}

- (id)overlayImageName
{
  return @"kb-magnifier-vertical-ranged-hi";
}

- (id)maskImageName
{
  return @"kb-magnifier-vertical-ranged-mask";
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
  }
  return 1;
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
      double v9 = [v8 interactiveCanvasController];

      double v10 = [v9 layerHost];
      v11 = [v10 canvasView];

      v70 = v11;
      [(CRLWPTextMagnifierVerticalRanged *)self frame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v20 = [(CRLWPTextMagnifierVerticalRanged *)self superview];
      [v11 convertRect:v20 fromView:v13 + -3.0, v15, v17 + -3.0 + -18.0, v19];
      double v71 = v22;
      double v72 = v21;
      double v24 = v23;
      double v26 = v25;

      CGContextSaveGState(a4);
      [(CRLWPTextMagnifierVerticalRanged *)self frame];
      CGFloat v28 = v27;
      [(CRLWPTextMagnifierVerticalRanged *)self frame];
      CGFloat v30 = v29;
      v31 = [(CRLWPTextMagnifierVerticalRanged *)self maskImageName];
      v32 = +[UIImage imageNamed:v31];

      id v69 = v32;
      v33 = (CGImage *)[v69 CGImage];
      v84.origin.double x = 0.0;
      v84.origin.double y = -5.0;
      v84.size.width = v28;
      v84.size.height = v30;
      CGContextClipToMask(a4, v84, v33);
      CGContextScaleCTM(a4, 1.2, 1.2);
      [(CRLWPTextMagnifierVerticalRanged *)self currentOffset];
      double v35 = v34;
      uint64_t v36 = objc_opt_class();
      v37 = [(CRLWPTextMagnifierRanged *)self target];
      v38 = sub_1002469D0(v36, v37);
      double v39 = v24 + v35;

      if (v38)
      {
        uint64_t v40 = objc_opt_class();
        v41 = [v9 editorController];
        v42 = [v41 textInputEditor];
        v43 = sub_1002469D0(v40, v42);

        v67 = v43;
        v44 = [v43 selection];
        v68 = v9;
        v45 = [v38 currentKnobTracker];
        v46 = [v45 knob];
        id v47 = [v46 tag];

        if (v47 == (id)11) {
          id v48 = [v44 start];
        }
        else {
          id v48 = [v44 end];
        }
        id v50 = v48;
        long long v81 = 0u;
        long long v82 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        v51 = [v38 columns];
        id v52 = [v51 countByEnumeratingWithState:&v79 objects:v83 count:16];
        if (v52)
        {
          uint64_t v53 = *(void *)v80;
          v66 = v38;
          while (2)
          {
            for (i = 0; i != v52; i = (char *)i + 1)
            {
              if (*(void *)v80 != v53) {
                objc_enumerationMutation(v51);
              }
              v55 = *(void **)(*((void *)&v79 + 1) + 8 * i);
              v56 = [v55 lineFragmentForCharIndex:v50 knobTag:v47 selectionType:[v44 type]];
              if (v56)
              {
                if (v55)
                {
                  double v9 = v68;
                  v49 = v70;
                  v38 = v66;
                  [v55 transformFromWP];
                  double v57 = v73;
                  double v58 = v74;
                  double v59 = v75;
                  double v60 = v76;
                  double v62 = v77;
                  double v61 = v78;
                }
                else
                {
                  double v61 = 0.0;
                  double v62 = 0.0;
                  double v60 = 0.0;
                  double v59 = 0.0;
                  double v58 = 0.0;
                  double v57 = 0.0;
                  double v9 = v68;
                  v49 = v70;
                  v38 = v66;
                }

                [v38 convertNaturalPointToUnscaledCanvas:v62 + v59 * v56[4] + v57 * 0.0, v61 + v60 * v56[4] + v58 * 0.0];
                [v9 convertUnscaledToBoundsPoint:];
                double v64 = v63;
                v85.origin.double x = v24;
                v85.origin.double y = v26;
                v85.size.height = v71;
                v85.size.width = v72;
                double v39 = CGRectGetWidth(v85) - v64 + -5.0;
                goto LABEL_21;
              }
            }
            id v52 = [v51 countByEnumeratingWithState:&v79 objects:v83 count:16];
            v38 = v66;
            if (v52) {
              continue;
            }
            break;
          }
        }

        double v9 = v68;
        v49 = v70;
LABEL_21:
      }
      else
      {
        v49 = v70;
      }
      CGContextTranslateCTM(a4, v39, -v26);
      CGContextTranslateCTM(a4, v71 * -0.100000001, v72 * -0.100000001);
      v65 = [v49 canvasLayer];
      [v65 renderInContext:a4];

      CGContextRestoreGState(a4);
    }
  }
}

@end