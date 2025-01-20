@interface PUCleanupToolBrushView
- (BOOL)isHDR;
- (BOOL)needsClearing;
- (BOOL)shouldDrawCursor;
- (CALayer)exclusionMaskLayer;
- (CAShapeLayer)brushPathLayer;
- (CAShapeLayer)cursorLayer;
- (CIImage)brushStrokeExclusionMask;
- (NUMediaView)mediaView;
- (PUCleanupToolBrushView)initWithMediaView:(id)a3 isHDR:(BOOL)a4;
- (UIBezierPath)brushPath;
- (double)lastCursorRadius;
- (id)bridgedExclusionMaskCGImage;
- (void)addPointToStroke:(CGPoint)a3;
- (void)drawCursorAtPoint:(CGPoint)a3 withRadius:(double)a4;
- (void)removeStroke;
- (void)setBridgedExclusionMaskCGImage:(id)a3;
- (void)setBrushPath:(id)a3;
- (void)setBrushPathLayer:(id)a3;
- (void)setBrushStrokeExclusionMask:(id)a3;
- (void)setCursorLayer:(id)a3;
- (void)setExclusionMaskLayer:(id)a3;
- (void)setIsHDR:(BOOL)a3;
- (void)setLastCursorRadius:(double)a3;
- (void)setMediaView:(id)a3;
- (void)setNeedsClearing:(BOOL)a3;
- (void)setShouldDrawCursor:(BOOL)a3;
- (void)startStrokeWithPoint:(CGPoint)a3 radius:(double)a4;
@end

@implementation PUCleanupToolBrushView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cursorLayer, 0);
  objc_storeStrong((id *)&self->_brushPath, 0);
  objc_storeStrong((id *)&self->_brushPathLayer, 0);
  objc_storeStrong((id *)&self->_exclusionMaskLayer, 0);
  objc_storeStrong(&self->_bridgedExclusionMaskCGImage, 0);
  objc_destroyWeak((id *)&self->_mediaView);
  objc_storeStrong((id *)&self->_brushStrokeExclusionMask, 0);
}

- (void)setLastCursorRadius:(double)a3
{
  self->_lastCursorRadius = a3;
}

- (double)lastCursorRadius
{
  return self->_lastCursorRadius;
}

- (void)setCursorLayer:(id)a3
{
}

- (CAShapeLayer)cursorLayer
{
  return self->_cursorLayer;
}

- (void)setBrushPath:(id)a3
{
}

- (UIBezierPath)brushPath
{
  return self->_brushPath;
}

- (void)setBrushPathLayer:(id)a3
{
}

- (CAShapeLayer)brushPathLayer
{
  return self->_brushPathLayer;
}

- (void)setIsHDR:(BOOL)a3
{
  self->_isHDR = a3;
}

- (BOOL)isHDR
{
  return self->_isHDR;
}

- (void)setExclusionMaskLayer:(id)a3
{
}

- (CALayer)exclusionMaskLayer
{
  return self->_exclusionMaskLayer;
}

- (void)setBridgedExclusionMaskCGImage:(id)a3
{
}

- (id)bridgedExclusionMaskCGImage
{
  return self->_bridgedExclusionMaskCGImage;
}

- (void)setMediaView:(id)a3
{
}

- (NUMediaView)mediaView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mediaView);
  return (NUMediaView *)WeakRetained;
}

- (BOOL)shouldDrawCursor
{
  return self->_shouldDrawCursor;
}

- (void)setNeedsClearing:(BOOL)a3
{
  self->_needsClearing = a3;
}

- (BOOL)needsClearing
{
  return self->_needsClearing;
}

- (CIImage)brushStrokeExclusionMask
{
  return self->_brushStrokeExclusionMask;
}

- (void)drawCursorAtPoint:(CGPoint)a3 withRadius:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  v48[5] = *MEMORY[0x1E4F143B8];
  [(PUCleanupToolBrushView *)self lastCursorRadius];
  if (v8 != a4)
  {
    v9 = [(PUCleanupToolBrushView *)self cursorLayer];
    [v9 removeFromSuperlayer];

    [(PUCleanupToolBrushView *)self setCursorLayer:0];
    [(PUCleanupToolBrushView *)self setLastCursorRadius:a4];
  }
  v10 = [(PUCleanupToolBrushView *)self cursorLayer];

  if (!v10)
  {
    v11 = [(PUCleanupToolBrushView *)self window];
    v12 = [v11 screen];

    [MEMORY[0x1E4F7A798] currentEDRHeadroomForScreen:v12];
    double v14 = v13;
    [MEMORY[0x1E4F7A4A0] thresholdDisplayHeadroom];
    if ([(PUCleanupToolBrushView *)self isHDR] && v14 >= v15) {
      double v16 = 2.0;
    }
    else {
      double v16 = 1.0;
    }
    double v17 = *MEMORY[0x1E4F1DAD8];
    double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    CGFloat v19 = a4 * 2.0 + 3.0;
    v49.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v49.origin.double y = v18;
    v49.size.double width = v19;
    v49.size.double height = v19;
    CGRect v50 = CGRectInset(v49, 2.0, 2.0);
    double v45 = v50.origin.y;
    double v46 = v50.origin.x;
    double width = v50.size.width;
    double height = v50.size.height;
    v22 = [MEMORY[0x1E4F39C88] layer];
    [(PUCleanupToolBrushView *)self setCursorLayer:v22];

    v23 = [(PUCleanupToolBrushView *)self cursorLayer];
    id v24 = [MEMORY[0x1E4FB1618] colorWithWhite:v16 alpha:0.5];
    objc_msgSend(v23, "setStrokeColor:", objc_msgSend(v24, "CGColor"));

    v25 = [(PUCleanupToolBrushView *)self cursorLayer];
    [v25 setLineWidth:2.0];

    v26 = [(PUCleanupToolBrushView *)self cursorLayer];
    [v26 setFillColor:0];

    v27 = [(PUCleanupToolBrushView *)self cursorLayer];
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v17, v18, v19, v19);
    id v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setPath:", objc_msgSend(v28, "CGPath"));

    v29 = [(PUCleanupToolBrushView *)self cursorLayer];
    objc_msgSend(v29, "setBounds:", v17, v18, v19, v19);

    v30 = [(PUCleanupToolBrushView *)self cursorLayer];
    v47[0] = @"position";
    v31 = [MEMORY[0x1E4F1CA98] null];
    v48[0] = v31;
    v47[1] = @"bounds";
    v32 = [MEMORY[0x1E4F1CA98] null];
    v48[1] = v32;
    v47[2] = @"transform";
    v33 = [MEMORY[0x1E4F1CA98] null];
    v48[2] = v33;
    v47[3] = @"frame";
    v34 = [MEMORY[0x1E4F1CA98] null];
    v48[3] = v34;
    v47[4] = @"opacity";
    v35 = [MEMORY[0x1E4F1CA98] null];
    v48[4] = v35;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:5];
    [v30 setActions:v36];

    v37 = [MEMORY[0x1E4F39C88] layer];
    id v38 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
    objc_msgSend(v37, "setStrokeColor:", objc_msgSend(v38, "CGColor"));

    [v37 setLineWidth:2.0];
    [v37 setFillColor:0];
    objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v46, v45, width, height);
    id v39 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setPath:", objc_msgSend(v39, "CGPath"));

    v40 = [(PUCleanupToolBrushView *)self cursorLayer];
    [v40 addSublayer:v37];

    v41 = [(PUCleanupToolBrushView *)self layer];
    v42 = [(PUCleanupToolBrushView *)self cursorLayer];
    [v41 addSublayer:v42];

    v43 = [(PUCleanupToolBrushView *)self cursorLayer];
    [v43 setZPosition:2.0];
  }
  v44 = [(PUCleanupToolBrushView *)self cursorLayer];
  objc_msgSend(v44, "setPosition:", x, y);
}

- (void)setShouldDrawCursor:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldDrawCursor = a3;
  v4 = [(PUCleanupToolBrushView *)self cursorLayer];
  id v6 = v4;
  double v5 = 0.0;
  if (v3) {
    *(float *)&double v5 = 1.0;
  }
  [v4 setOpacity:v5];
}

- (void)removeStroke
{
  [(PUCleanupToolBrushView *)self setNeedsClearing:0];
  [(CAShapeLayer *)self->_brushPathLayer removeFromSuperlayer];
  [(CAShapeLayer *)self->_brushPathLayer setPath:0];
  [(UIBezierPath *)self->_brushPath removeAllPoints];
  [(CAShapeLayer *)self->_brushPathLayer setMask:0];
  brushPath = self->_brushPath;
  self->_brushPath = 0;

  brushPathLayer = self->_brushPathLayer;
  self->_brushPathLayer = 0;
}

- (void)addPointToStroke:(CGPoint)a3
{
  -[UIBezierPath addLineToPoint:](self->_brushPath, "addLineToPoint:", a3.x, a3.y);
  brushPathLayer = self->_brushPathLayer;
  double v5 = [(UIBezierPath *)self->_brushPath CGPath];
  [(CAShapeLayer *)brushPathLayer setPath:v5];
}

- (void)startStrokeWithPoint:(CGPoint)a3 radius:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  v51[5] = *MEMORY[0x1E4F143B8];
  [(PUCleanupToolBrushView *)self removeStroke];
  [(PUCleanupToolBrushView *)self setNeedsClearing:1];
  double v8 = [MEMORY[0x1E4F39C88] layer];
  brushPathLayer = self->_brushPathLayer;
  self->_brushPathLayer = v8;

  v10 = self->_brushPathLayer;
  v50[0] = @"position";
  v11 = [MEMORY[0x1E4F1CA98] null];
  v51[0] = v11;
  v50[1] = @"bounds";
  v12 = [MEMORY[0x1E4F1CA98] null];
  v51[1] = v12;
  v50[2] = @"transform";
  double v13 = [MEMORY[0x1E4F1CA98] null];
  v51[2] = v13;
  v50[3] = @"frame";
  double v14 = [MEMORY[0x1E4F1CA98] null];
  v51[3] = v14;
  v50[4] = @"opacity";
  double v15 = [MEMORY[0x1E4F1CA98] null];
  v51[4] = v15;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:5];
  [(CAShapeLayer *)v10 setActions:v16];

  [(CAShapeLayer *)self->_brushPathLayer setLineCap:*MEMORY[0x1E4F3A458]];
  [(CAShapeLayer *)self->_brushPathLayer setLineJoin:*MEMORY[0x1E4F3A478]];
  [(CAShapeLayer *)self->_brushPathLayer setLineWidth:8.0];
  [(CAShapeLayer *)self->_brushPathLayer setFillColor:0];
  double v17 = self->_brushPathLayer;
  id v18 = [MEMORY[0x1E4FB1618] whiteColor];
  -[CAShapeLayer setStrokeColor:](v17, "setStrokeColor:", [v18 CGColor]);

  CGFloat v19 = [MEMORY[0x1E4FB14C0] bezierPath];
  brushPath = self->_brushPath;
  self->_brushPath = v19;

  v21 = [(PUCleanupToolBrushView *)self layer];
  [v21 addSublayer:self->_brushPathLayer];

  [(CAShapeLayer *)self->_brushPathLayer setZPosition:1.0];
  v22 = [(PUCleanupToolBrushView *)self bridgedExclusionMaskCGImage];

  if (v22)
  {
    v23 = [(PUCleanupToolBrushView *)self mediaView];
    [v23 imageFrame];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    v32 = [(PUCleanupToolBrushView *)self mediaView];
    objc_msgSend(v32, "convertRect:toView:", self, v25, v27, v29, v31);
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;

    v41 = [(PUCleanupToolBrushView *)self exclusionMaskLayer];
    if (v41) {
      [(PUCleanupToolBrushView *)self exclusionMaskLayer];
    }
    else {
    v42 = [MEMORY[0x1E4F39BE8] layer];
    }

    objc_msgSend(v42, "setFrame:", v34, v36, v38, v40);
    [v42 setContents:v22];
    [(CAShapeLayer *)self->_brushPathLayer setMask:v42];
  }
  else
  {
    [(CAShapeLayer *)self->_brushPathLayer setMask:0];
  }
  v43 = [(PUCleanupToolBrushView *)self window];
  v44 = [v43 screen];

  [MEMORY[0x1E4F7A798] currentEDRHeadroomForScreen:v44];
  double v46 = v45;
  [MEMORY[0x1E4F7A4A0] thresholdDisplayHeadroom];
  if ([(PUCleanupToolBrushView *)self isHDR] && v46 >= v47) {
    double v48 = 2.0;
  }
  else {
    double v48 = 1.0;
  }
  [(CAShapeLayer *)self->_brushPathLayer setFillColor:0];
  id v49 = [MEMORY[0x1E4FB1618] colorWithWhite:v48 alpha:0.5];
  -[CAShapeLayer setStrokeColor:](self->_brushPathLayer, "setStrokeColor:", [v49 CGColor]);
  [(CAShapeLayer *)self->_brushPathLayer setLineWidth:a4 + a4];
  -[UIBezierPath moveToPoint:](self->_brushPath, "moveToPoint:", x, y);
  [(CAShapeLayer *)self->_brushPathLayer setPath:[(UIBezierPath *)self->_brushPath CGPath]];
}

- (void)setBrushStrokeExclusionMask:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    objc_storeStrong((id *)&self->_brushStrokeExclusionMask, a3);
    double v5 = [v8 imageByApplyingFilter:@"CIMaskToAlpha"];
    id v6 = [MEMORY[0x1E4F1E018] context];
    [v5 extent];
    v7 = objc_msgSend(v6, "createCGImage:fromRect:", v5);

    [(PUCleanupToolBrushView *)self setBridgedExclusionMaskCGImage:v7];
  }
  else
  {
    [(PUCleanupToolBrushView *)self setBridgedExclusionMaskCGImage:0];
    [(CAShapeLayer *)self->_brushPathLayer setMask:0];
  }
}

- (PUCleanupToolBrushView)initWithMediaView:(id)a3 isHDR:(BOOL)a4
{
  id v7 = a3;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUCleanupToolBrushView.m", 44, @"Invalid parameter not satisfying: %@", @"mediaView != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PUCleanupToolBrushView;
  id v8 = -[PUCleanupToolBrushView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_mediaView, v7);
    v9->_isHDR = a4;
    v9->_lastCursorRadius = 0.0;
    v10 = [(PUCleanupToolBrushView *)v9 layer];
    [v10 setWantsExtendedDynamicRangeContent:1];
  }
  return v9;
}

@end