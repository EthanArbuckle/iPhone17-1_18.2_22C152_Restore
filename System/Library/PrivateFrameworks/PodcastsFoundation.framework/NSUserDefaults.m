@interface NSUserDefaults
@end

@implementation NSUserDefaults

void __73__NSUserDefaults_MTAdditions___applePodcastsFoundationSharedUserDefaults__block_invoke()
{
  id v4 = +[MTConstants sharedContainerURL];
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CB18]) _initWithSuiteName:@"243LU875E5.groups.com.apple.podcasts" container:v4];
  v1 = (void *)_applePodcastsFoundationSharedUserDefaults_defaults;
  _applePodcastsFoundationSharedUserDefaults_defaults = v0;

  v2 = (void *)_applePodcastsFoundationSharedUserDefaults_defaults;
  v3 = +[MTPreferences defaultSettings];
  [v2 registerDefaults:v3];
}

@end