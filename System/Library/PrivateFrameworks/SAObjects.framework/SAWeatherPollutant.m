@interface SAWeatherPollutant
+ (id)pollutant;
- (NSNumber)amount;
- (NSString)localizedDescription;
- (NSString)name;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAmount:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SAWeatherPollutant

- (id)groupIdentifier
{
  return @"com.apple.ace.weather";
}

- (id)encodedClassName
{
  return @"Pollutant";
}

+ (id)pollutant
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)amount
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"amount"];
}

- (void)setAmount:(id)a3
{
}

- (NSString)localizedDescription
{
  return (NSString *)[(AceObject *)self propertyForKey:@"localizedDescription"];
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

@end