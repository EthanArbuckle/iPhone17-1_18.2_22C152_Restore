@interface _UIPlaceholderWindowScene
+ (BOOL)alwaysKeepContexts;
+ (BOOL)autoInvalidates;
+ (BOOL)shouldAllowComponents;
- (BOOL)_permitContextCreationForBindingDescription:(id *)a3;
@end

@implementation _UIPlaceholderWindowScene

+ (BOOL)alwaysKeepContexts
{
  return 0;
}

+ (BOOL)shouldAllowComponents
{
  return 1;
}

+ (BOOL)autoInvalidates
{
  return 1;
}

- (BOOL)_permitContextCreationForBindingDescription:(id *)a3
{
  return 0;
}

@end