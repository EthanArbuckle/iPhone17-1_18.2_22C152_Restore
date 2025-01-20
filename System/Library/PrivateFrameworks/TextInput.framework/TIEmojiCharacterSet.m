@interface TIEmojiCharacterSet
@end

@implementation TIEmojiCharacterSet

void ____TIEmojiCharacterSet_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  if (!EmojiFoundationLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x1E4F143A8];
    v5[2] = 3221225472;
    v5[3] = __EmojiFoundationLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_1E5558850;
    uint64_t v7 = 0;
    EmojiFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    v0 = (void *)v5[0];
    if (EmojiFoundationLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v4 = v5[0];
      v0 = (void *)abort_report_np();
    }
    free(v0);
  }
LABEL_4:
  v1 = objc_msgSend(MEMORY[0x1E4F28B88], "_emojiCharacterSet", v4);
  v2 = (void *)[v1 mutableCopy];

  objc_msgSend(v2, "removeCharactersInRange:", 8205, 1);
  v3 = (void *)__TIEmojiCharacterSet___emojiCharacterSet;
  __TIEmojiCharacterSet___emojiCharacterSet = (uint64_t)v2;
}

@end