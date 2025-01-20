@interface SAHACurrentHome
+ (id)currentHome;
- (NSString)currentHomeIdentifier;
- (NSString)currentHomeName;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCurrentHomeIdentifier:(id)a3;
- (void)setCurrentHomeName:(id)a3;
@end

@implementation SAHACurrentHome

- (id)groupIdentifier
{
  return @"com.apple.ace.homeautomation";
}

- (id)encodedClassName
{
  return @"CurrentHome";
}

+ (id)currentHome
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)currentHomeIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"currentHomeIdentifier"];
}

- (void)setCurrentHomeIdentifier:(id)a3
{
}

- (NSString)currentHomeName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"currentHomeName"];
}

- (void)setCurrentHomeName:(id)a3
{
}

@end