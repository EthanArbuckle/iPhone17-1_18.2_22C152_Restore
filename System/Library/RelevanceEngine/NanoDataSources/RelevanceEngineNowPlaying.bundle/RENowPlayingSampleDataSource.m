@interface RENowPlayingSampleDataSource
+ (id)bundleIdentifier;
+ (id)overrideLocalizedDataSourceName;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation RENowPlayingSampleDataSource

+ (id)bundleIdentifier
{
  return @"com.apple.NanoNowPlaying";
}

+ (id)overrideLocalizedDataSourceName
{
  return RENowPlayingLocalizedString(@"UPNEXT_DATA_SOURCE_NOW_PLAYING");
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
  v5 = RENowPlayingImageNamed(@"SG_Now_Playing_Sample");
  v6 = RENowPlayingElementContent(v5, @"Up&Up", 0, @"Coldplay", 0, 0);
  id v7 = objc_alloc((Class)REElement);
  v8 = REUISampleRelevanceProviderForSamplePosition();
  v13 = v8;
  v9 = +[NSArray arrayWithObjects:&v13 count:1];
  id v10 = [v7 initWithIdentifier:@"kNowPlayingElementIdentifier" content:v6 action:0 relevanceProviders:v9];

  id v12 = v10;
  v11 = +[NSArray arrayWithObjects:&v12 count:1];
  v4[2](v4, v11);
}

@end