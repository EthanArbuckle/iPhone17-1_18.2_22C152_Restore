@interface UISwitchVisualElement
+ (BOOL)isFixedSize;
+ (CGSize)preferredContentSize;
+ (UIEdgeInsets)preferredAlignmentRectInsets;
- (BOOL)enabled;
- (CGSize)preferredContentSize;
- (NSString)title;
- (UIImpactFeedbackGenerator)impactFeedbackGenerator;
- (UISwitchControl)switchControl;
- (UISwitchVisualElement)initWithFrame:(CGRect)a3;
- (double)enabledAlpha;
- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabledAlpha:(double)a3;
- (void)setImpactFeedbackGenerator:(id)a3;
- (void)setSwitchControl:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation UISwitchVisualElement

- (void)setImpactFeedbackGenerator:(id)a3
{
}

- (UISwitchVisualElement)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UISwitchVisualElement;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UISwitchVisualElement *)v3 setEnabledAlpha:1.0];
    [(UISwitchVisualElement *)v4 setEnabled:1];
  }
  return v4;
}

- (void)setEnabledAlpha:(double)a3
{
  self->_enabledAlpha = a3;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = 0.5;
  if (a3) {
    double v5 = 1.0;
  }
  [(UIView *)self setAlpha:v5];
  self->_enabled = v3;
  [(UIView *)self setUserInteractionEnabled:v3];
}

+ (BOOL)isFixedSize
{
  return 1;
}

- (void)setSwitchControl:(id)a3
{
}

- (UISwitchControl)switchControl
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_switchControl);
  return (UISwitchControl *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_switchControl);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (CGSize)preferredContentSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (UIEdgeInsets)preferredAlignmentRectInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  if (([(id)objc_opt_class() isFixedSize] & 1) == 0)
  {
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)preferredContentSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 416, 1);
}

- (void)setTitle:(id)a3
{
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (double)enabledAlpha
{
  return self->_enabledAlpha;
}

@end