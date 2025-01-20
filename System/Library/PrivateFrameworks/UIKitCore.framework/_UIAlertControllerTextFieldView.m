@interface _UIAlertControllerTextFieldView
- (UITextField)textField;
- (UIView)containerView;
- (_UIAlertControllerTextFieldView)initWithFrame:(CGRect)a3;
- (double)_borderWidth;
- (id)_textFieldFont;
- (void)_loadConstraints;
- (void)dealloc;
- (void)setContainerView:(id)a3;
@end

@implementation _UIAlertControllerTextFieldView

- (_UIAlertControllerTextFieldView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIAlertControllerTextFieldView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_UIAlertControllerTextField);
    textField = v3->_textField;
    v3->_textField = v4;

    [(_UIAlertControllerTextField *)v3->_textField setTextFieldView:v3];
    v6 = v3->_textField;
    v7 = [(_UIAlertControllerTextFieldView *)v3 _textFieldFont];
    [(UITextField *)v6 setFont:v7];

    [(UIView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_textField setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v3;
}

- (void)dealloc
{
  [(_UIAlertControllerTextField *)self->_textField setTextFieldView:0];
  v3.receiver = self;
  v3.super_class = (Class)_UIAlertControllerTextFieldView;
  [(UIView *)&v3 dealloc];
}

- (void)_loadConstraints
{
  if ([(NSArray *)self->_containerViewConstraints count])
  {
    [MEMORY[0x1E4F5B268] deactivateConstraints:self->_containerViewConstraints];
    containerViewConstraints = self->_containerViewConstraints;
    self->_containerViewConstraints = 0;
  }
  containerView = self->_containerView;
  if (containerView)
  {
    [(UIView *)containerView setTranslatesAutoresizingMaskIntoConstraints:0];
    _NSDictionaryOfVariableBindings(&cfstr_TextfieldConta.isa, self->_textField, self->_containerView, 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v5 = [MEMORY[0x1E4F1CA48] array];
    v6 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"H:|[_containerView]|" options:0 metrics:0 views:v10];
    [(NSArray *)v5 addObjectsFromArray:v6];

    v7 = [MEMORY[0x1E4F5B268] constraintsWithVisualFormat:@"V:|[_containerView]|" options:0 metrics:0 views:v10];
    [(NSArray *)v5 addObjectsFromArray:v7];

    v8 = self->_containerViewConstraints;
    self->_containerViewConstraints = v5;
    objc_super v9 = v5;

    [MEMORY[0x1E4F5B268] activateConstraints:self->_containerViewConstraints];
  }
}

- (double)_borderWidth
{
  [(UIView *)self _currentScreenScale];
  UIRoundToViewScale(self);
  return result;
}

- (id)_textFieldFont
{
  v2 = [off_1E52D39C0 preferredFontDescriptorWithTextStyle:@"UICTFontTextStyleFootnote" addingSymbolicTraits:0 options:2];
  objc_super v3 = [off_1E52D39B8 fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (UITextField)textField
{
  return (UITextField *)self->_textField;
}

- (void)setContainerView:(id)a3
{
  v4 = (UIView *)a3;
  [(UIView *)self->_containerView removeFromSuperview];
  containerView = self->_containerView;
  self->_containerView = v4;
  v6 = v4;

  [(UIView *)self addSubview:self->_containerView];
  [(_UIAlertControllerTextFieldView *)self _loadConstraints];
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewConstraints, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end