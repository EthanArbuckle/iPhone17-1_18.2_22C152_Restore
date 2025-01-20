@interface NTKCFaceDetailEditOptionVerticalSectionController
- (BOOL)_canSelectRow:(int64_t)a3;
- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4;
- (Class)actionRowCellClass;
- (NSString)footer;
- (NTKCFaceDetailDescriptionCell)footerCell;
- (NTKCFaceDetailEditOptionVerticalSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7;
- (double)heightForRow:(int64_t)a3;
- (id)cellForEditOption:(id)a3;
- (id)cellForRow:(int64_t)a3;
- (int64_t)numberOfRows;
- (void)_setupWithCollection:(id)a3;
- (void)didSelectRow:(int64_t)a3;
- (void)reloadActionRow;
- (void)setFooter:(id)a3;
- (void)setFooterCell:(id)a3;
- (void)setSelectedOptions:(id)a3;
@end

@implementation NTKCFaceDetailEditOptionVerticalSectionController

- (NTKCFaceDetailEditOptionVerticalSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7
{
  v10.receiver = self;
  v10.super_class = (Class)NTKCFaceDetailEditOptionVerticalSectionController;
  v7 = [(NTKCFaceDetailEditOptionSectionController *)&v10 _initWithTableViewController:a3 face:a4 inGallery:a5 editOptionCollection:a6 faceView:a7];
  v8 = v7;
  if (v7) {
    [(NTKCFaceDetailEditOptionVerticalSectionController *)v7 _setupWithCollection:0];
  }
  return v8;
}

- (BOOL)_canSelectRow:(int64_t)a3
{
  return 1;
}

- (void)didSelectRow:(int64_t)a3
{
  v5 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];
  if (v5)
  {
    v6 = [(NTKCFaceDetailSectionController *)self rows];
    v7 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];
    unint64_t v8 = [v6 indexOfObject:v7];
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v8 == a3)
  {
    int64_t v9 = a3 - 1;
    objc_super v10 = [(NTKCFaceDetailEditOptionSectionController *)self optionAtIndex:v9];
    BOOL v11 = [(NTKCFaceDetailEditOptionSectionController *)self _handleDidSelectActionRowForOption:v10];

    if (!v11) {
      return;
    }
    id v20 = [(NTKCFaceDetailEditOptionSectionController *)self delegate];
    [v20 editOptionSection:self didSelectActionForOptionAtIndex:v9];
    goto LABEL_16;
  }
  v12 = [(NTKCFaceDetailSectionController *)self rows];
  v13 = [v12 objectAtIndexedSubscript:a3];
  char v14 = [v13 active];

  if ((v14 & 1) == 0)
  {
    BOOL v15 = v8 == 0x7FFFFFFFFFFFFFFFLL || v8 >= a3;
    BOOL v16 = !v15;
    int64_t v17 = a3 - v16;
    v18 = [(NTKCFaceDetailEditOptionSectionController *)self optionAtIndex:v17];
    BOOL v19 = [(NTKCFaceDetailEditOptionSectionController *)self _handleDidSelectOption:v18];

    if (v19)
    {
      id v20 = [(NTKCFaceDetailEditOptionSectionController *)self delegate];
      [v20 editOptionSection:self didSelectOptionAtIndex:v17];
LABEL_16:
    }
  }
}

- (void)setSelectedOptions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCFaceDetailEditOptionVerticalSectionController;
  [(NTKCFaceDetailEditOptionSectionController *)&v4 setSelectedOptions:a3];
  [(NTKCFaceDetailEditOptionVerticalSectionController *)self reloadActionRow];
}

- (Class)actionRowCellClass
{
  return 0;
}

- (void)reloadActionRow
{
  v51[1] = *MEMORY[0x1E4F143B8];
  v3 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
  uint64_t v4 = [v3 mode];

  v5 = [(NTKCFaceDetailEditOptionSectionController *)self selectedOptions];
  v6 = [NSNumber numberWithInteger:v4];
  v7 = [v5 objectForKeyedSubscript:v6];

  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
  unint64_t v8 = [(NTKCFaceDetailSectionController *)self rows];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __68__NTKCFaceDetailEditOptionVerticalSectionController_reloadActionRow__block_invoke;
  v36 = &unk_1E62C3F20;
  v37 = self;
  v39 = &v46;
  id v9 = v7;
  v40 = &v42;
  uint64_t v41 = v4;
  id v38 = v9;
  [v8 enumerateObjectsUsingBlock:&v33];

  uint64_t v10 = v47[3];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v43[3] != v10)
  {
    BOOL v11 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];
    BOOL v12 = v11 == 0;

    if (!v12)
    {
      v13 = [(NTKCFaceDetailSectionController *)self rows];
      char v14 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];
      uint64_t v15 = [v13 indexOfObject:v14];

      BOOL v16 = [(NTKCFaceDetailSectionController *)self rows];
      int64_t v17 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];
      [v16 removeObject:v17];

      v18 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v15, -[NTKCFaceDetailSectionController section](self, "section"));
      if (v18)
      {
        BOOL v19 = [(NTKCFaceDetailSectionController *)self tableView];
        v51[0] = v18;
        id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
        [v19 deleteRowsAtIndexPaths:v20 withRowAnimation:100];
      }
      [(NTKCFaceDetailEditOptionSectionController *)self setActionRow:0];
    }
  }
  unint64_t v21 = v43[3];
  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v22 = v47[3];
    if (v22 != 0x7FFFFFFFFFFFFFFFLL && v21 > v22) {
      v43[3] = v21 - 1;
    }
    v23 = [(NTKCFaceDetailSectionController *)self rows];
    v24 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];
    int v25 = [v23 containsObject:v24];

    if (v25)
    {
      [(NTKCFaceDetailEditOptionSectionController *)self _refreshActionRowContent];
    }
    else
    {
      [(NTKCFaceDetailEditOptionSectionController *)self _createActionRow];
      v26 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];
      BOOL v27 = v26 == 0;

      if (!v27)
      {
        v28 = [(NTKCFaceDetailSectionController *)self rows];
        v29 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];
        [v28 insertObject:v29 atIndex:v43[3]];

        v30 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v43[3], -[NTKCFaceDetailSectionController section](self, "section"));
        v31 = [(NTKCFaceDetailSectionController *)self tableView];
        v50 = v30;
        v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
        [v31 insertRowsAtIndexPaths:v32 withRowAnimation:100];
      }
    }
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

void __68__NTKCFaceDetailEditOptionVerticalSectionController_reloadActionRow__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v16 = a2;
  id v5 = [*(id *)(a1 + 32) actionRow];

  v6 = v16;
  if (v5 == v16)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
  else
  {
    v7 = [v16 editOption];
    objc_msgSend(v16, "setActive:", objc_msgSend(v7, "isEqual:", *(void *)(a1 + 40)));

    int v8 = [v16 active];
    v6 = v16;
    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) face];
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = *(void *)(a1 + 64);
      uint64_t v12 = *(void *)(a1 + 40);
      v13 = [*(id *)(a1 + 32) face];
      char v14 = [v13 device];
      if ([v10 customEditMode:v11 hasActionForOption:v12 forDevice:v14])
      {
        int v15 = [*(id *)(a1 + 32) _canDisplayActionRowForCustomEditMode:*(void *)(a1 + 64) andOption:*(void *)(a1 + 40)];

        v6 = v16;
        if (v15) {
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3 + 1;
        }
      }
      else
      {

        v6 = v16;
      }
    }
  }
}

- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4
{
  id v6 = a4;
  [(NTKCFaceDetailEditOptionVerticalSectionController *)self _setupWithCollection:a3];
  [(NTKCFaceDetailEditOptionVerticalSectionController *)self setSelectedOptions:v6];

  return 1;
}

- (void)_setupWithCollection:(id)a3
{
  id v18 = a3;
  if (v18)
  {
    [(NTKCFaceDetailEditOptionSectionController *)self setCollection:v18];
    id v4 = [(NTKCFaceDetailSectionController *)self _newSectionHeader];
    [(NTKCFaceDetailSectionController *)self setHeaderView:v4];

    id v5 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
    id v6 = [v5 localizedName];
    v7 = [(NTKCFaceDetailSectionController *)self headerView];
    [v7 setTitle:v6];
  }
  int v8 = objc_opt_new();
  id v9 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
  uint64_t v10 = [v9 options];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      v13 = [(NTKCFaceDetailEditOptionSectionController *)self optionAtIndex:v12];
      char v14 = [(NTKCFaceDetailEditOptionVerticalSectionController *)self cellForEditOption:v13];
      [v8 addObject:v14];

      ++v12;
      int v15 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
      id v16 = [v15 options];
      unint64_t v17 = [v16 count];
    }
    while (v12 < v17);
  }
  [(NTKCFaceDetailSectionController *)self setRows:v8];
}

- (id)cellForEditOption:(id)a3
{
  id v3 = a3;
  id v4 = [[NTKCFaceDetailEnumeratedEditOptionCell alloc] initWithEditOption:v3];

  return v4;
}

- (int64_t)numberOfRows
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCFaceDetailEditOptionVerticalSectionController;
  id v3 = [(NTKCFaceDetailSectionController *)&v6 numberOfRows];
  id v4 = [(NTKCFaceDetailEditOptionVerticalSectionController *)self footerCell];

  if (v4) {
    return (int64_t)v3 + 1;
  }
  else {
    return (int64_t)v3;
  }
}

- (id)cellForRow:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKCFaceDetailEditOptionVerticalSectionController;
  id v5 = -[NTKCFaceDetailSectionController cellForRow:](&v9, sel_cellForRow_);
  if (!v5)
  {
    objc_super v6 = [(NTKCFaceDetailSectionController *)self rows];
    uint64_t v7 = [v6 count];

    if (v7 == a3)
    {
      id v5 = [(NTKCFaceDetailEditOptionVerticalSectionController *)self footerCell];
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (double)heightForRow:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NTKCFaceDetailEditOptionVerticalSectionController;
  -[NTKCFaceDetailSectionController heightForRow:](&v12, sel_heightForRow_);
  double v6 = v5;
  if (v5 == 0.0)
  {
    uint64_t v7 = [(NTKCFaceDetailSectionController *)self rows];
    uint64_t v8 = [v7 count];

    if (v8 == a3)
    {
      objc_super v9 = [(NTKCFaceDetailEditOptionVerticalSectionController *)self footerCell];
      [v9 rowHeight];
      double v6 = v10;
    }
  }
  return v6;
}

- (void)setFooter:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_footer, a3);
  footer = self->_footer;
  uint64_t v7 = [(NTKCFaceDetailEditOptionVerticalSectionController *)self footerCell];

  if (footer)
  {
    if (!v7)
    {
      uint64_t v8 = objc_alloc_init(NTKCFaceDetailDescriptionCell);
      [(NTKCFaceDetailEditOptionVerticalSectionController *)self setFooterCell:v8];

      objc_super v9 = (void *)MEMORY[0x1E4F28D58];
      double v10 = [(NTKCFaceDetailSectionController *)self rows];
      uint64_t v11 = objc_msgSend(v9, "indexPathForRow:inSection:", objc_msgSend(v10, "count"), -[NTKCFaceDetailSectionController section](self, "section"));

      objc_super v12 = [(NTKCFaceDetailSectionController *)self tableView];
      v20[0] = v11;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v12 insertRowsAtIndexPaths:v13 withRowAnimation:100];
    }
    char v14 = [(NTKCFaceDetailEditOptionVerticalSectionController *)self footerCell];
    [v14 setText:v5];
    goto LABEL_7;
  }
  if (v7)
  {
    [(NTKCFaceDetailEditOptionVerticalSectionController *)self setFooterCell:0];
    int v15 = (void *)MEMORY[0x1E4F28D58];
    id v16 = [(NTKCFaceDetailSectionController *)self rows];
    char v14 = objc_msgSend(v15, "indexPathForRow:inSection:", objc_msgSend(v16, "count"), -[NTKCFaceDetailSectionController section](self, "section"));

    unint64_t v17 = [(NTKCFaceDetailSectionController *)self tableView];
    BOOL v19 = v14;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
    [v17 deleteRowsAtIndexPaths:v18 withRowAnimation:100];

LABEL_7:
  }
}

- (NTKCFaceDetailDescriptionCell)footerCell
{
  return self->_footerCell;
}

- (void)setFooterCell:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_footerCell, 0);
}

@end