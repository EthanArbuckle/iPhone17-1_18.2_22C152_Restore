@interface CHSWidgetDescriptor(Sanitization)
- (SBHSpecialWidgetDescriptor)sanitizedDescriptor;
@end

@implementation CHSWidgetDescriptor(Sanitization)

- (SBHSpecialWidgetDescriptor)sanitizedDescriptor
{
  v2 = [a1 extensionBundleIdentifier];
  if ([v2 length])
  {

LABEL_4:
    v4 = a1;
    goto LABEL_6;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_4;
  }
  v5 = [a1 kind];
  uint64_t v6 = SBHSpecialWidgetDescriptorTypeForKind(v5);

  v4 = [[SBHSpecialWidgetDescriptor alloc] initWithType:v6];
LABEL_6:
  return v4;
}

@end