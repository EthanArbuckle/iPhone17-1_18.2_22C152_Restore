@interface STSHeaderView
- (NSString)title;
- (STSHeaderView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInsets;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setTitle:(id)a3;
- (void)updateConstraints;
@end

@implementation STSHeaderView

- (STSHeaderView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)STSHeaderView;
  v3 = -[STSHeaderView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = v3->_label;
    v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D8]];
    [(UILabel *)v7 setFont:v8];

    v9 = v3->_label;
    v10 = [MEMORY[0x263F825C8] colorWithWhite:0.4 alpha:1.0];
    [(UILabel *)v9 setTextColor:v10];

    [(STSHeaderView *)v3 addSubview:v3->_label];
    [(STSHeaderView *)v3 setNeedsUpdateConstraints];
  }
  return v3;
}

- (void)updateConstraints
{
  v14[4] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)STSHeaderView;
  [(STSHeaderView *)&v12 updateConstraints];
  if (self->_constraints) {
    -[STSHeaderView removeConstraints:](self, "removeConstraints:");
  }
  v3 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, self->_label, 0);
  v13[0] = @"contentInsetsTop";
  id v4 = [NSNumber numberWithDouble:self->_contentInsets.top];
  v14[0] = v4;
  v13[1] = @"contentInsetsLeft";
  uint64_t v5 = [NSNumber numberWithDouble:self->_contentInsets.left];
  v14[1] = v5;
  v13[2] = @"contentInsetsBottom";
  v6 = [NSNumber numberWithDouble:self->_contentInsets.bottom];
  v14[2] = v6;
  v13[3] = @"contentInsetsRight";
  v7 = [NSNumber numberWithDouble:self->_contentInsets.right];
  v14[3] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  v9 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-(contentInsetsLeft)-[_label]-(contentInsetsRight)-|" options:0 metrics:v8 views:v3];
  [(STSHeaderView *)self addConstraints:v9];

  v10 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-(contentInsetsTop)-[_label]-(contentInsetsBottom)-|" options:0 metrics:v8 views:v3];
  [(STSHeaderView *)self addConstraints:v10];

  constraints = self->_constraints;
  self->_constraints = 0;
}

- (void)setTitle:(id)a3
{
  p_title = &self->_title;
  id v6 = a3;
  if (!-[NSString isEqualToString:](*p_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    [(UILabel *)self->_label setText:*p_title];
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(STSHeaderView *)self setNeedsUpdateConstraints];
  }
}

- (NSString)title
{
  return self->_title;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end