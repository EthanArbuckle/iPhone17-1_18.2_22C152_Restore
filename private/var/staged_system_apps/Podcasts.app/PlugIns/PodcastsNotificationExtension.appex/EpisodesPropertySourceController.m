@interface EpisodesPropertySourceController
- (BOOL)keepSorted;
- (EpisodesPropertySourceController)initWithNotification:(id)a3 keepSorted:(BOOL)a4;
- (EpisodesPropertySourceControllerDelegate)delegate;
- (NSArray)cachedSortDescriptors;
- (NSArray)orderedEpisodePropertySources;
- (NSMutableArray)backgroundEpisodeUuidFetches;
- (UNNotification)notification;
- (id)_sortDescriptorsForDefaultOrdering;
- (id)_sourceByApplyingDefaultOrderingToPropertySources:(id)a3;
- (id)episodePropertySourceAtIndex:(unint64_t)a3;
- (id)firstEpisodePropertySource;
- (id)firstEpisodePropertySourcePassingTest:(id)a3;
- (int64_t)countOfEpisodePropertySources;
- (unint64_t)indexOfPropertySourcePassingTest:(id)a3;
- (void)_didFetchEpisodePropertySources:(id)a3;
- (void)_didUpdateEpisodePropertySourcesAtIndexes:(id)a3;
- (void)_didUpdateEpisodePropertySourcesNeedingFullReload;
- (void)_loadEpisodePropertySourcesFromDatabaseInBackground;
- (void)_loadEpisodePropertySourcesFromNotificationInfo;
- (void)beginLoadingFromDatabaseInBackground;
- (void)setBackgroundEpisodeUuidFetches:(id)a3;
- (void)setCachedSortDescriptors:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOrderedEpisodePropertySources:(id)a3;
@end

@implementation EpisodesPropertySourceController

- (EpisodesPropertySourceController)initWithNotification:(id)a3 keepSorted:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EpisodesPropertySourceController;
  v8 = [(EpisodesPropertySourceController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notification, a3);
    uint64_t v10 = +[NSMutableArray array];
    backgroundEpisodeUuidFetches = v9->_backgroundEpisodeUuidFetches;
    v9->_backgroundEpisodeUuidFetches = (NSMutableArray *)v10;

    v9->_keepSorted = a4;
    [(EpisodesPropertySourceController *)v9 _loadEpisodePropertySourcesFromNotificationInfo];
  }

  return v9;
}

- (int64_t)countOfEpisodePropertySources
{
  return [(NSArray *)self->_orderedEpisodePropertySources count];
}

- (id)episodePropertySourceAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_orderedEpisodePropertySources objectAtIndex:a3];
}

- (id)firstEpisodePropertySource
{
  return [(NSArray *)self->_orderedEpisodePropertySources firstObject];
}

- (id)firstEpisodePropertySourcePassingTest:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    orderedEpisodePropertySources = self->_orderedEpisodePropertySources;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004DCC;
    v9[3] = &unk_10002C898;
    id v10 = v4;
    id v7 = [(NSArray *)orderedEpisodePropertySources mt_firstObjectPassingTest:v9];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (unint64_t)indexOfPropertySourcePassingTest:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    orderedEpisodePropertySources = self->_orderedEpisodePropertySources;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100004E88;
    v9[3] = &unk_10002C898;
    id v10 = v4;
    unint64_t v7 = [(NSArray *)orderedEpisodePropertySources indexOfObjectPassingTest:v9];
  }
  else
  {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (void)beginLoadingFromDatabaseInBackground
{
}

- (void)_loadEpisodePropertySourcesFromNotificationInfo
{
  v3 = [(EpisodesPropertySourceController *)self notification];
  id v4 = [v3 request];
  v5 = [v4 content];
  v6 = [v5 mt_notificationEpisodes];

  unint64_t v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v12);
        v14 = [NotificationEpisodePropertySource alloc];
        v15 = -[NotificationEpisodePropertySource initWithNotification:episode:](v14, "initWithNotification:episode:", v3, v13, (void)v18);
        if (v15) {
          [v7 addObject:v15];
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  v16 = [(EpisodesPropertySourceController *)self _sourceByApplyingDefaultOrderingToPropertySources:v7];
  orderedEpisodePropertySources = self->_orderedEpisodePropertySources;
  self->_orderedEpisodePropertySources = v16;
}

- (void)_loadEpisodePropertySourcesFromDatabaseInBackground
{
  orderedEpisodePropertySources = self->_orderedEpisodePropertySources;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000051AC;
  v11[3] = &unk_10002C8C0;
  v11[4] = self;
  id v4 = [(NSArray *)orderedEpisodePropertySources mt_compactMap:v11];
  v5 = [(EpisodesPropertySourceController *)self backgroundEpisodeUuidFetches];
  [v5 addObjectsFromArray:v4];

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005250;
  v7[3] = &unk_10002C910;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  +[DatabaseEpisodePropertySource fetchSourceForEpisodeUuids:v6 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_didFetchEpisodePropertySources:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = [v4 mt_compactMap:&stru_10002C950];
    id v6 = [(EpisodesPropertySourceController *)self orderedEpisodePropertySources];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100005604;
    v20[3] = &unk_10002C978;
    id v7 = v5;
    id v21 = v7;
    id v8 = [v6 indexesOfObjectsPassingTest:v20];

    id v9 = [(EpisodesPropertySourceController *)self orderedEpisodePropertySources];
    id v10 = [v9 mt_allObjectsExcludingIndexes:v8];

    uint64_t v11 = [v10 arrayByAddingObjectsFromArray:v4];

    v12 = [(EpisodesPropertySourceController *)self _sourceByApplyingDefaultOrderingToPropertySources:v11];

    id v13 = [v12 count];
    v14 = [(EpisodesPropertySourceController *)self orderedEpisodePropertySources];
    id v15 = [v14 count];

    if (v13 == v15)
    {
      v16 = [(EpisodesPropertySourceController *)self orderedEpisodePropertySources];
      v17 = [v16 mt_compactMap:&stru_10002C998];

      long long v18 = [v12 mt_compactMap:&stru_10002C9B8];
      unsigned __int8 v19 = [v17 isEqualToArray:v18];

      objc_storeStrong((id *)&self->_orderedEpisodePropertySources, v12);
      if (v19)
      {
        [(EpisodesPropertySourceController *)self _didUpdateEpisodePropertySourcesAtIndexes:v8];
LABEL_7:

        goto LABEL_8;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_orderedEpisodePropertySources, v12);
    }
    [(EpisodesPropertySourceController *)self _didUpdateEpisodePropertySourcesNeedingFullReload];
    goto LABEL_7;
  }
LABEL_8:
}

- (id)_sourceByApplyingDefaultOrderingToPropertySources:(id)a3
{
  id v4 = a3;
  v5 = [(EpisodesPropertySourceController *)self _sortDescriptorsForDefaultOrdering];
  if (v5)
  {
    id v6 = [v4 sortedArrayUsingDescriptors:v5];
  }
  else
  {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (id)_sortDescriptorsForDefaultOrdering
{
  if ([(EpisodesPropertySourceController *)self keepSorted])
  {
    cachedSortDescriptors = self->_cachedSortDescriptors;
    if (!cachedSortDescriptors)
    {
      id v4 = [(UNNotification *)self->_notification request];
      v5 = [v4 content];
      id v6 = [v5 mt_podcastUuid];

      id v7 = +[BaseEpisodePropertySource defaultSortOrderSortDescriptorsForPodcastUuid:v6];
      id v8 = self->_cachedSortDescriptors;
      self->_cachedSortDescriptors = v7;

      cachedSortDescriptors = self->_cachedSortDescriptors;
    }
    id v9 = cachedSortDescriptors;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_didUpdateEpisodePropertySourcesNeedingFullReload
{
  id v3 = [(EpisodesPropertySourceController *)self delegate];
  [v3 episodesPropertySourceControllerDidUpdatingNeedingFullReload:self];
}

- (void)_didUpdateEpisodePropertySourcesAtIndexes:(id)a3
{
  id v4 = a3;
  id v5 = [(EpisodesPropertySourceController *)self delegate];
  [v5 episodesPropertySourceController:self didUpdateEpisodePropertySourcesAtIndexes:v4];
}

- (UNNotification)notification
{
  return self->_notification;
}

- (BOOL)keepSorted
{
  return self->_keepSorted;
}

- (EpisodesPropertySourceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EpisodesPropertySourceControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)cachedSortDescriptors
{
  return self->_cachedSortDescriptors;
}

- (void)setCachedSortDescriptors:(id)a3
{
}

- (NSArray)orderedEpisodePropertySources
{
  return self->_orderedEpisodePropertySources;
}

- (void)setOrderedEpisodePropertySources:(id)a3
{
}

- (NSMutableArray)backgroundEpisodeUuidFetches
{
  return self->_backgroundEpisodeUuidFetches;
}

- (void)setBackgroundEpisodeUuidFetches:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEpisodeUuidFetches, 0);
  objc_storeStrong((id *)&self->_orderedEpisodePropertySources, 0);
  objc_storeStrong((id *)&self->_cachedSortDescriptors, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_notification, 0);
}

@end