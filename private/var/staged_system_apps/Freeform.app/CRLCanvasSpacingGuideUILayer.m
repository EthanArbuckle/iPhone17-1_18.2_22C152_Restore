@interface CRLCanvasSpacingGuideUILayer
- (CRLCanvasSpacingGuideUILayer)initWithSpacingRect:(CGRect)a3 ofOrientation:(int)a4 icc:(id)a5 useVisibleRect:(BOOL)a6;
- (void)p_generateArrowLayerForSpacingRect:(CGRect)a3 andViewScale:(double)a4;
- (void)setFrameFromSpacingRect:(CGRect)a3 icc:(id)a4;
@end

@implementation CRLCanvasSpacingGuideUILayer

- (CRLCanvasSpacingGuideUILayer)initWithSpacingRect:(CGRect)a3 ofOrientation:(int)a4 icc:(id)a5 useVisibleRect:(BOOL)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRLCanvasSpacingGuideUILayer;
  v13 = [(CRLCanvasSpacingGuideUILayer *)&v17 init];
  if (v13)
  {
    if (a4) {
      +[CRLSwappableAxesGeometry swappedAxesGeometry];
    }
    else {
    uint64_t v14 = +[CRLSwappableAxesGeometry standardAxesGeometry];
    }
    mHorizontalGeom = v13->mHorizontalGeom;
    v13->mHorizontalGeom = (CRLSwappableAxesGeometry *)v14;

    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    -[CRLCanvasSpacingGuideUILayer setFrameFromSpacingRect:icc:](v13, "setFrameFromSpacingRect:icc:", v12, x, y, width, height);
    +[CATransaction commit];
  }

  return v13;
}

- (void)setFrameFromSpacingRect:(CGRect)a3 icc:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  if (self->mUseVisibleRect)
  {
    [v9 visibleScaledRectForCanvasUI];
    double v81 = v11;
    double v82 = v10;
    double v80 = v12;
    double rect = v13;
  }
  else
  {
    double v81 = CGRectNull.origin.y;
    double v82 = CGRectNull.origin.x;
    double v80 = CGRectNull.size.width;
    double rect = CGRectNull.size.height;
  }
  [v9 viewScale];
  double v79 = v14;
  CGAffineTransformMakeScale(&v84, v14, v14);
  v85.origin.CGFloat x = x;
  v85.origin.CGFloat y = y;
  v85.size.CGFloat width = width;
  v85.size.CGFloat height = height;
  CGRect v86 = CGRectApplyAffineTransform(v85, &v84);
  double v15 = v86.origin.x;
  double v16 = v86.origin.y;
  double v17 = v86.size.width;
  double v18 = v86.size.height;
  mHorizontalGeom = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectMinX:](mHorizontalGeom, "rectMinX:");
  double v21 = v20;
  -[CRLSwappableAxesGeometry rectMinY:](self->mHorizontalGeom, "rectMinY:", v15, v16, v17, v18);
  [(CRLSwappableAxesGeometry *)mHorizontalGeom makePointWithX:v21 Y:v22];
  double v24 = v23;
  double v26 = v25;
  v27 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectMaxX:](v27, "rectMaxX:", v15, v16, v17, v18);
  double v29 = v28;
  -[CRLSwappableAxesGeometry rectMaxY:](self->mHorizontalGeom, "rectMaxY:", v15, v16, v17, v18);
  [(CRLSwappableAxesGeometry *)v27 makePointWithX:v29 Y:v30];
  double v32 = v31;
  v87.origin.CGFloat y = v81;
  v87.origin.CGFloat x = v82;
  v87.size.CGFloat width = v80;
  v87.size.CGFloat height = rect;
  if (!CGRectIsNull(v87))
  {
    v33 = self->mHorizontalGeom;
    -[CRLSwappableAxesGeometry rectMinX:](v33, "rectMinX:", v15, v16, v17, v18);
    double v77 = v34;
    -[CRLSwappableAxesGeometry rectMinY:](self->mHorizontalGeom, "rectMinY:", v15, v16, v17, v18);
    double v36 = v35;
    -[CRLSwappableAxesGeometry rectMinY:](self->mHorizontalGeom, "rectMinY:", v82, v81, v80, rect);
    [(CRLSwappableAxesGeometry *)v33 makePointWithX:v77 Y:fmax(v36, v37)];
    double v76 = v38;
    double v78 = v39;
    v40 = self->mHorizontalGeom;
    -[CRLSwappableAxesGeometry rectMaxX:](v40, "rectMaxX:", v15, v16, v17, v18);
    double v42 = v41;
    -[CRLSwappableAxesGeometry rectMaxY:](self->mHorizontalGeom, "rectMaxY:", v15, v16, v17, v18);
    double v44 = v43;
    double v24 = v76;
    -[CRLSwappableAxesGeometry rectMaxY:](self->mHorizontalGeom, "rectMaxY:", v82, v81, v80, rect);
    double v46 = fmin(v44, v45);
    double v47 = v42;
    double v26 = v78;
    [(CRLSwappableAxesGeometry *)v40 makePointWithX:v47 Y:v46];
    double v32 = v48;
  }
  double v49 = sub_100064044(v24, v26, v32);
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  v56 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectMinX:](v56, "rectMinX:");
  double v58 = v57;
  -[CRLSwappableAxesGeometry rectMidY:](self->mHorizontalGeom, "rectMidY:", v49, v51, v53, v55);
  double v60 = v59 + 1.0 + -7.0 / v79;
  -[CRLSwappableAxesGeometry rectWidth:](self->mHorizontalGeom, "rectWidth:", v49, v51, v53, v55);
  [(CRLSwappableAxesGeometry *)v56 makeRectWithX:v58 Y:v60 width:v61 height:15.0];
  double v66 = sub_10006757C(v62, v63, v64, v65);
  double v68 = v67;
  double v70 = v69;
  double v72 = v71;
  -[CRLCanvasSpacingGuideUILayer setFrame:](self, "setFrame:");
  double mWidth = self->mWidth;
  -[CRLSwappableAxesGeometry rectWidth:](self->mHorizontalGeom, "rectWidth:", v66, v68, v70, v72);
  if (mWidth != v74)
  {
    [(CAShapeLayer *)self->mArrowLayer removeFromSuperlayer];
    -[CRLCanvasSpacingGuideUILayer p_generateArrowLayerForSpacingRect:andViewScale:](self, "p_generateArrowLayerForSpacingRect:andViewScale:", v66, v68, v70, v72, v79);
    -[CRLSwappableAxesGeometry rectWidth:](self->mHorizontalGeom, "rectWidth:", v66, v68, v70, v72);
    self->double mWidth = v75;
  }
  +[CATransaction commit];
}

- (void)p_generateArrowLayerForSpacingRect:(CGRect)a3 andViewScale:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
  mArrowLayer = self->mArrowLayer;
  self->mArrowLayer = v9;

  Mutable = CGPathCreateMutable();
  [(CRLSwappableAxesGeometry *)self->mHorizontalGeom makePointWithX:0.5 Y:0.5];
  CGFloat v79 = v13;
  CGFloat v80 = v12;
  mHorizontalGeom = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectHeight:](mHorizontalGeom, "rectHeight:", x, y, width, height);
  [(CRLSwappableAxesGeometry *)mHorizontalGeom makePointWithX:1.5 Y:v15 * 0.5];
  CGFloat v71 = v16;
  CGFloat v76 = v17;
  double v18 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectHeight:](v18, "rectHeight:", x, y, width, height);
  [(CRLSwappableAxesGeometry *)v18 makePointWithX:0.5 Y:v19 + -0.5];
  CGFloat v77 = v21;
  CGFloat v78 = v20;
  double v22 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectWidth:](v22, "rectWidth:", x, y, width, height);
  [(CRLSwappableAxesGeometry *)v22 makePointWithX:v23 + -0.5 Y:0.5];
  CGFloat v74 = v25;
  CGFloat v75 = v24;
  double v26 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectWidth:](v26, "rectWidth:", x, y, width, height);
  double v28 = v27 + -1.5;
  -[CRLSwappableAxesGeometry rectHeight:](self->mHorizontalGeom, "rectHeight:", x, y, width, height);
  [(CRLSwappableAxesGeometry *)v26 makePointWithX:v28 Y:v29 * 0.5];
  CGFloat v72 = v31;
  CGFloat v73 = v30;
  double v32 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectWidth:](v32, "rectWidth:", x, y, width, height);
  double v34 = v33 + -0.5;
  -[CRLSwappableAxesGeometry rectHeight:](self->mHorizontalGeom, "rectHeight:", x, y, width, height);
  [(CRLSwappableAxesGeometry *)v32 makePointWithX:v34 Y:v35 + -0.5];
  CGFloat v69 = v37;
  CGFloat v70 = v36;
  double v38 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectHeight:](v38, "rectHeight:", x, y, width, height);
  [(CRLSwappableAxesGeometry *)v38 makePointWithX:5.5 Y:v39 * 0.5 + -3.0];
  CGFloat v67 = v41;
  CGFloat v68 = v40;
  double v42 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectHeight:](v42, "rectHeight:", x, y, width, height);
  [(CRLSwappableAxesGeometry *)v42 makePointWithX:5.5 Y:v43 * 0.5 + 3.0];
  CGFloat v65 = v45;
  CGFloat v66 = v44;
  double v46 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectWidth:](v46, "rectWidth:", x, y, width, height);
  double v48 = v47 + -5.5;
  -[CRLSwappableAxesGeometry rectHeight:](self->mHorizontalGeom, "rectHeight:", x, y, width, height);
  [(CRLSwappableAxesGeometry *)v46 makePointWithX:v48 Y:v49 * 0.5 + -3.0];
  CGFloat v63 = v51;
  CGFloat v64 = v50;
  double v52 = self->mHorizontalGeom;
  -[CRLSwappableAxesGeometry rectWidth:](v52, "rectWidth:", x, y, width, height);
  double v54 = v53 + -5.5;
  -[CRLSwappableAxesGeometry rectHeight:](self->mHorizontalGeom, "rectHeight:", x, y, width, height);
  [(CRLSwappableAxesGeometry *)v52 makePointWithX:v54 Y:v55 * 0.5 + 3.0];
  CGFloat v61 = v57;
  CGFloat v62 = v56;
  CGPathMoveToPoint(Mutable, 0, v80, v79);
  CGPathAddLineToPoint(Mutable, 0, v78, v77);
  CGPathMoveToPoint(Mutable, 0, v75, v74);
  CGPathAddLineToPoint(Mutable, 0, v70, v69);
  CGPathMoveToPoint(Mutable, 0, v71, v76);
  CGPathAddLineToPoint(Mutable, 0, v73, v72);
  -[CRLSwappableAxesGeometry rectWidth:](self->mHorizontalGeom, "rectWidth:", x, y, width, height);
  if (v58 * a4 >= 14.0)
  {
    CGPathMoveToPoint(Mutable, 0, v68, v67);
    CGPathAddLineToPoint(Mutable, 0, v71, v76);
    CGPathAddLineToPoint(Mutable, 0, v66, v65);
    CGPathMoveToPoint(Mutable, 0, v64, v63);
    CGPathAddLineToPoint(Mutable, 0, v73, v72);
    CGPathAddLineToPoint(Mutable, 0, v62, v61);
  }
  [(CAShapeLayer *)self->mArrowLayer setFillColor:0];
  double v59 = +[CRLCanvasGuideController guideColor];
  -[CAShapeLayer setStrokeColor:](self->mArrowLayer, "setStrokeColor:", [v59 CGColor]);

  [(CAShapeLayer *)self->mArrowLayer setLineCap:kCALineCapSquare];
  [(CAShapeLayer *)self->mArrowLayer setLineWidth:1.0];
  [(CAShapeLayer *)self->mArrowLayer setPath:Mutable];
  CGPathRelease(Mutable);
  double v60 = self->mArrowLayer;

  [(CRLCanvasSpacingGuideUILayer *)self addSublayer:v60];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mHorizontalGeom, 0);

  objc_storeStrong((id *)&self->mArrowLayer, 0);
}

@end