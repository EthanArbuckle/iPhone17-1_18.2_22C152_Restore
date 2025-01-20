@interface UIScene(VideosUI)
- (uint64_t)vui_isNonLightningSecondScreenScene;
@end

@implementation UIScene(VideosUI)

- (uint64_t)vui_isNonLightningSecondScreenScene
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v2 = [a1 screen];
  v3 = [v2 displayConfiguration];
  v4 = [v3 name];

  v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Found window scene with display name %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = [v4 hasPrefix:@"TVOut"];
  return v6;
}

@end