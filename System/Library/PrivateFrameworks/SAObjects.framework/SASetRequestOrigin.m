@interface SASetRequestOrigin
+ (id)setRequestOrigin;
- (BOOL)requiresResponse;
- (NSNumber)age;
- (NSNumber)preciseLocationEnabled;
- (NSString)desiredAccuracy;
- (NSString)status;
- (double)altitude;
- (double)direction;
- (double)horizontalAccuracy;
- (double)latitude;
- (double)longitude;
- (double)speed;
- (double)verticalAccuracy;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAge:(id)a3;
- (void)setAltitude:(double)a3;
- (void)setDesiredAccuracy:(id)a3;
- (void)setDirection:(double)a3;
- (void)setHorizontalAccuracy:(double)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setPreciseLocationEnabled:(id)a3;
- (void)setSpeed:(double)a3;
- (void)setStatus:(id)a3;
- (void)setVerticalAccuracy:(double)a3;
@end

@implementation SASetRequestOrigin

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetRequestOrigin";
}

+ (id)setRequestOrigin
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

- (double)verticalAccuracy
{
  return AceObjectDoubleForProperty(self, @"verticalAccuracy");
}

- (void)setVerticalAccuracy:(double)a3
{
}

- (double)horizontalAccuracy
{
  return AceObjectDoubleForProperty(self, @"horizontalAccuracy");
}

- (void)setHorizontalAccuracy:(double)a3
{
}

- (NSNumber)age
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"age"];
}

- (void)setAge:(id)a3
{
}

- (double)altitude
{
  return AceObjectDoubleForProperty(self, @"altitude");
}

- (void)setAltitude:(double)a3
{
}

- (NSString)desiredAccuracy
{
  return (NSString *)[(AceObject *)self propertyForKey:@"desiredAccuracy"];
}

- (void)setDesiredAccuracy:(id)a3
{
}

- (double)direction
{
  return AceObjectDoubleForProperty(self, @"direction");
}

- (void)setDirection:(double)a3
{
}

- (NSNumber)preciseLocationEnabled
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"preciseLocationEnabled"];
}

- (void)setPreciseLocationEnabled:(id)a3
{
}

- (double)speed
{
  return AceObjectDoubleForProperty(self, @"speed");
}

- (void)setSpeed:(double)a3
{
}

- (NSString)status
{
  return (NSString *)[(AceObject *)self propertyForKey:@"status"];
}

- (void)setStatus:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end