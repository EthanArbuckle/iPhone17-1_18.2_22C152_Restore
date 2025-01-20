@interface REConstants
+ (double)headerHeight;
+ (double)sampleHeaderHeight;
- (_TtC5Books11REConstants)init;
@end

@implementation REConstants

+ (double)headerHeight
{
  return sub_10054965C((uint64_t)a1, (uint64_t)a2, &qword_100B22E30, (uint64_t)&static REConstants.headerHeight);
}

+ (double)sampleHeaderHeight
{
  return sub_10054965C((uint64_t)a1, (uint64_t)a2, &qword_100B22E38, (uint64_t)&static REConstants.sampleHeaderHeight);
}

- (_TtC5Books11REConstants)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for REConstants();
  return [(REConstants *)&v3 init];
}

@end