@interface TTRITreeTableView
- (_TtC9Reminders17TTRITreeTableView)initWithCoder:(id)a3;
- (_TtC9Reminders17TTRITreeTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
@end

@implementation TTRITreeTableView

- (_TtC9Reminders17TTRITreeTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)&self->contextMenuDelegate[OBJC_IVAR____TtC9Reminders17TTRITreeTableView_contextMenuDelegate] = 0;
  swift_unknownObjectWeakInit();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TTRITreeTableView();
  return -[TTRITreeTableView initWithFrame:style:](&v11, "initWithFrame:style:", a4, x, y, width, height);
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  v8 = (char *)self + OBJC_IVAR____TtC9Reminders17TTRITreeTableView_contextMenuDelegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v9 = *((void *)v8 + 1);
    swift_getObjectType();
    v10 = *(uint64_t (**)(void))(v9 + 8);
    id v11 = a3;
    id v12 = a4;
    swift_unknownObjectRetain();
    v13 = self;
    v14 = (void *)v10();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  v8 = (char *)self + OBJC_IVAR____TtC9Reminders17TTRITreeTableView_contextMenuDelegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v9 = *((void *)v8 + 1);
    swift_getObjectType();
    v10 = *(uint64_t (**)(void))(v9 + 16);
    id v11 = a3;
    id v12 = a4;
    swift_unknownObjectRetain();
    v13 = self;
    v14 = (void *)v10();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (_TtC9Reminders17TTRITreeTableView)initWithCoder:(id)a3
{
  *(void *)&self->contextMenuDelegate[OBJC_IVAR____TtC9Reminders17TTRITreeTableView_contextMenuDelegate] = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TTRITreeTableView();
  return [(TTRITreeTableView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end