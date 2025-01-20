@interface WFVariableString(AttributedString)
+ (id)attributedStringWithVariable:()AttributedString;
- (id)attributedString;
- (id)attributedStringByAddingTypingAttributes:()AttributedString;
- (id)stringByReplacingCharactersInRange:()AttributedString withVariable:;
- (id)stringByReplacingCharactersInRange:()AttributedString withVariableString:;
- (id)substringWithRange:()AttributedString;
- (void)initWithAttributedString:()AttributedString;
@end

@implementation WFVariableString(AttributedString)

- (id)attributedStringByAddingTypingAttributes:()AttributedString
{
  id v4 = a3;
  v5 = [a1 attributedString];
  v6 = (void *)[v5 mutableCopy];

  objc_msgSend(v6, "addAttributes:range:", v4, 0, objc_msgSend(v6, "length"));
  return v6;
}

- (id)substringWithRange:()AttributedString
{
  v6 = [a1 attributedString];
  v7 = objc_msgSend(v6, "attributedSubstringFromRange:", a3, a4);

  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAttributedString:v7];
  return v8;
}

- (id)stringByReplacingCharactersInRange:()AttributedString withVariableString:
{
  id v8 = a5;
  v9 = [a1 attributedString];
  v10 = (void *)[v9 mutableCopy];

  v11 = [v8 attributedString];

  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", a3, a4, v11);
  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAttributedString:v10];

  return v12;
}

- (id)stringByReplacingCharactersInRange:()AttributedString withVariable:
{
  id v8 = a5;
  v9 = [a1 attributedString];
  v10 = (void *)[v9 mutableCopy];

  v11 = [MEMORY[0x263F86FC0] attributedStringWithVariable:v8];

  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", a3, a4, v11);
  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAttributedString:v10];

  return v12;
}

- (id)attributedString
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = objc_getAssociatedObject(a1, sel_attributedString);
  if (!v2)
  {
    v13 = sel_attributedString;
    v3 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v14 = a1;
    id v4 = [a1 stringsAndVariables];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (!v5) {
      goto LABEL_14;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [objc_alloc(MEMORY[0x263F086A0]) initWithString:v9];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          uint64_t v10 = objc_msgSend(MEMORY[0x263F86FC0], "attributedStringWithVariable:", v9, v13);
        }
        v11 = (void *)v10;
        objc_msgSend(v3, "appendAttributedString:", v10, v13);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (!v6)
      {
LABEL_14:

        v2 = (void *)[v3 copy];
        objc_setAssociatedObject(v14, v13, v2, (void *)1);

        break;
      }
    }
  }
  return v2;
}

- (void)initWithAttributedString:()AttributedString
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"WFVariableString+AttributedString.m", 27, @"Invalid parameter not satisfying: %@", @"[attributedString isKindOfClass:[NSAttributedString class]]" object file lineNumber description];
  }
  uint64_t v6 = [v5 string];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__WFVariableString_AttributedString__initWithAttributedString___block_invoke;
  v12[3] = &unk_264BFCD58;
  id v7 = v5;
  id v13 = v7;
  id v8 = (void *)[a1 initWithAttachmentCharacterString:v6 variableGetter:v12];

  if (v8)
  {
    objc_setAssociatedObject(v8, sel_attributedString, v7, (void *)3);
    id v9 = v8;
  }

  return v8;
}

+ (id)attributedStringWithVariable:()AttributedString
{
  id v3 = a3;
  id v4 = [[WFVariableAttachment alloc] initWithVariable:v3];

  id v5 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v4];

  return v5;
}

@end