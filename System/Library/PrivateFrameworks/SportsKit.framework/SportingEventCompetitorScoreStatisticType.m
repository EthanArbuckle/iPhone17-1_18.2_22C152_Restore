@interface SportingEventCompetitorScoreStatisticType
- (BOOL)isEqual:(id)a3;
- (_TtC9SportsKit41SportingEventCompetitorScoreStatisticType)init;
@end

@implementation SportingEventCompetitorScoreStatisticType

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23F95C220();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_23F8F96EC((uint64_t)v8);

  sub_23F8F78BC((uint64_t)v8);
  return v6 & 1;
}

- (_TtC9SportsKit41SportingEventCompetitorScoreStatisticType)init
{
}

- (void).cxx_destruct
{
}

@end