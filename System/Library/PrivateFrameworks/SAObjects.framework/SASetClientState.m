@interface SASetClientState
+ (id)setClientState;
- (BOOL)requiresResponse;
- (NSArray)statesToSet;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setStatesToSet:(id)a3;
@end

@implementation SASetClientState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"SetClientState";
}

+ (id)setClientState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)statesToSet
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"statesToSet", v3);
}

- (void)setStatesToSet:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end