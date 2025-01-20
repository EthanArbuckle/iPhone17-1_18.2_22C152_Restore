@interface TVButton
+ (id)_buttonContentWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5;
- (BOOL)blurEnabled;
- (BOOL)isDisabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (IKViewElement)viewElement;
- (TVButton)initWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5;
- (TVButtonContent)buttonContent;
- (UIColor)highlightColor;
- (UILabel)textContentView;
- (UIView)overlayView;
- (_TVImageView)accessoryView;
- (_TVImageView)imageView;
- (_UIFloatingContentView)floatingView;
- (double)focusSizeIncrease;
- (id)backgroundColor;
- (id)playActionHandler;
- (id)selectActionHandler;
- (int64_t)backdropStyle;
- (void)_playButtonAction:(id)a3;
- (void)_selectButtonAction:(id)a3;
- (void)_setFocused:(BOOL)a3 animationCoordinator:(id)a4;
- (void)_updateBackgroundColorForState:(unint64_t)a3;
- (void)_updateFocusStateWithCoordinator:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setAccessoryView:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusSizeIncrease:(double)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageTrailsTextContent:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setPlayActionHandler:(id)a3;
- (void)setSelectActionHandler:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setTextContentView:(id)a3;
- (void)setViewElement:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)tv_setLayout:(id)a3;
- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3;
@end

@implementation TVButton

+ (id)_buttonContentWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5
{
  v5 = -[TVButtonContent initWithFrame:blurEffectStyle:blurEnabled:]([TVButtonContent alloc], "initWithFrame:blurEffectStyle:blurEnabled:", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v5;
}

- (TVButton)initWithFrame:(CGRect)a3 blurEffectStyle:(int64_t)a4 blurEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)TVButton;
  v7 = -[TVButton initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    v8 = objc_opt_class();
    [(TVButton *)v7 bounds];
    uint64_t v9 = objc_msgSend(v8, "_buttonContentWithFrame:blurEffectStyle:blurEnabled:", a4, v5);
    buttonContent = v7->_buttonContent;
    v7->_buttonContent = (TVButtonContent *)v9;

    [(TVButton *)v7 addSubview:v7->_buttonContent];
    [(TVButton *)v7 addTarget:v7 action:sel__selectButtonAction_ forEvents:64];
    [(TVButton *)v7 setCornerRadius:*(double *)&_kTVButtonDefaultCornerRadius];
  }
  return v7;
}

- (void)tv_setLayout:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TVButton;
  id v4 = a3;
  [(UIView *)&v5 tv_setLayout:v4];
  -[UIView tv_setLayout:](self->_buttonContent, "tv_setLayout:", v4, v5.receiver, v5.super_class);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[TVButtonContent sizeThatFits:](self->_buttonContent, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)TVButton;
  [(TVButton *)&v4 layoutSubviews];
  buttonContent = self->_buttonContent;
  [(TVButton *)self bounds];
  -[_UIFloatingContentView setFrame:](buttonContent, "setFrame:");
}

- (double)focusSizeIncrease
{
  [(TVButtonContent *)self->_buttonContent focusSizeIncrease];
  return result;
}

- (void)setFocusSizeIncrease:(double)a3
{
}

- (BOOL)isDisabled
{
  return [(TVButton *)self isEnabled] ^ 1;
}

- (void)setDisabled:(BOOL)a3
{
}

- (id)backgroundColor
{
  return [(TVButtonContent *)self->_buttonContent backgroundColor];
}

- (void)setBackgroundColor:(id)a3
{
  [(TVButtonContent *)self->_buttonContent setBackgroundColor:a3];
  uint64_t v4 = [(TVButton *)self state];
  [(TVButton *)self _updateBackgroundColorForState:v4];
}

- (void)setHighlightColor:(id)a3
{
  [(TVButtonContent *)self->_buttonContent setHighlightColor:a3];
  uint64_t v4 = [(TVButton *)self state];
  [(TVButton *)self _updateBackgroundColorForState:v4];
}

- (void)_updateBackgroundColorForState:(unint64_t)a3
{
}

- (void)setCornerRadius:(double)a3
{
}

- (void)setTextContentView:(id)a3
{
}

- (void)setImageView:(id)a3
{
}

- (void)setAccessoryView:(id)a3
{
}

- (void)setImageTrailsTextContent:(BOOL)a3
{
}

- (int64_t)backdropStyle
{
  return [(TVButtonContent *)self->_buttonContent backdropStyle];
}

- (BOOL)blurEnabled
{
  return [(TVButtonContent *)self->_buttonContent blurEnabled];
}

- (UILabel)textContentView
{
  return [(TVButtonContent *)self->_buttonContent textContentView];
}

- (_TVImageView)imageView
{
  return [(TVButtonContent *)self->_buttonContent imageView];
}

- (_TVImageView)accessoryView
{
  return [(TVButtonContent *)self->_buttonContent accessoryView];
}

- (_UIFloatingContentView)floatingView
{
  return (_UIFloatingContentView *)self->_buttonContent;
}

- (UIView)overlayView
{
  return [(TVButtonContent *)self->_buttonContent overlayView];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TVButton;
  id v6 = a4;
  id v7 = a3;
  [(TVButton *)&v9 didUpdateFocusInContext:v7 withAnimationCoordinator:v6];
  objc_msgSend(v7, "nextFocusedView", v9.receiver, v9.super_class);
  v8 = (TVButton *)objc_claimAutoreleasedReturnValue();

  [(TVButton *)self _setFocused:v8 == self animationCoordinator:v6];
}

- (void)updatePreferredFocusedViewStateForFocus:(BOOL)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = [(TVButton *)self traitCollection];
    if ([v5 userInterfaceStyle])
    {
      [v4 userInterfaceStyle];
      id v6 = [(TVButton *)self traitCollection];
      [v6 userInterfaceStyle];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)TVButton;
  [(TVButton *)&v7 traitCollectionDidChange:v4];
}

- (void)_selectButtonAction:(id)a3
{
  id v6 = a3;
  id v4 = [(TVButton *)self selectActionHandler];

  if (v4)
  {
    objc_super v5 = [(TVButton *)self selectActionHandler];
    ((void (**)(void, TVButton *))v5)[2](v5, self);
  }
  else
  {
    [(IKViewElement *)self->_viewElement tv_dispatchEvent:@"select" canBubble:1 isCancelable:1 extraInfo:0 targetResponder:v6 completionBlock:0];
  }
}

- (void)_playButtonAction:(id)a3
{
  id v6 = a3;
  id v4 = [(TVButton *)self playActionHandler];

  if (v4)
  {
    objc_super v5 = [(TVButton *)self playActionHandler];
    ((void (**)(void, TVButton *))v5)[2](v5, self);
  }
  else
  {
    [(IKViewElement *)self->_viewElement tv_dispatchEvent:@"play" canBubble:1 isCancelable:1 extraInfo:0 targetResponder:v6 completionBlock:0];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TVButton;
  -[TVButton setSelected:](&v5, sel_setSelected_);
  [(TVButton *)self setSelected:v3 animated:0];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TVButton;
  -[UIView setHighlighted:](&v5, sel_setHighlighted_);
  [(TVButton *)self setSelected:v3 animated:0];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TVButton;
  -[TVButton setEnabled:](&v5, sel_setEnabled_);
  [(TVButtonContent *)self->_buttonContent setEnabled:v3];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
}

- (void)_setFocused:(BOOL)a3 animationCoordinator:(id)a4
{
}

- (void)_updateFocusStateWithCoordinator:(id)a3
{
}

- (TVButtonContent)buttonContent
{
  return self->_buttonContent;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (void)setViewElement:(id)a3
{
}

- (id)selectActionHandler
{
  return self->_selectActionHandler;
}

- (void)setSelectActionHandler:(id)a3
{
}

- (id)playActionHandler
{
  return self->_playActionHandler;
}

- (void)setPlayActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playActionHandler, 0);
  objc_storeStrong(&self->_selectActionHandler, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_buttonContent, 0);
}

@end