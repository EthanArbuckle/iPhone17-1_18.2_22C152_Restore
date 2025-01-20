@interface BookmarkNavigationListItem
- (NSString)glyphImageName;
- (PXProgrammaticNavigationDestination)destination;
- (_TtC12PhotosUICore26BookmarkNavigationListItem)initWithIdentifier:(id)a3 title:(id)a4 itemCount:(int64_t)a5 containerIdentifier:(id)a6;
@end

@implementation BookmarkNavigationListItem

- (NSString)glyphImageName
{
  if (*(NSString **)((char *)&self->super._identifier
                    + OBJC_IVAR____TtC12PhotosUICore26BookmarkNavigationListItem__glyphImageName))
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  return (NSString *)0;
}

- (PXProgrammaticNavigationDestination)destination
{
  v2 = self;
  v3 = (PXProgrammaticNavigationDestination *)(id)sub_1AA44FAB4();

  return v3;
}

- (_TtC12PhotosUICore26BookmarkNavigationListItem)initWithIdentifier:(id)a3 title:(id)a4 itemCount:(int64_t)a5 containerIdentifier:(id)a6
{
  result = (_TtC12PhotosUICore26BookmarkNavigationListItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore26BookmarkNavigationListItem_model);
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore26BookmarkNavigationListItem__destination);
}

@end