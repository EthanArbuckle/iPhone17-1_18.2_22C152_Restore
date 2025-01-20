@interface WeatherConditionsDataProvider
- (BOOL)enabled;
- (UITraitEnvironment)traitEnvironment;
- (_TtC4Maps29WeatherConditionsDataProvider)init;
- (_TtC4Maps29WeatherConditionsDataProvider)initWithTraitEnvironment:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setTraitEnvironment:(id)a3;
- (void)weatherLocationDataProvider:(id)a3 didChangeLocation:(id)a4;
@end

@implementation WeatherConditionsDataProvider

- (void)weatherLocationDataProvider:(id)a3 didChangeLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100009610(a4);
}

- (_TtC4Maps29WeatherConditionsDataProvider)initWithTraitEnvironment:(id)a3
{
  return (_TtC4Maps29WeatherConditionsDataProvider *)sub_100054B18((uint64_t)a3);
}

- (void)addObserver:(id)a3
{
}

- (UITraitEnvironment)traitEnvironment
{
  v2 = (void *)swift_unknownObjectRetain();

  return (UITraitEnvironment *)v2;
}

- (void)setTraitEnvironment:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_traitEnvironment) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  sub_100267188();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_lastSavedLocation);
}

- (BOOL)enabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_enabled);
}

- (void)setEnabled:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_enabled);
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_enabled) = a3;
  v4 = self;
  sub_1002673A8(v3);
}

- (void)removeObserver:(id)a3
{
}

- (_TtC4Maps29WeatherConditionsDataProvider)init
{
  result = (_TtC4Maps29WeatherConditionsDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end