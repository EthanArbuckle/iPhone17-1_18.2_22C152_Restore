@interface SAWeatherBarometricPressure
+ (id)barometricPressure;
- (NSString)trend;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTrend:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SAWeatherBarometricPressure

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"BarometricPressure";
}

+ (id)barometricPressure
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)trend
{
  return (NSString *)[(AceObject *)self propertyForKey:@"trend"];
}

- (void)setTrend:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end