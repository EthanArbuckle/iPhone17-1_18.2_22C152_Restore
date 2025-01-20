@interface NTKCSeparatorView
+ (double)intrinsicHeight;
- (BOOL)selected;
- (CGSize)intrinsicContentSize;
- (NTKCSeparatorView)init;
- (void)setSelected:(BOOL)a3;
@end

@implementation NTKCSeparatorView

- (NTKCSeparatorView)init
{
  [(id)objc_opt_class() intrinsicHeight];
  v8.receiver = self;
  v8.super_class = (Class)NTKCSeparatorView;
  v4 = -[NTKCSeparatorView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, v3);
  if (v4)
  {
    v5 = NTKCSeparatorColor();
    v7.receiver = v4;
    v7.super_class = (Class)NTKCSeparatorView;
    [(NTKCSeparatorView *)&v7 setBackgroundColor:v5];
  }
  return v4;
}

+ (double)intrinsicHeight
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  double v4 = 1.0 / v3;

  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  [(id)objc_opt_class() intrinsicHeight];
  double v4 = v3;
  double v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  -[NTKCSeparatorView setHidden:](self, "setHidden:");
}

- (BOOL)selected
{
  return self->_selected;
}

@end