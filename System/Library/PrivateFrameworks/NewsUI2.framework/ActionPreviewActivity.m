@interface ActionPreviewActivity
- (_TtC7NewsUI221ActionPreviewActivity)init;
- (id)previewViewControllerForAction:(id)a3;
- (void)commitViewController:(id)a3 action:(id)a4;
@end

@implementation ActionPreviewActivity

- (id)previewViewControllerForAction:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  v5 = (void *)sub_1DF596D48();
  swift_unknownObjectRelease();

  return v5;
}

- (void)commitViewController:(id)a3 action:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1DF597338();

  swift_unknownObjectRelease();
}

- (_TtC7NewsUI221ActionPreviewActivity)init
{
  result = (_TtC7NewsUI221ActionPreviewActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221ActionPreviewActivity_router);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI221ActionPreviewActivity_handler;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end