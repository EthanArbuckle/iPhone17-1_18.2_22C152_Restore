@interface SAMacSystemInformation
+ (id)systemInformation;
- (NSString)query;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setQuery:(id)a3;
@end

@implementation SAMacSystemInformation

- (id)groupIdentifier
{
  return @"com.apple.ace.mac";
}

- (id)encodedClassName
{
  return @"SystemInformation";
}

+ (id)systemInformation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)query
{
  return (NSString *)[(AceObject *)self propertyForKey:@"query"];
}

- (void)setQuery:(id)a3
{
}

@end