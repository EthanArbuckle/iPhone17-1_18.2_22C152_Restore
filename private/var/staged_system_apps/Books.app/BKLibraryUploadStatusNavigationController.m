@interface BKLibraryUploadStatusNavigationController
- (int64_t)preferredStatusBarStyle;
@end

@implementation BKLibraryUploadStatusNavigationController

- (int64_t)preferredStatusBarStyle
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(BKLibraryUploadStatusNavigationController *)self childViewControllers];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v6) preferredStatusBarStyle];
        if (v7)
        {
          int64_t v8 = (int64_t)v7;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  int64_t v8 = 0;
LABEL_11:

  return v8;
}

@end