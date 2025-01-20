@interface DOCMediaMetadataProvider
- (NSArray)displaySortOrder;
- (NSDictionary)metadataValues;
@end

@implementation DOCMediaMetadataProvider

- (NSDictionary)metadataValues
{
  swift_retain();
  sub_1003CDDD8();
  swift_release();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (NSArray)displaySortOrder
{
  sub_1003D48C0();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

@end