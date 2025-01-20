@interface UIInputViewSetPlacement_FloatingApplicator
- (BOOL)isEqual:(id)a3;
- (BOOL)isGesture:(id)a3 inDraggableView:(CGPoint)a4;
- (BOOL)isPopoverRequired;
- (BOOL)preBeginGesture:(id)a3 shouldBegin:(BOOL *)a4;
- (CGAffineTransform)scaledPopoverTransform;
- (CGRect)popoverFrame;
- (CGRect)popoverRectPlaceholder;
- (UIEdgeInsets)contentInsets;
- (UIKeyboardPopoverContainer)popover;
- (id)backdropContainer;
- (id)draggableView;
- (id)startingPropertiesFromPlacementProperties:(id)a3;
- (id)twoFingerDraggableView;
- (void)applyChanges:(id)a3;
- (void)invalidate;
- (void)invalidatePopover;
- (void)prepare;
- (void)setPopover:(id)a3;
- (void)setPopoverRectPlaceholder:(CGRect)a3;
@end

@implementation UIInputViewSetPlacement_FloatingApplicator

- (id)draggableView
{
  v2 = [(UIInputViewSetPlacement_FloatingApplicator *)self popover];
  v3 = [v2 affordance];

  return v3;
}

- (id)twoFingerDraggableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  v3 = [WeakRetained hostView];

  return v3;
}

- (id)backdropContainer
{
  v2 = [(UIInputViewSetPlacement_FloatingApplicator *)self popover];
  v3 = [v2 backdropParent];

  return v3;
}

- (BOOL)preBeginGesture:(id)a3 shouldBegin:(BOOL *)a4
{
  return 0;
}

- (BOOL)isGesture:(id)a3 inDraggableView:(CGPoint)a4
{
  return 1;
}

- (UIEdgeInsets)contentInsets
{
  +[UIKeyboardPopoverContainer contentInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isPopoverRequired
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  double v3 = [WeakRetained inputViewSet];
  double v4 = [v3 inputView];
  if (v4) {
    int v5 = [v3 isInputViewPlaceholder] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)applyChanges:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  v6 = [WeakRetained containerView];
  v7 = [v6 _window];

  if ([v7 _isTextEffectsWindow])
  {
    v8 = -[UIWindow _fbsScene](v7);

    if (v8)
    {
      v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v10 = [v9 visualModeManager];
      char v11 = [v10 shouldShowWithinAppWindow];

      if ((v11 & 1) == 0)
      {
        v12 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
        int v13 = [v12 oldPathForSnapshot];

        if (!v13) {
          goto LABEL_8;
        }
      }
      v14 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      int v15 = [v14 keyboardActive];

      if (v15)
      {
        v16 = [(UIInputViewSetPlacement_FloatingApplicator *)self popover];
        if (v16)
        {
        }
        else if ([(UIInputViewSetPlacement_FloatingApplicator *)self isPopoverRequired])
        {
          v25 = [UIKeyboardPopoverContainer alloc];
          id v26 = objc_loadWeakRetained((id *)&self->super.super._owner);
          v27 = [v26 containerView];
          id v28 = objc_loadWeakRetained((id *)&self->super.super._owner);
          v29 = -[UIKeyboardPopoverContainer initWithView:usingBackdropStyle:](v25, "initWithView:usingBackdropStyle:", v27, [v28 inputViewBackdropStyle]);
          [(UIInputViewSetPlacement_FloatingApplicator *)self setPopover:v29];
        }
      }
      else
      {
LABEL_8:
        [(UIInputViewSetPlacement_FloatingApplicator *)self invalidatePopover];
      }
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)UIInputViewSetPlacement_FloatingApplicator;
  [(UIInputViewSetPlacement_UndockedApplicator *)&v32 applyChanges:v4];
  v17 = [v4 objectForKey:@"Origin"];
  v18 = v17;
  if (v17)
  {
    [v17 pointValue];
    [v18 pointValue];
    -[NSLayoutConstraint setConstant:](self->super.super._horizontalConstraint, "setConstant:");
  }
  v19 = [v4 objectForKey:@"PopoverRect"];
  v20 = v19;
  if (v19)
  {
    [v19 rectValue];
    -[UIInputViewSetPlacement_FloatingApplicator setPopoverRectPlaceholder:](self, "setPopoverRectPlaceholder:");
  }
  if ([(UIInputViewSetPlacement_FloatingApplicator *)self isPopoverRequired])
  {
    v21 = [(UIInputViewSetPlacement_FloatingApplicator *)self popover];
    [v21 applyProperties:v4];
  }
  else
  {
    [(UIInputViewSetPlacement_FloatingApplicator *)self invalidatePopover];
  }
  id v22 = objc_loadWeakRetained((id *)&self->super.super._owner);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __59__UIInputViewSetPlacement_FloatingApplicator_applyChanges___block_invoke;
  v30[3] = &unk_1E52D9F70;
  id v31 = v22;
  id v23 = v22;
  +[UIView performWithoutAnimation:v30];
  v24 = [(UIInputViewSetPlacement_FloatingApplicator *)self popover];
  objc_msgSend(v24, "updateBackdropStyle:", objc_msgSend(v23, "inputViewBackdropStyle"));
}

- (void)prepare
{
  v13.receiver = self;
  v13.super_class = (Class)UIInputViewSetPlacement_FloatingApplicator;
  [(UIInputViewSetPlacement_GenericApplicator *)&v13 prepare];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  if ([(UIInputViewSetPlacement_FloatingApplicator *)self isPopoverRequired])
  {
    id v4 = [UIKeyboardPopoverContainer alloc];
    int v5 = [WeakRetained containerView];
    v6 = -[UIKeyboardPopoverContainer initWithView:usingBackdropStyle:](v4, "initWithView:usingBackdropStyle:", v5, [WeakRetained inputViewBackdropStyle]);
    [(UIInputViewSetPlacement_FloatingApplicator *)self setPopover:v6];

    v7 = [WeakRetained placement];
    v8 = [v7 applicatorInfoForOwner:WeakRetained];
    v9 = [(UIInputViewSetPlacement_FloatingApplicator *)self startingPropertiesFromPlacementProperties:v8];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__UIInputViewSetPlacement_FloatingApplicator_prepare__block_invoke;
    v11[3] = &unk_1E52D9F98;
    v11[4] = self;
    id v12 = v9;
    id v10 = v9;
    +[UIView performWithoutAnimation:v11];
  }
}

- (id)startingPropertiesFromPlacementProperties:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:");
    [v4 setObject:&unk_1ED3F5268 forKey:@"Alpha"];
    int v5 = (void *)MEMORY[0x1E4F29238];
    [(UIInputViewSetPlacement_FloatingApplicator *)self scaledPopoverTransform];
    v6 = [v5 valueWithCGAffineTransform:v9];
    [v4 setObject:v6 forKey:@"Transform"];
  }
  else
  {
    v11[0] = @"Alpha";
    v11[1] = @"Transform";
    v12[0] = &unk_1ED3F5268;
    v7 = (void *)MEMORY[0x1E4F29238];
    [(UIInputViewSetPlacement_FloatingApplicator *)self scaledPopoverTransform];
    v6 = [v7 valueWithCGAffineTransform:v10];
    v12[1] = v6;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  }

  return v4;
}

- (CGAffineTransform)scaledPopoverTransform
{
  UIEdgeInsets result = (CGAffineTransform *)_AXSReduceMotionReduceSlideTransitionsEnabled();
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  if (result)
  {
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v6;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  }
  else
  {
    *(_OWORD *)&v7.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v7.c = v6;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    return CGAffineTransformScale(retstr, &v7, 0.5, 0.5);
  }
  return result;
}

- (void)invalidatePopover
{
  double v3 = [(UIInputViewSetPlacement_FloatingApplicator *)self popover];

  if (v3)
  {
    id v4 = [(UIInputViewSetPlacement_FloatingApplicator *)self popover];
    [v4 invalidate];

    [(UIInputViewSetPlacement_FloatingApplicator *)self setPopover:0];
  }
}

- (void)invalidate
{
  v3.receiver = self;
  v3.super_class = (Class)UIInputViewSetPlacement_FloatingApplicator;
  [(UIInputViewSetPlacement_GenericApplicator *)&v3 invalidate];
  [(UIInputViewSetPlacement_FloatingApplicator *)self invalidatePopover];
}

- (CGRect)popoverFrame
{
  objc_super v3 = [(UIInputViewSetPlacement_FloatingApplicator *)self popover];

  if (v3)
  {
    id v4 = [(UIInputViewSetPlacement_FloatingApplicator *)self popover];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    [(UIInputViewSetPlacement_FloatingApplicator *)self popoverRectPlaceholder];
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
    double v12 = v16;
  }
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  double v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIInputViewSetPlacement_FloatingApplicator;
  unsigned int v5 = [(UIInputViewSetPlacement_GenericApplicator *)&v10 isEqual:v4];
  objc_opt_class();
  int v6 = objc_opt_isKindOfClass() ^ 1;
  char v7 = v6 & v5;
  if ((v6 & 1) == 0 && v5)
  {
    double v8 = [(UIInputViewSetPlacement_FloatingApplicator *)self popover];
    char v7 = v8 != 0;
  }
  return v7;
}

- (UIKeyboardPopoverContainer)popover
{
  return self->_popover;
}

- (void)setPopover:(id)a3
{
}

- (CGRect)popoverRectPlaceholder
{
  double x = self->_popoverRectPlaceholder.origin.x;
  double y = self->_popoverRectPlaceholder.origin.y;
  double width = self->_popoverRectPlaceholder.size.width;
  double height = self->_popoverRectPlaceholder.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPopoverRectPlaceholder:(CGRect)a3
{
  self->_popoverRectPlaceholder = a3;
}

- (void).cxx_destruct
{
}

@end