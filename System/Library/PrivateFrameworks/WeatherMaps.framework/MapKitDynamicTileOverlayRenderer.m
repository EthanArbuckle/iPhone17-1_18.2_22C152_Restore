@interface MapKitDynamicTileOverlayRenderer
- (BOOL)canDrawKey:(id *)a3 withTile:(id)a4;
- (BOOL)isFallbackEnabled;
- (BOOL)useMetalTexture;
- (_TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer)initWithOverlay:(id)a3;
- (_TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer)initWithTileOverlay:(id)a3;
- (int64_t)estimatedCostForTile:(id)a3;
- (void)didExitTile:(id *)a3;
- (void)drawTileAtPath:(id *)a3 withTile:(id)a4 inIOSurface:(__IOSurface *)a5 withTimestamp:(double)a6;
- (void)drawTileAtPath:(id *)a3 withTile:(id)a4 inTexture:(id)a5 withTimestamp:(double)a6 withTileScale:(float)a7;
- (void)onVisibleTiles:(id *)a3 count:(int64_t)a4;
@end

@implementation MapKitDynamicTileOverlayRenderer

- (void)drawTileAtPath:(id *)a3 withTile:(id)a4 inIOSurface:(__IOSurface *)a5 withTimestamp:(double)a6
{
  int64_t var0 = a3->var0;
  int64_t var1 = a3->var1;
  int64_t var2 = a3->var2;
  id v11 = a4;
  v12 = a5;
  v13 = self;
  sub_20A2547AC(var0, var1, var2, (uint64_t)v11, v12);
}

- (void)drawTileAtPath:(id *)a3 withTile:(id)a4 inTexture:(id)a5 withTimestamp:(double)a6 withTileScale:(float)a7
{
  int64_t var0 = a3->var0;
  int64_t var1 = a3->var1;
  int64_t var2 = a3->var2;
  double var3 = a3->var3;
  id v14 = a4;
  swift_unknownObjectRetain();
  v16 = self;
  sub_20A255124(var0, var1, var2, (uint64_t)v14, (uint64_t)a5, var3, v15, a7);

  swift_unknownObjectRelease();
}

- (BOOL)useMetalTexture
{
  return sub_20A25565C() & 1;
}

- (BOOL)isFallbackEnabled
{
  return sub_20A255694() & 1;
}

- (BOOL)canDrawKey:(id *)a3 withTile:(id)a4
{
  int64_t var0 = a3->var0;
  int64_t var1 = a3->var1;
  int64_t var2 = a3->var2;
  double var3 = a3->var3;
  id v9 = a4;
  v10 = self;
  LOBYTE(var0) = sub_20A2556A4(var0, var1, var2, (uint64_t)v9, var3);

  return var0 & 1;
}

- (void)onVisibleTiles:(id *)a3 count:(int64_t)a4
{
  v6 = self;
  sub_20A255E64((uint64_t)a3, a4);
}

- (void)didExitTile:(id *)a3
{
  int64_t var0 = a3->var0;
  int64_t var1 = a3->var1;
  int64_t var2 = a3->var2;
  double var3 = a3->var3;
  v7 = self;
  sub_20A256384(var0, var1, var2, var3);
}

- (int64_t)estimatedCostForTile:(id)a3
{
  id v4 = a3;
  v5 = self;
  int64_t v6 = sub_20A256484((uint64_t)v4);

  return v6;
}

- (_TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer)initWithTileOverlay:(id)a3
{
  id v3 = a3;
  sub_20A256580();
}

- (_TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer)initWithOverlay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer_dynamicOverlay));
  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer_signposter;
  uint64_t v4 = sub_20A38A930();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer_renderTimer));
  swift_bridgeObjectRelease();
  sub_20A1CC7A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer_delegate);
  v5 = (char *)self + OBJC_IVAR____TtC11WeatherMaps32MapKitDynamicTileOverlayRenderer_ioSurfaceRefCache;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_267626C90);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end