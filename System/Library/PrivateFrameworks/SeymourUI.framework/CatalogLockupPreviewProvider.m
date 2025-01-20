@interface CatalogLockupPreviewProvider
- (_TtC9SeymourUI28CatalogLockupPreviewProvider)initWithCoder:(id)a3;
- (_TtC9SeymourUI28CatalogLockupPreviewProvider)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation CatalogLockupPreviewProvider

- (_TtC9SeymourUI28CatalogLockupPreviewProvider)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A32903C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_23A3278D8();
}

- (_TtC9SeymourUI28CatalogLockupPreviewProvider)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI28CatalogLockupPreviewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_artwork;
  uint64_t v4 = sub_23A7FB1B8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_artworkImageLoader);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_mediaTagStringBuilder);
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_lockup;
  uint64_t v6 = sub_23A7F7888();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_titleLabel));
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI28CatalogLockupPreviewProvider_subtitleLabel);
}

@end