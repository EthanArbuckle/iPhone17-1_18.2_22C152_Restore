@interface STSCategoryView
- (CGPoint)footerOffset;
- (STSCategoryView)init;
- (UIEdgeInsets)contentInset;
- (UITableView)tableView;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setFooterOffset:(CGPoint)a3;
@end

@implementation STSCategoryView

- (STSCategoryView)init
{
  v24.receiver = self;
  v24.super_class = (Class)STSCategoryView;
  v2 = [(STSCategoryView *)&v24 init];
  v3 = v2;
  if (v2)
  {
    [(STSCategoryView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v4 = objc_alloc(MEMORY[0x263F82C78]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:style:", 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    tableView = v3->_tableView;
    v3->_tableView = (UITableView *)v5;

    v7 = v3->_tableView;
    v8 = [MEMORY[0x263F825C8] clearColor];
    [(UITableView *)v7 setBackgroundColor:v8];

    [(UITableView *)v3->_tableView setSeparatorStyle:0];
    [(UITableView *)v3->_tableView setCellLayoutMarginsFollowReadableWidth:1];
    id v9 = objc_alloc_init(MEMORY[0x263F82E00]);
    [v9 sizeToFit];
    [(UITableView *)v3->_tableView setTableFooterView:v9];
    [(UITableView *)v3->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(STSCategoryView *)v3 addSubview:v3->_tableView];
    v10 = [MEMORY[0x263EFF980] array];
    v11 = [(UITableView *)v3->_tableView leadingAnchor];
    v12 = [(STSCategoryView *)v3 leadingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    [v10 addObject:v13];

    v14 = [(UITableView *)v3->_tableView trailingAnchor];
    v15 = [(STSCategoryView *)v3 trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v10 addObject:v16];

    v17 = [(UITableView *)v3->_tableView topAnchor];
    v18 = [(STSCategoryView *)v3 topAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v10 addObject:v19];

    v20 = [(UITableView *)v3->_tableView bottomAnchor];
    v21 = [(STSCategoryView *)v3 bottomAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    [v10 addObject:v22];

    [MEMORY[0x263F08938] activateConstraints:v10];
  }
  return v3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (CGPoint)footerOffset
{
  double x = self->_footerOffset.x;
  double y = self->_footerOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setFooterOffset:(CGPoint)a3
{
  self->_footerOffset = a3;
}

- (void).cxx_destruct
{
}

@end