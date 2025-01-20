@interface SFUnifiedBarButton
- (NSAttributedString)attributedTitle;
- (NSString)accessibilityIdentifier;
- (NSString)title;
- (SFUnifiedBarButton)initWithImage:(id)a3 action:(id)a4;
- (UIImage)image;
- (id)action;
- (id)view;
- (void)_performAction;
- (void)setAccessibilityIdentifier:(id)a3;
- (void)setAction:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFUnifiedBarButton

- (SFUnifiedBarButton)initWithImage:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFUnifiedBarButton;
  v8 = [(SFUnifiedBarButton *)&v15 init];
  if (v8)
  {
    v9 = objc_alloc_init(SFUnifiedBarButtonView);
    buttonView = v8->_buttonView;
    v8->_buttonView = v9;

    [(SFUnifiedBarButtonView *)v8->_buttonView addTarget:v8 action:sel__performAction forControlEvents:64];
    [(SFUnifiedBarButtonView *)v8->_buttonView setImage:v6];
    v11 = _Block_copy(v7);
    id action = v8->_action;
    v8->_id action = v11;

    v13 = v8;
  }

  return v8;
}

- (id)view
{
  return self->_buttonView;
}

- (UIImage)image
{
  return [(SFUnifiedBarButtonView *)self->_buttonView image];
}

- (void)setImage:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SFUnifiedBarButton;
  -[SFUnifiedBarItem setEnabled:](&v5, sel_setEnabled_);
  [(SFUnifiedBarButtonView *)self->_buttonView setEnabled:v3];
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)[(SFUnifiedBarButtonView *)self->_buttonView accessibilityIdentifier];
}

- (void)setAccessibilityIdentifier:(id)a3
{
  if (a3) {
    -[SFUnifiedBarButtonView setAccessibilityIdentifier:](self->_buttonView, "setAccessibilityIdentifier:");
  }
}

- (NSString)title
{
  v2 = [(SFUnifiedBarButtonView *)self->_buttonView _titleView];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  if (a3) {
    [(SFUnifiedBarButtonView *)self->_buttonView setTitle:a3 forState:0];
  }
}

- (NSAttributedString)attributedTitle
{
  v2 = [(SFUnifiedBarButtonView *)self->_buttonView _titleView];
  BOOL v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (void)setAttributedTitle:(id)a3
{
}

- (void)_performAction
{
  id action = (void (**)(id, SFUnifiedBarButton *))self->_action;
  if (action) {
    action[2](action, self);
  }
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);

  objc_storeStrong((id *)&self->_buttonView, 0);
}

@end