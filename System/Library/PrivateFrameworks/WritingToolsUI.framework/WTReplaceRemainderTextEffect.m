@interface WTReplaceRemainderTextEffect
@end

@implementation WTReplaceRemainderTextEffect

void __50___WTReplaceRemainderTextEffect_updateEffectWith___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) effectView];
  v2 = [*(id *)(a1 + 32) identifier];
  id v3 = (id)objc_msgSend(v4, "removeEffect:animated:", v2, objc_msgSend(*(id *)(a1 + 32), "animateRemovalWhenDone"));
}

@end