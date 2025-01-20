@interface PXObservable(PXStory)
- (_PXStoryObservation)_pxStoryPPT_observeChangesUsingChangeHandler:()PXStory;
- (id)pxStory_enumerateStatesByWatchingChanges:()PXStory usingBlock:;
- (void)pxStory_enumerateStatesWithTimeout:()PXStory watchingChanges:usingBlock:timeoutHandler:;
@end

@implementation PXObservable(PXStory)

- (_PXStoryObservation)_pxStoryPPT_observeChangesUsingChangeHandler:()PXStory
{
  id v4 = a3;
  v5 = [[_PXStoryObservation alloc] initWithObservable:a1 changeHandler:v4];

  return v5;
}

- (id)pxStory_enumerateStatesByWatchingChanges:()PXStory usingBlock:
{
  v6 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  v25[0] = 0;
  v6[2](v6, a1, a3, v25);
  if (*((unsigned char *)v23 + 24))
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__173023;
    v20 = __Block_byref_object_dispose__173024;
    id v21 = 0;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__PXObservable_PXStory__pxStory_enumerateStatesByWatchingChanges_usingBlock___block_invoke;
    v11[3] = &unk_1E5DC1D08;
    v11[4] = a1;
    v13 = &v22;
    uint64_t v15 = a3;
    v12 = v6;
    v14 = &v16;
    uint64_t v8 = objc_msgSend(a1, "_pxStoryPPT_observeChangesUsingChangeHandler:", v11);
    v9 = (void *)v17[5];
    v17[5] = v8;

    id v7 = (id)v17[5];
    _Block_object_dispose(&v16, 8);
  }
  _Block_object_dispose(&v22, 8);

  return v7;
}

- (void)pxStory_enumerateStatesWithTimeout:()PXStory watchingChanges:usingBlock:timeoutHandler:
{
  id v10 = a5;
  id v11 = a6;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __102__PXObservable_PXStory__pxStory_enumerateStatesWithTimeout_watchingChanges_usingBlock_timeoutHandler___block_invoke;
  v21[3] = &unk_1E5DC1CE0;
  id v12 = v10;
  id v22 = v12;
  v23 = v24;
  v13 = objc_msgSend(a1, "pxStory_enumerateStatesByWatchingChanges:usingBlock:", a4, v21);
  if (v13)
  {
    if (objc_opt_respondsToSelector())
    {
      v14 = [a1 storyQueue];
    }
    else
    {
      v14 = MEMORY[0x1E4F14428];
      id v15 = MEMORY[0x1E4F14428];
    }
    dispatch_assert_queue_V2(v14);
    dispatch_time_t v16 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __102__PXObservable_PXStory__pxStory_enumerateStatesWithTimeout_watchingChanges_usingBlock_timeoutHandler___block_invoke_2;
    block[3] = &unk_1E5DCA938;
    id v18 = v13;
    id v19 = v11;
    v20 = v24;
    dispatch_after(v16, v14, block);
  }
  _Block_object_dispose(v24, 8);
}

@end