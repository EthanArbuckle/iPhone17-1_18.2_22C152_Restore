@interface NTKCFaceDetailActionSectionController
- (BOOL)_canSelectRow:(int64_t)a3;
- (NTKCFaceDetailActionCell)deleteCell;
- (NTKCFaceDetailActionCell)selectCell;
- (NTKCFaceDetailActionSectionDelegate)delegate;
- (double)heightForRow:(int64_t)a3;
- (id)_spacerCell;
- (id)cellForRow:(int64_t)a3;
- (int64_t)_actionForRow:(int64_t)a3;
- (int64_t)numberOfRows;
- (void)_commonInit;
- (void)didSelectRow:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteCell:(id)a3;
- (void)setSelectCell:(id)a3;
@end

@implementation NTKCFaceDetailActionSectionController

- (void)_commonInit
{
  v3 = [[NTKCFaceDetailActionCell alloc] initWithAction:0];
  [(NTKCFaceDetailActionSectionController *)self setSelectCell:v3];

  v4 = [[NTKCFaceDetailActionCell alloc] initWithAction:1];
  [(NTKCFaceDetailActionSectionController *)self setDeleteCell:v4];
}

- (int64_t)numberOfRows
{
  return 4;
}

- (double)heightForRow:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      +[NTKCFaceDetailSpacerCell actionExtraRowHeight];
      break;
    case 1:
    case 3:
      v3 = NTKCFaceDetailActionCell;
      goto LABEL_3;
    case 2:
      v3 = NTKCFaceDetailSpacerCell;
LABEL_3:
      [(__objc2_class *)v3 rowHeight];
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (id)cellForRow:(int64_t)a3
{
  if (a3 == 3)
  {
    uint64_t v3 = 88;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint64_t v3 = 80;
LABEL_5:
    id v4 = *(id *)((char *)&self->super.super.isa + v3);
    goto LABEL_7;
  }
  id v4 = [(NTKCFaceDetailActionSectionController *)self _spacerCell];
LABEL_7:
  return v4;
}

- (BOOL)_canSelectRow:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (void)didSelectRow:(int64_t)a3
{
  int64_t v4 = [(NTKCFaceDetailActionSectionController *)self _actionForRow:a3];
  if (v4 == 1)
  {
    id v5 = [(NTKCFaceDetailActionSectionController *)self delegate];
    [v5 actionSectionDidDelete:self];
  }
  else
  {
    if (v4) {
      return;
    }
    id v5 = [(NTKCFaceDetailActionSectionController *)self delegate];
    [v5 actionSectionDidSelect:self];
  }
}

- (id)_spacerCell
{
  v2 = [(NTKCFaceDetailSectionController *)self tableView];
  uint64_t v3 = +[NTKCFaceDetailSpacerCell reuseIdentifier];
  int64_t v4 = [v2 dequeueReusableCellWithIdentifier:v3];

  return v4;
}

- (int64_t)_actionForRow:(int64_t)a3
{
  int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 == 3) {
    int64_t v3 = 1;
  }
  if (a3 == 1) {
    return 0;
  }
  else {
    return v3;
  }
}

- (NTKCFaceDetailActionSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKCFaceDetailActionSectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NTKCFaceDetailActionCell)selectCell
{
  return self->_selectCell;
}

- (void)setSelectCell:(id)a3
{
}

- (NTKCFaceDetailActionCell)deleteCell
{
  return self->_deleteCell;
}

- (void)setDeleteCell:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteCell, 0);
  objc_storeStrong((id *)&self->_selectCell, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end