@interface ManageStorageAppViewModel
- (_TtC14iCloudSettings25ManageStorageAppViewModel)init;
@end

@implementation ManageStorageAppViewModel

- (_TtC14iCloudSettings25ManageStorageAppViewModel)init
{
  result = (_TtC14iCloudSettings25ManageStorageAppViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings25ManageStorageAppViewModel_animationImage));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings25ManageStorageAppViewModel_iconLoader);
  v3 = (char *)self + OBJC_IVAR____TtC14iCloudSettings25ManageStorageAppViewModel___observationRegistrar;
  uint64_t v4 = sub_262B02B38();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end