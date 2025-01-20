@interface PHRingHighlightView
+ (CGSize)ringSize;
+ (double)ringCornerRadius;
+ (double)ringStroke;
+ (id)colorForDodge;
+ (id)colorForLuminance;
+ (id)createRingImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5;
+ (id)ringImageForDodge;
+ (id)ringImageForLuminance;
- (CALayer)dodgeRingLayer;
- (CALayer)highlightDodgeLayer;
- (CALayer)highlightLuminanceLayer;
- (CALayer)luminanceRingLayer;
- (CALayer)selectionLayer;
- (CGSize)intrinsicContentSize;
- (PHRingHighlightView)initWithFrame:(CGRect)a3;
- (void)setDodgeRingLayer:(id)a3;
- (void)setHighlightDodgeLayer:(id)a3;
- (void)setHighlightLuminanceLayer:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLuminanceRingLayer:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionLayer:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation PHRingHighlightView

+ (CGSize)ringSize
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  v5 = +[UIDevice currentDevice];
  unint64_t v6 = (unint64_t)[v5 userInterfaceIdiom];

  double v7 = 480.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 1024.0;
  }
  *(double *)&uint64_t v8 = 75.0;
  if (v4 <= v7)
  {
    v9 = +[UIDevice currentDevice];
    unint64_t v10 = (unint64_t)[v9 userInterfaceIdiom];

    uint64_t v8 = *((uint64_t *)&unk_10007D590 + ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1));
  }

  double v11 = *(double *)&v8;
  double v12 = *(double *)&v8;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (double)ringStroke
{
  return 1.5;
}

+ (double)ringCornerRadius
{
  [(id)objc_opt_class() ringSize];
  return v2 * 0.5;
}

+ (id)colorForLuminance
{
  return +[UIColor colorWithWhite:1.0 alpha:0.0500000007];
}

+ (id)colorForDodge
{
  return +[UIColor colorWithWhite:0.600000024 alpha:1.0];
}

+ (id)ringImageForLuminance
{
  double v3 = (void *)qword_1000BBFF0;
  if (!qword_1000BBFF0)
  {
    [a1 ringSize];
    double v5 = v4;
    double v7 = v6;
    [a1 ringStroke];
    double v9 = v8;
    unint64_t v10 = [a1 colorForLuminance];
    uint64_t v11 = [a1 createRingImageWithSize:v10 strokeWidth:v5 color:v7];
    double v12 = (void *)qword_1000BBFF0;
    qword_1000BBFF0 = v11;

    double v3 = (void *)qword_1000BBFF0;
  }

  return v3;
}

+ (id)ringImageForDodge
{
  double v3 = (void *)qword_1000BBFF8;
  if (!qword_1000BBFF8)
  {
    [a1 ringSize];
    double v5 = v4;
    double v7 = v6;
    [a1 ringStroke];
    double v9 = v8;
    unint64_t v10 = [a1 colorForDodge];
    uint64_t v11 = [a1 createRingImageWithSize:v10 strokeWidth:v5 color:v7];
    double v12 = (void *)qword_1000BBFF8;
    qword_1000BBFF8 = v11;

    double v3 = (void *)qword_1000BBFF8;
  }

  return v3;
}

+ (id)createRingImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  v21.origin.double x = 0.0;
  v21.origin.double y = 0.0;
  v21.size.double width = width;
  v21.size.double height = height;
  CGRect v22 = CGRectInset(v21, a4, a4);
  double x = v22.origin.x;
  double y = v22.origin.y;
  double v12 = v22.size.width;
  double v13 = v22.size.height;
  v22.origin.double x = width;
  v22.origin.double y = height;
  UIGraphicsBeginImageContextWithOptions((CGSize)v22.origin, 0, 0.0);
  [a1 ringCornerRadius];
  v15 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, v14);
  [a1 ringCornerRadius];
  v17 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", x, y, v12, v13, v16 - a4);
  [v15 appendPath:v17];

  [v15 setUsesEvenOddFillRule:1];
  [v9 setFill];

  [v15 fill];
  v18 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v18;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  +[CATransaction begin];
  LODWORD(v5) = 1043207291;
  double v6 = +[NSNumber numberWithFloat:v5];
  +[CATransaction setValue:v6 forKey:kCATransactionAnimationDuration];

  double v7 = 0.0;
  if (v3)
  {
    [(CALayer *)self->_highlightDodgeLayer setOpacity:0.0];
    LODWORD(v7) = 1.0;
  }
  [(CALayer *)self->_selectionLayer setOpacity:v7];

  +[CATransaction commit];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  +[CATransaction begin];
  LODWORD(v5) = 1043207291;
  double v6 = +[NSNumber numberWithFloat:v5];
  +[CATransaction setValue:v6 forKey:kCATransactionAnimationDuration];

  if (v3) {
    float v7 = 1.0;
  }
  else {
    float v7 = 0.0;
  }
  [(CALayer *)self->_highlightDodgeLayer setOpacity:COERCE_DOUBLE((unint64_t)LODWORD(v7))];
  *(float *)&double v8 = v7;
  [(CALayer *)self->_highlightLuminanceLayer setOpacity:v8];

  +[CATransaction commit];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PHRingHighlightView;
  -[PHRingHighlightView setUserInteractionEnabled:](&v11, "setUserInteractionEnabled:");
  +[CATransaction begin];
  LODWORD(v5) = 1043207291;
  double v6 = +[NSNumber numberWithFloat:v5];
  +[CATransaction setValue:v6 forKey:kCATransactionAnimationDuration];

  float v8 = 1.0;
  if (!a3)
  {
    id v9 = +[UIDevice currentDevice];
    float v8 = flt_10007D588[[v9 _graphicsQuality] == (id)10];
  }
  *(float *)&double v7 = v8;
  [(CALayer *)self->_luminanceRingLayer setOpacity:v7];
  *(float *)&double v10 = v8;
  [(CALayer *)self->_dodgeRingLayer setOpacity:v10];
  +[CATransaction commit];
}

- (PHRingHighlightView)initWithFrame:(CGRect)a3
{
  v60.receiver = self;
  v60.super_class = (Class)PHRingHighlightView;
  BOOL v3 = -[PHRingHighlightView initWithFrame:](&v60, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PHRingHighlightView *)v3 setUserInteractionEnabled:0];
    [(PHRingHighlightView *)v4 setOpaque:0];
    double v5 = +[UIColor clearColor];
    [(PHRingHighlightView *)v4 setBackgroundColor:v5];

    double v6 = [(PHRingHighlightView *)v4 layer];
    [v6 setAllowsGroupBlending:0];

    double v7 = [(PHRingHighlightView *)v4 layer];
    [v7 setAllowsGroupOpacity:0];

    uint64_t v8 = +[CALayer layer];
    luminanceRingLayer = v4->_luminanceRingLayer;
    v4->_luminanceRingLayer = (CALayer *)v8;

    id v10 = [(id)objc_opt_class() ringImageForLuminance];
    -[CALayer setContents:](v4->_luminanceRingLayer, "setContents:", [v10 CGImage]);

    uint64_t v11 = kCAFilterPlusL;
    double v12 = +[CAFilter filterWithType:kCAFilterPlusL];
    [(CALayer *)v4->_luminanceRingLayer setCompositingFilter:v12];

    [(id)objc_opt_class() ringSize];
    double v14 = v13;
    [(id)objc_opt_class() ringSize];
    -[CALayer setFrame:](v4->_luminanceRingLayer, "setFrame:", 0.0, 0.0, v14, v15);
    double v16 = [(PHRingHighlightView *)v4 layer];
    [v16 addSublayer:v4->_luminanceRingLayer];

    uint64_t v17 = +[CALayer layer];
    dodgeRingLayer = v4->_dodgeRingLayer;
    v4->_dodgeRingLayer = (CALayer *)v17;

    id v19 = [(id)objc_opt_class() ringImageForDodge];
    -[CALayer setContents:](v4->_dodgeRingLayer, "setContents:", [v19 CGImage]);

    uint64_t v20 = kCAFilterColorDodgeBlendMode;
    CGRect v21 = +[CAFilter filterWithType:kCAFilterColorDodgeBlendMode];
    [(CALayer *)v4->_dodgeRingLayer setCompositingFilter:v21];

    [(id)objc_opt_class() ringSize];
    double v23 = v22;
    [(id)objc_opt_class() ringSize];
    -[CALayer setFrame:](v4->_dodgeRingLayer, "setFrame:", 0.0, 0.0, v23, v24);
    v25 = [(PHRingHighlightView *)v4 layer];
    [v25 addSublayer:v4->_dodgeRingLayer];

    uint64_t v26 = +[CALayer layer];
    highlightDodgeLayer = v4->_highlightDodgeLayer;
    v4->_highlightDodgeLayer = (CALayer *)v26;

    id v28 = [(id)objc_opt_class() colorForDodge];
    -[CALayer setBackgroundColor:](v4->_highlightDodgeLayer, "setBackgroundColor:", [v28 CGColor]);

    v29 = +[CAFilter filterWithType:v20];
    [(CALayer *)v4->_highlightDodgeLayer setCompositingFilter:v29];

    [(id)objc_opt_class() ringSize];
    CGFloat v31 = v30;
    [(id)objc_opt_class() ringSize];
    CGFloat v33 = v32;
    [(id)objc_opt_class() ringStroke];
    CGFloat v35 = v34;
    [(id)objc_opt_class() ringStroke];
    CGFloat v37 = v36;
    v61.origin.double x = 0.0;
    v61.origin.double y = 0.0;
    v61.size.double width = v31;
    v61.size.double height = v33;
    CGRect v62 = CGRectInset(v61, v35, v37);
    double width = v62.size.width;
    double height = v62.size.height;
    [(id)objc_opt_class() ringStroke];
    double v41 = v40;
    [(id)objc_opt_class() ringStroke];
    -[CALayer setFrame:](v4->_highlightDodgeLayer, "setFrame:", v41, v42, width, height);
    [(id)objc_opt_class() ringCornerRadius];
    double v44 = v43;
    [(id)objc_opt_class() ringStroke];
    [(CALayer *)v4->_highlightDodgeLayer setCornerRadius:v44 - v45];
    [(CALayer *)v4->_highlightDodgeLayer setOpacity:0.0];
    v46 = [(PHRingHighlightView *)v4 layer];
    [v46 addSublayer:v4->_highlightDodgeLayer];

    uint64_t v47 = +[CALayer layer];
    highlightLuminanceLayer = v4->_highlightLuminanceLayer;
    v4->_highlightLuminanceLayer = (CALayer *)v47;

    id v49 = [(id)objc_opt_class() colorForLuminance];
    -[CALayer setBackgroundColor:](v4->_highlightLuminanceLayer, "setBackgroundColor:", [v49 CGColor]);

    v50 = +[CAFilter filterWithType:v11];
    [(CALayer *)v4->_highlightLuminanceLayer setCompositingFilter:v50];

    [(CALayer *)v4->_highlightDodgeLayer frame];
    -[CALayer setFrame:](v4->_highlightLuminanceLayer, "setFrame:");
    [(CALayer *)v4->_highlightDodgeLayer cornerRadius];
    -[CALayer setCornerRadius:](v4->_highlightLuminanceLayer, "setCornerRadius:");
    [(CALayer *)v4->_highlightLuminanceLayer setOpacity:0.0];
    v51 = [(PHRingHighlightView *)v4 layer];
    [v51 insertSublayer:v4->_highlightLuminanceLayer below:v4->_highlightDodgeLayer];

    uint64_t v52 = +[CALayer layer];
    selectionLayer = v4->_selectionLayer;
    v4->_selectionLayer = (CALayer *)v52;

    id v54 = +[UIColor whiteColor];
    -[CALayer setBackgroundColor:](v4->_selectionLayer, "setBackgroundColor:", [v54 CGColor]);

    [(id)objc_opt_class() ringSize];
    double v56 = v55;
    [(id)objc_opt_class() ringSize];
    -[CALayer setFrame:](v4->_selectionLayer, "setFrame:", 0.0, 0.0, v56, v57);
    [(id)objc_opt_class() ringCornerRadius];
    -[CALayer setCornerRadius:](v4->_selectionLayer, "setCornerRadius:");
    [(CALayer *)v4->_selectionLayer setOpacity:0.0];
    v58 = [(PHRingHighlightView *)v4 layer];
    [v58 addSublayer:v4->_selectionLayer];
  }
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2 = objc_opt_class();

  [v2 ringSize];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CALayer)luminanceRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLuminanceRingLayer:(id)a3
{
}

- (CALayer)dodgeRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDodgeRingLayer:(id)a3
{
}

- (CALayer)highlightDodgeLayer
{
  return (CALayer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHighlightDodgeLayer:(id)a3
{
}

- (CALayer)highlightLuminanceLayer
{
  return (CALayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHighlightLuminanceLayer:(id)a3
{
}

- (CALayer)selectionLayer
{
  return (CALayer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSelectionLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_highlightLuminanceLayer, 0);
  objc_storeStrong((id *)&self->_highlightDodgeLayer, 0);
  objc_storeStrong((id *)&self->_dodgeRingLayer, 0);

  objc_storeStrong((id *)&self->_luminanceRingLayer, 0);
}

@end