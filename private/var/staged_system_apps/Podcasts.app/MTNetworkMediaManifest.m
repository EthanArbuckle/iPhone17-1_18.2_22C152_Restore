@interface MTNetworkMediaManifest
+ (id)activityTypeSuffix;
+ (int64_t)playerFetchLimit;
+ (void)createManifestForActivity:(id)a3 completion:(id)a4;
+ (void)fetchPlayerItemsFor:(id)a3 completion:(id)a4;
- (BOOL)hasOnlyPaidEpisodesWithoutSubscription;
- (BOOL)parsePodcastAssetInfo:(id)a3 error:(id *)a4;
- (BOOL)parseStationAssetInfo:(id)a3 error:(id *)a4;
- (MTNetworkMediaManifest)init;
- (MTNetworkMediaManifest)initWithAssetInfo:(id)a3;
- (MTNetworkMediaManifest)initWithEpisodeAdamId:(id)a3 assetInfo:(id)a4;
- (MTNetworkMediaManifest)initWithEpisodeAdamIds:(id)a3 assetInfo:(id)a4;
- (MTNetworkMediaManifest)initWithItems:(id)a3;
- (MTNetworkMediaManifest)initWithPodcastAdamId:(id)a3 assetInfo:(id)a4;
- (MTNetworkMediaManifest)initWithStationId:(id)a3 assetInfo:(id)a4;
- (NSArray)initialEpisodeUuids;
- (NSArray)itemIdsDebug;
- (NSString)initialPodcastUuid;
- (id)parseEpisodeAssetInfo:(id)a3 error:(id *)a4;
- (int64_t)episodeFetchLimit;
- (int64_t)forwardItemCount;
- (unint64_t)currentIndex;
- (void)load:(id)a3;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setEpisodeFetchLimit:(int64_t)a3;
- (void)setForwardItemCount:(int64_t)a3;
- (void)setHasOnlyPaidEpisodesWithoutSubscription:(BOOL)a3;
@end

@implementation MTNetworkMediaManifest

+ (id)activityTypeSuffix
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

+ (int64_t)playerFetchLimit
{
  return 20;
}

- (int64_t)forwardItemCount
{
  return *(void *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_forwardItemCount];
}

- (void)setForwardItemCount:(int64_t)a3
{
  *(void *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_forwardItemCount] = a3;
}

- (int64_t)episodeFetchLimit
{
  return *(void *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_episodeFetchLimit];
}

- (void)setEpisodeFetchLimit:(int64_t)a3
{
  *(void *)&self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_episodeFetchLimit] = a3;
}

- (BOOL)hasOnlyPaidEpisodesWithoutSubscription
{
  return self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_hasOnlyPaidEpisodesWithoutSubscription];
}

- (void)setHasOnlyPaidEpisodesWithoutSubscription:(BOOL)a3
{
  self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_hasOnlyPaidEpisodesWithoutSubscription] = a3;
}

- (MTNetworkMediaManifest)initWithAssetInfo:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  v5 = [(MTNetworkMediaManifest *)self initWithPodcastAdamId:0 assetInfo:v4];

  return v5;
}

- (MTNetworkMediaManifest)initWithEpisodeAdamId:(id)a3 assetInfo:(id)a4
{
  if (!a3)
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    return (MTNetworkMediaManifest *)sub_1002117F8(v5, v7, v8, v10);
  }
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  return (MTNetworkMediaManifest *)sub_1002117F8(v5, v7, v8, v10);
}

- (MTNetworkMediaManifest)initWithEpisodeAdamIds:(id)a3 assetInfo:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (!a3)
  {
    uint64_t v5 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
LABEL_6:
  id v8 = objc_allocWithZone((Class)type metadata accessor for NetworkMediaManifest());
  uint64_t v9 = (MTNetworkMediaManifest *)sub_100211C80(0, 0, v5, 0, 0, v4, v7);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

- (MTNetworkMediaManifest)initWithPodcastAdamId:(id)a3 assetInfo:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (!a3)
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
LABEL_6:
  id v10 = objc_allocWithZone((Class)type metadata accessor for NetworkMediaManifest());
  v11 = (MTNetworkMediaManifest *)sub_100211C80(v5, v7, 0, 0, 0, v4, v9);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

- (MTNetworkMediaManifest)initWithStationId:(id)a3 assetInfo:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (!a3)
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
LABEL_6:
  id v10 = objc_allocWithZone((Class)type metadata accessor for NetworkMediaManifest());
  v11 = (MTNetworkMediaManifest *)sub_100211C80(0, 0, 0, v5, v7, v4, v9);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

- (void)load:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    uint64_t v7 = sub_1000343D8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = self;
  sub_1002129E8((uint64_t (*)(id))v7, v6);
  sub_1000536BC((uint64_t)v7);
}

+ (void)fetchPlayerItemsFor:(id)a3 completion:(id)a4
{
  uint64_t v5 = type metadata accessor for MediaRequest.ContentType();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v9)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    uint64_t v9 = sub_10021A868;
  }
  else
  {
    uint64_t v11 = 0;
  }
  swift_getObjCClassMetadata();
  id v12 = [objc_allocWithZone((Class)type metadata accessor for MediaRequestController()) init];
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for MediaRequest.ContentType.podcastEpisode(_:), v5);
  v13 = (void *)swift_allocObject();
  v13[2] = v12;
  v13[3] = v9;
  v13[4] = v11;
  id v14 = v12;
  sub_10004ACDC((uint64_t)v9);
  sub_100212C48(0, v10, v14, (uint64_t)v8, 0x7FFFFFFFFFFFFFFFLL, 20, (unint64_t)_swiftEmptyArrayStorage, 0, (uint64_t (*)(void, void))sub_10021A838, (uint64_t)v13);

  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_1000536BC((uint64_t)v9);
  swift_bridgeObjectRelease();
}

- (NSArray)initialEpisodeUuids
{
  NSString v2 = self;
  uint64_t v3 = sub_100215278();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (NSString)initialPodcastUuid
{
  NSString v2 = self;
  sub_100215550();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)parseStationAssetInfo:(id)a3 error:(id *)a4
{
  return sub_100216CA8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_1002157D0);
}

- (id)parseEpisodeAssetInfo:(id)a3 error:(id *)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = self;
  sub_100215C2C(v5, v7);

  swift_bridgeObjectRelease();
  type metadata accessor for ServerPodcastEpisode();
  v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (BOOL)parsePodcastAssetInfo:(id)a3 error:(id *)a4
{
  return sub_100216CA8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_1002161D0);
}

- (unint64_t)currentIndex
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NetworkMediaManifest();
  return [(MTNetworkMediaManifest *)&v3 currentIndex];
}

- (void)setCurrentIndex:(unint64_t)a3
{
  uint64_t v4 = self;
  if ([(MTNetworkMediaManifest *)v4 currentIndex] == a3)
  {
  }
  else
  {
    v5.receiver = v4;
    v5.super_class = (Class)type metadata accessor for NetworkMediaManifest();
    [(MTNetworkMediaManifest *)&v5 setCurrentIndex:a3];
    sub_1002198E4(0, 0);
  }
}

- (NSArray)itemIdsDebug
{
  NSString v2 = self;
  sub_100218BFC();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (MTNetworkMediaManifest)initWithItems:(id)a3
{
  result = (MTNetworkMediaManifest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (MTNetworkMediaManifest)init
{
  result = (MTNetworkMediaManifest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  NSArray v3 = &self->super.super.IMPlayerManifest_opaque[OBJC_IVAR___MTNetworkMediaManifest_contentType];
  uint64_t v4 = type metadata accessor for MediaRequest.ContentType();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

+ (void)createManifestForActivity:(id)a3 completion:(id)a4
{
  objc_super v5 = _Block_copy(a4);
  _Block_copy(v5);
  id v6 = a3;
  sub_10021A01C(v6, (void (**)(void, void))v5);
  _Block_release(v5);
  _Block_release(v5);
}

@end