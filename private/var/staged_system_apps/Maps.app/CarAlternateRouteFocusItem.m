@interface CarAlternateRouteFocusItem
- (BOOL)canBecomeFocused;
- (BOOL)isFocused;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)frame;
- (CarAlternateRouteFocusItem)initWithRoute:(id)a3 containingView:(id)a4 frame:(CGRect)a5 delegate:(id)a6;
- (GEOComposedRoute)route;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (UIFocusEnvironment)parentFocusEnvironment;
- (UIFocusItemContainer)focusItemContainer;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setFocused:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setNeedsFocusUpdate;
- (void)updateFocusIfNeeded;
@end

@implementation CarAlternateRouteFocusItem

- (CarAlternateRouteFocusItem)initWithRoute:(id)a3 containingView:(id)a4 frame:(CGRect)a5 delegate:(id)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CarAlternateRouteFocusItem;
  v16 = [(CarAlternateRouteFocusItem *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_route, v13);
    objc_storeWeak((id *)&v17->_containingView, v14);
    v17->_frame.origin.CGFloat x = x;
    v17->_frame.origin.CGFloat y = y;
    v17->_frame.size.CGFloat width = width;
    v17->_frame.size.CGFloat height = height;
    objc_storeWeak((id *)&v17->_delegate, v15);
  }

  return v17;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)CarAlternateRouteFocusItem;
  v3 = [(CarAlternateRouteFocusItem *)&v9 description];
  v4 = NSStringFromCGRect(self->_frame);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_route);
  v6 = [WeakRetained name];
  v7 = +[NSString stringWithFormat:@"%@ (%@, %@)", v3, v4, v6];

  return (NSString *)v7;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingView);

  return (UIFocusEnvironment *)WeakRetained;
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)&__NSArray0__struct;
}

- (UIFocusItemContainer)focusItemContainer
{
  return 0;
}

- (void)setNeedsFocusUpdate
{
  id v3 = +[UIFocusSystem focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
}

- (void)updateFocusIfNeeded
{
  id v2 = +[UIFocusSystem focusSystemForEnvironment:self];
  [v2 updateFocusIfNeeded];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5 = [a3 nextFocusedItem];
  [(CarAlternateRouteFocusItem *)self setFocused:v5 == self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained routeItemDidUpdateFocus:self];
}

- (GEOComposedRoute)route
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_route);

  return (GEOComposedRoute *)WeakRetained;
}

- (BOOL)isFocused
{
  return self->_focused;
}

- (void)setFocused:(BOOL)a3
{
  self->_focused = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_route);
  objc_destroyWeak((id *)&self->_containingView);

  objc_destroyWeak((id *)&self->_delegate);
}

@end