@interface ScalableImageView
- (_TtC5TeaUI17ScalableImageView)initWithCoder:(id)a3;
- (_TtC5TeaUI17ScalableImageView)initWithFrame:(CGRect)a3;
- (int64_t)contentMode;
- (void)layoutSubviews;
- (void)setContentMode:(int64_t)a3;
@end

@implementation ScalableImageView

- (int64_t)contentMode
{
  v2 = self;
  id v3 = sub_1B619DB38();

  return (int64_t)v3;
}

- (void)setContentMode:(int64_t)a3
{
  v4 = self;
  sub_1B619DBA4(a3);
}

- (_TtC5TeaUI17ScalableImageView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI17ScalableImageView *)sub_1B619DBC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5TeaUI17ScalableImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B619DE74();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1B619DF28();
}

- (void).cxx_destruct
{
}

@end