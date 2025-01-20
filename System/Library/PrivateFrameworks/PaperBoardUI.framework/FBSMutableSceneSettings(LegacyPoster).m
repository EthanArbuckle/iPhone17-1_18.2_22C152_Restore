@interface FBSMutableSceneSettings(LegacyPoster)
- (void)pb_applyLegacySettings;
@end

@implementation FBSMutableSceneSettings(LegacyPoster)

- (void)pb_applyLegacySettings
{
  v2 = objc_msgSend(a1, "pui_provider");
  int v3 = [v2 isEqual:@"com.apple.PaperBoard.LegacyPoster"];

  if (v3)
  {
    uint64_t v4 = objc_msgSend(a1, "pb_activeVariant");
    id v6 = +[PBUIWallpaperDefaults defaults];
    [v6 parallaxFactorForVariant:v4 wallpaperMode:0];
    objc_msgSend(a1, "pr_setParallaxEnabled:", v5 > 0.0);
  }
}

@end