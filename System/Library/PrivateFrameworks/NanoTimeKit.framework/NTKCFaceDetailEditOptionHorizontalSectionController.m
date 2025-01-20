@interface NTKCFaceDetailEditOptionHorizontalSectionController
- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4;
- (Class)editCellClass;
- (NTKCFaceDetailEditOptionHorizontalSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7;
- (void)didSelectRow:(int64_t)a3;
- (void)editOptionCell:(id)a3 didSelectOptionAtIndex:(int64_t)a4;
- (void)reloadActionRow;
- (void)setSelectedOptions:(id)a3;
@end

@implementation NTKCFaceDetailEditOptionHorizontalSectionController

- (NTKCFaceDetailEditOptionHorizontalSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7
{
  BOOL v9 = a5;
  id v12 = a4;
  id v13 = a7;
  v24.receiver = self;
  v24.super_class = (Class)NTKCFaceDetailEditOptionHorizontalSectionController;
  v14 = [(NTKCFaceDetailEditOptionSectionController *)&v24 _initWithTableViewController:a3 face:v12 inGallery:v9 editOptionCollection:a6 faceView:v13];
  v15 = v14;
  if (v14)
  {
    id v16 = objc_alloc([(NTKCFaceDetailEditOptionHorizontalSectionController *)v14 editCellClass]);
    v17 = [(NTKCFaceDetailEditOptionSectionController *)v15 collection];
    v18 = (void *)[v16 initWithCollection:v17 forFaceView:v13 face:v12];
    [(NTKCFaceDetailSectionController *)v15 setCell:v18];

    v19 = [(NTKCFaceDetailSectionController *)v15 cell];
    [v19 setDelegate:v15];

    v20 = (void *)MEMORY[0x1E4F1CA48];
    v21 = [(NTKCFaceDetailSectionController *)v15 cell];
    v22 = [v20 arrayWithObject:v21];
    [(NTKCFaceDetailSectionController *)v15 setRows:v22];
  }
  return v15;
}

- (void)didSelectRow:(int64_t)a3
{
  v5 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];
  if (v5)
  {
    v6 = [(NTKCFaceDetailSectionController *)self rows];
    v7 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];
    uint64_t v8 = [v6 indexOfObject:v7];
  }
  else
  {
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v8 == a3)
  {
    int64_t v9 = a3 - 1;
    v10 = [(NTKCFaceDetailEditOptionSectionController *)self optionAtIndex:v9];
    BOOL v11 = [(NTKCFaceDetailEditOptionSectionController *)self _handleDidSelectActionRowForOption:v10];

    if (v11)
    {
      id v12 = [(NTKCFaceDetailEditOptionSectionController *)self delegate];
      [v12 editOptionSection:self didSelectActionForOptionAtIndex:v9];
    }
  }
}

- (void)setSelectedOptions:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NTKCFaceDetailEditOptionHorizontalSectionController;
  [(NTKCFaceDetailEditOptionSectionController *)&v19 setSelectedOptions:v4];
  v5 = [(NTKCFaceDetailSectionController *)self cell];
  [v5 setSelectedOptions:v4];

  v6 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
  uint64_t v7 = [v6 collectionType];

  if (v7 == 1)
  {
    uint64_t v8 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
    int64_t v9 = [v8 slot];

    if (v9)
    {
      v10 = [(NTKCFaceDetailSectionController *)self face];
      BOOL v11 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
      uint64_t v12 = [v11 mode];
      id v13 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
      v14 = [v13 slot];
      v15 = [v10 selectedOptionForCustomEditMode:v12 slot:v14];
    }
    else
    {
      id v16 = NSNumber;
      v10 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
      BOOL v11 = objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v10, "mode"));
      v15 = [v4 objectForKeyedSubscript:v11];
    }

    v17 = [v15 localizedName];
    v18 = [(NTKCFaceDetailSectionController *)self headerView];
    [v18 setSubtitle:v17];
  }
  [(NTKCFaceDetailEditOptionHorizontalSectionController *)self reloadActionRow];
}

- (void)reloadActionRow
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v3 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];
  BOOL v4 = [(NTKCFaceDetailEditOptionSectionController *)self _hasActionRow];
  if (!v4)
  {
LABEL_5:
    if (!v3) {
      goto LABEL_16;
    }
    goto LABEL_6;
  }
  if (!v3)
  {
    [(NTKCFaceDetailEditOptionSectionController *)self _createActionRow];
    v3 = [(NTKCFaceDetailEditOptionSectionController *)self actionRow];
    goto LABEL_5;
  }
  [(NTKCFaceDetailEditOptionSectionController *)self _refreshActionRowContent];
LABEL_6:
  v5 = [(NTKCFaceDetailSectionController *)self rows];
  uint64_t v6 = [v5 count];

  char v7 = v6 == 1 || v4;
  if ((v7 & 1) == 0)
  {
    v14 = [(NTKCFaceDetailSectionController *)self rows];
    uint64_t v15 = [v14 indexOfObject:v3];

    id v16 = [(NTKCFaceDetailSectionController *)self rows];
    [v16 removeObject:v3];

    [(NTKCFaceDetailSectionController *)self setHasSpacerRow:0];
    v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v15, -[NTKCFaceDetailSectionController section](self, "section"));
    BOOL v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v10, "row") + 1, -[NTKCFaceDetailSectionController section](self, "section"));
    uint64_t v12 = [(NTKCFaceDetailSectionController *)self tableView];
    v18[0] = v10;
    v18[1] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    [v12 deleteRowsAtIndexPaths:v13 withRowAnimation:100];
    goto LABEL_15;
  }
  char v8 = !v4;
  if (v6 != 1) {
    char v8 = 1;
  }
  if ((v8 & 1) == 0)
  {
    int64_t v9 = [(NTKCFaceDetailSectionController *)self rows];
    [v9 insertObject:v3 atIndex:1];

    v10 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", 1, -[NTKCFaceDetailSectionController section](self, "section"));
    BOOL v11 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", objc_msgSend(v10, "row") + 1, -[NTKCFaceDetailSectionController section](self, "section"));
    [(NTKCFaceDetailSectionController *)self setHasSpacerRow:1];
    uint64_t v12 = [(NTKCFaceDetailSectionController *)self tableView];
    v17[0] = v10;
    v17[1] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    [v12 insertRowsAtIndexPaths:v13 withRowAnimation:100];
LABEL_15:
  }
LABEL_16:
}

- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(NTKCFaceDetailEditOptionSectionController *)self setCollection:v7];
  char v8 = [(NTKCFaceDetailSectionController *)self cell];
  char v9 = [v8 collectionChanged:v7 withSelectedOptions:v6];

  return v9;
}

- (void)editOptionCell:(id)a3 didSelectOptionAtIndex:(int64_t)a4
{
  id v6 = [(NTKCFaceDetailEditOptionSectionController *)self delegate];
  [v6 editOptionSection:self didSelectOptionAtIndex:a4];
}

- (Class)editCellClass
{
  return (Class)objc_opt_class();
}

@end