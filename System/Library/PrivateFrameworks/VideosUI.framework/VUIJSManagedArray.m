@interface VUIJSManagedArray
- (NSArray)managedArray;
- (VUIJSManagedArray)initWithArray:(id)a3 ownerObject:(id)a4;
- (id)jsValuesWithContext:(id)a3;
- (id)ownerObject;
- (void)dealloc;
- (void)setManagedArray:(id)a3;
- (void)setOwnerObject:(id)a3;
@end

@implementation VUIJSManagedArray

- (VUIJSManagedArray)initWithArray:(id)a3 ownerObject:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)VUIJSManagedArray;
  v8 = [(VUIJSManagedArray *)&v29 init];
  v9 = v8;
  if (v8)
  {
    v23 = v8;
    id v24 = v7;
    p_ownerObject = &v8->_ownerObject;
    objc_storeStrong(&v8->_ownerObject, a4);
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if ([v17 isObject])
          {
            v18 = [MEMORY[0x1E4F30928] managedValueWithValue:v17];
            v19 = [v17 context];
            v20 = [v19 virtualMachine];
            [v20 addManagedReference:v18 withOwner:*p_ownerObject];
          }
          else
          {
            v18 = [v17 toObject];
          }
          [(NSArray *)v11 addObject:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v14);
    }

    v9 = v23;
    managedArray = v23->_managedArray;
    v23->_managedArray = v11;

    id v7 = v24;
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(VUIJSManagedArray *)self managedArray];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v8 = [v7 value];
          v9 = [v8 context];
          v10 = [v9 virtualMachine];
          v11 = [(VUIJSManagedArray *)self ownerObject];
          [v10 removeManagedReference:v7 withOwner:v11];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  [(VUIJSManagedArray *)self setManagedArray:0];
  v13.receiver = self;
  v13.super_class = (Class)VUIJSManagedArray;
  [(VUIJSManagedArray *)&v13 dealloc];
}

- (id)jsValuesWithContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v6 = [(VUIJSManagedArray *)self managedArray];
  id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v8 = [(VUIJSManagedArray *)self managedArray];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v13 value];
        }
        else {
        long long v14 = [MEMORY[0x1E4F30938] valueWithObject:v13 inContext:v4];
        }
        [v7 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)ownerObject
{
  return self->_ownerObject;
}

- (void)setOwnerObject:(id)a3
{
}

- (NSArray)managedArray
{
  return self->_managedArray;
}

- (void)setManagedArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedArray, 0);
  objc_storeStrong(&self->_ownerObject, 0);
}

@end