@interface CALayer(TSUEdgeAntialiasingUtility)
- (uint64_t)tsu_recursivelySetAllowsEdgeAntialiasing:()TSUEdgeAntialiasingUtility;
@end

@implementation CALayer(TSUEdgeAntialiasingUtility)

- (uint64_t)tsu_recursivelySetAllowsEdgeAntialiasing:()TSUEdgeAntialiasingUtility
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_msgSend(a1, "setAllowsEdgeAntialiasing:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = objc_msgSend(a1, "sublayers", 0);
  uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "tsu_recursivelySetAllowsEdgeAntialiasing:", a3);
      }
      while (v7 != v9);
      uint64_t result = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

@end