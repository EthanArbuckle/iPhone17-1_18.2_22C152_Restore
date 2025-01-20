@interface TodayFeedQuerySidecar
- (BOOL)shouldIncludePaidFeedForChannel:(id)a3;
- (id)additionalChannelsToQuery;
- (id)additionalSectionIDsToQueryForChannel:(id)a3;
- (id)additionalTopicsToQuery;
@end

@implementation TodayFeedQuerySidecar

- (id)additionalChannelsToQuery
{
  return sub_1DF564694((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1DF563C8C, (unint64_t *)&qword_1EBAC0110);
}

- (id)additionalSectionIDsToQueryForChannel:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  sub_1DF564110(a3);
  swift_unknownObjectRelease();
  swift_release();
  v4 = (void *)sub_1DFDFE200();
  swift_bridgeObjectRelease();
  return v4;
}

- (BOOL)shouldIncludePaidFeedForChannel:(id)a3
{
  return 1;
}

- (id)additionalTopicsToQuery
{
  return sub_1DF564694((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1DF5643D0, (unint64_t *)&qword_1EBABAB70);
}

@end