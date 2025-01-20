@interface SAClockObject
+ (id)object;
- (NSNumber)alCityId;
- (NSString)cityName;
- (NSString)countryCode;
- (NSString)countryName;
- (NSString)timezoneId;
- (NSString)unlocalizedCityName;
- (NSString)unlocalizedCountryName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlCityId:(id)a3;
- (void)setCityName:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setCountryName:(id)a3;
- (void)setTimezoneId:(id)a3;
- (void)setUnlocalizedCityName:(id)a3;
- (void)setUnlocalizedCountryName:(id)a3;
@end

@implementation SAClockObject

- (id)groupIdentifier
{
  return @"com.apple.ace.clock";
}

- (id)encodedClassName
{
  return @"Object";
}

+ (id)object
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)alCityId
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"alCityId"];
}

- (void)setAlCityId:(id)a3
{
}

- (NSString)cityName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"cityName"];
}

- (void)setCityName:(id)a3
{
}

- (NSString)countryCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"countryCode"];
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)countryName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"countryName"];
}

- (void)setCountryName:(id)a3
{
}

- (NSString)timezoneId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timezoneId"];
}

- (void)setTimezoneId:(id)a3
{
}

- (NSString)unlocalizedCityName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"unlocalizedCityName"];
}

- (void)setUnlocalizedCityName:(id)a3
{
}

- (NSString)unlocalizedCountryName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"unlocalizedCountryName"];
}

- (void)setUnlocalizedCountryName:(id)a3
{
}

@end