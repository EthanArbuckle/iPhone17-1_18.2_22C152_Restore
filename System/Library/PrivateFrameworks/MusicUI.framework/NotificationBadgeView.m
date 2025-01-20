@interface NotificationBadgeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7MusicUIP33_046287148865313ED514022F8F54C1CE21NotificationBadgeView)initWithCoder:(id)a3;
- (_TtC7MusicUIP33_046287148865313ED514022F8F54C1CE21NotificationBadgeView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NotificationBadgeView

- (_TtC7MusicUIP33_046287148865313ED514022F8F54C1CE21NotificationBadgeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2296C5084();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2296C51D8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_2296C532C();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC7MusicUIP33_046287148865313ED514022F8F54C1CE21NotificationBadgeView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_2296C5A90(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC7MusicUIP33_046287148865313ED514022F8F54C1CE21NotificationBadgeView_style));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7MusicUIP33_046287148865313ED514022F8F54C1CE21NotificationBadgeView_valueLabel);
}

@end