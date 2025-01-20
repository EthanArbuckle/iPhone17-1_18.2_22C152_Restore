@interface _UIContextMenuSmallPaletteCellShapeProvider
- (_UIContextMenuSmallPaletteCellLayout)layout;
- (id)resolvedShapeInContext:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation _UIContextMenuSmallPaletteCellShapeProvider

- (id)resolvedShapeInContext:(id)a3
{
  id v4 = a3;
  v5 = [(_UIContextMenuSmallPaletteCellShapeProvider *)self layout];
  [v5 _rectForHighlightContentShape];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = +[UIShape fixedRectShapeWithRect:cornerRadius:](UIShape, "fixedRectShapeWithRect:cornerRadius:", v7, v9, v11, v13, 8.0);
  v15 = [v14 resolvedShapeInContext:v4];

  return v15;
}

- (_UIContextMenuSmallPaletteCellLayout)layout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  return (_UIContextMenuSmallPaletteCellLayout *)WeakRetained;
}

- (void)setLayout:(id)a3
{
}

- (void).cxx_destruct
{
}

@end