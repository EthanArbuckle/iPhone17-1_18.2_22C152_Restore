@interface TUIStatsFeed
- (NSArray)currentEntriesUID;
- (NSArray)passes;
- (NSDate)allContentReadyDate;
- (NSDate)contentUpdateDate;
- (NSDate)creationDate;
- (NSDate)dynamicUpdateDate;
- (NSDate)initialContentReadyDate;
- (NSDate)initialLayoutStartDate;
- (NSDate)initialResourcesRenderedDate;
- (NSDate)resourcesLoadedDate;
- (NSDate)resourcesStartLoadingDate;
- (NSDate)viewWillAppearDate;
- (NSDictionary)entries;
- (TUIStatsFeed)initWithDates:(id)a3 collector:(id)a4;
- (double)elapsedTimeForPhase:(unint64_t)a3;
- (unint64_t)countForEvent:(unint64_t)a3;
@end

@implementation TUIStatsFeed

- (TUIStatsFeed)initWithDates:(id)a3 collector:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v46.receiver = self;
  v46.super_class = (Class)TUIStatsFeed;
  v8 = [(TUIStatsFeed *)&v46 init];
  if (v8)
  {
    uint64_t v9 = [v6 creationDate];
    creationDate = v8->_creationDate;
    v8->_creationDate = (NSDate *)v9;

    uint64_t v11 = [v6 initialResourcesRenderedDate];
    initialResourcesRenderedDate = v8->_initialResourcesRenderedDate;
    v8->_initialResourcesRenderedDate = (NSDate *)v11;

    uint64_t v13 = [v6 contentUpdateDate];
    contentUpdateDate = v8->_contentUpdateDate;
    v8->_contentUpdateDate = (NSDate *)v13;

    uint64_t v15 = [v6 initialContentReadyDate];
    initialContentReadyDate = v8->_initialContentReadyDate;
    v8->_initialContentReadyDate = (NSDate *)v15;

    uint64_t v17 = [v6 initialLayoutStartDate];
    initialLayoutStartDate = v8->_initialLayoutStartDate;
    v8->_initialLayoutStartDate = (NSDate *)v17;

    uint64_t v19 = [v6 allContentReadyDate];
    allContentReadyDate = v8->_allContentReadyDate;
    v8->_allContentReadyDate = (NSDate *)v19;

    uint64_t v21 = [v6 dynamicUpdateDate];
    dynamicUpdateDate = v8->_dynamicUpdateDate;
    v8->_dynamicUpdateDate = (NSDate *)v21;

    uint64_t v23 = [v6 resourcesStartLoadingDate];
    resourcesStartLoadingDate = v8->_resourcesStartLoadingDate;
    v8->_resourcesStartLoadingDate = (NSDate *)v23;

    uint64_t v25 = [v6 resourcesLoadedDate];
    resourcesLoadedDate = v8->_resourcesLoadedDate;
    v8->_resourcesLoadedDate = (NSDate *)v25;

    uint64_t v27 = [v6 viewWillAppearDate];
    viewWillAppearDate = v8->_viewWillAppearDate;
    v8->_viewWillAppearDate = (NSDate *)v27;

    v29 = [v7 passes];
    v30 = (NSArray *)[v29 copy];
    passes = v8->_passes;
    v8->_passes = v30;

    v32 = [v7 currentEntriesUID];
    v33 = (NSArray *)[v32 copy];
    currentEntriesUID = v8->_currentEntriesUID;
    v8->_currentEntriesUID = v33;

    for (uint64_t i = 0; i != 5; ++i)
    {
      [v7 elapsedTimeForPhase:i];
      v8->_elapsedTime[i] = v36;
    }
    for (uint64_t j = 0; j != 29; ++j)
      v8->_eventCount[j] = (unint64_t)[v7 countForEvent:j];
    v38 = objc_opt_new();
    v39 = [v7 entries];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_5BC54;
    v44[3] = &unk_2530C8;
    id v45 = v38;
    id v40 = v38;
    [v39 enumerateKeysAndObjectsUsingBlock:v44];

    v41 = (NSDictionary *)[v40 copy];
    entries = v8->_entries;
    v8->_entries = v41;
  }
  return v8;
}

- (double)elapsedTimeForPhase:(unint64_t)a3
{
  return self->_elapsedTime[a3];
}

- (unint64_t)countForEvent:(unint64_t)a3
{
  return self->_eventCount[a3];
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)initialResourcesRenderedDate
{
  return self->_initialResourcesRenderedDate;
}

- (NSDate)contentUpdateDate
{
  return self->_contentUpdateDate;
}

- (NSDate)initialContentReadyDate
{
  return self->_initialContentReadyDate;
}

- (NSDate)initialLayoutStartDate
{
  return self->_initialLayoutStartDate;
}

- (NSDate)allContentReadyDate
{
  return self->_allContentReadyDate;
}

- (NSDate)dynamicUpdateDate
{
  return self->_dynamicUpdateDate;
}

- (NSDate)resourcesStartLoadingDate
{
  return self->_resourcesStartLoadingDate;
}

- (NSDate)resourcesLoadedDate
{
  return self->_resourcesLoadedDate;
}

- (NSDate)viewWillAppearDate
{
  return self->_viewWillAppearDate;
}

- (NSArray)passes
{
  return self->_passes;
}

- (NSDictionary)entries
{
  return self->_entries;
}

- (NSArray)currentEntriesUID
{
  return self->_currentEntriesUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentEntriesUID, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_passes, 0);
  objc_storeStrong((id *)&self->_viewWillAppearDate, 0);
  objc_storeStrong((id *)&self->_resourcesLoadedDate, 0);
  objc_storeStrong((id *)&self->_resourcesStartLoadingDate, 0);
  objc_storeStrong((id *)&self->_dynamicUpdateDate, 0);
  objc_storeStrong((id *)&self->_allContentReadyDate, 0);
  objc_storeStrong((id *)&self->_initialLayoutStartDate, 0);
  objc_storeStrong((id *)&self->_initialContentReadyDate, 0);
  objc_storeStrong((id *)&self->_contentUpdateDate, 0);
  objc_storeStrong((id *)&self->_initialResourcesRenderedDate, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end