@interface SAWeatherWindSpeed
+ (id)windSpeed;
- (NSNumber)windDirectionDegree;
- (NSString)value;
- (NSString)windDirection;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setValue:(id)a3;
- (void)setWindDirection:(id)a3;
- (void)setWindDirectionDegree:(id)a3;
@end

@implementation SAWeatherWindSpeed

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"WindSpeed";
}

+ (id)windSpeed
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

- (NSString)windDirection
{
  return (NSString *)[(AceObject *)self propertyForKey:@"windDirection"];
}

- (void)setWindDirection:(id)a3
{
}

- (NSNumber)windDirectionDegree
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"windDirectionDegree"];
}

- (void)setWindDirectionDegree:(id)a3
{
}

@end