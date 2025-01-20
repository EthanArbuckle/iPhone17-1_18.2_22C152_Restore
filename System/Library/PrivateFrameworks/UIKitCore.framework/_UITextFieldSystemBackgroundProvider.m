@interface _UITextFieldSystemBackgroundProvider
+ (id)systemStyleMetricsProvider;
- (Class)systemBackgroundViewClass;
- (id)backgroundView;
- (id)overridingGetBackgroundColor;
- (id)overridingSetBackgroundColor:(id)a3;
- (id)preferredMetricsProvider;
- (int64_t)associatedBorderStyle;
- (void)_buildDescription:(id)a3;
- (void)addToTextField:(id)a3;
- (void)enabledDidChangeAnimated:(BOOL)a3;
- (void)removeFromTextField;
- (void)setProgress:(double)a3;
@end

@implementation _UITextFieldSystemBackgroundProvider

- (int64_t)associatedBorderStyle
{
  return 3;
}

- (id)backgroundView
{
  systemBackgroundView = self->_systemBackgroundView;
  if (!systemBackgroundView)
  {
    v4 = [(_UITextFieldBackgroundProvider *)self textField];
    uint64_t v5 = [v4 isEditing];

    id v6 = objc_alloc([(_UITextFieldSystemBackgroundProvider *)self systemBackgroundViewClass]);
    v7 = (UITextFieldBackgroundView *)objc_msgSend(v6, "initWithFrame:active:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v8 = self->_systemBackgroundView;
    self->_systemBackgroundView = v7;

    systemBackgroundView = self->_systemBackgroundView;
  }
  return systemBackgroundView;
}

- (Class)systemBackgroundViewClass
{
  v2 = [(_UITextFieldBackgroundProvider *)self textField];
  v3 = self;
  objc_opt_isKindOfClass();
  v4 = self;

  return (Class)v4;
}

- (id)preferredMetricsProvider
{
  return +[_UITextFieldSystemBackgroundProvider systemStyleMetricsProvider];
}

+ (id)systemStyleMetricsProvider
{
  v2 = -[_UITextFieldPaddedMetricsProvider initWithSymmetricalPadding:]([_UITextFieldPaddedMetricsProvider alloc], "initWithSymmetricalPadding:", 7.0, 2.0);
  [(_UITextFieldPaddedMetricsProvider *)v2 setMinimumIntrinsicHeight:30.0];
  return v2;
}

- (void)addToTextField:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldSystemBackgroundProvider;
  [(_UITextFieldViewBackgroundProvider *)&v7 addToTextField:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 _roundedRectBackgroundCornerRadius];
    -[UITextFieldBackgroundView setCornerRadius:](self->_systemBackgroundView, "setCornerRadius:");
  }
  uint64_t v5 = [v4 backgroundColor];
  id v6 = [(_UITextFieldSystemBackgroundProvider *)self overridingSetBackgroundColor:v5];
  [v4 _setBackgroundColor:v6];
}

- (id)overridingSetBackgroundColor:(id)a3
{
  return 0;
}

- (id)overridingGetBackgroundColor
{
  return [(UITextFieldBackgroundView *)self->_systemBackgroundView fillColor];
}

- (void).cxx_destruct
{
}

- (void)removeFromTextField
{
  if (self->_systemBackgroundView)
  {
    v3 = [(_UITextFieldBackgroundProvider *)self textField];
    id v4 = [(UITextFieldBackgroundView *)self->_systemBackgroundView fillColor];
    [v3 _setBackgroundColor:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)_UITextFieldSystemBackgroundProvider;
  [(_UITextFieldViewBackgroundProvider *)&v5 removeFromTextField];
}

- (void)enabledDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldSystemBackgroundProvider;
  -[_UITextFieldBackgroundProvider enabledDidChangeAnimated:](&v7, sel_enabledDidChangeAnimated_);
  systemBackgroundView = self->_systemBackgroundView;
  id v6 = [(_UITextFieldBackgroundProvider *)self textField];
  -[UITextFieldBackgroundView setEnabled:animated:](systemBackgroundView, "setEnabled:animated:", [v6 isEnabled], v3);

  [(_UITextFieldViewBackgroundProvider *)self layoutIfNeeded];
}

- (void)setProgress:(double)a3
{
  *(float *)&a3 = a3;
  [(UITextFieldBackgroundView *)self->_systemBackgroundView setProgress:a3];
}

- (void)_buildDescription:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldSystemBackgroundProvider;
  [(_UITextFieldViewBackgroundProvider *)&v7 _buildDescription:v4];
  objc_super v5 = [(UITextFieldBackgroundView *)self->_systemBackgroundView fillColor];
  id v6 = (id)[v4 appendName:@"fillColor" object:v5];
}

@end