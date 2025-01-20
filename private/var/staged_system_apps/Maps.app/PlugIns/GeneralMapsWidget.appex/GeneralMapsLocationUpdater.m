@interface GeneralMapsLocationUpdater
- (_TtC17GeneralMapsWidget26GeneralMapsLocationUpdater)initWithName:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)onStartImplementation;
@end

@implementation GeneralMapsLocationUpdater

- (void)dealloc
{
  v2 = self;
  sub_100024D28();
}

- (void).cxx_destruct
{
  swift_errorRelease();
  v3 = *(void **)&self->MapsSuggestionsBaseLocationUpdater_opaque[OBJC_IVAR____TtC17GeneralMapsWidget26GeneralMapsLocationUpdater_waitForLocationGroup];
}

- (void)onStartImplementation
{
  v2 = self;
  sub_100026094();
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_100026B4C();
  unint64_t v6 = sub_1000838D0();
  id v7 = a3;
  v8 = self;
  sub_10002635C(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_100026C5C((uint64_t)v8);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v5 = sub_1000836A0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (uint64_t *)((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v9 = a3;
  v10 = self;
  void *v8 = [(GeneralMapsLocationUpdater *)v10 dispatchQueue];
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  char v11 = sub_1000836C0();
  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if (v11)
  {
    -[GeneralMapsLocationUpdater considerMyAllowanceAsLimited:](v10, "considerMyAllowanceAsLimited:", [v9 accuracyAuthorization] != 0);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC17GeneralMapsWidget26GeneralMapsLocationUpdater)initWithName:(id)a3 queue:(id)a4
{
  id v4 = a4;
  result = (_TtC17GeneralMapsWidget26GeneralMapsLocationUpdater *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end