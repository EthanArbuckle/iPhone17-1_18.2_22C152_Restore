@interface UINavigationController(SUSlowRoll)
- (id)popViewControllerAnimated:()SUSlowRoll withCompletionBlock:;
@end

@implementation UINavigationController(SUSlowRoll)

- (id)popViewControllerAnimated:()SUSlowRoll withCompletionBlock:
{
  id v10 = a1;
  uint64_t v9 = a2;
  char v8 = a3 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setCompletionBlock:location];
  id v6 = (id)[v10 popViewControllerAnimated:v8 & 1];
  [MEMORY[0x263F158F8] commit];
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

@end