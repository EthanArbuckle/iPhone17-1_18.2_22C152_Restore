@interface PXWidgetCompositionTilingControllerElement
- (BOOL)_didLoadContent;
- (id)contentTilingController;
- (void)_setDidLoadContent:(BOOL)a3;
@end

@implementation PXWidgetCompositionTilingControllerElement

- (void)_setDidLoadContent:(BOOL)a3
{
  self->__didLoadContent = a3;
}

- (BOOL)_didLoadContent
{
  return self->__didLoadContent;
}

- (id)contentTilingController
{
  v3 = [(PXWidgetCompositionElement *)self widget];
  v4 = [v3 contentTilingController];
  if (![(PXWidgetCompositionTilingControllerElement *)self _didLoadContent])
  {
    v5 = [(PXWidgetCompositionElement *)self scrollViewController];
    [v4 setScrollController:v5];

    [(PXWidgetCompositionTilingControllerElement *)self _setDidLoadContent:1];
  }

  return v4;
}

@end