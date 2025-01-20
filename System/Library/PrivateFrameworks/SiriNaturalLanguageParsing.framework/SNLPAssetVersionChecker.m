@interface SNLPAssetVersionChecker
+ (id)loadNSNumberListFromPlistURL:(id)a3;
+ (unordered_set<unsigned)loadUInt32ListFromConfigPListResourceName:(std:(std:(id)a2 :(SEL)a3 allocator<unsigned int>> *__return_ptr)retstr :(id)a4 equal_to<unsigned)int>;
+ (unordered_set<unsigned)loadUInt32ListFromPlistURL:(std:(std:(id)a2 :(SEL)a3 allocator<unsigned int>> *__return_ptr)retstr :(id)a4 equal_to<unsigned)int>;
@end

@implementation SNLPAssetVersionChecker

+ (unordered_set<unsigned)loadUInt32ListFromConfigPListResourceName:(std:(std:(id)a2 :(SEL)a3 allocator<unsigned int>> *__return_ptr)retstr :(id)a4 equal_to<unsigned)int>
{
  id v10 = a4;
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:a2];
  v7 = [v6 URLForResource:v10 withExtension:@"plist"];

  if (v7)
  {
    [a2 loadUInt32ListFromPlistURL:v7];
  }
  else
  {
    id v8 = SNLPOSLoggerForCategory(0);
    retstr->var0.var0 = 0u;
    *(_OWORD *)&retstr->var0.var1.var0.var0 = 0u;
    retstr->var0.var3.var0 = 1.0;
  }

  return result;
}

+ (unordered_set<unsigned)loadUInt32ListFromPlistURL:(std:(std:(id)a2 :(SEL)a3 allocator<unsigned int>> *__return_ptr)retstr :(id)a4 equal_to<unsigned)int>
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v6 = +[SNLPAssetVersionChecker loadNSNumberListFromPlistURL:a4];
  retstr->var0.unint64_t var0 = 0u;
  *(_OWORD *)&retstr->var0.var1.var0.unint64_t var0 = 0u;
  retstr->var0.var3.unint64_t var0 = 1.0;
  v30 = v6;
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>((uint64_t)retstr, vcvtps_u32_f32((float)(unint64_t)[v6 count] / retstr->var0.var3.var0));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v30;
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v33;
    p_var1 = &retstr->var0.var1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        unsigned int v11 = [*(id *)(*((void *)&v32 + 1) + 8 * i) unsignedIntValue];
        unsigned int v12 = v11;
        unint64_t v13 = v11;
        unint64_t var0 = retstr->var0.var0.var0.var1.var0.var0;
        if (var0)
        {
          uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)var0);
          v15.i16[0] = vaddlv_u8(v15);
          if (v15.u32[0] > 1uLL)
          {
            unint64_t v4 = v11;
            if (var0 <= v11) {
              unint64_t v4 = v11 % var0;
            }
          }
          else
          {
            unint64_t v4 = (var0 - 1) & v11;
          }
          v16 = (uint64_t **)retstr->var0.var0.var0.var0[v4];
          if (v16)
          {
            for (j = *v16; j; j = (uint64_t *)*j)
            {
              unint64_t v18 = j[1];
              if (v18 == v11)
              {
                if (*((_DWORD *)j + 4) == v11) {
                  goto LABEL_44;
                }
              }
              else
              {
                if (v15.u32[0] > 1uLL)
                {
                  if (v18 >= var0) {
                    v18 %= var0;
                  }
                }
                else
                {
                  v18 &= var0 - 1;
                }
                if (v18 != v4) {
                  break;
                }
              }
            }
          }
        }
        v19 = operator new(0x18uLL);
        void *v19 = 0;
        v19[1] = v13;
        *((_DWORD *)v19 + 4) = v12;
        float v20 = (float)(retstr->var0.var2.var0 + 1);
        float v21 = retstr->var0.var3.var0;
        if (!var0 || (float)(v21 * (float)var0) < v20)
        {
          BOOL v22 = (var0 & (var0 - 1)) != 0;
          if (var0 < 3) {
            BOOL v22 = 1;
          }
          unint64_t v23 = v22 | (2 * var0);
          unint64_t v24 = vcvtps_u32_f32(v20 / v21);
          if (v23 <= v24) {
            size_t v25 = v24;
          }
          else {
            size_t v25 = v23;
          }
          std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>((uint64_t)retstr, v25);
          unint64_t var0 = retstr->var0.var0.var0.var1.var0.var0;
          if ((var0 & (var0 - 1)) != 0)
          {
            if (var0 <= v13) {
              unint64_t v4 = v13 % var0;
            }
            else {
              unint64_t v4 = v13;
            }
          }
          else
          {
            unint64_t v4 = (var0 - 1) & v13;
          }
        }
        v26 = retstr->var0.var0.var0.var0;
        v27 = (void **)retstr->var0.var0.var0.var0[v4];
        if (v27)
        {
          void *v19 = *v27;
LABEL_42:
          *v27 = v19;
          goto LABEL_43;
        }
        void *v19 = p_var1->var0.var0;
        p_var1->var0.unint64_t var0 = v19;
        v26[v4] = p_var1;
        if (*v19)
        {
          unint64_t v28 = *(void *)(*v19 + 8);
          if ((var0 & (var0 - 1)) != 0)
          {
            if (v28 >= var0) {
              v28 %= var0;
            }
          }
          else
          {
            v28 &= var0 - 1;
          }
          v27 = &retstr->var0.var0.var0.var0[v28];
          goto LABEL_42;
        }
LABEL_43:
        ++retstr->var0.var2.var0;
LABEL_44:
        ;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v7);
  }

  return result;
}

+ (id)loadNSNumberListFromPlistURL:(id)a3
{
  v3 = [MEMORY[0x1E4F1C978] arrayWithContentsOfURL:a3];
  if (!v3) {
    id v4 = SNLPOSLoggerForCategory(0);
  }
  return v3;
}

@end