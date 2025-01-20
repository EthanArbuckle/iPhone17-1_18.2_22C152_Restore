@interface SAClockSearch
+ (id)search;
- (BOOL)requiresResponse;
- (NSNumber)alCityId;
- (NSString)countryCode;
- (NSString)unlocalizedCityName;
- (NSString)unlocalizedCountryName;
- (NSURL)identifier;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlCityId:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setUnlocalizedCityName:(id)a3;
- (void)setUnlocalizedCountryName:(id)a3;
@end

@implementation SAClockSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.clock";
}

- (id)encodedClassName
{
  return @"Search";
}

+ (id)search
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

- (NSString)countryCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"countryCode"];
}

- (void)setCountryCode:(id)a3
{
}

- (NSURL)identifier
{
  return (NSURL *)AceObjectURLForProperty(self, @"identifier");
}

- (void)setIdentifier:(id)a3
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

- (BOOL)requiresResponse
{
  return 1;
}

@end