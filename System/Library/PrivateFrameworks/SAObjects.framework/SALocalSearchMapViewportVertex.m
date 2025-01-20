@interface SALocalSearchMapViewportVertex
+ (id)mapViewportVertex;
- (double)latitude;
- (double)longitude;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
@end

@implementation SALocalSearchMapViewportVertex

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"MapViewportVertex";
}

+ (id)mapViewportVertex
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (double)latitude
{
  return AceObjectDoubleForProperty(self, @"latitude");
}

- (void)setLatitude:(double)a3
{
}

- (double)longitude
{
  return AceObjectDoubleForProperty(self, @"longitude");
}

- (void)setLongitude:(double)a3
{
}

@end