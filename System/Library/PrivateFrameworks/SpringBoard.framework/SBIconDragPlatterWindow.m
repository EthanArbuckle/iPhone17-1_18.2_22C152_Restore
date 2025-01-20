@interface SBIconDragPlatterWindow
- (id)_iconDragPreviewContainerView;
- (void)beginTrackingPlatterView:(id)a3;
- (void)stopTrackingPlatterView:(id)a3;
@end

@implementation SBIconDragPlatterWindow

- (id)_iconDragPreviewContainerView
{
  v2 = [(SBIconDragPlatterWindow *)self rootViewController];
  v3 = [v2 view];

  return v3;
}

- (void)beginTrackingPlatterView:(id)a3
{
  id v4 = a3;
  platterViews = self->_platterViews;
  id v9 = v4;
  if (!platterViews)
  {
    v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v7 = self->_platterViews;
    self->_platterViews = v6;

    id v4 = v9;
    platterViews = self->_platterViews;
  }
  [(NSHashTable *)platterViews addObject:v4];
  v8 = [(SBIconDragPlatterWindow *)self _iconDragPreviewContainerView];
  [v8 addSubview:v9];

  [(SBWindow *)self setHidden:0];
}

- (void)stopTrackingPlatterView:(id)a3
{
  id v4 = a3;
  [v4 removeFromSuperview];
  [(NSHashTable *)self->_platterViews removeObject:v4];

  BOOL v5 = [(NSHashTable *)self->_platterViews count] == 0;
  [(SBWindow *)self setHidden:v5];
}

- (void).cxx_destruct
{
}

@end