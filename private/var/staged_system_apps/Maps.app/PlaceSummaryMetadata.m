@interface PlaceSummaryMetadata
- (BOOL)containsPhotoCarouselLine;
- (_TtC4Maps20PlaceSummaryMetadata)init;
- (_TtC4Maps20PlaceSummaryMetadata)initWithMetadata:(id)a3;
@end

@implementation PlaceSummaryMetadata

- (_TtC4Maps20PlaceSummaryMetadata)init
{
  result = (_TtC4Maps20PlaceSummaryMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC4Maps20PlaceSummaryMetadata)initWithMetadata:(id)a3
{
  return (_TtC4Maps20PlaceSummaryMetadata *)sub_1002D7070(a3);
}

- (BOOL)containsPhotoCarouselLine
{
  v2 = self;
  unsigned __int8 v3 = sub_1002D7BC8();

  return v3 & 1;
}

@end