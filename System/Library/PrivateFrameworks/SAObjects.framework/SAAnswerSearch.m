@interface SAAnswerSearch
+ (id)search;
- (BOOL)requiresResponse;
- (NSArray)product;
- (NSString)attribute;
- (NSString)miscQuestion;
- (NSString)placeAttribute;
- (NSString)timeQuestion;
- (NSString)verbType;
- (SALocation)address;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAddress:(id)a3;
- (void)setAttribute:(id)a3;
- (void)setMiscQuestion:(id)a3;
- (void)setPlaceAttribute:(id)a3;
- (void)setProduct:(id)a3;
- (void)setTimeQuestion:(id)a3;
- (void)setVerbType:(id)a3;
@end

@implementation SAAnswerSearch

- (id)groupIdentifier
{
  return @"com.apple.ace.answer";
}

- (id)encodedClassName
{
  return @"Search";
}

+ (id)search
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SALocation)address
{
  return (SALocation *)AceObjectAceObjectForProperty(self, @"address");
}

- (void)setAddress:(id)a3
{
}

- (NSString)attribute
{
  return (NSString *)[(AceObject *)self propertyForKey:@"attribute"];
}

- (void)setAttribute:(id)a3
{
}

- (NSString)miscQuestion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"miscQuestion"];
}

- (void)setMiscQuestion:(id)a3
{
}

- (NSString)placeAttribute
{
  return (NSString *)[(AceObject *)self propertyForKey:@"placeAttribute"];
}

- (void)setPlaceAttribute:(id)a3
{
}

- (NSArray)product
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"product"];
}

- (void)setProduct:(id)a3
{
}

- (NSString)timeQuestion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"timeQuestion"];
}

- (void)setTimeQuestion:(id)a3
{
}

- (NSString)verbType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"verbType"];
}

- (void)setVerbType:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end