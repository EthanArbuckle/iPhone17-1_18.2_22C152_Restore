@interface SBXXAddWebClipToHomeScreen
@end

@implementation SBXXAddWebClipToHomeScreen

void ___SBXXAddWebClipToHomeScreen_block_invoke(uint64_t a1)
{
  id v27 = +[SBIconController sharedInstance];
  v2 = [v27 iconManager];
  v3 = [v27 model];
  [v3 clearDesiredIconState];
  if (*(void *)(a1 + 32))
  {
    v4 = objc_msgSend(MEMORY[0x1E4F43048], "webClipWithIdentifier:");
    v5 = [v4 initialLaunchImage];
    if (v5)
    {
      v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      v6 = [MEMORY[0x1E4F42D90] mainScreen];
      [v6 scale];
      uint64_t v8 = SBScaleSuffixForScale(v7);

      v26 = (void *)v8;
      uint64_t v9 = [NSString stringWithFormat:@"Main/Default%@.png", v8];
      v10 = +[SBApplicationController sharedInstance];
      v11 = [v10 applicationWithBundleIdentifier:@"com.apple.webapp"];

      v12 = [v11 _snapshotManifest];
      v13 = [v12 containerPath];

      v14 = [v4 identifier];
      v15 = [v13 stringByAppendingPathComponent:v14];
      v25 = (void *)v9;
      v16 = [v15 stringByAppendingPathComponent:v9];
      v17 = [v16 stringByStandardizingPath];

      if ([v17 hasPrefix:v13])
      {
        v18 = [v17 stringByDeletingLastPathComponent];
        if (([v24 fileExistsAtPath:v18 isDirectory:0] & 1) == 0) {
          [v24 createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:0 error:0];
        }
        v19 = UIImagePNGRepresentation(v5);
        [v19 writeToFile:v17 options:0x10000000 error:0];
      }
    }
    id v20 = (id)[MEMORY[0x1E4FA6080] sanitizeWebClip:v4];
    v21 = [v3 addBookmarkIconForWebClip:v4];
    if (v21)
    {
      if (SBWorkspaceSpringBoardIsActive()) {
        uint64_t v22 = 12;
      }
      else {
        uint64_t v22 = 14;
      }
      [v2 addNewIconToDesignatedLocation:v21 options:v22];
    }
    [(id)SBApp noteInstalledWebClipsDidChange];
    v23 = [MEMORY[0x1E4F4AEB8] sharedInstance];
    [v23 notifyBookmarksDidChange];
  }
}

@end