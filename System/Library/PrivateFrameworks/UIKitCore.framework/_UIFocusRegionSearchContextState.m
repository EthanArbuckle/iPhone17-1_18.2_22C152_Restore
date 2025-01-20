@interface _UIFocusRegionSearchContextState
+ (id)stateWithRegionContainer:(id)a3 focusSystem:(id)a4 clippingRect:(CGRect)a5;
- (CGRect)clippingRect;
- (UIFocusSystem)regionContainerFocusSystem;
- (_UIFocusRegionContainer)regionContainer;
- (_UIFocusRegionSearchContextState)initWithRegionContainer:(id)a3 focusSystem:(id)a4 clippingRect:(CGRect)a5;
@end

@implementation _UIFocusRegionSearchContextState

- (_UIFocusRegionSearchContextState)initWithRegionContainer:(id)a3 focusSystem:(id)a4 clippingRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v12 = a3;
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UIFocusRegionSearchContextState;
  v14 = [(_UIFocusRegionSearchContextState *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_regionContainer, a3);
    objc_storeStrong((id *)&v15->_regionContainerFocusSystem, a4);
    v15->_clippingRect.origin.CGFloat x = x;
    v15->_clippingRect.origin.CGFloat y = y;
    v15->_clippingRect.size.CGFloat width = width;
    v15->_clippingRect.size.CGFloat height = height;
  }

  return v15;
}

+ (id)stateWithRegionContainer:(id)a3 focusSystem:(id)a4 clippingRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_msgSend(objc_alloc((Class)a1), "initWithRegionContainer:focusSystem:clippingRect:", v12, v11, x, y, width, height);

  return v13;
}

- (_UIFocusRegionContainer)regionContainer
{
  return self->_regionContainer;
}

- (UIFocusSystem)regionContainerFocusSystem
{
  return self->_regionContainerFocusSystem;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionContainerFocusSystem, 0);
  objc_storeStrong((id *)&self->_regionContainer, 0);
}

@end