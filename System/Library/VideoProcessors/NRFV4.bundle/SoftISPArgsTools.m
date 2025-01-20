@interface SoftISPArgsTools
+ (void)setAllArgumentsOnEncoder:(id)a3 textures:(id *)a4 argIdentifiers:(id *)a5;
@end

@implementation SoftISPArgsTools

+ (void)setAllArgumentsOnEncoder:(id)a3 textures:(id *)a4 argIdentifiers:(id *)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!a4 || a4->var0 == -1)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    v9 = a4 + 1;
    do
    {
      ++v8;
      unint64_t var0 = v9->var0;
      ++v9;
    }
    while (var0 != -1);
  }
  v28 = a5;
  if (!a5 || a5->var0 == -1)
  {
    uint64_t v11 = 0;
    if (!v8) {
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v11 = 0;
    v12 = a5 + 1;
    do
    {
      ++v11;
      unint64_t v13 = v12->var0;
      ++v12;
    }
    while (v13 != -1);
    if (!v8) {
      goto LABEL_29;
    }
  }
  uint64_t v14 = 0;
  v15 = &selRef_supportsExternalMemoryResource;
  uint64_t v29 = v8;
  v30 = a4;
  do
  {
    v16 = &a4[v14];
    id v17 = v16->var1;
    unint64_t v18 = v16->var0;
    v19 = v17;
    if (v17 && ![v17 conformsToProtocol:v15[471]])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v31 = v19;
        id v20 = v19;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = 0;
          uint64_t v24 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v33 != v24) {
                objc_enumerationMutation(v20);
              }
              objc_msgSend(v7, "setTexture:atIndex:", *(void *)(*((void *)&v32 + 1) + 8 * i), v18 + v23 + i, v28);
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v36 count:16];
            v23 += i;
          }
          while (v22);
        }

        uint64_t v8 = v29;
        a4 = v30;
        v15 = &selRef_supportsExternalMemoryResource;
        v19 = v31;
      }
    }
    else
    {
      objc_msgSend(v7, "setTexture:atIndex:", v19, v18, v28);
    }

    ++v14;
  }
  while (v14 != v8);
LABEL_29:
  if (v11)
  {
    p_var4 = &v28->var4;
    do
    {
      if (*((unsigned char *)p_var4 - 24))
      {
        id WeakRetained = objc_loadWeakRetained(p_var4);
        if (WeakRetained) {
          [v7 setBuffer:WeakRetained offset:*(p_var4 - 2) atIndex:*(p_var4 - 4)];
        }
      }
      else if (*(p_var4 - 1) && *(p_var4 - 2))
      {
        objc_msgSend(v7, "setBytes:length:atIndex:");
      }
      p_var4 += 6;
      --v11;
    }
    while (v11);
  }
}

@end