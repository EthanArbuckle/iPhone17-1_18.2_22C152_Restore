@interface UIViewController(PLNavigationControllerInterface)
- (uint64_t)uiipc_filterForMediaTypes:()PLNavigationControllerInterface;
- (uint64_t)uiipc_imagePickerOptions;
- (uint64_t)uiipc_useTelephonyUI;
- (void)uiipc_imagePickerController;
@end

@implementation UIViewController(PLNavigationControllerInterface)

- (uint64_t)uiipc_filterForMediaTypes:()PLNavigationControllerInterface
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t result = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (result)
  {
    uint64_t v5 = result;
    int v6 = 0;
    int v7 = 0;
    uint64_t v8 = *(void *)v15;
    v9 = (void *)*MEMORY[0x1E4F44400];
    v10 = (void *)*MEMORY[0x1E4F44448];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(a3);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqualToString:", objc_msgSend(v9, "identifier"))) {
          int v6 = 1;
        }
        else {
          v7 |= objc_msgSend(v12, "isEqualToString:", objc_msgSend(v10, "identifier"));
        }
      }
      uint64_t v5 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
    if (v7) {
      unsigned int v13 = 2;
    }
    else {
      unsigned int v13 = 0;
    }
    if (v6) {
      return (v6 & v7 & 1) == 0;
    }
    else {
      return v13;
    }
  }
  return result;
}

- (uint64_t)uiipc_useTelephonyUI
{
  v1 = objc_msgSend(a1, "uiipc_imagePickerOptions");
  v2 = (void *)[v1 objectForKey:*MEMORY[0x1E4F44090]];
  return [v2 BOOLValue];
}

- (uint64_t)uiipc_imagePickerOptions
{
  v1 = objc_msgSend(a1, "uiipc_imagePickerController");
  return [v1 _properties];
}

- (void)uiipc_imagePickerController
{
  for (uint64_t i = (void *)[a1 parentViewController]; i; uint64_t i = objc_msgSend(i, "parentViewController"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
  }
  return i;
}

@end