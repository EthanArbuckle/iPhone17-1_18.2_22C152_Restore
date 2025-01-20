@interface SUPurchaseBatch
- (NSArray)continuations;
- (NSArray)errors;
- (NSArray)items;
- (NSArray)offers;
- (NSArray)validPurchases;
- (SUPurchaseBatch)initWithItems:(id)a3;
- (SUPurchaseBatch)initWithItems:(id)a3 offers:(id)a4;
- (SUPurchaseManager)purchaseManager;
- (id)_copyModifiedErrorsFromDictionary:(__CFDictionary *)a3;
- (id)_copyUniqueErrorsFromErrors:(id)a3;
- (id)_copyValidPurchasesForItems:(id)a3;
- (id)copyContinuationsForPurchases:(id)a3;
- (id)everythingFailedErrorForError:(id)a3;
- (id)mergedErrorForError:(id)a3 withCount:(int64_t)a4;
- (void)_validateItems;
- (void)dealloc;
- (void)errorEqualCallback;
- (void)setContinuations:(id)a3;
- (void)setDocumentTargetIdentifier:(id)a3;
- (void)setErrors:(id)a3;
- (void)setPurchaseManager:(id)a3;
- (void)setPurchasesAndContinuationsFromPurchases:(id)a3;
- (void)setValidPurchases:(id)a3;
@end

@implementation SUPurchaseBatch

- (SUPurchaseBatch)initWithItems:(id)a3
{
  return [(SUPurchaseBatch *)self initWithItems:a3 offers:0];
}

- (SUPurchaseBatch)initWithItems:(id)a3 offers:(id)a4
{
  v6 = [(SUPurchaseBatch *)self init];
  if (v6)
  {
    v6->_items = (NSArray *)[a3 copy];
    v6->_offers = (NSArray *)[a4 copy];
    [(SUPurchaseBatch *)v6 _validateItems];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUPurchaseBatch;
  [(SUPurchaseBatch *)&v3 dealloc];
}

- (void)setDocumentTargetIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = [(SUPurchaseBatch *)self validPurchases];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    uint64_t v8 = *MEMORY[0x263F7B620];
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v10 setValue:a3 forDownloadProperty:v8];
        }
        else {
          [v10 setValue:a3 forProperty:v8];
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)setPurchasesAndContinuationsFromPurchases:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (void *)[a3 mutableCopy];
  id v5 = [(SUPurchaseBatch *)self copyContinuationsForPurchases:v4];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) purchase];
        if (v10) {
          [v4 removeObject:v10];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(SUPurchaseBatch *)self setContinuations:v5];
  [(SUPurchaseBatch *)self setValidPurchases:v4];
}

- (id)copyContinuationsForPurchases:(id)a3
{
  return 0;
}

- (void)errorEqualCallback
{
  return __SUPurchaseBatchErrorEqual;
}

- (id)everythingFailedErrorForError:(id)a3
{
  return a3;
}

- (id)mergedErrorForError:(id)a3 withCount:(int64_t)a4
{
  return a3;
}

- (id)_copyModifiedErrorsFromDictionary:(__CFDictionary *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v7[0] = v5;
  v7[1] = self;
  CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)__SUPurchaseBatchAddModifiedError, v7);
  return v5;
}

- (id)_copyUniqueErrorsFromErrors:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v5 = *(_OWORD *)(MEMORY[0x263EFFF88] + 16);
  *(_OWORD *)&keyCallBacks.version = *MEMORY[0x263EFFF88];
  *(_OWORD *)&keyCallBacks.release = v5;
  keyCallBacks.hash = (CFDictionaryHashCallBack)__SUPurchaseBatchErrorHash;
  keyCallBacks.equal = (CFDictionaryEqualCallBack)[(SUPurchaseBatch *)self errorEqualCallback];
  CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(0, 0, &keyCallBacks, 0);
  if (!v6) {
    return 0;
  }
  CFDictionaryRef v7 = v6;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(a3);
        }
        long long v12 = *(const void **)(*((void *)&v16 + 1) + 8 * i);
        Value = (char *)CFDictionaryGetValue(v7, v12);
        CFDictionarySetValue(v7, v12, Value + 1);
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }
  id v14 = [(SUPurchaseBatch *)self _copyModifiedErrorsFromDictionary:v7];
  CFRelease(v7);
  return v14;
}

- (id)_copyValidPurchasesForItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = +[SUItemDataSource sharedDataSource];
  uint64_t v7 = [(NSArray *)self->_offers count];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v13 = (id)[v12 defaultStoreOffer];
        if (v7 >= 1)
        {
          int64_t v14 = [(NSArray *)self->_items indexOfObjectIdenticalTo:v12];
          if (v14 < v7) {
            id v13 = [(NSArray *)self->_offers objectAtIndex:v14];
          }
        }
        v15 = (void *)[v6 newExternalDownloadWithItem:v12 storeOffer:v13];
        if (v15 || (v15 = (void *)[v6 newPurchaseWithItem:v12 storeOffer:v13]) != 0) {
          [v5 addObject:v15];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
  return v5;
}

- (void)_validateItems
{
  id v4 = [(SUPurchaseBatch *)self copyFilteredItemsFromItems:self->_items];
  id v3 = [(SUPurchaseBatch *)self _copyValidPurchasesForItems:v4];
  [(SUPurchaseBatch *)self setPurchasesAndContinuationsFromPurchases:v3];
}

- (NSArray)continuations
{
  return self->_continuations;
}

- (void)setContinuations:(id)a3
{
}

- (NSArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)offers
{
  return self->_offers;
}

- (SUPurchaseManager)purchaseManager
{
  return self->_purchaseManager;
}

- (void)setPurchaseManager:(id)a3
{
  self->_purchaseManager = (SUPurchaseManager *)a3;
}

- (NSArray)validPurchases
{
  return self->_validPurchases;
}

- (void)setValidPurchases:(id)a3
{
}

@end