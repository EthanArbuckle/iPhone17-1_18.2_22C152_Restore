@interface WeatherConfigurationManager
- (_TtC11WeatherCore27WeatherConfigurationManager)initWithContentDirectoryURL:(id)a3;
@end

@implementation WeatherConfigurationManager

- (_TtC11WeatherCore27WeatherConfigurationManager)initWithContentDirectoryURL:(id)a3
{
  uint64_t v3 = sub_1B4B36E18();
  MEMORY[0x1F4188790](v3 - 8);
  sub_1B4B36DE8();
  return (_TtC11WeatherCore27WeatherConfigurationManager *)WeatherConfigurationManager.init(contentDirectoryURL:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end