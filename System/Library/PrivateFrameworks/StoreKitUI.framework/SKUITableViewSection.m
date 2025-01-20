@interface SKUITableViewSection
- (BOOL)hidesHeaderView;
- (SKUITableViewSectionDelegate)delegate;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)footerViewForTableView:(id)a3;
- (id)headerViewForTableView:(id)a3;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (int64_t)sectionIndex;
- (void)numberOfRowsInSection;
- (void)setDelegate:(id)a3;
- (void)setHidesHeaderView:(BOOL)a3;
- (void)setSectionIndex:(int64_t)a3;
@end

@implementation SKUITableViewSection

- (id)footerViewForTableView:(id)a3
{
  return 0;
}

- (id)headerViewForTableView:(id)a3
{
  return 0;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return 0.0;
}

- (int64_t)numberOfRowsInSection
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUITableViewSection numberOfRowsInSection]();
  }
  return 0;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  return 0;
}

- (SKUITableViewSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUITableViewSectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)hidesHeaderView
{
  return self->_hidesHeaderView;
}

- (void)setHidesHeaderView:(BOOL)a3
{
  self->_hidesHeaderView = a3;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (void).cxx_destruct
{
}

- (void)numberOfRowsInSection
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITableViewSection numberOfRowsInSection]";
}

@end