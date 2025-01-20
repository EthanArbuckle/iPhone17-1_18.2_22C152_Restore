@interface STStatusItemsStatusDomainVisualDescriptorTransformer
- (STStatusItemsStatusDomainVisualDescriptorTransformer)init;
- (STStatusItemsStatusDomainVisualDescriptorTransformer)initWithStatusItemsManager:(id)a3;
- (id)transformedDataForData:(id)a3;
@end

@implementation STStatusItemsStatusDomainVisualDescriptorTransformer

- (STStatusItemsStatusDomainVisualDescriptorTransformer)init
{
  v3 = +[STStatusItemsManager sharedInstance];
  v4 = [(STStatusItemsStatusDomainVisualDescriptorTransformer *)self initWithStatusItemsManager:v3];

  return v4;
}

- (STStatusItemsStatusDomainVisualDescriptorTransformer)initWithStatusItemsManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STStatusItemsStatusDomainVisualDescriptorTransformer;
  v6 = [(STStatusItemsStatusDomainVisualDescriptorTransformer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_statusItemsManager, a3);
  }

  return v7;
}

- (id)transformedDataForData:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v4;
  v7 = v6;
  v8 = v6;
  if (isKindOfClass)
  {
    v8 = (void *)[v6 mutableCopy];
    v36 = self;
    statusItemsManager = self->_statusItemsManager;
    v10 = [v7 activeStatusItems];
    v11 = [(STStatusItemsManager *)statusItemsManager validStatusItemsForStatusItems:v10];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v12 = [v7 attributions];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v46 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v18 = [v17 statusItemIdentifier];
          char v19 = [v11 containsObject:v18];

          if ((v19 & 1) == 0) {
            [v8 removeAttribution:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v51 count:16];
      }
      while (v14);
    }

    v20 = [v8 activeStatusItems];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v42 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v41 + 1) + 8 * j);
          v26 = [v7 visualDescriptorForStatusItemWithIdentifier:v25];

          if (!v26)
          {
            v27 = [(STStatusItemsManager *)v36->_statusItemsManager visualDescriptorForStatusItemWithIdentifier:v25];
            [v8 setVisualDescriptor:v27 forStatusItemWithIdentifier:v25];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v22);
    }
    v28 = [v7 statusItemsWithVisualDescriptors];
    v29 = (void *)[v28 mutableCopy];

    [v29 minusSet:v20];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v30 = v29;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v37 objects:v49 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v38;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v38 != v33) {
            objc_enumerationMutation(v30);
          }
          [v8 setVisualDescriptor:0 forStatusItemWithIdentifier:*(void *)(*((void *)&v37 + 1) + 8 * k)];
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v37 objects:v49 count:16];
      }
      while (v32);
    }
  }
  return v8;
}

- (void).cxx_destruct
{
}

@end