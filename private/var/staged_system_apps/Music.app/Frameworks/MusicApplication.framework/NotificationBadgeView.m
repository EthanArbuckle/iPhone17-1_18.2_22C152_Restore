@interface NotificationBadgeView
- (CGRect)frame;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication21NotificationBadgeView)initWithCoder:(id)a3;
- (_TtC16MusicApplication21NotificationBadgeView)initWithFrame:(CGRect)a3;
- (int64_t)value;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)setValue:(int64_t)a3;
- (void)tintColorDidChange;
@end

@implementation NotificationBadgeView

- (_TtC16MusicApplication21NotificationBadgeView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_37570();
}

- (int64_t)value
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicApplication21NotificationBadgeView_value);
}

- (void)setValue:(int64_t)a3
{
  v4 = self;
  sub_3650C((id)a3);
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NotificationBadgeView();
  [(NotificationBadgeView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for NotificationBadgeView();
  v11.receiver = self;
  v11.super_class = v8;
  v9 = self;
  [(NotificationBadgeView *)&v11 frame];
  v10.receiver = v9;
  v10.super_class = v8;
  -[NotificationBadgeView setFrame:](&v10, "setFrame:", x, y, width, height);
  type metadata accessor for CGSize(0);
  [(NotificationBadgeView *)v9 frame];
  if (sub_AB11E0())
  {
    sub_36B2C();
    sub_36BFC();
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for NotificationBadgeView();
  double v2 = (char *)v11.receiver;
  [(NotificationBadgeView *)&v11 layoutSubviews];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [v2[OBJC_IVAR____TtC16MusicApplication21NotificationBadgeView_backgroundImageView] setFrame:];
  [*(id *)&v2[OBJC_IVAR____TtC16MusicApplication21NotificationBadgeView_valueLabel] setFrame:v4, v6, v8, v10];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  double v6 = sub_367D0(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = self;
  sub_3690C();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NotificationBadgeView();
  id v2 = v3.receiver;
  [(NotificationBadgeView *)&v3 tintColorDidChange];
  sub_36B2C();
}

- (_TtC16MusicApplication21NotificationBadgeView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC16MusicApplication21NotificationBadgeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_3750C(*(id *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication21NotificationBadgeView_style));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21NotificationBadgeView_backgroundImageView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication21NotificationBadgeView_valueLabel);
}

@end