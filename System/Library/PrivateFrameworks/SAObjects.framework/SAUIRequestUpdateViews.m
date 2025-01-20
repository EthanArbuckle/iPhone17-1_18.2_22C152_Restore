@interface SAUIRequestUpdateViews
+ (id)requestUpdateViews;
- (BOOL)requiresResponse;
- (NSArray)commands;
- (NSArray)viewIds;
- (NSNumber)timeInSeconds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCommands:(id)a3;
- (void)setTimeInSeconds:(id)a3;
- (void)setViewIds:(id)a3;
@end

@implementation SAUIRequestUpdateViews

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"RequestUpdateViews";
}

+ (id)requestUpdateViews
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD72FF0);
}

- (void)setCommands:(id)a3
{
}

- (NSNumber)timeInSeconds
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"timeInSeconds"];
}

- (void)setTimeInSeconds:(id)a3
{
}

- (NSArray)viewIds
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"viewIds"];
}

- (void)setViewIds:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end