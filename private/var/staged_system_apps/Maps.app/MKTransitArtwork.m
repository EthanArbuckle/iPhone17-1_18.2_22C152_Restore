@interface MKTransitArtwork
+ (id)_shieldWithType:(int64_t)a3 hexColorString:(id)a4 accessibilityText:(id)a5;
+ (id)stationNodeArtworkWithHexColor:(id)a3;
+ (id)stationNodeOutlinedArtworkWithHexColor:(id)a3;
@end

@implementation MKTransitArtwork

+ (id)stationNodeArtworkWithHexColor:(id)a3
{
  return _[a1 _shieldWithType:280000 hexColorString:a3 accessibilityText:0];
}

+ (id)stationNodeOutlinedArtworkWithHexColor:(id)a3
{
  return _[a1 _shieldWithType:280001 hexColorString:a3 accessibilityText:0];
}

+ (id)_shieldWithType:(int64_t)a3 hexColorString:(id)a4 accessibilityText:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [objc_alloc((Class)MKTransitShield) initWithShieldType:a3 text:0 color:v8];

  v10 = +[MKTransitArtwork artworkWithShield:v9 accessibilityText:v7];

  return v10;
}

@end