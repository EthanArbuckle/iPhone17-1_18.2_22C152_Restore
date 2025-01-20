@interface TPRingView
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
- (TPRingView)initWithFrame:(CGRect)a3;
- (void)setDodgeRingLayer:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlightDodgeLayer:(id)a3;
- (void)setHighlightLuminanceLayer:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLuminanceRingLayer:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionLayer:(id)a3;
@end

@implementation TPRingView

+ (CGSize)ringSize
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;
  v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 480.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 1024.0;
  }
  *(double *)&uint64_t v8 = 75.0;
  if (v4 <= v7)
  {
    v9 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v10 = [v9 userInterfaceIdiom];

    uint64_t v8 = *((uint64_t *)&unk_1C2F731A0 + ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1));
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
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.0500000007];
}

+ (id)colorForDodge
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.600000024 alpha:1.0];
}

+ (id)ringImageForLuminance
{
  double v3 = (void *)ringImageForLuminance;
  if (!ringImageForLuminance)
  {
    [a1 ringSize];
    double v5 = v4;
    double v7 = v6;
    [a1 ringStroke];
    double v9 = v8;
    uint64_t v10 = [a1 colorForLuminance];
    uint64_t v11 = objc_msgSend(a1, "createRingImageWithSize:strokeWidth:color:", v10, v5, v7, v9);
    double v12 = (void *)ringImageForLuminance;
    ringImageForLuminance = v11;

    double v3 = (void *)ringImageForLuminance;
  }
  return v3;
}

+ (id)ringImageForDodge
{
  double v3 = (void *)ringImageForDodge;
  if (!ringImageForDodge)
  {
    [a1 ringSize];
    double v5 = v4;
    double v7 = v6;
    [a1 ringStroke];
    double v9 = v8;
    uint64_t v10 = [a1 colorForDodge];
    uint64_t v11 = objc_msgSend(a1, "createRingImageWithSize:strokeWidth:color:", v10, v5, v7, v9);
    double v12 = (void *)ringImageForDodge;
    ringImageForDodge = v11;

    double v3 = (void *)ringImageForDodge;
  }
  return v3;
}

+ (id)createRingImageWithSize:(CGSize)a3 strokeWidth:(double)a4 color:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a5;
  v23.origin.double x = 0.0;
  v23.origin.double y = 0.0;
  v23.size.double width = width;
  v23.size.double height = height;
  CGRect v24 = CGRectInset(v23, a4, a4);
  double x = v24.origin.x;
  double y = v24.origin.y;
  double v12 = v24.size.width;
  double v13 = v24.size.height;
  v24.origin.double x = width;
  v24.origin.double y = height;
  UIGraphicsBeginImageContextWithOptions((CGSize)v24.origin, 0, 0.0);
  v14 = (void *)MEMORY[0x1E4FB14C0];
  [a1 ringCornerRadius];
  v16 = objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, width, height, v15);
  v17 = (void *)MEMORY[0x1E4FB14C0];
  [a1 ringCornerRadius];
  v19 = objc_msgSend(v17, "bezierPathWithRoundedRect:cornerRadius:", x, y, v12, v13, v18 - a4);
  [v16 appendPath:v19];

  [v16 setUsesEvenOddFillRule:1];
  [v9 setFill];

  [v16 fill];
  v20 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v20;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  double v5 = (void *)MEMORY[0x1E4F39CF8];
  LODWORD(v6) = 1043207291;
  double v7 = [NSNumber numberWithFloat:v6];
  [v5 setValue:v7 forKey:*MEMORY[0x1E4F3A598]];

  double v8 = 0.0;
  if (v3)
  {
    [(CALayer *)self->_highlightDodgeLayer setOpacity:0.0];
    LODWORD(v8) = 1.0;
  }
  [(CALayer *)self->_selectionLayer setOpacity:v8];
  id v9 = (void *)MEMORY[0x1E4F39CF8];
  [v9 commit];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  double v5 = (void *)MEMORY[0x1E4F39CF8];
  LODWORD(v6) = 1043207291;
  double v7 = [NSNumber numberWithFloat:v6];
  [v5 setValue:v7 forKey:*MEMORY[0x1E4F3A598]];

  if (v3) {
    float v8 = 1.0;
  }
  else {
    float v8 = 0.0;
  }
  [(CALayer *)self->_highlightDodgeLayer setOpacity:COERCE_DOUBLE((unint64_t)LODWORD(v8))];
  *(float *)&double v9 = v8;
  [(CALayer *)self->_highlightLuminanceLayer setOpacity:v9];
  uint64_t v10 = (void *)MEMORY[0x1E4F39CF8];
  [v10 commit];
}

- (void)setEnabled:(BOOL)a3
{
  [MEMORY[0x1E4F39CF8] begin];
  double v5 = (void *)MEMORY[0x1E4F39CF8];
  LODWORD(v6) = 1043207291;
  double v7 = [NSNumber numberWithFloat:v6];
  [v5 setValue:v7 forKey:*MEMORY[0x1E4F3A598]];

  float v9 = 1.0;
  if (!a3)
  {
    uint64_t v10 = [MEMORY[0x1E4FB16C8] currentDevice];
    float v9 = flt_1C2F73190[[v10 _graphicsQuality] == 10];
  }
  *(float *)&double v8 = v9;
  [(CALayer *)self->_luminanceRingLayer setOpacity:v8];
  *(float *)&double v11 = v9;
  [(CALayer *)self->_dodgeRingLayer setOpacity:v11];
  double v12 = (void *)MEMORY[0x1E4F39CF8];
  [v12 commit];
}

- (TPRingView)initWithFrame:(CGRect)a3
{
  v60.receiver = self;
  v60.super_class = (Class)TPRingView;
  BOOL v3 = -[TPRingView initWithFrame:](&v60, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(TPRingView *)v3 setUserInteractionEnabled:0];
    [(TPRingView *)v4 setOpaque:0];
    double v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(TPRingView *)v4 setBackgroundColor:v5];

    double v6 = [(TPRingView *)v4 layer];
    [v6 setAllowsGroupBlending:0];

    double v7 = [(TPRingView *)v4 layer];
    [v7 setAllowsGroupOpacity:0];

    uint64_t v8 = [MEMORY[0x1E4F39BE8] layer];
    luminanceRingLayer = v4->_luminanceRingLayer;
    v4->_luminanceRingLayer = (CALayer *)v8;

    id v10 = [(id)objc_opt_class() ringImageForLuminance];
    -[CALayer setContents:](v4->_luminanceRingLayer, "setContents:", [v10 CGImage]);

    uint64_t v11 = *MEMORY[0x1E4F3A2E8];
    double v12 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    [(CALayer *)v4->_luminanceRingLayer setCompositingFilter:v12];

    [(id)objc_opt_class() ringSize];
    double v14 = v13;
    [(id)objc_opt_class() ringSize];
    -[CALayer setFrame:](v4->_luminanceRingLayer, "setFrame:", 0.0, 0.0, v14, v15);
    v16 = [(TPRingView *)v4 layer];
    [v16 addSublayer:v4->_luminanceRingLayer];

    uint64_t v17 = [MEMORY[0x1E4F39BE8] layer];
    dodgeRingLayer = v4->_dodgeRingLayer;
    v4->_dodgeRingLayer = (CALayer *)v17;

    id v19 = [(id)objc_opt_class() ringImageForDodge];
    -[CALayer setContents:](v4->_dodgeRingLayer, "setContents:", [v19 CGImage]);

    uint64_t v20 = *MEMORY[0x1E4F3A018];
    v21 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A018]];
    [(CALayer *)v4->_dodgeRingLayer setCompositingFilter:v21];

    [(id)objc_opt_class() ringSize];
    double v23 = v22;
    [(id)objc_opt_class() ringSize];
    -[CALayer setFrame:](v4->_dodgeRingLayer, "setFrame:", 0.0, 0.0, v23, v24);
    v25 = [(TPRingView *)v4 layer];
    [v25 addSublayer:v4->_dodgeRingLayer];

    uint64_t v26 = [MEMORY[0x1E4F39BE8] layer];
    highlightDodgeLayer = v4->_highlightDodgeLayer;
    v4->_highlightDodgeLayer = (CALayer *)v26;

    id v28 = [(id)objc_opt_class() colorForDodge];
    -[CALayer setBackgroundColor:](v4->_highlightDodgeLayer, "setBackgroundColor:", [v28 CGColor]);

    v29 = [MEMORY[0x1E4F39BC0] filterWithType:v20];
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
    v46 = [(TPRingView *)v4 layer];
    [v46 addSublayer:v4->_highlightDodgeLayer];

    uint64_t v47 = [MEMORY[0x1E4F39BE8] layer];
    highlightLuminanceLayer = v4->_highlightLuminanceLayer;
    v4->_highlightLuminanceLayer = (CALayer *)v47;

    id v49 = [(id)objc_opt_class() colorForLuminance];
    -[CALayer setBackgroundColor:](v4->_highlightLuminanceLayer, "setBackgroundColor:", [v49 CGColor]);

    v50 = [MEMORY[0x1E4F39BC0] filterWithType:v11];
    [(CALayer *)v4->_highlightLuminanceLayer setCompositingFilter:v50];

    [(CALayer *)v4->_highlightDodgeLayer frame];
    -[CALayer setFrame:](v4->_highlightLuminanceLayer, "setFrame:");
    [(CALayer *)v4->_highlightDodgeLayer cornerRadius];
    -[CALayer setCornerRadius:](v4->_highlightLuminanceLayer, "setCornerRadius:");
    [(CALayer *)v4->_highlightLuminanceLayer setOpacity:0.0];
    v51 = [(TPRingView *)v4 layer];
    [v51 insertSublayer:v4->_highlightLuminanceLayer below:v4->_highlightDodgeLayer];

    uint64_t v52 = [MEMORY[0x1E4F39BE8] layer];
    selectionLayer = v4->_selectionLayer;
    v4->_selectionLayer = (CALayer *)v52;

    id v54 = [MEMORY[0x1E4FB1618] whiteColor];
    -[CALayer setBackgroundColor:](v4->_selectionLayer, "setBackgroundColor:", [v54 CGColor]);

    [(id)objc_opt_class() ringSize];
    double v56 = v55;
    [(id)objc_opt_class() ringSize];
    -[CALayer setFrame:](v4->_selectionLayer, "setFrame:", 0.0, 0.0, v56, v57);
    [(id)objc_opt_class() ringCornerRadius];
    -[CALayer setCornerRadius:](v4->_selectionLayer, "setCornerRadius:");
    [(CALayer *)v4->_selectionLayer setOpacity:0.0];
    v58 = [(TPRingView *)v4 layer];
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
  return (CALayer *)objc_getProperty(self, a2, 408, 1);
}

- (void)setLuminanceRingLayer:(id)a3
{
}

- (CALayer)dodgeRingLayer
{
  return (CALayer *)objc_getProperty(self, a2, 416, 1);
}

- (void)setDodgeRingLayer:(id)a3
{
}

- (CALayer)highlightDodgeLayer
{
  return (CALayer *)objc_getProperty(self, a2, 424, 1);
}

- (void)setHighlightDodgeLayer:(id)a3
{
}

- (CALayer)highlightLuminanceLayer
{
  return (CALayer *)objc_getProperty(self, a2, 432, 1);
}

- (void)setHighlightLuminanceLayer:(id)a3
{
}

- (CALayer)selectionLayer
{
  return (CALayer *)objc_getProperty(self, a2, 440, 1);
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