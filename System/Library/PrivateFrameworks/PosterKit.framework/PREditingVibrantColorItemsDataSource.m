@interface PREditingVibrantColorItemsDataSource
- (NSArray)items;
- (PREditingColorVariationStore)variationStore;
- (PREditingVibrantColorItemsDataSource)initWithConfiguration:(id)a3 variationStore:(id)a4;
- (PREditorColorPickerConfiguration)configuration;
- (id)colorItemForIndex:(unint64_t)a3;
- (id)firstColorItemPassingTest:(id)a3;
- (unint64_t)indexForItem:(id)a3;
- (unint64_t)numberOfItems;
- (void)buildItems;
- (void)setConfiguration:(id)a3;
- (void)setItems:(id)a3;
- (void)setVariationStore:(id)a3;
@end

@implementation PREditingVibrantColorItemsDataSource

- (PREditingVibrantColorItemsDataSource)initWithConfiguration:(id)a3 variationStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PREditingVibrantColorItemsDataSource;
  v9 = [(PREditingVibrantColorItemsDataSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_variationStore, a4);
    [(PREditingVibrantColorItemsDataSource *)v10 buildItems];
  }

  return v10;
}

- (unint64_t)numberOfItems
{
  return [(NSArray *)self->_items count];
}

- (void)buildItems
{
  v46[3] = *MEMORY[0x1E4F143B8];
  if (!self->_items)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    v38 = [(PREditorColorPickerConfiguration *)self->_configuration identifier];
    v4 = [(PREditingVibrantColorItemsDataSource *)self configuration];
    uint64_t v5 = [v4 suggestedColor];

    v6 = [(PREditingVibrantColorItemsDataSource *)self configuration];
    id v7 = [v6 suggestedColor];

    if (v7)
    {
      id v8 = +[PREditingColorItem suggestedColorItemWithColor:v5 context:[(PREditorColorPickerConfiguration *)self->_configuration context]];
      [v3 addObject:v8];
    }
    v37 = (void *)v5;
    v9 = [PRPosterColor alloc];
    v10 = [MEMORY[0x1E4FB1618] whiteColor];
    v11 = [(PRPosterColor *)v9 initWithColor:v10 preferredStyle:2];

    objc_super v12 = [PRPosterColor alloc];
    v13 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v14 = [(PRPosterColor *)v12 initWithColor:v13 preferredStyle:2];

    v15 = [PREditorColorPickerVibrantMonotoneColor alloc];
    v16 = +[PRPosterColor vibrantMonochromeColor];
    v45[0] = &unk_1ED9EEDA0;
    v45[1] = &unk_1ED9EEDB8;
    v46[0] = v11;
    v46[1] = v11;
    v36 = (void *)v14;
    v45[2] = &unk_1ED9EEDD0;
    v46[2] = v14;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
    uint64_t v18 = [(PREditorColorPickerVibrantMonotoneColor *)v15 initWithColor:v16 displayColors:v17 localizedName:0];

    v35 = (void *)v18;
    v19 = [[PREditingColorItem alloc] initWithPickerColor:v18 variation:[(PREditorColorPickerConfiguration *)self->_configuration context] context:0.0];
    [(PREditingColorItem *)v19 setShowsSlider:0];
    v20 = +[PREditingColorItem vibrantMaterialItem];
    v44[0] = v20;
    v44[1] = v19;
    v34 = v19;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    v22 = v3;
    [v3 addObjectsFromArray:v21];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v23 = [(PREditorColorPickerConfiguration *)self->_configuration suggestedColors];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [[PREditorColorPickerConstantColor alloc] initWithBaseUIColor:*(void *)(*((void *)&v39 + 1) + 8 * i)];
          v29 = [(PREditingColorVariationStore *)self->_variationStore variationForPickerColor:v28 forContextIdentifier:v38];
          [(PREditorColorPickerConstantColor *)v28 initialVariation];
          if (v29) {
            [v29 doubleValue];
          }
          v31 = [[PREditingColorItem alloc] initWithPickerColor:v28 variation:[(PREditorColorPickerConfiguration *)self->_configuration context] context:v30];
          [v22 addObject:v31];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v25);
    }

    v32 = (NSArray *)[v22 copy];
    items = self->_items;
    self->_items = v32;
  }
}

- (id)firstColorItemPassingTest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_items;
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
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
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
  v9[2] = __53__PREditingVibrantColorItemsDataSource_indexForItem___block_invoke;
  v9[3] = &unk_1E54DB028;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [(NSArray *)items indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __53__PREditingVibrantColorItemsDataSource_indexForItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (id)colorItemForIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_items count] >= a3)
  {
    uint64_t v5 = [(NSArray *)self->_items objectAtIndexedSubscript:a3];
  }
  else
  {
    uint64_t v5 = 0;
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