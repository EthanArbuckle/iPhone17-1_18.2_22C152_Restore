@interface LTServerSpeakSession
@end

@implementation LTServerSpeakSession

uint64_t __72___LTServerSpeakSession__playback_context_completion_audioStartHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, double))(result + 16))(result, *(void *)(a1 + 32), *(double *)(a1 + 48));
  }
  return result;
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 72);
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 72));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([(os_unfair_lock_s *)WeakRetained _hasCachedCompletion])
    {
      v5 = _LTOSLogTTS();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_cold_2();
      }
      [(os_unfair_lock_s *)v4 _callCompletionAndClearIfNeeded:0 error:0];
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_8;
    v15[3] = &unk_265546F80;
    v15[4] = v4;
    id v16 = *(id *)(a1 + 56);
    os_unfair_lock_lock(v4 + 10);
    __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_8((uint64_t)v15);
    os_unfair_lock_unlock(v4 + 10);
    v6 = _LTOSLogTTS();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_cold_1();
    }
    v7 = *(void **)&v4[2]._os_unfair_lock_opaque;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_9;
    v10[3] = &unk_265547F38;
    id v11 = *(id *)(a1 + 48);
    objc_copyWeak(&v14, v2);
    id v12 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 64);
    [v7 speak:v8 withContext:v9 completion:v10];

    objc_destroyWeak(&v14);
  }
}

uint64_t __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_8(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48) = MEMORY[0x26120C050](*(void *)(a1 + 40));
  return MEMORY[0x270F9A758]();
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_9(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = a1[4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2;
  v10[3] = &unk_265547F10;
  objc_copyWeak(&v16, a1 + 7);
  id v11 = v6;
  id v12 = v5;
  id v13 = a1[5];
  id v14 = a1[4];
  id v15 = a1[6];
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v16);
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    v4 = (void *)(a1 + 32);
    if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
    {
      id v5 = _LTOSLogTTS();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
      }
      [WeakRetained _callCompletionAndClearIfNeeded:0 error:*v4];
    }
    else
    {
      id v12 = _LTOSLogTTS();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2_cold_2();
      }
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_10;
      v15[3] = &unk_265547EE8;
      id v16 = *(id *)(a1 + 56);
      objc_copyWeak(&v17, v2);
      [WeakRetained _playback:v13 context:v14 completion:v15 audioStartHandler:*(void *)(a1 + 64)];
      objc_destroyWeak(&v17);
    }
  }
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2_11;
  block[3] = &unk_2655470C0;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = _LTOSLogTTS();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "Finished speaking", v4, 2u);
    }
    [WeakRetained _callCompletionAndClearIfNeeded:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  }
}

uint64_t __45___LTServerSpeakSession__hasCachedCompletion__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 48) != 0;
  return result;
}

void __63___LTServerSpeakSession__callCompletionAndClearIfNeeded_error___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    uint64_t v2 = MEMORY[0x26120C050]();
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = 0;
  }
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Asking engine to generate audio data for TTS request", v2, v3, v4, v5, v6);
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2600DC000, v0, OS_LOG_TYPE_ERROR, "Speak session already has cached completion handler, but now asked to speak a new one", v1, 2u);
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Engine has generated audio data, prepping playback", v2, v3, v4, v5, v6);
}

@end