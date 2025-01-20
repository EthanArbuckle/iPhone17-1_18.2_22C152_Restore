@interface PKTableViewCell
- (BOOL)showsActionSpinner;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (UIColor)checkmarkAccessoryColor;
- (UIColor)customAccessoryColor;
- (UIColor)highlightColor;
- (double)minimumHeight;
- (id)_checkmarkImage:(BOOL)a3;
- (id)_disclosureChevronImage:(BOOL)a3;
- (void)pk_applyAppearance:(id)a3;
- (void)prepareForReuse;
- (void)setCheckmarkAccessoryColor:(id)a3;
- (void)setCustomAccessoryColor:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setMinimumHeight:(double)a3;
- (void)setShowsActionSpinner:(BOOL)a3;
@end

@implementation PKTableViewCell

- (void)pk_applyAppearance:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKTableViewCell;
  id v4 = a3;
  [(UITableViewCell *)&v8 pk_applyAppearance:v4];
  v5 = objc_msgSend(v4, "tableViewCellHighlightColor", v8.receiver, v8.super_class);
  [(PKTableViewCell *)self setHighlightColor:v5];

  v6 = [v4 tintColor];
  [(PKTableViewCell *)self setCheckmarkAccessoryColor:v6];

  v7 = [v4 tableViewCellAccessoryColor];

  [(PKTableViewCell *)self setCustomAccessoryColor:v7];
}

- (void)setHighlightColor:(id)a3
{
  id v4 = (UIColor *)a3;
  if (self->_highlightColor != v4)
  {
    objc_super v8 = v4;
    v5 = (UIColor *)[(UIColor *)v4 copy];
    highlightColor = self->_highlightColor;
    self->_highlightColor = v5;

    if (self->_highlightColor)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      [v7 setBackgroundColor:self->_highlightColor];
      [(PKTableViewCell *)self setSelectedBackgroundView:v7];
    }
    else
    {
      [(PKTableViewCell *)self setSelectedBackgroundView:0];
    }
    id v4 = v8;
  }
}

- (id)_checkmarkImage:(BOOL)a3
{
  if (self->_checkmarkAccessoryColor)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKTableViewCell;
    id v4 = [(PKTableViewCell *)&v9 _checkmarkImage:a3];
    v5 = [(PKTableViewCell *)self checkmarkAccessoryColor];
    v6 = [v4 _flatImageWithColor:v5];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PKTableViewCell;
    v6 = [(PKTableViewCell *)&v8 _checkmarkImage:a3];
  }

  return v6;
}

- (id)_disclosureChevronImage:(BOOL)a3
{
  if (self->_customAccessoryColor)
  {
    v9.receiver = self;
    v9.super_class = (Class)PKTableViewCell;
    id v4 = [(PKTableViewCell *)&v9 _disclosureChevronImage:a3];
    v5 = [v4 _flatImageWithColor:self->_customAccessoryColor];
    v6 = [v5 imageFlippedForRightToLeftLayoutDirection];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PKTableViewCell;
    id v4 = [(PKTableViewCell *)&v8 _disclosureChevronImage:a3];
    v6 = [v4 imageFlippedForRightToLeftLayoutDirection];
  }

  return v6;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKTableViewCell;
  [(PKTableViewCell *)&v3 prepareForReuse];
  [(PKTableViewCell *)self setShowsActionSpinner:0];
}

- (void)setShowsActionSpinner:(BOOL)a3
{
  if (self->_showsActionSpinner != a3)
  {
    self->_showsActionSpinner = a3;
    if (a3)
    {
      id v5 = (id)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      [v5 startAnimating];
      [(PKTableViewCell *)self setEditingAccessoryView:v5];
      id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
      [v4 startAnimating];
      [(PKTableViewCell *)self setAccessoryView:v4];
    }
    else
    {
      [(PKTableViewCell *)self setEditingAccessoryView:0];
      [(PKTableViewCell *)self setAccessoryView:0];
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKTableViewCell;
  -[PKTableViewCell sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  if (self->_minimumHeight > minimumHeight) {
    double minimumHeight = self->_minimumHeight;
  }
  result.height = minimumHeight;
  result.width = v4;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v8.receiver = self;
  v8.super_class = (Class)PKTableViewCell;
  -[PKTableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v8, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, a3.height);
  if (self->_minimumHeight > minimumHeight) {
    double minimumHeight = self->_minimumHeight;
  }
  result.height = minimumHeight;
  result.width = v6;
  return result;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (UIColor)checkmarkAccessoryColor
{
  return self->_checkmarkAccessoryColor;
}

- (void)setCheckmarkAccessoryColor:(id)a3
{
}

- (UIColor)customAccessoryColor
{
  return self->_customAccessoryColor;
}

- (void)setCustomAccessoryColor:(id)a3
{
}

- (BOOL)showsActionSpinner
{
  return self->_showsActionSpinner;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_double minimumHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAccessoryColor, 0);
  objc_storeStrong((id *)&self->_checkmarkAccessoryColor, 0);

  objc_storeStrong((id *)&self->_highlightColor, 0);
}

@end