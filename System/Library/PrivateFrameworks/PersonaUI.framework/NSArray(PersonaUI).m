@interface NSArray(PersonaUI)
- (id)pr_objectPassingTest:()PersonaUI;
@end

@implementation NSArray(PersonaUI)

- (id)pr_objectPassingTest:()PersonaUI
{
  uint64_t v2 = objc_msgSend(a1, "indexOfObjectPassingTest:");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    v3 = [a1 objectAtIndex:v2];
  }
  return v3;
}

@end