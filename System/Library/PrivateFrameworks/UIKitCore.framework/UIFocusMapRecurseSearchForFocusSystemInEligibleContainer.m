@interface UIFocusMapRecurseSearchForFocusSystemInEligibleContainer
@end

@implementation UIFocusMapRecurseSearchForFocusSystemInEligibleContainer

void ____UIFocusMapRecurseSearchForFocusSystemInEligibleContainer_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  v6 = v8;
  if (*(id *)(a1 + 32) != v8)
  {
    if (*(id *)(a1 + 40) == v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      *a3 = 1;
      goto LABEL_14;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      int v7 = [*(id *)(a1 + 48) containsObject:v8];
      v6 = v8;
      if (v7)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
        goto LABEL_14;
      }
    }
    if ([*(id *)(a1 + 56) containsObject:v6])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = _UIFocusEnvironmentIsEligibleForFocusOcclusion(v8, 0);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
      {
        [*(id *)(a1 + 48) addObject:v8];
LABEL_13:
        v6 = v8;
        goto LABEL_14;
      }
      [*(id *)(a1 + 56) addObject:v8];
    }
    *a3 = 1;
    goto LABEL_13;
  }
LABEL_14:
}

@end