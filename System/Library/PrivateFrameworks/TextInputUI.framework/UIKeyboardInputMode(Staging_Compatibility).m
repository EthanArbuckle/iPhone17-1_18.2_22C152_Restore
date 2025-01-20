@interface UIKeyboardInputMode(Staging_Compatibility)
- (id)safe__extendedDisplayName;
@end

@implementation UIKeyboardInputMode(Staging_Compatibility)

- (id)safe__extendedDisplayName
{
  if (objc_opt_respondsToSelector()) {
    [a1 extendedDisplayName];
  }
  else {
  v2 = [a1 displayName];
  }
  return v2;
}

@end