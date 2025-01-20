@interface UIApplication(WFApplicationContextProvider)
- (id)currentUserInterfaceTypeForWFApplicationContext:()WFApplicationContextProvider;
- (id)notificationNameForApplicationStateEvent:()WFApplicationContextProvider applicationContext:;
- (uint64_t)bundleForWFApplicationContext:()WFApplicationContextProvider;
- (uint64_t)userInterfaceStyle;
@end

@implementation UIApplication(WFApplicationContextProvider)

- (id)notificationNameForApplicationStateEvent:()WFApplicationContextProvider applicationContext:
{
  if (a3 <= 3) {
    a1 = **((id **)&unk_2649CB628 + a3);
  }
  return a1;
}

- (uint64_t)userInterfaceStyle
{
  v0 = [MEMORY[0x263F82B60] mainScreen];
  v1 = [v0 traitCollection];
  uint64_t v2 = [v1 userInterfaceStyle];

  if (v2 == 2) {
    return 2;
  }
  else {
    return v2 == 1;
  }
}

- (id)currentUserInterfaceTypeForWFApplicationContext:()WFApplicationContextProvider
{
  return (id)*MEMORY[0x263F33B40];
}

- (uint64_t)bundleForWFApplicationContext:()WFApplicationContextProvider
{
  return [MEMORY[0x263F086E0] mainBundle];
}

@end