@interface SALocalSearchDropAPinAtCurrentLocation
+ (id)dropAPinAtCurrentLocation;
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
@end

@implementation SALocalSearchDropAPinAtCurrentLocation

- (id)groupIdentifier
{
  return @"com.apple.ace.localsearch";
}

- (id)encodedClassName
{
  return @"DropAPinAtCurrentLocation";
}

+ (id)dropAPinAtCurrentLocation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)requiresResponse
{
  return 1;
}

@end