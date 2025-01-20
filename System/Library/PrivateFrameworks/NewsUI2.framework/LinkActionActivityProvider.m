@interface LinkActionActivityProvider
- (_TtC7NewsUI226LinkActionActivityProvider)init;
- (id)activityGroupForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
- (id)previewActivityForAction:(id)a3;
@end

@implementation LinkActionActivityProvider

- (_TtC7NewsUI226LinkActionActivityProvider)init
{
  result = (_TtC7NewsUI226LinkActionActivityProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226LinkActionActivityProvider_router);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226LinkActionActivityProvider_handler);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI226LinkActionActivityProvider_linkedContentProvider));
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI226LinkActionActivityProvider_tracker;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (id)activityGroupForAction:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  swift_unknownObjectRetain();
  id v12 = a4;
  v13 = self;
  id v14 = sub_1DF48F2E0((uint64_t)a3, a4, x, y, width, height);
  swift_unknownObjectRelease();

  return v14;
}

- (id)previewActivityForAction:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  id v5 = sub_1DF494EB0();
  swift_unknownObjectRelease();

  return v5;
}

@end