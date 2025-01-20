@interface UIKBRTTouchHistory
@end

@implementation UIKBRTTouchHistory

uint64_t __31___UIKBRTTouchHistory_lastTime__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 ignoreForDrift]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 ignoreTouch] ^ 1;
  }

  return v3;
}

void __43___UIKBRTTouchHistory_adjustHistoryOffset___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([v5 ignoreForDrift] & 1) == 0
    && ([v5 ignoreTouch] & 1) == 0
    && ([v5 isActive] & 1) == 0)
  {
    [v5 errorVector];
    objc_msgSend(v5, "setErrorVector:", v3 - *(double *)(a1 + 32), v4 - *(double *)(a1 + 40));
  }
}

uint64_t __35___UIKBRTTouchHistory_clearHistory__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isActive] ^ 1;
}

uint64_t __35___UIKBRTTouchHistory__sortHistory__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isActive])
  {
    uint64_t v3 = 0;
  }
  else if ([v2 ignoreForDrift])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 ignoreTouch];
  }

  return v3;
}

uint64_t __35___UIKBRTTouchHistory__sortHistory__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isActive] && !objc_msgSend(v5, "isActive")) {
    goto LABEL_12;
  }
  if ([v4 isActive] & 1) == 0 && (objc_msgSend(v5, "isActive"))
  {
    uint64_t v6 = -1;
    goto LABEL_21;
  }
  if (![v4 isActive]) {
    goto LABEL_18;
  }
  if ([v4 ignoreTouch])
  {
    if (([v5 ignoreTouch] & 1) == 0)
    {
      int v7 = 0;
      goto LABEL_14;
    }
LABEL_18:
    [v4 touchTime];
    double v11 = v10;
    [v5 touchTime];
    double v13 = v11 - v12;
    if (v13 < 0.0) {
      uint64_t v6 = -1;
    }
    else {
      uint64_t v6 = v13 > 0.0;
    }
    goto LABEL_21;
  }
  int v8 = [v4 ignoreForDrift];
  if ([v5 ignoreTouch])
  {
    if (v8) {
      goto LABEL_18;
    }
LABEL_12:
    uint64_t v6 = 1;
    goto LABEL_21;
  }
  int v7 = v8 ^ 1;
LABEL_14:
  int v9 = [v5 ignoreForDrift];
  if (v7 | v9) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = -1;
  }
  if (v7 != v9) {
    goto LABEL_18;
  }
LABEL_21:

  return v6;
}

uint64_t __43___UIKBRTTouchHistory__decayHistoryToSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = a2;
  if (([v6 isActive] & 1) != 0
    || (double v7 = *(double *)(a1 + 40), [v6 touchTime], v7 - v8 < *(double *)(a1 + 48)))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void *)(v10 + 24) - 1;
    *(void *)(v10 + 24) = v11;
    *a4 = v11 == 0;
    uint64_t v9 = 1;
  }

  return v9;
}

BOOL __43___UIKBRTTouchHistory__decayHistoryToSize___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v6 = 0;
  if (([v3 isActive] & 1) == 0)
  {
    double v4 = *(double *)(a1 + 32);
    [v3 touchTime];
    if (v4 - v5 >= *(double *)(a1 + 40)) {
      BOOL v6 = 1;
    }
  }

  return v6;
}

double __36___UIKBRTTouchHistory__updateOffset__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 errorVector];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v4
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 32);
  [v3 errorVector];
  double v6 = v5;

  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v6 + *(double *)(v7 + 40);
  *(double *)(v7 + 40) = result;
  return result;
}

void __36___UIKBRTTouchHistory__updateOffset__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v8 = a2;
  if (([v8 ignoreForDrift] & 1) == 0 && (objc_msgSend(v8, "ignoreTouch") & 1) == 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    int v7 = *(_DWORD *)(v6 + 24);
    *(_DWORD *)(v6 + 24) = v7 + 1;
    *a4 = v7 > 8;
  }
}

@end