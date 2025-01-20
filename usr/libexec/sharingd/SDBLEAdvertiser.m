@interface SDBLEAdvertiser
- (_TtC16DaemoniOSLibrary15SDBLEAdvertiser)init;
- (void)handleRapportIdentitiesChanged;
@end

@implementation SDBLEAdvertiser

- (_TtC16DaemoniOSLibrary15SDBLEAdvertiser)init
{
  result = (_TtC16DaemoniOSLibrary15SDBLEAdvertiser *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100250CB0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary15SDBLEAdvertiser_configuration), *(void *)&self->queue[OBJC_IVAR____TtC16DaemoniOSLibrary15SDBLEAdvertiser_configuration]);

  swift_unknownObjectRelease();
}

- (void)handleRapportIdentitiesChanged
{
  v2 = self;
  sub_1005C0BAC();
}

@end