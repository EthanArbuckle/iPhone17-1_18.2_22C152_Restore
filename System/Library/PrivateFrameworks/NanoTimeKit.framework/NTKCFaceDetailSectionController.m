@interface NTKCFaceDetailSectionController
+ (void)registerForTableView:(id)a3;
- (BOOL)_canSelectRow:(int64_t)a3;
- (BOOL)canSelectRow:(int64_t)a3;
- (BOOL)hasSpacerRow;
- (BOOL)inGallery;
- (NSMutableArray)rows;
- (NSString)titleForHeader;
- (NTKCDetailTableViewCell)cell;
- (NTKCFaceDetailSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5;
- (NTKCFaceDetailSectionHeaderView)headerView;
- (NTKCTableViewProviding)tableViewController;
- (NTKFace)face;
- (UITableView)tableView;
- (double)_heightForSpacerRow;
- (double)heightForHeaderView;
- (double)heightForRow:(int64_t)a3;
- (id)_groupName;
- (id)_newSectionHeader;
- (id)_spacerRow;
- (id)cellForRow:(int64_t)a3;
- (int64_t)numberOfRows;
- (int64_t)section;
- (void)setCell:(id)a3;
- (void)setFace:(id)a3;
- (void)setHasSpacerRow:(BOOL)a3;
- (void)setHeaderView:(id)a3;
- (void)setInGallery:(BOOL)a3;
- (void)setRows:(id)a3;
- (void)setSection:(int64_t)a3;
- (void)setTableViewController:(id)a3;
@end

@implementation NTKCFaceDetailSectionController

+ (void)registerForTableView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = +[NTKCFaceDetailSpacerCell reuseIdentifier];
  [v3 registerClass:v4 forCellReuseIdentifier:v5];
}

- (NTKCFaceDetailSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKCFaceDetailSectionController;
  v10 = [(NTKCFaceDetailSectionController *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(NTKCFaceDetailSectionController *)v10 setTableViewController:v8];
    [(NTKCFaceDetailSectionController *)v11 setFace:v9];
    [(NTKCFaceDetailSectionController *)v11 setInGallery:v5];
    [(NTKCFaceDetailSectionController *)v11 _commonInit];
  }

  return v11;
}

- (int64_t)numberOfRows
{
  rows = self->_rows;
  if (rows) {
    uint64_t v4 = [(NSMutableArray *)rows count];
  }
  else {
    uint64_t v4 = self->_cell != 0;
  }
  return v4 + self->_hasSpacerRow;
}

- (double)heightForRow:(int64_t)a3
{
  rows = self->_rows;
  if (rows && [(NSMutableArray *)rows count] > (unint64_t)a3)
  {
    v6 = [(NSMutableArray *)self->_rows objectAtIndexedSubscript:a3];
    [v6 rowHeight];
    double v8 = v7;

    return v8;
  }
  else if (a3 || (cell = self->_cell) == 0)
  {
    if (self->_hasSpacerRow && [(NTKCFaceDetailSectionController *)self numberOfRows] - 1 == a3)
    {
      [(NTKCFaceDetailSectionController *)self _heightForSpacerRow];
    }
    else
    {
      return 0.0;
    }
  }
  else
  {
    [(NTKCDetailTableViewCell *)cell rowHeight];
  }
  return result;
}

- (id)cellForRow:(int64_t)a3
{
  rows = self->_rows;
  if (rows && [(NSMutableArray *)rows count] > (unint64_t)a3)
  {
    v6 = [(NSMutableArray *)self->_rows objectAtIndexedSubscript:a3];
  }
  else if (a3 || (cell = self->_cell) == 0)
  {
    if (self->_hasSpacerRow && [(NTKCFaceDetailSectionController *)self numberOfRows] - 1 == a3)
    {
      v6 = [(NTKCFaceDetailSectionController *)self _spacerRow];
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = cell;
  }
  return v6;
}

- (double)_heightForSpacerRow
{
  +[NTKCFaceDetailSpacerCell rowHeight];
  return result;
}

- (id)_spacerRow
{
  v2 = [(NTKCFaceDetailSectionController *)self tableView];
  id v3 = +[NTKCFaceDetailSpacerCell reuseIdentifier];
  uint64_t v4 = [v2 dequeueReusableCellWithIdentifier:v3];

  return v4;
}

- (double)heightForHeaderView
{
  if (self->_headerView
    || ([(NTKCFaceDetailSectionController *)self titleForHeader],
        id v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 length],
        v3,
        v4))
  {
    +[NTKCFaceDetailSectionHeaderView headerHeight];
  }
  else
  {
    [(NTKCFaceDetailSectionHeaderView *)self->_headerView bounds];
    return CGRectGetHeight(*(CGRect *)&v6);
  }
  return result;
}

- (NTKCFaceDetailSectionHeaderView)headerView
{
  headerView = self->_headerView;
  if (headerView) {
    goto LABEL_2;
  }
  BOOL v5 = [(NTKCFaceDetailSectionController *)self titleForHeader];
  if (![v5 length])
  {

    headerView = self->_headerView;
LABEL_2:
    id v3 = headerView;
    goto LABEL_5;
  }
  id v3 = [(NTKCFaceDetailSectionController *)self _newSectionHeader];
  [(NTKCFaceDetailSectionHeaderView *)v3 setTitle:v5];

LABEL_5:
  return v3;
}

- (BOOL)canSelectRow:(int64_t)a3
{
  rows = self->_rows;
  if (!rows) {
    goto LABEL_12;
  }
  if ([(NSMutableArray *)rows count] <= (unint64_t)a3) {
    return 0;
  }
  if (!self->_rows)
  {
LABEL_12:
    if (a3 && self->_cell) {
      return 0;
    }
  }
  return [(NTKCFaceDetailSectionController *)self _canSelectRow:a3];
}

- (BOOL)_canSelectRow:(int64_t)a3
{
  return 0;
}

- (id)_newSectionHeader
{
  id v3 = [[NTKCFaceDetailSectionHeaderView alloc] initWithReuseIdentifier:0];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v4 = [(NTKCFaceDetailSectionController *)self _groupName];
    [(NTKCFaceDetailSectionHeaderView *)v3 setGroupName:v4];
  }
  return v3;
}

- (UITableView)tableView
{
  v2 = [(NTKCFaceDetailSectionController *)self tableViewController];
  id v3 = objc_msgSend(v2, "ntk_tableView");

  return (UITableView *)v3;
}

- (id)_groupName
{
  if (_os_feature_enabled_impl())
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v4 = [(NTKCFaceDetailSectionController *)self tableViewController];
    BOOL v5 = [v4 navigationController];
    uint64_t v6 = [v5 navigationBar];
    id v3 = [v6 _backdropViewLayerGroupName];
  }
  return v3;
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (void)setHeaderView:(id)a3
{
}

- (NSString)titleForHeader
{
  return self->_titleForHeader;
}

- (NTKFace)face
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_face);
  return (NTKFace *)WeakRetained;
}

- (void)setFace:(id)a3
{
}

- (BOOL)inGallery
{
  return self->_inGallery;
}

- (void)setInGallery:(BOOL)a3
{
  self->_inGallery = a3;
}

- (BOOL)hasSpacerRow
{
  return self->_hasSpacerRow;
}

- (void)setHasSpacerRow:(BOOL)a3
{
  self->_hasSpacerRow = a3;
}

- (NTKCTableViewProviding)tableViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableViewController);
  return (NTKCTableViewProviding *)WeakRetained;
}

- (void)setTableViewController:(id)a3
{
}

- (NTKCDetailTableViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
}

- (NSMutableArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_destroyWeak((id *)&self->_tableViewController);
  objc_destroyWeak((id *)&self->_face);
  objc_storeStrong((id *)&self->_titleForHeader, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end