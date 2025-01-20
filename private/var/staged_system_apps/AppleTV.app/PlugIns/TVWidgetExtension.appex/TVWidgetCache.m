@interface TVWidgetCache
- (_TtC17TVWidgetExtension13TVWidgetCache)init;
@end

@implementation TVWidgetCache

- (_TtC17TVWidgetExtension13TVWidgetCache)init
{
  v3 = (char *)self + OBJC_IVAR____TtC17TVWidgetExtension13TVWidgetCache_lastKnownWidgetEntry;
  uint64_t v4 = type metadata accessor for TVWidgetEntry();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (char *)self + OBJC_IVAR____TtC17TVWidgetExtension13TVWidgetCache_lastKnownWidgetEntryDate;
  uint64_t v6 = sub_1000E3EE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TVWidgetCache();
  return [(TVWidgetCache *)&v8 init];
}

- (void).cxx_destruct
{
}

@end