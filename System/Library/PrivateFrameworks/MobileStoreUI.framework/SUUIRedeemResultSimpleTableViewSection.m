@interface SUUIRedeemResultSimpleTableViewSection
- (SUUIRedeemResultSimpleTableViewSection)initWithView:(id)a3;
- (UIEdgeInsets)contentInsets;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5;
@end

@implementation SUUIRedeemResultSimpleTableViewSection

- (SUUIRedeemResultSimpleTableViewSection)initWithView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIRedeemResultSimpleTableViewSection;
  v6 = [(SUUIRedeemResultSimpleTableViewSection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_view, a3);
  }

  return v7;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  [(UIView *)self->_view bounds];
  return v5 + self->_contentInsets.top + self->_contentInsets.bottom;
}

- (int64_t)numberOfRowsInSection
{
  return 1;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"SUUIRRSTVC", a4);
  double v5 = (SUUIRedeemResultSimpleTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    double v5 = [[SUUIRedeemResultSimpleTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"SUUIRRSTVC"];
    [(SUUIRedeemResultSimpleTableViewCell *)v5 setSelectionStyle:0];
  }
  -[SUUIRedeemResultSimpleTableViewCell setChildContentInsets:](v5, "setChildContentInsets:", self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);
  [(SUUIRedeemResultSimpleTableViewCell *)v5 setChildContentView:self->_view];
  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = [a3 backgroundColor];
  [v7 setBackgroundColor:v8];

  [(UIView *)self->_view setBackgroundColor:v8];
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

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
}

@end