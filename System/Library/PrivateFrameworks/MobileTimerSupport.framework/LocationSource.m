@interface LocationSource
- (NSString)description;
- (_TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationSource

- (NSString)description
{
  v2 = self;
  sub_1BE2E2580();

  v3 = (void *)sub_1BE3233B0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource)init
{
  result = (_TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource_distanceFilter;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA106090);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1BE2E88CC();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource_inUseAssertion));
  sub_1BE2E96B0(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource____lazy_storage___locationManager));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18MobileTimerSupportP33_0CD95D0D9EE7821C8CFFD1B73E50A13E14LocationSource_locationQueue);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_1BE2A0EBC(0, &qword_1EA106808);
  unint64_t v6 = sub_1BE323510();
  id v7 = a3;
  v8 = self;
  sub_1BE2E301C(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1BE2E63D8((uint64_t)v8);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BE2E6650();
}

@end