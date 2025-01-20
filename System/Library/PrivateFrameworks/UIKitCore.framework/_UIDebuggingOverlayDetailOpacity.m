@interface _UIDebuggingOverlayDetailOpacity
- (id)view;
- (void)_sliderValueChanged:(id)a3;
- (void)_updateForInspectedView:(id)a3;
@end

@implementation _UIDebuggingOverlayDetailOpacity

- (id)view
{
  return self->_view;
}

- (void)_updateForInspectedView:(id)a3
{
  p_inspectedView = &self->_inspectedView;
  id v5 = a3;
  objc_storeWeak((id *)p_inspectedView, v5);
  v6 = [v5 layer];

  [v6 opacity];
  int v8 = v7;

  v9 = objc_alloc_init(UISlider);
  [(UISlider *)v9 setMinimumValue:0.0];
  LODWORD(v10) = 1.0;
  [(UISlider *)v9 setMaximumValue:v10];
  LODWORD(v11) = v8;
  [(UISlider *)v9 setValue:v11];
  [(UIControl *)v9 addTarget:self action:sel__sliderValueChanged_ forControlEvents:4096];
  view = self->_view;
  self->_view = &v9->super.super;
}

- (void)_sliderValueChanged:(id)a3
{
  [a3 value];
  int v5 = v4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inspectedView);
  v6 = [WeakRetained layer];
  LODWORD(v7) = v5;
  [v6 setOpacity:v7];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inspectedView);
  objc_storeStrong((id *)&self->_view, 0);
}

@end