@interface TTRIQuickBarTabBar
- (_TtC15RemindersUICore18TTRIQuickBarTabBar)initWithCoder:(id)a3;
- (_TtC15RemindersUICore18TTRIQuickBarTabBar)initWithFrame:(CGRect)a3;
- (void)buttonAction:(id)a3;
- (void)buttonTouchDown:(id)a3;
@end

@implementation TTRIQuickBarTabBar

- (_TtC15RemindersUICore18TTRIQuickBarTabBar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_items) = 0;
  v9 = (objc_class *)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_markedItemIDs) = (Class)MEMORY[0x1E4FBC870];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_enabledItemIDs) = v9;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_stackView) = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[TTRIQuickBarTabBar initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1B934C188();

  return v10;
}

- (_TtC15RemindersUICore18TTRIQuickBarTabBar)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore18TTRIQuickBarTabBar *)sub_1B934C48C(a3);
}

- (void)buttonTouchDown:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1B934C7E0((uint64_t)v6);

  sub_1B90CCA68((uint64_t)v6, &qword_1EB9B4D10);
}

- (void)buttonAction:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1B9970200();
  swift_unknownObjectRelease();
  sub_1B934C984((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_stackView);
}

@end