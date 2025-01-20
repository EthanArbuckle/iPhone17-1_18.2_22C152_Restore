@interface _SBUIWidgetViewController
- (CGSize)preferredViewSize;
- (NSString)widgetIdentifier;
- (_SBUIWidgetHost)widgetHost;
- (void)setWidgetHost:(id)a3;
- (void)setWidgetIdentifier:(id)a3;
@end

@implementation _SBUIWidgetViewController

- (_SBUIWidgetHost)widgetHost
{
  WeakRetained = objc_loadWeakRetained((id *)&self->_widgetHost);
  v4 = WeakRetained;
  if (!WeakRetained) {
    WeakRetained = self;
  }
  v5 = WeakRetained;

  return v5;
}

- (CGSize)preferredViewSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setWidgetIdentifier:(id)a3
{
}

- (void)setWidgetHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_widgetHost);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
}

@end