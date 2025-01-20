@interface UIFoundationAssert
@end

@implementation UIFoundationAssert

void ___UIFoundationAssert_block_invoke()
{
  id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v0 = [v1 valueForKey:@"_UIFoundationAssertThrows"];

  if (v0) {
    _UIFoundationAssert_raise = [v1 BOOLForKey:@"_UIFoundationAssertThrows"];
  }
}

@end