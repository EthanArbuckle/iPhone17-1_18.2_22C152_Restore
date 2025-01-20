@interface UIFocusSwipeTest
@end

@implementation UIFocusSwipeTest

void __25___UIFocusSwipeTest_main__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    v5 = MEMORY[0x1E4F14428];
    do
    {
      if (v4) {
        double v6 = *(double *)(*(void *)(v2 + 56) + v3) - *(double *)(*(void *)(v2 + 56) + v3 - 48);
      }
      else {
        double v6 = 0.0;
      }
      usleep((v6 * 1000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __25___UIFocusSwipeTest_main__block_invoke_2;
      block[3] = &unk_1E52ED900;
      v7 = *(void **)(a1 + 40);
      block[4] = *(void *)(a1 + 32);
      unint64_t v17 = v4;
      id v15 = v7;
      id v16 = *(id *)(a1 + 48);
      dispatch_sync(v5, block);

      ++v4;
      uint64_t v2 = *(void *)(a1 + 32);
      v3 += 48;
    }
    while (v4 < *(void *)(v2 + 48));
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __25___UIFocusSwipeTest_main__block_invoke_3;
  v10[3] = &unk_1E52DCB30;
  id v11 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = v8;
  uint64_t v13 = v9;
  dispatch_sync(MEMORY[0x1E4F14428], v10);
}

uint64_t __25___UIFocusSwipeTest_main__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (double *)(*(void *)(*(void *)(a1 + 32) + 56) + 48 * *(void *)(a1 + 56));
  double v3 = v2[2];
  double v4 = v2[3];
  double v5 = v2[4];
  double v6 = v2[5];
  [*(id *)(a1 + 40) setState:*((void *)v2 + 1)];
  objc_msgSend(*(id *)(a1 + 40), "setDigitizerLocation:", v3, v4);
  objc_msgSend(*(id *)(a1 + 40), "setVelocity:", v5, v6);
  uint64_t v8 = *(void *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  return objc_msgSend(v7, "_uiktest_handlePanGesture:", v8);
}

uint64_t __25___UIFocusSwipeTest_main__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_uiktest_setPanGestureRecognizer:", *(void *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 48);
  return [v2 stop];
}

@end