@interface PKApplyPrimaryActionRow
- (BOOL)loading;
- (Class)cellClass;
- (NSCopying)identifier;
- (PKApplyPrimaryActionRow)initWithTitle:(id)a3;
- (id)action;
- (void)configureCell:(id)a3;
- (void)setAction:(id)a3;
- (void)setLoading:(BOOL)a3;
@end

@implementation PKApplyPrimaryActionRow

- (PKApplyPrimaryActionRow)initWithTitle:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyPrimaryActionRow;
  v6 = [(PKApplyPrimaryActionRow *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_title, a3);
  }

  return v7;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (NSCopying)identifier
{
  return (NSCopying *)self->_title;
}

- (void)configureCell:(id)a3
{
  id v6 = a3;
  [(PKApplyPrimaryActionRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    BOOL loading = self->_loading;
    id v5 = v6;
    [v5 setLoading:loading];
    [v5 setTitle:self->_title];
    [v5 setAction:self->_action];
    [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
  }
}

- (BOOL)loading
{
  return self->_loading;
}

- (void)setLoading:(BOOL)a3
{
  self->_BOOL loading = a3;
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end