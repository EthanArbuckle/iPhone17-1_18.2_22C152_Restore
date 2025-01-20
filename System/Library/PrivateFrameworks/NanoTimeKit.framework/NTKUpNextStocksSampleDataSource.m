@interface NTKUpNextStocksSampleDataSource
+ (id)bundleIdentifier;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation NTKUpNextStocksSampleDataSource

+ (id)bundleIdentifier
{
  return @"com.apple.stocks.watchapp";
}

- (id)supportedSections
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F94A10];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v24 = (void (**)(id, void *))a4;
  v4 = objc_opt_new();
  [v4 setNumberStyle:3];
  [v4 setMaximumFractionDigits:2];
  [v4 setMaximumIntegerDigits:1];
  [v4 setPercentSymbol:&stru_1F1635E90];
  v5 = NSString;
  v6 = [v4 plusSign];
  v7 = [v4 stringFromNumber:&unk_1F16E7290];
  uint64_t v8 = [v5 localizedStringWithFormat:@"%@%@", v6, v7];

  [v4 setNumberStyle:2];
  [v4 setMaximumIntegerDigits:4];
  [v4 setCurrencySymbol:&stru_1F1635E90];
  v9 = [v4 stringFromNumber:&unk_1F16E72A0];
  v10 = NTKClockFaceLocalizedString(@"UP_NEXT_SAMPLE_STOCK_NAME", @"▲ S&P 500");
  v11 = NTKClockFaceLocalizedString(@"UP_NEXT_SAMPLE_STOCK_USE_RED_FOR_UP", @"See note in strings file for this key");
  char v12 = [v11 isEqualToString:@"1"];

  if (v12) {
    [MEMORY[0x1E4FB1618] systemRedColor];
  }
  else {
  v13 = [MEMORY[0x1E4FB1618] systemGreenColor];
  }
  v14 = REUISampleRelevanceProviderForSamplePosition();
  v15 = [MEMORY[0x1E4F19AB0] textProviderWithText:v10];
  v16 = [MEMORY[0x1E4F19AB0] textProviderWithText:v8];
  v17 = [MEMORY[0x1E4F19AB0] textProviderWithText:v9];
  NTKUpNextStocksContent(v15, v16, v17, v13);
  v18 = v23 = (void *)v8;

  id v19 = objc_alloc(MEMORY[0x1E4F94920]);
  v26[0] = v14;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v21 = (void *)[v19 initWithIdentifier:@"com.apple.stocks.downtime" content:v18 action:0 relevanceProviders:v20];

  v25 = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v24[2](v24, v22);
}

@end