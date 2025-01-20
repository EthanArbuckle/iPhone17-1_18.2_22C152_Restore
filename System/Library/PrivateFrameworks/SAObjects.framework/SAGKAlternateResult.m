@interface SAGKAlternateResult
+ (id)alternateResult;
- (NSString)name;
- (SAClientBoundCommand)command;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommand:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SAGKAlternateResult

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"AlternateResult";
}

+ (id)alternateResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAClientBoundCommand)command
{
  return (SAClientBoundCommand *)AceObjectAceObjectForProperty(self, @"command");
}

- (void)setCommand:(id)a3
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