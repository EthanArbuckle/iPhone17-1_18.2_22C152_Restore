@interface __UIDebugLogRootNode
- (BOOL)_isTransparent;
- (id)attributedDescription;
- (id)description;
@end

@implementation __UIDebugLogRootNode

- (BOOL)_isTransparent
{
  return 1;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->super._childMessages;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "description", (void)v13);
        [v3 appendString:v10];

        v11 = [(NSMutableArray *)self->super._childMessages lastObject];

        if (v9 != v11) {
          [v3 appendString:@"\n"];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)attributedDescription
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->super._childMessages;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "attributedDescription", (void)v14);
        [v3 appendAttributedString:v10];

        v11 = [(NSMutableArray *)self->super._childMessages lastObject];

        if (v9 != v11)
        {
          v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
          [v3 appendAttributedString:v12];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

@end