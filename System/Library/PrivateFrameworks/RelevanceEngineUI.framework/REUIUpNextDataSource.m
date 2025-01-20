@interface REUIUpNextDataSource
- (NSArray)sectionOrder;
- (RERelevanceEngine)relevanceEngine;
- (REUIRelevanceEngineControllerDelegate)delegate;
- (REUIUpNextDataSource)initWithRelevanceEngine:(id)a3;
- (REUIUpNextDataSource)initWithRelevanceEngine:(id)a3 sectionOrder:(id)a4;
- (id)_sectionTitleAtIndex:(unint64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation REUIUpNextDataSource

- (REUIUpNextDataSource)initWithRelevanceEngine:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = objc_msgSend(v4, "configuration", 0);
  v7 = [v6 sectionDescriptors];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13 = [v12 historicSectionDescriptor];
        v14 = v13;
        if (v13)
        {
          v15 = [v13 name];
          [v5 addObject:v15];
        }
        v16 = [v12 name];
        [v5 addObject:v16];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  v17 = (void *)[v5 copy];
  v18 = [(REUIUpNextDataSource *)self initWithRelevanceEngine:v4 sectionOrder:v17];

  return v18;
}

- (REUIUpNextDataSource)initWithRelevanceEngine:(id)a3 sectionOrder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REUIUpNextDataSource;
  uint64_t v8 = [(REUIUpNextDataSource *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [[REUIRelevanceEngineController alloc] initWithRelevanceEngine:v6 sectionOrder:v7];
    controller = v8->_controller;
    v8->_controller = v9;
  }
  return v8;
}

- (id)_sectionTitleAtIndex:(unint64_t)a3
{
  id v4 = [(REUIUpNextDataSource *)self sectionOrder];
  v5 = [v4 objectAtIndexedSubscript:a3];

  if (v5 == (void *)*MEMORY[0x263F62DC0])
  {
    uint64_t v8 = @"Up Next";
  }
  else if (v5 == (void *)*MEMORY[0x263F62DF8])
  {
    uint64_t v8 = @"Upcoming";
  }
  else if (v5 == (void *)*MEMORY[0x263F62DB0])
  {
    uint64_t v8 = @"All Day";
  }
  else if (v5 == (void *)*MEMORY[0x263F62E00])
  {
    uint64_t v8 = @"Tomorrow";
  }
  else
  {
    id v6 = [(id)*MEMORY[0x263F62DC0] stringByAppendingString:@"_historic"];
    int v7 = [v5 isEqualToString:v6];

    if (v7) {
      uint64_t v8 = @"Recent";
    }
    else {
      uint64_t v8 = @"Unknown";
    }
  }

  return v8;
}

- (RERelevanceEngine)relevanceEngine
{
  return [(REUIRelevanceEngineController *)self->_controller engine];
}

- (NSArray)sectionOrder
{
  return [(REUIRelevanceEngineController *)self->_controller sectionOrder];
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(REUIRelevanceEngineController *)self->_controller numberOfItemsInSectionAtIndex:a4];
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return [(REUIRelevanceEngineController *)self->_controller numberOfSections];
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 headersRegistered])
  {
    uint64_t v11 = *MEMORY[0x263F1D120];
  }
  else
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v11 = *MEMORY[0x263F1D120];
    [v8 registerClass:v12 forSupplementaryViewOfKind:*MEMORY[0x263F1D120] withReuseIdentifier:@"REUpNextHeaderReuseIdentifier"];
    [v8 setHeadersRegistered:1];
  }
  if ([v9 isEqualToString:v11])
  {
    v13 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:@"REUpNextHeaderReuseIdentifier" forIndexPath:v10];
    v14 = -[REUIUpNextDataSource _sectionTitleAtIndex:](self, "_sectionTitleAtIndex:", [v10 section]);
    id v15 = objc_alloc(MEMORY[0x263F086A0]);
    v16 = [v14 uppercaseString];
    v17 = (void *)[v15 initWithString:v16];
    [v13 setAttributedText:v17];
  }
  else
  {
    v13 = [v8 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:&stru_26CF96A58 forIndexPath:v10];
  }

  return v13;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 cellRegistered] & 1) == 0)
  {
    [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"REUpNextLargeTextCellReuseIdentifier"];
    [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"REUpNextMultilineCellReuseIdentifier"];
    [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"REUpNextThumbnailCellReuseIdentifier"];
    [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"REUpNextLargeWithDetailTextCellReuseIdentifier"];
    [v6 setCellRegistered:1];
  }
  id v8 = [(REUIRelevanceEngineController *)self->_controller contentAtIndexPath:v7];
  unint64_t v9 = [v8 style];
  if (v9 > 5) {
    id v10 = @"REUpNextLargeTextCellReuseIdentifier";
  }
  else {
    id v10 = *(&off_2644B7F40 + v9);
  }
  uint64_t v11 = [v6 dequeueReusableCellWithReuseIdentifier:v10 forIndexPath:v7];
  [v11 configureWithContent:v8];
  uint64_t v12 = [MEMORY[0x263F1C6B0] imageNamed:@"siriblur"];
  [v11 setContentImage:v12 animated:0];

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(REUIUpNextDataSource *)self _sectionTitleAtIndex:a4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(REUIRelevanceEngineController *)self->_controller numberOfSections];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(REUIRelevanceEngineController *)self->_controller numberOfItemsInSectionAtIndex:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 cellRegistered] & 1) == 0)
  {
    [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"cell"];
    [v6 setCellRegistered:1];
  }
  id v8 = [v6 dequeueReusableCellWithIdentifier:@"cell"];
  unint64_t v9 = [(REUIRelevanceEngineController *)self->_controller contentAtIndexPath:v7];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v9) {
    [v8 configureWithContent:v9];
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
}

- (REUIRelevanceEngineControllerDelegate)delegate
{
  return [(REUIRelevanceEngineController *)self->_controller delegate];
}

- (void).cxx_destruct
{
}

@end