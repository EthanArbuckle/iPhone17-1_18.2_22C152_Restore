@interface UIFeedback
@end

@implementation UIFeedback

void __19___UIFeedback_play__block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    id v9 = [*(id *)(a1 + 32) _player];

    if (v9 != v7)
    {
      [*(id *)(a1 + 32) _setPlayer:v7];
      objc_initWeak((id *)location, *(id *)(a1 + 32));
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __19___UIFeedback_play__block_invoke_2;
      v19[3] = &unk_1E52DC308;
      objc_copyWeak(&v20, (id *)location);
      [v7 setInvalidationBlock:v19];
      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)location);
    }
    [*(id *)(a1 + 32) _playedAtTime:*(void *)(a1 + 40) engine:*(double *)(a1 + 48)];
  }
  else if (!_UIFeedbackLoggingDisabled)
  {
    v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_UISystemSoundIDNone_block_invoke___s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = NSString;
      id v12 = *(id *)(a1 + 32);
      v13 = v10;
      v14 = objc_msgSend(v11, "stringWithFormat:", @"<%s: %p>", object_getClassName(v12), v12);

      v15 = NSString;
      id v16 = *(id *)(a1 + 40);
      id v17 = v14;
      v18 = objc_msgSend(v15, "stringWithFormat:", @"<%s: %p>", object_getClassName(v16), v16);

      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = v8;
      __int16 v22 = 2112;
      v23 = v14;
      __int16 v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "%@ - can't play feedback %@ with engine %@, dropping it", location, 0x20u);
    }
  }
}

void __19___UIFeedback_play__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setPlayer:0];
}

uint64_t __19___UIFeedback_stop__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _stopFeedback:*(void *)(a1 + 32)];
}

void __26___UIFeedback_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 description];
  [v4 appendFormat:@"; %@: %@", v5, v6];
}

@end