@interface UINavigationController(CommerceRemoteUIDelegateExtensions)
- (void)removeViewControllersAfter:()CommerceRemoteUIDelegateExtensions before:animated:;
@end

@implementation UINavigationController(CommerceRemoteUIDelegateExtensions)

- (void)removeViewControllersAfter:()CommerceRemoteUIDelegateExtensions before:animated:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  v10 = [a1 viewControllers];
  v11 = (void *)[v10 mutableCopy];

  uint64_t v12 = [v11 indexOfObject:v9];
  unint64_t v13 = [v11 indexOfObject:v8];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL || v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134218240;
      uint64_t v19 = v12;
      __int16 v20 = 2048;
      unint64_t v21 = v13;
      v15 = "unable to find initial (%lu) or final (%lu) view controller";
      v16 = v14;
      uint32_t v17 = 22;
LABEL_9:
      _os_log_impl(&dword_22C821000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, v17);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v13 <= v12 + 1)
  {
    v14 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      v15 = "no view controllers between initial and final view controllers";
      v16 = v14;
      uint32_t v17 = 2;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(v11, "removeObjectsInRange:");
  [a1 setViewControllers:v11 animated:a5];
LABEL_11:
}

@end