@interface FollowingNotificationsSectionFooterView
- (_TtC7NewsUI239FollowingNotificationsSectionFooterView)initWithCoder:(id)a3;
- (_TtC7NewsUI239FollowingNotificationsSectionFooterView)initWithFrame:(CGRect)a3;
@end

@implementation FollowingNotificationsSectionFooterView

- (_TtC7NewsUI239FollowingNotificationsSectionFooterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC7NewsUI239FollowingNotificationsSectionFooterView_textLabel;
  id v10 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[FollowingNotificationsSectionFooterView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  [(FollowingNotificationsSectionFooterView *)v12 addSubview:*(Class *)((char *)&v12->super.super.super.isa+ OBJC_IVAR____TtC7NewsUI239FollowingNotificationsSectionFooterView_textLabel)];
  return v12;
}

- (_TtC7NewsUI239FollowingNotificationsSectionFooterView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI239FollowingNotificationsSectionFooterView_textLabel;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC7NewsUI239FollowingNotificationsSectionFooterView *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI239FollowingNotificationsSectionFooterView_textLabel));
}

@end