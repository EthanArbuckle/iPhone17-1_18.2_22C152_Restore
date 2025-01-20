@interface _UIResponder_Override_Host
+ (id)hostForResponder:(id)a3;
- (UIResponder)owner;
- (_UIResponder_Override_Host)init;
- (id)description;
- (int64_t)typesForResponder:(id)a3;
- (void)attachOverrider:(id)a3 forTypes:(int64_t)a4;
- (void)dealloc;
- (void)detachOverrider:(id)a3 forTypes:(int64_t)a4;
@end

@implementation _UIResponder_Override_Host

+ (id)hostForResponder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  v5 = (void *)v4;
  if (v4) {
    objc_storeWeak((id *)(v4 + 16), v3);
  }

  return v5;
}

- (_UIResponder_Override_Host)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIResponder_Override_Host;
  v2 = [(_UIResponder_Override_Host *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    overrides = v2->_overrides;
    v2->_overrides = (NSMutableArray *)v3;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  uint64_t v4 = [WeakRetained nextResponder];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v14 = self;
  obj = self->_overrides;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "type", v14);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v18 = __37___UIResponder_Override_Host_dealloc__block_invoke;
        v19 = &unk_1E52E6608;
        v20 = v9;
        id v21 = v4;
        uint64_t v11 = 1;
        unint64_t v12 = 3;
        do
        {
          if ((v11 & v10) != 0) {
            v18((uint64_t)v17, v11);
          }
          v11 *= 2;
          BOOL v13 = v12 > 1;
          v12 >>= 1;
        }
        while (v13);
      }
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  v16.receiver = v14;
  v16.super_class = (Class)_UIResponder_Override_Host;
  [(_UIResponder_Override_Host *)&v16 dealloc];
}

- (void)attachOverrider:(id)a3 forTypes:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(_UIResponder_Override_Host *)self owner];

  if (v7 != v6)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    unint64_t v12 = __55___UIResponder_Override_Host_attachOverrider_forTypes___block_invoke;
    BOOL v13 = &unk_1E52E6608;
    v14 = self;
    id v15 = v6;
    unint64_t v8 = 3;
    uint64_t v9 = 1;
    do
    {
      if ((v9 & a4) != 0) {
        v12((uint64_t)v11, v9);
      }
      v9 *= 2;
      BOOL v10 = v8 > 1;
      v8 >>= 1;
    }
    while (v10);
  }
}

- (void)detachOverrider:(id)a3 forTypes:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(_UIResponder_Override_Host *)self owner];

  if (v7 != v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unint64_t v8 = (void *)[(NSMutableArray *)self->_overrides copy];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      int v11 = 0;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v15 = [v14 overridden];
          if (v15 != v6)
          {

LABEL_9:
            ++v11;
            continue;
          }
          uint64_t v16 = [v14 type] & a4;

          if (!v16) {
            goto LABEL_9;
          }
          [(NSMutableArray *)self->_overrides removeObjectAtIndex:v11];
          a4 &= ~[v14 type];
          if (!a4) {
            goto LABEL_14;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
LABEL_14:

    if (![(NSMutableArray *)self->_overrides count])
    {
      v17 = [(_UIResponder_Override_Host *)self owner];
      [v17 _clearOverrideHost];
    }
  }
}

- (int64_t)typesForResponder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self->_overrides;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "overridden", (void)v13);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == a3) {
          v7 |= [v10 type];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_UIResponder_Override_Host;
  uint64_t v4 = [(_UIResponder_Override_Host *)&v8 description];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ owner=%@; overrides=%@>", v4, WeakRetained, self->_overrides];;

  return v6;
}

- (UIResponder)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (UIResponder *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_overrides, 0);
}

@end