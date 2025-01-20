@interface WFParameterValuePickerDataSource
+ (id)variableSectionIdentifier;
- (INObjectCollection)collection;
- (NSSet)allowedVariableTypes;
- (UILocalizedIndexedCollation)localizedCollation;
- (WFParameterValuePickable)parameter;
- (WFParameterValuePickerDataSource)initWithParameter:(id)a3 tableView:(id)a4 cellProvider:(id)a5;
- (WFVariableProvider)variableProvider;
- (WFVariableUIDelegate)variableUIDelegate;
- (id)displayVariables;
- (id)displayVariablesWithTitle:(id)a3;
- (id)parameterStateAtIndexPath:(id)a3;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)snapshotForCollection:(id)a3 filterVariableTitle:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (unint64_t)itemsCount;
- (unint64_t)sectionsCount;
- (void)applyCollection:(id)a3 animatingDifferences:(BOOL)a4 filterVariableTitle:(id)a5;
- (void)applyCollection:(id)a3 animatingDifferences:(BOOL)a4 filterVariableTitle:(id)a5 completion:(id)a6;
- (void)applyEmptyCollectionAnimatingDifferences:(BOOL)a3 completion:(id)a4;
- (void)setAllowedVariableTypes:(id)a3;
- (void)setCollection:(id)a3;
- (void)setVariableProvider:(id)a3;
- (void)setVariableUIDelegate:(id)a3;
@end

@implementation WFParameterValuePickerDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_allowedVariableTypes, 0);
  objc_destroyWeak((id *)&self->_variableUIDelegate);
  objc_destroyWeak((id *)&self->_variableProvider);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_localizedCollation, 0);
}

- (WFParameterValuePickable)parameter
{
  return self->_parameter;
}

- (void)setAllowedVariableTypes:(id)a3
{
}

- (NSSet)allowedVariableTypes
{
  return self->_allowedVariableTypes;
}

- (void)setVariableUIDelegate:(id)a3
{
}

- (WFVariableUIDelegate)variableUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variableUIDelegate);
  return (WFVariableUIDelegate *)WeakRetained;
}

- (void)setVariableProvider:(id)a3
{
}

- (WFVariableProvider)variableProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variableProvider);
  return (WFVariableProvider *)WeakRetained;
}

- (void)setCollection:(id)a3
{
}

- (INObjectCollection)collection
{
  return self->_collection;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  v7 = [(WFParameterValuePickerDataSource *)self collection];
  int v8 = [v7 usesIndexedCollation];

  if (v8)
  {
    v9 = [(WFParameterValuePickerDataSource *)self localizedCollation];
    a5 = [v9 sectionForSectionIndexTitleAtIndex:a5];
  }
  return a5;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  v4 = [(WFParameterValuePickerDataSource *)self collection];
  if ([v4 usesIndexedCollation])
  {
    v5 = [(WFParameterValuePickerDataSource *)self localizedCollation];
    v6 = [v5 sectionIndexTitles];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v6 = [(WFParameterValuePickerDataSource *)self collection];
  v7 = [v6 sections];
  unint64_t v8 = [v7 count];

  if (v8 <= a4)
  {
    v15 = 0;
    goto LABEL_9;
  }
  v9 = [(WFParameterValuePickerDataSource *)self collection];
  v10 = [v9 sections];
  v11 = [v10 objectAtIndexedSubscript:a4];

  v12 = [v11 items];
  if (![v12 count])
  {

    goto LABEL_7;
  }
  v13 = [v11 title];
  uint64_t v14 = [v13 length];

  if (!v14)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v15 = [v11 title];
LABEL_8:

LABEL_9:
  return v15;
}

- (void)applyEmptyCollectionAnimatingDifferences:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(WFParameterValuePickerDataSource *)self setCollection:0];
  id v7 = objc_alloc_init(MEMORY[0x263F82358]);
  v8.receiver = self;
  v8.super_class = (Class)WFParameterValuePickerDataSource;
  [(UITableViewDiffableDataSource *)&v8 applySnapshot:v7 animatingDifferences:v4 completion:v6];
}

- (void)applyCollection:(id)a3 animatingDifferences:(BOOL)a4 filterVariableTitle:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  if ([v12 usesIndexedCollation])
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __104__WFParameterValuePickerDataSource_applyCollection_animatingDifferences_filterVariableTitle_completion___block_invoke;
    v20[3] = &unk_264BFCEF0;
    v20[4] = self;
    v13 = objc_msgSend(v12, "wf_mapItems:", v20);

    uint64_t v14 = [(WFParameterValuePickerDataSource *)self localizedCollation];
    v15 = objc_msgSend(v13, "wf_localizedIndexedCollationCollectionWithCollation:collationStringSelector:", v14, sel_readableTitle);

    v16 = objc_msgSend(v15, "wf_mapItems:", &__block_literal_global_240);
    [(WFParameterValuePickerDataSource *)self setCollection:v16];
  }
  else
  {
    [(WFParameterValuePickerDataSource *)self setCollection:v12];
  }
  v17 = [(WFParameterValuePickerDataSource *)self collection];
  v18 = [(WFParameterValuePickerDataSource *)self snapshotForCollection:v17 filterVariableTitle:v11];

  v19.receiver = self;
  v19.super_class = (Class)WFParameterValuePickerDataSource;
  [(UITableViewDiffableDataSource *)&v19 applySnapshot:v18 animatingDifferences:v7 completion:v10];
}

WFParameterValueWrapper *__104__WFParameterValuePickerDataSource_applyCollection_animatingDifferences_filterVariableTitle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [WFParameterValueWrapper alloc];
  v5 = [*(id *)(a1 + 32) parameter];
  id v6 = [(WFParameterValueWrapper *)v4 initWithValue:v3 parameter:v5];

  return v6;
}

uint64_t __104__WFParameterValuePickerDataSource_applyCollection_animatingDifferences_filterVariableTitle_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 value];
}

- (void)applyCollection:(id)a3 animatingDifferences:(BOOL)a4 filterVariableTitle:(id)a5
{
}

- (id)snapshotForCollection:(id)a3 filterVariableTitle:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = (objc_class *)MEMORY[0x263F82358];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  id v10 = [v8 sections];

  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  objc_super v19 = __78__WFParameterValuePickerDataSource_snapshotForCollection_filterVariableTitle___block_invoke;
  v20 = &unk_264BFCEC8;
  id v11 = v9;
  id v21 = v11;
  v22 = self;
  [v10 enumerateObjectsUsingBlock:&v17];

  id v12 = -[WFParameterValuePickerDataSource displayVariablesWithTitle:](self, "displayVariablesWithTitle:", v7, v17, v18, v19, v20);

  if ([v12 count])
  {
    v13 = [(id)objc_opt_class() variableSectionIdentifier];
    v23[0] = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    [v11 appendSectionsWithIdentifiers:v14];

    [v11 appendItemsWithIdentifiers:v12];
  }
  id v15 = v11;

  return v15;
}

void __78__WFParameterValuePickerDataSource_snapshotForCollection_filterVariableTitle___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = [v3 _identifier];
  v5 = *(void **)(a1 + 32);
  v20[0] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  [v5 appendSectionsWithIdentifiers:v6];

  id v7 = [v3 items];
  id v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = [v3 items];
  id v10 = [v8 setWithArray:v9];
  uint64_t v11 = [v10 count];
  id v12 = [v3 items];
  uint64_t v13 = [v12 count];

  if (v11 != v13)
  {
    uint64_t v14 = [v3 items];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __78__WFParameterValuePickerDataSource_snapshotForCollection_filterVariableTitle___block_invoke_2;
    v19[3] = &unk_264BFCEA0;
    v19[4] = *(void *)(a1 + 40);
    uint64_t v15 = objc_msgSend(v14, "if_map:", v19);
    v16 = (void *)v15;
    uint64_t v17 = (void *)MEMORY[0x263EFFA68];
    if (v15) {
      uint64_t v17 = (void *)v15;
    }
    id v18 = v17;

    id v7 = v18;
  }
  [*(id *)(a1 + 32) appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:v4];
}

WFParameterValueWrapper *__78__WFParameterValuePickerDataSource_snapshotForCollection_filterVariableTitle___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [WFParameterValueWrapper alloc];
  v5 = [*(id *)(a1 + 32) parameter];
  id v6 = [(WFParameterValueWrapper *)v4 initWithValue:v3 parameter:v5];

  return v6;
}

- (id)parameterStateAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  id v6 = [(WFParameterValuePickerDataSource *)self collection];
  id v7 = [v6 sections];
  unint64_t v8 = [v7 count];

  if (v5 >= v8)
  {
    id v12 = [(WFParameterValuePickerDataSource *)self displayVariables];
    uint64_t v13 = [v4 row];

    id v10 = [v12 objectAtIndexedSubscript:v13];

    uint64_t v14 = [(WFParameterValuePickerDataSource *)self parameter];
    uint64_t v15 = (objc_class *)[v14 stateClass];

    uint64_t v11 = [[v15 alloc] initWithVariable:v10];
  }
  else
  {
    id v9 = [(WFParameterValuePickerDataSource *)self collection];
    id v10 = objc_msgSend(v9, "wf_itemAtIndexPath:", v4);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v11 = [v10 value];
  }
  v16 = (void *)v11;

  id v10 = v16;
LABEL_6:
  return v10;
}

- (WFParameterValuePickerDataSource)initWithParameter:(id)a3 tableView:(id)a4 cellProvider:(id)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFParameterValuePickerDataSource;
  id v10 = [(UITableViewDiffableDataSource *)&v14 initWithTableView:a4 cellProvider:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parameter, a3);
    id v12 = v11;
  }

  return v11;
}

- (unint64_t)sectionsCount
{
  v5.receiver = self;
  v5.super_class = (Class)WFParameterValuePickerDataSource;
  v2 = [(UITableViewDiffableDataSource *)&v5 snapshot];
  unint64_t v3 = [v2 numberOfSections];

  return v3;
}

- (unint64_t)itemsCount
{
  v5.receiver = self;
  v5.super_class = (Class)WFParameterValuePickerDataSource;
  v2 = [(UITableViewDiffableDataSource *)&v5 snapshot];
  unint64_t v3 = [v2 numberOfItems];

  return v3;
}

- (id)displayVariablesWithTitle:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(WFParameterValuePickerDataSource *)self displayVariables];
  id v6 = v5;
  if (v4)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62__WFParameterValuePickerDataSource_displayVariablesWithTitle___block_invoke;
    v9[3] = &unk_264BFD2D0;
    id v10 = v4;
    objc_msgSend(v6, "if_objectsPassingTest:", v9);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

uint64_t __62__WFParameterValuePickerDataSource_displayVariablesWithTitle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 name];
    objc_super v5 = v3;
  }
  else
  {

    if ([v3 isEqual:*MEMORY[0x263F874E0]])
    {
      id v4 = WFLocalizedString(@"Select Magic Variable");
      objc_super v5 = 0;
    }
    else
    {
      objc_super v5 = 0;
      id v4 = 0;
    }
  }
  uint64_t v6 = [v4 localizedStandardContainsString:*(void *)(a1 + 32)];

  return v6;
}

- (id)displayVariables
{
  id v3 = [(WFParameterValuePickerDataSource *)self allowedVariableTypes];
  if (![v3 count])
  {

    goto LABEL_8;
  }
  id v4 = [(WFParameterValuePickerDataSource *)self variableProvider];

  if (!v4)
  {
LABEL_8:
    objc_super v5 = 0;
    goto LABEL_21;
  }
  objc_super v5 = objc_opt_new();
  uint64_t v6 = [(WFParameterValuePickerDataSource *)self allowedVariableTypes];
  uint64_t v7 = *MEMORY[0x263F874E0];
  if ([v6 containsObject:*MEMORY[0x263F874E0]])
  {
    unint64_t v8 = [(WFParameterValuePickerDataSource *)self variableProvider];
    if ([v8 hasAvailableActionOutputVariables])
    {
      id v9 = [(WFParameterValuePickerDataSource *)self variableUIDelegate];

      if (v9) {
        [v5 addObject:v7];
      }
      goto LABEL_11;
    }
  }
LABEL_11:
  id v10 = [(WFParameterValuePickerDataSource *)self allowedVariableTypes];
  int v11 = [v10 containsObject:*MEMORY[0x263F874E8]];

  if (v11)
  {
    id v12 = objc_opt_new();
    [v5 addObject:v12];
  }
  uint64_t v13 = [(WFParameterValuePickerDataSource *)self allowedVariableTypes];
  int v14 = [v13 containsObject:*MEMORY[0x263F874F0]];

  if (v14)
  {
    uint64_t v15 = objc_opt_new();
    [v5 addObject:v15];
  }
  v16 = [(WFParameterValuePickerDataSource *)self allowedVariableTypes];
  int v17 = [v16 containsObject:*MEMORY[0x263F87500]];

  if (v17)
  {
    id v18 = objc_opt_new();
    [v5 addObject:v18];
  }
  objc_super v19 = [(WFParameterValuePickerDataSource *)self allowedVariableTypes];
  int v20 = [v19 containsObject:*MEMORY[0x263F87508]];

  if (v20)
  {
    id v21 = objc_opt_new();
    [v5 addObject:v21];
  }
  v22 = [(WFParameterValuePickerDataSource *)self allowedVariableTypes];
  int v23 = [v22 containsObject:*MEMORY[0x263F87518]];

  if (v23)
  {
    v24 = [(WFParameterValuePickerDataSource *)self variableProvider];
    v25 = [v24 availableVariableNames];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __52__WFParameterValuePickerDataSource_displayVariables__block_invoke;
    v28[3] = &unk_264BFD0F0;
    v28[4] = self;
    v26 = objc_msgSend(v25, "if_map:", v28);
    [v5 addObjectsFromArray:v26];
  }
LABEL_21:
  return v5;
}

id __52__WFParameterValuePickerDataSource_displayVariables__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F86F80];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [*(id *)(a1 + 32) variableProvider];
  uint64_t v7 = (void *)[v5 initWithName:v4 variableProvider:v6 aggrandizements:0];

  return v7;
}

- (UILocalizedIndexedCollation)localizedCollation
{
  localizedCollation = self->_localizedCollation;
  if (!localizedCollation)
  {
    id v4 = [MEMORY[0x263F82928] currentCollation];
    id v5 = self->_localizedCollation;
    self->_localizedCollation = v4;

    localizedCollation = self->_localizedCollation;
  }
  return localizedCollation;
}

+ (id)variableSectionIdentifier
{
  if (variableSectionIdentifier_onceToken != -1) {
    dispatch_once(&variableSectionIdentifier_onceToken, &__block_literal_global_274);
  }
  v2 = (void *)variableSectionIdentifier_variableSectionIdentifier;
  return v2;
}

void __61__WFParameterValuePickerDataSource_variableSectionIdentifier__block_invoke()
{
  id v2 = [MEMORY[0x263F08C38] UUID];
  uint64_t v0 = [v2 UUIDString];
  v1 = (void *)variableSectionIdentifier_variableSectionIdentifier;
  variableSectionIdentifier_variableSectionIdentifier = v0;
}

@end