@interface ContextMenuButton
- (UIColor)tintColor;
- (_TtC23ShelfKitCollectionViews17ContextMenuButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews17ContextMenuButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)setTintColor:(id)a3;
@end

@implementation ContextMenuButton

- (_TtC23ShelfKitCollectionViews17ContextMenuButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_385780(27);
  swift_bridgeObjectRelease();
  result = (_TtC23ShelfKitCollectionViews17ContextMenuButton *)sub_385890();
  __break(1u);
  return result;
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(ContextMenuButton *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v11.receiver = self;
  v11.super_class = ObjectType;
  id v6 = a3;
  v7 = self;
  [(ContextMenuButton *)&v11 setTintColor:v6];
  v8 = *(Class *)((char *)&v7->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_button);
  v10.receiver = v7;
  v10.super_class = ObjectType;
  v9 = [(ContextMenuButton *)&v10 tintColor];
  [v8 setTintColor:v9];
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  uint64_t v19 = sub_37B460();
  uint64_t v6 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_37B4D0();
  uint64_t v9 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  objc_super v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)&self->episodeController[OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_episodeController
                                          + 8];
  v17[1] = *(void *)&self->episodeController[OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_episodeController
                                             + 16];
  v17[0] = __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_episodeController), v12);
  v13 = self;
  id v14 = a3;
  sub_37B4A0();
  sub_385050();
  v15 = (void *)sub_382BC0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v18);

  return v15;
}

- (_TtC23ShelfKitCollectionViews17ContextMenuButton)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews17ContextMenuButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_episodeController);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_model);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_button);
}

@end