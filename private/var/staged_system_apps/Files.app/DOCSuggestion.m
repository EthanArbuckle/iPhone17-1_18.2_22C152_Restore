@interface DOCSuggestion
- (_TtC5Files13DOCSuggestion)init;
@end

@implementation DOCSuggestion

- (_TtC5Files13DOCSuggestion)init
{
  return (_TtC5Files13DOCSuggestion *)sub_100102BF4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10006273C((uint64_t)self + OBJC_IVAR____TtC5Files13DOCSuggestion_representedObject);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1000A7258(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files13DOCSuggestion_customImageGenerator));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files13DOCSuggestion_customAtomImageGenerator);

  sub_1000A7258(v3);
}

@end