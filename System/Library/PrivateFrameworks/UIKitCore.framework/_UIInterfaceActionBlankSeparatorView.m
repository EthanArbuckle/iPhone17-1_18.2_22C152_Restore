@interface _UIInterfaceActionBlankSeparatorView
- (_UIInterfaceActionBlankSeparatorView)init;
- (_UIInterfaceActionSeparatorConstraintController)separatorViewConstraints;
- (double)constantAxisDimension;
- (double)horizontalLineLeadingInset;
- (void)setConstantAxisDimension:(double)a3;
- (void)setConstantSizedAxis:(int64_t)a3;
- (void)setHorizontalLineLeadingInset:(double)a3;
- (void)updateConstraints;
@end

@implementation _UIInterfaceActionBlankSeparatorView

- (_UIInterfaceActionBlankSeparatorView)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIInterfaceActionBlankSeparatorView;
  v2 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = [[_UIInterfaceActionSeparatorConstraintController alloc] initWithSeparatorView:v2];
    separatorViewConstraints = v2->_separatorViewConstraints;
    v2->_separatorViewConstraints = v3;
  }
  return v2;
}

- (void)setConstantAxisDimension:(double)a3
{
}

- (double)constantAxisDimension
{
  [(_UIInterfaceActionSeparatorConstraintController *)self->_separatorViewConstraints constantAxisDimension];
  return result;
}

- (void)setConstantSizedAxis:(int64_t)a3
{
}

- (void)setHorizontalLineLeadingInset:(double)a3
{
  self->_horizontalLineLeadingInset = a3;
}

- (void)updateConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)_UIInterfaceActionBlankSeparatorView;
  [(UIView *)&v3 updateConstraints];
  [(_UIInterfaceActionSeparatorConstraintController *)self->_separatorViewConstraints separatorViewDidUpdateConstraints];
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
}

@end