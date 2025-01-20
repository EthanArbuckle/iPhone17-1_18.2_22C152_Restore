@interface MapKitDynamicTileOverlay
- (_TtC11WeatherMaps24MapKitDynamicTileOverlay)init;
- (void)cancelLoadingTileAtPath:(id *)a3;
- (void)loadTileAtPath:(id *)a3 result:(id)a4;
@end

@implementation MapKitDynamicTileOverlay

- (void)loadTileAtPath:(id *)a3 result:(id)a4
{
  int64_t var0 = a3->var0;
  int64_t var1 = a3->var1;
  int64_t var2 = a3->var2;
  double var3 = a3->var3;
  v9 = _Block_copy(a4);
  _Block_copy(v9);
  v10 = self;
  sub_20A325CD0(var0, var1, var2, (uint64_t)v10, (void (**)(void, void, void))v9, var3);
  _Block_release(v9);
}

- (void)cancelLoadingTileAtPath:(id *)a3
{
  int64_t var0 = a3->var0;
  v4 = self;
  sub_20A3260A8(var0);
}

- (_TtC11WeatherMaps24MapKitDynamicTileOverlay)init
{
}

- (void).cxx_destruct
{
  memcpy(v3, (char *)self + OBJC_IVAR____TtC11WeatherMaps24MapKitDynamicTileOverlay_overlayDescriptor, sizeof(v3));
  sub_20A1D8B10((uint64_t)v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24MapKitDynamicTileOverlay_appConfigurationManager);
  swift_unknownObjectRelease();
  sub_20A256AC4((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24MapKitDynamicTileOverlay_timeConfiguration);

  sub_20A1F5470(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11WeatherMaps24MapKitDynamicTileOverlay_purpose), *(void *)((char *)&self->super._providerID + OBJC_IVAR____TtC11WeatherMaps24MapKitDynamicTileOverlay_purpose), *((unsigned char *)&self->super._minimumZ + OBJC_IVAR____TtC11WeatherMaps24MapKitDynamicTileOverlay_purpose));
}

@end