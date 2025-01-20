@interface UITextChoiceAccelerationBubble
@end

@implementation UITextChoiceAccelerationBubble

uint64_t __56___UITextChoiceAccelerationBubble_updateViewForOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) candidate];
  v5 = [v4 input];
  char v6 = [v5 isEqualToString:v3];

  if (v6)
  {
    uint64_t v7 = 1;
  }
  else
  {
    v8 = [*(id *)(a1 + 32) replacement];
    v9 = [v8 revertText];
    char v10 = [v9 isEqualToString:v3];

    if (v10)
    {
      uint64_t v7 = 1;
    }
    else
    {
      v11 = [v8 alternativeRevertTexts];
      uint64_t v7 = [v11 containsObject:v3];
    }
  }

  return v7;
}

uint64_t __50___UITextChoiceAccelerationBubble_removeAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __50___UITextChoiceAccelerationBubble_removeAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) reset];
  *(unsigned char *)(*(void *)(a1 + 32) + 458) = 0;
  return result;
}

@end