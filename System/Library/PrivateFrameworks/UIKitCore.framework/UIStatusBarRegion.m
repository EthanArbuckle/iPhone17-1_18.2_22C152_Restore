@interface UIStatusBarRegion
@end

@implementation UIStatusBarRegion

void __38___UIStatusBarRegion_setDisplayItems___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  char v3 = [*(id *)(a1 + 32) containsObject:v8];
  v4 = v8;
  if ((v3 & 1) == 0)
  {
    v5 = [v8 region];
    v6 = v5;
    if (v5 == *(void **)(a1 + 40))
    {
      char v7 = [v8 floating];

      v4 = v8;
      if (v7) {
        goto LABEL_7;
      }
      [v8 setContainerView:0];
      [v8 setRegion:0];
    }
    else
    {
    }
    v4 = v8;
  }
LABEL_7:
}

void __38___UIStatusBarRegion_setDisplayItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setContainerView:v3];
  [v4 setRegion:*(void *)(a1 + 40)];
}

uint64_t __41___UIStatusBarRegion_enabledDisplayItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEnabled]) {
    uint64_t v3 = [v2 floating] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

BOOL __48___UIStatusBarRegion_currentEnabledDisplayItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEnabled] && (objc_msgSend(v3, "floating") & 1) == 0)
  {
    v5 = [v3 region];
    BOOL v4 = v5 == *(void **)(a1 + 32);
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void __47___UIStatusBarRegion_displayItemAbsoluteFrames__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 view];
  BOOL v4 = [v3 window];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F29238];
    [v9 absoluteFrame];
    v6 = objc_msgSend(v5, "valueWithCGRect:");
    char v7 = *(void **)(a1 + 32);
    id v8 = [v9 identifier];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

@end