@interface WAKView(WebHTMLViewFileInternal)
- (uint64_t)_web_addDescendentWebHTMLViewsToArray:()WebHTMLViewFileInternal;
@end

@implementation WAKView(WebHTMLViewFileInternal)

- (uint64_t)_web_addDescendentWebHTMLViewsToArray:()WebHTMLViewFileInternal
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(a1, "subviews", 0);
  uint64_t result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [a3 addObject:v9];
        }
        objc_msgSend(v9, "_web_addDescendentWebHTMLViewsToArray:", a3);
        ++v8;
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

@end