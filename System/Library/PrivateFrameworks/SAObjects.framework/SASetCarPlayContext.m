@interface SASetCarPlayContext
+ (id)setCarPlayContext;
- (BOOL)requiresResponse;
- (NSArray)objects;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setObjects:(id)a3;
@end

@implementation SASetCarPlayContext

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetCarPlayContext";
}

+ (id)setCarPlayContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)objects
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"objects", v3);
}

- (void)setObjects:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end