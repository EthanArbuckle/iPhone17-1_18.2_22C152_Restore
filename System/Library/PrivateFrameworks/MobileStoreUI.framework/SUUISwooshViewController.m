@interface SUUISwooshViewController
- (CGRect)frameForItemAtIndex:(int64_t)a3;
- (SUUIClientContext)clientContext;
- (SUUIColorScheme)colorScheme;
- (SUUISwooshViewControllerDelegate)delegate;
- (id)indexPathsForVisibleItems;
- (id)popImageViewForItemAtIndex:(int64_t)a3;
- (void)setClientContext:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SUUISwooshViewController

- (CGRect)frameForItemAtIndex:(int64_t)a3
{
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)indexPathsForVisibleItems
{
  return 0;
}

- (id)popImageViewForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
}

- (SUUISwooshViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUISwooshViewControllerDelegate *)WeakRetained;
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

@end