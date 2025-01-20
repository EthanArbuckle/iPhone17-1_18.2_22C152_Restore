@interface PREditingContentStyleItemsDataSource
- (BOOL)includeSuggestedStyle;
- (NSArray)coordinators;
- (PREditingContentStyleItemsDataSource)initWithConfiguration:(id)a3 includesSuggestedStyle:(BOOL)a4 delegate:(id)a5;
- (PREditingContentStyleItemsDataSourceDelegate)delegate;
- (PREditorContentStylePickerConfiguration)configuration;
- (double)contentsLuminance;
- (id)coordinatorForIndex:(unint64_t)a3;
- (id)firstCoordinatorPassingTest:(id)a3;
- (unint64_t)indexForCoordinator:(id)a3;
- (unint64_t)numberOfCoordinators;
- (void)buildCoordinators;
- (void)setConfiguration:(id)a3;
- (void)setContentsLuminance:(double)a3;
- (void)setCoordinators:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIncludeSuggestedStyle:(BOOL)a3;
@end

@implementation PREditingContentStyleItemsDataSource

- (PREditingContentStyleItemsDataSource)initWithConfiguration:(id)a3 includesSuggestedStyle:(BOOL)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PREditingContentStyleItemsDataSource;
  v11 = [(PREditingContentStyleItemsDataSource *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a3);
    v12->_includeSuggestedStyle = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
    [(PREditingContentStyleItemsDataSource *)v12 buildCoordinators];
  }

  return v12;
}

- (unint64_t)numberOfCoordinators
{
  return [(NSArray *)self->_coordinators count];
}

- (void)buildCoordinators
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!self->_coordinators)
  {
    v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = [(PREditorContentStylePickerConfiguration *)self->_configuration suggestedStyle];
    v5 = [(PREditorContentStylePickerConfiguration *)self->_configuration stylePalette];
    v24 = (void *)v4;
    if (self->_includeSuggestedStyle
      && [(PREditorContentStylePickerConfiguration *)self->_configuration showsSuggestedContentStyleItem]&& v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = [WeakRetained coordinatorForStyle:v4 isSuggestedStyle:1 fromDataSource:self];

      if (!v7) {
        v7 = [[PREditingPosterContentStyleCoordinator alloc] initWithInitialStyle:v4 suggested:1];
      }
      [v3 addObject:v7];
      if ([v5 isDefaultPalette] && objc_msgSend(v5, "context") == 1)
      {
        v8 = [v5 styles];
        id v9 = (void *)[v8 mutableCopy];

        [v9 removeObjectAtIndex:15];
        id v10 = [PREditorContentStylePalette alloc];
        v11 = [v5 localizedName];
        uint64_t v12 = [(PREditorContentStylePalette *)v10 initWithContentStyles:v9 localizedName:v11];

        v5 = (void *)v12;
      }
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v13 = objc_msgSend(v5, "styles", v5);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v19 = objc_loadWeakRetained((id *)&self->_delegate);
          v20 = [v19 coordinatorForStyle:v18 isSuggestedStyle:0 fromDataSource:self];

          if (!v20) {
            v20 = [[PREditingPosterContentStyleCoordinator alloc] initWithInitialStyle:v18 suggested:0];
          }
          [v3 addObject:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v15);
    }

    v21 = (NSArray *)[v3 copy];
    coordinators = self->_coordinators;
    self->_coordinators = v21;
  }
}

- (id)firstCoordinatorPassingTest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (uint64_t (**)(id, void *))a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = self->_coordinators;
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

- (unint64_t)indexForCoordinator:(id)a3
{
  id v4 = a3;
  coordinators = self->_coordinators;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PREditingContentStyleItemsDataSource_indexForCoordinator___block_invoke;
  v9[3] = &unk_1E54DCED8;
  id v10 = v4;
  id v6 = v4;
  unint64_t v7 = [(NSArray *)coordinators indexOfObjectPassingTest:v9];

  return v7;
}

uint64_t __60__PREditingContentStyleItemsDataSource_indexForCoordinator___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (id)coordinatorForIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_coordinators count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_coordinators objectAtIndexedSubscript:a3];
  }
  return v5;
}

- (void)setContentsLuminance:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_contentsLuminance != a3)
  {
    self->_contentsLuminance = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = self->_coordinators;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "setContentsLuminance:", a3, (void)v9);
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (PREditingContentStyleItemsDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PREditingContentStyleItemsDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PREditorContentStylePickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)includeSuggestedStyle
{
  return self->_includeSuggestedStyle;
}

- (void)setIncludeSuggestedStyle:(BOOL)a3
{
  self->_includeSuggestedStyle = a3;
}

- (NSArray)coordinators
{
  return self->_coordinators;
}

- (void)setCoordinators:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinators, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end