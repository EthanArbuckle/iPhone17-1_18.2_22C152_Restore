@interface UIApplication(SKUIMedusaAdditions)
- (BOOL)SKUI_isFullscreen;
- (uint64_t)SKUI_isMedusaActive;
- (void)SKUI_isFullscreen;
- (void)SKUI_isMedusaActive;
@end

@implementation UIApplication(SKUIMedusaAdditions)

- (uint64_t)SKUI_isMedusaActive
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[UIApplication(SKUIMedusaAdditions) SKUI_isMedusaActive]();
  }
  return objc_msgSend(a1, "SKUI_isFullscreen") ^ 1;
}

- (BOOL)SKUI_isFullscreen
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[UIApplication(SKUIMedusaAdditions) SKUI_isFullscreen]();
  }
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  v7 = [a1 keyWindow];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  return v4 + v6 == v9 + v11;
}

- (void)SKUI_isMedusaActive
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[UIApplication(SKUIMedusaAdditions) SKUI_isMedusaActive]";
}

- (void)SKUI_isFullscreen
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[UIApplication(SKUIMedusaAdditions) SKUI_isFullscreen]";
}

@end