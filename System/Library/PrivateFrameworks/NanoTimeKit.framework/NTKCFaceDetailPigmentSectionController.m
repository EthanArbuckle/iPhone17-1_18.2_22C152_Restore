@interface NTKCFaceDetailPigmentSectionController
+ (BOOL)hasSectionForFace:(id)a3 forEditMode:(int64_t)a4;
- (BOOL)_handleDidSelectOption:(id)a3;
- (BOOL)_hasActionRow;
- (Class)actionRowCellClass;
- (Class)editCellClass;
- (NTKCFaceDetailPigmentSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7;
- (UIViewController)parentViewController;
- (id)optionAtIndex:(unint64_t)a3;
- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4;
- (void)_presentPigmentPickerForSlot:(id)a3;
- (void)pigmentColorSliderCell:(id)a3 colorFractionChanged:(double)a4 transiently:(BOOL)a5 canceled:(BOOL)a6;
- (void)pigmentEditOptionCellDidSelectAddOption:(id)a3;
- (void)setParentViewController:(id)a3;
@end

@implementation NTKCFaceDetailPigmentSectionController

+ (BOOL)hasSectionForFace:(id)a3 forEditMode:(int64_t)a4
{
  BOOL result = [a3 supportsPigmentUI];
  if (a4 != 10) {
    return 0;
  }
  return result;
}

- (NTKCFaceDetailPigmentSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)NTKCFaceDetailPigmentSectionController;
  v13 = [(NTKCFaceDetailEditOptionHorizontalSectionController *)&v18 initWithTableViewController:a3 face:a4 inGallery:v8 editOptionCollection:a6 faceView:v12];
  if (v13)
  {
    v14 = [v12 faceColorPalette];
    uint64_t v15 = [v14 copy];
    palette = v13->_palette;
    v13->_palette = (NTKFaceColorPalette *)v15;
  }
  return v13;
}

- (Class)editCellClass
{
  return (Class)objc_opt_class();
}

- (Class)actionRowCellClass
{
  return (Class)objc_opt_class();
}

- (id)optionAtIndex:(unint64_t)a3
{
  v4 = [(NTKCFaceDetailSectionController *)self cell];
  v5 = [v4 optionAtIndex:a3];

  return v5;
}

- (BOOL)_hasActionRow
{
  v3 = [(NTKCFaceDetailSectionController *)self face];
  v4 = [v3 selectedSlotForEditMode:10];

  v5 = [(NTKCFaceDetailEditOptionSectionController *)self faceView];
  int v6 = [v5 allowsEditingSliderEditableColorsForSlot:v4];

  if (v6)
  {
    v7 = [(NTKCFaceDetailEditOptionSectionController *)self selectedOptions];
    BOOL v8 = [v7 objectForKeyedSubscript:&unk_1F16E14B8];

    if ([v8 conformsToProtocol:&unk_1FCDEF740])
    {
      v9 = [v8 pigmentEditOption];
      char v10 = [v9 supportsSlider];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4
{
  v13[3] = *MEMORY[0x1E4F143B8];
  if (!self->_suppressActionRowUpdates)
  {
    id v5 = a3;
    int v6 = [(NTKCFaceDetailEditOptionSectionController *)self selectedOptions];
    v7 = [v6 objectForKeyedSubscript:&unk_1F16E14B8];

    BOOL v8 = [[NTKFaceColorPaletteConfiguration alloc] initWithPigmentEditOption:v7];
    [(NTKFaceColorPalette *)self->_palette setConfiguration:v8];
    v9 = [(NTKFaceColorPalette *)self->_palette primaryColorWithFraction:0.0];
    char v10 = [(NTKFaceColorPalette *)self->_palette primaryColorWithFraction:0.5];
    v11 = [(NTKFaceColorPalette *)self->_palette primaryColorWithFraction:1.0];
    v13[0] = v9;
    v13[1] = v10;
    v13[2] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
    [v5 setColors:v12 animated:1];

    [v7 colorFraction];
    objc_msgSend(v5, "setColorFraction:animated:", 1);
    [v5 setDelegate:self];
  }
}

- (BOOL)_handleDidSelectOption:(id)a3
{
  return 1;
}

- (void)pigmentEditOptionCellDidSelectAddOption:(id)a3
{
  id v5 = [(NTKCFaceDetailEditOptionSectionController *)self collection];
  v4 = [v5 slot];
  [(NTKCFaceDetailPigmentSectionController *)self _presentPigmentPickerForSlot:v4];
}

- (void)pigmentColorSliderCell:(id)a3 colorFractionChanged:(double)a4 transiently:(BOOL)a5 canceled:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  self->_suppressActionRowUpdates = 1;
  char v10 = [(NTKCFaceDetailEditOptionSectionController *)self selectedOptions];
  id v15 = [v10 objectForKeyedSubscript:&unk_1F16E14B8];

  if (v6) {
    id v11 = v15;
  }
  else {
    id v11 = (id)[v15 copyWithColorFraction:a4];
  }
  id v12 = v11;
  v13 = [(NTKCFaceDetailSectionController *)self cell];
  [v13 modifiedColor:v12];
  v14 = [(NTKCFaceDetailEditOptionSectionController *)self delegate];
  [v14 editOptionSection:self didModifyEditOption:v12 transiently:v7 canceled:v6];

  self->_suppressActionRowUpdates = 0;
}

- (void)_presentPigmentPickerForSlot:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [NTKPigmentAddController alloc];
  BOOL v6 = [(NTKCFaceDetailSectionController *)self face];
  BOOL v7 = [(NTKCFaceDetailEditOptionSectionController *)self faceView];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__NTKCFaceDetailPigmentSectionController__presentPigmentPickerForSlot___block_invoke;
  v10[3] = &unk_1E62C3508;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  BOOL v8 = [(NTKPigmentAddController *)v5 initWithFace:v6 faceView:v7 slot:v4 willExitHandler:v10];

  v9 = [(NTKCFaceDetailPigmentSectionController *)self parentViewController];
  [v9 presentViewController:v8 animated:1 completion:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __71__NTKCFaceDetailPigmentSectionController__presentPigmentPickerForSlot___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v5 = [WeakRetained face];
    [v5 handleColorEditOptionsChanged];

    id WeakRetained = v7;
    if (a2)
    {
      BOOL v6 = [*(id *)(a1 + 32) cell];
      [v6 selectLastColor];

      id WeakRetained = v7;
    }
  }
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_palette, 0);
}

@end