@interface PPTHostedPageScrollTest
- (PPTHostedPageScrollTest)init;
- (PPTHostedPageScrollTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6;
- (void)startTest;
@end

@implementation PPTHostedPageScrollTest

- (void)startTest
{
  v2 = self;
  sub_100288024();
}

- (PPTHostedPageScrollTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  return (PPTHostedPageScrollTest *)sub_10028830C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t (*)(uint64_t))type metadata accessor for PPTHostedPageScrollTest);
}

- (PPTHostedPageScrollTest)init
{
  return (PPTHostedPageScrollTest *)sub_100288400(self, (uint64_t)a2, type metadata accessor for PPTHostedPageScrollTest);
}

@end