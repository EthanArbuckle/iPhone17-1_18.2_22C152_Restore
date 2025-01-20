@interface RERelevanceEngineHeartSampleDataSource
+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersion;
+ (id)applicationBundleIdentifier;
+ (id)bundleIdentifier;
- (id)supportedSections;
- (void)getElementsInSection:(id)a3 withHandler:(id)a4;
@end

@implementation RERelevanceEngineHeartSampleDataSource

+ (id)bundleIdentifier
{
  return +[RERelevanceEngineHeartUtilities bundleIdentifier];
}

+ (id)applicationBundleIdentifier
{
  return +[RERelevanceEngineHeartUtilities applicationIdentifier];
}

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)minimumSupportedSystemVersion
{
  return +[RERelevanceEngineHeartUtilities minimumOperatingSystemVersion];
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
  v5 = +[RERelevanceEngineHeartUtilities sampleElement];
  v7 = v5;
  v6 = +[NSArray arrayWithObjects:&v7 count:1];
  v4[2](v4, v6);
}

@end