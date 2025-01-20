@interface NTKHomeListPickerDataSource
+ (BOOL)shouldShowTopLevelMoreButton;
+ (id)_titleForHeaderSectionType:(int64_t)a3;
+ (id)topLevelItemsForComplicationFamily:(int64_t)a3 sectionIdentifier:(id)a4;
- (BOOL)_homesSectionIsDisplayable;
- (BOOL)_itemIsSelectedAtIndexPath:(id)a3;
- (BOOL)_upperComplicationsSectionIsDisplayable;
- (NTKCFaceDetailComplicationCellProvider)pickerCellProvider;
- (NTKComplicationPickerDetailViewConfiguration)configuration;
- (NTKHomeListPickerDataSource)initWithTableView:(id)a3 detailConfiguration:(id)a4;
- (UITableView)tableView;
- (id)_titleForHeaderInSection:(int64_t)a3;
- (id)pickerItemForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_numberOfItemsInSection:(int64_t)a3;
- (int64_t)_sectionTypeForSectionIndex:(int64_t)a3;
- (int64_t)_totalSectionCount;
- (int64_t)_upperComplicationsSectionIndex;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_refreshHomeList;
- (void)dealloc;
@end

@implementation NTKHomeListPickerDataSource

- (NTKHomeListPickerDataSource)initWithTableView:(id)a3 detailConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NTKHomeListPickerDataSource;
  v9 = [(NTKHomeListPickerDataSource *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tableView, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    v11 = [v8 listProvider];
    v12 = [[NTKCFaceDetailComplicationCellProvider alloc] initWithTableView:v7 listProvider:v11];
    pickerCellProvider = v10->_pickerCellProvider;
    v10->_pickerCellProvider = v12;

    uint64_t v14 = [v11 pickerComplicationFamily];
    v15 = +[NTKHomeListPickerDataSource _titleForHeaderSectionType:0];
    uint64_t v16 = +[NTKHomeListPickerDataSource topLevelItemsForComplicationFamily:v14 sectionIdentifier:v15];
    upperComplicationsItems = v10->_upperComplicationsItems;
    v10->_upperComplicationsItems = (NSArray *)v16;

    [(NTKHomeListPickerDataSource *)v10 _refreshHomeList];
    v18 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v18 addHomeManagerObserver:v10];
  }
  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v3 removeHomeManagerObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKHomeListPickerDataSource;
  [(NTKHomeListPickerDataSource *)&v4 dealloc];
}

+ (id)topLevelItemsForComplicationFamily:(int64_t)a3 sectionIdentifier:(id)a4
{
  id v5 = a4;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  if ([MEMORY[0x1E4F79CA8] currentLocationEnergyForecastEnabled])
  {
    id v7 = +[NTKNanoHomeWidgetItemFactory currentLocationEnergyWidgetItemWithComplicationFamily:a3 sectionIdentifier:v5];
    if (v7) {
      [v6 addObject:v7];
    }
  }
  id v8 = +[NTKNanoHomeWidgetItemFactory smartStackWidgetItemWithComplicationFamily:a3 sectionIdentifier:v5];
  if (v8) {
    [v6 addObject:v8];
  }
  v9 = +[NTKNanoHomeWidgetItemFactory launcherWidgetItemWithComplicationFamily:a3 sectionIdentifier:v5];
  if (v9) {
    [v6 addObject:v9];
  }

  return v6;
}

+ (BOOL)shouldShowTopLevelMoreButton
{
  v2 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  v3 = [v2 homeManager];
  objc_super v4 = [v3 homes];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (id)pickerItemForIndexPath:(id)a3
{
  id v5 = a3;
  int64_t v6 = -[NTKHomeListPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [v5 section]);
  if (v6)
  {
    if (v6 != 1) {
      goto LABEL_6;
    }
    uint64_t v7 = 16;
  }
  else
  {
    uint64_t v7 = 8;
  }
  v3 = objc_msgSend(*(id *)((char *)&self->super.isa + v7), "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
LABEL_6:

  return v3;
}

- (int64_t)_numberOfItemsInSection:(int64_t)a3
{
  int64_t result = [(NTKHomeListPickerDataSource *)self _sectionTypeForSectionIndex:a3];
  if (result)
  {
    if (result != 1) {
      return result;
    }
    uint64_t v5 = 16;
  }
  else
  {
    uint64_t v5 = 8;
  }
  int64_t v6 = *(Class *)((char *)&self->super.isa + v5);
  return [v6 count];
}

- (int64_t)_totalSectionCount
{
  BOOL v3 = [(NTKHomeListPickerDataSource *)self _upperComplicationsSectionIsDisplayable];
  BOOL v4 = [(NTKHomeListPickerDataSource *)self _homesSectionIsDisplayable];
  int64_t v5 = 1;
  if (v3) {
    int64_t v5 = 2;
  }
  if (v4) {
    return v5;
  }
  else {
    return v3;
  }
}

+ (id)_titleForHeaderSectionType:(int64_t)a3
{
  if (a3 == 1)
  {
    BOOL v4 = NTKClockFaceLocalizedString(@"COMPLICATION_PICKER_NANOHOME_HOMES_SECTION_NAME", @"Homes");
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4;
}

- (id)_titleForHeaderInSection:(int64_t)a3
{
  int64_t v3 = [(NTKHomeListPickerDataSource *)self _sectionTypeForSectionIndex:a3];
  return +[NTKHomeListPickerDataSource _titleForHeaderSectionType:v3];
}

- (BOOL)_itemIsSelectedAtIndexPath:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NTKHomeListPickerDataSource *)self configuration];
  int64_t v6 = [v5 listProvider];
  uint64_t v7 = [v6 pickerSelectedItem];

  id v8 = [(NTKHomeListPickerDataSource *)self pickerItemForIndexPath:v4];

  LOBYTE(v4) = [v7 isEqual:v8];
  return (char)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NTKHomeListPickerDataSource *)self _numberOfItemsInSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(NTKHomeListPickerDataSource *)self pickerItemForIndexPath:v5];
  uint64_t v7 = [(NTKHomeListPickerDataSource *)self pickerCellProvider];
  id v8 = [v7 cellForItem:v6 atIndexPath:v5];

  BOOL v9 = [(NTKHomeListPickerDataSource *)self _itemIsSelectedAtIndexPath:v5];
  objc_msgSend(v8, "ntk_setPickerSelected:", v9);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(NTKHomeListPickerDataSource *)self _titleForHeaderInSection:a4];
}

- (void)_refreshHomeList
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = [v3 homeManager];
  int64_t v6 = objc_msgSend(v5, "hf_orderedHomes");
  uint64_t v7 = [v4 arrayWithArray:v6];

  id v8 = [v3 home];

  if (v8)
  {
    BOOL v9 = [v3 home];
    v10 = [v9 uniqueIdentifier];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __47__NTKHomeListPickerDataSource__refreshHomeList__block_invoke;
    v32[3] = &unk_1E62C6D88;
    id v33 = v10;
    id v11 = v10;
    uint64_t v12 = [v7 indexOfObjectPassingTest:v32];

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = [v7 objectAtIndex:v12];
      [v7 removeObjectAtIndex:v12];
      [v7 insertObject:v13 atIndex:0];
    }
  }
  if ([v7 count])
  {
    v27 = self;
    uint64_t v14 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v15 = +[NTKHomeListPickerDataSource _titleForHeaderSectionType:1];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v26 = v7;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v22 = [[NTKHomeListItem alloc] initWithSectionIdentifier:v15];
          v23 = [v21 uniqueIdentifier];
          [(NTKHomeListItem *)v22 setHomeID:v23];

          v24 = [v21 name];
          [(NTKHomeListItem *)v22 setHomeLocalizedName:v24];

          [(NSArray *)v14 addObject:v22];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v18);
    }

    self = v27;
    homeComplicationsItems = v27->_homeComplicationsItems;
    v27->_homeComplicationsItems = v14;

    uint64_t v7 = v26;
  }
  else
  {
    v15 = self->_homeComplicationsItems;
    self->_homeComplicationsItems = 0;
  }

  [(UITableView *)self->_tableView reloadData];
}

uint64_t __47__NTKHomeListPickerDataSource__refreshHomeList__block_invoke(uint64_t a1, void *a2)
{
  int64_t v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)_upperComplicationsSectionIsDisplayable
{
  return [(NSArray *)self->_upperComplicationsItems count] != 0;
}

- (BOOL)_homesSectionIsDisplayable
{
  return [(NSArray *)self->_homeComplicationsItems count] != 0;
}

- (int64_t)_upperComplicationsSectionIndex
{
  if ([(NTKHomeListPickerDataSource *)self _upperComplicationsSectionIsDisplayable])
  {
    return 0;
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)_sectionTypeForSectionIndex:(int64_t)a3
{
  return [(NTKHomeListPickerDataSource *)self _upperComplicationsSectionIndex] != a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (NTKComplicationPickerDetailViewConfiguration)configuration
{
  return self->_configuration;
}

- (NTKCFaceDetailComplicationCellProvider)pickerCellProvider
{
  return self->_pickerCellProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerCellProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_homeComplicationsItems, 0);
  objc_storeStrong((id *)&self->_upperComplicationsItems, 0);
}

@end