@interface MTPodcastPlaylistSettings(NSPredicate)
+ (uint64_t)predicateForPlaylistSettingsUuid:()NSPredicate;
@end

@implementation MTPodcastPlaylistSettings(NSPredicate)

+ (uint64_t)predicateForPlaylistSettingsUuid:()NSPredicate
{
  return [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", *MEMORY[0x263F5EC20], a3];
}

@end