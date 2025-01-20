@interface SKUITabularLockupLayout
+ (id)fontForLabelViewElement:(id)a3 context:(id)a4;
- (NSArray)columns;
- (SKUITabularLockupLayout)initWithLockup:(id)a3 context:(id)a4;
- (void)sizeColumnsToFitWidth:(double)a3 context:(id)a4;
@end

@implementation SKUITabularLockupLayout

- (SKUITabularLockupLayout)initWithLockup:(id)a3 context:(id)a4
{
  id v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v6 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v6) {
        -[SKUITabularLockupLayout initWithLockup:context:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUITabularLockupLayout;
  v14 = [(SKUITabularLockupLayout *)&v23 init];
  if (v14)
  {
    v15 = [[SKUITabularLockupColumn alloc] initWithColumnIdentifier:0];
    v16 = [[SKUITabularLockupColumn alloc] initWithColumnIdentifier:1];
    v17 = [[SKUITabularLockupColumn alloc] initWithColumnIdentifier:2];
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v15, v16, v17, 0);
    columns = v14->_columns;
    v14->_columns = (NSArray *)v18;

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __50__SKUITabularLockupLayout_initWithLockup_context___block_invoke;
    v21[3] = &unk_1E6423570;
    v22 = v14;
    [v5 enumerateChildrenUsingBlock:v21];
  }
  return v14;
}

void __50__SKUITabularLockupLayout_initWithLockup_context___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 style];
  uint64_t v4 = SKUIViewElementAlignmentForStyle(v3);
  if ([v7 elementType] == 138)
  {
    if (v4 == 3) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = v4 == 2;
    }
    BOOL v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:v5];
    [v6 _addChildViewElement:v7];
  }
}

+ (id)fontForLabelViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        +[SKUITabularLockupLayout fontForLabelViewElement:context:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v15 = [v5 style];
  v16 = SKUIViewElementFontWithStyle(v15);

  if (!v16)
  {
    unint64_t v17 = [v5 labelViewStyle];
    if (v17 > 5)
    {
      v16 = 0;
    }
    else
    {
      if (((1 << v17) & 0x1B) != 0)
      {
        if ([v6 containerViewElementType] == 118) {
          uint64_t v18 = 8;
        }
        else {
          uint64_t v18 = 7;
        }
      }
      else if ([v6 containerViewElementType] == 118)
      {
        uint64_t v18 = 6;
      }
      else
      {
        uint64_t v18 = 19;
      }
      v16 = SKUIFontLimitedPreferredFontForTextStyle(v18, 5);
    }
  }

  return v16;
}

- (void)sizeColumnsToFitWidth:(double)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v7 = self->_columns;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "childViewElements", (void)v15);
        uint64_t v14 = [v13 firstObject];

        [v6 sizeForViewElement:v14 width:a3];
        objc_msgSend(v12, "setSize:");
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (NSArray)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
}

- (void)initWithLockup:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)fontForLabelViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end