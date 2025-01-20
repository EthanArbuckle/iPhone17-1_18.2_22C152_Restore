@interface UIViewController(NAUIUIKitDebugging)
+ (uint64_t)recursiveDescription;
- (id)_recursiveDescriptionWithInset:()NAUIUIKitDebugging;
- (uint64_t)recursiveDescription;
@end

@implementation UIViewController(NAUIUIKitDebugging)

+ (uint64_t)recursiveDescription
{
  return [MEMORY[0x263F1CB68] _allDescriptions];
}

- (id)_recursiveDescriptionWithInset:()NAUIUIKitDebugging
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  v6 = [NSString stringWithFormat:@"%@    ", v4];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v7 = [a1 childViewControllers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) _recursiveDescriptionWithInset:v6];
        [v5 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  v13 = NSString;
  v14 = [a1 description];
  v15 = [a1 view];
  v16 = [v15 description];
  v17 = [v13 stringWithFormat:@"%@%@ view:%@", v4, v14, v16];

  if ([v5 count])
  {
    v18 = NSString;
    v19 = [v5 componentsJoinedByString:@"\n"];
    id v20 = [v18 stringWithFormat:@"%@\n%@", v17, v19];
  }
  else
  {
    id v20 = v17;
  }

  return v20;
}

- (uint64_t)recursiveDescription
{
  return [a1 _recursiveDescriptionWithInset:&stru_26D4E99A0];
}

@end