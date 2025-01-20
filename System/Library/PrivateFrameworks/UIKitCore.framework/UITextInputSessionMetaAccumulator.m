@interface UITextInputSessionMetaAccumulator
@end

@implementation UITextInputSessionMetaAccumulator

void __71___UITextInputSessionMetaAccumulator_accumulatorWithName_accumulators___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v6 = *(void *)(*(void *)(a1[4] + 8) + 24);
  id v7 = a2;
  unint64_t v8 = [v7 depthRange];
  if (v6 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v6;
  }
  *(void *)(*(void *)(a1[4] + 8) + 24) = v9;
  unint64_t v10 = *(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v11 = [v7 depthRange];
  unint64_t v13 = v11 + v12;
  if (v10 > v11 + v12) {
    unint64_t v13 = v10;
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) = v13;
  uint64_t v14 = [v7 type];

  if (v14 != a1[7])
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __58___UITextInputSessionMetaAccumulator_increaseWithActions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  if ((unint64_t)[v11 depthRange] <= *(void *)(a1 + 56)
    && [v11 _increaseWithActions:*(void *)(a1 + 32)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v7 = *(void *)(a1 + 40);
    if (*(void *)(v7 + 128) + 1 == a3)
    {
      uint64_t v8 = [*(id *)(v7 + 120) count] - 1;
      unint64_t v9 = *(void **)(a1 + 40);
      if (v8 == a3)
      {
        unint64_t v10 = [*(id *)(a1 + 32) firstObject];
        objc_msgSend(v9, "_increaseWithCount:source:", 1, objc_msgSend(v10, "source"));

        *(void *)(*(void *)(a1 + 40) + 128) = a3;
      }
      else
      {
        ++v9[16];
      }
      *a4 = 1;
    }
    else
    {
      *(void *)(v7 + 128) = -1;
    }
  }
}

@end