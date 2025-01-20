@interface UIAssistantBarRoundedButtonViewButton
- (UIColor)highlightedBackgroundColor;
- (UIColor)highlightedTitleColor;
- (UIColor)normalBackgroundColor;
- (UIColor)normalTitleColor;
- (id)_currentTitleColor;
- (void)_updateBackgroundAndTitleColor;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedBackgroundColor:(id)a3;
- (void)setHighlightedTitleColor:(id)a3;
- (void)setNormalBackgroundColor:(id)a3;
- (void)setNormalTitleColor:(id)a3;
@end

@implementation UIAssistantBarRoundedButtonViewButton

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIAssistantBarRoundedButtonViewButton;
  [(UIButton *)&v4 setHighlighted:a3];
  [(UIAssistantBarRoundedButtonViewButton *)self _updateBackgroundAndTitleColor];
}

- (id)_currentTitleColor
{
  if ([(UIControl *)self isHighlighted]) {
    [(UIAssistantBarRoundedButtonViewButton *)self highlightedTitleColor];
  }
  else {
  v3 = [(UIAssistantBarRoundedButtonViewButton *)self normalTitleColor];
  }
  return v3;
}

- (void)_updateBackgroundAndTitleColor
{
  if ([(UIControl *)self isHighlighted]) {
    [(UIAssistantBarRoundedButtonViewButton *)self highlightedBackgroundColor];
  }
  else {
  v3 = [(UIAssistantBarRoundedButtonViewButton *)self normalBackgroundColor];
  }
  [(UIView *)self setBackgroundColor:v3];

  id v5 = [(UIAssistantBarRoundedButtonViewButton *)self _currentTitleColor];
  objc_super v4 = [(UIButton *)self titleLabel];
  [v4 setTextColor:v5];
}

- (void)setNormalBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_normalBackgroundColor, a3);
  [(UIAssistantBarRoundedButtonViewButton *)self _updateBackgroundAndTitleColor];
}

- (void)setHighlightedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, a3);
  [(UIAssistantBarRoundedButtonViewButton *)self _updateBackgroundAndTitleColor];
}

- (void)setNormalTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_normalTitleColor, a3);
  [(UIAssistantBarRoundedButtonViewButton *)self _updateBackgroundAndTitleColor];
}

- (void)setHighlightedTitleColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedTitleColor, a3);
  [(UIAssistantBarRoundedButtonViewButton *)self _updateBackgroundAndTitleColor];
}

- (UIColor)normalBackgroundColor
{
  return self->_normalBackgroundColor;
}

- (UIColor)highlightedBackgroundColor
{
  return self->_highlightedBackgroundColor;
}

- (UIColor)normalTitleColor
{
  return self->_normalTitleColor;
}

- (UIColor)highlightedTitleColor
{
  return self->_highlightedTitleColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedTitleColor, 0);
  objc_storeStrong((id *)&self->_normalTitleColor, 0);
  objc_storeStrong((id *)&self->_highlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_normalBackgroundColor, 0);
}

@end