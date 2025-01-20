@interface SCROEvent
+ (id)brailleEvent;
- (id)claimDictionary;
- (id)claimValueForKey:(int)a3;
- (id)initForHandlerType:(int)a3;
- (id)mainDictionary;
- (int)handlerType;
- (void)performWithHandler:(id)a3 trusted:(BOOL)a4;
- (void)requestPerformActionForKey:(int)a3;
- (void)requestRegisterCallbackForKey:(int)a3;
- (void)requestSetValue:(id)a3 forKey:(int)a4;
- (void)requestValueForKey:(int)a3;
- (void)setClaimDictionary:(id)a3;
- (void)setMainDictionary:(id)a3;
@end

@implementation SCROEvent

+ (id)brailleEvent
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initForHandlerType:1];

  return v2;
}

- (id)initForHandlerType:(int)a3
{
  id result = [(SCROEvent *)self init];
  if (result) {
    *((_DWORD *)result + 2) = a3;
  }
  return result;
}

- (int)handlerType
{
  return self->_handlerType;
}

- (void)requestRegisterCallbackForKey:(int)a3
{
  if (self->_readOnly)
  {
    v3 = (void *)MEMORY[0x263EFF940];
    [v3 raise:@"SCROEventException" format:@"Error trying to register callbacks in a readonly SCROEvent"];
  }
  else
  {
    uint64_t v4 = *(void *)&a3;
    callbacks = self->_callbacks;
    if (!callbacks)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v8 = self->_callbacks;
      self->_callbacks = v7;

      callbacks = self->_callbacks;
    }
    id v9 = [NSNumber numberWithInt:v4];
    [(NSMutableArray *)callbacks addObject:v9];
  }
}

- (void)requestSetValue:(id)a3 forKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v13 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v13 copy];

    id v13 = (id)v6;
  }
  if (self->_readOnly)
  {
    [MEMORY[0x263EFF940] raise:@"SCROEventException" format:@"Error trying to request values to be set in a readonly SCROEvent"];
LABEL_5:
    v7 = v13;
    goto LABEL_11;
  }
  setDictionary = self->_setDictionary;
  if (!setDictionary)
  {
    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v10 = self->_setDictionary;
    self->_setDictionary = v9;

    setDictionary = self->_setDictionary;
  }
  v11 = v13;
  if (!v13)
  {
    v11 = [MEMORY[0x263EFF9D0] null];
  }
  v12 = [NSNumber numberWithInt:v4];
  [(NSMutableDictionary *)setDictionary setObject:v11 forKey:v12];

  v7 = v13;
  if (!v13)
  {

    goto LABEL_5;
  }
LABEL_11:
}

- (void)requestValueForKey:(int)a3
{
  if (self->_readOnly)
  {
    v3 = (void *)MEMORY[0x263EFF940];
    [v3 raise:@"SCROEventException" format:@"Error trying to request values in a readonly SCROEvent"];
  }
  else
  {
    uint64_t v4 = *(void *)&a3;
    getDictionary = self->_getDictionary;
    if (!getDictionary)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v8 = self->_getDictionary;
      self->_getDictionary = v7;

      getDictionary = self->_getDictionary;
    }
    id v10 = [MEMORY[0x263EFF9D0] null];
    id v9 = [NSNumber numberWithInt:v4];
    [(NSMutableDictionary *)getDictionary setObject:v10 forKey:v9];
  }
}

- (void)requestPerformActionForKey:(int)a3
{
  if (self->_readOnly)
  {
    v3 = (void *)MEMORY[0x263EFF940];
    [v3 raise:@"SCROEventException" format:@"Error trying to request perform action in a readonly SCROEvent"];
  }
  else
  {
    uint64_t v4 = *(void *)&a3;
    actions = self->_actions;
    if (!actions)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v8 = self->_actions;
      self->_actions = v7;

      actions = self->_actions;
    }
    id v9 = [NSNumber numberWithInt:v4];
    [(NSMutableArray *)actions addObject:v9];
  }
}

- (id)claimValueForKey:(int)a3
{
  getDictionary = self->_getDictionary;
  uint64_t v4 = [NSNumber numberWithInt:*(void *)&a3];
  v5 = [(NSMutableDictionary *)getDictionary objectForKey:v4];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9D0] null];
    if (v5 == v6) {
      v7 = 0;
    }
    else {
      v7 = v5;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)setMainDictionary:(id)a3
{
  id v4 = a3;
  self->_readOnly = 1;
  id v9 = v4;
  v5 = [v4 objectForKey:&unk_26CCF1168];
  if (v5) {
    objc_storeStrong((id *)&self->_callbacks, v5);
  }
  uint64_t v6 = [v9 objectForKey:&unk_26CCF1180];

  if (v6) {
    objc_storeStrong((id *)&self->_setDictionary, v6);
  }
  v7 = [v9 objectForKey:&unk_26CCF1198];

  if (v7) {
    objc_storeStrong((id *)&self->_getDictionary, v7);
  }
  id v8 = [v9 objectForKey:&unk_26CCF11B0];

  if (v8) {
    objc_storeStrong((id *)&self->_actions, v8);
  }
}

- (id)mainDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  callbacks = self->_callbacks;
  if (callbacks) {
    [v3 setObject:callbacks forKey:&unk_26CCF1168];
  }
  setDictionary = self->_setDictionary;
  if (setDictionary) {
    [v4 setObject:setDictionary forKey:&unk_26CCF1180];
  }
  getDictionary = self->_getDictionary;
  if (getDictionary) {
    [v4 setObject:getDictionary forKey:&unk_26CCF1198];
  }
  actions = self->_actions;
  if (actions) {
    [v4 setObject:actions forKey:&unk_26CCF11B0];
  }

  return v4;
}

- (void)setClaimDictionary:(id)a3
{
  self->_readOnly = 1;
  objc_storeStrong((id *)&self->_getDictionary, a3);
}

- (id)claimDictionary
{
  return self->_getDictionary;
}

- (void)performWithHandler:(id)a3 trusted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [v6 handlePerformActionForKey:1 trusted:v4];
  v41 = self;
  callbacks = self->_callbacks;
  if (callbacks)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v8 = callbacks;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v55 objects:v62 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v56 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v6, "handleRegisterCallbackForKey:trusted:", objc_msgSend(*(id *)(*((void *)&v55 + 1) + 8 * i), "intValue"), v4);
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v55 objects:v62 count:16];
      }
      while (v10);
    }
  }
  setDictionary = v41->_setDictionary;
  if (setDictionary)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = setDictionary;
    uint64_t v14 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v51 objects:v61 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v52;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v52 != v16) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          v19 = [(NSMutableDictionary *)v41->_setDictionary objectForKey:v18];
          v20 = [MEMORY[0x263EFF9D0] null];
          if (v19 == v20) {
            v21 = 0;
          }
          else {
            v21 = v19;
          }
          objc_msgSend(v6, "handleSetValue:forKey:trusted:", v21, objc_msgSend(v18, "intValue"), v4);
        }
        uint64_t v15 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      }
      while (v15);
    }
  }
  getDictionary = v41->_getDictionary;
  if (getDictionary)
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v23 = getDictionary;
    uint64_t v24 = [(NSMutableDictionary *)v23 countByEnumeratingWithState:&v47 objects:v60 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v48;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v48 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v47 + 1) + 8 * k);
          id v46 = 0;
          int v29 = objc_msgSend(v6, "handleGetValue:forKey:trusted:", &v46, objc_msgSend(v28, "intValue"), v4);
          id v30 = v46;
          v31 = v30;
          if (!v29)
          {
            v32 = v41->_getDictionary;
            if (v30)
            {
              [(NSMutableDictionary *)v41->_getDictionary setObject:v30 forKey:v28];
            }
            else
            {
              v33 = [MEMORY[0x263EFF9D0] null];
              [(NSMutableDictionary *)v32 setObject:v33 forKey:v28];
            }
          }
        }
        uint64_t v25 = [(NSMutableDictionary *)v23 countByEnumeratingWithState:&v47 objects:v60 count:16];
      }
      while (v25);
    }
  }
  actions = v41->_actions;
  if (actions)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v35 = actions;
    uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v59 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v43;
      do
      {
        for (uint64_t m = 0; m != v37; ++m)
        {
          if (*(void *)v43 != v38) {
            objc_enumerationMutation(v35);
          }
          objc_msgSend(v6, "handlePerformActionForKey:trusted:", objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * m), "intValue"), v4);
        }
        uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v59 count:16];
      }
      while (v37);
    }
  }
  [v6 handlePerformActionForKey:2 trusted:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_getDictionary, 0);
  objc_storeStrong((id *)&self->_setDictionary, 0);

  objc_storeStrong((id *)&self->_callbacks, 0);
}

@end