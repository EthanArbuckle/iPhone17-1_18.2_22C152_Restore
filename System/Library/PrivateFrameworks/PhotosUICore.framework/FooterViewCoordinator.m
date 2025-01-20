@interface FooterViewCoordinator
- (_TtC12PhotosUICore21FooterViewCoordinator)init;
- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4;
- (void)photosGlobalFooterViewDidChangeHeight:(id)a3;
@end

@implementation FooterViewCoordinator

- (void)photosGlobalFooterView:(id)a3 presentViewController:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1AA651270(a4);

  swift_unknownObjectRelease();
}

- (void)photosGlobalFooterViewDidChangeHeight:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AA651414(v4);
}

- (_TtC12PhotosUICore21FooterViewCoordinator)init
{
  result = (_TtC12PhotosUICore21FooterViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectWeakDestroy();
}

@end