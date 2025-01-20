@interface UIInputViewSetPlacement_FloatingAssistantApplicatorForNonKeyboard
- (BOOL)shouldApplyOriginChange;
- (UIEdgeInsets)inputAssistantPadding;
- (id)initForOwner:(id)a3 withPlacement:(id)a4;
- (void)invalidate;
@end

@implementation UIInputViewSetPlacement_FloatingAssistantApplicatorForNonKeyboard

- (id)initForOwner:(id)a3 withPlacement:(id)a4
{
  id v6 = a3;
  v7 = +[UIInputViewSetPlacementWrapper placementWithPlacement:a4];
  v10.receiver = self;
  v10.super_class = (Class)UIInputViewSetPlacement_FloatingAssistantApplicatorForNonKeyboard;
  id v8 = [(UIInputViewSetPlacement_GenericApplicator *)&v10 initForOwner:v6 withPlacement:v7];

  return v8;
}

- (void)invalidate
{
  v3 = [(UIInputViewSetPlacement_FloatingAssistantApplicator *)self hostView];
  [v3 setCompact:0];

  v4.receiver = self;
  v4.super_class = (Class)UIInputViewSetPlacement_FloatingAssistantApplicatorForNonKeyboard;
  [(UIInputViewSetPlacement_FloatingAssistantApplicator *)&v4 invalidate];
}

- (UIEdgeInsets)inputAssistantPadding
{
  p_owner = &self->super.super.super._owner;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.super._owner);
  v5 = [WeakRetained placement];
  int v6 = [v5 isCompactAssistantView];

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_owner);
    uint64_t v8 = [v7 containerView];
    [(id)v8 frame];
    double v10 = v9;

    id v11 = objc_loadWeakRetained((id *)p_owner);
    v12 = [v11 placement];
    objc_opt_class();
    LOBYTE(v8) = objc_opt_isKindOfClass();

    if (v8)
    {
      double v13 = -16.0;
      double v14 = v10 + -75.0 + -16.0;
    }
    else
    {
      double v13 = 91.0 - v10;
      double v14 = 16.0;
    }
    double v16 = 0.0;
    double v15 = 0.0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIInputViewSetPlacement_FloatingAssistantApplicatorForNonKeyboard;
    [(UIInputViewSetPlacement_GenericApplicator *)&v17 inputAssistantPadding];
  }
  result.right = v13;
  result.bottom = v16;
  result.left = v14;
  result.top = v15;
  return result;
}

- (BOOL)shouldApplyOriginChange
{
  return 0;
}

@end