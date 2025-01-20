@interface _SBHAddWidgetSheetCollectionView
- (BOOL)containsInteractiveUIControls;
- (BOOL)touchesShouldCancelInContentView:(id)a3;
- (void)setContainsInteractiveUIControls:(BOOL)a3;
@end

@implementation _SBHAddWidgetSheetCollectionView

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  id v4 = a3;
  if ([(_SBHAddWidgetSheetCollectionView *)self containsInteractiveUIControls])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_SBHAddWidgetSheetCollectionView;
    BOOL v5 = [(_SBHAddWidgetSheetCollectionView *)&v7 touchesShouldCancelInContentView:v4];
  }

  return v5;
}

- (BOOL)containsInteractiveUIControls
{
  return self->_containsInteractiveUIControls;
}

- (void)setContainsInteractiveUIControls:(BOOL)a3
{
  self->_containsInteractiveUIControls = a3;
}

@end