@interface MTPlaylistIncludeAllProcessor
- (id)entityName;
- (id)predicate;
- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5;
@end

@implementation MTPlaylistIncludeAllProcessor

- (id)predicate
{
  return +[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts];
}

- (id)entityName
{
  return kMTPodcastEntityName;
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  if (objc_msgSend(a4, "count", a3))
  {
    [(MTBaseProcessor *)self results:&stru_1005507D8];
  }
}

@end