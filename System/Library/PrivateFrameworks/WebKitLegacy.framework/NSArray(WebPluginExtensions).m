@interface NSArray(WebPluginExtensions)
- (void)_web_lowercaseStrings;
@end

@implementation NSArray(WebPluginExtensions)

- (void)_web_lowercaseStrings
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v3 = (void *)[a1 objectEnumerator];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v2, "addObject:", objc_msgSend(v5, "lowercaseString"));
      }
      v5 = (void *)[v3 nextObject];
    }
    while (v5);
  }
  return v2;
}

@end