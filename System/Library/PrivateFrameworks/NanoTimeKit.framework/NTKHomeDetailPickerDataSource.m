@interface NTKHomeDetailPickerDataSource
+ (id)_titleForHeaderSectionType:(int64_t)a3;
- (BOOL)_energySectionIsDisplayable;
- (BOOL)_itemIsSelectedAtIndexPath:(id)a3;
- (BOOL)_scenesSectionIsDisplayable;
- (NTKCFaceDetailComplicationCellProvider)pickerCellProvider;
- (NTKComplicationPickerDetailViewConfiguration)configuration;
- (NTKHomeDetailPickerDataSource)initWithTableView:(id)a3 detailConfiguration:(id)a4 homeListItem:(id)a5;
- (UITableView)tableView;
- (id)_accessoryComplicationAtIndexPath:(id)a3;
- (id)_pickableAccessoriesAtRoomInSection:(int64_t)a3;
- (id)_roomAccessoriesIndexPathForTableIndexPath:(id)a3;
- (id)_roomNameForSection:(int64_t)a3;
- (id)_titleForHeaderInSection:(int64_t)a3;
- (id)pickerItemForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_energySectionIndex;
- (int64_t)_firstRoomSectionIndex;
- (int64_t)_numberOfItemsInSection:(int64_t)a3;
- (int64_t)_scenesSectionIndex;
- (int64_t)_sectionTypeForSectionIndex:(int64_t)a3;
- (int64_t)_totalSectionCount;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)_numberOfAccessoriesAtRoomInSection:(unint64_t)a3;
- (unint64_t)_roomIndexForSection:(int64_t)a3;
- (void)_generatePickableEnergyItemsForFamily:(int64_t)a3;
- (void)_refreshHomeDetail;
- (void)_updateEnergyItems;
- (void)dealloc;
@end

@implementation NTKHomeDetailPickerDataSource

- (NTKHomeDetailPickerDataSource)initWithTableView:(id)a3 detailConfiguration:(id)a4 homeListItem:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NTKHomeDetailPickerDataSource;
  v12 = [(NTKHomeDetailPickerDataSource *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tableView, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    objc_storeStrong((id *)&v13->_homeListItem, a5);
    [(NTKHomeDetailPickerDataSource *)v13 _refreshHomeDetail];
    v14 = [MEMORY[0x1E4F691A0] sharedDispatcher];
    [v14 addHomeManagerObserver:v13];

    v15 = [v10 listProvider];
    v16 = [[NTKCFaceDetailComplicationCellProvider alloc] initWithTableView:v9 listProvider:v15];
    pickerCellProvider = v13->_pickerCellProvider;
    v13->_pickerCellProvider = v16;
  }
  return v13;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  [v3 removeHomeManagerObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKHomeDetailPickerDataSource;
  [(NTKHomeDetailPickerDataSource *)&v4 dealloc];
}

- (id)pickerItemForIndexPath:(id)a3
{
  id v5 = a3;
  int64_t v6 = -[NTKHomeDetailPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", [v5 section]);
  if (v6 == 2)
  {
    uint64_t v8 = [(NTKHomeDetailPickerDataSource *)self _accessoryComplicationAtIndexPath:v5];
  }
  else
  {
    if (v6 == 1)
    {
      scenesItems = self->_scenesItems;
    }
    else
    {
      if (v6) {
        goto LABEL_9;
      }
      scenesItems = self->_energyItems;
    }
    uint64_t v8 = -[NSArray objectAtIndexedSubscript:](scenesItems, "objectAtIndexedSubscript:", [v5 row]);
  }
  v3 = (void *)v8;
LABEL_9:

  return v3;
}

- (int64_t)_numberOfItemsInSection:(int64_t)a3
{
  int64_t result = -[NTKHomeDetailPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:");
  if (result == 2)
  {
    return [(NTKHomeDetailPickerDataSource *)self _numberOfAccessoriesAtRoomInSection:a3];
  }
  else
  {
    if (result == 1)
    {
      scenesItems = self->_scenesItems;
    }
    else
    {
      if (result) {
        return result;
      }
      scenesItems = self->_energyItems;
    }
    return [(NSArray *)scenesItems count];
  }
}

- (int64_t)_totalSectionCount
{
  LODWORD(v3) = [(NTKHomeDetailPickerDataSource *)self _energySectionIsDisplayable];
  BOOL v4 = [(NTKHomeDetailPickerDataSource *)self _scenesSectionIsDisplayable];
  uint64_t v5 = 1;
  if (v3) {
    uint64_t v5 = 2;
  }
  if (v4) {
    uint64_t v3 = v5;
  }
  else {
    uint64_t v3 = v3;
  }
  return [(NSArray *)self->_accessoryItemsByRoom count] + v3;
}

+ (id)_titleForHeaderSectionType:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = @"COMPLICATION_PICKER_NANOHOME_SCENES_SECTION_NAME";
    BOOL v4 = @"Scenes";
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v3 = @"COMPLICATION_PICKER_NANOHOME_ENERGY_SECTION_NAME";
    BOOL v4 = @"Energy";
LABEL_5:
    NTKClockFaceLocalizedString(v3, v4);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  uint64_t v5 = &stru_1F1635E90;
LABEL_7:
  return v5;
}

- (id)_titleForHeaderInSection:(int64_t)a3
{
  uint64_t v5 = -[NTKHomeDetailPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:");
  if ((unint64_t)v5 >= 2)
  {
    if (v5 == (void *)2)
    {
      uint64_t v5 = [(NTKHomeDetailPickerDataSource *)self _roomNameForSection:a3];
    }
  }
  else
  {
    uint64_t v5 = +[NTKHomeDetailPickerDataSource _titleForHeaderSectionType:[(NTKHomeDetailPickerDataSource *)self _sectionTypeForSectionIndex:a3]];
  }
  return v5;
}

- (BOOL)_itemIsSelectedAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKHomeDetailPickerDataSource *)self configuration];
  int64_t v6 = [v5 listProvider];
  v7 = [v6 pickerSelectedItem];

  uint64_t v8 = [(NTKHomeDetailPickerDataSource *)self pickerItemForIndexPath:v4];

  LOBYTE(v4) = [v7 isEqual:v8];
  return (char)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NTKHomeDetailPickerDataSource *)self _numberOfItemsInSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(NTKHomeDetailPickerDataSource *)self pickerItemForIndexPath:v5];
  v7 = [(NTKHomeDetailPickerDataSource *)self pickerCellProvider];
  uint64_t v8 = [v7 cellForItem:v6 atIndexPath:v5];

  BOOL v9 = [(NTKHomeDetailPickerDataSource *)self _itemIsSelectedAtIndexPath:v5];
  objc_msgSend(v8, "ntk_setPickerSelected:", v9);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(NTKHomeDetailPickerDataSource *)self _titleForHeaderInSection:a4];
}

- (void)_refreshHomeDetail
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F691A0] sharedDispatcher];
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = [v3 homeManager];
  int64_t v6 = objc_msgSend(v5, "hf_orderedHomes");
  v7 = [v4 arrayWithArray:v6];

  uint64_t v8 = [v3 home];

  if (v8
    && (v48[0] = MEMORY[0x1E4F143A8],
        v48[1] = 3221225472,
        v48[2] = __51__NTKHomeDetailPickerDataSource__refreshHomeDetail__block_invoke,
        v48[3] = &unk_1E62C6D88,
        v48[4] = self,
        uint64_t v9 = [v7 indexOfObjectPassingTest:v48],
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v40 = v3;
    v18 = [v7 objectAtIndex:v9];
    detailedHome = self->_detailedHome;
    self->_detailedHome = v18;

    v20 = [(NTKHomeDetailPickerDataSource *)self configuration];
    v21 = [v20 listProvider];
    uint64_t v22 = [v21 pickerComplicationFamily];

    [(NTKHomeDetailPickerDataSource *)self _generatePickableEnergyItemsForFamily:v22];
    v23 = +[NHOIntentsUtilities pickableActionSetIntentsWithHome:self->_detailedHome];
    v24 = +[NTKHomeDetailPickerDataSource _titleForHeaderSectionType:1];
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v23, "count"));
    v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v17 = v23;
    uint64_t v26 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(v17);
          }
          v30 = +[NTKNanoHomeWidgetItemFactory sceneWidgetItemWithSceneIntent:*(void *)(*((void *)&v44 + 1) + 8 * i) complicationFamily:v22 sectionIdentifier:v24];
          if (v30) {
            [(NSArray *)v25 addObject:v30];
          }
        }
        uint64_t v27 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v27);
    }

    scenesItems = self->_scenesItems;
    self->_scenesItems = v25;
    v32 = v25;

    v33 = objc_opt_new();
    v34 = (NSMutableArray *)objc_opt_new();
    roomNames = self->_roomNames;
    self->_roomNames = v34;

    v36 = [(HMHome *)self->_detailedHome rooms];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __51__NTKHomeDetailPickerDataSource__refreshHomeDetail__block_invoke_2;
    v41[3] = &unk_1E62CB370;
    v41[4] = self;
    uint64_t v43 = v22;
    v37 = v33;
    v42 = v37;
    [v36 enumerateObjectsUsingBlock:v41];

    accessoryItemsByRoom = self->_accessoryItemsByRoom;
    self->_accessoryItemsByRoom = v37;
    v39 = v37;

    uint64_t v3 = v40;
  }
  else
  {
    id v10 = self->_detailedHome;
    self->_detailedHome = 0;

    energyItems = self->_energyItems;
    self->_energyItems = 0;

    energyForecastItems = self->_energyForecastItems;
    self->_energyForecastItems = 0;

    electricityUsageItems = self->_electricityUsageItems;
    self->_electricityUsageItems = 0;

    electricityRatesItems = self->_electricityRatesItems;
    self->_electricityRatesItems = 0;

    v15 = self->_scenesItems;
    self->_scenesItems = 0;

    v16 = self->_accessoryItemsByRoom;
    self->_accessoryItemsByRoom = 0;

    v17 = self->_roomNames;
    self->_roomNames = 0;
  }

  [(UITableView *)self->_tableView reloadData];
}

uint64_t __51__NTKHomeDetailPickerDataSource__refreshHomeDetail__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 uniqueIdentifier];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 8) homeID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __51__NTKHomeDetailPickerDataSource__refreshHomeDetail__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[NHOIntentsUtilities pickableAccessoryIntentsWithHome:*(void *)(*(void *)(a1 + 32) + 16) room:v3];
  if ([v4 count])
  {
    v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v15 = v4;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v10 = *(void *)(a1 + 48);
          id v11 = [v3 name];
          v12 = +[NTKNanoHomeWidgetItemFactory accessoryWidgetItemWithAccessoryIntent:v9 complicationFamily:v10 sectionIdentifier:v11];

          if (v12) {
            [v17 addObject:v12];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }

    if ([v17 count])
    {
      [*(id *)(a1 + 40) addObject:v17];
      v13 = *(void **)(*(void *)(a1 + 32) + 72);
      v14 = [v3 name];
      [v13 addObject:v14];
    }
    id v4 = v15;
  }
}

- (void)_generatePickableEnergyItemsForFamily:(int64_t)a3
{
  energyItems = self->_energyItems;
  self->_energyItems = 0;

  energyForecastItems = self->_energyForecastItems;
  self->_energyForecastItems = 0;

  electricityUsageItems = self->_electricityUsageItems;
  self->_electricityUsageItems = 0;

  electricityRatesItems = self->_electricityRatesItems;
  self->_electricityRatesItems = 0;

  if (self->_detailedHome)
  {
    uint64_t v9 = +[NTKHomeDetailPickerDataSource _titleForHeaderSectionType:0];
    objc_initWeak(&location, self);
    detailedHome = self->_detailedHome;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__NTKHomeDetailPickerDataSource__generatePickableEnergyItemsForFamily___block_invoke;
    v22[3] = &unk_1E62CB398;
    objc_copyWeak(v24, &location);
    v24[1] = (id)a3;
    id v11 = v9;
    id v23 = v11;
    +[NHOIntentsUtilities pickableEnergyForecastIntentsWithHome:detailedHome completionHandler:v22];
    v12 = self->_detailedHome;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__NTKHomeDetailPickerDataSource__generatePickableEnergyItemsForFamily___block_invoke_2;
    v19[3] = &unk_1E62CB398;
    objc_copyWeak(v21, &location);
    v21[1] = (id)a3;
    id v13 = v11;
    id v20 = v13;
    +[NHOIntentsUtilities pickableElectricityUsageIntentsWithHome:v12 completionHandler:v19];
    v14 = self->_detailedHome;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__NTKHomeDetailPickerDataSource__generatePickableEnergyItemsForFamily___block_invoke_3;
    v16[3] = &unk_1E62CB398;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a3;
    id v15 = v13;
    id v17 = v15;
    +[NHOIntentsUtilities pickableElectricityRatesIntentsWithHome:v14 completionHandler:v16];

    objc_destroyWeak(v18);
    objc_destroyWeak(v21);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
}

void __71__NTKHomeDetailPickerDataSource__generatePickableEnergyItemsForFamily___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = +[NTKNanoHomeWidgetItemFactory homeSpecificEnergyWidgetItemWithEnergyIntent:complicationFamily:sectionIdentifier:](_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory, "homeSpecificEnergyWidgetItemWithEnergyIntent:complicationFamily:sectionIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v10), *(void *)(a1 + 48), *(void *)(a1 + 32), (void)v12);
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 4, v5);
    [WeakRetained _updateEnergyItems];
  }
}

void __71__NTKHomeDetailPickerDataSource__generatePickableEnergyItemsForFamily___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = +[NTKNanoHomeWidgetItemFactory electricityUsageWidgetItemWithUsageIntent:complicationFamily:sectionIdentifier:](_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory, "electricityUsageWidgetItemWithUsageIntent:complicationFamily:sectionIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v10), *(void *)(a1 + 48), *(void *)(a1 + 32), (void)v12);
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 5, v5);
    [WeakRetained _updateEnergyItems];
  }
}

void __71__NTKHomeDetailPickerDataSource__generatePickableEnergyItemsForFamily___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = +[NTKNanoHomeWidgetItemFactory electricityRatesWidgetItemWithRatesIntent:complicationFamily:sectionIdentifier:](_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory, "electricityRatesWidgetItemWithRatesIntent:complicationFamily:sectionIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v10), *(void *)(a1 + 48), *(void *)(a1 + 32), (void)v12);
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 6, v5);
    [WeakRetained _updateEnergyItems];
  }
}

- (void)_updateEnergyItems
{
  id v3 = (NSArray *)objc_opt_new();
  [(NSArray *)v3 addObjectsFromArray:self->_energyForecastItems];
  [(NSArray *)v3 addObjectsFromArray:self->_electricityUsageItems];
  [(NSArray *)v3 addObjectsFromArray:self->_electricityRatesItems];
  energyItems = self->_energyItems;
  self->_energyItems = v3;

  id v5 = [(NTKHomeDetailPickerDataSource *)self tableView];
  [v5 reloadData];
}

- (BOOL)_energySectionIsDisplayable
{
  return [(NSArray *)self->_energyItems count] != 0;
}

- (BOOL)_scenesSectionIsDisplayable
{
  return [(NSArray *)self->_scenesItems count] != 0;
}

- (int64_t)_energySectionIndex
{
  if ([(NTKHomeDetailPickerDataSource *)self _energySectionIsDisplayable]) {
    return 0;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)_scenesSectionIndex
{
  int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(NTKHomeDetailPickerDataSource *)self _scenesSectionIsDisplayable])
  {
    int64_t v4 = [(NTKHomeDetailPickerDataSource *)self _energySectionIndex];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v4 = [(NTKHomeDetailPickerDataSource *)self _energySectionIndex];
    }
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    else {
      return v4 + 1;
    }
  }
  return v3;
}

- (int64_t)_firstRoomSectionIndex
{
  int64_t v3 = [(NTKHomeDetailPickerDataSource *)self _scenesSectionIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v3 = [(NTKHomeDetailPickerDataSource *)self _energySectionIndex];
  }
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return v3 + 1;
  }
}

- (id)_roomAccessoriesIndexPathForTableIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = -[NTKHomeDetailPickerDataSource _roomIndexForSection:](self, "_roomIndexForSection:", [v4 section]);
  id v6 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v7 = [v4 row];

  return (id)[v6 indexPathForRow:v7 inSection:v5];
}

- (int64_t)_sectionTypeForSectionIndex:(int64_t)a3
{
  if ([(NTKHomeDetailPickerDataSource *)self _energySectionIndex] == a3) {
    return 0;
  }
  if ([(NTKHomeDetailPickerDataSource *)self _scenesSectionIndex] == a3) {
    return 1;
  }
  return 2;
}

- (unint64_t)_roomIndexForSection:(int64_t)a3
{
  return a3 - [(NTKHomeDetailPickerDataSource *)self _firstRoomSectionIndex];
}

- (id)_roomNameForSection:(int64_t)a3
{
  unint64_t v4 = [(NTKHomeDetailPickerDataSource *)self _roomIndexForSection:a3];
  roomNames = self->_roomNames;
  return (id)[(NSMutableArray *)roomNames objectAtIndexedSubscript:v4];
}

- (id)_pickableAccessoriesAtRoomInSection:(int64_t)a3
{
  unint64_t v4 = [(NTKHomeDetailPickerDataSource *)self _roomIndexForSection:a3];
  accessoryItemsByRoom = self->_accessoryItemsByRoom;
  return [(NSArray *)accessoryItemsByRoom objectAtIndexedSubscript:v4];
}

- (unint64_t)_numberOfAccessoriesAtRoomInSection:(unint64_t)a3
{
  int64_t v3 = [(NTKHomeDetailPickerDataSource *)self _pickableAccessoriesAtRoomInSection:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)_accessoryComplicationAtIndexPath:(id)a3
{
  unint64_t v4 = [(NTKHomeDetailPickerDataSource *)self _roomAccessoriesIndexPathForTableIndexPath:a3];
  unint64_t v5 = -[NSArray objectAtIndexedSubscript:](self->_accessoryItemsByRoom, "objectAtIndexedSubscript:", [v4 section]);
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));

  return v6;
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
  objc_storeStrong((id *)&self->_roomNames, 0);
  objc_storeStrong((id *)&self->_accessoryItemsByRoom, 0);
  objc_storeStrong((id *)&self->_scenesItems, 0);
  objc_storeStrong((id *)&self->_electricityRatesItems, 0);
  objc_storeStrong((id *)&self->_electricityUsageItems, 0);
  objc_storeStrong((id *)&self->_energyForecastItems, 0);
  objc_storeStrong((id *)&self->_energyItems, 0);
  objc_storeStrong((id *)&self->_detailedHome, 0);
  objc_storeStrong((id *)&self->_homeListItem, 0);
}

@end