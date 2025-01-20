@interface SASUIProximityCloudPlayerItem
+ (id)configuredPlayerForLightMode:(BOOL)a3;
@end

@implementation SASUIProximityCloudPlayerItem

+ (id)configuredPlayerForLightMode:(BOOL)a3
{
  v3 = @"ProximityPairingLoopDark";
  if (a3) {
    v3 = @"ProximityPairingLoop";
  }
  v4 = (void *)MEMORY[0x263F086E0];
  v5 = v3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v6 URLForResource:v5 withExtension:@"mov" subdirectory:0];

  v8 = [[SASUIProximityCloudPlayerItem alloc] initWithURL:v7];

  return v8;
}

@end