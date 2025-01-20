@interface NMSPathUtil
+ (id)_nanoMusicSyncDirectory;
+ (id)mediaSyncInfoDirectory;
+ (id)musicBackupDirectory;
+ (id)podcastsDirectory;
+ (id)recentMusicDirectory;
@end

@implementation NMSPathUtil

+ (id)mediaSyncInfoDirectory
{
  v2 = [a1 _nanoMusicSyncDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"MediaSyncInfo"];

  return v3;
}

+ (id)podcastsDirectory
{
  v2 = [a1 _nanoMusicSyncDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"Podcasts"];

  return v3;
}

+ (id)recentMusicDirectory
{
  v2 = [a1 _nanoMusicSyncDirectory];
  v3 = [NSString pathWithComponents:&unk_26D51CE00];
  v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

+ (id)musicBackupDirectory
{
  v2 = [a1 _nanoMusicSyncDirectory];
  v3 = [NSString pathWithComponents:&unk_26D51CE18];
  v4 = [v2 stringByAppendingPathComponent:v3];

  return v4;
}

+ (id)_nanoMusicSyncDirectory
{
  if (_nanoMusicSyncDirectory_onceToken != -1) {
    dispatch_once(&_nanoMusicSyncDirectory_onceToken, &__block_literal_global);
  }
  v2 = (void *)_nanoMusicSyncDirectory_path;

  return v2;
}

void __38__NMSPathUtil__nanoMusicSyncDirectory__block_invoke()
{
  v4[3] = *MEMORY[0x263EF8340];
  v0 = NSString;
  v4[0] = CPSharedResourcesDirectory();
  v4[1] = @"Library";
  v4[2] = @"NanoMusicSync";
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  uint64_t v2 = [v0 pathWithComponents:v1];
  v3 = (void *)_nanoMusicSyncDirectory_path;
  _nanoMusicSyncDirectory_path = v2;
}

@end