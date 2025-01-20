@interface TUISystemInputAssistantLayoutCompact
- (id)_buttonBarGroupSetForApplicationAssistantItem:(id)a3 withSystemInputAssistantItem:(id)a4 forAssistantView:(id)a5;
- (void)_layoutViewSet:(id)a3 forFixedCenterViewWidth:(double)a4 inBounds:(CGRect)a5 forAssistantView:(id)a6;
- (void)configureButtonBarsInViewSet:(id)a3 forApplicationAssistantItem:(id)a4 withSystemAssistantItem:(id)a5 withAssistantView:(id)a6;
- (void)invalidate:(id)a3;
@end

@implementation TUISystemInputAssistantLayoutCompact

- (void)invalidate:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)TUISystemInputAssistantLayoutCompact;
  id v3 = a3;
  [(TUISystemInputAssistantLayout *)&v16 invalidate:v3];
  v4 = objc_msgSend(v3, "leftButtonBar", v16.receiver, v16.super_class);
  [v4 minimumInterItemSpace];
  double v6 = v5;
  v7 = [v3 leftButtonBar];
  [v7 setEffectiveInterItemSpacing:v6];

  v8 = [v3 leftButtonBar];
  [v8 setButtonAlignment:0];

  v9 = [v3 rightButtonBar];
  [v9 minimumInterItemSpace];
  double v11 = v10;
  v12 = [v3 rightButtonBar];
  [v12 setEffectiveInterItemSpacing:v11];

  v13 = [v3 rightButtonBar];
  [v13 setButtonAlignment:2];

  v14 = [v3 rightButtonBar];
  [v14 setAlpha:1.0];

  v15 = [v3 centerView];

  [v15 setAlpha:1.0];
}

- (id)_buttonBarGroupSetForApplicationAssistantItem:(id)a3 withSystemInputAssistantItem:(id)a4 forAssistantView:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [v5 leadingBarButtonGroups];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [v5 leadingBarButtonGroups];
    v9 = [v8 firstObject];
    v13[0] = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    double v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  double v11 = objc_alloc_init(TUIButtonBarGroupSet);
  [(TUIButtonBarGroupSet *)v11 setTrailingButtonGroups:v10];
  [(TUIButtonBarGroupSet *)v11 setUnifiedButtonGroups:v10];

  return v11;
}

- (void)configureButtonBarsInViewSet:(id)a3 forApplicationAssistantItem:(id)a4 withSystemAssistantItem:(id)a5 withAssistantView:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  id v16 = [(TUISystemInputAssistantLayoutCompact *)self _buttonBarGroupSetForApplicationAssistantItem:a4 withSystemInputAssistantItem:a5 forAssistantView:v10];
  v12 = [v11 leftButtonBar];
  v13 = [v16 unifiedButtonGroups];
  objc_msgSend(v12, "setButtonGroups:animated:", v13, objc_msgSend(v10, "isTransitioning"));

  v14 = [v11 rightButtonBar];

  uint64_t v15 = [v10 isTransitioning];
  [v14 setButtonGroups:MEMORY[0x1E4F1CBF0] animated:v15];
}

- (void)_layoutViewSet:(id)a3 forFixedCenterViewWidth:(double)a4 inBounds:(CGRect)a5 forAssistantView:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  id v25 = a3;
  id v9 = a6;
  id v10 = [v25 viewSetContainer];
  int v11 = [v10 translatesAutoresizingMaskIntoConstraints];

  if (v11)
  {
    v12 = [v25 viewSetContainer];
    [v9 bounds];
    objc_msgSend(v12, "setFrame:");
  }
  else
  {
    [v9 resetContainerConstraints];
  }
  v13 = [v25 leftButtonBar];
  [v13 effectiveInterItemSpacing];
  double v15 = v14;
  id v16 = [v25 leftButtonBar];
  [v16 setEffectiveInterItemSpacing:v15];

  v17 = [v25 leftButtonBar];
  [v17 setButtonAlignment:1];

  double v18 = width * 0.5 + -32.5;
  double v19 = height + -50.0;
  v20 = [v25 leftButtonBar];
  objc_msgSend(v20, "setFrame:", v18, v19, 65.0, 50.0);
  v21 = [v25 rightButtonBar];
  objc_msgSend(v21, "setFrame:", v18, v19, 65.0, 50.0);
  v22 = [v25 centerView];
  objc_msgSend(v22, "setFrame:", v18, v19, 65.0, 50.0);

  v23 = [v25 centerView];
  [v23 setAlpha:0.0];

  v24 = [v25 rightButtonBar];
  [v24 setAlpha:0.0];
}

@end