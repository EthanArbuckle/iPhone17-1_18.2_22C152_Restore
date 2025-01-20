@interface SAFmfVisibilitySetCompleted
+ (id)visibilitySetCompleted;
- (BOOL)requiresResponse;
- (NSURL)searchContext;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setSearchContext:(id)a3;
@end

@implementation SAFmfVisibilitySetCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.fmf";
}

- (id)encodedClassName
{
  return @"VisibilitySetCompleted";
}

+ (id)visibilitySetCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)searchContext
{
  return (NSURL *)AceObjectURLForProperty(self, @"searchContext");
}

- (void)setSearchContext:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end