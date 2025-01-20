@interface RUIDefaultStyle
- (void)applyToObjectModel:(id)a3;
@end

@implementation RUIDefaultStyle

- (void)applyToObjectModel:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v4 = [a3 allPages];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
        v10 = [(RUIStyle *)self backgroundColor];
        v11 = [v9 view];
        [v11 setBackgroundColor:v10];

        if ([v9 hasTableView])
        {
          v12 = [v9 tableViewOM];
          v13 = [v12 tableView];
          v14 = [MEMORY[0x263F825C8] tableBackgroundColor];
          [v13 setBackgroundColor:v14];

          [v13 setBackgroundView:0];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

@end