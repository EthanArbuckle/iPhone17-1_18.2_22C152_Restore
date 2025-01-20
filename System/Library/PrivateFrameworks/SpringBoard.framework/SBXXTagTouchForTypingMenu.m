@interface SBXXTagTouchForTypingMenu
@end

@implementation SBXXTagTouchForTypingMenu

void ___SBXXTagTouchForTypingMenu_block_invoke(uint64_t a1)
{
  id v2 = +[SBSystemGestureManager mainDisplayManager];
  [v2 ignoreScreenEdgeTouchWithIdentifier:*(unsigned int *)(a1 + 32)];
}

@end