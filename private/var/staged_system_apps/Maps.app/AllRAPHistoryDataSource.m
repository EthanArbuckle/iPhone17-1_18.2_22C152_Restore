@interface AllRAPHistoryDataSource
- (AllRAPHistoryDataSource)initWithCollectionView:(id)a3 reportSection:(unint64_t)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (id)_reportHistoryContentForReportSection:(unint64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)_loadReports;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
@end

@implementation AllRAPHistoryDataSource

- (AllRAPHistoryDataSource)initWithCollectionView:(id)a3 reportSection:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)AllRAPHistoryDataSource;
  v5 = [(DataSource *)&v11 initWithCollectionView:a3 updateLocation:0];
  v6 = v5;
  if (v5)
  {
    v5->_reportSection = a4;
    v7 = +[UserProfileReportHistoryManager sharedInstance];
    v8 = [v7 observers];
    [v8 registerObserver:v6];

    v9 = +[UserProfileReportHistoryManager sharedInstance];
    [v9 refineRAPHistory];

    [(AllRAPHistoryDataSource *)v6 _loadReports];
  }
  return v6;
}

- (void)_loadReports
{
  v3 = [(AllRAPHistoryDataSource *)self _reportHistoryContentForReportSection:self->_reportSection];
  reports = self->_reports;
  self->_reports = v3;

  id v5 = [(DataSource *)self delegate];
  [v5 dataSourceUpdated:self];
}

- (id)_reportHistoryContentForReportSection:(unint64_t)a3
{
  id v5 = +[NSArray array];
  reports = self->_reports;
  self->_reports = v5;

  v7 = +[UserProfileReportHistoryManager sharedInstance];
  v8 = [v7 rapHistory];

  v9 = +[NSMutableArray array];
  v10 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        unsigned int v17 = [v16 reportStatus];
        v18 = v9;
        if (v17)
        {
          if (v17 != 1) {
            continue;
          }
          v18 = v10;
        }
        [v18 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  id v19 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"dateOfReportCreation" ascending:0];
  v20 = +[NSArray arrayWithObject:v19];
  switch(a3)
  {
    case 4uLL:
      v22 = (NSArray *)v11;
LABEL_19:
      v23 = self->_reports;
      self->_reports = v22;

      break;
    case 3uLL:
      v21 = v10;
      goto LABEL_18;
    case 2uLL:
      v21 = v9;
LABEL_18:
      [v21 sortedArrayUsingDescriptors:v20];
      v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
  }
  v24 = self->_reports;

  return v24;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return [(NSArray *)self->_reports count];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  reports = self->_reports;
  id v6 = a4;
  id v7 = a3;
  v8 = -[NSArray objectAtIndexedSubscript:](reports, "objectAtIndexedSubscript:", [v6 row]);
  v9 = +[TwoLineCollectionViewListCell identifier];
  v10 = [v7 dequeueReusableCellWithReuseIdentifier:v9 forIndexPath:v6];

  id v11 = +[TwoLinesContentViewModelComposer cellModelForRAPReportsHistory:v8 allowDisclosureIndicator:1];
  [v10 setViewModel:v11];

  return v10;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return self->_reportSection == 3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_reportSection == 3)
  {
    v8 = -[NSArray objectAtIndexedSubscript:](self->_reports, "objectAtIndexedSubscript:", [v6 row]);
    v9 = [(DataSource *)self delegate];
    [v9 dataSource:self itemTapped:v8];
  }
  [v10 deselectItemAtIndexPath:v7 animated:1];
}

- (void).cxx_destruct
{
}

@end