@interface NSMutableAttributedString(WBSNSMutableAttributedExtras)
- (void)safari_replaceCharactersWithStringBindings:()WBSNSMutableAttributedExtras;
@end

@implementation NSMutableAttributedString(WBSNSMutableAttributedExtras)

- (void)safari_replaceCharactersWithStringBindings:()WBSNSMutableAttributedExtras
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 string];
  v6 = [MEMORY[0x1E4F1CA48] array];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __102__NSMutableAttributedString_WBSNSMutableAttributedExtras__safari_replaceCharactersWithStringBindings___block_invoke;
  v31[3] = &unk_1E615B878;
  id v26 = v5;
  id v32 = v26;
  id v7 = v6;
  id v33 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:v31];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "first", v26);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v16 = [v13 second];
          uint64_t v17 = [v16 rangeValue];
          uint64_t v19 = v18;
          v20 = [v13 first];
          objc_msgSend(a1, "replaceCharactersInRange:withString:", v17, v19, v20);
        }
        else
        {
          v21 = [v13 first];
          objc_opt_class();
          char v22 = objc_opt_isKindOfClass();

          if ((v22 & 1) == 0) {
            continue;
          }
          v16 = [v13 second];
          uint64_t v23 = [v16 rangeValue];
          uint64_t v25 = v24;
          v20 = [v13 first];
          objc_msgSend(a1, "replaceCharactersInRange:withAttributedString:", v23, v25, v20);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v10);
  }
}

@end