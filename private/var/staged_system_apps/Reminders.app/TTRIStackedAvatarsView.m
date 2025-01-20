@interface TTRIStackedAvatarsView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9Reminders22TTRIStackedAvatarsView)initWithCoder:(id)a3;
- (_TtC9Reminders22TTRIStackedAvatarsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRIStackedAvatarsView

- (_TtC9Reminders22TTRIStackedAvatarsView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_contacts) = (Class)_swiftEmptyArrayStorage;
  v9 = (char *)self + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_unscaledAvatarSize;
  *(void *)v9 = 0;
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_avatarsNeedUpdate) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_avatarViewControllers) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_avatarBorderViews) = (Class)_swiftEmptyArrayStorage;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[TTRIStackedAvatarsView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  sub_10002C958();

  return v10;
}

- (_TtC9Reminders22TTRIStackedAvatarsView)initWithCoder:(id)a3
{
  return (_TtC9Reminders22TTRIStackedAvatarsView *)sub_1005D97D8(a3);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1005D9904();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  [(TTRIStackedAvatarsView *)&v3 layoutSubviews];
  if (v2[OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_avatarsNeedUpdate] == 1)
  {
    v2[OBJC_IVAR____TtC9Reminders22TTRIStackedAvatarsView_avatarsNeedUpdate] = 0;
    sub_1005D9A18();
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_super v3 = self;
  sub_1005D9904();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end