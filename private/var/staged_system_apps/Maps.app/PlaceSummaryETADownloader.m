@interface PlaceSummaryETADownloader
- (_TtC4Maps25PlaceSummaryETADownloader)init;
- (void)ETAProviderUpdated:(id)a3;
@end

@implementation PlaceSummaryETADownloader

- (void)ETAProviderUpdated:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1002AD5A0(a3);
}

- (_TtC4Maps25PlaceSummaryETADownloader)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryETADownloader_etaProviders) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps25PlaceSummaryETADownloader_models) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlaceSummaryETADownloader();
  return [(PlaceSummaryETADownloader *)&v3 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end