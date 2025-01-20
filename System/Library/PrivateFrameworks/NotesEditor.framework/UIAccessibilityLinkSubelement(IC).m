@interface UIAccessibilityLinkSubelement(IC)
- (id)accessibilityCustomRotors;
- (id)supportedRotorTypes;
@end

@implementation UIAccessibilityLinkSubelement(IC)

- (id)supportedRotorTypes
{
  v2[1] = *MEMORY[0x263EF8340];
  v2[0] = @"ICAccessibilityRotorTypeLinks";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:1];

  return v0;
}

- (id)accessibilityCustomRotors
{
  v0 = +[ICAccessibilityCustomRotorController sharedInstance];
  v1 = [v0 sharedTextViewRotors];

  return v1;
}

@end