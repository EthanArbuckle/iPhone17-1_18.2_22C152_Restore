@interface LTCombinedEngine
@end

@implementation LTCombinedEngine

void __50___LTCombinedEngine_speak_withContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = _LTOSLogTTS();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __50___LTCombinedEngine_speak_withContext_completion___block_invoke_cold_1((uint64_t)v6, v8);
      }
      [WeakRetained[3] speak:*(void *)(a1 + 32) withContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

uint64_t __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_6(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!a4)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_2;
    v10[3] = &unk_265545FD0;
    uint64_t v16 = *(void *)(a1 + 64);
    v9 = *(NSObject **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v12 = v8;
    id v15 = *(id *)(a1 + 56);
    id v13 = v7;
    id v14 = *(id *)(a1 + 48);
    dispatch_async(v9, v10);
  }
}

void __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  if (*(void *)(*(void *)(a1[9] + 8) + 40))
  {
    v3 = (void *)a1[4];
    v4 = [(id)a1[5] identifier];
    [v3 removeObject:v4];

    id v5 = *(void (**)(void))(a1[8] + 16);
    v5();
  }
  else
  {
    id v6 = (void *)a1[7];
    id v7 = [(id)a1[5] identifier];
    [v6 setObject:v2 forKey:v7];
  }
}

void __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_5;
  block[3] = &unk_265546048;
  id v16 = v9;
  v10 = *(NSObject **)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  id v18 = v8;
  id v11 = *(id *)(a1 + 48);
  id v19 = v7;
  id v20 = v11;
  id v12 = v7;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v10, block);
}

uint64_t __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_5(uint64_t result)
{
  if (!*(void *)(result + 32))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void **)(result + 40);
    v3 = [*(id *)(result + 48) identifier];
    [v2 removeObject:v3];

    id v4 = *(uint64_t (**)(void))(*(void *)(v1 + 64) + 16);
    return v4();
  }
  return result;
}

void __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_6(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __70___LTCombinedEngine_translate_withContext_paragraphResult_completion___block_invoke_7(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_5:
    return v2();
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        if (v9) {
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __62___LTCombinedEngine_translateSentence_withContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __62___LTCombinedEngine_translateSentence_withContext_completion___block_invoke_2(void *a1, uint64_t a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    (*(void (**)(void))(a1[5] + 16))();
  }
  id v4 = a1[4];
  dispatch_group_leave(v4);
}

void *__62___LTCombinedEngine_translateSentence_withContext_completion___block_invoke_3(void *result)
{
  if (!*(unsigned char *)(*(void *)(result[5] + 8) + 24))
  {
    uint64_t v1 = *(void *)(*(void *)(result[6] + 8) + 40);
    uint64_t v2 = result[4];
    if (v1) {
      return (void *)(*(uint64_t (**)(void, uint64_t, void))(v2 + 16))(result[4], v1, 0);
    }
    else {
      return (void *)(*(uint64_t (**)(void, void, void))(v2 + 16))(result[4], 0, *(void *)(*(void *)(result[7] + 8) + 40));
    }
  }
  return result;
}

void __50___LTCombinedEngine_speak_withContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2600DC000, a2, OS_LOG_TYPE_ERROR, "Failed online TTS, will fallback to offline: %@", (uint8_t *)&v2, 0xCu);
}

@end