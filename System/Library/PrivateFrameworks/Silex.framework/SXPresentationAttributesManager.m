@interface SXPresentationAttributesManager
- (NSHashTable)observers;
- (SXPresentationAttributes)presentationAttributes;
- (SXPresentationAttributesManager)init;
- (void)addObserver:(id)a3;
- (void)attributesChangedFrom:(id)a3 to:(id)a4;
- (void)removeObserver:(id)a3;
- (void)updateAttributes:(id)a3;
@end

@implementation SXPresentationAttributesManager

- (SXPresentationAttributesManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SXPresentationAttributesManager;
  v2 = [(SXPresentationAttributesManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:5 capacity:0];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;
  }
  return v2;
}

- (void)attributesChangedFrom:(id)a3 to:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = [(SXPresentationAttributesManager *)self observers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) presentationAttributesDidChangeFrom:v6 toAttributes:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)updateAttributes:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(SXPresentationAttributesManager *)self presentationAttributes];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v4;
      _os_log_impl(&dword_222AC5000, v7, OS_LOG_TYPE_DEFAULT, "Updating presentation attributes: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    v8 = [(SXPresentationAttributesManager *)self presentationAttributes];
    uint64_t v9 = (SXPresentationAttributes *)[v4 copy];
    presentationAttributes = self->_presentationAttributes;
    self->_presentationAttributes = v9;

    uint64_t v11 = [(SXPresentationAttributesManager *)self presentationAttributes];
    [(SXPresentationAttributesManager *)self attributesChangedFrom:v8 to:v11];
  }
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXPresentationAttributesManager *)self observers];
    [v5 addObject:v4];
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(SXPresentationAttributesManager *)self observers];
    [v5 removeObject:v4];
  }
}

- (SXPresentationAttributes)presentationAttributes
{
  return self->_presentationAttributes;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_presentationAttributes, 0);
}

@end