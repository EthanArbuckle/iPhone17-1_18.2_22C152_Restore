@interface ShadowBackdropView
- (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB18ShadowBackdropView)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB18ShadowBackdropView)initWithFrame:(CGRect)a3;
- (_TtC16MusicApplicationP33_A3A68D9BDEEA2EFD7AF836E311107B9218ShadowBackdropView)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_A3A68D9BDEEA2EFD7AF836E311107B9218ShadowBackdropView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ShadowBackdropView

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  id v2 = v14.receiver;
  [(ShadowBackdropView *)&v14 layoutSubviews];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [v2 layer];
  id v12 = [self bezierPathWithRoundedRect:v4 cornerRadius:v6, v8, v10, 6.0];
  id v13 = [v12 CGPath];

  [v11 setShadowPath:v13];
  sub_4587EC();
}

- (_TtC16MusicApplicationP33_A3A68D9BDEEA2EFD7AF836E311107B9218ShadowBackdropView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[ShadowBackdropView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplicationP33_A3A68D9BDEEA2EFD7AF836E311107B9218ShadowBackdropView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  double v5 = [(ShadowBackdropView *)&v7 initWithCoder:v4];

  return v5;
}

- (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB18ShadowBackdropView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[ShadowBackdropView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB18ShadowBackdropView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  double v5 = [(ShadowBackdropView *)&v7 initWithCoder:v4];

  return v5;
}

@end