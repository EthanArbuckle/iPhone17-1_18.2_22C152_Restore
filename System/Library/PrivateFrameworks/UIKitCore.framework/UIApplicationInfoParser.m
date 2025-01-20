@interface UIApplicationInfoParser
@end

@implementation UIApplicationInfoParser

void __48___UIApplicationInfoParser_mainBundleInfoParser__block_invoke()
{
  v0 = [_UIApplicationInfoParser alloc];
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [(_UIApplicationInfoParser *)v0 _initWithBundle:v3];
  v2 = (void *)_MergedGlobals_1058;
  _MergedGlobals_1058 = v1;
}

void __53___UIApplicationInfoParser_initWithApplicationProxy___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"UIBackgroundStyle", @"UIApplicationIsOpaque", @"UIStatusBarHidden", @"UIStatusBarStyle", @"UIStatusBarHiddenWhenVerticallyCompact", @"UILaunchImageFile", @"NSAccentColorName", @"UIStatusBarStyleIgnoredOverrides", @"UIViewControllerBasedStatusBarAppearance", @"UIApplicationSystemWindowsSecureKey", @"UIWhitePointAdaptivityStyleKey", @"_UIWhitePointAdaptivityStyle", @"Capabilities", @"UIOptOutOfRTL", @"NSDisableKeyboardLayoutAdjustedShortcuts", @"UISupportedInterfaceOrientations", @"UIInterfaceOrientation",
         @"UIApplicationExitsOnSuspend",
         @"UIApplicationInterfaceManifest",
         @"UIUserInterfaceStyle",
         @"UIDeviceFamily",
         @"com.apple.uikit.feature-a",
         @"UIApplicationSupportsIndirectInputEvents",
         @"_UIRequiresGameControllerBasedFocus",
         @"_UIFocusLimitedControlsEnabled",
         @"_UIFocusDefaultAppearanceEnabled",
         @"UIFocusSystemEnabled",
         @"UIObservationTrackingEnabled",
         @"UIApplicationSupportsPrintCommand",
         0x1ED15C160,
         @"CFBundleDocumentTypes",
         0);
  uint64_t v1 = (void *)qword_1EB260868;
  qword_1EB260868 = v0;
}

@end