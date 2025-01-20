@interface Journaling.Asset
+ (NSArray)writableTypeIdentifiersForItemProvider;
- (BOOL)isEqual:(id)a3;
- (_TtCC7Journal10Journaling5Asset)init;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (int64_t)hash;
- (void)assetUpdatedNotificationWithNotification:(id)a3;
- (void)dealloc;
- (void)mediaFileUpdatedNotificationWithNotification:(id)a3;
@end

@implementation Journaling.Asset

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_10018030C((uint64_t)v8);

  sub_10001457C((uint64_t)v8, &qword_1007FAD50);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_100180A88();

  return v3;
}

- (void)dealloc
{
  v2 = self;
  sub_100181A74();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  Swift::Int v3 = (char *)self + OBJC_IVAR____TtCC7Journal10Journaling5Asset_id;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_10001457C((uint64_t)self + OBJC_IVAR____TtCC7Journal10Journaling5Asset_suggestionId, &qword_100800950);
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtCC7Journal10Journaling5Asset_suggestionDate, (uint64_t *)&unk_1007FC470);
  swift_bridgeObjectRelease();
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtCC7Journal10Journaling5Asset_attachmentsDirectoryURL, (uint64_t *)&unk_100800A60);
  swift_bridgeObjectRelease();

  sub_10001ABB8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCC7Journal10Journaling5Asset_didUpdate));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCC7Journal10Journaling5Asset_didUpdateMediaFile);

  sub_10001ABB8(v5);
}

- (void)assetUpdatedNotificationWithNotification:(id)a3
{
}

- (void)mediaFileUpdatedNotificationWithNotification:(id)a3
{
}

- (_TtCC7Journal10Journaling5Asset)init
{
  result = (_TtCC7Journal10Journaling5Asset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  uint64_t v4 = _Block_copy(a4);
  _Block_release(v4);

  return 0;
}

@end