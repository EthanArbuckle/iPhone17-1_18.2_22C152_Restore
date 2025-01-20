@interface WANWActivityTransform
- (_TtC13WiFiAnalytics21WANWActivityTransform)init;
- (_TtC13WiFiAnalytics21WANWActivityTransform)initWithLater:(id)a3 early:(id)a4;
- (_TtC13WiFiAnalytics21WANWActivityTransform)initWithSingle:(id)a3;
- (id)expandKeyNameLengthsFrom:(id)a3;
- (id)getTransformedMeasurementForLogging;
- (id)getTransformedMeasurementForTelemetryWithIndex:(unsigned int)a3;
- (id)getTransformedMeasurementWithIndex:(unsigned int)a3;
- (id)trimKeyNameLengthsFrom:(id)a3;
@end

@implementation WANWActivityTransform

- (_TtC13WiFiAnalytics21WANWActivityTransform)initWithLater:(id)a3 early:(id)a4
{
  uint64_t v4 = sub_21DA5F4C0();
  uint64_t v5 = sub_21DA5F4C0();
  return (_TtC13WiFiAnalytics21WANWActivityTransform *)WANWActivityTransform.init(later:early:)(v4, v5);
}

- (_TtC13WiFiAnalytics21WANWActivityTransform)initWithSingle:(id)a3
{
  uint64_t v3 = sub_21DA5F4C0();
  return (_TtC13WiFiAnalytics21WANWActivityTransform *)WANWActivityTransform.init(single:)(v3);
}

- (id)getTransformedMeasurementForLogging
{
  v2 = self;
  unint64_t v3 = (unint64_t)WANWActivityTransform.getTransformedMeasurementForLogging()();

  if (v3)
  {
    uint64_t v4 = (void *)sub_21DA5F4B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)getTransformedMeasurementForTelemetryWithIndex:(unsigned int)a3
{
  return sub_21D99DA04(self, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t (*)(uint64_t))WANWActivityTransform.getTransformedMeasurementForTelemetry(index:));
}

- (id)getTransformedMeasurementWithIndex:(unsigned int)a3
{
  return sub_21D99DA04(self, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t (*)(uint64_t))WANWActivityTransform.getTransformedMeasurement(index:));
}

- (id)trimKeyNameLengthsFrom:(id)a3
{
  return sub_21D9A0670(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, unsigned char *))sub_21D99DAB8);
}

- (id)expandKeyNameLengthsFrom:(id)a3
{
  return sub_21D9A0670(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, unsigned char *))sub_21D99F018);
}

- (_TtC13WiFiAnalytics21WANWActivityTransform)init
{
  result = (_TtC13WiFiAnalytics21WANWActivityTransform *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end