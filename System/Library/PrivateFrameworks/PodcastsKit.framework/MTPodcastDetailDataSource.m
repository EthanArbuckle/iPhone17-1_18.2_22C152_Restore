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
  self->_sections = v4;
  MEMORY[0x270F9A758]();
}

- (id)podcast
{
  if (self->_podcastUuid)
  {
    v3 = [MEMORY[0x263F5E9D0] sharedInstance];
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
  v9[4] = *MEMORY[0x263EF8340];
  v3 = [(MTPodcastDetailDataSource *)self createSectionForUnplayed];
  v9[0] = v3;
  v4 = [(MTPodcastDetailDataSource *)self createSectionForOtherEpisodes];
  v9[1] = v4;
  id v5 = [(MTPodcastDetailDataSource *)self createSectionForEmptyOverlay];
  v9[2] = v5;
  v6 = [(MTPodcastDetailDataSource *)self createSectionForPlayedToBeDeleted];
  v9[3] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];

  return v7;
}

- (id)feedSections
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(MTPodcastDetailDataSource *)self createSectionForFeed];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)savedSections
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(MTPodcastDetailDataSource *)self createSectionForIsFromiTunesSync];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (unint64_t)indexForSection:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPodcastDetailDataSource *)self sections];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
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
    id v19 = [MEMORY[0x263F5E9A8] sharedLogger];
    [v19 logFile:"/Library/Caches/com.apple.xbs/Sources/Marmoset_PodcastsKit/Source/Classes/ViewControllers/PodcastsTab/PodcastDetail/MTPodcastDetailDataSource.m", 145, @"Observed change for object %@ in section %@ but can't find the section index", v12, v13 lineNumber format];
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
      uint64_t v16 = [MEMORY[0x263F088C8] indexPathForRow:a5 inSection:v14];
    }
    id v19 = (id)v16;
    if (a7 == -1)
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = [MEMORY[0x263F088C8] indexPathForRow:a7 inSection:v15];
    }
    v18 = [(MTPodcastDetailDataSource *)self delegate];
    [v18 episodeSection:v13 didChangeObject:v12 atIndexPath:v19 forChangeType:a6 newIndexPath:v17];

    id v12 = v18;
    id v13 = (id)v17;
  }
}

+ (id)sortDescriptorsForPodcastUuid:(id)a3
{
  v3 = (void *)MEMORY[0x263F5E9D0];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  unint64_t v6 = [v5 mainQueueContext];

  v7 = [v6 podcastForUuid:v4];

  if (v7)
  {
    v8 = [v7 sortDescriptorsForSortOrder];
  }
  else
  {
    v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (id)createSectionForUnplayed
{
  v3 = [MEMORY[0x263F5E9D0] sharedInstance];
  id v4 = [v3 mainQueueContext];

  id v5 = [(MTPodcastDetailDataSource *)self podcastUuid];
  unint64_t v6 = [v4 podcastForUuid:v5];

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
  v3 = [MEMORY[0x263F5E9D0] sharedInstance];
  id v4 = [v3 mainQueueContext];

  id v5 = [(MTPodcastDetailDataSource *)self podcastUuid];
  unint64_t v6 = [v4 podcastForUuid:v5];

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

  id v12 = [MEMORY[0x263F086E0] mainBundle];
  id v13 = [v12 localizedStringForKey:@"OTHER_EPISODES_SECTION" value:&stru_26F2CCBC8 table:0];
  [v7 setTitle:v13];

  [v7 setSectionType:3];
  [v7 setDelegate:self];
  [v7 loadData];

  return v7;
}

- (id)createSectionForEmptyOverlay
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x263F08A98] predicateWithValue:0];
  [v2 setPredicate:v3];

  [v2 setSortDescriptors:MEMORY[0x263EFFA68]];
  [v2 setSectionType:8];
  return v2;
}

- (id)createSectionForDarkPlacard
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x263F08A98] predicateWithValue:0];
  [v2 setPredicate:v3];

  [v2 setSortDescriptors:MEMORY[0x263EFFA68]];
  [v2 setSectionType:10];
  return v2;
}

- (id)createSectionForPlayedToBeDeleted
{
  v3 = [MEMORY[0x263F5E9D0] sharedInstance];
  id v4 = [v3 mainQueueContext];

  id v5 = [(MTPodcastDetailDataSource *)self podcastUuid];
  unint64_t v6 = [v4 podcastForUuid:v5];

  v7 = objc_opt_new();
  v8 = [(id)objc_opt_class() predicateForPodcast:v6 sectionType:4];
  [v7 setPredicate:v8];

  objc_super v9 = objc_opt_class();
  v10 = [(MTPodcastDetailDataSource *)self podcastUuid];
  v11 = [v9 sortDescriptorsForPodcastUuid:v10];
  [v7 setSortDescriptors:v11];

  id v12 = [MEMORY[0x263F086E0] mainBundle];
  id v13 = [v12 localizedStringForKey:@"Played Episodes to be Deleted" value:&stru_26F2CCBC8 table:0];
  [v7 setTitle:v13];

  [v7 setSectionType:4];
  [v7 setDelegate:self];
  [v7 loadData];

  return v7;
}

- (id)createSectionForIsFromiTunesSync
{
  v3 = [MEMORY[0x263F5E9D0] sharedInstance];
  id v4 = [v3 mainQueueContext];

  id v5 = [(MTPodcastDetailDataSource *)self podcastUuid];
  unint64_t v6 = [v4 podcastForUuid:v5];

  v7 = objc_opt_new();
  v8 = [(id)objc_opt_class() predicateForPodcast:v6 sectionType:7];
  [v7 setPredicate:v8];

  objc_super v9 = objc_opt_class();
  v10 = [(MTPodcastDetailDataSource *)self podcastUuid];
  v11 = [v9 sortDescriptorsForPodcastUuid:v10];
  [v7 setSortDescriptors:v11];

  id v12 = [MEMORY[0x263F086E0] mainBundle];
  id v13 = [v12 localizedStringForKey:@"From Your Computer" value:&stru_26F2CCBC8 table:0];
  [v7 setTitle:v13];

  [v7 setSectionType:7];
  [v7 setDelegate:self];
  [v7 loadData];

  return v7;
}

- (id)createSectionForFeed
{
  v3 = [MEMORY[0x263F5E9D0] sharedInstance];
  id v4 = [v3 mainQueueContext];

  id v5 = [(MTPodcastDetailDataSource *)self podcastUuid];
  unint64_t v6 = [v4 podcastForUuid:v5];

  v7 = objc_opt_new();
  v8 = [(id)objc_opt_class() predicateForPodcast:v6 sectionType:6];
  if (self->_showOnlyRssContent)
  {
    objc_super v9 = [MEMORY[0x263F5E9E0] predicateForRSSEpisodes];
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
  unint64_t v6 = 0;
  uint64_t v7 = [v5 deletePlayedEpisodesResolvedValue];
  switch(a4)
  {
    case 1uLL:
      v8 = (void *)MEMORY[0x263F5E9E0];
      objc_super v9 = [v5 uuid];
      uint64_t v10 = [v8 predicateForEpisodesOnPodcastUuid:v9 deletePlayedEpisodes:v7];
      goto LABEL_13;
    case 3uLL:
      v11 = (void *)MEMORY[0x263F5E9E0];
      id v12 = [v5 uuid];
      objc_super v9 = [v11 predicateForEpisodesOnPodcastUuid:v12 deletePlayedEpisodes:v7];

      id v13 = (void *)MEMORY[0x263F5E9E0];
      unint64_t v14 = [v5 uuid];
      unint64_t v6 = [v13 predicateForOtherEpisodesOnPodcastUuid:v14 baseEpisodesPredicate:v9 deletePlayedEpisodes:v7];

      goto LABEL_14;
    case 4uLL:
      unint64_t v15 = (void *)MEMORY[0x263F5E9E0];
      objc_super v9 = [v5 uuid];
      uint64_t v10 = [v15 predicateForRecentlyPlayedEpisodesToBeDeletedOnPodcastUuid:v9 deletePlayedEpisodes:v7];
      goto LABEL_13;
    case 6uLL:
      uint64_t v16 = (void *)MEMORY[0x263F5E9E0];
      objc_super v9 = [v5 uuid];
      uint64_t v10 = [v16 predicateForEpisodesInFeedForPodcastUuid:v9];
      goto LABEL_13;
    case 7uLL:
      uint64_t v17 = (void *)MEMORY[0x263F5E9E0];
      objc_super v9 = [v5 uuid];
      uint64_t v10 = [v17 predicateForEpisodesIsFromiTunesSyncOnPodcastUuid:v9];
      goto LABEL_13;
    case 9uLL:
      v18 = (void *)MEMORY[0x263F5E9E0];
      objc_super v9 = [v5 uuid];
      uint64_t v10 = [v18 predicateForUserEpisodesOnPodcastUuid:v9 episodeLimit:0 deletePlayedEpisodes:v7 limitToDownloadBehaviorAutomatic:0];
      goto LABEL_13;
    case 0xBuLL:
      objc_super v9 = [v5 nextEpisodeUuid];
      if (v9) {
        [MEMORY[0x263F5E9E0] predicateForEpisodeUuid:v9];
      }
      else {
      uint64_t v10 = [MEMORY[0x263F08A98] falsePredicate];
      }
LABEL_13:
      unint64_t v6 = (void *)v10;
      goto LABEL_14;
    case 0xCuLL:
      id v19 = (void *)MEMORY[0x263F5E9E0];
      objc_super v9 = [v5 uuid];
      v20 = [v19 predicateForAllEpisodesOnPodcastUuid:v9];
      v21 = [MEMORY[0x263F5E9E0] predicateForVisuallyPlayed:0];
      unint64_t v6 = [v20 AND:v21];

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