@interface REAudiobooksDemoDataSource
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation REAudiobooksDemoDataSource

- (void)getElementsInSection:(id)a3 withHandler:(id)a4
{
  v4 = REAudiobooksBundleIdentifier;
  v5 = (void (**)(id, void *))a4;
  v6 = +[NSString stringWithFormat:@"%@.demo", v4];
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