@interface DarkModeConfiguration
- (BOOL)isAutoDarkModeEnabled;
- (NSDictionary)colors;
- (_TtC12NewsArticles21DarkModeConfiguration)init;
- (double)saturationThreshold;
- (unint64_t)inversionBehavior;
@end

@implementation DarkModeConfiguration

- (_TtC12NewsArticles21DarkModeConfiguration)init
{
  result = (_TtC12NewsArticles21DarkModeConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)isAutoDarkModeEnabled
{
  v2 = self;
  char v3 = sub_1BF799A60();

  return v3 & 1;
}

- (unint64_t)inversionBehavior
{
  swift_getObjectType();
  uint64_t v3 = qword_1EBA56780;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  sub_1BF79A19C();
  swift_retain();
  sub_1BF7DD358();

  swift_release();
  return v6;
}

- (double)saturationThreshold
{
  swift_getObjectType();
  uint64_t v3 = qword_1EBA56780;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  sub_1BF79A19C();
  swift_retain();
  sub_1BF7DD358();

  swift_release();
  return v6;
}

- (NSDictionary)colors
{
  v2 = self;
  uint64_t v3 = sub_1BF799D60();

  if (v3)
  {
    v4 = (void *)sub_1BF7E3898();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

@end