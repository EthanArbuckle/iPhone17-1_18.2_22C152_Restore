@interface SAGKNewsLinkedAnswer
+ (id)newsLinkedAnswer;
- (NSDate)publicationDate;
- (NSString)source;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPublicationDate:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation SAGKNewsLinkedAnswer

- (id)groupIdentifier
{
  return @"com.apple.ace.generalknowledge";
}

- (id)encodedClassName
{
  return @"NewsLinkedAnswer";
}

+ (id)newsLinkedAnswer
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