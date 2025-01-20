@interface VKCDataDetectorHighlightView
+ (Class)layerClass;
+ (id)highlightColor;
- (BOOL)hideDashedLine;
- (CAShapeLayer)shapeLayer;
- (UIBezierPath)path;
- (VKCDataDetectorHighlightView)initWithFrame:(CGRect)a3;
- (void)configureDashPatternForPath:(id)a3;
- (void)didMoveToSuperview;
- (void)setHideDashedLine:(BOOL)a3;
- (void)setPath:(id)a3;
@end

@implementation VKCDataDetectorHighlightView

+ (id)highlightColor
{
  if (highlightColor_onceToken != -1) {
    dispatch_once(&highlightColor_onceToken, &__block_literal_global_31);
  }
  v2 = (void *)highlightColor_sHighlightColor;
  return v2;
}

void __46__VKCDataDetectorHighlightView_highlightColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F428B8] colorWithRed:0.29 green:0.29 blue:0.29 alpha:1.0];
  v1 = (void *)highlightColor_sHighlightColor;
  highlightColor_sHighlightColor = v0;
}

- (VKCDataDetectorHighlightView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VKCDataDetectorHighlightView;
  v3 = -[VKCDataDetectorHighlightView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(VKCDataDetectorHighlightView *)v3 shapeLayer];
    id v6 = [(id)objc_opt_class() highlightColor];
    objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v6, "CGColor"));
    [v5 setLineWidth:2.0];
    [v5 setFillColor:0];
    v7 = [(VKCDataDetectorHighlightView *)v4 layer];
    [v7 bounds];
    objc_msgSend(v5, "setFrame:");

    [v5 setContentsGravity:*MEMORY[0x1E4F3A3E0]];
    [v5 setMasksToBounds:0];
  }
  return v4;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAShapeLayer)shapeLayer
{
  uint64_t v3 = objc_opt_class();
  v4 = [(VKCDataDetectorHighlightView *)self layer];
  v5 = VKCheckedDynamicCast(v3, (uint64_t)v4);

  return (CAShapeLayer *)v5;
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)VKCDataDetectorHighlightView;
  [(VKCDataDetectorHighlightView *)&v4 didMoveToSuperview];
  uint64_t v3 = [(VKCDataDetectorHighlightView *)self layer];
  [v3 setMasksToBounds:0];
}

- (void)setPath:(id)a3
{
  id v4 = a3;
  v5 = (UIBezierPath *)[v4 copy];
  path = self->_path;
  self->_path = v5;

  [(VKCDataDetectorHighlightView *)self configureDashPatternForPath:self->_path];
  uint64_t v7 = objc_msgSend(v4, "vk_CGPath");

  id v8 = [(VKCDataDetectorHighlightView *)self shapeLayer];
  [v8 setPath:v7];
}

- (void)configureDashPatternForPath:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  -[UIView vk_viewLengthFromWindowLength:](self, "vk_viewLengthFromWindowLength:", a3, 1.0);
  double v5 = v4;
  id v6 = [(VKCDataDetectorHighlightView *)self shapeLayer];
  uint64_t v7 = [NSNumber numberWithDouble:v5 * 3.0];
  v11[0] = v7;
  id v8 = [NSNumber numberWithDouble:v5];
  v11[1] = v8;
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  [v6 setLineDashPattern:v9];

  LODWORD(v10) = 2.0;
  [v6 setRepeatCount:v10];
  [v6 setLineWidth:v5 + v5];
  [v6 setLineJoin:*MEMORY[0x1E4F3A478]];
}

- (void)setHideDashedLine:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hideDashedLine = a3;
  id v4 = [(VKCDataDetectorHighlightView *)self shapeLayer];
  [v4 setHidden:v3];
}

- (UIBezierPath)path
{
  return self->_path;
}

- (BOOL)hideDashedLine
{
  return self->_hideDashedLine;
}

- (void).cxx_destruct
{
}

@end