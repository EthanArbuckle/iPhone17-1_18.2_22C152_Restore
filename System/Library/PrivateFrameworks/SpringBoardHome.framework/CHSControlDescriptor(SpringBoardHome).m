@interface CHSControlDescriptor(SpringBoardHome)
- (id)sbh_appName;
- (id)sbh_galleryItemIdentifier;
- (uint64_t)_widgetLocationStyleForAddWidgetSheetLocation:()SpringBoardHome;
- (uint64_t)accentColor;
- (uint64_t)backgroundColor;
- (uint64_t)mostInterestingColor;
- (uint64_t)sbh_canBeAddedToStack;
- (uint64_t)sbh_disfavoredSizeClassesForAddWidgetSheetLocation:()SpringBoardHome;
- (uint64_t)sbh_favoredSizeClassesForAddWidgetSheetLocation:()SpringBoardHome;
- (uint64_t)sbh_isLinkedOnOrAfter:()SpringBoardHome;
- (uint64_t)sbh_supportedSizeClasses;
- (uint64_t)sbh_supportsRemovableBackground;
- (uint64_t)sbh_supportsRemovableBackgroundOrAccessoryFamilies;
@end

@implementation CHSControlDescriptor(SpringBoardHome)

- (id)sbh_appName
{
  v1 = [a1 extensionIdentity];
  v2 = [v1 extensionBundleIdentifier];

  v3 = SBHContainingBundleRecordForWidgetWithBundleIdentifier(v2);
  v4 = [v3 localizedName];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 localizedShortName];
  }
  v7 = v6;

  return v7;
}

- (uint64_t)sbh_supportedSizeClasses
{
  return 0;
}

- (uint64_t)sbh_favoredSizeClassesForAddWidgetSheetLocation:()SpringBoardHome
{
  return 0;
}

- (uint64_t)sbh_disfavoredSizeClassesForAddWidgetSheetLocation:()SpringBoardHome
{
  return 0;
}

- (uint64_t)_widgetLocationStyleForAddWidgetSheetLocation:()SpringBoardHome
{
  return 0;
}

- (uint64_t)sbh_canBeAddedToStack
{
  return 0;
}

- (uint64_t)sbh_supportsRemovableBackground
{
  return 0;
}

- (uint64_t)sbh_supportsRemovableBackgroundOrAccessoryFamilies
{
  return 0;
}

- (id)sbh_galleryItemIdentifier
{
  v2 = objc_getAssociatedObject(a1, &SBHControlDescriptorGalleryItemIdentifierKey);
  if (!v2)
  {
    v3 = [a1 extensionIdentity];
    v4 = NSString;
    v5 = [v3 extensionBundleIdentifier];
    id v6 = [a1 kind];
    v7 = [v3 containerBundleIdentifier];
    uint64_t v8 = [a1 preferredControlSize];
    v9 = [a1 displayName];
    v10 = [a1 widgetDescription];
    v11 = [a1 intentType];
    v2 = [v4 stringWithFormat:@"CONTROL_DESCRIPTOR:%@-%@-%@-%lu-%@-%@-%@", v5, v6, v7, v8, v9, v10, v11];

    objc_setAssociatedObject(a1, &SBHControlDescriptorGalleryItemIdentifierKey, v2, (void *)1);
  }
  return v2;
}

- (uint64_t)sbh_isLinkedOnOrAfter:()SpringBoardHome
{
  return 1;
}

- (uint64_t)backgroundColor
{
  return 0;
}

- (uint64_t)accentColor
{
  return 0;
}

- (uint64_t)mostInterestingColor
{
  return 0;
}

@end