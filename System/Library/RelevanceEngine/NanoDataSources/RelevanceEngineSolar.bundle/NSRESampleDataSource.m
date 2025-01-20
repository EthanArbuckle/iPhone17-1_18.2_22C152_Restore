@interface NSRESampleDataSource
+ (id)applicationBundleIdentifier;
+ (id)bundleIdentifier;
+ (id)overrideDataSourceImage;
+ (id)overrideLocalizedDataSourceName;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation NSRESampleDataSource

+ (id)applicationBundleIdentifier
{
  return @"com.apple.NanoWorldClock";
}

+ (id)bundleIdentifier
{
  return @"com.apple.NanoWorldClock.solar";
}

+ (id)overrideDataSourceImage
{
  v2 = (void *)MEMORY[0x263F62D78];
  v3 = NSRELocalizationBundle();
  v4 = [v2 imageNamed:@"Bundle Icon" inBundle:v3];

  return v4;
}

+ (id)overrideLocalizedDataSourceName
{
  return NSRELocalizedString(@"SUNRISE_SUNSET_TITLE");
}

- (id)supportedSections
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F62DC0];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  v5 = (void (**)(id, void *))a4;
  if ([(id)*MEMORY[0x263F62DC0] isEqualToString:a3])
  {
    v6 = [MEMORY[0x263EFF910] sampleDate];
    v7 = +[NSRESolarEvent sunsetEvent:at:](NSRESolarEvent, "sunsetEvent:at:", v6, *MEMORY[0x263F00B58], *(double *)(MEMORY[0x263F00B58] + 8));

    v8 = +[NSREContentFormatter solarContentForEvent:v7];
    v9 = REUISampleRelevanceProviderForSamplePosition();
    v14[0] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];

    v11 = (void *)[objc_alloc(MEMORY[0x263F62D60]) initWithIdentifier:@"solar.sample" content:v8 action:0 relevanceProviders:v10 privacyBehavior:0];
    v13 = v11;
    v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
    v5[2](v5, v12);
  }
  else
  {
    v5[2](v5, 0);
  }
}

@end