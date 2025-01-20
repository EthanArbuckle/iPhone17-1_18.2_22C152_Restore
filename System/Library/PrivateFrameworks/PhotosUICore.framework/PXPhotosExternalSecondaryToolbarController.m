@interface PXPhotosExternalSecondaryToolbarController
- (BOOL)secondaryToolbarControllerToolbarRenderedExternally:(id)a3;
- (BOOL)secondaryToolbarControllerWantsToolbarVisible:(id)a3;
- (CGSize)secondaryToolbarControllerToolbarSize:(id)a3;
- (PXPhotosExternalSecondaryToolbarController)initWithContainerView:(id)a3;
- (UIEdgeInsets)secondaryToolbarControllerScrollableContentPadding:(id)a3;
- (UIEdgeInsets)secondaryToolbarControllerToolbarContentInsets:(id)a3;
- (UIEdgeInsets)secondaryToolbarControllerToolbarPadding:(id)a3;
- (double)secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:(id)a3;
- (int64_t)secondaryToolbarControllerToolbarPlacement:(id)a3;
@end

@implementation PXPhotosExternalSecondaryToolbarController

- (double)secondaryToolbarControllerMaximumAccessoryViewPaddingToContentView:(id)a3
{
  return 0.0;
}

- (BOOL)secondaryToolbarControllerWantsToolbarVisible:(id)a3
{
  return 1;
}

- (CGSize)secondaryToolbarControllerToolbarSize:(id)a3
{
  double v3 = 260.0;
  double v4 = 19.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)secondaryToolbarControllerToolbarRenderedExternally:(id)a3
{
  return 1;
}

- (int64_t)secondaryToolbarControllerToolbarPlacement:(id)a3
{
  return 2;
}

- (UIEdgeInsets)secondaryToolbarControllerScrollableContentPadding:(id)a3
{
  double v3 = *(double *)off_1E5DAAF10;
  double v4 = *((double *)off_1E5DAAF10 + 1);
  double v5 = *((double *)off_1E5DAAF10 + 2);
  double v6 = *((double *)off_1E5DAAF10 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)secondaryToolbarControllerToolbarPadding:(id)a3
{
}

- (UIEdgeInsets)secondaryToolbarControllerToolbarContentInsets:(id)a3
{
  double v3 = *(double *)off_1E5DAAF10;
  double v4 = *((double *)off_1E5DAAF10 + 1);
  double v5 = *((double *)off_1E5DAAF10 + 2);
  double v6 = *((double *)off_1E5DAAF10 + 3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (PXPhotosExternalSecondaryToolbarController)initWithContainerView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXPhotosExternalSecondaryToolbarController;
  return [(PXSecondaryToolbarController *)&v4 initWithContainerView:a3 styleGuideProvider:self];
}

@end