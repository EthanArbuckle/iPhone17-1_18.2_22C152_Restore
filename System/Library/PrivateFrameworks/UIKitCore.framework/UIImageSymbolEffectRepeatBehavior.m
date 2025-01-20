@interface UIImageSymbolEffectRepeatBehavior
@end

@implementation UIImageSymbolEffectRepeatBehavior

void __59___UIImageSymbolEffectRepeatBehavior_defaultRepeatBehavior__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _repeatBehaviorWithRepeats:0.0];
  v2 = (void *)_MergedGlobals_1_22;
  _MergedGlobals_1_22 = v1;
}

void __62___UIImageSymbolEffectRepeatBehavior_indefiniteRepeatBehavior__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _repeatBehaviorWithRepeats:INFINITY];
  v2 = (void *)qword_1EB25BEE8;
  qword_1EB25BEE8 = v1;
}

@end