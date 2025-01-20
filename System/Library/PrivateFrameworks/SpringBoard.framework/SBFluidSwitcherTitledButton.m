@interface SBFluidSwitcherTitledButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (void)setTitle:(id)a3;
@end

@implementation SBFluidSwitcherTitledButton

- (void)setTitle:(id)a3
{
  id v7 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)[v7 copy];
    title = self->_title;
    self->_title = v4;

    v6 = _SBFluidSwitcherTitledButtonContentImageWithTitle(self->_title);
    [(SBFluidSwitcherButton *)self setImage:v6];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = [(SBFluidSwitcherButton *)self image];
  [v3 alignmentRectInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 size];
  v18.size.width = v12 - (v7 + v11);
  v18.size.height = v13 - (v5 + v9);
  v18.origin.x = v7 + 0.0;
  v18.origin.y = v5 + 0.0;
  CGRect v19 = CGRectIntegral(v18);
  CGFloat v14 = CGRectGetWidth(v19) + 13.0 + 13.0;

  double v15 = 26.0;
  double v16 = v14;
  result.height = v15;
  result.width = v16;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
}

@end