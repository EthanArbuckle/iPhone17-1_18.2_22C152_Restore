@interface UIKeyboardTextSelectionGestureController
@end

@implementation UIKeyboardTextSelectionGestureController

void __59___UIKeyboardTextSelectionGestureController_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(_UIKeyboardTextSelectionGestureController);
  v1 = (void *)qword_1EB25B368;
  qword_1EB25B368 = (uint64_t)v0;
}

void __74___UIKeyboardTextSelectionGestureController_willRemoveSelectionController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setEnabled:0];
  [v2 setEnabled:1];
}

@end