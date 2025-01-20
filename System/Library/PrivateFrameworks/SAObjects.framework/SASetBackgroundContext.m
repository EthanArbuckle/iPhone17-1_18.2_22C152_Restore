@interface SASetBackgroundContext
+ (id)setBackgroundContext;
- (BOOL)requiresResponse;
- (NSArray)objects;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setObjects:(id)a3;
@end

@implementation SASetBackgroundContext

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetBackgroundContext";
}

+ (id)setBackgroundContext
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)objects
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"objects", &unk_1EFD79850);
}

- (void)setObjects:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end