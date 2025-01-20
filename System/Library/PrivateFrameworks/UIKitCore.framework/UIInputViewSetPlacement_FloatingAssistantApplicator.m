@interface UIInputViewSetPlacement_FloatingAssistantApplicator
+ (UIEdgeInsets)inputAccessoryPaddingForTraitCollection:(id)a3;
- (BOOL)shouldApplyOriginChange;
- (CGRect)popoverFrame;
- (TUIInputAssistantHostView)hostView;
- (UIEdgeInsets)inputAccessoryPadding;
- (void)applyChanges:(id)a3;
- (void)invalidate;
- (void)prepare;
- (void)setHostView:(id)a3;
- (void)setupHostViewIfNeeded;
@end

@implementation UIInputViewSetPlacement_FloatingAssistantApplicator

- (void)prepare
{
  v3.receiver = self;
  v3.super_class = (Class)UIInputViewSetPlacement_FloatingAssistantApplicator;
  [(UIInputViewSetPlacement_GenericApplicator *)&v3 prepare];
  [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self setupHostViewIfNeeded];
}

- (void)setupHostViewIfNeeded
{
  p_owner = &self->super.super._owner;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  id v19 = [WeakRetained hostView];

  id v5 = objc_loadWeakRetained((id *)p_owner);
  v6 = [v5 inputViewSet];

  v7 = [v6 inputAssistantView];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 window];
    v10 = [v19 window];

    if (v9 == v10)
    {
      id v11 = objc_loadWeakRetained((id *)p_owner);
      v12 = [v11 inputAssistantHostView];
      [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self setHostView:v12];

      v13 = [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self hostView];
      [v13 setSystemInputAssistantView:v8];
    }
  }
  v14 = [v6 inputAccessoryView];
  v15 = [v14 window];
  if (v15 && ([v14 isHidden] & 1) == 0)
  {
    char v16 = [v6 isInputAccessoryViewPlaceholder];

    if (v16) {
      goto LABEL_9;
    }
    id v17 = objc_loadWeakRetained((id *)p_owner);
    v18 = [v17 inputAssistantHostView];
    [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self setHostView:v18];

    v15 = [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self hostView];
    [v15 setInputAccessoryView:v14];
  }

LABEL_9:
}

- (void)applyChanges:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  v6 = [v4 objectForKey:@"Transform"];
  v7 = v6;
  memset(&v48, 0, sizeof(v48));
  if (v6)
  {
    [v6 CGAffineTransformValue];
  }
  else
  {
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v48.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v48.c = v8;
    *(_OWORD *)&v48.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  v9 = [WeakRetained inputViewSet];
  [v9 inputViewBounds];
  double v11 = v10;
  CGFloat v12 = v10 * 0.5;

  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeTranslation(&t2, 0.0, -(v11 * 0.5));
  CGAffineTransform t1 = v48;
  CGAffineTransformConcat(&v46, &t1, &t2);
  CGAffineTransformTranslate(&v47, &v46, 0.0, v12);
  v13 = (void *)[v4 mutableCopy];
  CGAffineTransform t1 = v47;
  v14 = [MEMORY[0x1E4F29238] valueWithCGAffineTransform:&t1];
  [v13 setValue:v14 forKey:@"Transform"];

  if ([(UIInputViewSetPlacement_FloatingAssistantApplicator *)self shouldApplyOriginChange])
  {
    v15 = [v4 objectForKey:@"Origin"];
    char v16 = v15;
    if (v15)
    {
      [v15 pointValue];
      -[NSLayoutConstraint setConstant:](self->super.super._horizontalConstraint, "setConstant:");
    }
  }
  else
  {
    [v13 removeObjectForKey:@"Origin"];
  }
  v43.receiver = self;
  v43.super_class = (Class)UIInputViewSetPlacement_FloatingAssistantApplicator;
  [(UIInputViewSetPlacement_GenericApplicator *)&v43 applyChanges:v13];
  id v17 = [v4 objectForKey:@"AlphaForAssistantBar"];
  if (v17
    || ([v4 objectForKey:@"Alpha"], (id v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18 = [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self hostView];
    id v19 = [v18 layer];
    [v19 setAllowsGroupOpacity:0];

    [v17 doubleValue];
    double v21 = v20;
    v22 = [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self hostView];
    [v22 setAlpha:v21];
  }
  v23 = [v4 objectForKey:@"TransformForAssistantBar"];
  if (v23
    || ([v4 objectForKey:@"Transform"], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v23 CGAffineTransformValue];
    v24 = [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self hostView];
    v42[0] = v42[3];
    v42[1] = v42[4];
    v42[2] = v42[5];
    [v24 setTransformForContent:v42];
  }
  v25 = [v4 valueForKey:@"IsCompact"];
  uint64_t v26 = [v25 BOOLValue];

  v27 = [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self hostView];
  [v27 setCompact:v26];

  v28 = [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self hostView];
  if (v28)
  {

    goto LABEL_17;
  }
  v33 = [WeakRetained inputViewSet];
  v34 = [v33 inputAssistantView];
  if (v34)
  {

LABEL_25:
    [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self setupHostViewIfNeeded];
    goto LABEL_26;
  }
  v37 = [WeakRetained inputViewSet];
  v38 = [v37 inputAccessoryView];

  if (v38) {
    goto LABEL_25;
  }
LABEL_17:
  uint64_t v29 = [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self hostView];
  if (v29)
  {
    v30 = (void *)v29;
    v31 = [WeakRetained inputViewSet];
    v32 = [v31 inputAssistantView];
    if (v32)
    {
    }
    else
    {
      v35 = [WeakRetained inputViewSet];
      v36 = [v35 inputAccessoryView];

      if (!v36) {
        [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self setHostView:0];
      }
    }
  }
LABEL_26:
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __68__UIInputViewSetPlacement_FloatingAssistantApplicator_applyChanges___block_invoke;
  v40[3] = &unk_1E52D9F70;
  id v41 = WeakRetained;
  id v39 = WeakRetained;
  +[UIView performWithoutAnimation:v40];
}

- (BOOL)shouldApplyOriginChange
{
  return 1;
}

- (void)invalidate
{
  v6.receiver = self;
  v6.super_class = (Class)UIInputViewSetPlacement_FloatingAssistantApplicator;
  [(UIInputViewSetPlacement_GenericApplicator *)&v6 invalidate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  [WeakRetained setHideInputAssistantBackdrop:0];

  id v4 = objc_loadWeakRetained((id *)&self->super.super._owner);
  [v4 setHideInputViewBackdrops:0];

  id v5 = objc_loadWeakRetained((id *)&self->super.super._owner);
  [v5 setHideInputView:0];

  [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self setHostView:0];
}

- (CGRect)popoverFrame
{
  p_owner = &self->super.super._owner;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  id v4 = [WeakRetained containerView];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v13 = objc_loadWeakRetained((id *)p_owner);
  v14 = [v13 hostView];
  [v14 frame];
  v37.origin.CGFloat x = v15;
  v37.origin.CGFloat y = v16;
  v37.size.CGFloat width = v17;
  v37.size.CGFloat height = v18;
  v33.origin.CGFloat x = v6;
  v33.origin.CGFloat y = v8;
  v33.size.CGFloat width = v10;
  v33.size.CGFloat height = v12;
  CGRect v34 = CGRectIntersection(v33, v37);
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;

  id v23 = objc_loadWeakRetained((id *)p_owner);
  v24 = [v23 containerView];
  [v24 bounds];
  CGFloat v26 = v25;

  id v27 = objc_loadWeakRetained((id *)p_owner);
  v28 = [v27 placement];
  if (([v28 isCompactAssistantView] & 1) != 0
    || (v35.origin.CGFloat x = x, v35.origin.y = y, v35.size.width = width, v35.size.height = height, CGRectIsEmpty(v35)))
  {
    CGFloat x = 0.0;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
  }
  else
  {
    CGFloat v26 = y;
  }

  double v29 = x;
  double v30 = v26;
  double v31 = width;
  double v32 = height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (UIEdgeInsets)inputAccessoryPadding
{
  objc_super v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v4 = [v3 visualModeManager];
  int v5 = [v4 windowingModeEnabled];

  p_owner = &self->super.super._owner;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._owner);
  CGFloat v8 = [WeakRetained placement];
  int v9 = [v8 isCompactAssistantView];

  int IsHidden = UIInputAssistantViewIsHidden();
  if (v5 && (v9 & 1) == 0 && IsHidden)
  {
    [(UIInputViewSetPlacement_GenericApplicator *)&v32 inputAccessoryPadding];
LABEL_8:
    double v20 = v11;
    double v22 = v12;
    double v24 = v13;
    double v26 = v14;
    goto LABEL_9;
  }
  if ((v9 | IsHidden) != 1)
  {
    [(UIInputViewSetPlacement_GenericApplicator *)&v31 inputAccessoryPadding];
    goto LABEL_8;
  }
  CGFloat v15 = objc_opt_class();
  id v16 = objc_loadWeakRetained((id *)p_owner);
  CGFloat v17 = [v16 hostView];
  CGFloat v18 = [v17 traitCollection];
  [v15 inputAccessoryPaddingForTraitCollection:v18];
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

LABEL_9:
  double v27 = v20;
  double v28 = v22;
  double v29 = v24;
  double v30 = v26;
  result.right = v30;
  result.bottom = v29;
  result.left = v28;
  result.top = v27;
  return result;
}

+ (UIEdgeInsets)inputAccessoryPaddingForTraitCollection:(id)a3
{
  +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:a3];
  double v4 = v3;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
    || (BOOL v5 = +[UIDevice _hasHomeButton], v6 = 14.0, v5))
  {
    double v6 = 0.0;
  }
  double v7 = v4 + v6;
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = 0.0;
  result.right = v10;
  result.bottom = v7;
  result.left = v9;
  result.top = v8;
  return result;
}

- (TUIInputAssistantHostView)hostView
{
  return self->_hostView;
}

- (void)setHostView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end