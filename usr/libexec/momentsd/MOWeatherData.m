@interface MOWeatherData
- (NSMeasurement)temperature;
- (NSMeasurement)windSpeed;
- (NSString)symbolName;
- (NSString)weatherSummary;
- (_TtC8momentsd13MOWeatherData)init;
- (_TtC8momentsd13MOWeatherData)initWithTemperature:(id)a3 windSpeed:(id)a4 weatherSummry:(id)a5 symbolName:(id)a6;
- (id)getSymbolName;
- (id)getTemperature;
- (id)getWeatherSummary;
- (id)getWinSpeed;
- (void)setSymbolName:(id)a3;
- (void)setTemperature:(id)a3;
- (void)setWeatherSummary:(id)a3;
- (void)setWindSpeed:(id)a3;
@end

@implementation MOWeatherData

- (NSMeasurement)temperature
{
  return (NSMeasurement *)@objc MOWeatherData.temperature.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for Measurement<NSUnitTemperature>, &OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature);
}

- (void)setTemperature:(id)a3
{
}

- (NSMeasurement)windSpeed
{
  return (NSMeasurement *)@objc MOWeatherData.temperature.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for Measurement<NSUnitSpeed>, &OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed);
}

- (void)setWindSpeed:(id)a3
{
}

- (NSString)weatherSummary
{
  return (NSString *)@objc MOWeatherData.weatherSummary.getter();
}

- (void)setWeatherSummary:(id)a3
{
}

- (NSString)symbolName
{
  return (NSString *)@objc MOWeatherData.weatherSummary.getter();
}

- (void)setSymbolName:(id)a3
{
}

- (_TtC8momentsd13MOWeatherData)initWithTemperature:(id)a3 windSpeed:(id)a4 weatherSummry:(id)a5 symbolName:(id)a6
{
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  uint64_t v7 = *(void *)(v29 - 8);
  __chkstk_darwin(v29, v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  uint64_t v28 = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NSUnitTemperature(0, &lazy cache variable for type metadata for NSUnitTemperature);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  type metadata accessor for NSUnitTemperature(0, &lazy cache variable for type metadata for NSUnitSpeed);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = v20;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))((char *)self + OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature, v15, v11);
  uint64_t v22 = v29;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed, v10, v29);
  v23 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8momentsd13MOWeatherData_weatherSummary);
  uint64_t *v23 = v16;
  v23[1] = v18;
  v24 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8momentsd13MOWeatherData_symbolName);
  uint64_t *v24 = v19;
  v24[1] = v21;
  v25 = (objc_class *)type metadata accessor for MOWeatherData();
  v30.receiver = self;
  v30.super_class = v25;
  v26 = [(MOWeatherData *)&v30 init];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v22);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v28);
  return v26;
}

- (id)getTemperature
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x70);
  uint64_t v9 = self;
  v8();

  NSMeasurement v14 = Measurement._bridgeToObjectiveC()();
  Class isa = v14.super.isa;
  (*(void (**)(char *, uint64_t, __n128))(v4 + 8))(v7, v3, *(__n128 *)&v14._doubleValue);

  return isa;
}

- (id)getWinSpeed
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  uint64_t v9 = self;
  v8();

  NSMeasurement v14 = Measurement._bridgeToObjectiveC()();
  Class isa = v14.super.isa;
  (*(void (**)(char *, uint64_t, __n128))(v4 + 8))(v7, v3, *(__n128 *)&v14._doubleValue);

  return isa;
}

- (id)getWeatherSummary
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xA0);
  uint64_t v3 = self;
  v2();

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v4;
}

- (id)getSymbolName
{
  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xB8);
  uint64_t v3 = self;
  v2();

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v4;
}

- (_TtC8momentsd13MOWeatherData)init
{
  result = (_TtC8momentsd13MOWeatherData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end