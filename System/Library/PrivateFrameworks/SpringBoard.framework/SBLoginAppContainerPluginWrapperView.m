@interface SBLoginAppContainerPluginWrapperView
- (SBLoginAppContainerPluginWrapperView)initWithFrame:(CGRect)a3 overlayWrapperView:(id)a4 pluginView:(id)a5;
- (void)layoutSubviews;
@end

@implementation SBLoginAppContainerPluginWrapperView

- (SBLoginAppContainerPluginWrapperView)initWithFrame:(CGRect)a3 overlayWrapperView:(id)a4 pluginView:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBLoginAppContainerPluginWrapperView;
  v14 = -[SBLoginAppContainerPluginWrapperView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_overlayWrapperView, a4);
    objc_storeStrong((id *)&v15->_pluginView, a5);
    [(SBLoginAppContainerPluginWrapperView *)v15 addSubview:v12];
    [(SBLoginAppContainerPluginWrapperView *)v15 addSubview:v13];
  }

  return v15;
}

- (void)layoutSubviews
{
  [(SBLoginAppContainerPluginWrapperView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_overlayWrapperView, "setFrame:");
  pluginView = self->_pluginView;
  -[UIView setFrame:](pluginView, "setFrame:", v4, v6, v8, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginView, 0);
  objc_storeStrong((id *)&self->_overlayWrapperView, 0);
}

@end