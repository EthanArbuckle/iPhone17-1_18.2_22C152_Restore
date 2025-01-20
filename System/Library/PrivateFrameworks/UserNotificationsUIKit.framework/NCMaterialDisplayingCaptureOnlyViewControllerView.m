@interface NCMaterialDisplayingCaptureOnlyViewControllerView
- (void)setNeedsLayout;
@end

@implementation NCMaterialDisplayingCaptureOnlyViewControllerView

- (void)setNeedsLayout
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)NCMaterialDisplayingCaptureOnlyViewControllerView;
  [(NCMaterialDisplayingCaptureOnlyViewControllerView *)&v12 setNeedsLayout];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(NCMaterialDisplayingCaptureOnlyViewControllerView *)self subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setNeedsLayout];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

@end