@interface WFConfigurationParameterEditorHostingCellContext
- (MTVisualStylingProvider)fillProvider;
- (UIColor)overridingBackgroundColor;
- (void)setFillProvider:(id)a3;
- (void)setOverridingBackgroundColor:(id)a3;
@end

@implementation WFConfigurationParameterEditorHostingCellContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillProvider, 0);
  objc_storeStrong((id *)&self->_overridingBackgroundColor, 0);
}

- (void)setFillProvider:(id)a3
{
}

- (MTVisualStylingProvider)fillProvider
{
  return self->_fillProvider;
}

- (void)setOverridingBackgroundColor:(id)a3
{
}

- (UIColor)overridingBackgroundColor
{
  return self->_overridingBackgroundColor;
}

@end