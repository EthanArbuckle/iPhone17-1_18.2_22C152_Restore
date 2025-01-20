@interface AMDBookScorer.Event
- (NSDictionary)engagementData;
- (_TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event)init;
- (void)setEngagementData:(id)a3;
@end

@implementation AMDBookScorer.Event

- (NSDictionary)engagementData
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event_engagementData))
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
           + OBJC_IVAR____TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event_engagementData) = v4;

  swift_bridgeObjectRelease();
}

- (_TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event)init
{
  result = (_TtCC5Books13AMDBookScorerP33_CD21F26B56464019284D998852D0D3665Event *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end