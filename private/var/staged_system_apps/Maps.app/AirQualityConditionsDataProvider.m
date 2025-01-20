@interface AirQualityConditionsDataProvider
- (BOOL)enabled;
- (_TtC4Maps32AirQualityConditionsDataProvider)init;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)weatherLocationDataProvider:(id)a3 didChangeLocation:(id)a4;
@end

@implementation AirQualityConditionsDataProvider

- (void)weatherLocationDataProvider:(id)a3 didChangeLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100009128(a4);
}

- (_TtC4Maps32AirQualityConditionsDataProvider)init
{
  return (_TtC4Maps32AirQualityConditionsDataProvider *)sub_100020594();
}

- (void)addObserver:(id)a3
{
}

- (void)dealloc
{
  v2 = self;
  sub_10011B928();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_airQualityConditions));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_lastSavedLocation));

  swift_release();
}

- (BOOL)enabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_enabled);
}

- (void)setEnabled:(BOOL)a3
{
  char v3 = *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_enabled);
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_enabled) = a3;
  v4 = self;
  sub_10011BAC8(v3);
}

- (void)removeObserver:(id)a3
{
}

@end