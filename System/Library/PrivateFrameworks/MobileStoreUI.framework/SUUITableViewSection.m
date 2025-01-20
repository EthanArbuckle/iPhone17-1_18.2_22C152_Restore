@interface SUUITableViewSection
- (BOOL)hidesHeaderView;
- (SUUITableViewSectionDelegate)delegate;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)footerViewForTableView:(id)a3;
- (id)headerViewForTableView:(id)a3;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (int64_t)sectionIndex;
- (void)setDelegate:(id)a3;
- (void)setHidesHeaderView:(BOOL)a3;
- (void)setSectionIndex:(int64_t)a3;
@end

@implementation SUUITableViewSection

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
  return 0;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  return 0;
}

- (SUUITableViewSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUITableViewSectionDelegate *)WeakRetained;
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

@end