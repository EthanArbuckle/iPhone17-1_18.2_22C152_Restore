@interface SFVibrantSeparatorView
- (SFVibrantSeparatorView)initWithFrame:(CGRect)a3;
@end

@implementation SFVibrantSeparatorView

- (SFVibrantSeparatorView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SFVibrantSeparatorView;
  v3 = -[SFVibrantSeparatorView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] whiteColor];
    v5 = [(SFVibrantSeparatorView *)v3 contentView];
    [v5 setBackgroundColor:v4];

    v6 = (void *)MEMORY[0x1E4FB1EA0];
    v7 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
    v8 = [v6 effectForBlurEffect:v7 style:7];
    [(SFVibrantSeparatorView *)v3 setEffect:v8];

    v9 = v3;
  }

  return v3;
}

@end