@interface PressureFormatter
- (NSLocale)locale;
- (_TtC9WeatherUI17PressureFormatter)init;
- (_TtC9WeatherUI17PressureFormatter)initWithCoder:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation PressureFormatter

- (NSLocale)locale
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6B1690);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  PressureFormatter.locale.getter((uint64_t)v5);

  uint64_t v7 = sub_1B4834EE0();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7) != 1)
  {
    v8 = (void *)sub_1B4834DD0();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }
  return (NSLocale *)v8;
}

- (void)setLocale:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6B1690);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1B4834E00();
    uint64_t v8 = sub_1B4834EE0();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = sub_1B4834EE0();
    uint64_t v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  uint64_t v10 = self;
  PressureFormatter.locale.setter((uint64_t)v7);
}

- (_TtC9WeatherUI17PressureFormatter)init
{
  return (_TtC9WeatherUI17PressureFormatter *)PressureFormatter.init()();
}

- (_TtC9WeatherUI17PressureFormatter)initWithCoder:(id)a3
{
}

@end