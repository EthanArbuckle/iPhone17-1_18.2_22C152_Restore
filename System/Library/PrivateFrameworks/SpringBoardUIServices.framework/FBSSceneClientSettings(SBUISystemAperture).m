@interface FBSSceneClientSettings(SBUISystemAperture)
- (BOOL)SBUISA_specifiesPreferredPaddingForCompactLayout;
- (double)SBUISA_customLayoutPreferredOutsetsFromUnsafeArea;
- (double)SBUISA_preferredCustomAspectRatio;
- (double)SBUISA_preferredDetachedMinimalViewSize;
- (double)SBUISA_preferredLeadingViewSize;
- (double)SBUISA_preferredMinimalViewSize;
- (double)SBUISA_preferredPaddingForCompactLayout;
- (double)SBUISA_preferredTrailingViewSize;
- (id)SBUISA_associatedAppBundleIdentifier;
- (id)SBUISA_associatedScenePersistenceIdentifier;
- (id)SBUISA_backgroundActivitiesToSuppress;
- (id)SBUISA_detachedMinimalViewAccessibilityLabel;
- (id)SBUISA_elementIdentifier;
- (id)SBUISA_keyColor;
- (id)SBUISA_launchAction;
- (id)SBUISA_launchURL;
- (id)SBUISA_leadingViewAccessibilityLabel;
- (id)SBUISA_minimalViewAccessibilityLabel;
- (id)SBUISA_trailingViewAccessibilityLabel;
- (id)SBUI_systemApertureDescription;
- (id)SBUI_systemApertureDescriptionOfDiffFromSettings:()SBUISystemAperture;
- (uint64_t)SBUISA_appliedLayoutMode;
- (uint64_t)SBUISA_attachedMinimalViewRequiresZeroPadding;
- (uint64_t)SBUISA_contentRole;
- (uint64_t)SBUISA_contextId;
- (uint64_t)SBUISA_detachedMinimalViewRenderingId;
- (uint64_t)SBUISA_hasMenuPresentation;
- (uint64_t)SBUISA_leadingViewRenderingId;
- (uint64_t)SBUISA_maximumLayoutMode;
- (uint64_t)SBUISA_minimalViewRenderingId;
- (uint64_t)SBUISA_minimumLayoutMode;
- (uint64_t)SBUISA_preferredCustomLayout;
- (uint64_t)SBUISA_preferredLayoutMode;
- (uint64_t)SBUISA_prefersFixedPortraitOrientation;
- (uint64_t)SBUISA_presentationBehaviors;
- (uint64_t)SBUISA_preventsAutomaticDismissal;
- (uint64_t)SBUISA_preventsInteractiveDismissal;
- (uint64_t)SBUISA_trailingViewRenderingId;
@end

@implementation FBSSceneClientSettings(SBUISystemAperture)

- (id)SBUISA_elementIdentifier
{
  v1 = [a1 otherSettings];
  v2 = objc_msgSend(v1, "SBUISA_stringforSetting:", 3213043);

  return v2;
}

- (uint64_t)SBUISA_contentRole
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_contentRoleforSetting:", 3213018);

  return v2;
}

- (uint64_t)SBUISA_preferredLayoutMode
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_layoutModeforSetting:", 3213019);

  return v2;
}

- (uint64_t)SBUISA_minimumLayoutMode
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_layoutModeforSetting:", 3213020);

  return v2;
}

- (uint64_t)SBUISA_maximumLayoutMode
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_layoutModeforSetting:", 3213021);

  return v2;
}

- (uint64_t)SBUISA_appliedLayoutMode
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_layoutModeforSetting:", 3213022);

  return v2;
}

- (id)SBUISA_associatedScenePersistenceIdentifier
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_stringforSetting:", 3213023);

  return v2;
}

- (id)SBUISA_associatedAppBundleIdentifier
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_stringforSetting:", 3213037);

  return v2;
}

- (id)SBUISA_launchURL
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_URLforSetting:", 3213051);

  return v2;
}

- (id)SBUISA_launchAction
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_BSActionforSetting:", 3213052);

  return v2;
}

- (double)SBUISA_preferredLeadingViewSize
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_CGSizeforSetting:", 3213024);
  double v3 = v2;

  return v3;
}

- (double)SBUISA_preferredTrailingViewSize
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_CGSizeforSetting:", 3213025);
  double v3 = v2;

  return v3;
}

- (double)SBUISA_preferredMinimalViewSize
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_CGSizeforSetting:", 3213026);
  double v3 = v2;

  return v3;
}

- (double)SBUISA_preferredDetachedMinimalViewSize
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_CGSizeforSetting:", 3213027);
  double v3 = v2;

  return v3;
}

- (uint64_t)SBUISA_leadingViewRenderingId
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_renderingIdforSetting:", 3213029);

  return v2;
}

- (uint64_t)SBUISA_trailingViewRenderingId
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_renderingIdforSetting:", 3213030);

  return v2;
}

- (uint64_t)SBUISA_minimalViewRenderingId
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_renderingIdforSetting:", 3213031);

  return v2;
}

- (uint64_t)SBUISA_detachedMinimalViewRenderingId
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_renderingIdforSetting:", 3213032);

  return v2;
}

- (uint64_t)SBUISA_contextId
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_contextIdforSetting:", 3213028);

  return v2;
}

- (double)SBUISA_customLayoutPreferredOutsetsFromUnsafeArea
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_directionalEdgeInsetsforSetting:", 3213033);
  double v3 = v2;

  return v3;
}

- (id)SBUISA_backgroundActivitiesToSuppress
{
  v1 = [a1 otherSettings];
  double v2 = objc_msgSend(v1, "SBUISA_backgroundActivityIdentifiersForSetting:", 3213034);

  return v2;
}

- (double)SBUISA_preferredCustomAspectRatio
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_CGSizeforSetting:", 3213035);
  double v3 = v2;

  return v3;
}

- (uint64_t)SBUISA_preferredCustomLayout
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_customLayoutModeforSetting:", 3213036);

  return v2;
}

- (uint64_t)SBUISA_hasMenuPresentation
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:3213038];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)SBUISA_presentationBehaviors
{
  v1 = [a1 otherSettings];
  uint64_t v2 = objc_msgSend(v1, "SBUISA_presentationBehaviorsForSetting:", 3213039);

  return v2;
}

- (BOOL)SBUISA_specifiesPreferredPaddingForCompactLayout
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:3213040];

  if (v2)
  {
    [v2 directionalEdgeInsetsValue];
    BOOL v4 = v3 != *MEMORY[0x1E4F43ED8];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (uint64_t)SBUISA_attachedMinimalViewRequiresZeroPadding
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:3213041];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)SBUISA_prefersFixedPortraitOrientation
{
  v1 = [a1 otherSettings];
  uint64_t v2 = [v1 objectForSetting:3213042];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (double)SBUISA_preferredPaddingForCompactLayout
{
  v1 = [a1 otherSettings];
  objc_msgSend(v1, "SBUISA_directionalEdgeInsetsforSetting:", 3213040);
  double v3 = v2;

  return v3;
}

- (uint64_t)SBUISA_preventsInteractiveDismissal
{
  v1 = [a1 otherSettings];
  double v2 = [v1 objectForSetting:3213048];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)SBUISA_preventsAutomaticDismissal
{
  v1 = [a1 otherSettings];
  double v2 = [v1 objectForSetting:3213049];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (id)SBUISA_leadingViewAccessibilityLabel
{
  v1 = [a1 otherSettings];
  double v2 = objc_msgSend(v1, "SBUISA_stringforSetting:", 3213044);

  return v2;
}

- (id)SBUISA_trailingViewAccessibilityLabel
{
  v1 = [a1 otherSettings];
  double v2 = objc_msgSend(v1, "SBUISA_stringforSetting:", 3213045);

  return v2;
}

- (id)SBUISA_minimalViewAccessibilityLabel
{
  v1 = [a1 otherSettings];
  double v2 = objc_msgSend(v1, "SBUISA_stringforSetting:", 3213046);

  return v2;
}

- (id)SBUISA_detachedMinimalViewAccessibilityLabel
{
  v1 = [a1 otherSettings];
  double v2 = objc_msgSend(v1, "SBUISA_stringforSetting:", 3213047);

  return v2;
}

- (id)SBUISA_keyColor
{
  v1 = [a1 otherSettings];
  double v2 = objc_msgSend(v1, "SBUISA_UIColorForSetting:", 3213050);

  return v2;
}

- (id)SBUI_systemApertureDescription
{
  v1 = [a1 otherSettings];
  double v2 = objc_msgSend(v1, "SBUI_systemApertureDescription");

  return v2;
}

- (id)SBUI_systemApertureDescriptionOfDiffFromSettings:()SBUISystemAperture
{
  id v4 = a3;
  v5 = [a1 otherSettings];
  v6 = [v4 otherSettings];

  v7 = objc_msgSend(v5, "SBUI_systemApertureDescriptionOfDiffFromSettings:", v6);

  return v7;
}

@end