@interface RUIFrontRowStyle
- (RUIFrontRowStyle)init;
- (int64_t)tableViewStyle;
- (void)applyToObjectModel:(id)a3;
@end

@implementation RUIFrontRowStyle

- (RUIFrontRowStyle)init
{
  v7.receiver = self;
  v7.super_class = (Class)RUIFrontRowStyle;
  v2 = [(RUIStyle *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F825C8] labelColor];
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(RUIStyle *)v2 setBackgroundColor:v4];

    [(RUIStyle *)v2 setRadioGroupSelectedColor:v3];
    [(RUIStyle *)v2 setSelectPageDetailTextColor:v3];
    [(RUIStyle *)v2 setButtonRowTextColor:v3];
    [(RUIStyle *)v2 setLabelRowTextColor:v3];
    v5 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_284];
    [(RUIStyle *)v2 setFocusedRowTextColor:v5];

    [(RUIStyle *)v2 setLabelRowTextAlignment:1];
    [(RUIStyle *)v2 setFooterLabelAlignment:1];
    [(RUIStyle *)v2 setTitleLabelTextColor:v3];
    [(RUIStyle *)v2 setFooterLabelTextColor:v3];
    [(RUIStyle *)v2 setHeaderLabelAlignment:1];
    [(RUIStyle *)v2 setHeaderLabelTextColor:v3];
  }
  return v2;
}

id __24__RUIFrontRowStyle_init__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] blackColor];
  }
  else {
  v2 = [MEMORY[0x263F825C8] labelColor];
  }
  return v2;
}

- (int64_t)tableViewStyle
{
  return 1;
}

- (void)applyToObjectModel:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RUIFrontRowStyle;
  [(RUIStyle *)&v15 applyToObjectModel:v4];
  v5 = [v4 allPages];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 setShowsTitlesAsHeaderViews:1];
        [v10 setCustomMargin:550.0];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

@end