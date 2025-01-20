@interface NSMutableDictionary(Goodies)
- (id)mf_objectForKey:()Goodies ofClass:;
- (uint64_t)mf_setBool:()Goodies forKey:;
- (void)mf_addObject:()Goodies forKey:;
- (void)mf_setInteger:()Goodies forKey:;
@end

@implementation NSMutableDictionary(Goodies)

- (uint64_t)mf_setBool:()Goodies forKey:
{
  if (a3) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  return objc_msgSend(a1, "setObject:forKey:", v3);
}

- (void)mf_setInteger:()Goodies forKey:
{
  id v7 = a4;
  v6 = [MEMORY[0x1E4F28ED0] numberWithInt:a3];
  [a1 setObject:v6 forKey:v7];
}

- (void)mf_addObject:()Goodies forKey:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = (void *)[v7 copy];

    v8 = v9;
    CFDictionaryAddValue(a1, v9, v6);
  }
  else
  {
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1A7EFF000, v10, OS_LOG_TYPE_INFO, "Bad arguments to %@, %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (id)mf_objectForKey:()Goodies ofClass:
{
  id v6 = a3;
  id v7 = [a1 objectForKey:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init(a4);
    [a1 setObject:v7 forKey:v6];
  }

  return v7;
}

@end