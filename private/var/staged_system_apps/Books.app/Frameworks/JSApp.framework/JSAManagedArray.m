@interface JSAManagedArray
- (JSAManagedArray)initWithArray:(id)a3 ownerObject:(id)a4;
- (NSArray)managedArray;
- (id)jsValuesWithContext:(id)a3;
- (id)ownerObject;
- (void)dealloc;
@end

@implementation JSAManagedArray

- (JSAManagedArray)initWithArray:(id)a3 ownerObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)JSAManagedArray;
  v8 = [(JSAManagedArray *)&v31 init];
  v9 = v8;
  if (v8)
  {
    v25 = v8;
    id v26 = v7;
    p_ownerObject = &v8->_ownerObject;
    objc_storeStrong(&v8->_ownerObject, a4);
    +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = v6;
    id v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (!v13) {
      goto LABEL_15;
    }
    id v14 = v13;
    uint64_t v15 = *(void *)v28;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v16);
        objc_opt_class();
        v18 = BUDynamicCast();
        unsigned int v19 = [v18 isObject];

        if (v19)
        {
          v20 = +[JSManagedValue managedValueWithValue:v17 andOwner:*p_ownerObject];
LABEL_10:
          [(NSArray *)v11 addObject:v20];
          goto LABEL_11;
        }
        v20 = [v17 toObject];
        if (v20) {
          goto LABEL_10;
        }
        v21 = +[NSNull null];
        [(NSArray *)v11 addObject:v21];

LABEL_11:
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v22 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
      id v14 = v22;
      if (!v22)
      {
LABEL_15:

        v9 = v25;
        managedArray = v25->_managedArray;
        v25->_managedArray = v11;

        id v7 = v26;
        break;
      }
    }
  }

  return v9;
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = self->_managedArray;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v7);
        objc_opt_class();
        v9 = BUDynamicCast();
        v10 = [v9 value];

        v11 = [v10 context];
        id v12 = [v11 virtualMachine];
        [v12 removeManagedReference:v8 withOwner:self->_ownerObject];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  v13.receiver = self;
  v13.super_class = (Class)JSAManagedArray;
  [(JSAManagedArray *)&v13 dealloc];
}

- (id)jsValuesWithContext:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_managedArray count]];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_managedArray;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v11 value];
        }
        else {
        id v12 = +[JSValue valueWithObject:inContext:](JSValue, "valueWithObject:inContext:", v11, v4, (void)v15);
        }
        if (v12)
        {
          [v5 addObject:v12];
        }
        else
        {
          objc_super v13 = +[NSNull null];
          [v5 addObject:v13];
        }
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)ownerObject
{
  return self->_ownerObject;
}

- (NSArray)managedArray
{
  return self->_managedArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedArray, 0);

  objc_storeStrong(&self->_ownerObject, 0);
}

@end