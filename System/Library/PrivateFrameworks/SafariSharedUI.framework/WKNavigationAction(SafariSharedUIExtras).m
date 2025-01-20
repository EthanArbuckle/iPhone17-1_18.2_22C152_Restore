@interface WKNavigationAction(SafariSharedUIExtras)
- (BOOL)safari_isNewWindowNavigationActionSpecifiedByAnchorTargetAttribute;
- (BOOL)safari_shouldDonateWithPolicy:()SafariSharedUIExtras;
- (uint64_t)safari_isEligibleForContinuedTranslationWithPolicy:()SafariSharedUIExtras;
- (uint64_t)safari_isEligibleToSpawnNewTabFromPinnedTab;
- (uint64_t)safari_shouldProhibitNavigationToSafariSpecificURL;
@end

@implementation WKNavigationAction(SafariSharedUIExtras)

- (uint64_t)safari_isEligibleForContinuedTranslationWithPolicy:()SafariSharedUIExtras
{
  uint64_t result = 0;
  if (a3 <= 4 && ((1 << a3) & 0x1A) != 0)
  {
    uint64_t v7 = objc_msgSend(a1, "navigationType", v3, v4);
    if ((unint64_t)(v7 + 1) <= 5) {
      return (0x2Fu >> (v7 + 1)) & 1;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)safari_isEligibleToSpawnNewTabFromPinnedTab
{
  unint64_t v1 = [a1 navigationType];
  return (v1 > 4) | (5u >> v1) & 1;
}

- (BOOL)safari_isNewWindowNavigationActionSpecifiedByAnchorTargetAttribute
{
  unint64_t v1 = [a1 targetFrame];
  BOOL v2 = v1 == 0;

  return v2;
}

- (uint64_t)safari_shouldProhibitNavigationToSafariSpecificURL
{
  BOOL v2 = [a1 request];
  uint64_t v3 = [v2 URL];

  if (objc_msgSend(v3, "safari_isSafariSpecificURL"))
  {
    if (objc_msgSend(a1, "safari_isNewWindowNavigationActionSpecifiedByAnchorTargetAttribute")) {
      [a1 sourceFrame];
    }
    else {
    v5 = [a1 targetFrame];
    }
    uint64_t v4 = [v5 isMainFrame] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)safari_shouldDonateWithPolicy:()SafariSharedUIExtras
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0
      && (unint64_t)(objc_msgSend(a1, "navigationType", v3, v4) - 5) < 0xFFFFFFFFFFFFFFFDLL;
}

@end