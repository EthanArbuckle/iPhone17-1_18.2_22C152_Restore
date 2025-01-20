@interface BKAudiobookPlugin
- (id)helperForURL:(id)a3 withOptions:(id)a4;
- (id)supportedUrlSchemes;
@end

@implementation BKAudiobookPlugin

- (id)supportedUrlSchemes
{
  return +[NSArray arrayWithObjects:@"audiobook", @"file", 0];
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[BKMLAudiobookHelper alloc] initWithAssetUrl:v6 options:v5];

  return v7;
}

@end