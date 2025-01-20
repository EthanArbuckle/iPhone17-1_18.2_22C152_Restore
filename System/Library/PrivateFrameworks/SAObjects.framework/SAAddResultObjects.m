@interface SAAddResultObjects
+ (id)addResultObjects;
- (BOOL)requiresResponse;
- (NSArray)objects;
- (NSArray)resultObjects;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setObjects:(id)a3;
- (void)setResultObjects:(id)a3;
@end

@implementation SAAddResultObjects

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"AddResultObjects";
}

+ (id)addResultObjects
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)objects
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"objects", &unk_1EFD73568);
}

- (void)setObjects:(id)a3
{
}

- (NSArray)resultObjects
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"resultObjects", &unk_1EFD734D0);
}

- (void)setResultObjects:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end