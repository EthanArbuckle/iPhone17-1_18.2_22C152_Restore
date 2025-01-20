@interface SASportsMetadata
+ (id)metadata;
- (NSNumber)average;
- (NSNumber)selected;
- (NSString)identifier;
- (NSString)name;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAverage:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setSelected:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SASportsMetadata

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"Metadata";
}

+ (id)metadata
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSNumber)average
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"average"];
}

- (void)setAverage:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"identifier"];
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return (NSString *)[(AceObject *)self propertyForKey:@"name"];
}

- (void)setName:(id)a3
{
}

- (NSNumber)selected
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"selected"];
}

- (void)setSelected:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end