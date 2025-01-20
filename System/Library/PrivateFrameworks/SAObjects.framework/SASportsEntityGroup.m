@interface SASportsEntityGroup
+ (id)entityGroup;
- (NSArray)entities;
- (NSString)groupType;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setEntities:(id)a3;
- (void)setGroupType:(id)a3;
@end

@implementation SASportsEntityGroup

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"EntityGroup";
}

+ (id)entityGroup
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)entities
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"entities", v3);
}

- (void)setEntities:(id)a3
{
}

- (NSString)groupType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"groupType"];
}

- (void)setGroupType:(id)a3
{
}

@end