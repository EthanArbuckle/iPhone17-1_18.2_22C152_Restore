@interface WFConfiguredSystemAction
@end

@implementation WFConfiguredSystemAction

uint64_t __59__WFConfiguredSystemAction_LNValue__systemActionWithValue___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  v3 = v2;
  if (v2 == @"encodedSystemAction")
  {
    uint64_t v4 = 1;
  }
  else if (v2)
  {
    uint64_t v4 = [(__CFString *)v2 isEqualToString:@"encodedSystemAction"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

@end