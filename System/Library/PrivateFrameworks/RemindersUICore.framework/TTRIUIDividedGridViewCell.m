@interface TTRIUIDividedGridViewCell
- (BOOL)isAccessibilityElement;
- (BOOL)selected;
- (NSLayoutConstraint)widthConstraint;
- (TTRIDividedGridViewController)viewController;
- (TTRIUIDividedGridViewCell)init;
- (TTRIUIDividedGridViewCell)initWithBackgroundColor:(id)a3;
- (UILabel)label;
- (id)accessibilityElements;
- (id)selectedTextColor;
- (unint64_t)accessibilityTraits;
- (void)setLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)setWidthConstraint:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation TTRIUIDividedGridViewCell

- (TTRIUIDividedGridViewCell)initWithBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = [(TTRIUIDividedGridViewCell *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bgColor, a3);
    [(TTRIUIDividedGridViewCell *)v7 setBackgroundColor:v7->_bgColor];
  }

  return v7;
}

- (TTRIUIDividedGridViewCell)init
{
  v14.receiver = self;
  v14.super_class = (Class)TTRIUIDividedGridViewCell;
  v2 = [(TTRIUIDividedGridViewCell *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    label = v2->_label;
    v2->_label = (UILabel *)v3;

    [(UILabel *)v2->_label setTextAlignment:1];
    id v5 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v2->_label setTextColor:v5];

    [(UILabel *)v2->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TTRIUIDividedGridViewCell *)v2 addSubview:v2->_label];
    v6 = (void *)MEMORY[0x1E4F28DC8];
    v7 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v2->_label, 0);
    v8 = [v6 constraintsWithVisualFormat:@"H:|-(7)-[_label]-(7)-|" options:1024 metrics:0 views:v7];
    [(TTRIUIDividedGridViewCell *)v2 addConstraints:v8];

    v9 = (void *)MEMORY[0x1E4F28DC8];
    v10 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, v2->_label, 0);
    v11 = [v9 constraintsWithVisualFormat:@"V:|-(0)-[_label]-(0)-|" options:512 metrics:0 views:v10];
    [(TTRIUIDividedGridViewCell *)v2 addConstraints:v11];

    v12 = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
    [(TTRIUIDividedGridViewCell *)v2 setBackgroundColor:v12];
  }
  return v2;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = [(TTRIUIDividedGridViewCell *)self viewController];
  [v5 cellTapped:self];
}

- (id)selectedTextColor
{
  uint64_t v3 = [MEMORY[0x1E4FB1618] whiteColor];
  v4 = [(TTRIUIDividedGridViewCell *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];

  if (v5 == 2)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1618] blackColor];

    uint64_t v3 = (void *)v6;
  }

  return v3;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  if ([(TTRIUIDividedGridViewCell *)self selected])
  {
    v4 = [(TTRIUIDividedGridViewCell *)self tintColor];
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4FB1618] darkGrayColor];
    }
    v7 = v6;

    v8 = [(TTRIUIDividedGridViewCell *)self traitCollection];
    v9 = [v7 resolvedColorWithTraitCollection:v8];

    [(TTRIUIDividedGridViewCell *)self setBackgroundColor:v9];
  }
  else
  {
    if (self->_bgColor)
    {
      -[TTRIUIDividedGridViewCell setBackgroundColor:](self, "setBackgroundColor:");
      goto LABEL_10;
    }
    v7 = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
    [(TTRIUIDividedGridViewCell *)self setBackgroundColor:v7];
  }

LABEL_10:
  if ([(TTRIUIDividedGridViewCell *)self selected]) {
    [(TTRIUIDividedGridViewCell *)self selectedTextColor];
  }
  else {
  id v11 = [MEMORY[0x1E4FB1618] labelColor];
  }
  v10 = [(TTRIUIDividedGridViewCell *)self label];
  [v10 setTextColor:v11];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityElements
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  v6.receiver = self;
  v6.super_class = (Class)TTRIUIDividedGridViewCell;
  unint64_t v3 = [(TTRIUIDividedGridViewCell *)&v6 accessibilityTraits];
  if (self->_selected) {
    uint64_t v4 = *MEMORY[0x1E4FB2590];
  }
  else {
    uint64_t v4 = 0;
  }
  return *MEMORY[0x1E4FB2540] | v3 | v4;
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 424, 1);
}

- (void)setLabel:(id)a3
{
}

- (BOOL)selected
{
  return self->_selected;
}

- (TTRIDividedGridViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (TTRIDividedGridViewController *)WeakRetained;
}

- (void)setViewController:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widthConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_widthConstraint);
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_bgColor, 0);
}

@end