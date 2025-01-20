@interface ShareSheetImageItemProvider
- (_TtC9SeymourUI27ShareSheetImageItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)item;
@end

@implementation ShareSheetImageItemProvider

- (id)item
{
  v2 = self;
  sub_23A7FD6F8();

  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_23A800F98();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);

  return v3;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_23A773820((uint64_t)v8, (uint64_t)a4, v17);

  uint64_t v9 = v18;
  if (v18)
  {
    v10 = __swift_project_boxed_opaque_existential_1(v17, v18);
    uint64_t v11 = *(void *)(v9 - 8);
    __n128 v12 = MEMORY[0x270FA5388](v10);
    v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v11 + 16))(v14, v12);
    v15 = (void *)sub_23A800F98();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (_TtC9SeymourUI27ShareSheetImageItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_23A8009F8();
  swift_unknownObjectRelease();
  result = (_TtC9SeymourUI27ShareSheetImageItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27ShareSheetImageItemProvider_artworkItemProvider);
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI27ShareSheetImageItemProvider_loadedImage);
}

@end