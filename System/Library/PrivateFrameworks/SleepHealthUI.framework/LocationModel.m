@interface LocationModel
- (_TtC13SleepHealthUI13LocationModel)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationModel

- (_TtC13SleepHealthUI13LocationModel)init
{
  result = (_TtC13SleepHealthUI13LocationModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI13LocationModel__currentLocation;
  sub_1AD9A640C(0, &qword_1E9A4A938, (uint64_t (*)(uint64_t))sub_1AD9A63A4, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SleepHealthUI13LocationModel_inUseAssertion);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1AD9A8484(v8);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_1AD837214(0, &qword_1E9A4A918);
  unint64_t v6 = sub_1AD9DF860();
  id v7 = a3;
  id v8 = self;
  sub_1AD9A8740(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v4 = (objc_class *)a3;
  v5._id internal = self;
  id internal = v5._internal;
  v5.super.isa = v4;
  LocationModel.locationManagerDidChangeAuthorization(_:)(v5);
}

@end