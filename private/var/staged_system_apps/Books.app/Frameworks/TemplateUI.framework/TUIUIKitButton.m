@interface TUIUIKitButton
- (BOOL)_accessibilityRect:(CGRect)a3 equalToRect:(CGRect)a4;
- (BOOL)isStaticMenu;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (TUIButtonDelegate)tui_delegate;
- (TUIMenuModel)tui_menu;
- (UIEdgeInsets)computedTouchInsets;
- (UIEdgeInsets)touchInsets;
- (id)_accessibilityGetAXElementMatchFromArray:(id)a3;
- (id)_accessibilityUnderlyingElementForFocusItem;
- (id)backgroundColor;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)menuDataDidUpdate;
- (void)setBackgroundColor:(id)a3;
- (void)setTouchInsets:(UIEdgeInsets)a3;
- (void)setTui_delegate:(id)a3;
- (void)setTui_menu:(id)a3;
@end

@implementation TUIUIKitButton

- (id)backgroundColor
{
  if ([(TUIUIKitButton *)self buttonType])
  {
    v3 = [(TUIUIKitButton *)self configuration];
    v4 = [v3 baseBackgroundColor];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TUIUIKitButton;
    v4 = [(TUIUIKitButton *)&v6 backgroundColor];
  }

  return v4;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  if ([(TUIUIKitButton *)self buttonType])
  {
    if (v4)
    {
      v5 = [(TUIUIKitButton *)self configuration];
      objc_super v6 = v5;
      if (v5)
      {
        id v7 = v5;
      }
      else
      {
        id v7 = +[UIButtonConfiguration filledButtonConfiguration];
      }
      v8 = v7;

      [v8 setBaseBackgroundColor:v4];
      [(TUIUIKitButton *)self setConfiguration:v8];
    }
    else
    {
      [(TUIUIKitButton *)self setConfiguration:0];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TUIUIKitButton;
    [(TUIUIKitButton *)&v9 setBackgroundColor:v4];
  }
}

- (BOOL)isStaticMenu
{
  return 0;
}

- (void)setTui_menu:(id)a3
{
  v5 = (TUIMenuModel *)a3;
  p_tui_menu = (id *)&self->_tui_menu;
  tui_menu = self->_tui_menu;
  if (tui_menu != v5 && ![(TUIMenuModel *)tui_menu isEqual:v5])
  {
    objc_storeStrong((id *)&self->_tui_menu, a3);
    unsigned int v8 = [(TUIUIKitButton *)self isStaticMenu];
    id v9 = *p_tui_menu;
    if (v8)
    {
      id v10 = [v9 newUIMenuElement];
      [(TUIUIKitButton *)self setMenu:v10];
    }
    else
    {
      [(TUIUIKitButton *)self setContextMenuInteractionEnabled:v9 != 0];
    }
    -[TUIUIKitButton setShowsMenuAsPrimaryAction:](self, "setShowsMenuAsPrimaryAction:", [*p_tui_menu isPrimary]);
    v11 = [(TUIUIKitButton *)self contextMenuInteraction];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_181CCC;
    v12[3] = &unk_2572E0;
    v13 = v5;
    [v11 updateVisibleMenuWithBlock:v12];
  }
}

- (void)menuDataDidUpdate
{
  if ([(TUIUIKitButton *)self isStaticMenu])
  {
    id v3 = [(TUIMenuModel *)self->_tui_menu newUIMenuElement];
    [(TUIUIKitButton *)self setMenu:v3];
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  unsigned int v8 = self->_tui_menu;
  if ([(TUIUIKitButton *)self isStaticMenu])
  {
    v14.receiver = self;
    v14.super_class = (Class)TUIUIKitButton;
    id v9 = -[TUIUIKitButton contextMenuInteraction:configurationForMenuAtLocation:](&v14, "contextMenuInteraction:configurationForMenuAtLocation:", v7, x, y);
  }
  else if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_181EE0;
    v12[3] = &unk_257308;
    v13 = v8;
    id v9 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v12];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_tui_delegate);
    id v9 = [WeakRetained contextMenuConfigurationForButton:self point:x, y];
  }
  [v9 setPreferredMenuElementOrder:2];

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)TUIUIKitButton;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(TUIUIKitButton *)&v12 contextMenuInteraction:v10 willDisplayMenuForConfiguration:v9 animator:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tui_delegate);
  [WeakRetained button:contextMenuInteraction:willDisplayMenuForConfiguration:animator:self v10 v9 v8 [v12 receiver] [v12 super_class]];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)TUIUIKitButton;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(TUIUIKitButton *)&v12 contextMenuInteraction:v10 willEndForConfiguration:v9 animator:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tui_delegate);
  [WeakRetained button:contextMenuInteraction:willEndForConfiguration:animator:self, v10, v9, v8, v12.receiver, v12.super_class];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TUIUIKitButton;
  -[TUIUIKitButton hitTest:withEvent:](&v17, "hitTest:withEvent:", v7, x, y);
  id v8 = (TUIUIKitButton *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [(TUIUIKitButton *)v8 gestureRecognizers];
    if ([v9 count])
    {
LABEL_5:

      goto LABEL_6;
    }
    unsigned int v10 = -[TUIUIKitButton pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y);

    if (v10)
    {
      id v9 = v8;
      id v8 = self;
      goto LABEL_5;
    }
  }
LABEL_6:
  v11 = +[TUIDragController sharedInstance];
  uint64_t v12 = objc_opt_class();
  v13 = TUIPlatformAncestorOfClassAndProtocol(self, v12, &OBJC_PROTOCOL___TUIReusableRenderView);
  unsigned int v14 = +[TUIDragController viewSupportsDrag:v13];
  if ([v11 isDragging] && v14)
  {
    v15 = v13;

    id v8 = v15;
  }

  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(TUIUIKitButton *)self computedTouchInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(TUIUIKitButton *)self bounds];
  double v16 = v10 + v15;
  double v18 = v8 + v17;
  double v20 = v19 - (v10 + v14);
  double v22 = v21 - (v8 + v12);
  CGFloat v23 = x;
  CGFloat v24 = y;

  return CGRectContainsPoint(*(CGRect *)&v16, *(CGPoint *)&v23);
}

- (UIEdgeInsets)computedTouchInsets
{
  [(TUIUIKitButton *)self touchInsets];
  if (v4 == UIEdgeInsetsZero.left
    && v3 == UIEdgeInsetsZero.top
    && v6 == UIEdgeInsetsZero.right
    && v5 == UIEdgeInsetsZero.bottom)
  {
    [(TUIUIKitButton *)self bounds];
    CGFloat x = v18.origin.x;
    CGFloat y = v18.origin.y;
    CGFloat width = v18.size.width;
    CGFloat height = v18.size.height;
    double v14 = 44.0 - CGRectGetWidth(v18);
    if (v14 <= 0.0) {
      double v15 = 0.0;
    }
    else {
      double v15 = v14 * 0.5;
    }
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double v16 = 44.0 - CGRectGetHeight(v19);
    if (v16 <= 0.0) {
      double v17 = 0.0;
    }
    else {
      double v17 = v16 * 0.5;
    }
    double v5 = -v17;
    double v6 = -v15;
    double v4 = -v15;
    double v3 = -v17;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)_accessibilityUnderlyingElementForFocusItem
{
  uint64_t v3 = objc_opt_class();
  double v4 = [(TUIUIKitButton *)self _accessibilityFindAncestor:&stru_257348 startWithSelf:0];
  double v5 = [v4 _accessibilityViewController];
  double v6 = TUIDynamicCast(v3, v5);

  double v7 = [v6 topLevelAXElement];
  uint64_t v8 = objc_opt_class();
  double v9 = [v7 children];
  double v10 = TUIDynamicCast(v8, v9);

  double v11 = [(TUIUIKitButton *)self _accessibilityGetAXElementMatchFromArray:v10];
  double v12 = v11;
  if (!v11) {
    double v11 = self;
  }
  id v13 = v11;

  return v13;
}

- (id)_accessibilityGetAXElementMatchFromArray:(id)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v9, "isAccessibilityElement", (void)v27))
        {
          [(TUIUIKitButton *)self accessibilityFrame];
          double v11 = v10;
          double v13 = v12;
          double v15 = v14;
          double v17 = v16;
          [v9 accessibilityFrame];
          if (-[TUIUIKitButton _accessibilityRect:equalToRect:](self, "_accessibilityRect:equalToRect:", v11, v13, v15, v17, v18, v19, v20, v21))
          {
            id v25 = v9;
            goto LABEL_13;
          }
        }
        else
        {
          uint64_t v22 = objc_opt_class();
          CGFloat v23 = [v9 children];
          CGFloat v24 = TUIDynamicCast(v22, v23);

          id v25 = [(TUIUIKitButton *)self _accessibilityGetAXElementMatchFromArray:v24];

          if (v25) {
            goto LABEL_13;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }
  id v25 = 0;
LABEL_13:

  return v25;
}

- (BOOL)_accessibilityRect:(CGRect)a3 equalToRect:(CGRect)a4
{
  return vabdd_f64((double)(int)a3.origin.x, (double)(int)a4.origin.x) <= 1.0
      && vabdd_f64((double)(int)a3.origin.y, (double)(int)a4.origin.y) <= 1.0
      && vabdd_f64((double)(int)a3.size.width, (double)(int)a4.size.width) <= 1.0
      && vabdd_f64((double)(int)a3.size.height, (double)(int)a4.size.height) <= 1.0;
}

- (UIEdgeInsets)touchInsets
{
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double bottom = self->_touchInsets.bottom;
  double right = self->_touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (TUIMenuModel)tui_menu
{
  return self->_tui_menu;
}

- (TUIButtonDelegate)tui_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tui_delegate);

  return (TUIButtonDelegate *)WeakRetained;
}

- (void)setTui_delegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tui_delegate);

  objc_storeStrong((id *)&self->_tui_menu, 0);
}

@end