@interface SKUIProductPageTableHeaderOnlySection
- (UIView)headerView;
- (id)headerViewForTableView:(id)a3;
- (void)setHeaderView:(id)a3;
@end

@implementation SKUIProductPageTableHeaderOnlySection

- (id)headerViewForTableView:(id)a3
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageTableHeaderOnlySection headerViewForTableView:]();
  }
  v4 = [(SKUIProductPageTableHeaderOnlySection *)self headerView];

  return v4;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)headerViewForTableView:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPageTableHeaderOnlySection headerViewForTableView:]";
}

@end