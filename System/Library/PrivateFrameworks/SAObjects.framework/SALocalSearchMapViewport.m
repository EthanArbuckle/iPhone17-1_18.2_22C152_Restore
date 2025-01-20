@interface SALocalSearchMapViewport
+ (id)mapViewport;
- (NSArray)vertices;
- (double)eastLongitude;
- (double)northLatitude;
- (double)southLatitude;
- (double)timeInSecondsSinceViewportChanged;
- (double)timeInSecondsSinceViewportEnteredForeground;
- (double)westLongitude;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEastLongitude:(double)a3;
- (void)setNorthLatitude:(double)a3;
- (void)setSouthLatitude:(double)a3;
- (void)setTimeInSecondsSinceViewportChanged:(double)a3;
- (void)setTimeInSecondsSinceViewportEnteredForeground:(double)a3;
- (void)setVertices:(id)a3;
- (void)setWestLongitude:(double)a3;
@end

@implementation SALocalSearchMapViewport

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"MapViewport";
}

+ (id)mapViewport
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (double)eastLongitude
{
  return AceObjectDoubleForProperty(self, @"eastLongitude");
}

- (void)setEastLongitude:(double)a3
{
}

- (double)northLatitude
{
  return AceObjectDoubleForProperty(self, @"northLatitude");
}

- (void)setNorthLatitude:(double)a3
{
}

- (double)southLatitude
{
  return AceObjectDoubleForProperty(self, @"southLatitude");
}

- (void)setSouthLatitude:(double)a3
{
}

- (double)timeInSecondsSinceViewportChanged
{
  return AceObjectDoubleForProperty(self, @"timeInSecondsSinceViewportChanged");
}

- (void)setTimeInSecondsSinceViewportChanged:(double)a3
{
}

- (double)timeInSecondsSinceViewportEnteredForeground
{
  return AceObjectDoubleForProperty(self, @"timeInSecondsSinceViewportEnteredForeground");
}

- (void)setTimeInSecondsSinceViewportEnteredForeground:(double)a3
{
}

- (NSArray)vertices
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"vertices", v3);
}

- (void)setVertices:(id)a3
{
}

- (double)westLongitude
{
  return AceObjectDoubleForProperty(self, @"westLongitude");
}

- (void)setWestLongitude:(double)a3
{
}

@end