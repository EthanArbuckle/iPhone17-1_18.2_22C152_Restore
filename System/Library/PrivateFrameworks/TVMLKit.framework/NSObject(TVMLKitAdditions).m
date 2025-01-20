@interface NSObject(TVMLKitAdditions)
+ (id)tv_allowedLiteralJSONObjects;
- (BOOL)tv_superOfClass:()TVMLKitAdditions respondsToSelector:;
- (id)tv_JSCompatibleValue;
- (id)tv_associatedIKViewElement;
- (id)tv_toPropertiesJSDictionary;
- (void)tv_setAssociatedIKViewElement:()TVMLKitAdditions;
@end

@implementation NSObject(TVMLKitAdditions)

- (BOOL)tv_superOfClass:()TVMLKitAdditions respondsToSelector:
{
  for (i = (objc_class *)objc_opt_class(); i != a3; i = class_getSuperclass(i))
    ;
  Superclass = class_getSuperclass(a3);
  return class_getInstanceMethod(Superclass, a4) != 0;
}

- (id)tv_associatedIKViewElement
{
  return objc_getAssociatedObject(a1, "_TVObjectKeyViewElement");
}

- (void)tv_setAssociatedIKViewElement:()TVMLKitAdditions
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_setAssociatedObject(a1, "_TVObjectKeyViewElement", a3, (void *)0x301);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!a3 && (isKindOfClass & 1) != 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v6 = objc_msgSend(a1, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "tv_setAssociatedIKViewElement:", 0);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

+ (id)tv_allowedLiteralJSONObjects
{
  v2[4] = *MEMORY[0x263EF8340];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:4];
  return v0;
}

- (id)tv_JSCompatibleValue
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v3 = a1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v26 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v9 = [v3 objectForKey:v8];
          uint64_t v10 = objc_msgSend(v9, "tv_JSCompatibleValue");

          long long v11 = objc_msgSend(v8, "tv_JSCompatibleValue");
          if (v11) {
            BOOL v12 = v10 == 0;
          }
          else {
            BOOL v12 = 1;
          }
          if (!v12) {
            [v2 setObject:v10 forKey:v11];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v5);
    }
LABEL_25:

    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v3 = a1;
    uint64_t v13 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v3);
          }
          v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "tv_JSCompatibleValue", (void)v21);
          if (v17) {
            [v2 addObject:v17];
          }
        }
        uint64_t v14 = [v3 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v14);
    }
    goto LABEL_25;
  }
  v18 = objc_msgSend(MEMORY[0x263F8C6D0], "tv_allowedLiteralJSONObjects");
  if ([v18 containsObject:objc_opt_class()])
  {

LABEL_29:
    id v2 = a1;
    goto LABEL_31;
  }
  char v19 = [a1 conformsToProtocol:&unk_26E601F88];

  if (v19) {
    goto LABEL_29;
  }
  id v2 = 0;
LABEL_31:
  return v2;
}

- (id)tv_toPropertiesJSDictionary
{
  id v2 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  unsigned int outCount = 0;
  id v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = class_copyPropertyList(v3, &outCount);
  if (outCount)
  {
    uint64_t v5 = v4;
    for (unint64_t i = 0; i < outCount; ++i)
    {
      uint64_t v7 = [NSString stringWithCString:property_getName(v5[i]) encoding:4];
      uint64_t v8 = [a1 valueForKey:v7];
      uint64_t v9 = objc_msgSend(v8, "tv_JSCompatibleValue");

      if (v9) {
        [v2 setObject:v9 forKey:v7];
      }
    }
  }
  return v2;
}

@end