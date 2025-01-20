@interface SUUITabularLockupLayout
+ (id)fontForLabelViewElement:(id)a3 context:(id)a4;
- (NSArray)columns;
- (SUUITabularLockupLayout)initWithLockup:(id)a3 context:(id)a4;
- (void)sizeColumnsToFitWidth:(double)a3 context:(id)a4;
@end

@implementation SUUITabularLockupLayout

- (SUUITabularLockupLayout)initWithLockup:(id)a3 context:(id)a4
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUITabularLockupLayout;
  v6 = [(SUUITabularLockupLayout *)&v15 init];
  if (v6)
  {
    v7 = [[SUUITabularLockupColumn alloc] initWithColumnIdentifier:0];
    v8 = [[SUUITabularLockupColumn alloc] initWithColumnIdentifier:1];
    v9 = [[SUUITabularLockupColumn alloc] initWithColumnIdentifier:2];
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v7, v8, v9, 0);
    columns = v6->_columns;
    v6->_columns = (NSArray *)v10;

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __50__SUUITabularLockupLayout_initWithLockup_context___block_invoke;
    v13[3] = &unk_2654008B8;
    v14 = v6;
    [v5 enumerateChildrenUsingBlock:v13];
  }
  return v6;
}

void __50__SUUITabularLockupLayout_initWithLockup_context___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 style];
  uint64_t v4 = SUUIViewElementAlignmentForStyle(v3);
  if ([v7 elementType] == 138)
  {
    if (v4 == 3) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = v4 == 2;
    }
    v6 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndex:v5];
    [v6 _addChildViewElement:v7];
  }
}

+ (id)fontForLabelViewElement:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 style];
  v8 = SUUIViewElementFontWithStyle(v7);

  if (!v8)
  {
    unint64_t v9 = [v5 labelViewStyle];
    if (v9 > 5)
    {
      v8 = 0;
    }
    else
    {
      if (((1 << v9) & 0x1B) != 0)
      {
        if ([v6 containerViewElementType] == 118) {
          uint64_t v10 = 8;
        }
        else {
          uint64_t v10 = 7;
        }
      }
      else if ([v6 containerViewElementType] == 118)
      {
        uint64_t v10 = 6;
      }
      else
      {
        uint64_t v10 = 19;
      }
      v8 = SUUIFontLimitedPreferredFontForTextStyle(v10, 5);
    }
  }

  return v8;
}

- (void)sizeColumnsToFitWidth:(double)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = self->_columns;
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
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "childViewElements", (void)v15);
        v14 = [v13 firstObject];

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

@end