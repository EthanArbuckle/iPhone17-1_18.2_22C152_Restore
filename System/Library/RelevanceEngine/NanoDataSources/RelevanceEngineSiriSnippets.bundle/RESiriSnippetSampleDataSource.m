@interface RESiriSnippetSampleDataSource
+ (id)applicationBundleIdentifier;
+ (id)bundleIdentifier;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation RESiriSnippetSampleDataSource

+ (id)bundleIdentifier
{
  return @"com.apple.NanoTimeKit.SiriSnippet";
}

+ (id)applicationBundleIdentifier
{
  return 0;
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
  v5 = RESiriSnippetLocalizedString(@"UP_NEXT_SIRI_SNIPPET_MORNING_2");
  v6 = RESiriSnippetCreateElementFromString(v5);
  v8 = v6;
  v7 = +[NSArray arrayWithObjects:&v8 count:1];
  v4[2](v4, v7);
}

@end