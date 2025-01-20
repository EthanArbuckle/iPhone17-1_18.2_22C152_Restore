@interface Journaling.Asset
+ (NSArray)writableTypeIdentifiersForItemProvider;
- (BOOL)isEqual:(id)a3;
- (_TtCC21JournalShareExtension10Journaling5Asset)init;
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
    sub_10010A7B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_100039B8C((uint64_t)v8);

  sub_10000B9CC((uint64_t)v8, &qword_10015A8A0);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_10003A308();

  return v3;
}

- (void)dealloc
{
  v2 = self;
  sub_10003BB54();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  Swift::Int v3 = (char *)self + OBJC_IVAR____TtCC21JournalShareExtension10Journaling5Asset_id;
  uint64_t v4 = sub_1001094F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_10000B9CC((uint64_t)self + OBJC_IVAR____TtCC21JournalShareExtension10Journaling5Asset_suggestionId, (uint64_t *)&unk_10015A850);
  sub_10000B9CC((uint64_t)self + OBJC_IVAR____TtCC21JournalShareExtension10Journaling5Asset_suggestionDate, (uint64_t *)&unk_10015CDE0);
  swift_bridgeObjectRelease();
  sub_10000B9CC((uint64_t)self + OBJC_IVAR____TtCC21JournalShareExtension10Journaling5Asset_attachmentsDirectoryURL, (uint64_t *)&unk_100159D40);
  swift_bridgeObjectRelease();

  sub_10002422C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC21JournalShareExtension10Journaling5Asset_didUpdate));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC21JournalShareExtension10Journaling5Asset_didUpdateMediaFile);

  sub_10002422C(v5);
}

- (void)assetUpdatedNotificationWithNotification:(id)a3
{
}

- (void)mediaFileUpdatedNotificationWithNotification:(id)a3
{
}

- (_TtCC21JournalShareExtension10Journaling5Asset)init
{
  result = (_TtCC21JournalShareExtension10Journaling5Asset *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v2.super.isa = sub_100109F20().super.isa;

  return (NSArray *)v2.super.isa;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  uint64_t v4 = _Block_copy(a4);
  _Block_release(v4);

  return 0;
}

@end