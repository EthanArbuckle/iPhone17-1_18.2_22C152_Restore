@interface SARecordLocationActivity
- (BOOL)requiresResponse;
- (NSString)sourceType;
- (SALocation)location;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLocation:(id)a3;
- (void)setSourceType:(id)a3;
@end

@implementation SARecordLocationActivity

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"RecordLocationActivity";
}

- (SALocation)location
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"location");
}

- (void)setLocation:(id)a3
{
}

- (NSString)sourceType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sourceType"];
}

- (void)setSourceType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end