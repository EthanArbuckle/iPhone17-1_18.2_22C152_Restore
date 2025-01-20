@interface PUEditExtensionActivityViewController
- (BOOL)_shouldShowSystemActivityType:(id)a3;
- (BOOL)_shouldUseModernDesign;
- (BOOL)appWantsLargePreview;
- (BOOL)isPhotosOrCamera;
- (PUEditExtensionActivityViewControllerDelegate)editExtensionActivityViewControllerDelegate;
- (void)_performActivity:(id)a3;
- (void)setEditExtensionActivityViewControllerDelegate:(id)a3;
@end

@implementation PUEditExtensionActivityViewController

- (void).cxx_destruct
{
}

- (void)setEditExtensionActivityViewControllerDelegate:(id)a3
{
}

- (PUEditExtensionActivityViewControllerDelegate)editExtensionActivityViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editExtensionActivityViewControllerDelegate);
  return (PUEditExtensionActivityViewControllerDelegate *)WeakRetained;
}

- (void)_performActivity:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(PUEditExtensionActivityViewController *)self editExtensionActivityViewControllerDelegate];
    [v5 editExtensionActivityViewController:self didSelectActivity:v4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUEditExtensionActivityViewController;
    [(PUEditExtensionActivityViewController *)&v6 _performActivity:v4];
  }
}

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  return [a3 isEqualToString:@"com.apple.sharing.quick-note"] ^ 1;
}

- (BOOL)appWantsLargePreview
{
  return 0;
}

- (BOOL)isPhotosOrCamera
{
  return 0;
}

- (BOOL)_shouldUseModernDesign
{
  return 1;
}

@end