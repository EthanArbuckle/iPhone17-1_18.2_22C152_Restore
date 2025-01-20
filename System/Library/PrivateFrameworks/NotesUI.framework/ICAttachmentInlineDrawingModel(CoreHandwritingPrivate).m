@interface ICAttachmentInlineDrawingModel(CoreHandwritingPrivate)
+ (uint64_t)handwritingRecognitionSupported;
@end

@implementation ICAttachmentInlineDrawingModel(CoreHandwritingPrivate)

+ (uint64_t)handwritingRecognitionSupported
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v0 = objc_msgSend(MEMORY[0x1E4F1CA20], "preferredLanguages", 0);
  uint64_t v1 = [v0 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v1)
  {
    uint64_t v2 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v1; ++i)
      {
        if (*(void *)v8 != v2) {
          objc_enumerationMutation(v0);
        }
        v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:*(void *)(*((void *)&v7 + 1) + 8 * i)];
        char v5 = [MEMORY[0x1E4F5C070] isLocaleSupported:v4 withMode:4];

        if (v5)
        {
          uint64_t v1 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v1 = [v0 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v1) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v1;
}

@end