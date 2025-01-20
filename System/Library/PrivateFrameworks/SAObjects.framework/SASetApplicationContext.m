@interface SASetApplicationContext
+ (id)setApplicationContext;
- (BOOL)requiresResponse;
- (NSArray)orderedContext;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setOrderedContext:(id)a3;
@end

@implementation SASetApplicationContext

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetApplicationContext";
}

+ (id)setApplicationContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)orderedContext
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"orderedContext"];
}

- (void)setOrderedContext:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end