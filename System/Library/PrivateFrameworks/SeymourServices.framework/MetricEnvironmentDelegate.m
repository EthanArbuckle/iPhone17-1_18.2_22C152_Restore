@interface MetricEnvironmentDelegate
- (_TtC15SeymourServices25MetricEnvironmentDelegate)init;
- (id)app;
- (id)hostApp;
- (id)pageUrl;
- (id)resourceRevNum;
@end

@implementation MetricEnvironmentDelegate

- (id)app
{
  v2 = self;
  sub_1D6FA20C0();
  id v3 = objc_allocWithZone(NSString);
  v4 = (void *)sub_1D6FA98B0();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v3, sel_initWithString_, v4);

  return v5;
}

- (id)hostApp
{
  return 0;
}

- (id)pageUrl
{
  return 0;
}

- (id)resourceRevNum
{
  return 0;
}

- (_TtC15SeymourServices25MetricEnvironmentDelegate)init
{
  result = (_TtC15SeymourServices25MetricEnvironmentDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end