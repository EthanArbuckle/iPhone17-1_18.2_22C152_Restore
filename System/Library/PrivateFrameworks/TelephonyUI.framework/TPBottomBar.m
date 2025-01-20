@interface TPBottomBar
+ (double)defaultHeight;
+ (double)defaultHeightForOrientation:(int64_t)a3;
+ (double)defaultHeightForStyle:(int64_t)a3;
+ (double)defaultHeightForStyle:(int64_t)a3 orientation:(int64_t)a4;
+ (int64_t)fullscreenStyle;
+ (int64_t)overlayStyle;
- (TPBottomBar)init;
- (TPBottomBar)initWithDefaultSize;
- (TPBottomBar)initWithDefaultSizeForOrientation:(int64_t)a3;
- (TPBottomBar)initWithFrame:(CGRect)a3;
- (TPBottomBar)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (int64_t)orientation;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 updateFrame:(BOOL)a4;
@end

@implementation TPBottomBar

+ (double)defaultHeightForStyle:(int64_t)a3 orientation:(int64_t)a4
{
  switch(a3)
  {
    case 0:
    case 2:
      double result = 109.0;
      break;
    case 1:
      double result = 178.0;
      break;
    case 3:
      double result = 96.0;
      if ((unint64_t)(a4 - 1) < 2) {
        double result = 128.0;
      }
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

+ (double)defaultHeightForStyle:(int64_t)a3
{
  +[TPBottomBar defaultHeightForStyle:a3 orientation:1];
  return result;
}

+ (double)defaultHeightForOrientation:(int64_t)a3
{
  int64_t v5 = +[TPBottomBar fullscreenStyle];
  [a1 defaultHeightForStyle:v5 orientation:a3];
  return result;
}

+ (double)defaultHeight
{
  [a1 defaultHeightForOrientation:1];
  return result;
}

- (TPBottomBar)initWithDefaultSize
{
  return [(TPBottomBar *)self initWithDefaultSizeForOrientation:1];
}

- (TPBottomBar)initWithDefaultSizeForOrientation:(int64_t)a3
{
  int64_t v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  if ((unint64_t)(a3 - 1) >= 2) {
    double v7 = v9;
  }
  [(id)objc_opt_class() defaultHeightForOrientation:a3];
  double result = -[TPBottomBar initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v7, v10);
  if (result) {
    result->_orientation = a3;
  }
  return result;
}

+ (int64_t)fullscreenStyle
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 3;
  }
  else {
    return 0;
  }
}

+ (int64_t)overlayStyle
{
  v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return 2 * ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1);
}

- (TPBottomBar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = +[TPBottomBar fullscreenStyle];
  return -[TPBottomBar initWithFrame:style:](self, "initWithFrame:style:", v8, x, y, width, height);
}

- (TPBottomBar)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TPBottomBar;
  int64_t v5 = -[TPBottomBar initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    [(TPBottomBar *)v5 setOpaque:0];
    [(TPBottomBar *)v6 setNeedsDisplayOnBoundsChange:1];
    [(TPBottomBar *)v6 setAutoresizingMask:2];
    v6->_orientation = 1;
  }
  return v6;
}

- (TPBottomBar)init
{
  v4.receiver = self;
  v4.super_class = (Class)TPBottomBar;
  v2 = [(TPBottomBar *)&v4 init];
  if (v2) {
    v2->_style = +[TPBottomBar fullscreenStyle];
  }
  return v2;
}

- (void)setOrientation:(int64_t)a3 updateFrame:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    [(TPBottomBar *)self frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(id)objc_opt_class() defaultHeightForOrientation:a3];
    double v16 = v15 - v14;
    double v17 = v14 + v16;
    if (v4)
    {
      v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v18 bounds];
      double v20 = v19;
      double v22 = v21;

      if ((unint64_t)(a3 - 1) >= 2) {
        double v12 = v22;
      }
      else {
        double v12 = v20;
      }
      if ((unint64_t)(a3 - 1) >= 2) {
        double v23 = v20;
      }
      else {
        double v23 = v22;
      }
      double v24 = v23 - v17;
    }
    else
    {
      double v24 = v10 - v16;
    }
    -[TPBottomBar setFrame:](self, "setFrame:", v8, v24, v12, v17);
  }
}

- (void)setOrientation:(int64_t)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

@end