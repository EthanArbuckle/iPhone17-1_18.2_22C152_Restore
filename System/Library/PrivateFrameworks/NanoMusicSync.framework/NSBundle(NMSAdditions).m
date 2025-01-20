@interface NSBundle(NMSAdditions)
+ (id)nanoMusicSyncBundle;
@end

@implementation NSBundle(NMSAdditions)

+ (id)nanoMusicSyncBundle
{
  if (nanoMusicSyncBundle_onceToken != -1) {
    dispatch_once(&nanoMusicSyncBundle_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)nanoMusicSyncBundle___nanoMusicSyncBundle;

  return v0;
}

@end