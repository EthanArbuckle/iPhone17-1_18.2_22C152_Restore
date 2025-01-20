@interface STUIStatusBarSpacerDisplayItem
- (CGSize)size;
- (NSArray)constraints;
- (STUIStatusBarSpacerDisplayItem)initWithIdentifier:(id)a3 item:(id)a4;
- (UILayoutGuide)layoutGuide;
- (void)_applyConstraintsIfNeeded;
- (void)applyUpdate:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setLayoutGuide:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation STUIStatusBarSpacerDisplayItem

- (void)setLayoutGuide:(id)a3
{
}

- (STUIStatusBarSpacerDisplayItem)initWithIdentifier:(id)a3 item:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarSpacerDisplayItem;
  result = [(STUIStatusBarDisplayItem *)&v5 initWithIdentifier:a3 item:a4];
  result->_size = (CGSize)vdupq_n_s64(0x7FF0000000000000uLL);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
}

- (void)applyUpdate:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v4 = [a3 placementInfo];
  objc_super v5 = [v4 objectForKeyedSubscript:@"size"];

  if (v5)
  {
    [v5 CGSizeValue];
    double v8 = v6;
    double v9 = v7;
    if (v6 != self->_size.width || v7 != self->_size.height)
    {
      self->_size.width = v6;
      self->_size.height = v7;
      if (self->_constraints) {
        objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
      }
      v11 = [(UILayoutGuide *)self->_layoutGuide widthAnchor];
      v12 = [v11 constraintEqualToConstant:v8];
      v17[0] = v12;
      v13 = [(UILayoutGuide *)self->_layoutGuide heightAnchor];
      v14 = [v13 constraintEqualToConstant:v9];
      v17[1] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      constraints = self->_constraints;
      self->_constraints = v15;

      [(STUIStatusBarSpacerDisplayItem *)self _applyConstraintsIfNeeded];
    }
  }
}

- (void)setContainerView:(id)a3
{
  id v4 = a3;
  id v5 = [(STUIStatusBarDisplayItem *)self containerView];

  if (v5 != v4)
  {
    double v6 = [(STUIStatusBarDisplayItem *)self containerView];

    if (v6) {
      [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
    }
    v7.receiver = self;
    v7.super_class = (Class)STUIStatusBarSpacerDisplayItem;
    [(STUIStatusBarDisplayItem *)&v7 setContainerView:v4];
    [(STUIStatusBarSpacerDisplayItem *)self _applyConstraintsIfNeeded];
  }
}

- (void)_applyConstraintsIfNeeded
{
  if (self->_constraints)
  {
    v3 = [(STUIStatusBarDisplayItem *)self containerView];

    if (v3)
    {
      id v4 = (void *)MEMORY[0x1E4F28DC8];
      constraints = self->_constraints;
      [v4 activateConstraints:constraints];
    }
  }
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (NSArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

@end