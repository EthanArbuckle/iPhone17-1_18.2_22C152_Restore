@interface NTKCFaceDetailPigmentEditOptionCell
- (BOOL)_isReloadCollectionRequired:(id)a3 selectedOptions:(id)a4;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (NTKCFaceDetailPigmentEditOptionCell)initWithCollection:(id)a3 forFaceView:(id)a4 face:(id)a5;
- (id)_configurationFromCollection:(id)a3 selectedOptions:(id)a4;
- (id)_dequeueCellForIndexPath:(id)a3;
- (id)_dividerImage;
- (id)_imageForIndexPath:(id)a3;
- (id)_indexPathForEditOptionIndex:(int64_t)a3;
- (id)_plusImage;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)optionAtIndex:(unint64_t)a3;
- (int64_t)_editOptionIndexForIndexPath:(id)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_setupFromCollection;
- (void)addCellTapped:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)modifiedColor:(id)a3;
- (void)selectLastColor;
@end

@implementation NTKCFaceDetailPigmentEditOptionCell

- (NTKCFaceDetailPigmentEditOptionCell)initWithCollection:(id)a3 forFaceView:(id)a4 face:(id)a5
{
  v27.receiver = self;
  v27.super_class = (Class)NTKCFaceDetailPigmentEditOptionCell;
  v5 = [(NTKCFaceDetailEditOptionCell *)&v27 initWithCollection:a3 forFaceView:a4 face:a5];
  if (v5)
  {
    uint64_t v6 = +[NTKPigmentEditOptionArray array];
    editingModifiedColors = v5->_editingModifiedColors;
    v5->_editingModifiedColors = (NTKPigmentEditOptionArray *)v6;

    uint64_t v8 = +[NTKPigmentEditOptionArray array];
    previouslySelectedColors = v5->_previouslySelectedColors;
    v5->_previouslySelectedColors = (NTKPigmentEditOptionArray *)v8;

    v10 = [(NTKCFaceDetailEditOptionCell *)v5 layout];
    v11 = [(NTKCFaceDetailPigmentEditOptionCell *)v5 _dividerImage];
    [v11 size];
    double v13 = v12;
    CGFloat v15 = v14;

    [v10 itemSize];
    double v17 = v16;
    CGFloat v19 = v18;
    [(NTKCFaceDetailEditOptionCell *)v5 swatchFrame];
    v5->_dividerItemSize.width = v13 + v17 - v20;
    v5->_dividerItemSize.height = v19;
    v5->_dividerSwatchRect.origin.x = v21;
    v5->_dividerSwatchRect.origin.y = v22;
    v5->_dividerSwatchRect.size.width = v13;
    v5->_dividerSwatchRect.size.height = v15;
    v23 = [(NTKCFaceDetailEditOptionCell *)v5 collectionView];
    uint64_t v24 = objc_opt_class();
    v25 = +[_NTKCFaceDetailPigmentAddCell reuseIdentifier];
    [v23 registerClass:v24 forCellWithReuseIdentifier:v25];
  }
  return v5;
}

- (void)modifiedColor:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  editingModifiedColors = self->_editingModifiedColors;
  id v5 = a3;
  [(NTKPigmentEditOptionArray *)editingModifiedColors addPigment:v5];
  unint64_t v6 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration indexOfColor:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration editableColors];
    unint64_t v8 = [v7 count];

    BOOL v9 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration hasSeparator];
    BOOL v10 = v6 >= v8 && v9;
    uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 + v10 inSection:0];
    if (v11)
    {
      double v12 = (void *)v11;
      double v13 = [(NTKCFaceDetailEditOptionCell *)self collectionView];
      v15[0] = v12;
      double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [v13 reloadItemsAtIndexPaths:v14];
    }
  }
}

- (void)selectLastColor
{
  v3 = [(NTKCFaceDetailEditOptionCell *)self collection];
  uint64_t v4 = [v3 mode];

  id v5 = [(NTKCFaceDetailEditOptionCell *)self collection];
  id v10 = [v5 slot];

  unint64_t v6 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration numberOfColors];
  if (v6)
  {
    v7 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration colorAtIndex:v6 - 1];
  }
  else
  {
    unint64_t v8 = [(NTKCFaceDetailEditOptionCell *)self face];
    v7 = [v8 defaultOptionForCustomEditMode:v4 slot:v10];
  }
  BOOL v9 = [(NTKCFaceDetailEditOptionCell *)self face];
  [v9 selectOption:v7 forCustomEditMode:v4 slot:v10];
}

- (id)optionAtIndex:(unint64_t)a3
{
  id v5 = [(NTKCFaceDetailEditOptionCell *)self collection];
  unint64_t v6 = [v5 options];
  v7 = [v6 objectAtIndex:a3];

  if ([v7 conformsToProtocol:&unk_1FCDEF740])
  {
    unint64_t v8 = [v7 pigmentEditOption];
    BOOL v9 = [(NTKPigmentEditOptionArray *)self->_editingModifiedColors pigmentForPigment:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_setupFromCollection
{
  v10.receiver = self;
  v10.super_class = (Class)NTKCFaceDetailPigmentEditOptionCell;
  [(NTKCFaceDetailEditOptionCell *)&v10 _setupFromCollection];
  v3 = [(NTKCFaceDetailEditOptionCell *)self selectedOptions];
  uint64_t v4 = [v3 objectForKeyedSubscript:&unk_1F16E1878];

  if ([v4 conformsToProtocol:&unk_1FCDEF740])
  {
    id v5 = [v4 pigmentEditOption];
    [(NTKPigmentEditOptionArray *)self->_editingModifiedColors addPigment:v5];
    [(NTKPigmentEditOptionArray *)self->_previouslySelectedColors addPigment:v5];
  }
  unint64_t v6 = [(NTKCFaceDetailEditOptionCell *)self collection];
  v7 = [(NTKCFaceDetailEditOptionCell *)self selectedOptions];
  unint64_t v8 = [(NTKCFaceDetailPigmentEditOptionCell *)self _configurationFromCollection:v6 selectedOptions:v7];
  configuration = self->_configuration;
  self->_configuration = v8;
}

- (id)_configurationFromCollection:(id)a3 selectedOptions:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v27 = a4;
  id v28 = (id)objc_opt_new();
  v30 = [v27 objectForKeyedSubscript:&unk_1F16E1878];
  id v5 = v30;
  if ([v30 conformsToProtocol:&unk_1FCDEF740])
  {
    unint64_t v6 = [v30 pigmentEditOption];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __84__NTKCFaceDetailPigmentEditOptionCell__configurationFromCollection_selectedOptions___block_invoke;
    aBlock[3] = &unk_1E62C4898;
    id v26 = v28;
    id v42 = v26;
    v7 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    unint64_t v8 = [v29 options];
    char v9 = 0;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ([v13 conformsToProtocol:&unk_1FCDEF740])
          {
            double v14 = [v13 pigmentEditOption];
            if ([v14 isEqualIgnoringFraction:v6])
            {
              v7[2](v7, v6, 1);
              char v9 = 1;
            }
            else
            {
              BOOL v15 = [(NTKPigmentEditOptionArray *)self->_previouslySelectedColors containsPigment:v14];
              double v16 = v7[2];
              if (v15) {
                v16(v7, v14, 1);
              }
              else {
                v16(v7, v14, 0);
              }
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v10);
    }

    if (!((v6 == 0) | v9 & 1)) {
      v7[2](v7, v6, 1);
    }
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    double v17 = [(NTKCFaceDetailEditOptionCell *)self face];
    int v18 = [v17 supportsPigmentUI];

    if (v18)
    {
      CGFloat v19 = [(NTKCFaceDetailEditOptionCell *)self face];
      double v20 = [v19 pigmentOptionProvider];
      CGFloat v21 = [(NTKCFaceDetailEditOptionCell *)self collection];
      CGFloat v22 = [v21 slot];
      v23 = [v20 availableColorsForSlot:v22];

      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __84__NTKCFaceDetailPigmentEditOptionCell__configurationFromCollection_selectedOptions___block_invoke_2;
      v32[3] = &unk_1E62C48C0;
      v32[4] = &v33;
      [v23 enumerateObjectsUsingBlock:v32];
    }
    [v26 setCanAddColors:*((unsigned __int8 *)v34 + 24)];
    id v24 = v26;
    _Block_object_dispose(&v33, 8);

    id v5 = v30;
  }

  return v28;
}

void __84__NTKCFaceDetailPigmentEditOptionCell__configurationFromCollection_selectedOptions___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v7 = a2;
  if (![v7 isAddable] || (objc_msgSend(v7, "isVisible") & 1) != 0 || a3)
  {
    int v5 = [v7 supportsSlider];
    unint64_t v6 = *(void **)(a1 + 32);
    if (v5) {
      [v6 addEditableColor:v7];
    }
    else {
      [v6 addNonEditableColor:v7];
    }
  }
}

uint64_t __84__NTKCFaceDetailPigmentEditOptionCell__configurationFromCollection_selectedOptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isAddable];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (int64_t)_editOptionIndexForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 item];
  unint64_t v6 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration editableColors];
  uint64_t v7 = [v6 count];

  configuration = self->_configuration;
  if (v5 >= v7)
  {
    BOOL v12 = [(NTKFaceEditColorPickerConfiguration *)configuration hasSeparator];
    BOOL v13 = v12 && v5 == v7;
    if (v13
      || (uint64_t v5 = v5 - v7 - v12,
          [(NTKFaceEditColorPickerConfiguration *)self->_configuration nonEditableColors],
          double v14 = objc_claimAutoreleasedReturnValue(),
          unint64_t v15 = [v14 count],
          v14,
          v5 >= v15))
    {
      uint64_t v11 = 0;
      goto LABEL_11;
    }
    char v9 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration nonEditableColors];
  }
  else
  {
    char v9 = [(NTKFaceEditColorPickerConfiguration *)configuration editableColors];
  }
  uint64_t v10 = v9;
  uint64_t v11 = [v9 objectAtIndexedSubscript:v5];

LABEL_11:
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  double v16 = [(NTKCFaceDetailEditOptionCell *)self collection];
  double v17 = [v16 options];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __68__NTKCFaceDetailPigmentEditOptionCell__editOptionIndexForIndexPath___block_invoke;
  v21[3] = &unk_1E62C48E8;
  id v18 = v11;
  id v22 = v18;
  v23 = &v24;
  [v17 enumerateObjectsUsingBlock:v21];

  int64_t v19 = v25[3];
  _Block_object_dispose(&v24, 8);

  return v19;
}

void __68__NTKCFaceDetailPigmentEditOptionCell__editOptionIndexForIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (![v7 conformsToProtocol:&unk_1FCDEF740])
  {
    int v10 = [v7 isEqual:*(void *)(a1 + 32)];

    if (!v10) {
      return;
    }
    goto LABEL_5;
  }
  unint64_t v8 = [v7 pigmentEditOption];

  char v9 = [v8 isEqualIgnoringFraction:*(void *)(a1 + 32)];
  if (v9)
  {
LABEL_5:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)_indexPathForEditOptionIndex:(int64_t)a3
{
  uint64_t v5 = [(NTKCFaceDetailEditOptionCell *)self collection];
  unint64_t v6 = [v5 options];
  unint64_t v7 = [v6 count];

  if (v7 <= a3)
  {
    int v10 = 0;
  }
  else
  {
    unint64_t v8 = [(NTKCFaceDetailPigmentEditOptionCell *)self optionAtIndex:a3];
    unint64_t v9 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration indexOfColor:v8];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int v10 = 0;
    }
    else
    {
      unint64_t v11 = v9;
      BOOL v12 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration editableColors];
      unint64_t v13 = [v12 count];

      BOOL v14 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration hasSeparator];
      BOOL v15 = v11 >= v13 && v14;
      int v10 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 + v15 inSection:0];
    }
  }
  return v10;
}

- (id)_imageForIndexPath:(id)a3
{
  uint64_t v4 = [a3 item];
  uint64_t v5 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration editableColors];
  uint64_t v6 = [v5 count];

  configuration = self->_configuration;
  if (v4 < v6)
  {
    unint64_t v8 = [(NTKFaceEditColorPickerConfiguration *)configuration editableColors];
LABEL_9:
    unint64_t v13 = v8;
    BOOL v14 = [v8 objectAtIndexedSubscript:v4];

    BOOL v15 = [(NTKPigmentEditOptionArray *)self->_editingModifiedColors pigmentForPigment:v14];

    double v16 = [(NTKCFaceDetailEditOptionCell *)self faceView];
    double v17 = [v16 swatchImageForColorOption:v15];

    goto LABEL_13;
  }
  BOOL v9 = [(NTKFaceEditColorPickerConfiguration *)configuration hasSeparator];
  if (v9 && v4 == v6)
  {
    uint64_t v18 = [(NTKCFaceDetailPigmentEditOptionCell *)self _dividerImage];
  }
  else
  {
    uint64_t v4 = v4 - v6 - v9;
    unint64_t v11 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration nonEditableColors];
    unint64_t v12 = [v11 count];

    if (v4 < v12)
    {
      unint64_t v8 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration nonEditableColors];
      goto LABEL_9;
    }
    uint64_t v18 = [(NTKCFaceDetailPigmentEditOptionCell *)self _plusImage];
  }
  double v17 = (void *)v18;
LABEL_13:
  return v17;
}

- (id)_dequeueCellForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 item];
  uint64_t v6 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration editableColors];
  uint64_t v7 = [v6 count];

  BOOL v8 = v5 <= v7;
  uint64_t v9 = v5 - v7;
  if (v8)
  {
    -[NTKCFaceDetailEditOptionCell _dequeueCellForIndexPath:](&v18, sel__dequeueCellForIndexPath_, v4, v17.receiver, v17.super_class, self, NTKCFaceDetailPigmentEditOptionCell);
    goto LABEL_5;
  }
  unint64_t v10 = v9 - [(NTKFaceEditColorPickerConfiguration *)self->_configuration hasSeparator];
  unint64_t v11 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration nonEditableColors];
  unint64_t v12 = [v11 count];

  if (v10 < v12)
  {
    -[NTKCFaceDetailEditOptionCell _dequeueCellForIndexPath:](&v17, sel__dequeueCellForIndexPath_, v4, self, NTKCFaceDetailPigmentEditOptionCell, v18.receiver, v18.super_class);
    unint64_t v13 = LABEL_5:;
    goto LABEL_7;
  }
  BOOL v14 = [(NTKCFaceDetailEditOptionCell *)self collectionView];
  BOOL v15 = +[_NTKCFaceDetailPigmentAddCell reuseIdentifier];
  unint64_t v13 = [v14 dequeueReusableCellWithReuseIdentifier:v15 forIndexPath:v4];

  [(NTKCFaceDetailEditOptionCell *)self _setupCell:v13];
  [v13 setDelegate:self];
LABEL_7:

  return v13;
}

- (BOOL)_isReloadCollectionRequired:(id)a3 selectedOptions:(id)a4
{
  id v4 = self;
  uint64_t v5 = [(NTKCFaceDetailPigmentEditOptionCell *)self _configurationFromCollection:a3 selectedOptions:a4];
  LOBYTE(v4) = [v5 isEqual:v4->_configuration] ^ 1;

  return (char)v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v5 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration numberOfColors];
  unint64_t v6 = v5 + [(NTKFaceEditColorPickerConfiguration *)self->_configuration hasSeparator];
  return v6 + [(NTKFaceEditColorPickerConfiguration *)self->_configuration canAddColors];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [(NTKCFaceDetailPigmentEditOptionCell *)self _dequeueCellForIndexPath:v5];
  [v6 setStyle:0];
  uint64_t v7 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration editableColors];
  uint64_t v8 = [v7 count];

  uint64_t v9 = [v5 item];
  if ([(NTKFaceEditColorPickerConfiguration *)self->_configuration hasSeparator]) {
    BOOL v10 = v9 == v8;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10) {
    objc_msgSend(v6, "setSwatchFrame:", self->_dividerSwatchRect.origin.x, self->_dividerSwatchRect.origin.y, self->_dividerSwatchRect.size.width, self->_dividerSwatchRect.size.height);
  }
  return v6;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(NTKFaceEditColorPickerConfiguration *)self->_configuration numberOfColors];
  unint64_t v9 = v8 + [(NTKFaceEditColorPickerConfiguration *)self->_configuration hasSeparator];
  if ([v7 item] != v9)
  {
    v10.receiver = self;
    v10.super_class = (Class)NTKCFaceDetailPigmentEditOptionCell;
    [(NTKCFaceDetailEditOptionCell *)&v10 collectionView:v6 didSelectItemAtIndexPath:v7];
  }
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  configuration = self->_configuration;
  id v7 = a5;
  unint64_t v8 = [(NTKFaceEditColorPickerConfiguration *)configuration editableColors];
  uint64_t v9 = [v8 count];

  uint64_t v10 = [v7 item];
  if (v9) {
    BOOL v11 = v10 == v9;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    CGFloat width = self->_dividerItemSize.width;
    CGFloat height = self->_dividerItemSize.height;
  }
  else
  {
    unint64_t v12 = [(NTKCFaceDetailEditOptionCell *)self layout];
    [v12 itemSize];
    CGFloat width = v13;
    CGFloat height = v15;
  }
  double v17 = width;
  double v18 = height;
  result.CGFloat height = v18;
  result.CGFloat width = v17;
  return result;
}

- (void)addCellTapped:(id)a3
{
  id v4 = [(NTKCFaceDetailEditOptionCell *)self delegate];
  [v4 pigmentEditOptionCellDidSelectAddOption:self];
}

- (id)_dividerImage
{
  dividerImage = self->_dividerImage;
  if (!dividerImage)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithBounds:", 0.0, 0.0, 3.0, 42.0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__NTKCFaceDetailPigmentEditOptionCell__dividerImage__block_invoke;
    v8[3] = &__block_descriptor_64_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v8[4] = 0;
    v8[5] = 0;
    long long v9 = xmmword_1BC8A1110;
    id v5 = [v4 imageWithActions:v8];
    id v6 = self->_dividerImage;
    self->_dividerImage = v5;

    dividerImage = self->_dividerImage;
  }
  return dividerImage;
}

void __52__NTKCFaceDetailPigmentEditOptionCell__dividerImage__block_invoke(double *a1)
{
  v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.949019608 alpha:1.0];
  [v2 setFill];

  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", a1[4], a1[5], a1[6], a1[7], a1[6] * 0.5);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 fill];
}

- (id)_plusImage
{
  plusImage = self->_plusImage;
  if (!plusImage)
  {
    id v4 = [MEMORY[0x1E4FB1830] configurationWithPointSize:42.0];
    id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.circle.fill" withConfiguration:v4];
    id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.596078431 alpha:1.0];
    id v7 = [v5 imageWithTintColor:v6 renderingMode:1];

    [v7 contentInsets];
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    [v7 size];
    double v17 = v16;
    double v19 = v18;
    [v7 contentInsets];
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v17 - (v20 + v21), v19 - (v22 + v23));
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __49__NTKCFaceDetailPigmentEditOptionCell__plusImage__block_invoke;
    v29[3] = &unk_1E62BFF70;
    uint64_t v31 = v9;
    uint64_t v32 = v11;
    uint64_t v33 = v13;
    uint64_t v34 = v15;
    id v30 = v7;
    id v25 = v7;
    uint64_t v26 = [v24 imageWithActions:v29];
    uint64_t v27 = self->_plusImage;
    self->_plusImage = v26;

    plusImage = self->_plusImage;
  }
  return plusImage;
}

uint64_t __49__NTKCFaceDetailPigmentEditOptionCell__plusImage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 format];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v13 = *(double *)(a1 + 40);
  double v12 = *(double *)(a1 + 48);
  double v14 = v5 - v12;
  double v15 = v7 - v13;
  double v16 = v9 - (-*(double *)(a1 + 64) - v12);
  double v17 = v11 - (-*(double *)(a1 + 56) - v13);
  double v18 = *(void **)(a1 + 32);
  return objc_msgSend(v18, "drawInRect:", v14, v15, v16, v17);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plusImage, 0);
  objc_storeStrong((id *)&self->_dividerImage, 0);
  objc_storeStrong((id *)&self->_previouslySelectedColors, 0);
  objc_storeStrong((id *)&self->_editingModifiedColors, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end