@interface CATransformLayer(TSUEdgeAntialiasingUtility)
- (uint64_t)tsu_recursivelySetAllowsEdgeAntialiasing:()TSUEdgeAntialiasingUtility;
@end

@implementation CATransformLayer(TSUEdgeAntialiasingUtility)

- (uint64_t)tsu_recursivelySetAllowsEdgeAntialiasing:()TSUEdgeAntialiasingUtility
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = objc_msgSend(a1, "sublayers", 0);
  uint64_t result = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "tsu_recursivelySetAllowsEdgeAntialiasing:", a3);
      }
      while (v6 != v8);
      uint64_t result = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = result;
    }
    while (result);
  }
  return result;
}

@end