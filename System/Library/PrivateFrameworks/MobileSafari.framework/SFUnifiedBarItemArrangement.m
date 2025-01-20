@interface SFUnifiedBarItemArrangement
- (BOOL)allowsCenteringInlineContentView;
- (BOOL)isEqual:(id)a3;
- (NSArray)leadingItems;
- (NSArray)trailingItems;
- (SFUnifiedBarItemArrangement)init;
- (SFUnifiedBarItemArrangement)initWithLeadingItems:(id)a3 trailingItems:(id)a4;
- (void)enumerateAllItemsUsingBlock:(id)a3;
@end

@implementation SFUnifiedBarItemArrangement

- (SFUnifiedBarItemArrangement)init
{
  return [(SFUnifiedBarItemArrangement *)self initWithLeadingItems:MEMORY[0x1E4F1CBF0] trailingItems:MEMORY[0x1E4F1CBF0]];
}

- (SFUnifiedBarItemArrangement)initWithLeadingItems:(id)a3 trailingItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFUnifiedBarItemArrangement;
  v8 = [(SFUnifiedBarItemArrangement *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    leadingItems = v8->_leadingItems;
    v8->_leadingItems = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    trailingItems = v8->_trailingItems;
    v8->_trailingItems = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFUnifiedBarItemArrangement *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(NSArray *)self->_leadingItems isEqualToArray:v5->_leadingItems]) {
        BOOL v6 = [(NSArray *)self->_trailingItems isEqualToArray:v5->_trailingItems];
      }
      else {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)enumerateAllItemsUsingBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = self->_leadingItems;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v19 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_trailingItems;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (BOOL)allowsCenteringInlineContentView
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__SFUnifiedBarItemArrangement_allowsCenteringInlineContentView__block_invoke;
  v4[3] = &unk_1E54ECD10;
  v4[4] = &v5;
  [(SFUnifiedBarItemArrangement *)self enumerateAllItemsUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __63__SFUnifiedBarItemArrangement_allowsCenteringInlineContentView__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 spacingOptions];
  if ((result & 8) != 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

- (NSArray)leadingItems
{
  return self->_leadingItems;
}

- (NSArray)trailingItems
{
  return self->_trailingItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingItems, 0);

  objc_storeStrong((id *)&self->_leadingItems, 0);
}

@end