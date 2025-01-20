@interface SFSafeBrowsingPreferencesPlistPath
@end

@implementation SFSafeBrowsingPreferencesPlistPath

void ___SFSafeBrowsingPreferencesPlistPath_block_invoke()
{
  CPSharedResourcesDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"Library/Preferences/com.apple.Safari.SafeBrowsing.plist"];
  v1 = (void *)_SFSafeBrowsingPreferencesPlistPath::safeBrowsingPreferencesPlistPath;
  _SFSafeBrowsingPreferencesPlistPath::safeBrowsingPreferencesPlistPath = v0;
}

@end