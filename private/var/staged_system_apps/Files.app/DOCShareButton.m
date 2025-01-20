@interface DOCShareButton
- (_TtC5FilesP33_5854F2584B6BB42CC0BFB2F44FFF0F2914DOCShareButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
- (void)updateConfiguration;
@end

@implementation DOCShareButton

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(DOCShareButton *)&v3 tintColorDidChange];
  [v2 setNeedsLayout];
}

- (void)updateConfiguration
{
  id v2 = self;
  sub_100272094();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(DOCShareButton *)&v4 layoutSubviews];
  [v2 bounds];
  [v2 _setContinuousCornerRadius:v3 * 0.5];
}

- (_TtC5FilesP33_5854F2584B6BB42CC0BFB2F44FFF0F2914DOCShareButton)initWithFrame:(CGRect)a3
{
}

@end