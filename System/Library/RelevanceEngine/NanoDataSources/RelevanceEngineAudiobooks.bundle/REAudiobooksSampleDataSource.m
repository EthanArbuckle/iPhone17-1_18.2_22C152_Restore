@interface REAudiobooksSampleDataSource
+ (id)bundleIdentifier;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation REAudiobooksSampleDataSource

+ (id)bundleIdentifier
{
  return REAudiobooksBundleIdentifier;
}

- (id)supportedSections
{
  uint64_t v4 = REDefaultSectionIdentifier;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  uint64_t v4 = REAudiobooksBundleIdentifier;
  v5 = (void (**)(id, void *))a4;
  v6 = +[NSString stringWithFormat:@"%@.sample", v4];
  v7 = REAudiobooksSampleContent();
  v8 = REUISampleRelevanceProviderForSamplePosition();
  id v9 = objc_alloc((Class)REElement);
  v14 = v8;
  v10 = +[NSArray arrayWithObjects:&v14 count:1];
  id v11 = [v9 initWithIdentifier:v6 content:v7 action:0 relevanceProviders:v10];

  id v13 = v11;
  v12 = +[NSArray arrayWithObjects:&v13 count:1];
  v5[2](v5, v12);
}

@end