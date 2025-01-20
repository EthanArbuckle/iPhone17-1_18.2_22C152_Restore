@interface UITextFieldEditingProcessor
@end

@implementation UITextFieldEditingProcessor

void __60___UITextFieldEditingProcessor_beginEditingWithTextStorage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 length];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __60___UITextFieldEditingProcessor_beginEditingWithTextStorage___block_invoke_2;
  v14 = &unk_1E530B2B8;
  long long v15 = *(_OWORD *)(a1 + 32);
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  id v16 = v5;
  uint64_t v17 = v6;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v4, 0x100000, &v11);
  if (objc_opt_respondsToSelector())
  {
    id v7 = v5;
    v8 = objc_msgSend(v7, "defaultAttributes", v11, v12, v13, v14, v15);
    v9 = [*(id *)(a1 + 32) overridingEditingAttributesForAttributes:v8 withOverrides:*(void *)(a1 + 40)];
    if ([v9 count])
    {
      if (v8)
      {
        v10 = (void *)[v8 mutableCopy];
        [v10 addEntriesFromDictionary:v9];
        [v7 setDefaultAttributes:v10];
      }
      else
      {
        [v7 setDefaultAttributes:v9];
      }
      [*(id *)(a1 + 48) setRestoreDefaultAttributes:1];
    }
  }
  if (!objc_msgSend(v5, "length", v11, v12, v13, v14, v15)) {
    [*(id *)(a1 + 48) setRestoreTextAttributes:1];
  }
}

void __60___UITextFieldEditingProcessor_beginEditingWithTextStorage___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [*(id *)(a1 + 32) overridingEditingAttributesForAttributes:a2 withOverrides:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 48), "setAttributes:range:", v7, a3, a4);
  [*(id *)(a1 + 56) setRestoreTextAttributes:1];
}

@end