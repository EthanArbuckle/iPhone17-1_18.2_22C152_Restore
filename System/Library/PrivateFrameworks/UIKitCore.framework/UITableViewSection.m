@interface UITableViewSection
+ (id)sectionWithRows:(id)a3;
- (NSArray)rows;
- (NSString)footerTitle;
- (NSString)headerTitle;
- (UITableViewSection)initWithCoder:(id)a3;
- (UIView)footerView;
- (UIView)headerView;
- (void)encodeWithCoder:(id)a3;
- (void)setFooterTitle:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setRows:(id)a3;
@end

@implementation UITableViewSection

+ (id)sectionWithRows:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setRows:v3];

  return v4;
}

- (UITableViewSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UITableViewSection;
  v5 = [(UITableViewSection *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UITableSectionHeaderView"];
    headerView = v5->_headerView;
    v5->_headerView = (UIView *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"UITableSectionHeaderTitle"];
    headerTitle = v5->_headerTitle;
    v5->_headerTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"UITableSectionFooterView"];
    footerView = v5->_footerView;
    v5->_footerView = (UIView *)v10;

    uint64_t v12 = [v4 decodeObjectForKey:@"UITableSectionFooterTitle"];
    footerTitle = v5->_footerTitle;
    v5->_footerTitle = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectForKey:@"UITableSectionRows"];
    rows = v5->_rows;
    v5->_rows = (NSArray *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*(_OWORD *)&self->_headerTitle != 0) {
    objc_msgSend(v4, "encodeObject:forKey:");
  }
  if (self->_footerView || self->_footerTitle) {
    objc_msgSend(v7, "encodeObject:forKey:");
  }
  rows = self->_rows;
  uint64_t v6 = v7;
  if (rows)
  {
    [v7 encodeObject:rows forKey:@"UITableSectionRows"];
    uint64_t v6 = v7;
  }
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (NSString)footerTitle
{
  return self->_footerTitle;
}

- (void)setFooterTitle:(id)a3
{
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_footerTitle, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
}

@end