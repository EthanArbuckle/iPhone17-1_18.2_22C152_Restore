@interface MTPodcastDetailEpisodeSection
+ (id)dependentPropertyKeys;
- (BOOL)showTitleWithNoEpisodes;
- (MTFetchedResultsControllerProtocol)frc;
- (MTPodcastDetailEpisodeSectionDelegate)delegate;
- (NSArray)sortDescriptors;
- (NSPredicate)predicate;
- (NSString)description;
- (NSString)title;
- (id)episodes;
- (unint64_t)indexOfEpisode:(id)a3;
- (unint64_t)sectionType;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)controllerWillChangeContent:(id)a3;
- (void)initializeFrc;
- (void)setDelegate:(id)a3;
- (void)setFrc:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setSectionType:(unint64_t)a3;
- (void)setShowTitleWithNoEpisodes:(BOOL)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTPodcastDetailEpisodeSection

- (NSString)description
{
  v3 = [&off_10057ADF8 objectAtIndexedSubscript:[self sectionType]];
  v4 = [(MTPodcastDetailEpisodeSection *)self episodes];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Section: %@ (%lu)", v3, [v4 count]);

  return (NSString *)v5;
}

- (NSString)title
{
  if (self->_showTitleWithNoEpisodes
    || ([(MTPodcastDetailEpisodeSection *)self episodes],
        v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 count],
        v3,
        v4))
  {
    v5 = self->_title;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setPredicate:(id)a3
{
}

- (void)setSortDescriptors:(id)a3
{
}

- (void)initializeFrc
{
  if (!self->_frc)
  {
    id v3 = objc_alloc((Class)NSFetchRequest);
    id v4 = [v3 initWithEntityName:kMTEpisodeEntityName];
    [v4 setPredicate:self->_predicate];
    [v4 setSortDescriptors:self->_sortDescriptors];
    v5 = +[MTDB sharedInstance];
    v6 = [v5 mainQueueContext];

    id v7 = [objc_alloc((Class)MTFetchedResultsController) initWithFetchRequest:v4 managedObjectContext:v6 sectionNameKeyPath:0 cacheName:0];
    v8 = [(id)objc_opt_class() dependentPropertyKeys];
    [v7 setPropertyKeys:v8];

    [v7 setDelegate:self];
    id v12 = 0;
    unsigned int v9 = [v7 performFetch:&v12];
    id v10 = v12;
    v11 = v10;
    if (v9) {
      [(MTPodcastDetailEpisodeSection *)self setFrc:v7];
    }
    else {
      [v10 logAndThrow:1];
    }
  }
}

+ (id)dependentPropertyKeys
{
  v4[0] = kEpisodeUuid;
  v4[1] = kEpisodeGuid;
  v4[2] = kEpisodeTitle;
  v4[3] = kEpisodeCleanedTitle;
  v4[4] = kEpisodeDescription;
  v4[5] = kEpisodeEnclosureUrl;
  v4[6] = kEpisodeFeedDeleted;
  v4[7] = kEpisodeAssetURL;
  v4[8] = kEpisodeSuppressAutoDownload;
  v4[9] = kEpisodePubDate;
  v4[10] = kEpisodeDuration;
  v4[11] = kEpisodeAudio;
  v4[12] = kEpisodeVideo;
  v4[13] = kEpisodeExternalType;
  v4[14] = kEpisodeUti;
  v4[15] = kEpisodeExplicit;
  v4[16] = kEpisodeIsFromiTunesSync;
  v4[17] = kEpisodePlayState;
  v4[18] = kEpisodePlayStateManuallySet;
  v4[19] = kEpisodeBackCatalog;
  v2 = +[NSArray arrayWithObjects:v4 count:20];

  return v2;
}

- (id)episodes
{
  v2 = [(MTPodcastDetailEpisodeSection *)self frc];
  id v3 = [v2 fetchedObjects];

  return v3;
}

- (unint64_t)indexOfEpisode:(id)a3
{
  id v4 = a3;
  v5 = [(MTPodcastDetailEpisodeSection *)self frc];
  v6 = [v5 indexPathForObject:v4];

  if (v6) {
    unint64_t v7 = (unint64_t)[v6 row];
  }
  else {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v19 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v15 = v14;
  if (v13)
  {
    uint64_t v16 = (uint64_t)[v13 row];
    if (v15)
    {
LABEL_3:
      uint64_t v17 = (uint64_t)[v15 row];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v16 = -1;
    if (v14) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = -1;
LABEL_6:
  v18 = [(MTPodcastDetailEpisodeSection *)self delegate];
  [v18 episodeSection:self didChangeObject:v12 atIndex:v16 forChangeType:a6 newIndex:v17];
}

- (void)controllerWillChangeContent:(id)a3
{
  id v4 = [(MTPodcastDetailEpisodeSection *)self delegate];
  [v4 sectionWillChangeContent:self];
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = [(MTPodcastDetailEpisodeSection *)self delegate];
  [v4 sectionDidChangeContent:self];
}

- (void)setTitle:(id)a3
{
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void)setSectionType:(unint64_t)a3
{
  self->_sectionType = a3;
}

- (BOOL)showTitleWithNoEpisodes
{
  return self->_showTitleWithNoEpisodes;
}

- (void)setShowTitleWithNoEpisodes:(BOOL)a3
{
  self->_showTitleWithNoEpisodes = a3;
}

- (MTPodcastDetailEpisodeSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTPodcastDetailEpisodeSectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTFetchedResultsControllerProtocol)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frc, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end