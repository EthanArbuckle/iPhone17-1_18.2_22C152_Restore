@interface MusicSettingsListViewController
- (NSArray)allSpecifiers;
- (NSString)stringsTable;
- (id)_sectionedCollectionRepresentation;
- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5;
- (id)specifiers;
- (id)valueForMusicCapability:(id)a3;
- (void)_configureCell:(id)a3 forIndexPath:(id)a4;
- (void)setAllSpecifiers:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setStringsTable:(id)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateVisibleSpecifiers;
@end

@implementation MusicSettingsListViewController

- (NSArray)allSpecifiers
{
  return self->_allSpecifiers;
}

- (NSString)stringsTable
{
  return self->_stringsTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringsTable, 0);
  objc_storeStrong((id *)&self->_allSpecifiers, 0);
}

- (void)setStringsTable:(id)a3
{
}

- (void)setAllSpecifiers:(id)a3
{
}

- (id)_sectionedCollectionRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263F120D8]);
  uint64_t v4 = [(MusicSettingsListViewController *)self numberOfGroups];
  if (v4 >= 1)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    v7 = (int *)MEMORY[0x263F5FDB8];
    do
    {
      v8 = [(MusicSettingsListViewController *)self specifierAtIndex:[(MusicSettingsListViewController *)self indexOfGroup:v6]];
      [v3 appendSection:v8];
      v9 = [v8 identifier];
      uint64_t v10 = [(MusicSettingsListViewController *)self rangeOfSpecifiersInGroupID:v9];
      uint64_t v12 = v11;

      v13 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v7), "subarrayWithRange:", v10 + 1, v12 - 1);
      [v3 appendItems:v13];

      ++v6;
    }
    while (v5 != v6);
  }
  return v3;
}

- (void)_configureCell:(id)a3 forIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(MusicSettingsListViewController *)self specifierAtIndexPath:v6];
    [v8 setSpecifier:v7];
    [v8 refreshCellContentsWithSpecifier:v7];
  }
}

- (id)valueForMusicCapability:(id)a3
{
  return 0;
}

- (void)updateVisibleSpecifiers
{
  uint64_t v2 = (int)*MEMORY[0x263F5FDB8];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v2))
  {
    uint64_t v4 = [(MusicSettingsListViewController *)self _sectionedCollectionRepresentation];
    _MSS_resolvedSpecifiers(self);
    uint64_t v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    id v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = v5;

    [(MusicSettingsListViewController *)self prepareSpecifiersMetadata];
    v7 = [(MusicSettingsListViewController *)self _sectionedCollectionRepresentation];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke;
    v26[3] = &unk_264CBF610;
    id v27 = v4;
    id v28 = v7;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_2;
    v23[3] = &unk_264CBF610;
    id v8 = v27;
    id v24 = v8;
    id v9 = v28;
    id v25 = v9;
    uint64_t v10 = [v8 changeDetailsToSectionedCollection:v9 isEqualBlock:v26 isUpdatedBlock:v23];
    uint64_t v11 = [(MusicSettingsListViewController *)self table];
    [(MusicSettingsListViewController *)self setCachesCells:0];
    [(MusicSettingsListViewController *)self setCachesCells:1];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_3;
    v20[3] = &unk_264CBF638;
    id v12 = v11;
    id v21 = v12;
    v22 = self;
    uint64_t v13 = MEMORY[0x237E0CAA0](v20);
    v14 = (void *)v13;
    if (v10)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_4;
      v17[3] = &unk_264CBF638;
      id v18 = v12;
      id v19 = v10;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_7;
      v15[3] = &unk_264CBF6B0;
      id v16 = v14;
      [v18 performBatchUpdates:v17 completion:v15];
    }
    else
    {
      (*(void (**)(uint64_t))(v13 + 16))(v13);
    }
  }
}

uint64_t __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 length];
  id v8 = *(void **)(a1 + 32);
  if (v7 == 1)
  {
    uint64_t v9 = [v6 section];

    uint64_t v10 = [v8 sectionAtIndex:v9];
    uint64_t v11 = [v10 identifier];

    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = [v5 section];

    v14 = [v12 sectionAtIndex:v13];
    v15 = v14;
  }
  else
  {
    id v16 = [*(id *)(a1 + 32) itemAtIndexPath:v6];

    uint64_t v11 = [v16 identifier];

    v15 = [*(id *)(a1 + 40) itemAtIndexPath:v5];

    v14 = v15;
  }
  v17 = [v14 identifier];

  uint64_t v18 = [v11 isEqualToString:v17];
  return v18;
}

uint64_t __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 length];
  id v8 = *(void **)(a1 + 32);
  if (v7 == 1)
  {
    uint64_t v9 = [v6 section];

    uint64_t v10 = [v8 sectionAtIndex:v9];
    uint64_t v11 = *(void **)(a1 + 40);
    uint64_t v12 = [v5 section];

    uint64_t v13 = [v11 sectionAtIndex:v12];
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) itemAtIndexPath:v6];

    uint64_t v13 = [*(id *)(a1 + 40) itemAtIndexPath:v5];
  }
  int v14 = objc_msgSend(v10, "music_areDisplayValuesEqual:", v13);

  return v14 ^ 1u;
}

void __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "indexPathsForVisibleRows", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        uint64_t v9 = [*(id *)(a1 + 32) cellForRowAtIndexPath:v7];
        [v8 _configureCell:v9 forIndexPath:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) insertedSections];
  [v2 insertSections:v3 withRowAnimation:0];

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) deletedSections];
  [v4 deleteSections:v5 withRowAnimation:0];

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) updatedSections];
  [v6 reloadSections:v7 withRowAnimation:0];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_5;
  v18[3] = &unk_264CBF660;
  id v8 = *(void **)(a1 + 40);
  id v19 = *(id *)(a1 + 32);
  [v8 enumerateSectionMovesUsingBlock:v18];
  uint64_t v9 = *(void **)(a1 + 32);
  long long v10 = [*(id *)(a1 + 40) insertedItemIndexPaths];
  [v9 insertRowsAtIndexPaths:v10 withRowAnimation:0];

  long long v11 = *(void **)(a1 + 32);
  long long v12 = [*(id *)(a1 + 40) deletedItemIndexPaths];
  [v11 deleteRowsAtIndexPaths:v12 withRowAnimation:0];

  long long v13 = *(void **)(a1 + 32);
  int v14 = [*(id *)(a1 + 40) updatedItemIndexPaths];
  [v13 reloadRowsAtIndexPaths:v14 withRowAnimation:0];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_6;
  v16[3] = &unk_264CBF688;
  uint64_t v15 = *(void **)(a1 + 40);
  id v17 = *(id *)(a1 + 32);
  [v15 enumerateItemMovesUsingBlock:v16];
}

uint64_t __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) moveSection:a2 toSection:a3];
}

uint64_t __58__MusicSettingsListViewController_updateVisibleSpecifiers__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) moveRowAtIndexPath:a2 toIndexPath:a3];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (objc_opt_respondsToSelector())
  {
    v11.receiver = self;
    v11.super_class = (Class)MusicSettingsListViewController;
    [(MusicSettingsListViewController *)&v11 tableView:v8 willDisplayCell:v9 forRowAtIndexPath:v10];
  }
  [(MusicSettingsListViewController *)self _configureCell:v9 forIndexPath:v10];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    _MSS_resolvedSpecifiers(self);
    uint64_t v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    id v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v5;

    uint64_t v7 = [*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) name];
    [(MusicSettingsListViewController *)self setTitle:v7];

    uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MusicSettingsListViewController;
  [(MusicSettingsListViewController *)&v6 setPreferenceValue:a3 specifier:a4];
  [(MusicSettingsListViewController *)self updateVisibleSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE78]));
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [WeakRetained updateVisibleSpecifiers];
  }
}

- (id)loadSpecifiersFromPlistName:(id)a3 target:(id)a4 bundle:(id)a5
{
  objc_storeStrong((id *)&self->_stringsTable, a3);
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MusicSettingsListViewController;
  long long v12 = [(MusicSettingsListViewController *)&v14 loadSpecifiersFromPlistName:v9 target:v11 bundle:v10];

  return v12;
}

@end