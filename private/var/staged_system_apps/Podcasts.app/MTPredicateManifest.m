@interface MTPredicateManifest
- (BOOL)hasFRCChanges;
- (BOOL)needsFrozenCheck;
- (BOOL)preserveOriginalEpisodeOrdering;
- (BOOL)resultsAreFrozen;
- (MTAllPropertyChangesQueryObserver)allPropertyChangeObserver;
- (MTIndexPathShifter)indexPathShifter;
- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3;
- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3 fetchRequest:(id)a4;
- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3 predicateToTrack:(id)a4 sortDescriptors:(id)a5;
- (MTResultsChangeGenerator)changeGenerator;
- (NSArray)explicitSortOrder;
- (NSArray)sortDescriptors;
- (NSFetchRequest)fetchRequest;
- (NSFetchedResultsController)frc;
- (NSPredicate)predicate;
- (id)_augmentPredicate:(id)a3;
- (id)_currentEpisodeUuid;
- (void)_frcDidChangeResults:(id)a3 uuidToManagedObjectIDMap:(id)a4;
- (void)_freezeContentIfNeeded;
- (void)_load:(id)a3;
- (void)_observeAllPropertyChangesForEntityName:(id)a3 predicate:(id)a4;
- (void)_refetch:(id)a3;
- (void)_restrictionsDidChange;
- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)controllerDidChangeContent:(id)a3;
- (void)dealloc;
- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7;
- (void)setAllPropertyChangeObserver:(id)a3;
- (void)setChangeGenerator:(id)a3;
- (void)setExplicitSortOrder:(id)a3;
- (void)setFetchRequest:(id)a3;
- (void)setFrc:(id)a3;
- (void)setHasFRCChanges:(BOOL)a3;
- (void)setIndexPathShifter:(id)a3;
- (void)setNeedsFrozenCheck:(BOOL)a3;
- (void)setPredicate:(id)a3;
- (void)setPreserveOriginalEpisodeOrdering:(BOOL)a3;
- (void)setResultsAreFrozen:(BOOL)a3;
- (void)setSortDescriptors:(id)a3;
@end

@implementation MTPredicateManifest

- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3
{
  return [(MTPredicateManifest *)self initWithInitialEpisodeUuid:a3 predicateToTrack:0 sortDescriptors:0];
}

- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3 predicateToTrack:(id)a4 sortDescriptors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    v11 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodePubDate ascending:1];
    v19[0] = v11;
    v12 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeEpisodeNumber ascending:1];
    v19[1] = v12;
    v13 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeLevel ascending:0];
    v19[2] = v13;
    v14 = +[NSSortDescriptor sortDescriptorWithKey:kEpisodeTitle ascending:1 selector:"localizedStandardCompare:"];
    v19[3] = v14;
    id v10 = +[NSArray arrayWithObjects:v19 count:4];
  }
  id v15 = objc_alloc((Class)NSFetchRequest);
  id v16 = [v15 initWithEntityName:kMTEpisodeEntityName];
  [v16 setPredicate:v9];
  [v16 setSortDescriptors:v10];
  v17 = [(MTPredicateManifest *)self initWithInitialEpisodeUuid:v8 fetchRequest:v16];

  return v17;
}

- (MTPredicateManifest)initWithInitialEpisodeUuid:(id)a3 fetchRequest:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTPredicateManifest;
  v7 = [(MTBaseEpisodeListManifest *)&v14 initWithInitialEpisodeUuid:a3];
  id v8 = v7;
  if (v7)
  {
    [(MTPredicateManifest *)v7 setFetchRequest:v6];
    id v9 = [v6 predicate];
    [(MTPredicateManifest *)v8 setPredicate:v9];

    [(MTPredicateManifest *)v8 setNeedsFrozenCheck:1];
    id v10 = [[MTResultsChangeGenerator alloc] initWithDelegate:v8];
    [(MTPredicateManifest *)v8 setChangeGenerator:v10];

    v11 = objc_alloc_init(MTIndexPathShifter);
    [(MTPredicateManifest *)v8 setIndexPathShifter:v11];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v8 selector:"_restrictionsDidChange" name:@"PFExplicitContentAllowedDidChangeNotification" object:0];
  }
  return v8;
}

- (void)dealloc
{
  [(MTAllPropertyChangesQueryObserver *)self->_allPropertyChangeObserver stop];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTPredicateManifest;
  [(MTPredicateManifest *)&v4 dealloc];
}

- (void)setSortDescriptors:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPredicateManifest *)self fetchRequest];
  [v5 setSortDescriptors:v4];
}

- (NSArray)sortDescriptors
{
  v2 = [(MTPredicateManifest *)self fetchRequest];
  v3 = [v2 sortDescriptors];

  return (NSArray *)v3;
}

- (void)_restrictionsDidChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100146430;
  v2[3] = &unk_10054D570;
  v2[4] = self;
  +[IMAVPlayer performOnMainQueue:v2];
}

- (void)_load:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001464E8;
  v5[3] = &unk_10054D738;
  id v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)MTPredicateManifest;
  id v3 = v7;
  [(MTPredicateManifest *)&v4 _load:v5];
}

- (void)_refetch:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  if ([(MTPredicateManifest *)self isLoaded])
  {
    kdebug_trace();
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_1001466E4;
    v11 = &unk_10054D738;
    v12 = self;
    v13 = v4;
    dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &v8);
    id v6 = [(MTPredicateManifest *)self frc];
    id v7 = [v6 managedObjectContext];
    [v7 performBlock:v5];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

- (id)_augmentPredicate:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = +[MTEpisode predicateForDownloaded:0 excludeHidden:1];
  id v6 = +[MTEpisode predicateForFeedDeleted:1];
  id v7 = [v5 AND:v6];

  id v8 = +[NSCompoundPredicate notPredicateWithSubpredicate:v7];
  uint64_t v9 = [v4 AND:v8];

  id v10 = [(MTPredicateManifest *)self _currentEpisodeUuid];
  if ([v10 length])
  {
    v11 = +[MTEpisode predicateForEpisodeUuid:v10];
    uint64_t v12 = [v9 OR:v11];

    uint64_t v9 = (void *)v12;
  }
  v13 = +[MTEpisode predicateForPodcastIsNotHidden];
  objc_super v14 = [v9 AND:v13];

  id v15 = +[MTEpisode predicateForExternalType:0];
  id v16 = [v14 AND:v15];

  v17 = [(MTBaseEpisodeListManifest *)self _predicateForFilteringExplicitEpisodes];
  v18 = [v16 AND:v17];

  v19 = +[MTEpisode predicateForEntitledEpisodes];
  v20 = [v18 AND:v19];

  return v20;
}

- (id)_currentEpisodeUuid
{
  id v3 = [(MTPredicateManifest *)self currentItem];
  id v4 = [v3 episodeUuid];

  if (![v4 length])
  {
    uint64_t v5 = [(MTBaseEpisodeListManifest *)self initialEpisodeUuid];

    id v4 = (void *)v5;
  }

  return v4;
}

- (void)_frcDidChangeResults:(id)a3 uuidToManagedObjectIDMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(MTPredicateManifest *)self isLoaded]
    && ![(MTPredicateManifest *)self resultsAreFrozen])
  {
    kdebug_trace();
    if (self->_preserveOriginalEpisodeOrdering)
    {
      id v10 = [(MTPredicateManifest *)self explicitSortOrder];

      if (!v10) {
        objc_storeStrong((id *)&self->_explicitSortOrder, a3);
      }
    }
    v11 = [(MTPredicateManifest *)self explicitSortOrder];

    if (v11)
    {
      uint64_t v12 = +[NSSet setWithArray:v7];
      id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v12, "count"));
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v13 = [(MTPredicateManifest *)self explicitSortOrder];
      id v14 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v37;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v37 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * i);
            if ([v12 containsObject:v18]) {
              [v9 addObject:v18];
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v36 objects:v40 count:16];
        }
        while (v15);
      }

      v19 = [(MTPredicateManifest *)self _currentEpisodeUuid];
      if ([v19 length]
        && ([v9 containsObject:v19] & 1) == 0
        && [v7 containsObject:v19])
      {
        id v20 = [(MTPredicateManifest *)self currentIndex];
        if (v20 <= [v9 count]) {
          id v21 = [(MTPredicateManifest *)self currentIndex];
        }
        else {
          id v21 = 0;
        }
        [v9 insertObject:v19 atIndex:v21];
      }
    }
    else
    {
      id v9 = v7;
    }
    v22 = [(MTBaseEpisodeListManifest *)self episodeUuids];
    unsigned int v23 = [v22 isEqual:v9];

    if (v23)
    {
      kdebug_trace();
      goto LABEL_4;
    }
    v24 = [(MTBaseEpisodeListManifest *)self episodeUuids];
    [(MTBaseEpisodeListManifest *)self setEpisodeUuids:v9];
    [(MTBaseEpisodeListManifest *)self setUuidToManagedObjectIDMap:v8];
    if (![(MTBaseEpisodeListManifest *)self count]
      || [(MTPredicateManifest *)self currentIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_47:
      [(MTPredicateManifest *)self _freezeContentIfNeeded];
      [(MTBaseEpisodeListManifest *)self postManifestDidChangeNotification];
      kdebug_trace();

      goto LABEL_4;
    }
    kdebug_trace();
    v25 = +[NSIndexPath indexPathForRow:[(MTPredicateManifest *)self currentIndex] inSection:0];
    v26 = [(MTPredicateManifest *)self indexPathShifter];
    [v26 setInitialIndexPath:v25];

    v27 = [(MTPredicateManifest *)self changeGenerator];
    [v27 generateChangesForExistingObjects:v24 newObjects:v9 inSection:0];

    v28 = [(MTPredicateManifest *)self indexPathShifter];
    v29 = [v28 shiftedIndexPath];
    unint64_t v30 = (unint64_t)[v29 row];

    if (v30 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_40;
    }
    if ([(MTPredicateManifest *)self currentIndex] != (id)1) {
      goto LABEL_42;
    }
    unint64_t v30 = (unint64_t)[(MTPredicateManifest *)self currentIndex] - 1;
    id v31 = [(MTPredicateManifest *)self currentIndex];
    if (v31 >= [v24 count])
    {
      v32 = 0;
    }
    else
    {
      v32 = [v24 objectAtIndexedSubscript:[self currentIndex]];
    }
    if (v30 >= (unint64_t)[v9 count])
    {
      v33 = 0;
    }
    else
    {
      v33 = [v9 objectAtIndexedSubscript:v30];
    }
    unsigned int v34 = [v32 isEqualToString:v33];

    if (v34)
    {
LABEL_40:
      if ((v30 & 0x8000000000000000) != 0) {
        goto LABEL_45;
      }
    }
    else
    {
LABEL_42:
      unint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v30 < [(MTBaseEpisodeListManifest *)self count])
    {
      v35 = [(MTPredicateManifest *)self currentItem];
      [v35 setManifestIndex:v30];

LABEL_46:
      [(MTPredicateManifest *)self setCurrentIndex:v30];
      kdebug_trace();
      goto LABEL_47;
    }
LABEL_45:
    unint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_46;
  }
  id v9 = v7;
LABEL_4:
}

- (void)_freezeContentIfNeeded
{
  if (![(MTPredicateManifest *)self needsFrozenCheck]) {
    return;
  }
  kdebug_trace();
  [(MTPredicateManifest *)self setNeedsFrozenCheck:0];
  id v3 = [(MTBaseEpisodeListManifest *)self episodeUuids];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 0xC9)
  {
    id v16 = [(MTPredicateManifest *)self _currentEpisodeUuid];
    if ([(MTPredicateManifest *)self currentIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = [(MTBaseEpisodeListManifest *)self episodeUuids];
      id v6 = [(MTPredicateManifest *)self _currentEpisodeUuid];
      uint64_t v7 = (uint64_t)[v5 indexOfObject:v6];
    }
    else
    {
      uint64_t v7 = (uint64_t)[(MTPredicateManifest *)self currentIndex];
    }
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {

      return;
    }
    uint64_t v8 = 50;
    if (v7 > 50) {
      uint64_t v8 = v7;
    }
    uint64_t v9 = v8 - 50;
    id v10 = [(MTBaseEpisodeListManifest *)self episodeUuids];
    v11 = (char *)[v10 count];

    uint64_t v12 = (char *)(v7 + 100);
    if ((unint64_t)v11 < v7 + 100) {
      uint64_t v12 = v11;
    }
    v13 = &v12[-v9];
    id v14 = [(MTBaseEpisodeListManifest *)self episodeUuids];
    id v15 = [v14 subarrayWithRange:v9, v13];

    [(MTBaseEpisodeListManifest *)self setEpisodeUuids:v15];
    -[MTPredicateManifest setCurrentIndex:](self, "setCurrentIndex:", [v15 indexOfObject:v16]);
    self->_resultsAreFrozen = 1;
  }

  kdebug_trace();
}

- (void)_observeAllPropertyChangesForEntityName:(id)a3 predicate:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001473B4;
  v7[3] = &unk_10054E708;
  v7[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  +[IMAVPlayer performOnAvSessionQueue:v7];
}

- (void)generator:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v10 = a7;
  id v11 = a5;
  uint64_t v12 = [(MTPredicateManifest *)self indexPathShifter];
  id v14 = [v12 shiftedIndexPath];

  v13 = [(MTPredicateManifest *)self indexPathShifter];
  [v13 processChangeAtIndexPath:v11 forChangeType:a6 newIndexPath:v10];
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v15 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (a6 - 1 <= 2) {
    [(MTPredicateManifest *)self setHasFRCChanges:1];
  }
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  if ([(MTPredicateManifest *)self hasFRCChanges])
  {
    id v5 = [v4 fetchedObjects];
    id v6 = [v5 valueForKey:kEpisodeUuid];

    uint64_t v7 = [v4 fetchedObjects];
    id v8 = [v7 valueForKey:kObjectID];
    id v9 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v6];

    [(MTPredicateManifest *)self setHasFRCChanges:0];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001477D0;
    v12[3] = &unk_10054E708;
    v12[4] = self;
    id v13 = v6;
    id v14 = v9;
    id v10 = v9;
    id v11 = v6;
    +[IMAVPlayer performOnMainQueue:v12];
  }
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
}

- (NSArray)explicitSortOrder
{
  return self->_explicitSortOrder;
}

- (void)setExplicitSortOrder:(id)a3
{
}

- (BOOL)preserveOriginalEpisodeOrdering
{
  return self->_preserveOriginalEpisodeOrdering;
}

- (void)setPreserveOriginalEpisodeOrdering:(BOOL)a3
{
  self->_preserveOriginalEpisodeOrdering = a3;
}

- (MTAllPropertyChangesQueryObserver)allPropertyChangeObserver
{
  return self->_allPropertyChangeObserver;
}

- (void)setAllPropertyChangeObserver:(id)a3
{
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (NSFetchedResultsController)frc
{
  return self->_frc;
}

- (void)setFrc:(id)a3
{
}

- (MTResultsChangeGenerator)changeGenerator
{
  return self->_changeGenerator;
}

- (void)setChangeGenerator:(id)a3
{
}

- (MTIndexPathShifter)indexPathShifter
{
  return self->_indexPathShifter;
}

- (void)setIndexPathShifter:(id)a3
{
}

- (BOOL)hasFRCChanges
{
  return self->_hasFRCChanges;
}

- (void)setHasFRCChanges:(BOOL)a3
{
  self->_hasFRCChanges = a3;
}

- (BOOL)needsFrozenCheck
{
  return self->_needsFrozenCheck;
}

- (void)setNeedsFrozenCheck:(BOOL)a3
{
  self->_needsFrozenCheck = a3;
}

- (BOOL)resultsAreFrozen
{
  return self->_resultsAreFrozen;
}

- (void)setResultsAreFrozen:(BOOL)a3
{
  self->_resultsAreFrozen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathShifter, 0);
  objc_storeStrong((id *)&self->_changeGenerator, 0);
  objc_storeStrong((id *)&self->_frc, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_allPropertyChangeObserver, 0);
  objc_storeStrong((id *)&self->_explicitSortOrder, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

@end