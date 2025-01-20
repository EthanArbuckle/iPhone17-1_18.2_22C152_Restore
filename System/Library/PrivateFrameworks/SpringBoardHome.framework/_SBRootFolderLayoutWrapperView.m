@interface _SBRootFolderLayoutWrapperView
- (CGSize)extendedSize;
- (UIView)wrappedView;
- (double)headerOffset;
- (double)statusBarHeightAdjustment;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_updateLayout;
- (void)layoutSubviews;
- (void)setExtendedSize:(CGSize)a3;
- (void)setHeaderOffset:(double)a3;
- (void)setStatusBarHeightAdjustment:(double)a3;
- (void)setWrappedView:(id)a3;
@end

@implementation _SBRootFolderLayoutWrapperView

- (UIView)wrappedView
{
  return self->_wrappedView;
}

- (void)setHeaderOffset:(double)a3
{
  if (self->_headerOffset != a3)
  {
    self->_headerOffset = a3;
    [(_SBRootFolderLayoutWrapperView *)self _updateLayout];
  }
}

- (void)setExtendedSize:(CGSize)a3
{
  if (self->_extendedSize.width != a3.width || self->_extendedSize.height != a3.height)
  {
    self->_extendedSize = a3;
    [(_SBRootFolderLayoutWrapperView *)self _updateLayout];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_SBRootFolderLayoutWrapperView;
  [(_SBRootFolderLayoutWrapperView *)&v3 layoutSubviews];
  [(_SBRootFolderLayoutWrapperView *)self _updateLayout];
}

- (void)_updateLayout
{
  [(_SBRootFolderLayoutWrapperView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9 + self->_extendedSize.height;
  UIRectGetCenter();
  double v12 = v11;
  double statusBarHeightAdjustment = self->_statusBarHeightAdjustment;
  double v14 = v10 - statusBarHeightAdjustment;
  double v16 = v15 + statusBarHeightAdjustment - self->_headerOffset;
  -[UIView setBounds:](self->_wrappedView, "setBounds:", v4, v6, v8, v14);
  wrappedView = self->_wrappedView;
  -[UIView setCenter:](wrappedView, "setCenter:", v12, v16);
}

- (void)setStatusBarHeightAdjustment:(double)a3
{
  if (self->_statusBarHeightAdjustment != a3)
  {
    self->_double statusBarHeightAdjustment = a3;
    [(_SBRootFolderLayoutWrapperView *)self _updateLayout];
  }
}

- (void)setWrappedView:(id)a3
{
  double v5 = (UIView *)a3;
  wrappedView = self->_wrappedView;
  if (wrappedView != v5)
  {
    double v7 = v5;
    [(UIView *)wrappedView removeFromSuperview];
    objc_storeStrong((id *)&self->_wrappedView, a3);
    [(_SBRootFolderLayoutWrapperView *)self addSubview:self->_wrappedView];
    [(_SBRootFolderLayoutWrapperView *)self _updateLayout];
    double v5 = v7;
  }
}

- (id)description
{
  return [(_SBRootFolderLayoutWrapperView *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBRootFolderLayoutWrapperView *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(_SBRootFolderLayoutWrapperView *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  double v4 = [(_SBRootFolderLayoutWrapperView *)self succinctDescriptionBuilder];
  [(_SBRootFolderLayoutWrapperView *)self frame];
  id v5 = (id)objc_msgSend(v4, "appendRect:withName:", @"frame");
  id v6 = (id)[v4 appendFloat:@"statusBarHeightAdjustment" withName:self->_statusBarHeightAdjustment];
  id v7 = (id)[v4 appendFloat:@"headerOffset" withName:self->_headerOffset];
  id v8 = (id)objc_msgSend(v4, "appendSize:withName:", @"extendedSize", self->_extendedSize.width, self->_extendedSize.height);
  id v9 = (id)[v4 appendObject:self->_wrappedView withName:@"wrappedView"];
  return v4;
}

- (double)statusBarHeightAdjustment
{
  return self->_statusBarHeightAdjustment;
}

- (double)headerOffset
{
  return self->_headerOffset;
}

- (CGSize)extendedSize
{
  double width = self->_extendedSize.width;
  double height = self->_extendedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
}

@end