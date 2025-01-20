@interface REWalletSampleDataSource
+ (id)bundleIdentifier;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation REWalletSampleDataSource

+ (id)bundleIdentifier
{
  return @"com.apple.NanoPassbook";
}

- (id)supportedSections
{
  uint64_t v4 = REDefaultSectionIdentifier;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  uint64_t v4 = (void (**)(id, void *))a4;
  v5 = REUISampleRelevanceProviderForSamplePosition();
  v6 = +[NSCalendar currentCalendar];
  v7 = +[NSDate date];
  v8 = [v6 dateBySettingHour:13 minute:0 second:0 ofDate:v7 options:0];

  v9 = REWalletLocalizedString(@"UP_NEXT_SAMPLE_WALLET_NAME");
  v10 = +[CLKSimpleTextProvider textProviderWithText:v9];

  v11 = REWalletLocalizedString(@"UP_NEXT_SAMPLE_WALLET_DESCRIPTION");
  v12 = +[CLKSimpleTextProvider textProviderWithText:v11];

  v13 = +[CLKTimeTextProvider textProviderWithDate:v8];
  id v14 = objc_alloc_init((Class)REContent);
  v15 = +[CLKSymbolImageProvider symbolImageProviderWithSystemName:@"airplane"];
  [v14 setHeaderImageProvider:v15];

  [v14 setHeaderTextProvider:v10];
  [v14 setDescription1TextProvider:v12];
  [v14 setDescription2TextProvider:v13];
  id v16 = objc_alloc((Class)REElement);
  v21 = v5;
  v17 = +[NSArray arrayWithObjects:&v21 count:1];
  id v18 = [v16 initWithIdentifier:@"wallet.sample" content:v14 action:0 relevanceProviders:v17];

  id v20 = v18;
  v19 = +[NSArray arrayWithObjects:&v20 count:1];
  v4[2](v4, v19);
}

@end