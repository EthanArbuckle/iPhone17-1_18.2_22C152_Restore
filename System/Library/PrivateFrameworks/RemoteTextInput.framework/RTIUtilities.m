@interface RTIUtilities
+ (id)_attributeToReplaceForCoding:(id)a3;
+ (id)_attributeToReplaceForDecoding:(id)a3;
+ (id)_attributedStringWithoutDefaultAttributes:(id)a3;
+ (id)_codableAttributedString:(id)a3 validAttributes:(id)a4;
+ (id)_decodableAttributedString:(id)a3;
+ (id)customInfoClassesForType:(id)a3 forClass:(Class)a4;
+ (id)customInfoDictionary;
+ (void)registerCustomInfoClasses:(id)a3 forType:(id)a4 forClass:(Class)a5;
+ (void)unregisterCustomInfoType:(id)a3 forClass:(Class)a4;
@end

@implementation RTIUtilities

+ (id)_codableAttributedString:(id)a3 validAttributes:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    v7 = (objc_class *)MEMORY[0x1E4F28E48];
    id v8 = a3;
    id v9 = [v7 alloc];
    v10 = [v8 string];
    v11 = (void *)[v9 initWithString:v10];

    uint64_t v12 = [v11 length];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__RTIUtilities__codableAttributedString_validAttributes___block_invoke;
    v16[3] = &unk_1E583CB48;
    id v17 = v6;
    id v19 = a1;
    id v13 = v11;
    id v18 = v13;
    objc_msgSend(v8, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0, v16);

    v14 = v18;
    a3 = v13;
  }
  return a3;
}

void __57__RTIUtilities__codableAttributedString_validAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__RTIUtilities__codableAttributedString_validAttributes___block_invoke_2;
  v10[3] = &unk_1E583CB20;
  id v11 = *(id *)(a1 + 32);
  long long v9 = *(_OWORD *)(a1 + 40);
  id v8 = (id)v9;
  long long v12 = v9;
  uint64_t v13 = a3;
  uint64_t v14 = a4;
  [a2 enumerateKeysAndObjectsUsingBlock:v10];
}

void __57__RTIUtilities__codableAttributedString_validAttributes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    v7 = *(void **)(a1 + 48);
    id v11 = v5;
    v12[0] = v6;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    long long v9 = [v7 _attributeToReplaceForCoding:v8];

    v10 = *(void **)(a1 + 40);
    if (v9) {
      objc_msgSend(v10, "setAttributes:range:", v9, *(void *)(a1 + 56), *(void *)(a1 + 64));
    }
    else {
      objc_msgSend(v10, "addAttribute:value:range:", v5, v6, *(void *)(a1 + 56), *(void *)(a1 + 64));
    }
  }
}

+ (id)_decodableAttributedString:(id)a3
{
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E4F28E48];
    id v5 = a3;
    id v6 = [v4 alloc];
    v7 = [v5 string];
    id v8 = (void *)[v6 initWithString:v7];

    uint64_t v9 = [v8 length];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __43__RTIUtilities__decodableAttributedString___block_invoke;
    v12[3] = &unk_1E583CB98;
    id v14 = a1;
    id v10 = v8;
    id v13 = v10;
    objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v9, 0, v12);
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

void __43__RTIUtilities__decodableAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__RTIUtilities__decodableAttributedString___block_invoke_2;
  v9[3] = &unk_1E583CB70;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v8;
  long long v10 = v8;
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  [a2 enumerateKeysAndObjectsUsingBlock:v9];
}

void __43__RTIUtilities__decodableAttributedString___block_invoke_2(void *a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)a1[5];
  uint64_t v12 = a2;
  v13[0] = a3;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];
  long long v10 = [v5 _attributeToReplaceForDecoding:v9];

  uint64_t v11 = (void *)a1[4];
  if (v10) {
    objc_msgSend(v11, "setAttributes:range:", v10, a1[6], a1[7]);
  }
  else {
    objc_msgSend(v11, "addAttribute:value:range:", v8, v7, a1[6], a1[7]);
  }
}

+ (id)_attributedStringWithoutDefaultAttributes:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_attributedStringWithoutDefaultAttributes__onceToken != -1) {
    dispatch_once(&_attributedStringWithoutDefaultAttributes__onceToken, &__block_literal_global_2);
  }
  uint64_t v4 = [v3 length];
  if (v3)
  {
    uint64_t v5 = v4;
    id v6 = (void *)[v3 mutableCopy];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = (id)_attributedStringWithoutDefaultAttributes__attributesToRemove;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v6, "removeAttribute:range:", *(void *)(*((void *)&v17 + 1) + 8 * i), 0, v5);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    uint64_t v12 = [v3 length];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__RTIUtilities__attributedStringWithoutDefaultAttributes___block_invoke_2;
    v15[3] = &unk_1E583CBC0;
    id v13 = v6;
    id v16 = v13;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", 0, v12, 2, v15);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

void __58__RTIUtilities__attributedStringWithoutDefaultAttributes___block_invoke()
{
  v2[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"NSParagraphStyle";
  v2[1] = @"NSFont";
  v2[2] = @"NSColor";
  v2[3] = @"NSTextAnimation";
  v2[4] = @"_UIAnimatedTextSpacer";
  v2[5] = @"font_base_key";
  v2[6] = @"paragraph_style_base_key";
  v2[7] = @"IMMentionAutomaticConfirmedMention";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:8];
  v1 = (void *)_attributedStringWithoutDefaultAttributes__attributesToRemove;
  _attributedStringWithoutDefaultAttributes__attributesToRemove = v0;
}

uint64_t __58__RTIUtilities__attributedStringWithoutDefaultAttributes___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2 && ([(id)objc_opt_class() supportsSecureCoding] & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", @"NSAttachment", a3, a4);
  }
  return MEMORY[0x1F41817F8]();
}

+ (id)_attributeToReplaceForCoding:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 objectForKey:@"NSTextAnimation"];
  if (objc_opt_respondsToSelector())
  {
    id v7 = @"RTITextAnimation";
    uint64_t v4 = [v3 name];
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)_attributeToReplaceForDecoding:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 objectForKey:@"RTITextAnimation"];
  uint64_t v4 = v3;
  if (v3 && (RTITextAnimationWithName(v3), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    uint64_t v9 = @"NSTextAnimation";
    v10[0] = v5;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)customInfoDictionary
{
  if (customInfoDictionary_onceToken != -1) {
    dispatch_once(&customInfoDictionary_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)customInfoDictionary_customInfoDictionary;
  return v2;
}

uint64_t __36__RTIUtilities_customInfoDictionary__block_invoke()
{
  customInfoDictionary_customInfoDictionary = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

+ (void)registerCustomInfoClasses:(id)a3 forType:(id)a4 forClass:(Class)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    while (1)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v8);
      }
      if (!--v11)
      {
        uint64_t v11 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (!v11) {
          break;
        }
      }
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_rtiUtilities_lock);
  id v13 = [a1 customInfoDictionary];
  id v14 = NSStringFromClass(a5);
  v15 = [v13 objectForKey:v14];

  if (!v15)
  {
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    id v16 = [a1 customInfoDictionary];
    long long v17 = NSStringFromClass(a5);
    [v16 setObject:v15 forKey:v17];
  }
  [v15 setObject:v8 forKey:v9];
  os_unfair_lock_unlock((os_unfair_lock_t)&_rtiUtilities_lock);
}

+ (void)unregisterCustomInfoType:(id)a3 forClass:(Class)a4
{
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_rtiUtilities_lock);
  id v7 = [a1 customInfoDictionary];
  id v8 = NSStringFromClass(a4);
  id v9 = [v7 objectForKey:v8];

  [v9 removeObjectForKey:v6];
  os_unfair_lock_unlock((os_unfair_lock_t)&_rtiUtilities_lock);
}

+ (id)customInfoClassesForType:(id)a3 forClass:(Class)a4
{
  id v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_rtiUtilities_lock);
  id v7 = [a1 customInfoDictionary];
  id v8 = NSStringFromClass(a4);
  id v9 = [v7 objectForKey:v8];

  uint64_t v10 = [v9 objectForKey:v6];

  os_unfair_lock_unlock((os_unfair_lock_t)&_rtiUtilities_lock);
  return v10;
}

@end