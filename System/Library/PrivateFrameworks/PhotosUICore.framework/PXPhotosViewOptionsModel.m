@interface PXPhotosViewOptionsModel
- (BOOL)hidesSortOrderMenu;
- (NSArray)additionalLensControlItems;
- (NSArray)lensControlItems;
- (NSString)sortOrderTitle;
- (PXPhotosLensControlItem)selectedLensControlItem;
- (PXPhotosViewOptionsModel)initWithPhotoLibrary:(id)a3;
- (PXSortOrderState)sortOrderState;
- (UIMenu)sortOrderMenu;
- (id)_makeSortOrderMenu;
- (id)_makeSortOrderTitle;
- (id)_makeStandardLensControlItems;
- (id)browserDateIntervalStringForDateIntervalString:(id)a3;
- (id)browserTitleForProposedTitle:(id)a3;
- (unint64_t)browserDateType;
- (void)_updateLensControlItems;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAdditionalLensControlItems:(id)a3;
- (void)setHidesSortOrderMenu:(BOOL)a3;
- (void)setLensControlItems:(id)a3;
- (void)setSelectedLensControlItem:(id)a3;
- (void)setSortOrderMenu:(id)a3;
- (void)setSortOrderTitle:(id)a3;
@end

@implementation PXPhotosViewOptionsModel

uint64_t __49__PXPhotosViewOptionsModel_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateLensControlItems];
}

- (PXSortOrderState)sortOrderState
{
  return self->_sortOrderState;
}

- (UIMenu)sortOrderMenu
{
  if ([(PXPhotosViewOptionsModel *)self hidesSortOrderMenu])
  {
    v3 = 0;
  }
  else
  {
    sortOrderMenu = self->_sortOrderMenu;
    if (!sortOrderMenu)
    {
      v5 = [(PXPhotosViewOptionsModel *)self _makeSortOrderMenu];
      v6 = self->_sortOrderMenu;
      self->_sortOrderMenu = v5;

      sortOrderMenu = self->_sortOrderMenu;
    }
    v3 = sortOrderMenu;
  }
  return v3;
}

- (BOOL)hidesSortOrderMenu
{
  return self->_hidesSortOrderMenu;
}

- (id)_makeSortOrderMenu
{
  v2 = [(PXPhotosViewOptionsModel *)self sortOrderState];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke;
  v6[3] = &unk_1E5DD0008;
  id v7 = v2;
  id v3 = v2;
  v4 = +[PXMenuBuilder menuWithDeferredConfiguration:v6];

  return v4;
}

- (PXPhotosViewOptionsModel)initWithPhotoLibrary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosViewOptionsModel;
  v5 = [(PXPhotosViewOptionsModel *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "px_localDefaults");
    localDefaults = v5->_localDefaults;
    v5->_localDefaults = (PXPhotoLibraryLocalDefaults *)v6;

    v8 = [PXSortOrderState alloc];
    v9 = [(PXPhotoLibraryLocalDefaults *)v5->_localDefaults numberForKey:@"PXPhotosViewOptionsSortOrder-v2"];
    uint64_t v10 = [v9 unsignedIntegerValue];
    if ((unint64_t)(v10 - 1) >= 2) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }

    uint64_t v12 = [(PXSortOrderState *)v8 initWithSortOrder:v11];
    sortOrderState = v5->_sortOrderState;
    v5->_sortOrderState = (PXSortOrderState *)v12;

    [(PXSortOrderState *)v5->_sortOrderState registerChangeObserver:v5 context:PXSortOrderStateObserverContext];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__PXPhotosViewOptionsModel_initWithPhotoLibrary___block_invoke;
    v15[3] = &unk_1E5DCFF98;
    v16 = v5;
    [(PXPhotosViewOptionsModel *)v16 performChanges:v15];
  }
  return v5;
}

- (void)_updateLensControlItems
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [(PXPhotosViewOptionsModel *)self additionalLensControlItems];
  id v4 = [v3 reverseObjectEnumerator];
  v5 = [v4 allObjects];
  [v9 addObjectsFromArray:v5];

  uint64_t v6 = [(PXPhotosViewOptionsModel *)self _makeStandardLensControlItems];
  [v9 addObjectsFromArray:v6];

  id v7 = [(PXPhotosViewOptionsModel *)self lensControlItems];

  if (!v7)
  {
    v8 = [v9 lastObject];
    [(PXPhotosViewOptionsModel *)self setSelectedLensControlItem:v8];
  }
  [(PXPhotosViewOptionsModel *)self setLensControlItems:v9];
}

- (void)setSelectedLensControlItem:(id)a3
{
  v8 = (PXPhotosLensControlItem *)a3;
  v5 = self->_selectedLensControlItem;
  if (v5 == v8)
  {
  }
  else
  {
    uint64_t v6 = v5;
    char v7 = [(PXPhotosLensControlItem *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectedLensControlItem, a3);
      [(PXPhotosViewOptionsModel *)self signalChange:4];
    }
  }
}

- (void)setLensControlItems:(id)a3
{
  v8 = (NSArray *)a3;
  id v4 = self->_lensControlItems;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      uint64_t v6 = (NSArray *)[(NSArray *)v8 copy];
      lensControlItems = self->_lensControlItems;
      self->_lensControlItems = v6;

      [(PXPhotosViewOptionsModel *)self signalChange:8];
    }
  }
}

- (NSArray)lensControlItems
{
  return self->_lensControlItems;
}

- (NSArray)additionalLensControlItems
{
  return self->_additionalLensControlItems;
}

- (id)_makeStandardLensControlItems
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = +[PXLemonadeSettings sharedInstance];
  uint64_t v4 = [v3 yearsAndMonthsMode];

  if (!v4)
  {
    char v5 = [PXConcretePhotosLensControlItem alloc];
    uint64_t v6 = PXLocalizedStringFromTable(@"PXPhotosGridLensYears", @"LemonadeLocalizable");
    char v7 = [(PXConcretePhotosLensControlItem *)v5 initWithIdentifier:@"years" title:v6 symbolName:0];
    v18[0] = v7;
    v8 = [PXConcretePhotosLensControlItem alloc];
    id v9 = PXLocalizedStringFromTable(@"PXPhotosGridLensMonths", @"LemonadeLocalizable");
    uint64_t v10 = [(PXConcretePhotosLensControlItem *)v8 initWithIdentifier:@"months" title:v9 symbolName:0];
    v18[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    [v2 addObjectsFromArray:v11];
  }
  uint64_t v12 = [PXConcretePhotosLensControlItem alloc];
  v13 = PXLocalizedStringFromTable(@"PXPhotosGridLensAll", @"LemonadeLocalizable");
  v14 = [(PXConcretePhotosLensControlItem *)v12 initWithIdentifier:@"all" title:v13 symbolName:0];
  objc_super v17 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  [v2 addObjectsFromArray:v15];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortOrderState, 0);
  objc_storeStrong((id *)&self->_additionalLensControlItems, 0);
  objc_storeStrong((id *)&self->_sortOrderMenu, 0);
  objc_storeStrong((id *)&self->_sortOrderTitle, 0);
  objc_storeStrong((id *)&self->_selectedLensControlItem, 0);
  objc_storeStrong((id *)&self->_lensControlItems, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
}

- (PXPhotosLensControlItem)selectedLensControlItem
{
  return self->_selectedLensControlItem;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSortOrderStateObserverContext != a5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PXPhotosViewOptionsModel.m" lineNumber:265 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  uint64_t v10 = v9;
  if (v6)
  {
    unint64_t v11 = [(PXSortOrderState *)self->_sortOrderState sortOrder];
    uint64_t v12 = NSNumber;
    v13 = self->_localDefaults;
    v14 = [v12 numberWithUnsignedInteger:v11];
    [(PXPhotoLibraryLocalDefaults *)v13 setNumber:v14 forKey:@"PXPhotosViewOptionsSortOrder-v2"];

    [(PXPhotosViewOptionsModel *)self _invalidateLensControlItems];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__PXPhotosViewOptionsModel_observable_didChange_context___block_invoke;
    v16[3] = &unk_1E5DD0FA8;
    v16[4] = self;
    [(PXPhotosViewOptionsModel *)self performChanges:v16];
  }
}

void __57__PXPhotosViewOptionsModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) signalChange:4];
  id v2 = [*(id *)(a1 + 32) _makeSortOrderTitle];
  [*(id *)(a1 + 32) setSortOrderTitle:v2];

  id v3 = [*(id *)(a1 + 32) _makeSortOrderMenu];
  [*(id *)(a1 + 32) setSortOrderMenu:v3];
}

void __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke_2;
  v6[3] = &unk_1E5DCFFE0;
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  [v8 enumeratePossibleSortOrdersUsingBlock:v6];
}

void __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke_2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5 = a3;
  char v6 = *(void **)(a1 + 32);
  id v7 = PXLocalizedTitleForSortOrder(a2);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke_3;
  v8[3] = &unk_1E5DD09C8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = a2;
  [v6 addItemWithTitle:v7 systemImageName:0 state:v5 options:0 handler:v8];
}

uint64_t __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke_4;
  v3[3] = &__block_descriptor_40_e35_v16__0___PXMutableSortOrderState__8l;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 performChanges:v3];
}

uint64_t __46__PXPhotosViewOptionsModel__makeSortOrderMenu__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 setSortOrder:*(void *)(a1 + 32)];
}

- (id)_makeSortOrderTitle
{
  id v2 = [(PXPhotosViewOptionsModel *)self sortOrderState];
  id v3 = PXLocalizedTitleForSortOrder([v2 sortOrder]);

  return v3;
}

- (void)setAdditionalLensControlItems:(id)a3
{
  id v8 = (NSArray *)a3;
  uint64_t v4 = self->_additionalLensControlItems;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      char v6 = (NSArray *)[(NSArray *)v8 copy];
      additionalLensControlItems = self->_additionalLensControlItems;
      self->_additionalLensControlItems = v6;

      [(PXPhotosViewOptionsModel *)self _invalidateLensControlItems];
    }
  }
}

- (unint64_t)browserDateType
{
  id v2 = [(PXPhotosViewOptionsModel *)self sortOrderState];
  unint64_t v3 = [v2 sortOrder] == 2;

  return v3;
}

- (id)browserDateIntervalStringForDateIntervalString:(id)a3
{
  id v5 = a3;
  char v6 = [(PXPhotosViewOptionsModel *)self sortOrderState];
  unint64_t v7 = [v6 sortOrder];
  if (v7 >= 2)
  {
    if (v7 == 2)
    {
      if (v5)
      {
        id v8 = PXLocalizedStringFromTable(@"PXLibraryAllPhotosAddedRange", @"PhotosUICore");
        PXStringWithValidatedFormat();
        id v3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v3 = 0;
      }
    }
  }
  else
  {
    id v3 = v5;
  }

  return v3;
}

- (id)browserTitleForProposedTitle:(id)a3
{
  id v5 = a3;
  char v6 = [(PXPhotosViewOptionsModel *)self sortOrderState];
  unint64_t v7 = [v6 sortOrder];
  if (v7 >= 2)
  {
    if (v7 != 2) {
      goto LABEL_6;
    }
    PXLocalizedStringFromTable(@"PXPhotosGridSortedByDateAddedTitle", @"PhotosUICore");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v5;
  }
  id v3 = v8;
LABEL_6:

  return v3;
}

- (void)setHidesSortOrderMenu:(BOOL)a3
{
  if (self->_hidesSortOrderMenu != a3)
  {
    self->_hidesSortOrderMenu = a3;
    [(PXPhotosViewOptionsModel *)self signalChange:16];
  }
}

- (void)setSortOrderMenu:(id)a3
{
  id v5 = (UIMenu *)a3;
  if (self->_sortOrderMenu != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_sortOrderMenu, a3);
    [(PXPhotosViewOptionsModel *)self signalChange:2];
    id v5 = v6;
  }
}

- (NSString)sortOrderTitle
{
  sortOrderTitle = self->_sortOrderTitle;
  if (!sortOrderTitle)
  {
    uint64_t v4 = [(PXPhotosViewOptionsModel *)self _makeSortOrderTitle];
    id v5 = self->_sortOrderTitle;
    self->_sortOrderTitle = v4;

    sortOrderTitle = self->_sortOrderTitle;
  }
  return sortOrderTitle;
}

- (void)setSortOrderTitle:(id)a3
{
  id v8 = (NSString *)a3;
  id v5 = self->_sortOrderTitle;
  if (v5 == v8)
  {
  }
  else
  {
    char v6 = v5;
    char v7 = [(NSString *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_sortOrderTitle, a3);
      [(PXPhotosViewOptionsModel *)self signalChange:1];
    }
  }
}

@end