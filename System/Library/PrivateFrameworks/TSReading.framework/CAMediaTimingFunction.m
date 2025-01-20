@interface CAMediaTimingFunction
@end

@implementation CAMediaTimingFunction

uint64_t __69__CAMediaTimingFunction_TSDCAAnimationAdditions__TSD_valueAtPercent___block_invoke()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v0 = *MEMORY[0x263F15EB0];
  v21[0] = *MEMORY[0x263F15EA0];
  v21[1] = v0;
  uint64_t v1 = *MEMORY[0x263F15EC0];
  v21[2] = *MEMORY[0x263F15EB8];
  v21[3] = v1;
  v21[4] = *MEMORY[0x263F15EC8];
  v2 = (void *)[MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:5];
  uint64_t result = [v2 countByEnumeratingWithState:&v13 objects:v22 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      v8 = &TSD_valueAtPercent__s_TSDBezierPathsCacheArray[v5];
      uint64_t v12 = v5;
      v9 = &TSD_valueAtPercent__s_CAMediaTimingFunctionsCacheArray[v5];
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        id v10 = (id)[MEMORY[0x263F15808] functionWithName:*(void *)(*((void *)&v13 + 1) + 8 * v7)];
        [v10 getControlPointAtIndex:0 values:v20];
        [v10 getControlPointAtIndex:1 values:v19];
        [v10 getControlPointAtIndex:2 values:v18];
        [v10 getControlPointAtIndex:3 values:v17];
        v11 = objc_opt_new();
        objc_msgSend(v11, "moveToPoint:", v20[0], v20[1]);
        objc_msgSend(v11, "curveToPoint:controlPoint1:controlPoint2:", v17[0], v17[1], v19[0], v19[1], v18[0], v18[1]);
        v9[v7] = (uint64_t)v10;
        v8[v7++] = (uint64_t)v11;
      }
      while (v4 != v7);
      uint64_t result = [v2 countByEnumeratingWithState:&v13 objects:v22 count:16];
      uint64_t v4 = result;
      uint64_t v5 = v12 + v7;
    }
    while (result);
  }
  return result;
}

@end