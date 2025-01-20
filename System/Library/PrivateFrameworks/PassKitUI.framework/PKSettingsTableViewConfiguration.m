@interface PKSettingsTableViewConfiguration
- (NSArray)sections;
- (PKSettingsTableViewConfiguration)init;
- (id)rowForItemIdentifier:(id)a3;
- (id)rowsForSection:(id)a3;
- (id)sectionForSectionIdentifier:(id)a3;
- (id)snapshot;
- (void)appendSection:(id)a3 rows:(id)a4;
- (void)diff:(id)a3 updatedIdentifiers:(id *)a4;
@end

@implementation PKSettingsTableViewConfiguration

- (PKSettingsTableViewConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKSettingsTableViewConfiguration;
  v2 = [(PKSettingsTableViewConfiguration *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    rowsForIdentifier = v2->_rowsForIdentifier;
    v2->_rowsForIdentifier = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sectionsForIdentifier = v2->_sectionsForIdentifier;
    v2->_sectionsForIdentifier = v5;
  }
  return v2;
}

- (void)appendSection:(id)a3 rows:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_currentSnapshot)
  {
    objc_super v8 = (NSDiffableDataSourceSnapshot *)objc_alloc_init(MEMORY[0x1E4FB1360]);
    currentSnapshot = self->_currentSnapshot;
    self->_currentSnapshot = v8;
  }
  v10 = [v6 identifier];
  [(NSMutableDictionary *)self->_sectionsForIdentifier setObject:v6 forKey:v10];
  v11 = objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__PKSettingsTableViewConfiguration_appendSection_rows___block_invoke_2;
  v14[3] = &unk_1E59CAAE0;
  v14[4] = self;
  [v7 enumerateObjectsUsingBlock:v14];
  v12 = self->_currentSnapshot;
  v15[0] = v10;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  [(NSDiffableDataSourceSnapshot *)v12 appendSectionsWithIdentifiers:v13];

  [(NSDiffableDataSourceSnapshot *)self->_currentSnapshot appendItemsWithIdentifiers:v11 intoSectionWithIdentifier:v10];
}

uint64_t __55__PKSettingsTableViewConfiguration_appendSection_rows___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __55__PKSettingsTableViewConfiguration_appendSection_rows___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = a2;
  id v4 = [v3 identifier];
  [v2 setObject:v3 forKey:v4];
}

- (id)rowForItemIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKey:](self->_rowsForIdentifier, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)sectionForSectionIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[NSMutableDictionary objectForKey:](self->_sectionsForIdentifier, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (NSArray)sections
{
  uint64_t v3 = [(NSDiffableDataSourceSnapshot *)self->_currentSnapshot sectionIdentifiers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PKSettingsTableViewConfiguration_sections__block_invoke;
  v6[3] = &unk_1E59CAB08;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "pk_arrayByApplyingBlock:", v6);

  return (NSArray *)v4;
}

uint64_t __44__PKSettingsTableViewConfiguration_sections__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:a2];
}

- (id)rowsForSection:(id)a3
{
  currentSnapshot = self->_currentSnapshot;
  v5 = [a3 identifier];
  id v6 = [(NSDiffableDataSourceSnapshot *)currentSnapshot itemIdentifiersInSectionWithIdentifier:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__PKSettingsTableViewConfiguration_rowsForSection___block_invoke;
  v9[3] = &unk_1E59CAB30;
  v9[4] = self;
  id v7 = objc_msgSend(v6, "pk_arrayByApplyingBlock:", v9);

  return v7;
}

uint64_t __51__PKSettingsTableViewConfiguration_rowsForSection___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:a2];
}

- (id)snapshot
{
  return self->_currentSnapshot;
}

- (void)diff:(id)a3 updatedIdentifiers:(id *)a4
{
  if (a3 && a4)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F1CA80];
    id v7 = a3;
    id v8 = objc_alloc_init(v6);
    v9 = (void *)v7[1];

    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __60__PKSettingsTableViewConfiguration_diff_updatedIdentifiers___block_invoke;
    v14 = &unk_1E59CAB58;
    v15 = self;
    id v10 = v8;
    id v16 = v10;
    [v9 enumerateKeysAndObjectsUsingBlock:&v11];
    if (objc_msgSend(v10, "count", v11, v12, v13, v14, v15)) {
      *a4 = (id)[v10 copy];
    }
  }
}

void __60__PKSettingsTableViewConfiguration_diff_updatedIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:v7];
  if (v6 && (PKEqualObjects() & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_sectionsForIdentifier, 0);

  objc_storeStrong((id *)&self->_rowsForIdentifier, 0);
}

@end