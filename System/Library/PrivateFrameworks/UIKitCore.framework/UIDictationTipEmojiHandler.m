@interface UIDictationTipEmojiHandler
- (UIDictationTipEmojiHandler)init;
- (id)replaceEmojiInStringWithEmojiDictationCommand:(id)a3;
@end

@implementation UIDictationTipEmojiHandler

- (UIDictationTipEmojiHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIDictationTipEmojiHandler;
  return [(UIDictationTipEmojiHandler *)&v3 init];
}

- (id)replaceEmojiInStringWithEmojiDictationCommand:(id)a3
{
  id v3 = a3;
  if ([v3 _containsEmoji])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3010000000;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    v21 = &unk_186D7DBA7;
    uint64_t v5 = [v3 length];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__UIDictationTipEmojiHandler_replaceEmojiInStringWithEmojiDictationCommand___block_invoke;
    v14[3] = &unk_1E52E8130;
    v17 = &v18;
    id v6 = v4;
    id v15 = v6;
    id v7 = v3;
    id v16 = v7;
    objc_msgSend(v7, "_enumerateEmojiTokensInRange:block:", 0, v5, v14);
    uint64_t v8 = v19[4];
    uint64_t v9 = [v7 length];
    v10 = objc_msgSend(v7, "substringWithRange:", v8, v9 - v19[4]);
    [v6 appendString:v10];

    v11 = v16;
    id v12 = v6;

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    id v12 = v3;
  }

  return v12;
}

void __76__UIDictationTipEmojiHandler_replaceEmojiInStringWithEmojiDictationCommand___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32);
  uint64_t v9 = *(void **)(a1 + 32);
  v10 = objc_msgSend(*(id *)(a1 + 40), "substringWithRange:", v8, a3 - v8);
  [v9 appendString:v10];

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v11 + 32) = a3 + a4;
  *(void *)(v11 + 40) = 0;
  id v12 = off_1E52D4000;
  v13 = +[UIKeyboardInputModeController sharedInputModeController];
  v14 = [v13 currentInputMode];
  id v15 = [v14 dictationLanguage];
  if (v15)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    id v16 = (void *)_MergedGlobals_1005;
    uint64_t v41 = _MergedGlobals_1005;
    if (!_MergedGlobals_1005)
    {
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      v35 = __getEMFEmojiLocaleDataClass_block_invoke;
      v36 = &unk_1E52D9900;
      v37 = &v38;
      __getEMFEmojiLocaleDataClass_block_invoke((uint64_t)&v33);
      id v16 = (void *)v39[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v38, 8);
    uint64_t v18 = +[UIKeyboardInputModeController sharedInputModeController];
    v19 = [v18 currentInputMode];
    uint64_t v20 = [v19 dictationLanguage];
    v21 = [v17 emojiLocaleDataWithLocaleIdentifier:v20];

    id v12 = off_1E52D4000;
  }
  else
  {
    v21 = 0;
  }

  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2050000000;
  uint64_t v22 = (void *)qword_1EB25FFF8;
  uint64_t v41 = qword_1EB25FFF8;
  if (!qword_1EB25FFF8)
  {
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __getEMFEmojiTokenClass_block_invoke;
    v36 = &unk_1E52D9900;
    v37 = &v38;
    __getEMFEmojiTokenClass_block_invoke((uint64_t)&v33);
    uint64_t v22 = (void *)v39[3];
  }
  id v23 = v22;
  _Block_object_dispose(&v38, 8);
  v24 = [v7 string];
  v25 = [v23 emojiTokenWithString:v24 localeData:v21];

  v26 = [v25 nameForType:2];
  if (v26)
  {
    v27 = [(__objc2_class *)v12[14] sharedInputModeController];
    v28 = [v27 currentInputMode];
    v29 = [v28 dictationLanguage];
    v30 = _UILocalizedStringWithLocale(@"added emoji name", @"add in emoji word", @"%@ emoji", v29);

    v31 = objc_msgSend(NSString, "localizedStringWithFormat:", v30, v26);
    [*(id *)(a1 + 32) appendString:v31];
  }
  else
  {
    v32 = *(void **)(a1 + 32);
    v30 = [v25 string];
    [v32 appendString:v30];
  }
}

@end