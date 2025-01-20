@interface SAContextPromise
+ (id)contextPromise;
- (BOOL)requiresResponse;
- (NSArray)promiseTypes;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setPromiseTypes:(id)a3;
@end

@implementation SAContextPromise

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ContextPromise";
}

+ (id)contextPromise
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)promiseTypes
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"promiseTypes"];
}

- (void)setPromiseTypes:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end