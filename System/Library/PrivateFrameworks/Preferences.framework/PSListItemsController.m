@interface PSListItemsController
- (BOOL)isRestrictionList;
- (id)identifierForValue:(id)a3;
- (id)itemsFromDataSource;
- (id)itemsFromParent;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_addStaticText:(id)a3;
- (void)dealloc;
- (void)listItemSelected:(id)a3;
- (void)prepareSpecifiersMetadata;
- (void)saveChangesIfNeeded;
- (void)scrollToSelectedCell;
- (void)setIsRestrictionList:(BOOL)a3;
- (void)setRowToSelect;
- (void)setValueForSpecifier:(id)a3 defaultValue:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PSListItemsController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PSListItemsController;
  [(PSListController *)&v5 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_didEnterBackground name:*MEMORY[0x1E4F43660] object:0];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_willEnterForeground name:*MEMORY[0x1E4F43708] object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PSListItemsController;
  [(PSListController *)&v9 viewWillAppear:a3];
  [(PSListController *)self setSpecifier:self->super.super._specifier];
  [(PSListItemsController *)self scrollToSelectedCell];
  v4 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"deferItemSelection"];
  self->_deferItemSelection = [v4 BOOLValue];

  if (self->_deferItemSelection)
  {
    objc_super v5 = [(PSSpecifier *)self->super.super._specifier target];
    id retainedTarget = self->_retainedTarget;
    self->_id retainedTarget = v5;
  }
  v7 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:self];
  v8 = [(PSListController *)self specifier];
  [v8 setObject:v7 forKeyedSubscript:@"PSListItemsControllerSpecifierKey"];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PSListItemsController;
  [(PSListController *)&v4 dealloc];
}

- (void)scrollToSelectedCell
{
  if (self->_rowToSelect != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PSListController indexPathForIndex:](self, "indexPathForIndex:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [(UITableView *)self->super._table scrollToRowAtIndexPath:v3 atScrollPosition:2 animated:0];
  }
}

- (void)setRowToSelect
{
  self->_rowToSelect = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v3 = [(PSSpecifier *)self->super.super._specifier hasValidGetter];
  specifier = self->super.super._specifier;
  if (v3) {
    [(PSSpecifier *)specifier performGetter];
  }
  else {
  objc_super v5 = [(PSSpecifier *)specifier propertyForKey:@"value"];
  }
  id v7 = [(PSListItemsController *)self identifierForValue:v5];

  v6 = [(PSListController *)self specifierForID:v7];
  if (v6) {
    self->_rowToSelect = [(PSListController *)self indexOfSpecifier:v6];
  }
}

- (void)setValueForSpecifier:(id)a3 defaultValue:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([(PSSpecifier *)self->super.super._specifier hasValidSetter])
  {
    id v7 = [v10 values];
    specifier = self->super.super._specifier;
    if ([v7 count])
    {
      objc_super v9 = [v7 firstObject];
      [(PSSpecifier *)specifier performSetterWithValue:v9];
    }
    else
    {
      [(PSSpecifier *)specifier performSetterWithValue:v6];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  lastSelectedSpecifier = self->_lastSelectedSpecifier;
  if (lastSelectedSpecifier)
  {
    if (self->_deferItemSelection)
    {
      id v6 = [(PSSpecifier *)lastSelectedSpecifier propertyForKey:@"cellObject"];
      id v7 = self->_lastSelectedSpecifier;
      v8 = [v6 title];
      [(PSListItemsController *)self setValueForSpecifier:v7 defaultValue:v8];
    }
    objc_opt_class();
    objc_super v9 = [(PSListItemsController *)self navigationController];
    id v10 = [v9 topViewController];
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    objc_opt_class();
    v13 = [(PSViewController *)self parentController];
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    id v15 = v14;

    objc_opt_class();
    v16 = self;
    v17 = [v16 specifier];
    v18 = [v17 target];
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    id v20 = v19;

    v21 = v12;
    if (v12 || (v21 = v15) != 0 || (v21 = v20) != 0) {
      [v21 reloadSpecifier:self->super.super._specifier];
    }
    v22 = self->_lastSelectedSpecifier;
    self->_lastSelectedSpecifier = 0;
  }
  if (self->_deferItemSelection)
  {
    id retainedTarget = self->_retainedTarget;
    self->_id retainedTarget = 0;
  }
  v24.receiver = self;
  v24.super_class = (Class)PSListItemsController;
  [(PSListController *)&v24 viewWillDisappear:v3];
}

- (void)saveChangesIfNeeded
{
  if (self->_deferItemSelection)
  {
    lastSelectedSpecifier = self->_lastSelectedSpecifier;
    if (lastSelectedSpecifier)
    {
      id v7 = [(PSSpecifier *)lastSelectedSpecifier propertyForKey:@"cellObject"];
      objc_super v4 = self->_lastSelectedSpecifier;
      objc_super v5 = [v7 title];
      [(PSListItemsController *)self setValueForSpecifier:v4 defaultValue:v5];

      id v6 = self->_lastSelectedSpecifier;
      self->_lastSelectedSpecifier = 0;
    }
  }
}

- (void)prepareSpecifiersMetadata
{
  v3.receiver = self;
  v3.super_class = (Class)PSListItemsController;
  [(PSListController *)&v3 prepareSpecifiersMetadata];
  [(PSListItemsController *)self setRowToSelect];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t v8 = [(PSListController *)self indexForIndexPath:v6];
  v13.receiver = self;
  v13.super_class = (Class)PSListItemsController;
  objc_super v9 = [(PSListController *)&v13 tableView:v7 cellForRowAtIndexPath:v6];

  LODWORD(v6) = self->_restrictionList;
  uint64_t v10 = [v9 tag];
  if (!v6)
  {
    if (v10 != 3) {
      goto LABEL_8;
    }
    int64_t rowToSelect = self->_rowToSelect;
    goto LABEL_7;
  }
  if (v10 == 3)
  {
    int64_t rowToSelect = self->_rowToSelect;
    if (v8 > rowToSelect) {
LABEL_7:
    }
      [v9 setChecked:v8 == rowToSelect];
  }
LABEL_8:
  return v9;
}

- (void)listItemSelected:(id)a3
{
  id v12 = a3;
  int64_t v4 = -[PSListController indexForIndexPath:](self, "indexForIndexPath:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v5 = v4;
    if (self->_rowToSelect != 0x7FFFFFFFFFFFFFFFLL)
    {
      table = self->super._table;
      id v7 = -[PSListController indexPathForIndex:](self, "indexPathForIndex:");
      int64_t v8 = [(UITableView *)table cellForRowAtIndexPath:v7];

      [v8 setChecked:0];
    }
    objc_super v9 = [(UITableView *)self->super._table cellForRowAtIndexPath:v12];
    uint64_t v10 = [(NSArray *)self->super._specifiers objectAtIndex:v5];
    [v9 setChecked:1];
    self->_int64_t rowToSelect = v5;
    if (self->_lastSelectedSpecifier != v10) {
      objc_storeStrong((id *)&self->_lastSelectedSpecifier, v10);
    }
    if (!self->_deferItemSelection)
    {
      v11 = [v9 title];
      [(PSListItemsController *)self setValueForSpecifier:v10 defaultValue:v11];
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PSListItemsController *)self listItemSelected:v6];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (void)_addStaticText:(id)a3
{
  id v7 = a3;
  int64_t v4 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"staticTextMessage"];
  if (v4) {
    [v7 setProperty:v4 forKey:@"footerText"];
  }
  else {
    [v7 removePropertyForKey:@"footerText"];
  }
  int64_t v5 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"staticHeaderText"];
  if (v5) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  [v7 setName:v6];
}

- (id)itemsFromParent
{
  v21 = [(PSSpecifier *)self->super.super._specifier values];
  uint64_t v3 = [v21 count];
  int64_t v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  uint64_t v5 = +[PSSpecifier groupSpecifierWithID:@"LIST_ITEMS_GROUP_SPECIFIER"];
  id v20 = v4;
  [v4 addObject:v5];
  v18 = (void *)v5;
  [(PSListItemsController *)self _addStaticText:v5];
  uint64_t v19 = v3;
  if (v3)
  {
    uint64_t v6 = 0;
    do
    {
      id v7 = [v21 objectAtIndex:v6];
      int64_t v8 = [(PSSpecifier *)self->super.super._specifier titleDictionary];
      objc_super v9 = [v8 objectForKey:v7];

      uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v7, 0);
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v9, 0);
      id v12 = [(PSSpecifier *)self->super.super._specifier target];
      objc_super v13 = +[PSSpecifier preferenceSpecifierNamed:v9 target:v12 set:0 get:0 detail:0 cell:3 edit:0];

      v14 = [(PSListItemsController *)self identifierForValue:v7];
      [v13 setIdentifier:v14];

      [v13 setValues:v10 titles:v11];
      id v15 = [(PSListController *)self specifier];
      v16 = [v15 objectForKeyedSubscript:@"PSListItemsValuesAreAppIDsKey"];

      if (v16)
      {
        [v13 setProperty:v7 forKey:@"appIDForLazyIcon"];
        [v13 setProperty:MEMORY[0x1E4F1CC38] forKey:@"useLazyIcons"];
      }
      [v20 addObject:v13];

      ++v6;
    }
    while (v19 != v6);
  }

  return v20;
}

- (id)itemsFromDataSource
{
  uint64_t v3 = 992;
  int64_t v4 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"valuesDataSource"];
  uint64_t v5 = [(PSSpecifier *)self->super.super._specifier propertyForKey:@"titlesDataSource"];
  uint64_t v6 = (NSString *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v12 = 0;
  }
  else
  {
    v28 = v4;
    NSSelectorFromString(v4);
    int64_t v8 = [(PSSpecifier *)self->super.super._specifier target];
    objc_super v9 = SFPerformSelector();

    v27 = v6;
    NSSelectorFromString(v6);
    uint64_t v10 = [(PSSpecifier *)self->super.super._specifier target];
    v32 = SFPerformSelector();

    v33 = v9;
    uint64_t v11 = [v9 count];
    id v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v11];
    uint64_t v13 = +[PSSpecifier groupSpecifierWithID:@"LIST_ITEMS_GROUP_SPECIFIER"];
    [v12 addObject:v13];
    v26 = (void *)v13;
    [(PSListItemsController *)self _addStaticText:v13];
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v11];
    uint64_t v31 = v11;
    if (v11)
    {
      uint64_t v14 = 0;
      v30 = v12;
      do
      {
        id v15 = [v33 objectAtIndex:v14];
        v16 = [v32 objectAtIndex:v14];
        v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v15, 0);
        v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v16, 0);
        uint64_t v19 = v3;
        id WeakRetained = objc_loadWeakRetained(*(id **)((char *)&self->super.super.super.super.super.isa + v3) + 1);
        v21 = +[PSSpecifier preferenceSpecifierNamed:v16 target:WeakRetained set:0 get:0 detail:0 cell:3 edit:0];

        v22 = [(PSListItemsController *)self identifierForValue:v15];
        [v21 setIdentifier:v22];

        [v21 setValues:v17 titles:v18];
        v23 = [(PSListController *)self specifier];
        objc_super v24 = [v23 objectForKeyedSubscript:@"PSListItemsValuesAreAppIDsKey"];

        if (v24)
        {
          [v21 setProperty:v15 forKey:@"appIDForLazyIcon"];
          [v21 setProperty:MEMORY[0x1E4F1CC38] forKey:@"useLazyIcons"];
        }
        id v12 = v30;
        [v30 addObject:v21];
        if (v16 && v15) {
          [v29 setObject:v16 forKey:v15];
        }

        ++v14;
        uint64_t v3 = v19;
      }
      while (v31 != v14);
    }
    [*(id *)((char *)&self->super.super.super.super.super.isa + v3) setTitleDictionary:v29];

    uint64_t v6 = v27;
    int64_t v4 = v28;
  }

  return v12;
}

- (id)specifiers
{
  if (!self->super._specifiers)
  {
    uint64_t v3 = [(PSSpecifier *)self->super.super._specifier values];
    if (v3
      && (int64_t v4 = (void *)v3,
          [(PSSpecifier *)self->super.super._specifier titleDictionary],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v4,
          v5))
    {
      uint64_t v6 = [(PSListItemsController *)self itemsFromParent];
    }
    else
    {
      uint64_t v6 = [(PSListItemsController *)self itemsFromDataSource];
    }
    specifiers = self->super._specifiers;
    self->super._specifiers = v6;
  }
  int64_t v8 = self->super._specifiers;
  return v8;
}

- (id)identifierForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 stringValue];
    }
    else {
    id v4 = [v3 description];
    }
  }
  uint64_t v5 = v4;

  return v5;
}

- (BOOL)isRestrictionList
{
  return self->_restrictionList;
}

- (void)setIsRestrictionList:(BOOL)a3
{
  self->_restrictionList = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retainedTarget, 0);
  objc_storeStrong((id *)&self->_lastSelectedSpecifier, 0);
}

@end