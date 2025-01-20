@interface UCResourceFilePath
+ (id)_bundle;
+ (id)combinedPathAndQueryFilePathForSegmentedURLCoderVersion0;
+ (id)hostFilePathForSegmentedURLCoderVersion0;
+ (id)segmentedPathAndQueryFilePathForSegmentedURLCoderVersion0;
@end

@implementation UCResourceFilePath

+ (id)_bundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

+ (id)hostFilePathForSegmentedURLCoderVersion0
{
  id v2 = (id)[a1 _bundle];
  id v3 = (id)[v2 pathForResource:@"h" ofType:@"data"];

  return v3;
}

+ (id)segmentedPathAndQueryFilePathForSegmentedURLCoderVersion0
{
  id v2 = (id)[a1 _bundle];
  id v3 = (id)[v2 pathForResource:@"spq" ofType:@"data"];

  return v3;
}

+ (id)combinedPathAndQueryFilePathForSegmentedURLCoderVersion0
{
  id v2 = (id)[a1 _bundle];
  id v3 = (id)[v2 pathForResource:@"cpq" ofType:@"data"];

  return v3;
}

@end