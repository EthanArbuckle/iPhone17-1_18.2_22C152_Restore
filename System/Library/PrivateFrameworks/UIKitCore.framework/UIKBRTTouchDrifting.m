@interface UIKBRTTouchDrifting
@end

@implementation UIKBRTTouchDrifting

void __28___UIKBRTTouchDrifting_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained leftDriftLockTouchIDs];
  [v1 removeAllObjects];
}

void __28___UIKBRTTouchDrifting_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained rightDriftLockTouchIDs];
  [v1 removeAllObjects];
}

uint64_t __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_2;
  v4[3] = &unk_1E52FDE40;
  v4[4] = *(void *)(a1 + 32);
  return [a3 enumerateObjectsUsingBlock:v4];
}

uint64_t __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 touchTime];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

uint64_t __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_4;
  v4[3] = &unk_1E52FDE40;
  v4[4] = *(void *)(a1 + 32);
  return [a3 enumerateObjectsUsingBlock:v4];
}

uint64_t __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_4(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 touchTime];
  if (v3 >= v5) {
    double v5 = v3;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

BOOL __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 indexOfObjectPassingTest:&__block_literal_global_46_3] != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isActive] && (objc_msgSend(v2, "ignoreForDrift") & 1) == 0) {
    uint64_t v3 = [v2 ignoreTouch] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

BOOL __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 indexOfObjectPassingTest:&__block_literal_global_50_2] != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isActive] && (objc_msgSend(v2, "ignoreForDrift") & 1) == 0) {
    uint64_t v3 = [v2 ignoreTouch] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_51(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_2_52;
  v9[3] = &unk_1E52FDED0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  [a3 enumerateObjectsUsingBlock:v9];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

void __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_2_52(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(id *)(a1 + 32) == v7)
  {
    id v8 = v7;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v7 = v8;
    *a4 = 1;
  }
}

void __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_3_53(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_4_54;
  v9[3] = &unk_1E52FDED0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  [a3 enumerateObjectsUsingBlock:v9];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

void __50___UIKBRTTouchDrifting__updateDriftWithTouchInfo___block_invoke_4_54(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(id *)(a1 + 32) == v7)
  {
    id v8 = v7;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v7 = v8;
    *a4 = 1;
  }
}

uint64_t __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke_2;
  v4[3] = &unk_1E52FDF20;
  long long v5 = *(_OWORD *)(a1 + 32);
  return [a3 enumerateObjectsUsingBlock:v4];
}

void __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isActive]
    && ([v3 ignoreForDrift] & 1) == 0
    && ([v3 ignoreTouch] & 1) == 0)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (!*(unsigned char *)(a1 + 56) && *(void *)(a1 + 48) != (int)[a2 intValue] && objc_msgSend(v5, "count"))
  {
    v6 = *(void **)(a1 + 32);
    id v7 = [v5 firstObject];
    id v8 = [v7 touchIdentifier];
    [v6 addObject:v8];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke_4;
  v9[3] = &unk_1E52FDE40;
  void v9[4] = *(void *)(a1 + 40);
  [v5 enumerateObjectsUsingBlock:v9];
}

uint64_t __68___UIKBRTTouchDrifting__updateDriftForFingers_leftHand_newestTouch___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result = [a2 setIgnoreTouch:0];
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __40___UIKBRTTouchDrifting__updateDriftView__block_invoke()
{
  id v5 = +[UIDevice currentDevice];
  v0 = +[UIScreen mainScreen];
  if ([v5 userInterfaceIdiom] != 1
    || (([v0 bounds], double v2 = v1, objc_msgSend(v0, "bounds"), v2 >= v3) ? (v4 = v2) : (v4 = v3), v4 <= 1024.0))
  {
    qword_1EB256CF0 = 0x400000005;
    dword_1EB256CF8 = 4;
    _MergedGlobals_11 = 0x4014000000000000;
  }
}

void __40___UIKBRTTouchDrifting__updateDriftView__block_invoke_2(uint64_t a1, void *a2)
{
  id v26 = a2;
  int v3 = [v26 isLeftHand];
  double v4 = *(void **)(a1 + 32);
  if (v3) {
    [v4 fCenter];
  }
  else {
    [v4 jCenter];
  }
  double v7 = v5;
  double v8 = v6;
  int v9 = [v26 isLeftHand];
  uint64_t v10 = 9;
  if (v9) {
    uint64_t v10 = 6;
  }
  id v11 = *(id *)(*(void *)(a1 + 32) + OBJC_IVAR____UIKBRTTouchDrifting__touches[v10]);
  v12 = [*(id *)(*(void *)(a1 + 32) + 264) objectForKey:v26];
  if (!v12)
  {
    v13 = [_UIKBRTTouchDrifingFingerCircleView alloc];
    v12 = -[_UIKBRTTouchDrifingFingerCircleView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v14 = +[UIColor orangeColor];
    [(UIView *)v12 setBackgroundColor:v14];

    [*(id *)(*(void *)(a1 + 32) + 264) setObject:v12 forKey:v26];
    [*(id *)(*(void *)(a1 + 32) + 256) addSubview:v12];
  }
  v15 = *(void **)(a1 + 32);
  [v26 historyOffset];
  objc_msgSend(v15, "_pointFromPoint:plusOffset:", v7, v8, v16, v17);
  double v19 = v18;
  double v21 = v20;
  [v11 offset];
  objc_msgSend(v15, "_pointFromPoint:plusOffset:", v19, v21, v22, v23);
  -[_UIKBRTTouchDrifingFingerCircleView setFrame:](v12, "setFrame:", v24 + -5.0, v25 + -5.0, 11.0, 11.0);
}

@end