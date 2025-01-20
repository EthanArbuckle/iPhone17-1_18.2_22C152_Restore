@interface SBLoginAppContainerView
- (CSBatteryChargingView)batteryChargingView;
- (SBLockScreenDeviceInformationTextView)deviceInformationTextView;
- (SBLoginAppContainerOverlayWrapperView)thermalWarningView;
- (SBLoginAppContainerView)initWithFrame:(CGRect)a3;
- (UIView)contentView;
- (UIView)pluginView;
- (_UILegibilitySettings)legibilitySettings;
- (void)_showOrHidePluginViewAppropriately;
- (void)layoutSubviews;
- (void)setBatteryChargingView:(id)a3;
- (void)setContentHidden:(BOOL)a3 forRequester:(id)a4;
- (void)setContentView:(id)a3;
- (void)setDeviceInformationTextView:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setPluginView:(id)a3;
- (void)setThermalWarningView:(id)a3;
@end

@implementation SBLoginAppContainerView

- (SBLoginAppContainerView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBLoginAppContainerView;
  v3 = -[SBLoginAppContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBLoginAppContainerView *)v3 setBackgroundColor:v4];

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    contentHiddenRequesters = v3->_contentHiddenRequesters;
    v3->_contentHiddenRequesters = v5;
  }
  return v3;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SBLoginAppContainerView;
  [(SBLoginAppContainerView *)&v11 layoutSubviews];
  [(SBLoginAppContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  -[SBLoginAppContainerOverlayWrapperView setFrame:](self->_thermalWarningView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_pluginView, "setFrame:", v4, v6, v8, v10);
  [(CSBatteryChargingView *)self->_batteryChargingView frame];
  -[CSBatteryChargingView setFrame:](self->_batteryChargingView, "setFrame:", v4, v6, v8, 150.0);
}

- (void)setBatteryChargingView:(id)a3
{
  id v9 = a3;
  p_batteryChargingView = &self->_batteryChargingView;
  batteryChargingView = self->_batteryChargingView;
  if (batteryChargingView) {
    [(CSBatteryChargingView *)batteryChargingView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_batteryChargingView, a3);
  if (*p_batteryChargingView)
  {
    -[SBLoginAppContainerView addSubview:](self, "addSubview:");
    double v7 = *p_batteryChargingView;
    double v8 = [(SBLoginAppContainerView *)self legibilitySettings];
    [(CSBatteryChargingView *)v7 setLegibilitySettings:v8];
  }
  [(SBLoginAppContainerView *)self setNeedsLayout];
  [(SBLoginAppContainerView *)self setNeedsDisplay];
}

- (void)setThermalWarningView:(id)a3
{
  id v6 = a3;
  thermalWarningView = self->_thermalWarningView;
  if (thermalWarningView) {
    [(SBLoginAppContainerOverlayWrapperView *)thermalWarningView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_thermalWarningView, a3);
  if (self->_thermalWarningView) {
    -[SBLoginAppContainerView addSubview:](self, "addSubview:");
  }
  [(SBLoginAppContainerView *)self _showOrHidePluginViewAppropriately];
  [(SBLoginAppContainerView *)self setNeedsLayout];
  [(SBLoginAppContainerView *)self setNeedsDisplay];
}

- (void)setPluginView:(id)a3
{
  id v6 = a3;
  pluginView = self->_pluginView;
  if (pluginView) {
    [(UIView *)pluginView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_pluginView, a3);
  if (self->_pluginView) {
    -[SBLoginAppContainerView addSubview:](self, "addSubview:");
  }
  [(SBLoginAppContainerView *)self _showOrHidePluginViewAppropriately];
  [(SBLoginAppContainerView *)self setNeedsLayout];
  [(SBLoginAppContainerView *)self setNeedsDisplay];
}

- (void)setContentView:(id)a3
{
  id v7 = a3;
  p_contentView = (id *)&self->_contentView;
  contentView = self->_contentView;
  if (contentView) {
    [(UIView *)contentView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_contentView, a3);
  if (*p_contentView) {
    -[SBLoginAppContainerView addSubview:](self, "addSubview:");
  }
  if ([(NSMutableSet *)self->_contentHiddenRequesters count]) {
    [*p_contentView setAlpha:0.0];
  }
  [(SBLoginAppContainerView *)self setNeedsLayout];
  [(SBLoginAppContainerView *)self setNeedsDisplay];
}

- (void)setContentHidden:(BOOL)a3 forRequester:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  int v6 = -[NSMutableSet containsObject:](self->_contentHiddenRequesters, "containsObject:");
  if (v4)
  {
    if (v6) {
      goto LABEL_8;
    }
    [(NSMutableSet *)self->_contentHiddenRequesters addObject:v8];
    double v7 = 0.0;
    goto LABEL_7;
  }
  if (v6)
  {
    [(NSMutableSet *)self->_contentHiddenRequesters removeObject:v8];
    if (![(NSMutableSet *)self->_contentHiddenRequesters count])
    {
      double v7 = 1.0;
LABEL_7:
      [(UIView *)self->_contentView setAlpha:v7];
    }
  }
LABEL_8:
}

- (void)_showOrHidePluginViewAppropriately
{
  double v2 = 0.0;
  if (!self->_thermalWarningView) {
    double v2 = 1.0;
  }
  [(UIView *)self->_pluginView setAlpha:v2];
}

- (void)setLegibilitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  id v5 = a3;
  [(CSBatteryChargingView *)self->_batteryChargingView setLegibilitySettings:v5];
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CSBatteryChargingView)batteryChargingView
{
  return self->_batteryChargingView;
}

- (SBLoginAppContainerOverlayWrapperView)thermalWarningView
{
  return self->_thermalWarningView;
}

- (SBLockScreenDeviceInformationTextView)deviceInformationTextView
{
  return self->_deviceInformationTextView;
}

- (void)setDeviceInformationTextView:(id)a3
{
}

- (UIView)pluginView
{
  return self->_pluginView;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_pluginView, 0);
  objc_storeStrong((id *)&self->_deviceInformationTextView, 0);
  objc_storeStrong((id *)&self->_thermalWarningView, 0);
  objc_storeStrong((id *)&self->_batteryChargingView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentHiddenRequesters, 0);
}

@end