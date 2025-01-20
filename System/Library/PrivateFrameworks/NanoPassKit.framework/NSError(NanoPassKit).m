@interface NSError(NanoPassKit)
- (id)npk_errorWithDomain:()NanoPassKit code:;
@end

@implementation NSError(NanoPassKit)

- (id)npk_errorWithDomain:()NanoPassKit code:
{
  id v6 = a3;
  id v7 = a1;
  if (v7)
  {
    uint64_t v8 = *MEMORY[0x263F08608];
    do
    {
      v9 = [v7 domain];
      if ([v9 isEqualToString:v6])
      {
        uint64_t v10 = [v7 code];

        if (v10 == a4) {
          break;
        }
      }
      else
      {
      }
      v11 = [v7 userInfo];
      uint64_t v12 = [v11 objectForKeyedSubscript:v8];

      id v7 = (id)v12;
    }
    while (v12);
  }

  return v7;
}

@end