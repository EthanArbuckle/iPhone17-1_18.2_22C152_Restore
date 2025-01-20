@interface NSObject(SAUILayoutSpecifyingOverriding)
- (SAUILayoutSpecifyingOverrider)systemApertureLayoutSpecifyingOverrider;
@end

@implementation NSObject(SAUILayoutSpecifyingOverriding)

- (SAUILayoutSpecifyingOverrider)systemApertureLayoutSpecifyingOverrider
{
  id v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, "com.apple.SystemApertureUI.layoutSpecifyingOverrider");
  v2 = (SAUILayoutSpecifyingOverrider *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = [[SAUILayoutSpecifyingOverrider alloc] initWithTarget:v1];
    objc_setAssociatedObject(v1, "com.apple.SystemApertureUI.layoutSpecifyingOverrider", v2, (void *)1);
  }
  objc_sync_exit(v1);

  return v2;
}

@end