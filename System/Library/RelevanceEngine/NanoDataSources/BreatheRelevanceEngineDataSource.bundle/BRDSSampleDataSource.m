@interface BRDSSampleDataSource
+ (id)bundleIdentifier;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation BRDSSampleDataSource

+ (id)bundleIdentifier
{
  return @"com.apple.DeepBreathing";
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
  v6 = BRDSBreatheContent();
  id v7 = objc_alloc((Class)REElement);
  v12 = v5;
  v8 = +[NSArray arrayWithObjects:&v12 count:1];
  id v9 = [v7 initWithIdentifier:@"com.apple.DeepBreathing.Breathe" content:v6 action:0 relevanceProviders:v8];

  id v11 = v9;
  v10 = +[NSArray arrayWithObjects:&v11 count:1];
  v4[2](v4, v10);
}

@end