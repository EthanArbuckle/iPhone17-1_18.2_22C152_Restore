@interface SAResultCallback
+ (id)resultCallback;
- (NSArray)commandReferences;
- (NSArray)commands;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
- (void)setCommandReferences:(id)a3;
- (void)setCommands:(id)a3;
@end

@implementation SAResultCallback

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ResultCallback";
}

+ (id)resultCallback
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)code
{
  return AceObjectIntegerForProperty(self, @"code");
}

- (void)setCode:(int64_t)a3
{
}

- (NSArray)commandReferences
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"commandReferences"];
}

- (void)setCommandReferences:(id)a3
{
}

- (NSArray)commands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"commands", &unk_1EFD73568);
}

- (void)setCommands:(id)a3
{
}

@end