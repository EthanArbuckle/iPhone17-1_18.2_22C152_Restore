@interface WTUIAttributedStringController
- (NSMutableDictionary)contextsToDigests;
- (WTUIAttributedStringController)initWithContexts:(id)a3;
- (id)digestedAttributedStringForContext:(id)a3;
- (id)reconstitutedAttributedStringForContext:(id)a3 digestedAttributedString:(id)a4;
- (id)reconstitutedAttributedStringForStitchedContext:(id)a3;
- (void)setContextsToDigests:(id)a3;
@end

@implementation WTUIAttributedStringController

- (WTUIAttributedStringController)initWithContexts:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WTUIAttributedStringController;
  v5 = [(WTUIAttributedStringController *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    contextsToDigests = v5->_contextsToDigests;
    v5->_contextsToDigests = (NSMutableDictionary *)v6;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v4;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
          id v14 = objc_alloc(MEMORY[0x263F7E3D8]);
          v15 = [v13 attributedText];
          v16 = [v13 attributedText];
          v17 = objc_msgSend(v14, "initWithAttributedString:range:", v15, 0, objc_msgSend(v16, "length"));

          v18 = v5->_contextsToDigests;
          v19 = [v13 uuid];
          [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:v19];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v10);
    }

    id v4 = v21;
  }

  return v5;
}

- (id)digestedAttributedStringForContext:(id)a3
{
  id v4 = a3;
  v5 = [(WTUIAttributedStringController *)self contextsToDigests];
  uint64_t v6 = [v4 uuid];

  v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [v7 digestedAttributedString];

  return v8;
}

- (id)reconstitutedAttributedStringForContext:(id)a3 digestedAttributedString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(WTUIAttributedStringController *)self contextsToDigests];
  uint64_t v9 = [v7 uuid];

  uint64_t v10 = [v8 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 reconstituteAttributedString:v6];

  return v11;
}

- (id)reconstitutedAttributedStringForStitchedContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(WTUIAttributedStringController *)self contextsToDigests];
  id v6 = [v5 allValues];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  id v8 = v4;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v15;
    id v8 = v4;
    do
    {
      uint64_t v11 = 0;
      uint64_t v12 = v8;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        id v8 = [*(id *)(*((void *)&v14 + 1) + 8 * v11) reconstituteAttributedString:v12];

        ++v11;
        uint64_t v12 = v8;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v8;
}

- (NSMutableDictionary)contextsToDigests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContextsToDigests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end