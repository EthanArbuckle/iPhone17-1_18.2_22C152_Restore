@interface ItalicTextProviderForText
@end

@implementation ItalicTextProviderForText

id ___ItalicTextProviderForText_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  v7 = 0;
  if (v6 && !a3)
  {
    id v8 = a4;
    if ([v8 uppercase])
    {
      v9 = [MEMORY[0x1E4F1CA20] currentLocale];
      uint64_t v10 = [v6 uppercaseStringWithLocale:v9];

      id v6 = (id)v10;
    }
    v11 = (void *)MEMORY[0x1E4F19A50];
    v12 = [v8 font];
    v13 = [v12 fontDescriptor];
    v14 = [v13 fontDescriptorWithSymbolicTraits:1];
    v15 = [v8 font];

    [v15 pointSize];
    v16 = objc_msgSend(v11, "fontWithDescriptor:size:", v14);

    uint64_t v19 = *MEMORY[0x1E4FB06F8];
    v20[0] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v17];
  }
  return v7;
}

@end