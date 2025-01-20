@interface _NTKPigmentAddController
- (_NTKPigmentAddController)initWithFace:(id)a3 faceView:(id)a4 slot:(id)a5 willExitHandler:(id)a6;
- (id)_collectionViewLayout;
- (id)_pigmentForIndexPath:(id)a3;
- (id)collectionView;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_callWillExitHandlerWithChanges:(BOOL)a3;
- (void)_dismissWithChanges:(BOOL)a3;
- (void)_donePressed;
- (void)_handleOptionsChangedNotification;
- (void)_setupPigments;
- (void)_updateSelections;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _NTKPigmentAddController

- (_NTKPigmentAddController)initWithFace:(id)a3 faceView:(id)a4 slot:(id)a5 willExitHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)_NTKPigmentAddController;
  v15 = [(_NTKPigmentAddController *)&v29 initWithNibName:0 bundle:0];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_face, a3);
    objc_storeStrong((id *)&v16->_faceView, a4);
    uint64_t v17 = [v13 copy];
    slot = v16->_slot;
    v16->_slot = (NSString *)v17;

    v19 = _Block_copy(v14);
    id willExitHandler = v16->_willExitHandler;
    v16->_id willExitHandler = v19;

    uint64_t v21 = +[NTKPigmentEditOptionArray arrayWithEquality:1];
    addedPigments = v16->_addedPigments;
    v16->_addedPigments = (NTKPigmentEditOptionArray *)v21;

    uint64_t v23 = +[NTKPigmentEditOptionArray arrayWithEquality:1];
    removedPigments = v16->_removedPigments;
    v16->_removedPigments = (NTKPigmentEditOptionArray *)v23;

    v25 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v16 action:sel__donePressed];
    v26 = [(_NTKPigmentAddController *)v16 navigationItem];
    [v26 setRightBarButtonItem:v25];

    [(_NTKPigmentAddController *)v16 _setupPigments];
    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v16 selector:sel__handleOptionsChangedNotification name:@"NTKColorEditOptionsChangedNotificationName" object:v16->_face];
  }
  else
  {
    (*((void (**)(id, void))v14 + 2))(v14, 0);
  }

  return v16;
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)_NTKPigmentAddController;
  [(_NTKPigmentAddController *)&v22 viewDidLoad];
  v3 = [(NTKFace *)self->_face device];
  if (_LayoutConstants_onceToken != -1) {
    dispatch_once(&_LayoutConstants_onceToken, &__block_literal_global_354);
  }
  double v4 = *(double *)&_LayoutConstants__constants_3;

  v5 = BPSBackgroundColor();
  v6 = [(_NTKPigmentAddController *)self view];
  [v6 setBackgroundColor:v5];

  v7 = [(_NTKPigmentAddController *)self _collectionViewLayout];
  id v8 = objc_alloc(MEMORY[0x1E4FB1568]);
  v9 = (UICollectionView *)objc_msgSend(v8, "initWithFrame:collectionViewLayout:", v7, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  collectionView = self->_collectionView;
  self->_collectionView = v9;

  id v11 = self->_collectionView;
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = *MEMORY[0x1E4FB2770];
  id v14 = +[_NTKPigmentAddHeaderView reuseIdentifier];
  [(UICollectionView *)v11 registerClass:v12 forSupplementaryViewOfKind:v13 withReuseIdentifier:v14];

  v15 = self->_collectionView;
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = +[_NTKPigmentAddCell reuseIdentifier];
  [(UICollectionView *)v15 registerClass:v16 forCellWithReuseIdentifier:v17];

  [(UICollectionView *)self->_collectionView setAlwaysBounceVertical:1];
  [(UICollectionView *)self->_collectionView setAllowsMultipleSelection:1];
  [(UICollectionView *)self->_collectionView setDelegate:self];
  [(UICollectionView *)self->_collectionView setDataSource:self];
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v4, 0.0, 0.0, 0.0);
  v18 = [(_NTKPigmentAddController *)self view];
  [v18 addSubview:self->_collectionView];

  v20 = NTKCCustomizationLocalizedString(@"PIGMENT_EDIT_TITLE", @"Face Colors", v19);
  [(_NTKPigmentAddController *)self setTitle:v20];

  uint64_t v21 = [(_NTKPigmentAddController *)self navigationItem];
  [v21 _setLargeTitleTwoLineMode:1];
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)_NTKPigmentAddController;
  [(_NTKPigmentAddController *)&v12 viewDidLayoutSubviews];
  v3 = [(_NTKPigmentAddController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v5, v7, v9, v11);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_NTKPigmentAddController;
  [(_NTKPigmentAddController *)&v4 viewWillAppear:a3];
  [(UICollectionView *)self->_collectionView reloadData];
  [(_NTKPigmentAddController *)self _updateSelections];
}

- (void)_updateSelections
{
  if ([(NSArray *)self->_sections count])
  {
    unint64_t v3 = 0;
    do
    {
      objc_super v4 = [(NSArray *)self->_sections objectAtIndexedSubscript:v3];
      double v5 = [v4 items];

      if ([v5 count])
      {
        unint64_t v6 = 0;
        do
        {
          double v7 = [v5 objectAtIndexedSubscript:v6];
          if (([(NTKPigmentEditOptionArray *)self->_availablePigments containsPigment:v7]
             || [(NTKPigmentEditOptionArray *)self->_addedPigments containsPigment:v7])
            && ![(NTKPigmentEditOptionArray *)self->_removedPigments containsPigment:v7])
          {
            double v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:v3];
            [(UICollectionView *)self->_collectionView selectItemAtIndexPath:v8 animated:0 scrollPosition:0];
          }
          ++v6;
        }
        while (v6 < [v5 count]);
      }

      ++v3;
    }
    while (v3 < [(NSArray *)self->_sections count]);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_NTKPigmentAddController;
  [(_NTKPigmentAddController *)&v4 viewDidAppear:a3];
  [(UICollectionView *)self->_collectionView becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_NTKPigmentAddController;
  [(_NTKPigmentAddController *)&v4 viewDidDisappear:a3];
  [(UICollectionView *)self->_collectionView resignFirstResponder];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return [(NSArray *)self->_sections count];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  objc_super v4 = [(NSArray *)self->_sections objectAtIndexedSubscript:a4];
  double v5 = [v4 items];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  face = self->_face;
  id v7 = a4;
  id v8 = a3;
  double v9 = [(NTKFace *)face device];
  if (_LayoutConstants_onceToken != -1) {
    dispatch_once(&_LayoutConstants_onceToken, &__block_literal_global_354);
  }
  double v10 = *(double *)&_LayoutConstants__constants_0_2;
  double v11 = +[_NTKPigmentAddCell reuseIdentifier];
  objc_super v12 = [v8 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v7];

  [v12 setDevice:v9];
  uint64_t v13 = [(_NTKPigmentAddController *)self _pigmentForIndexPath:v7];

  id v14 = -[NTKFaceView swatchImageForColorOption:size:](self->_faceView, "swatchImageForColorOption:size:", v13, v10, v10);
  [v12 setImage:v14];
  v15 = [(NTKFaceView *)self->_faceView swatchPrimaryColorForColorOption:v13];
  [v12 setPrimaryColor:v15];
  [v12 setPigmentEditOption:v13];

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  double v11 = +[_NTKPigmentAddHeaderView reuseIdentifier];
  objc_super v12 = [v10 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v11 forIndexPath:v8];

  uint64_t v13 = [v8 section];
  id v14 = [(NSArray *)self->_sections objectAtIndexedSubscript:v13];
  v15 = [v14 name];
  [v12 setName:v15];

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = [(_NTKPigmentAddController *)self _pigmentForIndexPath:a4];
  unint64_t v5 = -[NTKPigmentEditOptionArray indexOfPigment:](self->_removedPigments, "indexOfPigment:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    [(NTKPigmentEditOptionArray *)self->_addedPigments addPigment:v6];
  }
  else {
    [(NTKPigmentEditOptionArray *)self->_removedPigments removePigmentAtIndex:v5];
  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v6 = [(_NTKPigmentAddController *)self _pigmentForIndexPath:a4];
  unint64_t v5 = -[NTKPigmentEditOptionArray indexOfPigment:](self->_addedPigments, "indexOfPigment:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    [(NTKPigmentEditOptionArray *)self->_removedPigments addPigment:v6];
  }
  else {
    [(NTKPigmentEditOptionArray *)self->_addedPigments removePigmentAtIndex:v5];
  }
}

- (id)_collectionViewLayout
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v2 = [(NTKFace *)self->_face device];
  if (_LayoutConstants_onceToken != -1) {
    dispatch_once(&_LayoutConstants_onceToken, &__block_literal_global_354);
  }
  double v3 = *(double *)&_LayoutConstants__constants_0_2;
  double v4 = *(double *)&_LayoutConstants__constants_2;
  double v5 = *(double *)&_LayoutConstants__constants_4;
  double v6 = *(double *)&_LayoutConstants__constants_5;
  double v7 = *(double *)&_LayoutConstants__constants_6;

  id v8 = (void *)MEMORY[0x1E4FB1338];
  id v9 = [MEMORY[0x1E4FB1308] absoluteDimension:v3];
  id v10 = [MEMORY[0x1E4FB1308] absoluteDimension:v3];
  double v11 = [v8 sizeWithWidthDimension:v9 heightDimension:v10];

  objc_super v12 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v11];
  uint64_t v13 = (void *)MEMORY[0x1E4FB1338];
  id v14 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v15 = [MEMORY[0x1E4FB1308] absoluteDimension:v3];
  uint64_t v16 = [v13 sizeWithWidthDimension:v14 heightDimension:v15];

  uint64_t v17 = (void *)MEMORY[0x1E4FB1318];
  v32[0] = v12;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  uint64_t v19 = [v17 horizontalGroupWithLayoutSize:v16 subitems:v18];

  v20 = [MEMORY[0x1E4FB1340] fixedSpacing:v7];
  [v19 setInterItemSpacing:v20];

  uint64_t v21 = [MEMORY[0x1E4FB1330] sectionWithGroup:v19];
  [v21 setOrthogonalScrollingBehavior:1];
  objc_msgSend(v21, "setContentInsets:", 0.0, v4, 0.0, v4);
  objc_super v22 = (void *)MEMORY[0x1E4FB1338];
  uint64_t v23 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v24 = [MEMORY[0x1E4FB1308] estimatedDimension:20.0];
  v25 = [v22 sizeWithWidthDimension:v23 heightDimension:v24];

  v26 = objc_msgSend(MEMORY[0x1E4FB12F8], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v25, *MEMORY[0x1E4FB2770], 1, 0.0, -v5);
  v31 = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  [v21 setBoundarySupplementaryItems:v27];

  v28 = objc_opt_new();
  [v28 setScrollDirection:0];
  [v28 setInterSectionSpacing:v6];
  objc_super v29 = (void *)[objc_alloc(MEMORY[0x1E4FB1580]) initWithSection:v21 configuration:v28];

  return v29;
}

- (void)_setupPigments
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  double v3 = +[NTKPigmentEditOptionArray arrayWithEquality:1];
  availablePigments = self->_availablePigments;
  self->_availablePigments = v3;

  double v5 = [(NTKFace *)self->_face pigmentOptionProvider];
  v27 = self;
  double v6 = [v5 availableColorsForSlot:self->_slot];

  v26 = (NSArray *)objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    double v11 = 0;
    objc_super v12 = 0;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v7);
        }
        v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v15 isAddable])
        {
          uint64_t v16 = [v15 collectionName];
          if (([v16 isEqualToString:v11] & 1) == 0)
          {
            if ([v12 count])
            {
              uint64_t v17 = objc_opt_new();
              [v17 setName:v10];
              [v17 setItems:v12];
              [(NSArray *)v26 addObject:v17];
            }
            id v18 = v16;

            uint64_t v19 = [v15 localizedCollectionName];

            uint64_t v20 = +[NTKPigmentEditOptionArray arrayWithEquality:1];

            uint64_t v21 = (void *)v19;
            double v11 = v18;
            objc_super v12 = (void *)v20;
            id v10 = v21;
          }
          [v12 addPigment:v15];
          if ([v15 isVisible]) {
            [(NTKPigmentEditOptionArray *)v27->_availablePigments addPigment:v15];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
    double v11 = 0;
    objc_super v12 = 0;
  }

  if ([v12 count])
  {
    objc_super v22 = v10;
    uint64_t v23 = objc_opt_new();
    [v23 setName:v22];
    [v23 setItems:v12];
    [(NSArray *)v26 addObject:v23];

    id v10 = v22;
  }
  sections = v27->_sections;
  v27->_sections = v26;
  v25 = v26;
}

- (id)_pigmentForIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 section];
  uint64_t v6 = [v4 item];

  id v7 = [(NSArray *)self->_sections objectAtIndexedSubscript:v5];
  uint64_t v8 = [v7 items];
  uint64_t v9 = [v8 objectAtIndexedSubscript:v6];

  return v9;
}

- (void)_dismissWithChanges:(BOOL)a3
{
  [(_NTKPigmentAddController *)self _callWillExitHandlerWithChanges:a3];
  [(_NTKPigmentAddController *)self dismissViewControllerAnimated:1 completion:&__block_literal_global_104];
}

- (void)_callWillExitHandlerWithChanges:(BOOL)a3
{
  id willExitHandler = (void (**)(id, BOOL))self->_willExitHandler;
  if (willExitHandler)
  {
    willExitHandler[2](willExitHandler, a3);
    id v5 = self->_willExitHandler;
    self->_id willExitHandler = 0;
  }
}

- (void)_donePressed
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(NTKPigmentEditOptionArray *)self->_addedPigments count]
    || [(NTKPigmentEditOptionArray *)self->_removedPigments count])
  {
    double v3 = +[NTKPigmentEditOptionStore sharedInstance];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = self->_addedPigments;
    uint64_t v5 = [(NTKPigmentEditOptionArray *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 setOption:*(void *)(*((void *)&v19 + 1) + 8 * v8++) visible:1];
        }
        while (v6 != v8);
        uint64_t v6 = [(NTKPigmentEditOptionArray *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v6);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v9 = self->_removedPigments;
    uint64_t v10 = [(NTKPigmentEditOptionArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(v3, "setOption:visible:", *(void *)(*((void *)&v15 + 1) + 8 * v13++), 0, (void)v15);
        }
        while (v11 != v13);
        uint64_t v11 = [(NTKPigmentEditOptionArray *)v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v11);
    }

    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = 0;
  }
  -[_NTKPigmentAddController _dismissWithChanges:](self, "_dismissWithChanges:", v14, (void)v15);
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)_handleOptionsChangedNotification
{
  [(_NTKPigmentAddController *)self _setupPigments];
  [(UICollectionView *)self->_collectionView reloadData];
  [(_NTKPigmentAddController *)self _updateSelections];
}

- (id)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedPigments, 0);
  objc_storeStrong((id *)&self->_addedPigments, 0);
  objc_storeStrong((id *)&self->_availablePigments, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong(&self->_willExitHandler, 0);
  objc_storeStrong((id *)&self->_slot, 0);
  objc_storeStrong((id *)&self->_faceView, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end