@interface PREditingPaletteColorItemsDataSource
- (BOOL)includeSuggestedColor;
- (NSArray)items;
- (PREditingColorVariationStore)variationStore;
- (PREditingPaletteColorItemsDataSource)initWithConfiguration:(id)a3 variationStore:(id)a4 includesSuggestedColor:(BOOL)a5;
- (PREditorColorPickerConfiguration)configuration;
- (id)colorItemForIndex:(unint64_t)a3;
- (id)firstColorItemPassingTest:(id)a3;
- (unint64_t)indexForItem:(id)a3;
- (unint64_t)numberOfItems;
- (void)buildItems;
- (void)setConfiguration:(id)a3;
- (void)setIncludeSuggestedColor:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setVariationStore:(id)a3;
@end

@implementation PREditingPaletteColorItemsDataSource

- (PREditingPaletteColorItemsDataSource)initWithConfiguration:(id)a3 variationStore:(id)a4 includesSuggestedColor:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PREditingPaletteColorItemsDataSource;
  v11 = [(PREditingPaletteColorItemsDataSource *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a3);
    objc_storeStrong((id *)&v12->_variationStore, a4);
    v12->_includeSuggestedColor = a5;
    [(PREditingPaletteColorItemsDataSource *)v12 buildItems];
  }

  return v12;
}

- (unint64_t)numberOfItems
{
  return [(NSArray *)self->_items count];
}

- (void)buildItems
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!self->_items)
  {
    v26 = [(PREditorColorPickerConfiguration *)self->_configuration identifier];
    v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = [(PREditorColorPickerConfiguration *)self->_configuration suggestedColor];
    v5 = [(PREditorColorPickerConfiguration *)self->_configuration colorPalette];
    v25 = (void *)v4;
    if (self->_includeSuggestedColor
      && [(PREditorColorPickerConfiguration *)self->_configuration showsSuggestedColorItem]
      && v4)
    {
      v6 = +[PREditingColorItem suggestedColorItemWithColor:v4 context:[(PREditorColorPickerConfiguration *)self->_configuration context]];
      [v3 addObject:v6];
      v7 = +[PREditorColorPalette extendedPalette];
      int v8 = [v5 isEqual:v7];

      if (v8)
      {
        id v9 = [v5 colors];
        id v10 = (void *)[v9 mutableCopy];

        [v10 removeObjectAtIndex:15];
        v11 = [PREditorColorPalette alloc];
        v12 = [v5 localizedName];
        uint64_t v13 = [(PREditorColorPalette *)v11 initWithColors:v10 localizedName:v12 showsColorWell:0];

        v5 = (void *)v13;
      }
    }
    objc_msgSend(v5, "generatePickerColorsIfNeededForContext:", -[PREditorColorPickerConfiguration context](self->_configuration, "context"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    objc_super v14 = [v5 pickerColors];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v20 = [(PREditingColorVariationStore *)self->_variationStore variationForPickerColor:v19 forContextIdentifier:v26];
          [v19 initialVariation];
          if (v20) {
            [v20 doubleValue];
          }
          v22 = [[PREditingColorItem alloc] initWithPickerColor:v19 variation:[(PREditorColorPickerConfiguration *)self->_configuration context] context:v21];
          [v3 addObject:v22];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v16);
    }

    v23 = (NSArray *)[v3 copy];
    items = self->_items;
    self->_items = v23;
  }
}

- (id)firstColorItemPassingTest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (uint64_t (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_items;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v9))
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (unint64_t)indexForItem:(id)a3
{
  id v4 = a3;
  items = self->_items;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__PREditingPaletteColorItemsDataSource_indexForItem___block_invoke;
  v9[3] = &unk_1E54DB028;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [(NSArray *)items indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __53__PREditingPaletteColorItemsDataSource_indexForItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (id)colorItemForIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_items count] >= a3)
  {
    v5 = [(NSArray *)self->_items objectAtIndexedSubscript:a3];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (PREditorColorPickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (PREditingColorVariationStore)variationStore
{
  return self->_variationStore;
}

- (void)setVariationStore:(id)a3
{
}

- (BOOL)includeSuggestedColor
{
  return self->_includeSuggestedColor;
}

- (void)setIncludeSuggestedColor:(BOOL)a3
{
  self->_includeSuggestedColor = a3;
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_variationStore, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end