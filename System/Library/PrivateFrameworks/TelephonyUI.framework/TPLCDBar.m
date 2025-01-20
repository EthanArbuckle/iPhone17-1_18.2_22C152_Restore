@interface TPLCDBar
+ (double)defaultHeight;
+ (double)defaultHeightForOrientation:(int64_t)a3;
+ (id)backgroundImage;
- (TPLCDBar)initWithDefaultSize;
- (TPLCDBar)initWithDefaultSizeForOrientation:(int64_t)a3;
- (TPLCDBar)initWithFrame:(CGRect)a3;
- (UIImageView)shadowView;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 updateFrame:(BOOL)a4;
@end

@implementation TPLCDBar

+ (double)defaultHeight
{
  [a1 defaultHeightForOrientation:1];
  return result;
}

+ (double)defaultHeightForOrientation:(int64_t)a3
{
  v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  double result = 100.0;
  if ((unint64_t)(a3 - 1) < 2) {
    double result = 108.0;
  }
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 94.0;
  }
  return result;
}

- (TPLCDBar)initWithDefaultSizeForOrientation:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  if ((unint64_t)(a3 - 1) >= 2) {
    double v7 = v9;
  }
  [(id)objc_opt_class() defaultHeightForOrientation:a3];
  v15.receiver = self;
  v15.super_class = (Class)TPLCDBar;
  v11 = -[TPLCDBar initWithFrame:](&v15, sel_initWithFrame_, 0.0, 0.0, v7, v10);
  v12 = v11;
  if (v11)
  {
    [(TPLCDBar *)v11 setAutoresizingMask:2];
    v13 = [MEMORY[0x1E4FB1618] clearColor];
    [(TPLCDBar *)v12 setBackgroundColor:v13];

    [(TPLCDBar *)v12 setOpaque:0];
  }
  return v12;
}

- (TPLCDBar)initWithDefaultSize
{
  return [(TPLCDBar *)self initWithDefaultSizeForOrientation:1];
}

- (TPLCDBar)initWithFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v5 = -[TPLCDBar initWithDefaultSizeForOrientation:](self, "initWithDefaultSizeForOrientation:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v6 = v5;
  if (v5)
  {
    [(TPLCDBar *)v5 frame];
    -[TPLCDBar setFrame:](v6, "setFrame:", x, y);
  }
  return v6;
}

- (void)setOrientation:(int64_t)a3 updateFrame:(BOOL)a4
{
  BOOL v4 = a4;
  [(TPLCDBar *)self frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(id)objc_opt_class() defaultHeightForOrientation:a3];
  double v14 = v13;
  if (v4)
  {
    objc_super v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v15 bounds];
    double v12 = v16;
    double v18 = v17;

    if ((unint64_t)(a3 - 1) >= 2) {
      double v12 = v18;
    }
  }
  -[TPLCDBar setFrame:](self, "setFrame:", v8, v10, v12, v14);
}

- (void)setOrientation:(int64_t)a3
{
}

+ (id)backgroundImage
{
  return 0;
}

- (UIImageView)shadowView
{
  return (UIImageView *)objc_getProperty(self, a2, 408, 1);
}

- (void).cxx_destruct
{
}

@end