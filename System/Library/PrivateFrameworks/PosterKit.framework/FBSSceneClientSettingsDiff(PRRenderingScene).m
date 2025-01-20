@interface FBSSceneClientSettingsDiff(PRRenderingScene)
- (uint64_t)pr_averageColorDidChange;
- (uint64_t)pr_contentSizeDidChange;
- (uint64_t)pr_desiredLegibilitySettingsDidChange;
- (uint64_t)pr_handlesWakeAnimationDidChange;
- (uint64_t)pr_hideChromeDidChange;
- (uint64_t)pr_hideDimmingLayerDidChange;
- (uint64_t)pr_prominentColorDidChange;
- (uint64_t)pr_timeColorDidChange;
@end

@implementation FBSSceneClientSettingsDiff(PRRenderingScene)

- (uint64_t)pr_averageColorDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20714);
}

- (uint64_t)pr_contentSizeDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20715);
}

- (uint64_t)pr_desiredLegibilitySettingsDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20717);
}

- (uint64_t)pr_prominentColorDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20719);
}

- (uint64_t)pr_timeColorDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20612);
}

- (uint64_t)pr_handlesWakeAnimationDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20713);
}

- (uint64_t)pr_hideChromeDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20716);
}

- (uint64_t)pr_hideDimmingLayerDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20718);
}

@end