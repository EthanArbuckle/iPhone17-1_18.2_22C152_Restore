@interface TTSEmojiUtilities
+ (_NSRange)emojiRangeFromString:(id)a3 withSearchRange:(_NSRange)a4;
+ (id)stringByRemovingEmojiCharacters:(id)a3;
+ (id)stringByReplacingEmojiCharactersWithEmojiDescriptions:(id)a3 stringForPauses:(id)a4 language:(id)a5 rangeReplacements:(id)a6 appendEmojiSuffix:(BOOL)a7;
+ (void)_initializeEmojiStructures:(id)a3;
+ (void)enumerateEmojiCharactersInString:(id)a3 languageCode:(id)a4 withBlock:(id)a5;
@end

@implementation TTSEmojiUtilities

+ (_NSRange)emojiRangeFromString:(id)a3 withSearchRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3010000000;
  v22 = &unk_1A68F25BB;
  long long v23 = xmmword_1A689D6B0;
  v9 = objc_msgSend_substringWithRange_(v6, v7, location, length, v8);
  objc_msgSend_length(v9, v10, v11, v12, v13);
  CEMEnumerateEmojiTokensInStringWithBlock();
  uint64_t v14 = v20[4];
  NSUInteger v15 = v20[5];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v16 = v14 + location;
  }

  _Block_object_dispose(&v19, 8);
  NSUInteger v17 = v16;
  NSUInteger v18 = v15;
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

+ (void)_initializeEmojiStructures:(id)a3
{
  id v3 = a3;
  uint64_t v8 = v3;
  if (qword_1EB67A510 != -1)
  {
    dispatch_once(&qword_1EB67A510, &unk_1EFB80300);
    if (v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (!v3)
  {
LABEL_3:
    v9 = objc_msgSend_currentLanguageCode(TTSSpeechManager, v4, v5, v6, v7);
    uint64_t v8 = AXCRemapLanguageCodeToFallbackIfNeccessary();
  }
LABEL_4:
  v10 = qword_1EB67A518;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A66FCA70;
  block[3] = &unk_1E5C69588;
  id v13 = v8;
  id v11 = v8;
  dispatch_sync(v10, block);
}

+ (id)stringByRemovingEmojiCharacters:(id)a3
{
  id v4 = a3;
  objc_msgSend__initializeEmojiStructures_(a1, v5, 0, v6, v7);
  uint64_t v12 = objc_msgSend_mutableCopy(v4, v8, v9, v10, v11);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A66FCCB0;
  block[3] = &unk_1E5C696C8;
  void block[4] = &v22;
  dispatch_sync((dispatch_queue_t)qword_1EB67A518, block);
  id v13 = (void *)MEMORY[0x1AD0C1200]();
  objc_msgSend_length(v4, v14, v15, v16, v17);
  id v18 = v12;
  CEMEnumerateEmojiTokensInStringWithLocaleAndBlock();
  uint64_t v19 = (const void *)v23[3];
  if (v19)
  {
    CFRelease(v19);
    v23[3] = 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);

  return v18;
}

+ (void)enumerateEmojiCharactersInString:(id)a3 languageCode:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v13 = a5;
  if (v8)
  {
    objc_msgSend__initializeEmojiStructures_(a1, v10, (uint64_t)v9, v11, v12);
    uint64_t v21 = 0;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A66FCEE4;
    block[3] = &unk_1E5C696C8;
    void block[4] = &v21;
    dispatch_sync((dispatch_queue_t)qword_1EB67A518, block);
    objc_msgSend_length(v8, v14, v15, v16, v17);
    id v19 = v13;
    CEMEnumerateEmojiTokensInStringWithLocaleAndBlock();
    id v18 = (const void *)v22[3];
    if (v18)
    {
      CFRelease(v18);
      v22[3] = 0;
    }

    _Block_object_dispose(&v21, 8);
  }
}

+ (id)stringByReplacingEmojiCharactersWithEmojiDescriptions:(id)a3 stringForPauses:(id)a4 language:(id)a5 rangeReplacements:(id)a6 appendEmojiSuffix:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v18 = a6;
  if (v11)
  {
    id v19 = objc_msgSend_mutableCopy(v11, v14, v15, v16, v17);
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    v20 = objc_opt_class();
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1A66FD198;
    v26[3] = &unk_1E5C69A38;
    BOOL v33 = a7;
    id v27 = v13;
    id v28 = v12;
    id v29 = v11;
    id v21 = v19;
    id v30 = v21;
    v32 = v34;
    id v31 = v18;
    objc_msgSend_enumerateEmojiCharactersInString_languageCode_withBlock_(v20, v22, (uint64_t)v29, (uint64_t)v27, (uint64_t)v26);
    uint64_t v23 = v31;
    id v24 = v21;

    _Block_object_dispose(v34, 8);
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

@end