@interface HeaderCard
- (BOOL)isiCloudPlusSubscriber;
- (NSString)storageState;
- (_TtC14iCloudSettings10HeaderCard)init;
- (_TtC14iCloudSettings14StatefulHeader)statefulHeader;
- (_TtC14iCloudSettings14StorageSummary)storageSummary;
- (id)init:(id)a3;
@end

@implementation HeaderCard

- (BOOL)isiCloudPlusSubscriber
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings10HeaderCard_isiCloudPlusSubscriber);
}

- (NSString)storageState
{
  return (NSString *)sub_2629FD268();
}

- (_TtC14iCloudSettings14StorageSummary)storageSummary
{
  return (_TtC14iCloudSettings14StorageSummary *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR____TtC14iCloudSettings10HeaderCard_storageSummary));
}

- (_TtC14iCloudSettings14StatefulHeader)statefulHeader
{
  return (_TtC14iCloudSettings14StatefulHeader *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                         + OBJC_IVAR____TtC14iCloudSettings10HeaderCard_statefulHeader));
}

- (id)init:(id)a3
{
  uint64_t v3 = sub_262B04408();
  return HeaderCard.init(_:)(v3);
}

- (_TtC14iCloudSettings10HeaderCard)init
{
  result = (_TtC14iCloudSettings10HeaderCard *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings10HeaderCard_statefulHeader);
}

@end