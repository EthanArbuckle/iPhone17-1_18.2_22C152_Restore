@interface ManageStorageAppIconURL
- (NSURL)url1x;
- (NSURL)url2x;
- (NSURL)url3x;
- (_TtC14iCloudSettings23ManageStorageAppIconURL)init;
- (_TtC14iCloudSettings23ManageStorageAppIconURL)initWithUrl1x:(id)a3 url2x:(id)a4 url3x:(id)a5;
- (id)init:(id)a3;
- (void)urlForScreenScaleWithCompletionHandler:(id)a3;
@end

@implementation ManageStorageAppIconURL

- (NSURL)url1x
{
  return (NSURL *)sub_262A134C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings23ManageStorageAppIconURL_url1x);
}

- (NSURL)url2x
{
  return (NSURL *)sub_262A134C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings23ManageStorageAppIconURL_url2x);
}

- (NSURL)url3x
{
  return (NSURL *)sub_262A134C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings23ManageStorageAppIconURL_url3x);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return ManageStorageAppIconURL.init(_:)(v3);
}

- (_TtC14iCloudSettings23ManageStorageAppIconURL)initWithUrl1x:(id)a3 url2x:(id)a4 url3x:(id)a5
{
  return (_TtC14iCloudSettings23ManageStorageAppIconURL *)sub_262A138E8();
}

- (_TtC14iCloudSettings23ManageStorageAppIconURL)init
{
  result = (_TtC14iCloudSettings23ManageStorageAppIconURL *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)urlForScreenScaleWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B422A40);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_262B04698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A9867D0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A985018;
  v12[5] = v11;
  v13 = self;
  sub_262A7F994((uint64_t)v7, (uint64_t)&unk_26A985020, (uint64_t)v12);
  swift_release();
}

@end