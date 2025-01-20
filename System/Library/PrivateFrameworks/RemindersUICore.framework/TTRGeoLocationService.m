@interface TTRGeoLocationService
- (_TtC15RemindersUICore21TTRGeoLocationService)init;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation TTRGeoLocationService

- (_TtC15RemindersUICore21TTRGeoLocationService)init
{
  result = (_TtC15RemindersUICore21TTRGeoLocationService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService__addressToResolvedLocationCache;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9B4910);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService__locationToResolvedLocationCache;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9B4928);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  sub_1B928D018(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_currentlyGeocodingLocation), *(void *)&self->delegate[OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_currentlyGeocodingLocation], *(void *)&self->delegate[OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_currentlyGeocodingLocation + 8], *(void *)&self->locationAccuracyUpperBound[OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_currentlyGeocodingLocation]);
  v7 = (char *)self + OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService__lastKnownCurrentLocation;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB9B4938);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_locationManager));
  swift_release();
  uint64_t v9 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15RemindersUICore21TTRGeoLocationService_blockToPerformAfterRequestingInUseAuthorization);

  sub_1B90C337C(v9);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v4 = (objc_class *)a3;
  v5._id internal = self;
  id internal = v5._internal;
  v5.super.isa = v4;
  TTRGeoLocationService.locationManagerDidChangeAuthorization(_:)(v5);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_1B90BFD68(0, &qword_1EB9B4A40);
  unint64_t v6 = sub_1B996EE50();
  id v7 = a3;
  uint64_t v8 = self;
  sub_1B9667FB8(v6);

  swift_bridgeObjectRelease();
}

@end