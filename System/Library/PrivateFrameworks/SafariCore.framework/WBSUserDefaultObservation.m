@interface WBSUserDefaultObservation
- (WBSUserDefaultObservation)initWithUserDefaults:(id)a3 keys:(id)a4 queue:(id)a5 notifyForInitialValue:(BOOL)a6 handler:(id)a7;
- (void)dealloc;
- (void)invalidate;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation WBSUserDefaultObservation

- (WBSUserDefaultObservation)initWithUserDefaults:(id)a3 keys:(id)a4 queue:(id)a5 notifyForInitialValue:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v36.receiver = self;
  v36.super_class = (Class)WBSUserDefaultObservation;
  v17 = [(WBSUserDefaultObservation *)&v36 init];
  v18 = v17;
  if (v17)
  {
    id v31 = v15;
    objc_storeStrong((id *)&v17->_defaults, a3);
    uint64_t v19 = [v16 copy];
    id handler = v18->_handler;
    v18->_id handler = (id)v19;

    uint64_t v21 = [v14 copy];
    keys = v18->_keys;
    v18->_keys = (NSArray *)v21;

    objc_storeStrong((id *)&v18->_queue, a5);
    long long v34 = 0u;
    long long v35 = 0u;
    if (v8) {
      uint64_t v23 = 7;
    }
    else {
      uint64_t v23 = 3;
    }
    long long v32 = 0uLL;
    long long v33 = 0uLL;
    id v24 = v14;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(v24);
          }
          [v13 addObserver:v18 forKeyPath:*(void *)(*((void *)&v32 + 1) + 8 * i) options:v23 context:kvoContext];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v26);
    }

    v29 = v18;
    id v15 = v31;
  }

  return v18;
}

uint64_t __76__WBSUserDefaultObservation_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if ((void *)kvoContext == a6)
  {
    uint64_t v12 = *MEMORY[0x1E4F284E0];
    id v13 = a5;
    uint64_t v11 = [v13 objectForKeyedSubscript:v12];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];

    if (v11 | v14 && ([(id)v11 isEqual:v14] & 1) == 0)
    {
      queue = self->_queue;
      if (queue)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __76__WBSUserDefaultObservation_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v16[3] = &unk_1E615A6C8;
        v16[4] = self;
        id v17 = v10;
        dispatch_async(queue, v16);
      }
      else
      {
        (*((void (**)(void))self->_handler + 2))();
      }
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)WBSUserDefaultObservation;
    uint64_t v11 = (uint64_t)a5;
    [(WBSUserDefaultObservation *)&v18 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
  }
}

- (void)dealloc
{
  [(WBSUserDefaultObservation *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WBSUserDefaultObservation;
  [(WBSUserDefaultObservation *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_handler)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    objc_super v3 = self->_keys;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          -[NSUserDefaults removeObserver:forKeyPath:context:](self->_defaults, "removeObserver:forKeyPath:context:", self, *(void *)(*((void *)&v9 + 1) + 8 * v7++), kvoContext, (void)v9);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    id handler = self->_handler;
    self->_id handler = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end