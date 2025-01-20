@interface CACElementNamesOverlayViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (NSArray)items;
- (int64_t)zOrder;
- (void)loadView;
- (void)setItems:(id)a3;
@end

@implementation CACElementNamesOverlayViewController

- (void)loadView
{
  id v5 = (id)objc_opt_new();
  v3 = objc_opt_new();
  [v3 setItemBackgroundViewCreationHandler:&__block_literal_global_12];
  [v5 setStyleProvider:v3];
  v4 = CACLogGeneral();
  [v5 setLoggingFacility:v4];

  [(CACElementNamesOverlayViewController *)self setView:v5];
}

id __48__CACElementNamesOverlayViewController_loadView__block_invoke()
{
  v0 = objc_opt_new();
  return v0;
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  id v5 = [(CACElementNamesOverlayViewController *)self view];
  [v5 setItems:v4];
}

- (NSArray)items
{
  v2 = [(CACElementNamesOverlayViewController *)self view];
  v3 = [v2 items];

  return (NSArray *)v3;
}

- (int64_t)zOrder
{
  return 10;
}

- (BOOL)isOverlay
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end