@interface TSKStarRatingView
+ (CGPath)newStarPath:(double)a3;
+ (void)renderRating:(int64_t)a3 intoContext:(CGContext *)a4 rect:(CGRect)a5 style:(int)a6 showDots:(BOOL)a7;
- (BOOL)showsDots;
- (Class)renderClass;
- (TSKStarRatingView)initWithCoder:(id)a3;
- (TSKStarRatingView)initWithFrame:(CGRect)a3;
- (TSUColor)color;
- (int)style;
- (int64_t)p_starRatingForGesture:(id)a3;
- (int64_t)p_starRatingForLocation:(double)a3;
- (int64_t)value;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)p_horizontalDrag:(id)a3;
- (void)p_setupGestureRecognizers;
- (void)p_tapped:(id)a3;
- (void)setColor:(id)a3;
- (void)setShowsDots:(BOOL)a3;
- (void)setStyle:(int)a3;
- (void)setValue:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation TSKStarRatingView

- (void)p_setupGestureRecognizers
{
  v3 = [[TSKHorizontalDragRecognizer alloc] initWithTarget:self action:sel_p_horizontalDrag_];
  self->mDragGesture = v3;
  [(TSKStarRatingView *)self addGestureRecognizer:v3];
  v4 = (void *)[objc_alloc(MEMORY[0x263F1C7A0]) initWithTarget:self action:sel_p_horizontalDrag_];
  [v4 setMinimumPressDuration:0.2];
  [(TSKStarRatingView *)self addGestureRecognizer:v4];

  id v5 = (id)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel_p_tapped_];
  [(TSKStarRatingView *)self addGestureRecognizer:v5];
}

- (TSKStarRatingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSKStarRatingView;
  v3 = -[TSKStarRatingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TSKStarRatingView *)v3 p_setupGestureRecognizers];
    [(TSKStarRatingView *)v4 setShowsDots:1];
    -[TSKStarRatingView setColor:](v4, "setColor:", [MEMORY[0x263F7C808] blackColor]);
  }
  return v4;
}

- (TSKStarRatingView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSKStarRatingView;
  v3 = [(TSKStarRatingView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(TSKStarRatingView *)v3 p_setupGestureRecognizers];
    [(TSKStarRatingView *)v4 setShowsDots:1];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKStarRatingView;
  [(TSKStarRatingView *)&v3 dealloc];
}

- (int64_t)p_starRatingForLocation:(double)a3
{
  [(TSKStarRatingView *)self bounds];
  double v5 = a3 / v4;
  if (a3 / v4 < 0.0500000007) {
    return 0;
  }
  if (v5 < 0.200000003) {
    return 1;
  }
  if (v5 < 0.400000006) {
    return 2;
  }
  if (v5 < 0.600000024) {
    return 3;
  }
  if (v5 >= 0.800000012) {
    return 5;
  }
  return 4;
}

- (int64_t)p_starRatingForGesture:(id)a3
{
  [a3 locationOfTouch:0 inView:self];

  return -[TSKStarRatingView p_starRatingForLocation:](self, "p_starRatingForLocation:");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_msgSend((id)objc_msgSend(a3, "anyObject"), "locationInView:", self);
  -[TSKStarRatingView setValue:](self, "setValue:", -[TSKStarRatingView p_starRatingForLocation:](self, "p_starRatingForLocation:"));

  [(TSKStarRatingView *)self sendActionsForControlEvents:4097];
}

- (void)p_tapped:(id)a3
{
  [(TSKStarRatingView *)self setValue:[(TSKStarRatingView *)self p_starRatingForGesture:a3]];

  [(TSKStarRatingView *)self sendActionsForControlEvents:64];
}

- (void)p_horizontalDrag:(id)a3
{
  uint64_t v5 = 64;
  switch([a3 state])
  {
    case 1:
      self->int64_t mRatingOnFingerDown = self->mRating;
      int64_t mRatingOnFingerDown = [(TSKStarRatingView *)self p_starRatingForGesture:a3];
      uint64_t v5 = 1;
      goto LABEL_5;
    case 2:
      int64_t mRatingOnFingerDown = [(TSKStarRatingView *)self p_starRatingForGesture:a3];
      uint64_t v5 = 4096;
      goto LABEL_5;
    case 3:
      goto LABEL_6;
    case 4:
      int64_t mRatingOnFingerDown = self->mRatingOnFingerDown;
      uint64_t v5 = 256;
LABEL_5:
      [(TSKStarRatingView *)self setValue:mRatingOnFingerDown];
LABEL_6:
      [(TSKStarRatingView *)self sendActionsForControlEvents:v5];
      break;
    default:
      return;
  }
}

- (void)willMoveToSuperview:(id)a3
{
  while (1)
  {
    objc_opt_class();
    uint64_t v5 = TSUDynamicCast();
    if (v5) {
      break;
    }
    a3 = (id)[a3 superview];
    if (!a3) {
      return;
    }
  }
  uint64_t v6 = v5;
  mDragGesture = self->mDragGesture;

  [(TSKHorizontalDragRecognizer *)mDragGesture setContainingScrollView:v6];
}

- (void)setShowsDots:(BOOL)a3
{
  self->mShowsDots = a3;
  [(TSKStarRatingView *)self setNeedsDisplay];
}

- (void)setValue:(int64_t)a3
{
  TSUClamp();
  self->mRating = (uint64_t)v4;

  [(TSKStarRatingView *)self setNeedsDisplay];
}

- (int64_t)value
{
  return self->mRating;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(TSKStarRatingView *)self renderClass];
  int64_t mRating = self->mRating;
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  uint64_t v11 = [(TSKStarRatingView *)self style];
  BOOL v12 = [(TSKStarRatingView *)self showsDots];
  v13 = [(TSKStarRatingView *)self color];

  -[objc_class renderRating:intoContext:rect:style:showDots:color:](v8, "renderRating:intoContext:rect:style:showDots:color:", mRating, CurrentContext, v11, v12, v13, x, y, width, height);
}

+ (void)renderRating:(int64_t)a3 intoContext:(CGContext *)a4 rect:(CGRect)a5 style:(int)a6 showDots:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = *(void *)&a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v15 = [MEMORY[0x263F7C808] blackColor];

  +[TSKStarRatingViewRenderer renderRating:intoContext:rect:style:showDots:color:](TSKStarRatingViewRenderer, "renderRating:intoContext:rect:style:showDots:color:", a3, a4, v8, v7, v15, x, y, width, height);
}

+ (CGPath)newStarPath:(double)a3
{
  return +[TSKStarRatingViewRenderer newStarPath:a3];
}

- (Class)renderClass
{
  return (Class)objc_opt_class();
}

- (int)style
{
  return self->mStyle;
}

- (void)setStyle:(int)a3
{
  self->mStyle = a3;
}

- (BOOL)showsDots
{
  return self->mShowsDots;
}

- (TSUColor)color
{
  return self->mColor;
}

- (void)setColor:(id)a3
{
}

@end