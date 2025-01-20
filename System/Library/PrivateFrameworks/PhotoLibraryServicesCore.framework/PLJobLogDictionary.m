@interface PLJobLogDictionary
@end

@implementation PLJobLogDictionary

void ___PLJobLogDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v7] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSLog((NSString *)@"# %@ %@ -> NSDATA[%lu]", *(void *)(a1 + 40), v7, [v5 length]);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        NSLog((NSString *)@"# %@ %@ -> {", *(void *)(a1 + 40), v7);
        _PLJobLogDictionary(v5, (*(_DWORD *)(a1 + 48) + 1), 0);
        NSLog((NSString *)@"# %@ }", *(void *)(a1 + 40), v6);
      }
      else
      {
        NSLog((NSString *)@"# %@ %@ -> %@", *(void *)(a1 + 40), v7, v5);
      }
    }
  }
}

@end