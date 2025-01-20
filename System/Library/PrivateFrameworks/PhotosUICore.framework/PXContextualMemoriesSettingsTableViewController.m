@interface PXContextualMemoriesSettingsTableViewController
+ (id)title;
- ($B7681AED98C8A3AAF93603046C9C96EE)_regionForLocationCoordinate:(SEL)a3;
- (BOOL)_isDatePickerCellAtIndexPath:(id)a3;
- (BOOL)_isLocationPickerCellAtIndexPath:(id)a3;
- (BOOL)_isPeopleValueCellAtIndexPath:(id)a3;
- (BOOL)showsDatePicker;
- (BOOL)showsLocationPicker;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PXContextualMemoriesSettings)settings;
- (PXContextualMemoriesSettingsTableViewController)init;
- (UIView)progressIndicatorView;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_indexPathForDatePicker;
- (id)_indexPathForDateValue;
- (id)_indexPathForLocationPicker;
- (id)_indexPathForLocationValue;
- (id)_indexPathForPeopleValue;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_sectionForDate;
- (int64_t)_sectionForLocation;
- (int64_t)_sectionForPeople;
- (int64_t)_sectionForSettingOfClass:(Class)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didChangeDatePicker:(id)a3;
- (void)_didPressResetAll:(id)a3;
- (void)_handleLongPress:(id)a3;
- (void)_installProgressIndicatorView;
- (void)_reloadRowAndRestoreSelectionIfNeededAtIndexPath:(id)a3;
- (void)_showContactsPicker;
- (void)_tableView:(id)a3 selectionDidUpdateForRowAtIndexPath:(id)a4;
- (void)_updateDatePickerHidden;
- (void)_updateLocationPickerHidden;
- (void)contactPicker:(id)a3 didSelectContacts:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setProgressIndicatorView:(id)a3;
- (void)setSettings:(id)a3;
- (void)setShowsDatePicker:(BOOL)a3;
- (void)setShowsLocationPicker:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXContextualMemoriesSettingsTableViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)setProgressIndicatorView:(id)a3
{
}

- (UIView)progressIndicatorView
{
  return self->_progressIndicatorView;
}

- (void)setShowsLocationPicker:(BOOL)a3
{
  self->_showsLocationPicker = a3;
}

- (BOOL)showsLocationPicker
{
  return self->_showsLocationPicker;
}

- (void)setShowsDatePicker:(BOOL)a3
{
  self->_showsDatePicker = a3;
}

- (BOOL)showsDatePicker
{
  return self->_showsDatePicker;
}

- (void)setSettings:(id)a3
{
}

- (PXContextualMemoriesSettings)settings
{
  return self->_settings;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &kPXContextualMemoriesSettingsKVOContextKeyDate)
  {
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __98__PXContextualMemoriesSettingsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v27 = &unk_1E5DD36F8;
    v28 = self;
    goto LABEL_9;
  }
  if (a6 == &kPXContextualMemoriesSettingsKVOContextKeyCoordinate
    || a6 == &kPXContextualMemoriesSettingsKVOContextKeyPlacemark)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __98__PXContextualMemoriesSettingsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v22 = &unk_1E5DD36F8;
    v23 = self;
    goto LABEL_9;
  }
  if (a6 == &kPXContextualMemoriesSettingsKVOContextKeyPeople)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __98__PXContextualMemoriesSettingsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
    v17 = &unk_1E5DD36F8;
    v18 = self;
LABEL_9:
    px_dispatch_on_main_queue();
  }
  v13.receiver = self;
  v13.super_class = (Class)PXContextualMemoriesSettingsTableViewController;
  [(PXContextualMemoriesSettingsTableViewController *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
}

void __98__PXContextualMemoriesSettingsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) showsDatePicker])
  {
    v2 = [*(id *)(a1 + 32) _indexPathForDatePicker];
    v3 = [*(id *)(a1 + 32) tableView];
    v4 = [v3 cellForRowAtIndexPath:v2];

    v5 = [v4 datePicker];
    v6 = [*(id *)(*(void *)(a1 + 32) + 1032) timeSetting];
    v7 = [v6 date];
    [v5 setDate:v7 animated:1];
  }
  id v8 = [*(id *)(a1 + 32) _indexPathForDateValue];
  [*(id *)(a1 + 32) _reloadRowAndRestoreSelectionIfNeededAtIndexPath:v8];
}

void __98__PXContextualMemoriesSettingsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _indexPathForLocationValue];
  [*(id *)(a1 + 32) _reloadRowAndRestoreSelectionIfNeededAtIndexPath:v2];
}

void __98__PXContextualMemoriesSettingsTableViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _indexPathForPeopleValue];
  v3 = [*(id *)(a1 + 32) tableView];
  v5[0] = v2;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v3 reloadRowsAtIndexPaths:v4 withRowAnimation:100];
}

- (void)contactPicker:(id)a3 didSelectContacts:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v5 = a4;
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
        uint64_t v25 = 0;
        v26 = &v25;
        uint64_t v27 = 0x2050000000;
        id v12 = (void *)getCNContactFormatterClass_softClass;
        uint64_t v28 = getCNContactFormatterClass_softClass;
        if (!getCNContactFormatterClass_softClass)
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __getCNContactFormatterClass_block_invoke;
          v24[3] = &unk_1E5DD2B08;
          v24[4] = &v25;
          __getCNContactFormatterClass_block_invoke((uint64_t)v24);
          id v12 = (void *)v26[3];
        }
        id v13 = v12;
        _Block_object_dispose(&v25, 8);
        uint64_t v14 = objc_msgSend(v13, "stringFromContact:style:", v11, 0, v18);
        if ([v14 length]) {
          [v6 addObject:v14];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v8);
  }

  uint64_t v15 = [(PXContextualMemoriesSettings *)self->_settings peopleSetting];
  [v15 setPeopleNames:v6];

  v16 = [(PXContextualMemoriesSettingsTableViewController *)self _indexPathForPeopleValue];
  v17 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  [v17 deselectRowAtIndexPath:v16 animated:1];
}

- (void)contactPickerDidCancel:(id)a3
{
  id v5 = [(PXContextualMemoriesSettingsTableViewController *)self _indexPathForPeopleValue];
  v4 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  [v4 deselectRowAtIndexPath:v5 animated:1];
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 userLocation];

  if (v7 == v6)
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = [v5 dequeueReusableAnnotationViewWithIdentifier:@"pin"];
    if (v8)
    {
      uint64_t v9 = v8;
      [(MKAnnotationView *)v9 setAnnotation:v6];
    }
    else
    {
      uint64_t v9 = [(MKPinAnnotationView *)[PXPlacesPinAnnotationView alloc] initWithAnnotation:v6 reuseIdentifier:@"pin"];
      [(MKPinAnnotationView *)v9 setAnimatesDrop:1];
      [(MKAnnotationView *)v9 setCanShowCallout:1];
      [(MKAnnotationView *)v9 setDraggable:1];
    }
  }

  return v9;
}

- (void)_showContactsPicker
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2050000000;
  v3 = (void *)getCNContactPickerViewControllerClass_softClass;
  uint64_t v28 = getCNContactPickerViewControllerClass_softClass;
  if (!getCNContactPickerViewControllerClass_softClass)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    long long v22 = __getCNContactPickerViewControllerClass_block_invoke;
    long long v23 = &unk_1E5DD2B08;
    uint64_t v24 = &v25;
    __getCNContactPickerViewControllerClass_block_invoke((uint64_t)&v20);
    v3 = (void *)v26[3];
  }
  v4 = v3;
  _Block_object_dispose(&v25, 8);
  id v5 = objc_alloc_init(v4);
  [v5 setDelegate:self];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  id v6 = (id *)getCNContactGivenNameKeySymbolLoc_ptr;
  uint64_t v28 = getCNContactGivenNameKeySymbolLoc_ptr;
  if (!getCNContactGivenNameKeySymbolLoc_ptr)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    long long v22 = __getCNContactGivenNameKeySymbolLoc_block_invoke;
    long long v23 = &unk_1E5DD2B08;
    uint64_t v24 = &v25;
    id v7 = ContactsLibrary();
    uint64_t v8 = dlsym(v7, "CNContactGivenNameKey");
    *(void *)(v24[1] + 24) = v8;
    getCNContactGivenNameKeySymbolLoc_ptr = *(void *)(v24[1] + 24);
    id v6 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v6)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"NSString *getCNContactGivenNameKey(void)"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"PXContextualMemoriesSettingsTableViewController.m", 40, @"%s", dlerror());

    goto LABEL_12;
  }
  id v9 = *v6;
  id v29 = v9;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v10 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr;
  uint64_t v28 = getCNContactFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    long long v22 = __getCNContactFamilyNameKeySymbolLoc_block_invoke;
    long long v23 = &unk_1E5DD2B08;
    uint64_t v24 = &v25;
    uint64_t v11 = ContactsLibrary();
    id v12 = dlsym(v11, "CNContactFamilyNameKey");
    *(void *)(v24[1] + 24) = v12;
    getCNContactFamilyNameKeySymbolLoc_ptr = *(void *)(v24[1] + 24);
    uint64_t v10 = (id *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v10)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = [NSString stringWithUTF8String:"NSString *getCNContactFamilyNameKey(void)"];
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"PXContextualMemoriesSettingsTableViewController.m", 39, @"%s", dlerror());

LABEL_12:
    __break(1u);
  }
  id v30 = *v10;
  id v13 = (void *)MEMORY[0x1E4F1C978];
  id v14 = v30;
  uint64_t v15 = [v13 arrayWithObjects:&v29 count:2];

  [v5 setDisplayedPropertyKeys:v15];
  [(PXContextualMemoriesSettingsTableViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_didPressResetAll:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(PXContextualMemoriesSettings *)self->_settings settings];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) resetToDefault];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_handleLongPress:(id)a3
{
  id v10 = a3;
  if ([v10 state] == 1)
  {
    uint64_t v4 = [v10 view];
    [v10 locationInView:v4];
    objc_msgSend(v4, "convertPoint:toCoordinateFromView:", v4);
    double v6 = v5;
    double v8 = v7;
    long long v9 = [(PXContextualMemoriesSettings *)self->_settings locationSetting];
    objc_msgSend(v9, "setCoordinate:", v6, v8);
  }
}

- (void)_didChangeDatePicker:(id)a3
{
  id v5 = [a3 date];
  uint64_t v4 = [(PXContextualMemoriesSettings *)self->_settings timeSetting];
  [v4 setDate:v5];
}

- ($B7681AED98C8A3AAF93603046C9C96EE)_regionForLocationCoordinate:(SEL)a3
{
  return self;
}

- (BOOL)_isPeopleValueCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PXContextualMemoriesSettingsTableViewController *)self _indexPathForPeopleValue];
  uint64_t v6 = [v4 section];
  if (v6 == [v5 section])
  {
    uint64_t v7 = [v4 row];
    BOOL v8 = v7 == [v5 row];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_isLocationPickerCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PXContextualMemoriesSettingsTableViewController *)self _indexPathForLocationPicker];
  uint64_t v6 = [v4 section];
  if (v6 == [v5 section])
  {
    uint64_t v7 = [v4 row];
    BOOL v8 = v7 == [v5 row];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_isDatePickerCellAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PXContextualMemoriesSettingsTableViewController *)self _indexPathForDatePicker];
  uint64_t v6 = [v4 section];
  if (v6 == [v5 section])
  {
    uint64_t v7 = [v4 row];
    BOOL v8 = v7 == [v5 row];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_indexPathForLocationPicker
{
  id v2 = (void *)MEMORY[0x1E4F28D58];
  int64_t v3 = [(PXContextualMemoriesSettingsTableViewController *)self _sectionForLocation];
  return (id)[v2 indexPathForRow:1 inSection:v3];
}

- (id)_indexPathForDatePicker
{
  id v2 = (void *)MEMORY[0x1E4F28D58];
  int64_t v3 = [(PXContextualMemoriesSettingsTableViewController *)self _sectionForDate];
  return (id)[v2 indexPathForRow:1 inSection:v3];
}

- (id)_indexPathForPeopleValue
{
  id v2 = (void *)MEMORY[0x1E4F28D58];
  int64_t v3 = [(PXContextualMemoriesSettingsTableViewController *)self _sectionForPeople];
  return (id)[v2 indexPathForRow:0 inSection:v3];
}

- (id)_indexPathForLocationValue
{
  id v2 = (void *)MEMORY[0x1E4F28D58];
  int64_t v3 = [(PXContextualMemoriesSettingsTableViewController *)self _sectionForLocation];
  return (id)[v2 indexPathForRow:0 inSection:v3];
}

- (id)_indexPathForDateValue
{
  id v2 = (void *)MEMORY[0x1E4F28D58];
  int64_t v3 = [(PXContextualMemoriesSettingsTableViewController *)self _sectionForDate];
  return (id)[v2 indexPathForRow:0 inSection:v3];
}

- (int64_t)_sectionForPeople
{
  uint64_t v3 = objc_opt_class();
  return [(PXContextualMemoriesSettingsTableViewController *)self _sectionForSettingOfClass:v3];
}

- (int64_t)_sectionForLocation
{
  uint64_t v3 = objc_opt_class();
  return [(PXContextualMemoriesSettingsTableViewController *)self _sectionForSettingOfClass:v3];
}

- (int64_t)_sectionForDate
{
  uint64_t v3 = objc_opt_class();
  return [(PXContextualMemoriesSettingsTableViewController *)self _sectionForSettingOfClass:v3];
}

- (void)_reloadRowAndRestoreSelectionIfNeededAtIndexPath:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  uint64_t v6 = [v5 indexPathsForSelectedRows];

  uint64_t v7 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  v20[0] = v4;
  BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  [v7 reloadRowsAtIndexPaths:v8 withRowAnimation:5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
        if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v13), "isEqual:", v4, (void)v15))
        {
          id v14 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
          [v14 selectRowAtIndexPath:v4 animated:0 scrollPosition:0];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (int64_t)_sectionForSettingOfClass:(Class)a3
{
  id v4 = [(PXContextualMemoriesSettings *)self->_settings settings];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__PXContextualMemoriesSettingsTableViewController__sectionForSettingOfClass___block_invoke;
  v7[3] = &__block_descriptor_40_e46_B32__0___PXContextualMemoriesSetting__8Q16_B24lu32l8;
  v7[4] = a3;
  int64_t v5 = [v4 indexOfObjectPassingTest:v7];

  return v5;
}

uint64_t __77__PXContextualMemoriesSettingsTableViewController__sectionForSettingOfClass___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    *a4 = 1;
  }
  return isKindOfClass & 1;
}

- (void)_updateLocationPickerHidden
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL showsLocationPicker = self->_showsLocationPicker;
  id v4 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  [v4 beginUpdates];

  self->_showsLocationPicker ^= 1u;
  int64_t v5 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  uint64_t v6 = [(PXContextualMemoriesSettingsTableViewController *)self _indexPathForLocationPicker];
  uint64_t v7 = (void *)v6;
  if (showsLocationPicker)
  {
    v11[0] = v6;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v5 deleteRowsAtIndexPaths:v8 withRowAnimation:0];
  }
  else
  {
    uint64_t v10 = v6;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    [v5 insertRowsAtIndexPaths:v8 withRowAnimation:0];
  }

  id v9 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  [v9 endUpdates];
}

- (void)_updateDatePickerHidden
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL showsDatePicker = self->_showsDatePicker;
  id v4 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  [v4 beginUpdates];

  self->_showsDatePicker ^= 1u;
  int64_t v5 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  uint64_t v6 = [(PXContextualMemoriesSettingsTableViewController *)self _indexPathForDatePicker];
  uint64_t v7 = (void *)v6;
  if (showsDatePicker)
  {
    v11[0] = v6;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v5 deleteRowsAtIndexPaths:v8 withRowAnimation:0];
  }
  else
  {
    uint64_t v10 = v6;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    [v5 insertRowsAtIndexPaths:v8 withRowAnimation:0];
  }

  id v9 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  [v9 endUpdates];
}

- (void)_tableView:(id)a3 selectionDidUpdateForRowAtIndexPath:(id)a4
{
  id v8 = a4;
  int64_t v5 = [(PXContextualMemoriesSettingsTableViewController *)self _indexPathForDateValue];
  uint64_t v6 = [(PXContextualMemoriesSettingsTableViewController *)self _indexPathForLocationValue];
  uint64_t v7 = [(PXContextualMemoriesSettingsTableViewController *)self _indexPathForPeopleValue];
  if ([v5 isEqual:v8])
  {
    [(PXContextualMemoriesSettingsTableViewController *)self _updateDatePickerHidden];
  }
  else if ([v6 isEqual:v8])
  {
    [(PXContextualMemoriesSettingsTableViewController *)self _updateLocationPickerHidden];
  }
  else if ([v7 isEqual:v8])
  {
    [(PXContextualMemoriesSettingsTableViewController *)self _showContactsPicker];
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(PXContextualMemoriesSettingsTableViewController *)self _isDatePickerCellAtIndexPath:v5])
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    BOOL v6 = ![(PXContextualMemoriesSettingsTableViewController *)self _isLocationPickerCellAtIndexPath:v5];
  }

  return v6;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXContextualMemoriesSettingsTableViewController *)self _isDatePickerCellAtIndexPath:v7])
  {
    double v8 = 200.0;
  }
  else if ([(PXContextualMemoriesSettingsTableViewController *)self _isLocationPickerCellAtIndexPath:v7])
  {
    double v8 = 250.0;
  }
  else
  {
    [v6 rowHeight];
    double v8 = v9;
  }

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5 = [(PXContextualMemoriesSettings *)self->_settings settings];
  id v6 = [v5 objectAtIndexedSubscript:a4];

  id v7 = [v6 headerTitle];

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(PXContextualMemoriesSettingsTableViewController *)self _isDatePickerCellAtIndexPath:v7];
  BOOL v9 = [(PXContextualMemoriesSettingsTableViewController *)self _isLocationPickerCellAtIndexPath:v7];
  if (v8)
  {
    uint64_t v10 = @"PXContextualMemoriesSettingsDatePickerTableViewCell";
    uint64_t v11 = @"PXContextualMemoriesSettingsDatePickerTableViewCell";
    id v12 = [v6 dequeueReusableCellWithIdentifier:@"PXContextualMemoriesSettingsDatePickerTableViewCell" forIndexPath:v7];
    uint64_t v13 = [v12 datePicker];
    id v14 = [(PXContextualMemoriesSettings *)self->_settings timeSetting];
    long long v15 = [v14 date];
    [v13 setDate:v15 animated:0];

    long long v16 = [v12 datePicker];

    [v16 addTarget:self action:sel__didChangeDatePicker_ forControlEvents:4096];
  }
  else if (v9)
  {
    long long v17 = @"PXContextualMemoriesSettingsLocationPickerTableViewCell";
    id v12 = [v6 dequeueReusableCellWithIdentifier:@"PXContextualMemoriesSettingsLocationPickerTableViewCell" forIndexPath:v7];
    long long v18 = [v12 mapView];
    [v18 setMapViewDelegate:self];
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handleLongPress_];
    [v18 addGestureRecognizer:v19];
    uint64_t v20 = [(PXContextualMemoriesSettings *)self->_settings locationSetting];
    [v18 addAnnotation:v20];

    uint64_t v21 = [(PXContextualMemoriesSettings *)self->_settings locationSetting];
    [v21 coordinate];
    double v23 = v22;
    double v25 = v24;

    v39.latitude = v23;
    v39.longitude = v25;
    if (CLLocationCoordinate2DIsValid(v39))
    {
      -[PXContextualMemoriesSettingsTableViewController _regionForLocationCoordinate:](self, "_regionForLocationCoordinate:", v23, v25);
      objc_msgSend(v18, "setRegion:animated:", 0);
    }

    uint64_t v10 = @"PXContextualMemoriesSettingsLocationPickerTableViewCell";
  }
  else
  {
    v26 = @"PXContextualMemoriesSettingsValueTableViewCell";
    uint64_t v27 = [v6 dequeueReusableCellWithIdentifier:@"PXContextualMemoriesSettingsValueTableViewCell" forIndexPath:v7];
    uint64_t v28 = [(PXContextualMemoriesSettings *)self->_settings settings];
    id v29 = objc_msgSend(v28, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

    id v12 = v27;
    id v30 = [v29 title];
    uint64_t v31 = [v30 length];
    if (v31)
    {
      v32 = [v29 title];
    }
    else
    {
      v32 = @" ";
    }
    v33 = [v12 valueLabel];
    [v33 setText:v32];

    if (v31) {
    v36[0] = MEMORY[0x1E4F143A8];
    }
    v36[1] = 3221225472;
    v36[2] = __83__PXContextualMemoriesSettingsTableViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v36[3] = &unk_1E5DB6348;
    id v37 = v29;
    id v34 = v29;
    [v12 setResetHandler:v36];
    [v12 setNeedsUpdateConstraints];
    [v12 updateConstraintsIfNeeded];

    uint64_t v10 = @"PXContextualMemoriesSettingsValueTableViewCell";
  }

  return v12;
}

uint64_t __83__PXContextualMemoriesSettingsTableViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetToDefault];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = [(PXContextualMemoriesSettings *)self->_settings settings];
  id v7 = [v6 objectAtIndexedSubscript:a4];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_showsDatePicker
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && self->_showsLocationPicker)
  {
    int64_t v8 = 2;
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(PXContextualMemoriesSettings *)self->_settings settings];
  int64_t v4 = [v3 count];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXContextualMemoriesSettingsTableViewController;
  [(PXContextualMemoriesSettingsTableViewController *)&v6 viewWillAppear:a3];
  [(PXContextualMemoriesSettingsTableViewController *)self _installProgressIndicatorView];
  int64_t v4 = +[PXContextualMemoriesSettingsController sharedController];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __66__PXContextualMemoriesSettingsTableViewController_viewWillAppear___block_invoke;
  v5[3] = &unk_1E5DB6320;
  v5[4] = self;
  [v4 requestUpdatedContextualMemoriesSettingsWithOptions:0 completionHandler:v5];
}

void __66__PXContextualMemoriesSettingsTableViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1032), a2);
  id v4 = a2;
  id v5 = [*(id *)(a1 + 32) progressIndicatorView];
  [v5 removeFromSuperview];

  [*(id *)(a1 + 32) setProgressIndicatorView:0];
  objc_super v6 = [*(id *)(a1 + 32) tableView];
  [v6 reloadData];

  id v7 = [*(id *)(*(void *)(a1 + 32) + 1032) timeSetting];
  [v7 addObserver:*(void *)(a1 + 32) forKeyPath:@"date" options:0 context:&kPXContextualMemoriesSettingsKVOContextKeyDate];

  int64_t v8 = [*(id *)(*(void *)(a1 + 32) + 1032) locationSetting];
  [v8 addObserver:*(void *)(a1 + 32) forKeyPath:@"coordinate" options:0 context:&kPXContextualMemoriesSettingsKVOContextKeyCoordinate];

  BOOL v9 = [*(id *)(*(void *)(a1 + 32) + 1032) locationSetting];
  [v9 addObserver:*(void *)(a1 + 32) forKeyPath:@"placemark" options:0 context:&kPXContextualMemoriesSettingsKVOContextKeyPlacemark];

  id v10 = [*(id *)(*(void *)(a1 + 32) + 1032) peopleSetting];
  [v10 addObserver:*(void *)(a1 + 32) forKeyPath:@"peopleNames" options:0 context:&kPXContextualMemoriesSettingsKVOContextKeyPeople];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)PXContextualMemoriesSettingsTableViewController;
  [(PXContextualMemoriesSettingsTableViewController *)&v15 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  id v4 = [MEMORY[0x1E4F28B50] mainBundle];
  id v5 = [v4 localizedStringForKey:@"Reset all" value:&stru_1F00B0030 table:0];
  objc_super v6 = (void *)[v3 initWithTitle:v5 style:0 target:self action:sel__didPressResetAll_];
  id v7 = [(PXContextualMemoriesSettingsTableViewController *)self navigationItem];
  [v7 setRightBarButtonItem:v6];

  double v8 = *MEMORY[0x1E4FB2F28];
  BOOL v9 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  [v9 setRowHeight:v8];

  id v10 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  [v10 setEstimatedRowHeight:44.0];

  uint64_t v11 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  [v11 setAllowsMultipleSelection:1];

  id v12 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  [v12 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXContextualMemoriesSettingsValueTableViewCell"];

  uint64_t v13 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  [v13 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXContextualMemoriesSettingsDatePickerTableViewCell"];

  id v14 = [(PXContextualMemoriesSettingsTableViewController *)self tableView];
  [v14 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXContextualMemoriesSettingsLocationPickerTableViewCell"];
}

- (void)_installProgressIndicatorView
{
  id v27 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PXContextualMemoriesSettingsTableViewController *)self setProgressIndicatorView:v27];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setText:@"Loading..."];
  id v4 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2990]];
  [v3 setFont:v4];

  [v3 setTextAlignment:1];
  [v27 addSubview:v3];
  id v5 = [v3 widthAnchor];
  objc_super v6 = [v27 widthAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  double v8 = [v3 centerXAnchor];
  BOOL v9 = [v27 centerXAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  uint64_t v11 = [v3 centerYAnchor];
  id v12 = [v27 centerYAnchor];
  uint64_t v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  id v14 = [(PXContextualMemoriesSettingsTableViewController *)self view];
  [v14 addSubview:v27];
  objc_super v15 = [v27 widthAnchor];
  long long v16 = [v14 widthAnchor];
  long long v17 = [v15 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  long long v18 = [v27 heightAnchor];
  uint64_t v19 = [v14 heightAnchor];
  uint64_t v20 = [v18 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  uint64_t v21 = [v27 centerXAnchor];
  double v22 = [v14 centerXAnchor];
  double v23 = [v21 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  double v24 = [v27 centerYAnchor];
  double v25 = [v14 centerYAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  [v26 setActive:1];
}

- (void)dealloc
{
  id v3 = [(PXContextualMemoriesSettings *)self->_settings timeSetting];
  [v3 removeObserver:self forKeyPath:@"date" context:&kPXContextualMemoriesSettingsKVOContextKeyDate];

  id v4 = [(PXContextualMemoriesSettings *)self->_settings locationSetting];
  [v4 removeObserver:self forKeyPath:@"coordinate" context:&kPXContextualMemoriesSettingsKVOContextKeyCoordinate];

  id v5 = [(PXContextualMemoriesSettings *)self->_settings locationSetting];
  [v5 removeObserver:self forKeyPath:@"placemark" context:&kPXContextualMemoriesSettingsKVOContextKeyPlacemark];

  objc_super v6 = [(PXContextualMemoriesSettings *)self->_settings peopleSetting];
  [v6 removeObserver:self forKeyPath:@"peopleNames" context:&kPXContextualMemoriesSettingsKVOContextKeyPeople];

  v7.receiver = self;
  v7.super_class = (Class)PXContextualMemoriesSettingsTableViewController;
  [(PXContextualMemoriesSettingsTableViewController *)&v7 dealloc];
}

- (PXContextualMemoriesSettingsTableViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXContextualMemoriesSettingsTableViewController;
  id v2 = [(PXContextualMemoriesSettingsTableViewController *)&v5 initWithStyle:1];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() title];
    [(PXContextualMemoriesSettingsTableViewController *)v2 setTitle:v3];
  }
  return v2;
}

+ (id)title
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 localizedStringForKey:@"Contextual Settings" value:&stru_1F00B0030 table:0];

  return v3;
}

@end