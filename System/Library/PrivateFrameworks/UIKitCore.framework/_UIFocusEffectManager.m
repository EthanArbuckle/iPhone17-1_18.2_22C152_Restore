@interface _UIFocusEffectManager
- (UIFocusItem)focusedItem;
- (_UIFocusHaloView)haloView;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_observeFocusedItemGeometryForItem:(id)a3;
- (void)moveFocusToItem:(id)a3;
- (void)setFocusedItem:(id)a3;
@end

@implementation _UIFocusEffectManager

- (void)moveFocusToItem:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (!v5) {
    goto LABEL_12;
  }
  v7 = _UIFocusEnvironmentContainingView(v5);
  uint64_t v8 = [v7 _window];
  if (!v8)
  {

    goto LABEL_12;
  }
  v9 = (void *)v8;
  v10 = _UIFocusItemHaloEffect(v6);

  if (!v10)
  {
LABEL_12:
    [(_UIFocusEffectManager *)self _observeFocusedItemGeometryForItem:0];
    v19 = [(_UIFocusEffectManager *)self haloView];
    [v19 removeFromSuperview];

    goto LABEL_13;
  }
  v11 = [v10 _shape];
  if (!v11)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"_UIFocusEffectManager.m" lineNumber:40 description:@"Expected a nonnull shape for a resolved focus effect."];
  }
  v12 = [v10 containerView];
  if (!v12)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"_UIFocusEffectManager.m" lineNumber:43 description:@"Expected a nonnull container view for a resolved focus effect."];
  }
  v13 = [v10 _shapeCoordinateSpace];
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"_UIFocusEffectManager.m" lineNumber:46 description:@"Expected a nonnull shape coordinate space for a resolved focus effect."];
  }
  v14 = [v11 shapeConvertedFromCoordinateSpace:v13 toCoordinateSpace:v12];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __41___UIFocusEffectManager_moveFocusToItem___block_invoke;
  v23[3] = &unk_1E52DF078;
  v23[4] = self;
  id v24 = v10;
  id v15 = v6;
  id v25 = v15;
  id v26 = v12;
  id v27 = v14;
  id v16 = v14;
  id v17 = v12;
  id v18 = v10;
  +[UIView performWithoutAnimation:v23];
  [(_UIFocusEffectManager *)self _observeFocusedItemGeometryForItem:v15];

LABEL_13:
}

- (void)_observeFocusedItemGeometryForItem:(id)a3
{
  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_focusedItem);
    int IsKindOfUIView = _IsKindOfUIView((uint64_t)v6);

    if (IsKindOfUIView)
    {
      uint64_t v8 = objc_loadWeakRetained((id *)&self->_focusedItem);
      -[UIView _removeGeometryChangeObserver:](v8, self);
    }
    objc_storeWeak((id *)&self->_focusedItem, obj);
    int v9 = _IsKindOfUIView((uint64_t)obj);
    id v5 = obj;
    if (v9)
    {
      -[UIView _addGeometryChangeObserver:](obj, self);
      id v5 = obj;
    }
  }
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  id v5 = [(_UIFocusEffectManager *)self focusedItem];
  [(_UIFocusEffectManager *)self moveFocusToItem:v5];
}

- (_UIFocusHaloView)haloView
{
  haloView = self->_haloView;
  if (!haloView)
  {
    v4 = (_UIFocusHaloView *)objc_opt_new();
    id v5 = self->_haloView;
    self->_haloView = v4;

    haloView = self->_haloView;
  }
  return haloView;
}

- (UIFocusItem)focusedItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusedItem);
  return (UIFocusItem *)WeakRetained;
}

- (void)setFocusedItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusedItem);
  objc_storeStrong((id *)&self->_haloView, 0);
}

@end