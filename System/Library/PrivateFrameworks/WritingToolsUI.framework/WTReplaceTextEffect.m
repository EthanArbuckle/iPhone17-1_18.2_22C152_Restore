@interface WTReplaceTextEffect
@end

@implementation WTReplaceTextEffect

void __35___WTReplaceTextEffect_invalidate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rootLayer];
  [v2 removeFromSuperlayer];

  if (!*(unsigned char *)(a1 + 40))
  {
    v3 = [*(id *)(a1 + 32) completion];

    if (v3)
    {
      v4 = [*(id *)(a1 + 32) completion];
      v4[2]();
    }
  }
}

void __41___WTReplaceTextEffect_updateEffectWith___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 candidateRects];
  if ([v7 count])
  {
    int v6 = [*(id *)(a1 + 32) isDestination];

    if (v6)
    {
      [*(id *)(a1 + 32) setHighlightsCandidateRects:1];
      *a4 = 1;
    }
  }
  else
  {
  }
}

void __41___WTReplaceTextEffect_updateEffectWith___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) effectView];
  v2 = [*(id *)(a1 + 32) identifier];
  id v3 = (id)objc_msgSend(v4, "removeEffect:animated:", v2, objc_msgSend(*(id *)(a1 + 32), "animateRemovalWhenDone"));
}

uint64_t __31___WTReplaceTextEffect_update___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _alignFrames];
}

@end