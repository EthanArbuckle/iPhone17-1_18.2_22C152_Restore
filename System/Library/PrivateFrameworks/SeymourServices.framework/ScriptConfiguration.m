@interface ScriptConfiguration
- (BOOL)disableHTTPCaching;
- (BOOL)useLocalEndpoint;
- (BOOL)useSimulatorBag;
- (NSString)platformName;
- (_TtC15SeymourServices19ScriptConfiguration)init;
@end

@implementation ScriptConfiguration

- (_TtC15SeymourServices19ScriptConfiguration)init
{
  result = (_TtC15SeymourServices19ScriptConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)disableHTTPCaching
{
  uint64_t v3 = sub_1D6FA70F0();
  uint64_t v4 = *(void *)(v3 - 8);
  double v5 = MEMORY[0x1F4188790](v3);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, void, uint64_t, double))(v4 + 104))(v7, *MEMORY[0x1E4F9B7F8], v3, v5);
  v10[14] = 0;
  v8 = self;
  sub_1D6FA6CB0();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v7, v3);

  return v10[15];
}

- (NSString)platformName
{
  v2 = (void *)sub_1D6FA98B0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)useSimulatorBag
{
  return [(ScriptConfiguration *)self useLocalEndpoint];
}

- (BOOL)useLocalEndpoint
{
  return sub_1D6CF80B0() & 1;
}

@end