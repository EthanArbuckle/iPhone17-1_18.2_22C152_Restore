@interface SAPhoneCallSearchResult
+ (id)callSearchResult;
- (NSDate)callTime;
- (NSNumber)isNew;
- (SAPersonAttribute)contact;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCallTime:(id)a3;
- (void)setContact:(id)a3;
- (void)setIsNew:(id)a3;
@end

@implementation SAPhoneCallSearchResult

- (id)groupIdentifier
{
  return @"com.apple.ace.phone";
}

- (id)encodedClassName
{
  return @"CallSearchResult";
}

+ (id)callSearchResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)callTime
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"callTime"];
}

- (void)setCallTime:(id)a3
{
}

- (SAPersonAttribute)contact
{
  return (SAPersonAttribute *)AceObjectAceObjectForProperty(self, @"contact");
}

- (void)setContact:(id)a3
{
}

- (NSNumber)isNew
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"isNew"];
}

- (void)setIsNew:(id)a3
{
}

@end