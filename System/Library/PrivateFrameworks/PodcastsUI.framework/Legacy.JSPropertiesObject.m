@interface Legacy.JSPropertiesObject
- (NSDictionary)clientFeatures;
- (NSDictionary)localizations;
- (NSString)version;
- (_TtCO10PodcastsUI6Legacy18JSPropertiesObject)init;
@end

@implementation Legacy.JSPropertiesObject

- (NSDictionary)clientFeatures
{
  sub_1E3C1E44C();
  v2 = (void *)sub_1E3E7CB50();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (NSDictionary)localizations
{
  uint64_t v2 = *(void *)&self->manifest[OBJC_IVAR____TtCO10PodcastsUI6Legacy18JSPropertiesObject_manifest + 8];
  v3 = self;
  sub_1E3C1DF68(v2);

  v4 = (void *)sub_1E3E7CB50();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v4;
}

- (NSString)version
{
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_1E3E7CCF0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtCO10PodcastsUI6Legacy18JSPropertiesObject)init
{
  result = (_TtCO10PodcastsUI6Legacy18JSPropertiesObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end