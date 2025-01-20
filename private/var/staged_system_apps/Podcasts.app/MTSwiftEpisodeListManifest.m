@interface MTSwiftEpisodeListManifest
+ (id)activityTypeSuffix;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
- (MTSwiftEpisodeListManifest)initWithInitialEpisodeUuid:(id)a3 fetchRequest:(id)a4;
- (NSUserActivity)activity;
@end

@implementation MTSwiftEpisodeListManifest

+ (id)activityTypeSuffix
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (MTSwiftEpisodeListManifest)initWithInitialEpisodeUuid:(id)a3 fetchRequest:(id)a4
{
  id v4 = a4;
  result = (MTSwiftEpisodeListManifest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSString v2 = &self->super.super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTSwiftEpisodeListManifest_settings];
  uint64_t v3 = type metadata accessor for EpisodeListSettings();
  id v4 = *(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

- (NSUserActivity)activity
{
  NSString v2 = self;
  uint64_t v3 = sub_100302C84();

  return (NSUserActivity *)v3;
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_getObjCClassMetadata();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v8 = (void *)swift_allocObject();
  v8[2] = a3;
  v8[3] = sub_10021A39C;
  v8[4] = v6;
  v11[4] = sub_100303864;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_100303620;
  v11[3] = &unk_100560840;
  v9 = _Block_copy(v11);
  id v10 = a3;
  swift_retain();
  swift_release();
  [ObjCClassFromMetadata episodeUuidForActivity:v10 completion:v9];
  _Block_release(v9);

  swift_release();
}

@end