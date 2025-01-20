@interface IdentityPortraitCell
- (IdentityPortraitCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation IdentityPortraitCell

- (IdentityPortraitCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)IdentityPortraitCell;
  v4 = [(IdentityPortraitCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(IdentityPortraitCell *)v4 setBackgroundColor:v5];

    v6 = [(IdentityPortraitCell *)v4 imageView];
    [v6 setContentMode:2];
    v7 = [v6 layer];
    [v7 setMasksToBounds:1];
    [v7 setCornerRadius:40.0];
    id v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    [v7 setBorderWidth:PKUIPixelLength() * 3.0];
    objc_msgSend(v6, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
  }
  return v4;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)IdentityPortraitCell;
  [(IdentityPortraitCell *)&v4 layoutSubviews];
  v3 = [(IdentityPortraitCell *)self imageView];
  [(IdentityPortraitCell *)self bounds];
  PKRectCenteredIntegralRect();
  objc_msgSend(v3, "setFrame:");
}

@end