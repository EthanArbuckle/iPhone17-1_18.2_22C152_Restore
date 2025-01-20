@interface UIView
@end

@implementation UIView

uint64_t __65__UIView_NAUIAutolayoutDebugging___naui_beginDebuggingAutolayout__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_naui_beginDebuggingAutolayout");
}

uint64_t __66__UIView_NAUIAdditions__naui_performAnimateableConstraintChanges___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

@end