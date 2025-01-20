@interface NSMutableDictionary(Goodies)
- (id)mf_objectForKey:()Goodies ofClass:;
- (uint64_t)mf_setBool:()Goodies forKey:;
- (uint64_t)mf_setInteger:()Goodies forKey:;
- (void)mf_addObject:()Goodies forKey:;
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

- (uint64_t)mf_setInteger:()Goodies forKey:
{
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:");
  return [a1 setObject:v6 forKey:a4];
}

- (void)mf_addObject:()Goodies forKey:
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    id v8 = (id)[a4 copyWithZone:0];
    CFDictionaryAddValue(a1, v8, a3);
  }
  else
  {
    v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v10 = a3;
      __int16 v11 = 2112;
      v12 = a4;
      _os_log_impl(&dword_1CFCFE000, v7, OS_LOG_TYPE_INFO, "Bad arguments to %@, %@", buf, 0x16u);
    }
  }
}

- (id)mf_objectForKey:()Goodies ofClass:
{
  id v7 = (id)objc_msgSend(a1, "objectForKey:");
  if (!v7)
  {
    id v7 = objc_alloc_init(a4);
    [a1 setObject:v7 forKey:a3];
  }
  return v7;
}

@end