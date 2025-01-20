@interface SKUISwooshViewController
- (CGRect)frameForItemAtIndex:(int64_t)a3;
- (SKUIClientContext)clientContext;
- (SKUIColorScheme)colorScheme;
- (SKUISwooshViewControllerDelegate)delegate;
- (id)indexPathsForVisibleItems;
- (id)popImageViewForItemAtIndex:(int64_t)a3;
- (void)deselectAllItems;
- (void)indexPathsForVisibleItems;
- (void)setClientContext:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4;
- (void)unhideImages;
@end

@implementation SKUISwooshViewController

- (void)deselectAllItems
{
}

- (CGRect)frameForItemAtIndex:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUISwooshViewController frameForItemAtIndex:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)indexPathsForVisibleItems
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUISwooshViewController *)v2 indexPathsForVisibleItems];
      }
    }
  }
  return 0;
}

- (id)popImageViewForItemAtIndex:(int64_t)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUISwooshViewController popImageViewForItemAtIndex:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0;
}

- (void)setImage:(id)a3 forItemAtIndex:(int64_t)a4
{
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    if (v4) {
      -[SKUISwooshViewController setImage:forItemAtIndex:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

- (void)unhideImages
{
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SKUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
}

- (SKUISwooshViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUISwooshViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorScheme, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)frameForItemAtIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)indexPathsForVisibleItems
{
}

- (void)popImageViewForItemAtIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setImage:(uint64_t)a3 forItemAtIndex:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end