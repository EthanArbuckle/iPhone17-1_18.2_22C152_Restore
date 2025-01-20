@interface REHomeSampleDataSource
+ (id)bundleIdentifier;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation REHomeSampleDataSource

+ (id)bundleIdentifier
{
  return REHomeBundleIdentifier;
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
  v4 = (void (**)(id, void *))a4;
  v5 = REHomeLocalizedString(@"UP_NEXT_SAMPLE_HOME_NAME");
  v6 = REHomeLocalizedString(@"UP_NEXT_SAMPLE_HOME_SCENE_NAME");
  v7 = REUISampleRelevanceProviderForSamplePosition();
  v8 = REHomeContent(v5, v6);
  id v9 = objc_alloc(MEMORY[0x263F62D60]);
  v14[0] = v7;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  v11 = (void *)[v9 initWithIdentifier:@"nanoHome.sample" content:v8 action:0 relevanceProviders:v10];

  v13 = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v13 count:1];
  v4[2](v4, v12);
}

@end