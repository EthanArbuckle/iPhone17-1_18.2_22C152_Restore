@interface SADecoratedString(SiriUI)
- (id)siriui_attributedStringValueWithAttribute:()SiriUI value:forRegionsWithProperty:;
- (void)siriui_enumeratePropertyRangesUsingBlock:()SiriUI;
- (void)siriui_enumerateRangesOfRegionsWithProperty:()SiriUI usingBlock:;
@end

@implementation SADecoratedString(SiriUI)

- (void)siriui_enumeratePropertyRangesUsingBlock:()SiriUI
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = objc_msgSend(a1, "regions", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v11 = [v10 property];
          uint64_t v12 = objc_msgSend(v10, "siriui_range");
          v4[2](v4, v11, v12, v13);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)siriui_enumerateRangesOfRegionsWithProperty:()SiriUI usingBlock:
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __84__SADecoratedString_SiriUI__siriui_enumerateRangesOfRegionsWithProperty_usingBlock___block_invoke;
    v8[3] = &unk_26469FB50;
    id v9 = v6;
    id v10 = v7;
    objc_msgSend(a1, "siriui_enumeratePropertyRangesUsingBlock:", v8);
  }
}

- (id)siriui_attributedStringValueWithAttribute:()SiriUI value:forRegionsWithProperty:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (objc_class *)MEMORY[0x263F089B8];
  id v11 = a5;
  id v12 = [v10 alloc];
  uint64_t v13 = [a1 text];
  long long v14 = (void *)[v12 initWithString:v13];

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __100__SADecoratedString_SiriUI__siriui_attributedStringValueWithAttribute_value_forRegionsWithProperty___block_invoke;
  v21[3] = &unk_26469FB78;
  id v15 = v14;
  id v22 = v15;
  id v23 = v8;
  id v24 = v9;
  id v16 = v9;
  id v17 = v8;
  objc_msgSend(a1, "siriui_enumerateRangesOfRegionsWithProperty:usingBlock:", v11, v21);

  v18 = v24;
  id v19 = v15;

  return v19;
}

@end