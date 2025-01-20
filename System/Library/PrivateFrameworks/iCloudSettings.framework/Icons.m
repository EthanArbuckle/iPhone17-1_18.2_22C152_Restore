@interface Icons
- (NSArray)bundleIdentifiers;
- (NSDictionary)urls;
- (NSString)assetId;
- (NSString)sfSymbolId;
- (NSURL)darkUrl1x;
- (NSURL)darkUrl2x;
- (NSURL)darkUrl3x;
- (NSURL)url1x;
- (NSURL)url2x;
- (NSURL)url3x;
- (_TtC14iCloudSettings5Icons)init;
- (id)iconURL;
- (id)init:(id)a3;
@end

@implementation Icons

- (id)iconURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4229F0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_2629D3818((uint64_t)v5);

  uint64_t v7 = sub_262B02A38();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_262B029E8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return v9;
}

- (NSString)assetId
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings5Icons_assetId);
}

- (NSArray)bundleIdentifiers
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings5Icons_bundleIdentifiers))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_262B04548();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

- (NSString)sfSymbolId
{
  return (NSString *)sub_2629FBBF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings5Icons_sfSymbolId);
}

- (NSDictionary)urls
{
  return (NSDictionary *)sub_262AD9424((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14iCloudSettings5Icons_urls);
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return Icons.init(_:)(v3);
}

- (NSURL)url1x
{
  return (NSURL *)sub_262AD9A2C(self, (uint64_t)a2, (void (*)(void))sub_262AD979C);
}

- (NSURL)url2x
{
  return (NSURL *)sub_262AD9A2C(self, (uint64_t)a2, (void (*)(void))sub_262AD97C0);
}

- (NSURL)url3x
{
  return (NSURL *)sub_262AD9A2C(self, (uint64_t)a2, (void (*)(void))sub_262AD99B0);
}

- (NSURL)darkUrl1x
{
  return (NSURL *)sub_262AD9A2C(self, (uint64_t)a2, (void (*)(void))sub_262AD99D4);
}

- (NSURL)darkUrl2x
{
  return (NSURL *)sub_262AD9A2C(self, (uint64_t)a2, (void (*)(void))sub_262AD9A00);
}

- (NSURL)darkUrl3x
{
  return (NSURL *)sub_262AD9A2C(self, (uint64_t)a2, (void (*)(void))sub_262AD9B58);
}

- (_TtC14iCloudSettings5Icons)init
{
  result = (_TtC14iCloudSettings5Icons *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end