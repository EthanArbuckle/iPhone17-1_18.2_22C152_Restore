@interface UIKeyCommand(IC)
+ (id)ic_keyCommandWithInput:()IC modifierFlags:action:discoverabilityTitle:;
@end

@implementation UIKeyCommand(IC)

+ (id)ic_keyCommandWithInput:()IC modifierFlags:action:discoverabilityTitle:
{
  v9 = (void *)MEMORY[0x1E4FB18D0];
  id v10 = a6;
  v11 = [v9 keyCommandWithInput:a3 modifierFlags:a4 action:a5];
  [v11 setDiscoverabilityTitle:v10];

  return v11;
}

@end