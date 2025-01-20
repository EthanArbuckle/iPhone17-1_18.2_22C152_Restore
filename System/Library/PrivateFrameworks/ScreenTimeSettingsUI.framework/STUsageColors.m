@interface STUsageColors
+ (NSArray)orderedUsageColors;
+ (void)updateVibrancyStylingForView:(id)a3 withUsageColor:(id)a4;
@end

@implementation STUsageColors

+ (NSArray)orderedUsageColors
{
  v7[3] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F825C8] systemBlueColor];
  v3 = objc_msgSend(MEMORY[0x263F825C8], "systemTealColor", v2);
  v7[1] = v3;
  v4 = [MEMORY[0x263F825C8] systemOrangeColor];
  v7[2] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];

  return (NSArray *)v5;
}

+ (void)updateVibrancyStylingForView:(id)a3 withUsageColor:(id)a4
{
  id v18 = a3;
  id v5 = a4;
  v6 = (void *)MEMORY[0x263F54000];
  v7 = [v18 traitCollection];
  v8 = objc_msgSend(v6, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 0, 3, objc_msgSend(v7, "userInterfaceStyle"));

  v9 = [MEMORY[0x263F825C8] systemGrayColor];
  char v10 = [v5 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = 20;
  }
  else
  {
    v12 = [MEMORY[0x263F825C8] systemBlueColor];
    char v13 = [v5 isEqual:v12];

    if (v13)
    {
      uint64_t v11 = 21;
    }
    else
    {
      v14 = [MEMORY[0x263F825C8] systemTealColor];
      char v15 = [v5 isEqual:v14];

      if (v15)
      {
        uint64_t v11 = 22;
      }
      else
      {
        v16 = [MEMORY[0x263F825C8] systemOrangeColor];
        int v17 = [v5 isEqual:v16];

        if (!v17) {
          goto LABEL_10;
        }
        uint64_t v11 = 23;
      }
    }
  }
  [v8 automaticallyUpdateView:v18 withStyle:v11];
LABEL_10:
}

@end