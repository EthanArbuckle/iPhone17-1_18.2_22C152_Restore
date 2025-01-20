@interface CALayer(CanvasLayerAdditions)
- (uint64_t)p_clearAllLayerDelegates;
@end

@implementation CALayer(CanvasLayerAdditions)

- (uint64_t)p_clearAllLayerDelegates
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [a1 delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    if ((result & 1) == 0) {
      return result;
    }
  }
  else
  {
    [a1 setDelegate:0];
  }
  v4 = (void *)[a1 sublayers];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "p_clearAllLayerDelegates");
      }
      while (v5 != v7);
      uint64_t result = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

@end