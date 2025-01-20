@interface SACardSnippet(SiriUIUUFRShowable)
- (id)_uufrShownRequestedByInstrumentationManager:()SiriUIUUFRShowable;
@end

@implementation SACardSnippet(SiriUIUUFRShowable)

- (id)_uufrShownRequestedByInstrumentationManager:()SiriUIUUFRShowable
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = a1;
  v32.super_class = (Class)&off_26D9C3380;
  v5 = objc_msgSendSuper2(&v32, sel__uufrShownRequestedByInstrumentationManager_, v4);
  v6 = [a1 aceId];
  v7 = [v4 cardIDforSnippetAceID:v6];

  if (v7)
  {
    v8 = [a1 aceId];
    v9 = [v4 cardIDforSnippetAceID:v8];
    [v5 setViewID:v9];
  }
  else
  {
    v8 = objc_msgSend(a1, "siriui_card");
    v9 = [v8 backingCard];
    v10 = [v9 cardId];
    [v5 setViewID:v10];
  }
  v11 = objc_msgSend(a1, "siriui_card");
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = objc_msgSend(a1, "siriui_card");
    v14 = [v13 backingCard];
    v15 = [v14 cardSections];
    v16 = [v15 firstObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [MEMORY[0x263EFF980] array];
      v18 = [v16 cardSections];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v24 = [v23 resultIdentifier];

            if (v24)
            {
              v25 = [v23 resultIdentifier];
              [v17 addObject:v25];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v20);
      }
      id v26 = objc_alloc_init(MEMORY[0x263F6ED48]);
      [v26 setResultIdentifiers:v17];
      [v5 setGridCardSection:v26];
    }
  }

  return v5;
}

@end