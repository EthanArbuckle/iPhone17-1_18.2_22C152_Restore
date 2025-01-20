@interface _UIStatusBarDisplayableContainerView
- (UIView)subviewForBaselineAlignment;
- (void)applyStyleAttributes:(id)a3;
- (void)setSubviewForBaselineAlignment:(id)a3;
@end

@implementation _UIStatusBarDisplayableContainerView

- (void)applyStyleAttributes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(UIView *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 applyStyleAttributes:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (UIView)subviewForBaselineAlignment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subviewForBaselineAlignment);
  return (UIView *)WeakRetained;
}

- (void)setSubviewForBaselineAlignment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end