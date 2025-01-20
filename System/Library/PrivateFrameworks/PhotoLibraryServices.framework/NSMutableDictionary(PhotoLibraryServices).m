@interface NSMutableDictionary(PhotoLibraryServices)
- (id)_pl_mutableDictionaryCreateAndInsertIfNeededForKey:()PhotoLibraryServices;
- (void)_pl_safeAddObject:()PhotoLibraryServices toMutableArrayForKey:;
- (void)_pl_setNonNilObject:()PhotoLibraryServices forKey:;
@end

@implementation NSMutableDictionary(PhotoLibraryServices)

- (id)_pl_mutableDictionaryCreateAndInsertIfNeededForKey:()PhotoLibraryServices
{
  id v4 = a3;
  id v5 = [a1 objectForKey:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [a1 setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)_pl_safeAddObject:()PhotoLibraryServices toMutableArrayForKey:
{
  id v8 = a3;
  id v6 = a4;
  if (v8)
  {
    id v7 = [a1 objectForKey:v6];
    if (!v7)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [a1 setObject:v7 forKey:v6];
    }
    [v7 addObject:v8];
  }
}

- (void)_pl_setNonNilObject:()PhotoLibraryServices forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

@end