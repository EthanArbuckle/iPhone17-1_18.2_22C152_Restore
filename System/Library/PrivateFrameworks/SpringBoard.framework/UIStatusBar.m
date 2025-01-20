@interface UIStatusBar
@end

@implementation UIStatusBar

void __85__UIStatusBar_Base_Snapshots__sb_setSnapshotOverridesWithTimeEnabled_overriddenDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter;
  sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter = (uint64_t)v0;

  v2 = (void *)sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter;
  v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [v2 setLocale:v3];

  [(id)sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter setDateStyle:0];
  [(id)sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter setTimeStyle:1];
  v4 = (void *)sb_setSnapshotOverridesWithTimeEnabled_overriddenDate__timeDateFormatter;
  id v5 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/Los_Angeles"];
  [v4 setTimeZone:v5];
}

@end