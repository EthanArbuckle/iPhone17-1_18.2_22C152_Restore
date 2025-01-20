@interface _UIInterfaceActionVibrantSeparatorView
- (_UIInterfaceActionSeparatorConstraintController)separatorViewConstraints;
- (_UIInterfaceActionVibrantSeparatorView)init;
- (double)constantAxisDimension;
- (double)horizontalLineLeadingInset;
- (int64_t)constantSizedAxis;
- (void)_setupEffectView;
- (void)_updateContentDirectionalInsets;
- (void)setConstantAxisDimension:(double)a3;
- (void)setConstantSizedAxis:(int64_t)a3;
- (void)setHorizontalLineLeadingInset:(double)a3;
- (void)updateConstraints;
@end

@implementation _UIInterfaceActionVibrantSeparatorView

- (_UIInterfaceActionVibrantSeparatorView)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIInterfaceActionVibrantSeparatorView;
  v2 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = [[_UIInterfaceActionSeparatorConstraintController alloc] initWithSeparatorView:v2];
    separatorViewConstraints = v2->_separatorViewConstraints;
    v2->_separatorViewConstraints = v3;

    [(_UIInterfaceActionVibrantSeparatorView *)v2 _setupEffectView];
  }
  return v2;
}

- (void)_setupEffectView
{
  id v8 = +[UIBlurEffect effectWithStyle:1200];
  v3 = +[UIVibrancyEffect _effectForBlurEffect:v8 vibrancyStyle:120];
  v4 = [[UIVisualEffectView alloc] initWithEffect:v3];
  effectView = self->_effectView;
  self->_effectView = v4;

  objc_super v6 = +[UIColor whiteColor];
  v7 = [(UIVisualEffectView *)self->_effectView contentView];
  [v7 setBackgroundColor:v6];

  [(UIView *)self bounds];
  -[UIView setFrame:](self->_effectView, "setFrame:");
  [(UIView *)self->_effectView setAutoresizingMask:18];
  [(UIView *)self addSubview:self->_effectView];
}

- (void)setConstantAxisDimension:(double)a3
{
  -[_UIInterfaceActionSeparatorConstraintController setConstantAxisDimension:](self->_separatorViewConstraints, "setConstantAxisDimension:");
  if (a3 >= 0.0)
  {
    id v6 = +[UIColor colorWithWhite:1.0 alpha:0.3];
    v5 = [(UIVisualEffectView *)self->_effectView contentView];
    [v5 setBackgroundColor:v6];
  }
}

- (double)constantAxisDimension
{
  [(_UIInterfaceActionSeparatorConstraintController *)self->_separatorViewConstraints constantAxisDimension];
  return result;
}

- (void)setHorizontalLineLeadingInset:(double)a3
{
  if (self->_horizontalLineLeadingInset != a3)
  {
    self->_horizontalLineLeadingInset = a3;
    [(_UIInterfaceActionVibrantSeparatorView *)self _updateContentDirectionalInsets];
  }
}

- (void)setConstantSizedAxis:(int64_t)a3
{
  [(_UIInterfaceActionSeparatorConstraintController *)self->_separatorViewConstraints setConstantSizedAxis:a3];
  [(_UIInterfaceActionVibrantSeparatorView *)self _updateContentDirectionalInsets];
}

- (int64_t)constantSizedAxis
{
  return [(_UIInterfaceActionSeparatorConstraintController *)self->_separatorViewConstraints constantSizedAxis];
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionVibrantSeparatorView;
  [(UIView *)&v3 updateConstraints];
  [(_UIInterfaceActionSeparatorConstraintController *)self->_separatorViewConstraints separatorViewDidUpdateConstraints];
}

- (void)_updateContentDirectionalInsets
{
  int64_t v3 = [(_UIInterfaceActionVibrantSeparatorView *)self constantSizedAxis];
  double v4 = 0.0;
  if (v3 == 1)
  {
    [(_UIInterfaceActionVibrantSeparatorView *)self horizontalLineLeadingInset];
    double v4 = v5;
  }
  -[UIView setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", 0.0, v4, 0.0, 0.0);
}

- (double)horizontalLineLeadingInset
{
  return self->_horizontalLineLeadingInset;
}

- (_UIInterfaceActionSeparatorConstraintController)separatorViewConstraints
{
  return self->_separatorViewConstraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorViewConstraints, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
}

@end