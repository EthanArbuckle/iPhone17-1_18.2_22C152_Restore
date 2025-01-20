@interface _UIHostedFocusSystemItemContainer
- (UICoordinateSpace)coordinateSpace;
- (_UIHostedFocusSystem)focusSystem;
- (_UIHostedFocusSystemItemContainer)initWithHostedFocusSystem:(id)a3;
- (id)focusItemsInRect:(CGRect)a3;
- (void)setFocusSystem:(id)a3;
@end

@implementation _UIHostedFocusSystemItemContainer

- (_UIHostedFocusSystemItemContainer)initWithHostedFocusSystem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIHostedFocusSystemItemContainer;
  v5 = [(_UIHostedFocusSystemItemContainer *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_UIHostedFocusSystemItemContainer *)v5 setFocusSystem:v4];
  }

  return v6;
}

- (UICoordinateSpace)coordinateSpace
{
  v2 = [(_UIHostedFocusSystemItemContainer *)self focusSystem];
  v3 = [v2 hostEnvironment];
  id v4 = [v3 focusItemContainer];
  v5 = [v4 coordinateSpace];

  return (UICoordinateSpace *)v5;
}

- (id)focusItemsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(_UIHostedFocusSystemItemContainer *)self focusSystem];
  objc_super v8 = [v7 delegateProxy];
  v9 = [v8 delegate];

  if (v9)
  {
    v10 = objc_msgSend(v9, "_focusSystem:focusItemsInRect:", v7, x, y, width, height);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (_UIHostedFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  return (_UIHostedFocusSystem *)WeakRetained;
}

- (void)setFocusSystem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end