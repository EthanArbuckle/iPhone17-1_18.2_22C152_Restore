@interface EDWarnings
- (void)addWarning:(id)a3;
- (void)reportWarningsWithAssociatedObject:(id)a3;
@end

@implementation EDWarnings

- (void)addWarning:(id)a3
{
  id v4 = a3;
  mWarnings = self->mWarnings;
  id v8 = v4;
  if (!mWarnings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->mWarnings;
    self->mWarnings = v6;

    mWarnings = self->mWarnings;
    id v4 = v8;
  }
  [(NSMutableArray *)mWarnings addObject:v4];
}

- (void)reportWarningsWithAssociatedObject:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  mWarnings = self->mWarnings;
  if (mWarnings)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v5 = mWarnings;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          +[TCMessageContext reportWarning:](TCMessageContext, "reportWarning:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [(NSMutableArray *)self->mWarnings removeAllObjects];
  }
}

- (void).cxx_destruct
{
}

@end