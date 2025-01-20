@interface NSDictionary
- (void)_msv_enumerateKeysAndObjectsWithSortedKeys:(void *)a3 usingBlock:;
@end

@implementation NSDictionary

uint64_t __44__NSDictionary_MSVSequence__msv_compactMap___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2) {
    [*(id *)(a1 + 32) addObject:v2];
  }
  return MEMORY[0x1F41817F8]();
}

void __44__NSDictionary_MSVSequence__msv_firstWhere___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    *a4 = 1;
    uint64_t v8 = +[MSVPair pairWithFirst:v11 second:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)_msv_enumerateKeysAndObjectsWithSortedKeys:(void *)a3 usingBlock:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = a3;
  if (a1)
  {
    unsigned __int8 v18 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        v13 = objc_msgSend(a1, "objectForKey:", v12, (void)v14);
        v6[2](v6, v12, v13, &v18);
        LODWORD(v12) = v18;

        if (v12) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

void __52__NSDictionary_MSVAdditions__msv_compactDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (_NSIsNSString())
  {
    v6 = *(void **)(a1 + 32);
    [NSString stringWithFormat:@"%@ : \"%@\"", v11, v5];
  }
  else
  {
    int v7 = _NSIsNSArray();
    v6 = *(void **)(a1 + 32);
    uint64_t v8 = NSString;
    if (v7)
    {
      uint64_t v9 = objc_msgSend(v5, "msv_compactDescription");
      uint64_t v10 = [v8 stringWithFormat:@"%@ : [%@]", v11, v9];
      [v6 addObject:v10];

      goto LABEL_7;
    }
    [NSString stringWithFormat:@"%@ : %@", v11, v5];
  uint64_t v9 = };
  [v6 addObject:v9];
LABEL_7:
}

uint64_t __53__NSDictionary_MSVSequence__msv_reduceIntoObject_by___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return MEMORY[0x1F41817F8]();
}

uint64_t __53__NSDictionary_MSVSequence__msv_reduceIntoUInt64_by___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __53__NSDictionary_MSVSequence__msv_reduceIntoUInt32_by___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __51__NSDictionary_MSVSequence__msv_reduceIntoUInt_by___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __52__NSDictionary_MSVSequence__msv_reduceIntoInt64_by___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __52__NSDictionary_MSVSequence__msv_reduceIntoInt32_by___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __50__NSDictionary_MSVSequence__msv_reduceIntoInt_by___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __53__NSDictionary_MSVSequence__msv_reduceIntoDouble_by___block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(double (**)(double))(*(void *)(a1 + 32)
                                                                                                 + 16))(*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __54__NSDictionary_MSVSequence__msv_reduceIntoCGFloat_by___block_invoke(uint64_t a1)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(double (**)(double))(*(void *)(a1 + 32)
                                                                                                 + 16))(*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __52__NSDictionary_MSVSequence__msv_reduceIntoFloat_by___block_invoke(uint64_t a1)
{
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (*(float (**)(float))(*(void *)(a1 + 32)
                                                                                              + 16))(*(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

uint64_t __51__NSDictionary_MSVSequence__msv_reduceIntoBool_by___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __41__NSDictionary_MSVSequence__msv_flatMap___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObjectsFromArray:v2];
}

void __40__NSDictionary_MSVSequence__msv_filter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) == 0) {
    [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:v3];
  }
}

void __50__NSDictionary_MSVSequence__msv_compactMapValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  id v7 = a2;
  v6(v5, v7, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

void __57__NSDictionary_MSVSequence__msv_compactMapKeysAndValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  id v8 = v7;
  if (v6 != v9) {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:");
  }
  if (v6)
  {
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];
    CFRelease(v6);
  }
  if (v8) {
    CFRelease(v8);
  }
}

void __43__NSDictionary_MSVSequence__msv_mapValues___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  id v7 = a2;
  v6(v5, v7, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v8 forKey:v7];
}

void __50__NSDictionary_MSVSequence__msv_mapKeysAndValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  id v8 = v7;
  if (v6 != v9) {
    [*(id *)(a1 + 32) removeObjectForKey:v9];
  }
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];
  CFRelease(v6);
  CFRelease(v8);
}

void __37__NSDictionary_MSVSequence__msv_map___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

@end