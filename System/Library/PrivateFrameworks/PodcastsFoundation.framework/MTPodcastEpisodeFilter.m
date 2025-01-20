@interface MTPodcastEpisodeFilter
+ (int64_t)playStateFilterFromExcludePlayed:(BOOL)a3;
- (BOOL)excludeGhostEpisodes;
- (BOOL)excludeUnentitled;
- (BOOL)restrictToUserEpisodes;
- (MTPodcastEpisodeFilter)init;
- (NSString)excludingEpisodeUuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)filterExcludingPlayed;
- (id)predicateForPodcast:(id)a3;
- (int64_t)episodeTypeFilter;
- (int64_t)excludeExplicit;
- (int64_t)playStateFilter;
- (void)setEpisodeTypeFilter:(int64_t)a3;
- (void)setExcludeExplicit:(int64_t)a3;
- (void)setExcludeGhostEpisodes:(BOOL)a3;
- (void)setExcludeUnentitled:(BOOL)a3;
- (void)setExcludingEpisodeUuid:(id)a3;
- (void)setPlayStateFilter:(int64_t)a3;
- (void)setRestrictToUserEpisodes:(BOOL)a3;
@end

@implementation MTPodcastEpisodeFilter

- (MTPodcastEpisodeFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTPodcastEpisodeFilter;
  v2 = [(MTPodcastEpisodeFilter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_excludeUnentitled = 0;
    v2->_restrictToUserEpisodes = 0;
    v2->_playStateFilter = 0;
    v2->_excludeExplicit = 0;
    excludingEpisodeUuid = v2->_excludingEpisodeUuid;
    v2->_episodeTypeFilter = 0;
    v2->_excludingEpisodeUuid = 0;

    v3->_excludeGhostEpisodes = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  [v4 setPlayStateFilter:self->_playStateFilter];
  [v4 setExcludeExplicit:self->_excludeExplicit];
  [v4 setEpisodeTypeFilter:self->_episodeTypeFilter];
  [v4 setExcludeUnentitled:self->_excludeUnentitled];
  [v4 setRestrictToUserEpisodes:self->_restrictToUserEpisodes];
  v5 = (void *)[(NSString *)self->_excludingEpisodeUuid copy];
  [v4 setExcludingEpisodeUuid:v5];

  [v4 setExcludeGhostEpisodes:self->_excludeGhostEpisodes];
  return v4;
}

+ (int64_t)playStateFilterFromExcludePlayed:(BOOL)a3
{
  return a3;
}

- (id)filterExcludingPlayed
{
  v2 = (void *)[(MTPodcastEpisodeFilter *)self copy];
  objc_msgSend(v2, "setPlayStateFilter:", +[MTPodcastEpisodeFilter playStateFilterFromExcludePlayed:](MTPodcastEpisodeFilter, "playStateFilterFromExcludePlayed:", 1));
  return v2;
}

- (id)predicateForPodcast:(id)a3
{
  id v4 = a3;
  v5 = [v4 uuid];
  objc_super v6 = objc_opt_new();
  v7 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v5];
  [v6 addObject:v7];

  if ([(MTPodcastEpisodeFilter *)self restrictToUserEpisodes])
  {
    v8 = +[MTEpisode predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:](MTEpisode, "predicateForUserEpisodesOnPodcastUuid:episodeLimit:deletePlayedEpisodes:limitToDownloadBehaviorAutomatic:", v5, 0, [v4 deletePlayedEpisodesResolvedValue], 0);
    [v6 addObject:v8];
  }
  int64_t v9 = [(MTPodcastEpisodeFilter *)self playStateFilter];
  if (v9 == 2 || [(MTPodcastEpisodeFilter *)self playStateFilter] == 1)
  {
    v10 = +[MTEpisode predicateForVisuallyPlayed:v9 == 2];
    [v6 addObject:v10];
  }
  v11 = [(MTPodcastEpisodeFilter *)self excludingEpisodeUuid];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [(MTPodcastEpisodeFilter *)self excludingEpisodeUuid];
    v14 = +[MTEpisode predicateForEpisodeUuid:v13];

    v15 = [MEMORY[0x1E4F28BA0] notPredicateWithSubpredicate:v14];
    [v6 addObject:v15];
  }
  if ([(MTPodcastEpisodeFilter *)self episodeTypeFilter])
  {
    v16 = +[MTEpisode predicateForEpisodeTypeFilter:[(MTPodcastEpisodeFilter *)self episodeTypeFilter]];
    [v6 addObject:v16];
  }
  if (+[PFClientUtil isPodcastsApp]
    && ([(MTPodcastEpisodeFilter *)self excludeExplicit] == 1
     || ![(MTPodcastEpisodeFilter *)self excludeExplicit]
     && !+[PFRestrictionsController isExplicitContentAllowed]))
  {
    if ([v4 isExplicit])
    {
      uint64_t v17 = [MEMORY[0x1E4F28F60] falsePredicate];
      goto LABEL_23;
    }
    v18 = +[MTEpisode predicateForExplicit:0];
    [v6 addObject:v18];
  }
  if ([(MTPodcastEpisodeFilter *)self excludeUnentitled])
  {
    v19 = +[MTEpisode predicateForEntitledEpisodes];
    [v6 addObject:v19];
  }
  if ([(MTPodcastEpisodeFilter *)self excludeGhostEpisodes])
  {
    v20 = +[MTEpisode predicateForHasNonEmptyEnclosureURL];
    [v6 addObject:v20];
  }
  uint64_t v17 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v6];
LABEL_23:
  v21 = (void *)v17;

  return v21;
}

- (int64_t)playStateFilter
{
  return self->_playStateFilter;
}

- (void)setPlayStateFilter:(int64_t)a3
{
  self->_playStateFilter = a3;
}

- (int64_t)excludeExplicit
{
  return self->_excludeExplicit;
}

- (void)setExcludeExplicit:(int64_t)a3
{
  self->_excludeExplicit = a3;
}

- (int64_t)episodeTypeFilter
{
  return self->_episodeTypeFilter;
}

- (void)setEpisodeTypeFilter:(int64_t)a3
{
  self->_episodeTypeFilter = a3;
}

- (BOOL)excludeUnentitled
{
  return self->_excludeUnentitled;
}

- (void)setExcludeUnentitled:(BOOL)a3
{
  self->_excludeUnentitled = a3;
}

- (BOOL)excludeGhostEpisodes
{
  return self->_excludeGhostEpisodes;
}

- (void)setExcludeGhostEpisodes:(BOOL)a3
{
  self->_excludeGhostEpisodes = a3;
}

- (BOOL)restrictToUserEpisodes
{
  return self->_restrictToUserEpisodes;
}

- (void)setRestrictToUserEpisodes:(BOOL)a3
{
  self->_restrictToUserEpisodes = a3;
}

- (NSString)excludingEpisodeUuid
{
  return self->_excludingEpisodeUuid;
}

- (void)setExcludingEpisodeUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end