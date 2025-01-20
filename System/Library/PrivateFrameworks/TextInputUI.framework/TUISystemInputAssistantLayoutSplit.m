@interface TUISystemInputAssistantLayoutSplit
- (BOOL)usesUnifiedButtonBar;
- (TUISystemInputAssistantLayoutSplit)init;
- (double)leftSplitWidth;
- (double)rightSplitWidth;
- (void)configureButtonBarsInViewSet:(id)a3 forApplicationAssistantItem:(id)a4 withSystemAssistantItem:(id)a5 withAssistantView:(id)a6;
- (void)layoutViewSet:(id)a3 inBounds:(CGRect)a4 forAssistantView:(id)a5;
- (void)setLeftSplitWidth:(double)a3;
- (void)setRightSplitWidth:(double)a3;
@end

@implementation TUISystemInputAssistantLayoutSplit

- (void)setRightSplitWidth:(double)a3
{
  self->_rightSplitWidth = a3;
}

- (double)rightSplitWidth
{
  return self->_rightSplitWidth;
}

- (void)setLeftSplitWidth:(double)a3
{
  self->_leftSplitWidth = a3;
}

- (double)leftSplitWidth
{
  return self->_leftSplitWidth;
}

- (void)layoutViewSet:(id)a3 inBounds:(CGRect)a4 forAssistantView:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  id v8 = a3;
  v9 = [v8 leftButtonBar];
  [v9 setHidden:1];

  v10 = [v8 rightButtonBar];
  [v10 setHidden:0];

  [(TUISystemInputAssistantLayoutSplit *)self leftSplitWidth];
  double v12 = v11;
  v13 = [v8 centerView];
  objc_msgSend(v13, "setFrame:", 0.0, 0.0, v12, height);

  [(TUISystemInputAssistantLayoutSplit *)self rightSplitWidth];
  double v15 = v14 + -50.0;
  v16 = [v8 rightButtonBar];
  [v16 setButtonAlignment:2];

  id v17 = [v8 rightButtonBar];

  objc_msgSend(v17, "setFrame:", width - v15, 0.0, v15, height);
}

- (void)configureButtonBarsInViewSet:(id)a3 forApplicationAssistantItem:(id)a4 withSystemAssistantItem:(id)a5 withAssistantView:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v10 showsCenterView] ^ 1;
  double v15 = [v13 centerView];
  [v15 setHidden:v14];

  id v18 = [(TUISystemInputAssistantLayout *)self _buttonBarGroupSetForApplicationAssistantItem:v12 withSystemInputAssistantItem:v11 forAssistantView:v10];

  v16 = [v13 rightButtonBar];

  id v17 = [v18 unifiedButtonGroups];
  [v16 setButtonGroups:v17];
}

- (BOOL)usesUnifiedButtonBar
{
  return 1;
}

- (TUISystemInputAssistantLayoutSplit)init
{
  v5.receiver = self;
  v5.super_class = (Class)TUISystemInputAssistantLayoutSplit;
  v2 = [(TUISystemInputAssistantLayoutSplit *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(TUISystemInputAssistantLayoutSplit *)v2 setRightSplitWidth:260.0];
    [(TUISystemInputAssistantLayoutSplit *)v3 setLeftSplitWidth:260.0];
  }
  return v3;
}

@end