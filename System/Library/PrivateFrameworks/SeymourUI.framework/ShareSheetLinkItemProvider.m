@interface ShareSheetLinkItemProvider
- (_TtC9SeymourUI26ShareSheetLinkItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)item;
@end

@implementation ShareSheetLinkItemProvider

- (id)activityViewControllerLinkMetadata:(id)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26ShareSheetLinkItemProvider_artworkItemProvider))
  {
    id v4 = a3;
    v5 = self;
    id v6 = sub_23A204EAC();
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)item
{
  uint64_t v3 = sub_23A7F6548();
  __n128 v4 = MEMORY[0x270FA5388](v3);
  (*(void (**)(char *, char *, uint64_t, __n128))(v6 + 16))((char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)self + OBJC_IVAR____TtC9SeymourUI26ShareSheetLinkItemProvider_url, v3, v4);
  v7 = (void *)sub_23A800FF8();

  return v7;
}

- (_TtC9SeymourUI26ShareSheetLinkItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_23A8009F8();
  swift_unknownObjectRelease();
  result = (_TtC9SeymourUI26ShareSheetLinkItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26ShareSheetLinkItemProvider_storefrontLocalizer);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI26ShareSheetLinkItemProvider_url;
  uint64_t v4 = sub_23A7F6548();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26ShareSheetLinkItemProvider_artworkItemProvider));

  swift_bridgeObjectRelease();
}

@end