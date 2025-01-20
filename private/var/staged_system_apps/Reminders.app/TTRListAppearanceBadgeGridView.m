@interface TTRListAppearanceBadgeGridView
- (_TtC9Reminders30TTRListAppearanceBadgeGridView)initWithCoder:(id)a3;
- (_TtC9Reminders30TTRListAppearanceBadgeGridView)initWithFrame:(CGRect)a3;
- (void)didTap:(id)a3;
@end

@implementation TTRListAppearanceBadgeGridView

- (_TtC9Reminders30TTRListAppearanceBadgeGridView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->superclass_opaque[OBJC_IVAR____TtC9Reminders30TTRListAppearanceBadgeGridView_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v9 = &self->superclass_opaque[OBJC_IVAR____TtC9Reminders30TTRListAppearanceBadgeGridView_indexOfSelectedItem];
  *(void *)v9 = 0;
  v9[8] = 1;
  v15.receiver = self;
  v15.super_class = ObjectType;
  v10 = -[TTRListAppearanceBadgeGridView initWithFrame:](&v15, "initWithFrame:", x, y, width, height);
  id v11 = objc_allocWithZone((Class)UITapGestureRecognizer);
  v12 = v10;
  id v13 = [v11 initWithTarget:v12 action:"didTap:"];
  [(TTRListAppearanceBadgeGridView *)v12 addGestureRecognizer:v13];

  return v12;
}

- (_TtC9Reminders30TTRListAppearanceBadgeGridView)initWithCoder:(id)a3
{
  return (_TtC9Reminders30TTRListAppearanceBadgeGridView *)sub_1002DD188(a3);
}

- (void)didTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002DD420(v4);
}

- (void).cxx_destruct
{
}

@end