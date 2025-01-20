@interface TIKeyboardInputManagerPolymorph
- (void)dealloc;
- (void)handleKeyboardInput:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5;
- (void)handleKeyboardState:(id)a3 withInputEvent:(id)a4;
- (void)setInputManagerForInputMode:(id)a3 withKeyboardState:(id)a4 class:(Class)a5;
- (void)setInputManagerForKeyboardState:(id)a3 withInputEvent:(id)a4;
- (void)skipHitTestForTouchEvent:(id)a3 keyboardState:(id)a4;
- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4;
@end

@implementation TIKeyboardInputManagerPolymorph

- (void)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__TIKeyboardInputManagerPolymorph_syncToKeyboardState_completionHandler___block_invoke;
  v9[3] = &unk_1E6E29C28;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerPolymorph;
  id v7 = v6;
  [(TIKeyboardInputManagerWrapper *)&v8 syncToKeyboardState:a3 completionHandler:v9];
}

void __73__TIKeyboardInputManagerPolymorph_syncToKeyboardState_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v1 = +[TITypingAssertion sharedTypingAssertion];
  [v1 touchWithReason:0];
}

- (void)skipHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  kac_get_log();
  objc_super v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (const void *)((unint64_t)self ^ 0x66);
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v8, (const void *)((unint64_t)self ^ 0x66));
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v11, "kbdManager.polymorph.skipHitTest", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  uint64_t v12 = [v6 pathIndex];
  if (v6
    && (uint64_t v13 = v12,
        [v7 layoutState],
        v14 = objc_claimAutoreleasedReturnValue(),
        uint64_t v15 = [v14 userInterfaceIdiom],
        v14,
        v15 == 1))
  {
    int v16 = [v6 stage];
    if (v16 != 5)
    {
      if (v16 == 4)
      {
        v17 = +[TITypingAssertion sharedTypingAssertion];
        [v17 restTouchStartWithPathIndex:v13];
      }
      else
      {
        v24.receiver = self;
        v24.super_class = (Class)TIKeyboardInputManagerPolymorph;
        [(TIKeyboardInputManagerWrapper *)&v24 skipHitTestForTouchEvent:v6 keyboardState:v7];
      }
    }
    int v19 = [v6 stage];
    if (v19 == 5 || !v19)
    {
      v20 = +[TITypingAssertion sharedTypingAssertion];
      [v20 restTouchEndWithPathIndex:v13];
    }
  }
  else
  {
    v18 = +[TITypingAssertion sharedTypingAssertion];
    [v18 restResetTouches];

    v24.receiver = self;
    v24.super_class = (Class)TIKeyboardInputManagerPolymorph;
    [(TIKeyboardInputManagerWrapper *)&v24 skipHitTestForTouchEvent:v6 keyboardState:v7];
  }
  kdebug_trace();
  kac_get_log();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, v9);
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v23 = v22;
    if (os_signpost_enabled(v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v21, OS_SIGNPOST_INTERVAL_END, v23, "kbdManager.polymorph.skipHitTest", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }
}

- (void)handleKeyboardInput:(id)a3 keyboardState:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = (const void *)((unint64_t)self ^ 0x64);
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v11, (const void *)((unint64_t)self ^ 0x64));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v14, "kbdManager.polymorph.keyboardInput", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  uint64_t v15 = [v8 touchEvent];
  uint64_t v16 = [v15 pathIndex];

  uint64_t v17 = [v8 touchEvent];
  if (v17
    && (v18 = (void *)v17,
        [v9 layoutState],
        int v19 = objc_claimAutoreleasedReturnValue(),
        uint64_t v20 = [v19 userInterfaceIdiom],
        v19,
        v18,
        v20 == 1))
  {
    v21 = [v8 touchEvent];
    int v22 = [v21 stage];

    if (v22 == 5)
    {
LABEL_15:
      v28 = [v8 touchEvent];
      int v29 = [v28 stage];

      if (v29 == 5 || !v29)
      {
        v30 = +[TITypingAssertion sharedTypingAssertion];
        [v30 restTouchEndWithPathIndex:v16];
      }
      goto LABEL_18;
    }
    if (v22 != 4)
    {
      int v24 = 1;
      goto LABEL_11;
    }
    os_signpost_id_t v23 = +[TITypingAssertion sharedTypingAssertion];
    [v23 restTouchStartWithPathIndex:v16];
    int v24 = 1;
  }
  else
  {
    os_signpost_id_t v23 = +[TITypingAssertion sharedTypingAssertion];
    [v23 restResetTouches];
    int v24 = 0;
  }

LABEL_11:
  kdebug_trace();
  kac_get_log();
  v25 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v26 = os_signpost_id_make_with_pointer(v25, (const void *)((unint64_t)self ^ 0x65));
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v27 = v26;
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v27, "kbdManager.polymorph.keyboardInput.super", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __87__TIKeyboardInputManagerPolymorph_handleKeyboardInput_keyboardState_completionHandler___block_invoke;
  v35[3] = &unk_1E6E29C00;
  v35[4] = self;
  id v36 = v10;
  v34.receiver = self;
  v34.super_class = (Class)TIKeyboardInputManagerPolymorph;
  [(TIKeyboardInputManagerWrapper *)&v34 handleKeyboardInput:v8 keyboardState:v9 completionHandler:v35];

  if (v24) {
    goto LABEL_15;
  }
LABEL_18:
  kdebug_trace();
  kac_get_log();
  v31 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v32 = os_signpost_id_make_with_pointer(v31, v12);
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v33 = v32;
    if (os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v31, OS_SIGNPOST_INTERVAL_END, v33, "kbdManager.polymorph.keyboardInput", (const char *)&unk_1E41704BE, buf, 2u);
    }
  }
}

void __87__TIKeyboardInputManagerPolymorph_handleKeyboardInput_keyboardState_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, id, id))(v5 + 16);
  id v7 = a3;
  id v8 = a2;
  v6(v5, v8, v7);
  id v9 = +[TITypingAssertion sharedTypingAssertion];
  [v9 touchWithReason:1];

  kdebug_trace();
  kac_get_log();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, (const void *)(*(void *)(a1 + 32) ^ 0x65));

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v10, OS_SIGNPOST_INTERVAL_END, v11, "kbdManager.polymorph.keyboardInput.super", (const char *)&unk_1E41704BE, v12, 2u);
  }
}

- (void)setInputManagerForInputMode:(id)a3 withKeyboardState:(id)a4 class:(Class)a5
{
  id v26 = a3;
  id v8 = a4;
  id v9 = +[TIKeyboardInputManagerLoader sharedLoader];
  id v10 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  if ([v9 isActiveInputManager:v10])
  {
    os_signpost_id_t v11 = [(TIKeyboardInputManagerWrapper *)self inputManager];
    if ([v11 isMemberOfClass:a5])
    {
      uint64_t v12 = [(TIKeyboardInputManagerWrapper *)self inputManager];
      os_signpost_id_t v13 = [v12 inputMode];
      char v14 = [v13 isEqual:v26];

      if (v14) {
        goto LABEL_12;
      }
      goto LABEL_7;
    }
  }
LABEL_7:
  uint64_t v15 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v9 cacheInputManager:v15 switchingToInputMode:v26];

  uint64_t v16 = [v9 inputManagerForInputMode:v26 withKeyboardState:v8 class:a5];
  [(TIKeyboardInputManagerWrapper *)self setInputManager:v16];

  uint64_t v17 = [(TIKeyboardInputManagerWrapper *)self cachedContextChangeTrigger];

  if (v17)
  {
    v18 = [(TIKeyboardInputManagerWrapper *)self inputManager];
    int v19 = [(TIKeyboardInputManagerWrapper *)self cachedContextChangeTrigger];
    [v18 changingContextWithTrigger:v19];

    [(TIKeyboardInputManagerWrapper *)self setCachedContextChangeTrigger:0];
  }
  uint64_t v20 = objc_alloc_init(TITypologyPreferences);
  if (_typologyProfileOptInManager_onceToken != -1) {
    dispatch_once(&_typologyProfileOptInManager_onceToken, &__block_literal_global_2307);
  }
  [(TITypologyPreferences *)v20 setTypologyProfileOptInManager:_typologyProfileOptInManager_optInManager];
  v21 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v21 setTypologyPreferences:v20];

  int v22 = [[TIKeyboardInputManagerLogger alloc] initWithTypologyPreferences:v20];
  os_signpost_id_t v23 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  [v23 setInputManagerLogger:v22];

  int v24 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  v25 = [v24 configurationPropertyList];
  [(TIKeyboardInputManagerLogger *)v22 setConfig:v25];

LABEL_12:
}

- (void)setInputManagerForKeyboardState:(id)a3 withInputEvent:(id)a4
{
  id v24 = a3;
  uint64_t v5 = [v24 inputMode];
  id v6 = [v24 clientIdentifier];
  id v7 = [v24 inputMode];
  id v8 = +[TIInputMode inputModeWithIdentifier:v5 isSiriMode:TIISTypetoSiriMode()];

  if (_os_feature_enabled_impl()
    && ([MEMORY[0x1E4FAE3D8] sharedPreferencesController],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 BOOLForPreferenceKey:*MEMORY[0x1E4FAE8D0]],
        v9,
        v10)
    && ([v8 isSiriMode] & 1) == 0)
  {
    uint64_t v11 = [v8 multilingualInputManagerClass];
  }
  else
  {
    uint64_t v11 = [v8 inputManagerClass];
  }
  uint64_t v12 = v11;
  if ([v24 hardwareKeyboardMode])
  {
    os_signpost_id_t v13 = [v8 languageWithRegion];
    int v14 = [v13 isEqualToString:@"ja_JP"];

    if (v14)
    {
      uint64_t v15 = [v24 inputMode];
      uint64_t v16 = TIInputModeGetComponentsFromIdentifier();
      uint64_t v17 = [v16 objectForKey:@"hw"];
      int v18 = [v17 isEqualToString:@"KANA"];

      if (v18) {
        int v19 = @"ja_JP-Kana";
      }
      else {
        int v19 = @"ja_JP-Romaji";
      }
      uint64_t v20 = +[TIInputMode inputModeWithIdentifier:v19];

      uint64_t v12 = [v20 inputManagerClass];
      id v8 = v20;
    }
  }
  v21 = [v8 languageWithRegion];
  int v22 = [v21 hasPrefix:@"ars"];

  if (v22)
  {
    uint64_t v23 = +[TIInputMode inputModeWithIdentifier:@"ar"];

    id v8 = (void *)v23;
  }
  [(TIKeyboardInputManagerPolymorph *)self setInputManagerForInputMode:v8 withKeyboardState:v24 class:v12];
}

- (void)handleKeyboardState:(id)a3 withInputEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerPolymorph;
  id v6 = a4;
  id v7 = a3;
  [(TIKeyboardInputManagerWrapper *)&v8 handleKeyboardState:v7 withInputEvent:v6];
  -[TIKeyboardInputManagerPolymorph setInputManagerForKeyboardState:withInputEvent:](self, "setInputManagerForKeyboardState:withInputEvent:", v7, v6, v8.receiver, v8.super_class);
}

- (void)dealloc
{
  v3 = [(TIKeyboardInputManagerWrapper *)self inputManager];
  v4 = [v3 inputMode];

  if (v4)
  {
    uint64_t v5 = [(TIKeyboardInputManagerWrapper *)self inputManager];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    int v10 = __42__TIKeyboardInputManagerPolymorph_dealloc__block_invoke;
    uint64_t v11 = &unk_1E6E2DE00;
    id v12 = v5;
    id v6 = v5;
    TIDispatchAsync();
  }
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerPolymorph;
  [(TIKeyboardInputManagerPolymorph *)&v7 dealloc];
}

void __42__TIKeyboardInputManagerPolymorph_dealloc__block_invoke(uint64_t a1)
{
  id v2 = +[TIKeyboardInputManagerLoader sharedLoader];
  [v2 cacheInputManager:*(void *)(a1 + 32) switchingToInputMode:0];
}

@end