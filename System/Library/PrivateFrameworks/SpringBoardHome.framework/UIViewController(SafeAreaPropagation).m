@interface UIViewController(SafeAreaPropagation)
- (void)_sb_recursiveUpdateContentOverlayInsetsFromParentIfNecessary;
@end

@implementation UIViewController(SafeAreaPropagation)

- (void)_sb_recursiveUpdateContentOverlayInsetsFromParentIfNecessary
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [a1 _updateContentOverlayInsetsFromParentIfNecessary];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = objc_msgSend(a1, "childViewControllers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "_sb_recursiveUpdateContentOverlayInsetsFromParentIfNecessary");
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

@end