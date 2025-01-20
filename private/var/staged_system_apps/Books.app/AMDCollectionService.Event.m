@interface AMDCollectionService.Event
- (NSDictionary)engagementData;
- (_TtCC5Books20AMDCollectionServiceP33_4EFD11BC7D3B203388E5898071D414945Event)init;
- (void)setEngagementData:(id)a3;
@end

@implementation AMDCollectionService.Event

- (NSDictionary)engagementData
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC5Books20AMDCollectionServiceP33_4EFD11BC7D3B203388E5898071D414945Event_engagementData))
  {
    swift_bridgeObjectRetain();
    v2.super.isa = sub_1007FDA50().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSDictionary *)v2.super.isa;
}

- (void)setEngagementData:(id)a3
{
  if (a3) {
    v4 = (objc_class *)sub_1007FDA70();
  }
  else {
    v4 = 0;
  }
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCC5Books20AMDCollectionServiceP33_4EFD11BC7D3B203388E5898071D414945Event_engagementData) = v4;

  swift_bridgeObjectRelease();
}

- (_TtCC5Books20AMDCollectionServiceP33_4EFD11BC7D3B203388E5898071D414945Event)init
{
  result = (_TtCC5Books20AMDCollectionServiceP33_4EFD11BC7D3B203388E5898071D414945Event *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end