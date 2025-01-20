@interface NSBundle(WorkflowKit)
- (uint64_t)wf_isFocusConfigurationExtensionBundle;
- (uint64_t)wf_isWidgetConfigurationExtensionBundle;
@end

@implementation NSBundle(WorkflowKit)

- (uint64_t)wf_isFocusConfigurationExtensionBundle
{
  v2 = [a1 bundleIdentifier];
  if ([v2 isEqualToString:*MEMORY[0x1E4FB4B68]])
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [a1 bundleIdentifier];
    uint64_t v3 = [v4 isEqualToString:*MEMORY[0x1E4FB4B70]];
  }
  return v3;
}

- (uint64_t)wf_isWidgetConfigurationExtensionBundle
{
  v1 = [a1 bundleIdentifier];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4FB4BA8]];

  return v2;
}

@end