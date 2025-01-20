@interface STSDropDownRootView
- (STSDropDownRootView)init;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
@end

@implementation STSDropDownRootView

- (STSDropDownRootView)init
{
  v6.receiver = self;
  v6.super_class = (Class)STSDropDownRootView;
  v2 = [(STSDropDownRootView *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    constraints = v2->_constraints;
    v2->_constraints = (NSMutableArray *)v3;

    [(STSDropDownRootView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v2;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)STSDropDownRootView;
  [(STSDropDownRootView *)&v21 layoutSubviews];
  uint64_t v3 = [(STSDropDownRootView *)self subviews];
  int v4 = [v3 containsObject:self->_contentView];

  if (v4)
  {
    [MEMORY[0x263F08938] deactivateConstraints:self->_constraints];
    [(NSMutableArray *)self->_constraints removeAllObjects];
    constraints = self->_constraints;
    objc_super v6 = [(UIView *)self->_contentView topAnchor];
    v7 = [(STSDropDownRootView *)self topAnchor];
    v8 = [v6 constraintEqualToAnchor:v7];
    [(NSMutableArray *)constraints addObject:v8];

    v9 = self->_constraints;
    v10 = [(UIView *)self->_contentView bottomAnchor];
    v11 = [(STSDropDownRootView *)self bottomAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    [(NSMutableArray *)v9 addObject:v12];

    v13 = self->_constraints;
    v14 = [(UIView *)self->_contentView leadingAnchor];
    v15 = [(STSDropDownRootView *)self leadingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [(NSMutableArray *)v13 addObject:v16];

    v17 = self->_constraints;
    v18 = [(UIView *)self->_contentView trailingAnchor];
    v19 = [(STSDropDownRootView *)self trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [(NSMutableArray *)v17 addObject:v20];

    [MEMORY[0x263F08938] activateConstraints:self->_constraints];
  }
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v10 = v5;
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    v8 = [(UIView *)*p_contentView superview];
    char v9 = [v8 isEqual:self];

    if ((v9 & 1) == 0) {
      [(STSDropDownRootView *)self addSubview:*p_contentView];
    }
    contentView = (UIView *)[(STSDropDownRootView *)self setNeedsLayout];
    v5 = v10;
  }

  MEMORY[0x270F9A758](contentView, v5);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end