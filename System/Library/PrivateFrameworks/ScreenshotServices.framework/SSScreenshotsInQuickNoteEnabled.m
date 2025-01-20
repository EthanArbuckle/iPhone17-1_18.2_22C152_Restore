@interface SSScreenshotsInQuickNoteEnabled
@end

@implementation SSScreenshotsInQuickNoteEnabled

uint64_t ___SSScreenshotsInQuickNoteEnabled_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  _SSScreenshotsInQuickNoteEnabled___SSScreenshotsInQuickNoteEnabled = result;
  return result;
}

@end