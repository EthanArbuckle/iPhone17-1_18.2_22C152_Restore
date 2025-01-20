@interface XavierGroupingService
- (id)bestOfGroupFromFeedItems:(id)a3 scoreProfiles:(id)a4 configurationSet:(int64_t)a5;
- (id)bestOfGroupFromHeadlines:(id)a3 configurationSet:(int64_t)a4;
@end

@implementation XavierGroupingService

- (id)bestOfGroupFromHeadlines:(id)a3 configurationSet:(int64_t)a4
{
  sub_1DE526268(0, &qword_1EBEB8730);
  unint64_t v5 = sub_1DE7B17E0();
  swift_retain();
  XavierGroupingService.bestOfGroup(fromHeadlines:configurationSet:)(v5, a4);
  swift_release();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_1DE7B17C0();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)bestOfGroupFromFeedItems:(id)a3 scoreProfiles:(id)a4 configurationSet:(int64_t)a5
{
  sub_1DE526268(0, (unint64_t *)&qword_1EBEBBA50);
  unint64_t v7 = sub_1DE7B17E0();
  id v8 = a4;
  swift_retain();
  XavierGroupingService.bestOfGroup(fromFeedItems:scoreProfiles:configurationSet:)(v7, v8, a5);

  swift_release();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_1DE7B17C0();
  swift_bridgeObjectRelease();

  return v9;
}

@end