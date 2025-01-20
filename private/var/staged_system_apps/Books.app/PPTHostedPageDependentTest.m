@interface PPTHostedPageDependentTest
- (BOOL)hasHandler;
- (_TtC5Books26PPTHostedPageDependentTest)init;
- (_TtC5Books26PPTHostedPageDependentTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6;
- (int)handlerTimeout;
- (int)timeBeforeTest;
@end

@implementation PPTHostedPageDependentTest

- (int)timeBeforeTest
{
  return 5;
}

- (int)handlerTimeout
{
  return 3;
}

- (BOOL)hasHandler
{
  v2 = self;
  sub_100287B98();

  return 0;
}

- (_TtC5Books26PPTHostedPageDependentTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  return (_TtC5Books26PPTHostedPageDependentTest *)sub_10028830C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t (*)(uint64_t))type metadata accessor for PPTHostedPageDependentTest);
}

- (_TtC5Books26PPTHostedPageDependentTest)init
{
  return (_TtC5Books26PPTHostedPageDependentTest *)sub_100288400(self, (uint64_t)a2, type metadata accessor for PPTHostedPageDependentTest);
}

@end