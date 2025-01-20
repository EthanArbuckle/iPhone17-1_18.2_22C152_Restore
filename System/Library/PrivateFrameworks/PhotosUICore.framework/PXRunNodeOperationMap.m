@interface PXRunNodeOperationMap
- (PXRunNodeOperationMap)init;
- (id)operationForRunNode:(id)a3;
@end

@implementation PXRunNodeOperationMap

- (void).cxx_destruct
{
}

- (id)operationForRunNode:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(NSMapTable *)self->_operationMap objectForKey:v5];
  if (!v6)
  {
    v6 = (void *)[v5 newOperation];
    if (!v6)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"PXNodeRunner.m", 117, @"Attempt to process run node that's already being processed: %@", v5 object file lineNumber description];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v7 = [v5 dependencies];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [(PXRunNodeOperationMap *)self operationForRunNode:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          [v6 addDependency:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [(NSMapTable *)self->_operationMap setObject:v6 forKey:v5];
  }

  return v6;
}

- (PXRunNodeOperationMap)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXRunNodeOperationMap;
  v2 = [(PXRunNodeOperationMap *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    operationMap = v2->_operationMap;
    v2->_operationMap = (NSMapTable *)v3;
  }
  return v2;
}

@end