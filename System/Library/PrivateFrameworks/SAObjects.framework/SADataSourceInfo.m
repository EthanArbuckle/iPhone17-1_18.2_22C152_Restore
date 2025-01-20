@interface SADataSourceInfo
- (NSString)contextIdentifier;
- (NSString)proximityHint;
- (NSString)sourceDeviceOwnership;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setContextIdentifier:(id)a3;
- (void)setProximityHint:(id)a3;
- (void)setSourceDeviceOwnership:(id)a3;
@end

@implementation SADataSourceInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"DataSourceInfo";
}

- (NSString)contextIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contextIdentifier"];
}

- (void)setContextIdentifier:(id)a3
{
}

- (NSString)proximityHint
{
  return (NSString *)[(AceObject *)self propertyForKey:@"proximityHint"];
}

- (void)setProximityHint:(id)a3
{
}

- (NSString)sourceDeviceOwnership
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sourceDeviceOwnership"];
}

- (void)setSourceDeviceOwnership:(id)a3
{
}

@end