@interface FastScrollParameters
- (NSString)testName;
- (_TtC7WeatherP33_4025464B1BDEC98D863ED8B5370ABB4920FastScrollParameters)init;
- (id)completionHandler;
- (id)composerBlock;
- (void)prepareWithComposer:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setTestName:(id)a3;
@end

@implementation FastScrollParameters

- (id)completionHandler
{
  return sub_1008FAF48();
}

- (void)setCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1008FB8F8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1008FB0D8((uint64_t)v4, v5, &OBJC_IVAR____TtC7WeatherP33_4025464B1BDEC98D863ED8B5370ABB4920FastScrollParameters_completionHandler);
}

- (NSString)testName
{
  return (NSString *)sub_1008FB100((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC7WeatherP33_4025464B1BDEC98D863ED8B5370ABB4920FastScrollParameters_testName);
}

- (void)setTestName:(id)a3
{
}

- (void)prepareWithComposer:(id)a3
{
}

- (id)composerBlock
{
  return sub_1008FB4B8();
}

- (_TtC7WeatherP33_4025464B1BDEC98D863ED8B5370ABB4920FastScrollParameters)init
{
}

- (void).cxx_destruct
{
}

@end