@interface GKGameDescriptor(NillableShim)
+ (id)gameDescriptorWithAdamID:()NillableShim bundleID:platform:shortBundleVersion:;
@end

@implementation GKGameDescriptor(NillableShim)

+ (id)gameDescriptorWithAdamID:()NillableShim bundleID:platform:shortBundleVersion:
{
  if (!(a3 | a4))
  {
    v10 = NSString;
    uint64_t v11 = [NSString stringWithFormat:@"adamID and bundleID can't both be nil"];
    uint64_t v12 = [v10 stringWithFormat:@"%@ (adamID || bundleID)\n[%s (%s:%d)]", v11, "+[GKGameDescriptor(NillableShim) gameDescriptorWithAdamID:bundleID:platform:shortBundleVersion:]", objc_msgSend((id)objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter_GameServicesShims/Frameworks/GameServices/ShimGameServices/Modules/GameCenterFoundation_Shims/GCF+NillableShims.m"), "lastPathComponent"), "UTF8String"), 18];
    [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v12 format];
  }
  id v13 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v13 setNumberStyle:0];
  id v14 = objc_alloc_init(MEMORY[0x263F401E8]);
  if (a3) {
    objc_msgSend(v14, "setAdamID:", objc_msgSend(v13, "numberFromString:", a3));
  }
  [v14 setBundleIdentifier:a4];
  if (a5) {
    objc_msgSend(v14, "setPlatform:", objc_msgSend((id)objc_opt_class(), "gamePlatformFromServerGameDescriptorString:", a5));
  }
  [v14 setShortBundleVersion:a6];
  return v14;
}

@end