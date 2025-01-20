@interface NTKCFaceDetailEditOptionSectionController
- (BOOL)_canDisplayActionRowForCustomEditMode:(int64_t)a3 andOption:(id)a4;
- (BOOL)_canSelectRow:(int64_t)a3;
- (BOOL)_handleDidSelectActionRowForOption:(id)a3;
- (BOOL)_handleDidSelectOption:(id)a3;
- (BOOL)_hasActionRow;
- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4;
- (Class)actionRowCellClass;
- (Class)editCellClass;
- (NSDictionary)selectedOptions;
- (NTKCFaceDetailEditOptionSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7;
- (NTKCFaceDetailEditOptionSectionDelegate)delegate;
- (NTKCFaceDetailRowActionCell)actionRow;
- (NTKEditOptionCollection)collection;
- (NTKFaceView)faceView;
- (id)_actionNameForOption:(id)a3;
- (id)_initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7;
- (id)optionAtIndex:(unint64_t)a3;
- (void)_createActionRow;
- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4;
- (void)_refreshActionRowContent;
- (void)_updateSelectedOptions;
- (void)setActionRow:(id)a3;
- (void)setCollection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFaceView:(id)a3;
- (void)setSelectedOptions:(id)a3;
@end

@implementation NTKCFaceDetailEditOptionSectionController

- (NTKCFaceDetailEditOptionSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  [v13 collectionType];
  v16 = (NTKCFaceDetailEditOptionSectionController *)[objc_alloc((Class)objc_opt_class()) initWithTableViewController:v15 face:v14 inGallery:v8 editOptionCollection:v13 faceView:v12];

  return v16;
}

- (id)_initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7
{
  BOOL v8 = a5;
  id v12 = a6;
  id v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)NTKCFaceDetailEditOptionSectionController;
  id v14 = [(NTKCFaceDetailSectionController *)&v20 initWithTableViewController:a3 face:a4 inGallery:v8];
  id v15 = v14;
  if (v14)
  {
    [(NTKCFaceDetailEditOptionSectionController *)v14 setCollection:v12];
    [(NTKCFaceDetailEditOptionSectionController *)v15 setFaceView:v13];
    id v16 = [(NTKCFaceDetailSectionController *)v15 _newSectionHeader];
    [(NTKCFaceDetailSectionController *)v15 setHeaderView:v16];

    v17 = [v12 localizedName];
    v18 = [(NTKCFaceDetailSectionController *)v15 headerView];
    [v18 setTitle:v17];
  }
  return v15;
}

- (void)_updateSelectedOptions
{
  v3 = [(NTKCFaceDetailSectionController *)self face];
  v4 = [v3 selectedOptionsForCustomEditModes];
  id v18 = (id)[v4 mutableCopy];

  v5 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
  uint64_t v6 = [v5 slot];
  if (v6)
  {
    v7 = (void *)v6;
    BOOL v8 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
    uint64_t v9 = [v8 mode];

    if (!v9) {
      goto LABEL_6;
    }
    v10 = [(NTKCFaceDetailSectionController *)self face];
    v11 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
    uint64_t v12 = [v11 mode];
    id v13 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
    id v14 = [v13 slot];
    v5 = [v10 selectedOptionForCustomEditMode:v12 slot:v14];

    if (v5)
    {
      id v15 = NSNumber;
      id v16 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
      v17 = objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "mode"));
      [v18 setObject:v5 forKeyedSubscript:v17];
    }
  }

LABEL_6:
  [(NTKCFaceDetailEditOptionSectionController *)self setSelectedOptions:v18];
}

- (BOOL)_canSelectRow:(int64_t)a3
{
  v5 = [(NTKCFaceDetailSectionController *)self rows];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];
  LOBYTE(a3) = v6 == self->_actionRow;

  return a3;
}

- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4
{
  return 0;
}

- (id)optionAtIndex:(unint64_t)a3
{
  v4 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
  v5 = [v4 options];
  uint64_t v6 = [v5 objectAtIndexedSubscript:a3];

  return v6;
}

- (BOOL)_canDisplayActionRowForCustomEditMode:(int64_t)a3 andOption:(id)a4
{
  return 1;
}

- (BOOL)_handleDidSelectOption:(id)a3
{
  return 1;
}

- (BOOL)_handleDidSelectActionRowForOption:(id)a3
{
  return 1;
}

- (Class)actionRowCellClass
{
  return 0;
}

- (BOOL)_hasActionRow
{
  v3 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
  uint64_t v4 = [v3 mode];

  v5 = [(NTKCFaceDetailEditOptionSectionController *)self selectedOptions];
  uint64_t v6 = [NSNumber numberWithInteger:v4];
  v7 = [v5 objectForKeyedSubscript:v6];

  BOOL v8 = [(NTKCFaceDetailSectionController *)self face];
  uint64_t v9 = objc_opt_class();
  v10 = [(NTKCFaceDetailSectionController *)self face];
  v11 = [v10 device];
  if ([v9 customEditMode:v4 hasActionForOption:v7 forDevice:v11]) {
    BOOL v12 = [(NTKCFaceDetailEditOptionSectionController *)self _canDisplayActionRowForCustomEditMode:v4 andOption:v7];
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_createActionRow
{
  if (!self->_actionRow)
  {
    v3 = (NTKCFaceDetailRowActionCell *)objc_alloc_init([(NTKCFaceDetailEditOptionSectionController *)self actionRowCellClass]);
    actionRow = self->_actionRow;
    self->_actionRow = v3;
  }

  [(NTKCFaceDetailEditOptionSectionController *)self _refreshActionRowContent];
}

- (void)_refreshActionRowContent
{
  v3 = [(NTKCFaceDetailEditOptionSectionController *)self selectedOptions];
  uint64_t v4 = NSNumber;
  v5 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
  uint64_t v6 = objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "mode"));
  id v7 = [v3 objectForKeyedSubscript:v6];

  [(NTKCFaceDetailEditOptionSectionController *)self _customizeActionRow:self->_actionRow withEditOption:v7];
}

- (id)_actionNameForOption:(id)a3
{
  return (id)[a3 localizedNameForAction];
}

- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(NTKCFaceDetailEditOptionSectionController *)self _actionNameForOption:v6];
    BOOL v8 = [v9 textLabel];
    [v8 setText:v7];
  }
}

- (NTKEditOptionCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (NTKFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);

  return (NTKFaceView *)WeakRetained;
}

- (void)setFaceView:(id)a3
{
}

- (NSDictionary)selectedOptions
{
  return self->_selectedOptions;
}

- (void)setSelectedOptions:(id)a3
{
}

- (NTKCFaceDetailEditOptionSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKCFaceDetailEditOptionSectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (Class)editCellClass
{
  return self->_editCellClass;
}

- (NTKCFaceDetailRowActionCell)actionRow
{
  return self->_actionRow;
}

- (void)setActionRow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionRow, 0);
  objc_storeStrong((id *)&self->_editCellClass, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedOptions, 0);
  objc_destroyWeak((id *)&self->_faceView);

  objc_storeStrong((id *)&self->_collection, 0);
}

@end