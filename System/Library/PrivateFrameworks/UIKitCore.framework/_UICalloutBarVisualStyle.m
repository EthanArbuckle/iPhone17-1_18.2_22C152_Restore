@interface _UICalloutBarVisualStyle
- (UICalloutBar)calloutBar;
- (_UICalloutBarButtonMetrics)buttonMetrics;
- (_UICalloutBarMetrics)barMetrics;
- (_UICalloutBarVisualStyle)initWithCalloutBar:(id)a3;
@end

@implementation _UICalloutBarVisualStyle

- (_UICalloutBarVisualStyle)initWithCalloutBar:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UICalloutBarVisualStyle;
  v5 = [(_UICalloutBarVisualStyle *)&v17 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_calloutBar, v4);
    v7 = objc_alloc_init(_UICalloutBarMetrics);
    barMetrics = v6->_barMetrics;
    v6->_barMetrics = v7;

    if (dyld_program_sdk_at_least())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v6->_calloutBar);
      v10 = [WeakRetained traitCollection];
      v11 = [v10 preferredContentSizeCategory];
      if (UIContentSizeCategoryIsAccessibilityCategory(v11))
      {
        id v12 = objc_loadWeakRetained((id *)&v6->_calloutBar);
        [v12 textEffectsWindowSafeArea];
        [(_UICalloutBarMetrics *)v6->_barMetrics setIsVerticallyAligned:v13 <= 414.0];
      }
      else
      {
        [(_UICalloutBarMetrics *)v6->_barMetrics setIsVerticallyAligned:0];
      }
    }
    v14 = objc_alloc_init(_UICalloutBarButtonMetrics);
    buttonMetrics = v6->_buttonMetrics;
    v6->_buttonMetrics = v14;
  }
  return v6;
}

- (UICalloutBar)calloutBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_calloutBar);
  return (UICalloutBar *)WeakRetained;
}

- (_UICalloutBarMetrics)barMetrics
{
  return self->_barMetrics;
}

- (_UICalloutBarButtonMetrics)buttonMetrics
{
  return self->_buttonMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonMetrics, 0);
  objc_storeStrong((id *)&self->_barMetrics, 0);
  objc_destroyWeak((id *)&self->_calloutBar);
}

@end