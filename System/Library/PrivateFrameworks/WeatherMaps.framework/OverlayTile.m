@interface OverlayTile
- (BOOL)isEqual:(id)a3;
- (_TtC11WeatherMaps11OverlayTile)init;
@end

@implementation OverlayTile

- (_TtC11WeatherMaps11OverlayTile)init
{
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_20A38C2D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = sub_20A1FB5F4((uint64_t)v8);

  sub_20A1FB70C((uint64_t)v8);
  return v6;
}

@end