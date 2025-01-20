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
  v3 = NSString;
  v4 = objc_msgSend(&unk_26F2D28F0, "objectAtIndexedSubscript:", -[MTPodcastDetailEpisodeSection sectionType](self, "sectionType"));
  v5 = [(MTPodcastDetailEpisodeSection *)self episodes];
  v6 = [v3 stringWithFormat:@"Section: %@ (%lu)", v4, objc_msgSend(v5, "count")];

  return (NSString *)v6;
}

- (NSString)title
{
  if (self->_showTitleWithNoEpisodes
    || ([(MTPodcastDetailEpisodeSection *)self episodes],
        v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 count],
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
    id v3 = objc_alloc(MEMORY[0x263EFF260]);
    uint64_t v4 = (void *)[v3 initWithEntityName:*MEMORY[0x263F5EBA0]];
    [v4 setPredicate:self->_predicate];
    [v4 setSortDescriptors:self->_sortDescriptors];
    v5 = [MEMORY[0x263F5E9D0] sharedInstance];
    v6 = [v5 mainQueueContext];

    v7 = (void *)[objc_alloc(MEMORY[0x263F5E9F8]) initWithFetchRequest:v4 managedObjectContext:v6 sectionNameKeyPath:0 cacheName:0];
    v8 = [(id)objc_opt_class() dependentPropertyKeys];
    [v7 setPropertyKeys:v8];

    [v7 setDelegate:self];
    id v12 = 0;
    int v9 = [v7 performFetch:&v12];
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
  v14[20] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263F5EAE8];
  v14[0] = *MEMORY[0x263F5EB78];
  v14[1] = v2;
  uint64_t v3 = *MEMORY[0x263F5EA98];
  v14[2] = *MEMORY[0x263F5EB60];
  v14[3] = v3;
  uint64_t v4 = *MEMORY[0x263F5EAB0];
  v14[4] = *MEMORY[0x263F5EAA0];
  v14[5] = v4;
  uint64_t v5 = *MEMORY[0x263F5EA70];
  v14[6] = *MEMORY[0x263F5EAD8];
  v14[7] = v5;
  uint64_t v6 = *MEMORY[0x263F5EB48];
  v14[8] = *MEMORY[0x263F5EB58];
  v14[9] = v6;
  uint64_t v7 = *MEMORY[0x263F5EA78];
  v14[10] = *MEMORY[0x263F5EAA8];
  v14[11] = v7;
  uint64_t v8 = *MEMORY[0x263F5EAD0];
  v14[12] = *MEMORY[0x263F5EB80];
  v14[13] = v8;
  uint64_t v9 = *MEMORY[0x263F5EAC8];
  v14[14] = *MEMORY[0x263F5EB70];
  v14[15] = v9;
  uint64_t v10 = *MEMORY[0x263F5EB18];
  v14[16] = *MEMORY[0x263F5EAF0];
  v14[17] = v10;
  uint64_t v11 = *MEMORY[0x263F5EA88];
  v14[18] = *MEMORY[0x263F5EB20];
  v14[19] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:20];
  return v12;
}

- (id)episodes
{
  uint64_t v2 = [(MTPodcastDetailEpisodeSection *)self frc];
  uint64_t v3 = [v2 fetchedObjects];

  return v3;
}

- (unint64_t)indexOfEpisode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MTPodcastDetailEpisodeSection *)self frc];
  uint64_t v6 = [v5 indexPathForObject:v4];

  if (v6) {
    unint64_t v7 = [v6 row];
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
    uint64_t v16 = [v13 row];
    if (v15)
    {
LABEL_3:
      uint64_t v17 = [v15 row];
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