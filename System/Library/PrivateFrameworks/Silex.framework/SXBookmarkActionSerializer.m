@interface SXBookmarkActionSerializer
- (id)URLForAction:(id)a3 type:(int64_t)a4;
@end

@implementation SXBookmarkActionSerializer

- (id)URLForAction:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v7 = 0;
    if (a4 != 1 && (isKindOfClass & 1) != 0)
    {
      v8 = [v5 bookmark];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = objc_alloc_init(MEMORY[0x263F08BA0]);
        v10 = [v8 componentIdentifier];
        v11 = [MEMORY[0x263F08708] URLFragmentAllowedCharacterSet];
        v12 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:v11];
        [v9 setFragment:v12];

        v7 = [v9 URL];
      }
      else
      {
        v7 = 0;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end