@interface StocksUtilities
+ (BOOL)shouldStackCellContentsForStocks:(id)a3 withWidth:(double)a4 andBoxWidth:(double)a5;
@end

@implementation StocksUtilities

+ (BOOL)shouldStackCellContentsForStocks:(id)a3 withWidth:(double)a4 andBoxWidth:(double)a5
{
  v32[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if ([v7 count]
    && ([MEMORY[0x263F1C408] sharedApplication],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 preferredContentSizeCategory],
        v9 = (NSString *)objc_claimAutoreleasedReturnValue(),
        BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9),
        v9,
        v8,
        IsAccessibilityCategory))
  {
    v11 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D300]];
    uint64_t v12 = [v7 count];
    if (v12 < 1)
    {
      BOOL v17 = 0;
    }
    else
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      double v15 = a4 + -16.0 - a5;
      uint64_t v16 = *MEMORY[0x263F1C238];
      BOOL v17 = 1;
      do
      {
        v18 = [v7 objectAtIndexedSubscript:v14];
        v19 = [v18 listName];
        uint64_t v31 = v16;
        v32[0] = v11;
        v20 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
        objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 0, v20, 0, 1.79769313e308, 0.0);
        double v22 = v21;

        v23 = [v18 price];

        if (v23)
        {
          v24 = [v18 formattedPriceDroppingFractionDigitsIfLengthExceeds:10];
        }
        else
        {
          v24 = &stru_26D5DA820;
        }
        uint64_t v29 = v16;
        v30 = v11;
        v25 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        -[__CFString boundingRectWithSize:options:attributes:context:](v24, "boundingRectWithSize:options:attributes:context:", 0, v25, 0, 1.79769313e308, 0.0);
        double v27 = ceil(v26);

        if (ceil(v22) + 8.0 > v15 - v27 + -16.0) {
          break;
        }
        BOOL v17 = ++v14 < v13;
      }
      while (v13 != v14);
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

@end