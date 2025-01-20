@interface WeatherModel
- (_TtC13SleepHealthUI12WeatherModel)init;
@end

@implementation WeatherModel

- (_TtC13SleepHealthUI12WeatherModel)init
{
  result = (_TtC13SleepHealthUI12WeatherModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI12WeatherModel__currentWeatherModel;
  sub_1AD8999CC(0, &qword_1E9A4ACB0, (uint64_t (*)(uint64_t))sub_1AD89961C, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
}

@end