@interface SARadarSetDetails
+ (id)setDetails;
- (BOOL)requiresResponse;
- (NSString)classification;
- (NSString)description;
- (NSString)title;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setClassification:(id)a3;
- (void)setDescription:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SARadarSetDetails

- (id)groupIdentifier
{
  return @"com.apple.ace.radar";
}

- (id)encodedClassName
{
  return @"SetDetails";
}

+ (id)setDetails
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)classification
{
  return (NSString *)[(AceObject *)self propertyForKey:@"classification"];
}

- (void)setClassification:(id)a3
{
}

- (NSString)description
{
  return (NSString *)[(AceObject *)self propertyForKey:@"description"];
}

- (void)setDescription:(id)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end