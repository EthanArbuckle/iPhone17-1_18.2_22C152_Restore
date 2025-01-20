@interface SAPhoneIncomingCallSearchResult
+ (id)incomingCallSearchResult;
- (NSString)incomingCallType;
- (SAPersonAttribute)caller;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCaller:(id)a3;
- (void)setIncomingCallType:(id)a3;
@end

@implementation SAPhoneIncomingCallSearchResult

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"IncomingCallSearchResult";
}

+ (id)incomingCallSearchResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAPersonAttribute)caller
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, @"caller");
}

- (void)setCaller:(id)a3
{
}

- (NSString)incomingCallType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"incomingCallType"];
}

- (void)setIncomingCallType:(id)a3
{
}

@end