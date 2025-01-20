@interface SVXServiceCommandHandlerRegistry
- (SVXServiceCommandHandlerRegistry)initWithHandlers:(id)a3;
- (id)handlersForCommand:(id)a3;
@end

@implementation SVXServiceCommandHandlerRegistry

- (void).cxx_destruct
{
}

- (id)handlersForCommand:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = objc_opt_class();
  if (v6)
  {
    v7 = (objc_class *)v6;
    while (1)
    {
      handlersByServiceCommandClassName = self->_handlersByServiceCommandClassName;
      v9 = NSStringFromClass(v7);
      v10 = [(NSDictionary *)handlersByServiceCommandClassName objectForKey:v9];

      if ([v10 count]) {
        [v5 addObjectsFromArray:v10];
      }
      if (v7 == (objc_class *)objc_opt_class()) {
        break;
      }
      v7 = (objc_class *)[(objc_class *)v7 superclass];

      if (!v7) {
        goto LABEL_9;
      }
    }
  }
LABEL_9:
  v11 = (void *)[v5 copy];

  return v11;
}

- (SVXServiceCommandHandlerRegistry)initWithHandlers:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SVXServiceCommandHandlerRegistry;
  id v5 = [(SVXServiceCommandHandlerRegistry *)&v36 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v27 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          v13 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
          v14 = NSStringFromClass(v13);
          id v15 = [v6 objectForKey:v14];
          if (!v15)
          {
            id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
            [v6 setObject:v15 forKey:v14];
          }
          [v15 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v9);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v16 = [v6 allKeys];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * j);
          v22 = [v6 objectForKey:v21];
          v23 = (void *)[v22 copy];
          [v6 setObject:v23 forKey:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v18);
    }

    uint64_t v24 = [v6 copy];
    handlersByServiceCommandClassName = v5->_handlersByServiceCommandClassName;
    v5->_handlersByServiceCommandClassName = (NSDictionary *)v24;

    id v4 = v27;
  }

  return v5;
}

@end