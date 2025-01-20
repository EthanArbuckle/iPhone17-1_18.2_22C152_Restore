@interface UIPageCurl
@end

@implementation UIPageCurl

uint64_t __101___UIPageCurl__enqueueCurlOfType_fromLocation_inDirection_withView_revealingView_completion_finally___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginCurlWithState:*(void *)(a1 + 40) previousState:*(void *)(a1 + 48)];
}

void __51___UIPageCurl__pageCurlAnimationDidStop_withState___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void *)(v9 + 40);
  id v11 = v8;
  v12 = v11;
  if (a3 || v10)
  {
    uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) curlType];
    uint64_t v15 = [v12 curlType];
    v13 = v12;
    if (v14 == v15)
    {
      uint64_t v16 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) effectiveTransitionDirection];
      uint64_t v17 = [v12 effectiveTransitionDirection];
      v13 = v12;
      if (v16 == v17)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
        v13 = v12;
      }
    }
  }
  else
  {
    v13 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v11;
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v18 = (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "_ui_dequeue");
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "_ui_enqueue:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    if (a3)
    {
      v19 = [*(id *)(a1 + 40) objectAtIndex:a3 - 1];
      double v20 = *(double *)(*(void *)(a1 + 32) + 88);
      v21 = [v19 beginDate];
      [v21 timeIntervalSinceNow];
      double v23 = v20 + v22;

      double v24 = v23 * 1000000000.0;
      if (v23 <= 0.0) {
        double v24 = 0.0;
      }
      dispatch_time_t v25 = dispatch_time(0, (uint64_t)v24);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51___UIPageCurl__pageCurlAnimationDidStop_withState___block_invoke_2;
      block[3] = &unk_1E52E5E48;
      uint64_t v26 = *(void *)(a1 + 32);
      uint64_t v27 = *(void *)(a1 + 48);
      id v32 = v19;
      uint64_t v33 = v27;
      block[4] = v26;
      id v28 = v19;
      dispatch_after(v25, MEMORY[0x1E4F14428], block);
    }
    else
    {
      [*(id *)(a1 + 32) _beginCurlWithState:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) previousState:0];
    }
    uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
    v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = 0;
  }
  else
  {
    *a4 = 1;
  }
}

uint64_t __51___UIPageCurl__pageCurlAnimationDidStop_withState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginCurlWithState:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) previousState:*(void *)(a1 + 40)];
}

@end