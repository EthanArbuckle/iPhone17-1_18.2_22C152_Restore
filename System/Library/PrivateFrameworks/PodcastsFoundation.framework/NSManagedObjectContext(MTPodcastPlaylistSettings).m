@interface NSManagedObjectContext(MTPodcastPlaylistSettings)
- (uint64_t)podcastPlaylistSettingsForUuid:()MTPodcastPlaylistSettings;
@end

@implementation NSManagedObjectContext(MTPodcastPlaylistSettings)

- (uint64_t)podcastPlaylistSettingsForUuid:()MTPodcastPlaylistSettings
{
  return [a1 objectForUuid:a3 entityName:@"MTPodcastPlaylistSettings"];
}

@end