@interface SAWebNewsResult
+ (id)newsResult;
- (NSDate)publicationDate;
- (NSString)source;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPublicationDate:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation SAWebNewsResult

- (id)groupIdentifier
{
  return @"com.apple.ace.websearch";
}

- (id)encodedClassName
{
  return @"NewsResult";
}

+ (id)newsResult
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSDate)publicationDate
{
  return (NSDate *)[(AceObject *)self propertyForKey:@"publicationDate"];
}

- (void)setPublicationDate:(id)a3
{
}

- (NSString)source
{
  return (NSString *)[(AceObject *)self propertyForKey:@"source"];
}

- (void)setSource:(id)a3
{
}

@end