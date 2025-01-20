@interface AssetPersistentKeyLoader
- (BOOL)contentKeySession:(id)a3 shouldRetryContentKeyRequest:(id)a4 reason:(id)a5;
- (_TtC15SeymourServices24AssetPersistentKeyLoader)init;
- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5;
- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4;
@end

@implementation AssetPersistentKeyLoader

- (_TtC15SeymourServices24AssetPersistentKeyLoader)init
{
  result = (_TtC15SeymourServices24AssetPersistentKeyLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices24AssetPersistentKeyLoader_assetDataStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices24AssetPersistentKeyLoader_assetFileStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices24AssetPersistentKeyLoader_assetMediaStreamKeyProvider);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices24AssetPersistentKeyLoader_keyProvider);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices24AssetPersistentKeyLoader_persistenceStore);
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15SeymourServices24AssetPersistentKeyLoader_keyLoaderQueue);
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1D683B770(v7);
}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1D683C0E0(v7);
}

- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  sub_1D683C810(v9, v11);
}

- (BOOL)contentKeySession:(id)a3 shouldRetryContentKeyRequest:(id)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  char v12 = sub_1D683CD18(v10);

  return v12 & 1;
}

@end