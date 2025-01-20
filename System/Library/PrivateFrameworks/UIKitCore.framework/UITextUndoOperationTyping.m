@interface UITextUndoOperationTyping
@end

@implementation UITextUndoOperationTyping

uint64_t __38___UITextUndoOperationTyping_undoRedo__block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "replaceCharactersInRange:withAttributedString:", a1[5], a1[6], *(void *)(a1[4] + 48));
}

@end