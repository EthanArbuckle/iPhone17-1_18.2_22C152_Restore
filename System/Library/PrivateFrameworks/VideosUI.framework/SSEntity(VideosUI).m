@interface SSEntity(VideosUI)
- (id)vui_valuesForProperties:()VideosUI;
@end

@implementation SSEntity(VideosUI)

- (id)vui_valuesForProperties:()VideosUI
{
  id v4 = a3;
  size_t v5 = [v4 count];
  if (v5)
  {
    size_t v6 = v5;
    v7 = (id *)malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
    v8 = malloc_type_calloc(v6, 8uLL, 0x80040B8603338uLL);
    objc_msgSend(v4, "getObjects:range:", v7, 0, v6);
    [a1 getValues:v8 forProperties:v7 count:v6];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    for (uint64_t i = 0; i != v6; ++i)
    {
      id v11 = v7[i];
      if (v11) {
        BOOL v12 = v8[i] == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12) {
        objc_msgSend(v9, "setObject:forKey:");
      }
    }
    free(v7);
    free(v8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end