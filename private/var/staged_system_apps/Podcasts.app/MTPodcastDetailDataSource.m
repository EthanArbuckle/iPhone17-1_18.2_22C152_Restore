@interface MTPodcastDetailDataSource
+ (id)predicateForPodcast:(id)a3 sectionType:(unint64_t)a4;
+ (id)sortDescriptorsForPodcastUuid:(id)a3;
- (BOOL)showOnlyRssContent;
- (MTPodcastDetailDataSource)initWithPodcastUuid:(id)a3;
- (MTPodcastDetailDataSourceDelegate)delegate;
- (NSArray)sections;
- (NSString)podcastUuid;
- (id)createSectionForDarkPlacard;
- (id)createSectionForEmptyOverlay;
- (id)createSectionForFeed;
- (id)createSectionForIsFromiTunesSync;
- (id)createSectionForOtherEpisodes;
- (id)createSectionForPlayedToBeDeleted;
- (id)createSectionForUnplayed;
- (id)feedSections;
- (id)podcast;
- (id)savedSections;
- (id)unplayedSections;
- (unint64_t)indexForSection:(id)a3;
- (unint64_t)selectedTab;
- (void)episodeSection:(id)a3 didChangeObject:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6 newIndex:(unint64_t)a7;
- (void)reloadData;
- (void)sectionDidChangeContent:(id)a3;
- (void)sectionWillChangeContent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedTab:(unint64_t)a3;
- (void)setShowOnlyRssContent:(BOOL)a3;
@end

@implementation MTPodcastDetailDataSource

- (MTPodcastDetailDataSource)initWithPodcastUuid:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTPodcastDetailDataSource;
  v6 = [(MTPodcastDetailDataSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_podcastUuid, a3);
    v7->_showOnlyRssContent = 0;
  }

  return v7;
}

- (void)setSelectedTab:(unint64_t)a3
{
  if (self->_selectedTab != a3 || !self->_sections)
  {
    self->_selectedTab = a3;
    [(MTPodcastDetailDataSource *)self reloadData];
  }
}

- (void)setShowOnlyRssContent:(BOOL)a3
{
  self->_showOnlyRssContent = a3;
}

- (void)reloadData
{
  unint64_t selectedTab = self->_selectedTab;
  if (selectedTab == 2)
  {
    v4 = [(MTPodcastDetailDataSource *)self savedSections];
  }
  else if (selectedTab == 1)
  {
    v4 = [(MTPodcastDetailDataSource *)self feedSections];
  }
  else if (selectedTab)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(MTPodcastDetailDataSource *)self unplayedSections];
  }
  sections = self->_sections;
  self->_sections = v4;

  _objc_release_x1(v4, sections);
}

- (id)podcast
{
  if (self->_podcastUuid)
  {
    v3 = +[MTDB sharedInstance];
    v4 = [v3 mainQueueContext];
    id v5 = [v4 podcastForUuid:self->_podcastUuid];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)unplayedSections
{
  v3 = [(MTPodcastDetailDataSource *)self createSectionForUnplayed];
  v9[0] = v3;
  v4 = [(MTPodcastDetailDataSource *)self createSectionForOtherEpisodes];
  v9[1] = v4;
  id v5 = [(MTPodcastDetailDataSource *)self createSectionForEmptyOverlay];
  v9[2] = v5;
  v6 = [(MTPodcastDetailDataSource *)self createSectionForPlayedToBeDeleted];
  v9[3] = v6;
  v7 = +[NSArray arrayWithObjects:v9 count:4];

  return v7;
}

- (id)feedSections
{
  v2 = [(MTPodcastDetailDataSource *)self createSectionForFeed];
  id v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)savedSections
{
  v2 = [(MTPodcastDetailDataSource *)self createSectionForIsFromiTunesSync];
  id v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (unint64_t)indexForSection:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPodcastDetailDataSource *)self sections];
  id v6 = [v5 indexOfObject:v4];

  return (unint64_t)v6;
}

- (void)sectionWillChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPodcastDetailDataSource *)self delegate];
  [v5 sectionWillChangeContent:v4];
}

- (void)sectionDidChangeContent:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPodcastDetailDataSource *)self delegate];
  [v5 sectionDidChangeContent:v4];
}

- (void)episodeSection:(id)a3 didChangeObject:(id)a4 atIndex:(unint64_t)a5 forChangeType:(unint64_t)a6 newIndex:(unint64_t)a7
{
  id v12 = a4;
  id v13 = a3;
  unint64_t v14 = [(MTPodcastDetailDataSource *)self indexForSection:v13];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = +[IMLogger sharedLogger];
    [v19 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Classes/ViewControllers/PodcastsTab/PodcastDetail/MTPodcastDetailDataSource.m", 145, @"Observed change for object %@ in section %@ but can't find the section index", v12, v13 lineNumber format];
  }
  else
  {
    unint64_t v15 = v14;
    if (a5 == -1)
    {
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = +[NSIndexPath indexPathForRow:a5 inSection:v14];
    }
    id v19 = (id)v16;
    if (a7 == -1)
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = +[NSIndexPath indexPathForRow:a7 inSection:v15];
    }
    v18 = [(MTPodcastDetailDataSource *)self delegate];
    [v18 episodeSection:v13 didChangeObject:v12 atIndexPath:v19 forChangeType:a6 newIndexPath:v17];

    id v12 = v18;
    id v13 = (id)v17;
  }
}

+ (id)sortDescriptorsForPodcastUuid:(id)a3
{
  id v3 = a3;
  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 mainQueueContext];

  id v6 = [v5 podcastForUuid:v3];

  if (v6)
  {
    v7 = [v6 sortDescriptorsForSortOrder];
  }
  else
  {
    v7 = &__NSArray0__struct;
  }

  return v7;
}

- (id)createSectionForUnplayed
{
  id v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainQueueContext];

  id v5 = [(MTPodcastDetailDataSource *)self podcastUuid];
  id v6 = [v4 podcastForUuid:v5];

  v7 = objc_opt_new();
  v8 = objc_opt_class();
  objc_super v9 = [(MTPodcastDetailDataSource *)self podcastUuid];
  v10 = [v8 sortDescriptorsForPodcastUuid:v9];
  [v7 setSortDescriptors:v10];

  [v7 setSectionType:1];
  v11 = [(id)objc_opt_class() predicateForPodcast:v6 sectionType:1];
  [v7 setPredicate:v11];

  [v7 setDelegate:self];
  [v7 loadData];

  return v7;
}

- (id)createSectionForOtherEpisodes
{
  id v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainQueueContext];

  id v5 = [(MTPodcastDetailDataSource *)self podcastUuid];
  id v6 = [v4 podcastForUuid:v5];

  v7 = objc_opt_new();
  if (v6)
  {
    v8 = [(id)objc_opt_class() predicateForPodcast:v6 sectionType:3];
    [v7 setPredicate:v8];
  }
  objc_super v9 = objc_opt_class();
  v10 = [(MTPodcastDetailDataSource *)self podcastUuid];
  v11 = [v9 sortDescriptorsForPodcastUuid:v10];
  [v7 setSortDescriptors:v11];

  id v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"OTHER_EPISODES_SECTION" value:&stru_10056A8A0 table:0];
  [v7 setTitle:v13];

  [v7 setSectionType:3];
  [v7 setDelegate:self];
  [v7 loadData];

  return v7;
}

- (id)createSectionForEmptyOverlay
{
  v2 = objc_opt_new();
  id v3 = +[NSPredicate predicateWithValue:0];
  [v2 setPredicate:v3];

  [v2 setSortDescriptors:&__NSArray0__struct];
  [v2 setSectionType:8];

  return v2;
}

- (id)createSectionForDarkPlacard
{
  v2 = objc_opt_new();
  id v3 = +[NSPredicate predicateWithValue:0];
  [v2 setPredicate:v3];

  [v2 setSortDescriptors:&__NSArray0__struct];
  [v2 setSectionType:10];

  return v2;
}

- (id)createSectionForPlayedToBeDeleted
{
  id v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainQueueContext];

  id v5 = [(MTPodcastDetailDataSource *)self podcastUuid];
  id v6 = [v4 podcastForUuid:v5];

  v7 = objc_opt_new();
  v8 = [(id)objc_opt_class() predicateForPodcast:v6 sectionType:4];
  [v7 setPredicate:v8];

  objc_super v9 = objc_opt_class();
  v10 = [(MTPodcastDetailDataSource *)self podcastUuid];
  v11 = [v9 sortDescriptorsForPodcastUuid:v10];
  [v7 setSortDescriptors:v11];

  id v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"Played Episodes to be Deleted" value:&stru_10056A8A0 table:0];
  [v7 setTitle:v13];

  [v7 setSectionType:4];
  [v7 setDelegate:self];
  [v7 loadData];

  return v7;
}

- (id)createSectionForIsFromiTunesSync
{
  id v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainQueueContext];

  id v5 = [(MTPodcastDetailDataSource *)self podcastUuid];
  id v6 = [v4 podcastForUuid:v5];

  v7 = objc_opt_new();
  v8 = [(id)objc_opt_class() predicateForPodcast:v6 sectionType:7];
  [v7 setPredicate:v8];

  objc_super v9 = objc_opt_class();
  v10 = [(MTPodcastDetailDataSource *)self podcastUuid];
  v11 = [v9 sortDescriptorsForPodcastUuid:v10];
  [v7 setSortDescriptors:v11];

  id v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"From Your Computer" value:&stru_10056A8A0 table:0];
  [v7 setTitle:v13];

  [v7 setSectionType:7];
  [v7 setDelegate:self];
  [v7 loadData];

  return v7;
}

- (id)createSectionForFeed
{
  id v3 = +[MTDB sharedInstance];
  id v4 = [v3 mainQueueContext];

  id v5 = [(MTPodcastDetailDataSource *)self podcastUuid];
  id v6 = [v4 podcastForUuid:v5];

  v7 = objc_opt_new();
  v8 = [(id)objc_opt_class() predicateForPodcast:v6 sectionType:6];
  if (self->_showOnlyRssContent)
  {
    objc_super v9 = +[MTEpisode predicateForRSSEpisodes];
    uint64_t v10 = [v8 AND:v9];

    v8 = (void *)v10;
  }
  [v7 setPredicate:v8];
  v11 = objc_opt_class();
  id v12 = [(MTPodcastDetailDataSource *)self podcastUuid];
  id v13 = [v11 sortDescriptorsForPodcastUuid:v12];
  [v7 setSortDescriptors:v13];

  [v7 setSectionType:6];
  [v7 setTitle:0];
  [v7 setDelegate:self];
  [v7 loadData];

  return v7;
}

+ (id)predicateForPodcast:(id)a3 sectionType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = 0;
  id v7 = [v5 deletePlayedEpisodesResolvedValue];
  switch(a4)
  {
    case 1uLL:
      v8 = [v5 uuid];
      uint64_t v9 = +[MTEpisode predicateForEpisodesOnPodcastUuid:v8 deletePlayedEpisodes:v7];
      goto LABEL_13;
    case 3uLL:
      uint64_t v10 = [v5 uuid];
      v8 = +[MTEpisode predicateForEpisodesOnPodcastUuid:v10 deletePlayedEpisodes:v7];

      v11 = [v5 uuid];
      id v6 = +[MTEpisode predicateForOtherEpisodesOnPodcastUuid:v11 baseEpisodesPredicate:v8 deletePlayedEpisodes:v7];

      goto LABEL_14;
    case 4uLL:
      v8 = [v5 uuid];
      uint64_t v9 = +[MTEpisode predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:v8 deletePlayedEpisodes:v7];
      goto LABEL_13;
    case 6uLL:
      v8 = [v5 uuid];
      uint64_t v9 = +[MTEpisode predicateForEpisodesInFeedForPodcastUuid:v8];
      goto LABEL_13;
    case 7uLL:
      v8 = [v5 uuid];
      uint64_t v9 = +[MTEpisode predicateForEpisodesIsFromiTunesSyncOnPodcastUuid:v8];
      goto LABEL_13;
    case 9uLL:
      v8 = [v5 uuid];
      uint64_t v9 = +[MTEpisode predicateForUserEpisodesOnPodcastUuid:v8 episodeLimit:0 deletePlayedEpisodes:v7 limitToDownloadBehaviorAutomatic:0];
      goto LABEL_13;
    case 0xBuLL:
      v8 = [v5 nextEpisodeUuid];
      if (v8) {
        +[MTEpisode predicateForEpisodeUuid:v8];
      }
      else {
      uint64_t v9 = +[NSPredicate falsePredicate];
      }
LABEL_13:
      id v6 = (void *)v9;
      goto LABEL_14;
    case 0xCuLL:
      v8 = [v5 uuid];
      id v12 = +[MTEpisode predicateForAllEpisodesOnPodcastUuid:v8];
      id v13 = +[MTEpisode predicateForVisuallyPlayed:0];
      id v6 = [v12 AND:v13];

LABEL_14:
      break;
    default:
      break;
  }

  return v6;
}

- (NSString)podcastUuid
{
  return self->_podcastUuid;
}

- (MTPodcastDetailDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTPodcastDetailDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)selectedTab
{
  return self->_selectedTab;
}

- (BOOL)showOnlyRssContent
{
  return self->_showOnlyRssContent;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_podcastUuid, 0);
}

@end