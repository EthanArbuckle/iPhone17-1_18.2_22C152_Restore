@interface TUINavigationItemView
+ (id)tuiReuseIdentifier;
- (TUIRenderModelNavigationItem)renderModel;
- (TUIViewFactory)factory;
- (void)_buttonPressed:(id)a3;
- (void)_configureWithAXAttributes:(id)a3;
- (void)addDefaultButton;
- (void)addSubviewButton;
- (void)configureWithModel:(id)a3;
- (void)setFactory:(id)a3;
- (void)setRenderModel:(id)a3;
@end

@implementation TUINavigationItemView

+ (id)tuiReuseIdentifier
{
  return @"TUIReuseIdentifierNavigationBarItemView";
}

- (void)setFactory:(id)a3
{
  id obj = a3;
  p_factory = &self->_factory;
  id WeakRetained = objc_loadWeakRetained((id *)p_factory);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_factory, obj);
    v6 = obj;
  }
}

- (void)configureWithModel:(id)a3
{
  v5 = (TUIRenderModelNavigationItem *)a3;
  if (self->_renderModel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_renderModel, a3);
    v6 = [(TUIRenderModelNavigationItem *)self->_renderModel subviewsModel];
    if (v6) {
      [(TUINavigationItemView *)self addSubviewButton];
    }
    else {
      [(TUINavigationItemView *)self addDefaultButton];
    }

    v7 = [(TUIRenderModelNavigationItem *)v8 axAttributes];
    if (v7) {
      [(TUINavigationItemView *)self _configureWithAXAttributes:v7];
    }

    v5 = v8;
  }
}

- (void)addDefaultButton
{
  if ([(TUIRenderModelNavigationItem *)self->_renderModel buttonType]) {
    int64_t v3 = +[TUIControlView uiButtonTypeFromTUIButtonType:[(TUIRenderModelNavigationItem *)self->_renderModel buttonType]];
  }
  else {
    int64_t v3 = 1;
  }
  id v19 = +[TUIUIKitButton buttonWithType:v3];
  [v19 setRole:[self->_renderModel buttonRole]];
  [v19 addTarget:self action:"_buttonPressed:" forControlEvents:64];
  v4 = [(TUIRenderModelNavigationItem *)self->_renderModel title];
  [v19 setTitle:v4 forState:0];

  v5 = [(TUIRenderModelNavigationItem *)self->_renderModel attributedTitle];
  [v19 setAttributedTitle:v5 forState:0];

  v6 = [(TUIRenderModelNavigationItem *)self->_renderModel image];
  [v19 setImage:v6 forState:0];

  v7 = [(TUIRenderModelNavigationItem *)self->_renderModel menu];
  [v19 setTui_menu:v7];

  [v19 setEnabled:[self->_renderModel isEnabled]];
  [v19 setClipsToBounds:[self clipsToBounds]];
  [v19 sizeToFit];
  [v19 frame];
  [v19 alignmentRectForFrame:];
  double v9 = v8;
  double v11 = v10;
  [(TUIRenderModelNavigationItem *)self->_renderModel width];
  if (v12 > 0.0)
  {
    [(TUIRenderModelNavigationItem *)self->_renderModel width];
    double v9 = v13;
  }
  [(TUIRenderModelNavigationItem *)self->_renderModel minWidth];
  if (v14 > 0.0)
  {
    [(TUIRenderModelNavigationItem *)self->_renderModel minWidth];
    double v9 = fmax(v9, v15);
  }
  double y = CGPointZero.y;
  [(TUIRenderModelNavigationItem *)self->_renderModel maxWidth];
  if (v17 > 0.0)
  {
    [(TUIRenderModelNavigationItem *)self->_renderModel maxWidth];
    double v9 = fmin(v9, v18);
  }
  -[TUINavigationItemView setFrame:](self, "setFrame:", CGPointZero.x, y, v9, v11);
  [v19 frameForAlignmentRect:CGPointZero.x, y, v9, v11];
  [v19 setFrame:];
  [(TUINavigationItemView *)self addSubview:v19];
  [(TUINavigationItemView *)self verifyHierarchyForSubview:v19];
}

- (void)addSubviewButton
{
  int64_t v3 = [(TUIRenderModelNavigationItem *)self->_renderModel subviewsModel];
  [v3 size];
  -[TUINavigationItemView setFrame:](self, "setFrame:", 0.0, 0.0, v4, v5);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);
  [WeakRetained viewFactoryPrepareToReuseHost:self];

  if (v3)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_factory);

    if (v7)
    {
      [v3 prepare];
      char v19 = 0;
      id v8 = objc_loadWeakRetained((id *)&self->_factory);
      double v9 = [v3 configureSubviewsWithFactory:v8 outsets:self host:0 overrides:&v19 usedOverrides:0 UUID:0 uid:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];

      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          double v14 = 0;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            -[TUINavigationItemView verifyHierarchyForSubview:](self, "verifyHierarchyForSubview:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v14), (void)v15);
            double v14 = (char *)v14 + 1;
          }
          while (v12 != v14);
          id v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
        }
        while (v12);
      }
    }
  }
}

- (void)_buttonPressed:(id)a3
{
  id v4 = [(TUINavigationItemView *)self renderModel];
  int64_t v3 = [v4 actionHandler];
  [v3 invoke:@"press" arguments:0];
}

- (void)_configureWithAXAttributes:(id)a3
{
  id v22 = a3;
  -[TUINavigationItemView setIsAccessibilityElement:](self, "setIsAccessibilityElement:", [v22 isAXElement]);
  id v4 = [v22 axIdentifier];

  if (v4)
  {
    double v5 = [v22 axIdentifier];
    [(TUINavigationItemView *)self setAccessibilityIdentifier:v5];
  }
  v6 = [v22 axLabel];

  if (v6)
  {
    id v7 = [v22 axLabel];
    [(TUINavigationItemView *)self setAccessibilityLabel:v7];
  }
  id v8 = [v22 axValue];

  if (v8)
  {
    double v9 = [v22 axValue];
    [(TUINavigationItemView *)self setAccessibilityValue:v9];
  }
  id v10 = [v22 axHint];

  if (v10)
  {
    id v11 = [v22 axHint];
    [(TUINavigationItemView *)self setAccessibilityHint:v11];
  }
  unint64_t v12 = (unint64_t)[(TUINavigationItemView *)self accessibilityTraits];
  if ([v22 axTouchContainer]) {
    [(TUINavigationItemView *)self setAccessibilityContainerType:4];
  }
  unsigned int v13 = [v22 axButton];
  UIAccessibilityTraits v14 = UIAccessibilityTraitButton;
  if (!v13) {
    UIAccessibilityTraits v14 = 0;
  }
  UIAccessibilityTraits v15 = v14 | v12;
  if ([v22 axImage]) {
    UIAccessibilityTraits v16 = UIAccessibilityTraitImage;
  }
  else {
    UIAccessibilityTraits v16 = 0;
  }
  unsigned int v17 = [v22 axHeading];
  UIAccessibilityTraits v18 = UIAccessibilityTraitHeader;
  if (!v17) {
    UIAccessibilityTraits v18 = 0;
  }
  UIAccessibilityTraits v19 = v15 | v16 | v18;
  unsigned int v20 = [v22 axToggle];
  UIAccessibilityTraits v21 = UIAccessibilityTraitToggleButton;
  if (!v20) {
    UIAccessibilityTraits v21 = 0;
  }
  [(TUINavigationItemView *)self setAccessibilityTraits:v19 | v21];
}

- (TUIViewFactory)factory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_factory);

  return (TUIViewFactory *)WeakRetained;
}

- (TUIRenderModelNavigationItem)renderModel
{
  return self->_renderModel;
}

- (void)setRenderModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModel, 0);

  objc_destroyWeak((id *)&self->_factory);
}

@end