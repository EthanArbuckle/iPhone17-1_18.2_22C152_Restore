@interface GEOComposedRouteAnchorPoint(MNRouteEditor)
- (id)geoLocation;
- (id)loggingDescription;
@end

@implementation GEOComposedRouteAnchorPoint(MNRouteEditor)

- (id)geoLocation
{
  id v2 = objc_alloc(MEMORY[0x1E4F64660]);
  [a1 coordinate];
  v5 = objc_msgSend(v2, "initWithGEOCoordinate:isUserLocation:", objc_msgSend(a1, "isCurrentLocation"), v3, v4);
  [a1 coordinate];
  [v5 setAltitude:(int)v6];
  return v5;
}

- (id)loggingDescription
{
  id v2 = NSString;
  double v3 = [a1 name];
  [a1 locationCoordinate];
  uint64_t v5 = v4;
  [a1 locationCoordinate];
  v7 = [v2 stringWithFormat:@"\"%@\" at %f, %f", v3, v5, v6];

  return v7;
}

@end