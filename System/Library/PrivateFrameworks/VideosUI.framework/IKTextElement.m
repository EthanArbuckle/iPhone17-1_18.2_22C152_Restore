@interface IKTextElement
@end

@implementation IKTextElement

void __51__IKTextElement_NSAttributedString__textAttributes__block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB06F8];
  v4[0] = @"NSFont";
  v4[1] = @"NSParagraphStyle";
  uint64_t v1 = *MEMORY[0x1E4FB0738];
  v5[0] = v0;
  v5[1] = v1;
  v4[2] = @"NSColor";
  v5[2] = *MEMORY[0x1E4FB0700];
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
  v3 = (void *)textAttributes___keyMappings;
  textAttributes___keyMappings = v2;
}

void __51__IKTextElement_NSAttributedString__textAttributes__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v9 = [(id)textAttributes___keyMappings objectForKey:v8];
        if (v9)
        {
          v10 = [v3 objectForKey:v8];
          [*(id *)(a1 + 32) setObject:v10 forKey:v9];
        }
        else
        {
          NSLog(&cfstr_NoMappedKeyFor.isa, v8);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

@end