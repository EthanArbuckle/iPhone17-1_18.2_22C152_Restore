@interface NSArray(TVMLKitAdditions)
- (id)tv_arrayByMappingObjectsUsingBlock:()TVMLKitAdditions;
- (id)tv_randomizedArray;
@end

@implementation NSArray(TVMLKitAdditions)

- (id)tv_randomizedArray
{
  uint64_t v2 = [a1 count];
  if (v2)
  {
    unsigned int v3 = v2;
    v4 = [MEMORY[0x263EFF980] arrayWithArray:a1];
    if (v4)
    {
      uint64_t v5 = v3 - 1;
      if (v3 != 1)
      {
        do
        {
          if (_TVGetUpTimeMicros_onceToken != -1) {
            dispatch_once(&_TVGetUpTimeMicros_onceToken, &__block_literal_global_11);
          }
          unint64_t v6 = (unint64_t)(*(double *)&_TVGetUpTimeMicros_sTimerToMicrosMultiplier * (double)mach_absolute_time());
          uint64_t v7 = (arc4random() + v6) % v3;
          v8 = [v4 objectAtIndex:v7];
          v9 = [v4 objectAtIndex:v5];
          [v4 replaceObjectAtIndex:v7 withObject:v9];
          [v4 replaceObjectAtIndex:v5 withObject:v8];

          --v3;
          --v5;
        }
        while (v5);
      }
      v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v4];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = [MEMORY[0x263EFF8C0] array];
  }
  return v10;
}

- (id)tv_arrayByMappingObjectsUsingBlock:()TVMLKitAdditions
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a1, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __64__NSArray_TVMLKitAdditions__tv_arrayByMappingObjectsUsingBlock___block_invoke;
  v13 = &unk_264BA6DA0;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateObjectsUsingBlock:&v10];
  v8 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v6, v10, v11, v12, v13);

  return v8;
}

@end