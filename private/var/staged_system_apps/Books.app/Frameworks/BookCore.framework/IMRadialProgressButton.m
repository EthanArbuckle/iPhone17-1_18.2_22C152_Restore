@interface IMRadialProgressButton
+ (CGSize)minimumBoundingBox;
- (BOOL)inscribeProgress;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)showImages;
- (BOOL)useInnerRect;
- (CGSize)innerRectSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (IMRadialProgressButton)initWithFrame:(CGRect)a3;
- (UIColor)progressColor;
- (UIColor)trackColor;
- (UIEdgeInsets)touchInsets;
- (UIImage)centerImageNormal;
- (UIImage)centerImageNormalTinted;
- (UIImage)centerImageSelected;
- (UIImage)centerImageSelectedTinted;
- (double)progressThickness;
- (double)trackDiameter;
- (double)trackThickness;
- (float)progress;
- (int)progressLineCap;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateCenterImage;
- (void)dealloc;
- (void)drawCenteredImaged:(id)a3 screenScale:(double)a4;
- (void)drawRect:(CGRect)a3;
- (void)setCenterImageNormal:(id)a3;
- (void)setCenterImageNormalTinted:(id)a3;
- (void)setCenterImageSelected:(id)a3;
- (void)setCenterImageSelectedTinted:(id)a3;
- (void)setInnerRectSize:(CGSize)a3;
- (void)setInscribeProgress:(BOOL)a3;
- (void)setProgress:(float)a3;
- (void)setProgressColor:(id)a3;
- (void)setProgressLineCap:(int)a3;
- (void)setProgressThickness:(double)a3;
- (void)setShowImages:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)setTouchInsets:(UIEdgeInsets)a3;
- (void)setTrackColor:(id)a3;
- (void)setTrackDiameter:(double)a3;
- (void)setTrackThickness:(double)a3;
- (void)setUseInnerRect:(BOOL)a3;
- (void)useInnerRect:(CGSize)a3;
@end

@implementation IMRadialProgressButton

- (IMRadialProgressButton)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)IMRadialProgressButton;
  v3 = -[IMRadialProgressButton initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(IMRadialProgressButton *)v3 traitCollection];
    v6 = +[UIImage systemImageNamed:@"square.fill" compatibleWithTraitCollection:v5];
    v7 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleCaption2 scale:1];
    uint64_t v8 = [v6 imageWithConfiguration:v7];
    centerImageNormal = v4->_centerImageNormal;
    v4->_centerImageNormal = (UIImage *)v8;

    v10 = [(IMRadialProgressButton *)v4 traitCollection];
    v11 = +[UIImage systemImageNamed:@"pause.fill" compatibleWithTraitCollection:v10];
    v12 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleCaption1 scale:1];
    uint64_t v13 = [v11 imageWithConfiguration:v12];
    centerImageSelected = v4->_centerImageSelected;
    v4->_centerImageSelected = (UIImage *)v13;

    [(IMRadialProgressButton *)v4 _updateCenterImage];
    v15 = +[UIColor bc_booksLabelColor];
    [(IMRadialProgressButton *)v4 setTintColor:v15];

    [(IMRadialProgressButton *)v4 setShowsTouchWhenHighlighted:1];
    v4->_showImages = 1;
    v4->_inscribeProgress = 1;
    v4->_progressLineCap = 0;
    v4->_progressThickness = 3.0;
    v4->_trackDiameter = 26.0;
    v4->_trackThickness = 1.0;
    v16 = +[UITraitCollection bc_allAPITraits];
    id v17 = [(IMRadialProgressButton *)v4 registerForTraitChanges:v16 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v4;
}

- (void)dealloc
{
  progressColor = self->_progressColor;
  self->_progressColor = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMRadialProgressButton;
  [(IMRadialProgressButton *)&v4 dealloc];
}

- (void)useInnerRect:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(IMRadialProgressButton *)self setUseInnerRect:1];

  -[IMRadialProgressButton setInnerRectSize:](self, "setInnerRectSize:", width, height);
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [a4 userInterfaceStyle:a3];
  v6 = [(IMRadialProgressButton *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    [(IMRadialProgressButton *)self _updateCenterImage];
  }
}

+ (CGSize)minimumBoundingBox
{
  double v2 = 28.0;
  double v3 = 28.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setShowImages:(BOOL)a3
{
  if (self->_showImages != a3)
  {
    self->_showImages = a3;
    -[IMRadialProgressButton setShowsTouchWhenHighlighted:](self, "setShowsTouchWhenHighlighted:");
    [(IMRadialProgressButton *)self setNeedsDisplay];
  }
}

- (void)drawCenteredImaged:(id)a3 screenScale:(double)a4
{
  id v5 = a3;
  if ([(IMRadialProgressButton *)self showImages])
  {
    [v5 size];
    [(IMRadialProgressButton *)self bounds];
    CGRectCenterRectInRect();
    CGRectRoundedForScale();
    [v5 drawInRect:];
  }
}

- (void)drawRect:(CGRect)a3
{
  *(void *)&recta.origin.CGFloat y = self;
  *(void *)&recta.size.CGFloat width = IMRadialProgressButton;
  -[CGFloat drawRect:]((objc_super *)&recta.origin.y, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = +[UIScreen mainScreen];
  [v4 scale];
  uint64_t v6 = v5;

  [(IMRadialProgressButton *)self bounds];
  CGFloat x = v47.origin.x;
  CGFloat y = v47.origin.y;
  CGFloat width = v47.size.width;
  CGFloat height = v47.size.height;
  double MidX = CGRectGetMidX(v47);
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v48);
  [(IMRadialProgressButton *)self trackDiameter];
  double v14 = v13;
  [(IMRadialProgressButton *)self trackThickness];
  double v16 = v14 - v15;
  uint64_t v44 = v6;
  CGSizeRoundForScale();
  CGRectMakeWithCenterAndSize();
  recta.origin.CGFloat x = v17;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  double v24 = v16 * 0.5;
  if ([(IMRadialProgressButton *)self inscribeProgress])
  {
    [(IMRadialProgressButton *)self progressThickness];
    double v26 = v25 * 0.5;
    [(IMRadialProgressButton *)self trackThickness];
    double v24 = v24 - (v26 + v27 * 0.25);
  }
  [(IMRadialProgressButton *)self progress];
  double v29 = v28 * 6.28318531 + -1.57079633;
  [(IMRadialProgressButton *)self progress];
  if (v30 >= 1.0) {
    double v29 = 4.70767659;
  }
  v31 = [(IMRadialProgressButton *)self trackColor];
  v32 = v31;
  if (v31)
  {
    id v33 = v31;
  }
  else
  {
    id v33 = [(IMRadialProgressButton *)self progressColor];
  }
  v34 = v33;

  [v34 setStroke];
  CurrentContext = UIGraphicsGetCurrentContext();
  [(IMRadialProgressButton *)self trackThickness];
  CGContextSetLineWidth(CurrentContext, v36);
  v49.origin.CGFloat x = recta.origin.x;
  v49.origin.CGFloat y = v19;
  v49.size.CGFloat width = v21;
  v49.size.CGFloat height = v23;
  CGContextStrokeEllipseInRect(CurrentContext, v49);
  v37 = [(IMRadialProgressButton *)self progressColor];
  [v37 setStroke];

  v38 = +[UIBezierPath bezierPath];
  [v38 moveToPoint:MidX, MidY - v24];
  [v38 addArcWithCenter:1, MidX, MidY, v24, -1.57079633, v29];
  [v38 setLineCapStyle:[self progressLineCap]];
  unsigned __int8 v39 = [(IMRadialProgressButton *)self inscribeProgress];
  double v40 = 2.5;
  if ((v39 & 1) == 0) {
    [(IMRadialProgressButton *)self progressThickness];
  }
  [v38 setLineWidth:v40];
  [v38 stroke];
  if ([(IMRadialProgressButton *)self useInnerRect])
  {
    [v34 setFill];
    [(IMRadialProgressButton *)self innerRectSize];
    CGSizeRoundForScale();
    CGRectMakeWithCenterAndSize();
    v41 = CGPathCreateWithRoundedRect(v50, 1.0, 1.0, 0);
    CGContextAddPath(CurrentContext, v41);
    CGContextFillPath(CurrentContext);
    CGPathRelease(v41);
  }
  else
  {
    unsigned int v42 = [(IMRadialProgressButton *)self isSelected];
    v43 = &OBJC_IVAR___IMRadialProgressButton__centerImageNormalTinted;
    if (v42) {
      v43 = &OBJC_IVAR___IMRadialProgressButton__centerImageSelectedTinted;
    }
    [(IMRadialProgressButton *)self drawCenteredImaged:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v43) screenScale:v45];
  }
}

- (void)setProgressColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  if (([(UIColor *)v5 isEqual:self->_progressColor] & 1) == 0
    && self->_progressColor != v5)
  {
    objc_storeStrong((id *)&self->_progressColor, a3);
    [(IMRadialProgressButton *)self _updateCenterImage];
  }

  _objc_release_x1();
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMRadialProgressButton *)self tintColor];
  if ((id)v5 == v4)
  {
  }
  else
  {
    uint64_t v6 = (void *)v5;
    id v7 = [(IMRadialProgressButton *)self tintColor];
    unsigned __int8 v8 = [v4 isEqual:v7];

    if ((v8 & 1) == 0)
    {
      v9.receiver = self;
      v9.super_class = (Class)IMRadialProgressButton;
      [(IMRadialProgressButton *)&v9 setTintColor:v4];
      [(IMRadialProgressButton *)self _updateCenterImage];
    }
  }
}

- (void)setCenterImageNormal:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  centerImageNormal = self->_centerImageNormal;
  if (centerImageNormal != v5 && ([(UIImage *)centerImageNormal isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_centerImageNormal, a3);
    [(IMRadialProgressButton *)self _updateCenterImage];
  }

  _objc_release_x1();
}

- (void)setCenterImageSelected:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  centerImageSelected = self->_centerImageSelected;
  if (centerImageSelected != v5 && ([(UIImage *)centerImageSelected isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_centerImageSelected, a3);
    [(IMRadialProgressButton *)self _updateCenterImage];
  }

  _objc_release_x1();
}

- (void)_updateCenterImage
{
  id v8 = [(IMRadialProgressButton *)self progressColor];
  double v3 = [(IMRadialProgressButton *)self centerImageSelected];
  id v4 = [v3 imageWithTintColor:v8];
  centerImageSelectedTinted = self->_centerImageSelectedTinted;
  self->_centerImageSelectedTinted = v4;

  uint64_t v6 = [(UIImage *)self->_centerImageNormal imageWithTintColor:v8];
  centerImageNormalTinted = self->_centerImageNormalTinted;
  self->_centerImageNormalTinted = v6;

  [(IMRadialProgressButton *)self setNeedsDisplay];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = -[IMRadialProgressButton backgroundImageForState:](self, "backgroundImageForState:", 0, a3.width, a3.height);
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(IMRadialProgressButton *)self bounds];
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_touchInsets.right);
  double v16 = v15 - (top + self->_touchInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;

  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (void)setProgress:(float)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    [(IMRadialProgressButton *)self setNeedsDisplay];
  }
}

- (UIColor)progressColor
{
  double v3 = self->_progressColor;
  if (!self->_progressColor)
  {
    uint64_t v4 = [(IMRadialProgressButton *)self tintColor];

    double v3 = (UIColor *)v4;
  }

  return v3;
}

- (float)progress
{
  return self->_progress;
}

- (UIImage)centerImageNormal
{
  return self->_centerImageNormal;
}

- (UIImage)centerImageNormalTinted
{
  return self->_centerImageNormalTinted;
}

- (void)setCenterImageNormalTinted:(id)a3
{
}

- (UIImage)centerImageSelected
{
  return self->_centerImageSelected;
}

- (UIImage)centerImageSelectedTinted
{
  return self->_centerImageSelectedTinted;
}

- (void)setCenterImageSelectedTinted:(id)a3
{
}

- (UIColor)trackColor
{
  return self->_trackColor;
}

- (void)setTrackColor:(id)a3
{
}

- (double)trackDiameter
{
  return self->_trackDiameter;
}

- (void)setTrackDiameter:(double)a3
{
  self->_trackDiameter = a3;
}

- (BOOL)inscribeProgress
{
  return self->_inscribeProgress;
}

- (void)setInscribeProgress:(BOOL)a3
{
  self->_inscribeProgress = a3;
}

- (int)progressLineCap
{
  return self->_progressLineCap;
}

- (void)setProgressLineCap:(int)a3
{
  self->_progressLineCap = a3;
}

- (double)progressThickness
{
  return self->_progressThickness;
}

- (void)setProgressThickness:(double)a3
{
  self->_progressThickness = a3;
}

- (double)trackThickness
{
  return self->_trackThickness;
}

- (void)setTrackThickness:(double)a3
{
  self->_trackThickness = a3;
}

- (UIEdgeInsets)touchInsets
{
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double bottom = self->_touchInsets.bottom;
  double right = self->_touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (BOOL)showImages
{
  return self->_showImages;
}

- (BOOL)useInnerRect
{
  return self->_useInnerRect;
}

- (void)setUseInnerRect:(BOOL)a3
{
  self->_useInnerRect = a3;
}

- (CGSize)innerRectSize
{
  double width = self->_innerRectSize.width;
  double height = self->_innerRectSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setInnerRectSize:(CGSize)a3
{
  self->_innerRectSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackColor, 0);
  objc_storeStrong((id *)&self->_centerImageSelectedTinted, 0);
  objc_storeStrong((id *)&self->_centerImageNormalTinted, 0);
  objc_storeStrong((id *)&self->_centerImageSelected, 0);
  objc_storeStrong((id *)&self->_centerImageNormal, 0);

  objc_storeStrong((id *)&self->_progressColor, 0);
}

@end