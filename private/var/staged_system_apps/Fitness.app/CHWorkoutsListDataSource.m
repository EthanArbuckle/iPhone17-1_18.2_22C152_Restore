@interface CHWorkoutsListDataSource
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)workout:(id)a3 wasOnSameDayAsWorkout:(id)a4;
- (CHWorkoutsListDataSource)init;
- (CHWorkoutsListDataSource)initWithTableView:(id)a3 dataProvider:(id)a4 fitnessAppContext:(id)a5 formattingManager:(id)a6 badgeImageFactory:(id)a7 awardsDataProvider:(id)a8;
- (CHWorkoutsListDataSourceDelegate)delegate;
- (NSString)navBarBackdropGroupName;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_indexPathAdjustedForSummaryCellForRow:(int64_t)a3 inSection:(int64_t)a4;
- (id)_indexPathsToInsertForSection:(unint64_t)a3 deletedIndexPaths:(id)a4;
- (id)_indexPathsToInsertWithSectionSet:(id)a3 deletedIndexPaths:(id)a4;
- (id)_indexPathsToRemoveForSection:(unint64_t)a3;
- (id)_indexPathsToRemoveWithSectionSet:(id)a3;
- (id)_workoutForIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)workoutForIndexPath:(id)a3;
- (int64_t)currentSection;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_calculateSectionContentOffsets;
- (void)_checkCurrentMonth;
- (void)_deleteWorkoutAtIndexPath:(id)a3;
- (void)_reloadDataForFilter;
- (void)_reloadDataForVisibleCells:(id)a3;
- (void)_reloadDataFromProvider;
- (void)_reloadHeaderForSection:(unint64_t)a3;
- (void)_try_reloadDataForFilter;
- (void)dealloc;
- (void)setCurrentSection:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setNavBarBackdropGroupName:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
@end

@implementation CHWorkoutsListDataSource

- (CHWorkoutsListDataSource)initWithTableView:(id)a3 dataProvider:(id)a4 fitnessAppContext:(id)a5 formattingManager:(id)a6 badgeImageFactory:(id)a7 awardsDataProvider:(id)a8
{
  id v14 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a7;
  id v15 = a8;
  v38.receiver = self;
  v38.super_class = (Class)CHWorkoutsListDataSource;
  v16 = [(CHWorkoutsListDataSource *)&v38 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_tableView, v14);
    objc_storeStrong((id *)&v17->_dataProvider, a4);
    objc_storeStrong((id *)&v17->_fitnessAppContext, a5);
    objc_storeStrong((id *)&v17->_formattingManager, a6);
    objc_storeStrong((id *)&v17->_badgeImageFactory, a7);
    objc_storeStrong((id *)&v17->_awardsDataProvider, a8);
    uint64_t v18 = +[NSCalendar currentCalendar];
    currentCalendar = v17->_currentCalendar;
    v17->_currentCalendar = (NSCalendar *)v18;

    objc_initWeak(&location, v17);
    dataProvider = v17->_dataProvider;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100124B0C;
    v35[3] = &unk_1008AB8D8;
    objc_copyWeak(&v36, &location);
    [(CHWorkoutDataProvider *)dataProvider addUpdateHandler:v35];
    v21 = v17->_dataProvider;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100124B4C;
    v33[3] = &unk_1008AB8D8;
    objc_copyWeak(&v34, &location);
    [(CHWorkoutDataProvider *)v21 addFilterActionFinishedHandler:v33];
    id WeakRetained = objc_loadWeakRetained((id *)&v17->_tableView);
    [WeakRetained registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"WorkoutsListTableHeaderViewReuseIdentifier"];

    id v23 = objc_loadWeakRetained((id *)&v17->_tableView);
    [v23 registerClass:objc_opt_class() forCellReuseIdentifier:@"WorkoutsListSummaryTableViewCellReuseIdentifier"];

    id v24 = objc_loadWeakRetained((id *)&v17->_tableView);
    [v24 registerClass:objc_opt_class() forCellReuseIdentifier:@"WorkoutsListTableViewCellReuseIdentifier"];

    id v25 = objc_loadWeakRetained((id *)&v17->_tableView);
    [v25 setDataSource:v17];

    id v26 = objc_loadWeakRetained((id *)&v17->_tableView);
    [v26 setDelegate:v17];

    if ([(CHWorkoutDataProvider *)v17->_dataProvider dataAvailable]) {
      [(CHWorkoutsListDataSource *)v17 _reloadDataFromProvider];
    }
    v27 = +[NSNotificationCenter defaultCenter];
    [v27 addObserver:v17 selector:"_reloadDataForVisibleCells:" name:UIApplicationSignificantTimeChangeNotification object:0];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v17;
}

- (CHWorkoutsListDataSource)init
{
  return 0;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CHWorkoutsListDataSource;
  [(CHWorkoutsListDataSource *)&v4 dealloc];
}

- (id)workoutForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  if (v5 >= (id)[(NSArray *)self->_sectionArray count]
    || (id v6 = [v4 row],
        id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView),
        int64_t v8 = -[CHWorkoutsListDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", WeakRetained, [v4 section]), WeakRetained, (uint64_t)v6 >= v8))
  {
    v9 = 0;
  }
  else
  {
    v9 = [(CHWorkoutsListDataSource *)self _workoutForIndexPath:v4];
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  objc_storeWeak((id *)&self->_delegate, a3);
  if ([(NSArray *)self->_sectionArray count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    id v5 = [(NSArray *)self->_sectionArray objectAtIndexedSubscript:self->_currentSection];
    [WeakRetained workoutsListDataSource:self didScrollToSectionWithDateComponents:v5];
  }
}

- (void)_reloadDataFromProvider
{
  self->_offsetsStale = 1;
  v3 = [(CHWorkoutDataProvider *)self->_dataProvider workoutsByMonthAndYear];
  rowDictionary = self->_rowDictionary;
  self->_rowDictionary = v3;

  id v5 = [(CHWorkoutDataProvider *)self->_dataProvider sortedDateComponentKeys];
  sectionArray = self->_sectionArray;
  self->_sectionArray = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained reloadData];

  if ([(NSArray *)self->_sectionArray count])
  {
    id v9 = [(CHWorkoutsListDataSource *)self delegate];
    int64_t v8 = [(NSArray *)self->_sectionArray objectAtIndexedSubscript:self->_currentSection];
    [v9 workoutsListDataSource:self didScrollToSectionWithDateComponents:v8];
  }
}

- (void)_reloadDataForFilter
{
}

- (void)_try_reloadDataForFilter
{
  v2 = self;
  self->_offsetsStale = 1;
  id location = (id *)&self->_tableView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained beginUpdates];

  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  v7 = [(CHWorkoutDataProvider *)v2->_dataProvider sortedDateComponentKeys];
  id v8 = [v7 countByEnumeratingWithState:&v123 objects:v131 count:16];
  v91 = v2;
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v124;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v124 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v123 + 1) + 8 * i);
        if (![(NSArray *)v2->_sectionArray containsObject:v12])
        {
          v13 = [(CHWorkoutDataProvider *)v2->_dataProvider sortedDateComponentKeys];
          id v14 = [v13 indexOfObject:v12];

          v2 = v91;
          id v15 = +[NSNumber numberWithInteger:v14];
          [v6 addObject:v15];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v123 objects:v131 count:16];
    }
    while (v9);
  }

  if ([(NSArray *)v2->_sectionArray count])
  {
    unint64_t v16 = 0;
    do
    {
      rowDictionary = v2->_rowDictionary;
      uint64_t v18 = [(NSArray *)v2->_sectionArray objectAtIndexedSubscript:v16];
      v19 = [(NSDictionary *)rowDictionary objectForKeyedSubscript:v18];
      v20 = v2;
      id v21 = [v19 count];

      if (!v21)
      {
        v22 = +[NSNumber numberWithInteger:v16];
        [v4 addObject:v22];
      }
      ++v16;
      v2 = v20;
    }
    while (v16 < [(NSArray *)v20->_sectionArray count]);
  }
  if ([(NSArray *)v2->_sectionArray count])
  {
    unint64_t v23 = 0;
    do
    {
      id v24 = [(CHWorkoutDataProvider *)v2->_dataProvider workoutsByMonthAndYear];
      id v25 = [(NSArray *)v2->_sectionArray objectAtIndexedSubscript:v23];
      [v24 objectForKeyedSubscript:v25];
      v27 = id v26 = v2;
      id v28 = [v27 count];

      if (!v28)
      {
        id v29 = +[NSNumber numberWithInteger:v23];
        [v5 addObject:v29];
      }
      ++v23;
      v2 = v26;
    }
    while (v23 < [(NSArray *)v26->_sectionArray count]);
  }
  id v30 = objc_alloc_init((Class)NSMutableSet);
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v31 = v5;
  id v32 = [v31 countByEnumeratingWithState:&v119 objects:v130 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v120;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v120 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v119 + 1) + 8 * (void)j);
        if (([v4 containsObject:v36] & 1) == 0) {
          [v30 addObject:v36];
        }
      }
      id v33 = [v31 countByEnumeratingWithState:&v119 objects:v130 count:16];
    }
    while (v33);
  }

  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id obj = v4;
  id v37 = [obj countByEnumeratingWithState:&v115 objects:v129 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = *(void *)v116;
    do
    {
      for (k = 0; k != v38; k = (char *)k + 1)
      {
        if (*(void *)v116 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = *(void *)(*((void *)&v115 + 1) + 8 * (void)k);
        if (([v31 containsObject:v41] & 1) == 0) {
          [v30 addObject:v41];
        }
      }
      id v38 = [obj countByEnumeratingWithState:&v115 objects:v129 count:16];
    }
    while (v38);
  }
  v86 = v31;
  v88 = v6;

  id v42 = objc_alloc_init((Class)NSMutableSet);
  id v43 = objc_alloc_init((Class)NSMutableSet);
  v44 = [(CHWorkoutDataProvider *)v91->_dataProvider sortedDateComponentKeys];
  uint64_t v45 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [v44 count]);

  id v46 = [(NSArray *)v91->_sectionArray copy];
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472;
  v112[2] = sub_100125900;
  v112[3] = &unk_1008ACBE0;
  v112[4] = v91;
  id v47 = v30;
  id v113 = v47;
  id v83 = v42;
  v85 = v46;
  id v114 = v83;
  [v46 enumerateObjectsUsingBlock:v112];
  v89 = (void *)v45;
  [(CHWorkoutsListDataSource *)v91 _indexPathsToRemoveWithSectionSet:v45];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v90 = long long v111 = 0u;
  id v48 = [v90 copy];
  id v49 = [v48 countByEnumeratingWithState:&v108 objects:v128 count:16];
  if (v49)
  {
    id v50 = v49;
    uint64_t v51 = *(void *)v109;
    do
    {
      for (m = 0; m != v50; m = (char *)m + 1)
      {
        if (*(void *)v109 != v51) {
          objc_enumerationMutation(v48);
        }
        v53 = *(void **)(*((void *)&v108 + 1) + 8 * (void)m);
        v54 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v53 section]);
        [v43 addObject:v54];

        v55 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v53 section]);
        unsigned int v56 = [v47 containsObject:v55];

        if (v56) {
          [v90 removeObject:v53];
        }
      }
      id v50 = [v48 countByEnumeratingWithState:&v108 objects:v128 count:16];
    }
    while (v50);
  }

  id v57 = objc_loadWeakRetained(location);
  [v57 deleteRowsAtIndexPaths:v90 withRowAnimation:5];

  v58 = [(CHWorkoutDataProvider *)v91->_dataProvider sortedDateComponentKeys];
  id v59 = [v58 copy];

  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_100125A30;
  v105[3] = &unk_1008ACBE0;
  v105[4] = v91;
  id v60 = v47;
  id v106 = v60;
  id v61 = v83;
  id v107 = v61;
  v84 = v59;
  [v59 enumerateObjectsUsingBlock:v105];
  v62 = [(CHWorkoutsListDataSource *)v91 _indexPathsToInsertWithSectionSet:v89 deletedIndexPaths:v90];
  v103[0] = _NSConcreteStackBlock;
  v103[1] = 3221225472;
  v103[2] = sub_100125B3C;
  v103[3] = &unk_1008ACC08;
  id v63 = v43;
  id v104 = v63;
  [v62 enumerateObjectsUsingBlock:v103];
  id v64 = objc_loadWeakRetained(location);
  v82 = v62;
  [v64 insertRowsAtIndexPaths:v62 withRowAnimation:5];

  [v63 minusSet:v61];
  v65 = [v63 hk_map:&stru_1008ACC48];
  id v66 = objc_loadWeakRetained(location);
  v81 = v65;
  v67 = [v65 allObjects];
  [v66 reloadRowsAtIndexPaths:v67 withRowAnimation:5];

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v68 = v60;
  id v69 = [v68 countByEnumeratingWithState:&v99 objects:v127 count:16];
  if (v69)
  {
    id v70 = v69;
    uint64_t v71 = *(void *)v100;
    do
    {
      for (n = 0; n != v70; n = (char *)n + 1)
      {
        if (*(void *)v100 != v71) {
          objc_enumerationMutation(v68);
        }
        v73 = *(void **)(*((void *)&v99 + 1) + 8 * (void)n);
        id v74 = objc_loadWeakRetained(location);
        v75 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [v73 integerValue]);
        [v74 reloadSections:v75 withRowAnimation:5];
      }
      id v70 = [v68 countByEnumeratingWithState:&v99 objects:v127 count:16];
    }
    while (v70);
  }

  uint64_t v76 = [(CHWorkoutDataProvider *)v91->_dataProvider sortedDateComponentKeys];
  sectionArray = v91->_sectionArray;
  v91->_sectionArray = (NSArray *)v76;

  uint64_t v78 = [(CHWorkoutDataProvider *)v91->_dataProvider workoutsByMonthAndYear];
  v79 = v91->_rowDictionary;
  v91->_rowDictionary = (NSDictionary *)v78;

  if (![v61 count])
  {
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_100125BF0;
    v96[3] = &unk_1008ACC70;
    id v97 = v68;
    v98 = v91;
    [v89 enumerateIndexesUsingBlock:v96];
  }
  id v80 = objc_loadWeakRetained(location);
  [v80 endUpdates];

  if ([v61 count])
  {
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_100125C78;
    v93[3] = &unk_1008ACC70;
    id v94 = v68;
    v95 = v91;
    [v89 enumerateIndexesUsingBlock:v93];
  }
  [(CHWorkoutsListDataSource *)v91 _checkCurrentMonth];
}

- (void)_reloadHeaderForSection:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  id v11 = [WeakRetained headerViewForSection:a3];

  id v6 = [(CHWorkoutDataProvider *)self->_dataProvider sortedDateComponentKeys];
  v7 = [v6 objectAtIndexedSubscript:a3];

  id v8 = [(CHWorkoutDataProvider *)self->_dataProvider workoutStatisticsForMonthAndYear];
  id v9 = [v8 objectForKeyedSubscript:v7];

  uint64_t v10 = [v9 startOfMonth];
  [v11 setDate:v10];
}

- (id)_indexPathsToRemoveWithSectionSet:(id)a3
{
  id v4 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100125E9C;
  v8[3] = &unk_1008ACC70;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v9 = v5;
  uint64_t v10 = self;
  [v4 enumerateIndexesUsingBlock:v8];

  id v6 = v5;
  return v6;
}

- (id)_indexPathsToRemoveForSection:(unint64_t)a3
{
  if ([(NSArray *)self->_sectionArray count] <= a3)
  {
    id v9 = &__NSArray0__struct;
  }
  else
  {
    id v5 = [(NSArray *)self->_sectionArray objectAtIndexedSubscript:a3];
    id v6 = [(NSDictionary *)self->_rowDictionary objectForKeyedSubscript:v5];
    v7 = [(CHWorkoutDataProvider *)self->_dataProvider workoutsByMonthAndYear];
    id v8 = [v7 objectForKeyedSubscript:v5];

    if ([v8 count])
    {
      id v9 = objc_alloc_init((Class)NSMutableArray);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v18 = v6;
      id v10 = v6;
      id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v20;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            if (([v8 containsObject:v15] & 1) == 0)
            {
              unint64_t v16 = -[CHWorkoutsListDataSource _indexPathAdjustedForSummaryCellForRow:inSection:](self, "_indexPathAdjustedForSummaryCellForRow:inSection:", [v10 indexOfObject:v15], a3);
              [v9 addObject:v16];
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v12);
      }

      id v6 = v18;
    }
    else
    {
      id v9 = &__NSArray0__struct;
    }
  }

  return v9;
}

- (id)_indexPathsToInsertWithSectionSet:(id)a3 deletedIndexPaths:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001261D4;
  v12[3] = &unk_1008ACC98;
  id v13 = v6;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v14 = v8;
  uint64_t v15 = self;
  id v9 = v6;
  [v7 enumerateIndexesUsingBlock:v12];

  id v10 = v8;
  return v10;
}

- (id)_indexPathsToInsertForSection:(unint64_t)a3 deletedIndexPaths:(id)a4
{
  id v30 = a4;
  if ([(NSArray *)self->_sectionArray count] <= a3)
  {
    id v18 = &__NSArray0__struct;
  }
  else
  {
    id v6 = [(NSArray *)self->_sectionArray objectAtIndexedSubscript:a3];
    id v7 = [(NSDictionary *)self->_rowDictionary objectForKeyedSubscript:v6];
    id v8 = [v7 mutableCopy];

    if ([v8 count])
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = [(NSDictionary *)self->_rowDictionary objectForKeyedSubscript:v6];
      id v9 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v36;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v36 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            id v14 = v6;
            uint64_t v15 = [(NSDictionary *)self->_rowDictionary objectForKeyedSubscript:v6];
            id v16 = [v15 indexOfObject:v13];

            v17 = [(CHWorkoutsListDataSource *)self _indexPathAdjustedForSummaryCellForRow:v16 inSection:a3];
            if ([v30 containsObject:v17]) {
              [v8 removeObject:v13];
            }

            id v6 = v14;
          }
          id v10 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v10);
      }

      id v18 = objc_alloc_init((Class)NSMutableArray);
      long long v19 = [(CHWorkoutDataProvider *)self->_dataProvider workoutsByMonthAndYear];
      long long v20 = [v19 objectForKeyedSubscript:v6];

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v21 = v20;
      id v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v32;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v32 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
            if (([v8 containsObject:v26] & 1) == 0)
            {
              v27 = -[CHWorkoutsListDataSource _indexPathAdjustedForSummaryCellForRow:inSection:](self, "_indexPathAdjustedForSummaryCellForRow:inSection:", [v21 indexOfObject:v26], a3);
              [v18 addObject:v27];
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v23);
      }
    }
    else
    {
      id v18 = &__NSArray0__struct;
    }
  }

  return v18;
}

- (void)_calculateSectionContentOffsets
{
  id v30 = objc_alloc_init((Class)NSMutableArray);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained contentInset];
  double v5 = v4;
  id v6 = objc_loadWeakRetained((id *)&self->_tableView);
  [v6 _systemContentInset];
  double v8 = -(v5 + v7);

  id v9 = +[NSNumber numberWithDouble:v8];
  [v30 addObject:v9];

  id v10 = objc_loadWeakRetained((id *)&self->_tableView);
  uint64_t v11 = [(CHWorkoutsListDataSource *)self numberOfSectionsInTableView:v10];

  if (v11 >= 2)
  {
    uint64_t v12 = 0;
    do
    {
      id v13 = objc_loadWeakRetained((id *)&self->_tableView);
      [(CHWorkoutsListDataSource *)self tableView:v13 heightForHeaderInSection:v12];
      double v15 = v14;

      double v8 = v8 + v15;
      id v16 = objc_loadWeakRetained((id *)&self->_tableView);
      uint64_t v17 = [(CHWorkoutsListDataSource *)self tableView:v16 numberOfRowsInSection:v12];

      if (v17 >= 1)
      {
        int64_t v18 = 0;
        do
        {
          long long v19 = +[NSIndexPath indexPathForRow:v18 inSection:v12];
          id v20 = objc_loadWeakRetained((id *)&self->_tableView);
          [(CHWorkoutsListDataSource *)self tableView:v20 heightForRowAtIndexPath:v19];
          double v22 = v21;

          double v8 = v8 + v22;
          ++v18;
          id v23 = objc_loadWeakRetained((id *)&self->_tableView);
          int64_t v24 = [(CHWorkoutsListDataSource *)self tableView:v23 numberOfRowsInSection:v12];
        }
        while (v18 < v24);
      }
      id v25 = +[NSNumber numberWithDouble:v8];
      [v30 addObject:v25];

      ++v12;
      id v26 = objc_loadWeakRetained((id *)&self->_tableView);
      v27 = (char *)[(CHWorkoutsListDataSource *)self numberOfSectionsInTableView:v26]
          - 1;
    }
    while (v12 < (uint64_t)v27);
  }
  id v28 = (NSArray *)[v30 copy];
  contentOffsetsForTopOfSection = self->_contentOffsetsForTopOfSection;
  self->_contentOffsetsForTopOfSection = v28;
}

- (void)setCurrentSection:(int64_t)a3
{
  if (self->_currentSection != a3)
  {
    self->_unint64_t currentSection = a3;
    NSUInteger v4 = [(NSArray *)self->_sectionArray count];
    unint64_t currentSection = self->_currentSection;
    id v7 = [(CHWorkoutsListDataSource *)self delegate];
    if (v4 <= currentSection)
    {
      [v7 workoutsListDataSource:self didScrollToSectionWithDateComponents:0];
    }
    else
    {
      id v6 = [(NSArray *)self->_sectionArray objectAtIndexedSubscript:self->_currentSection];
      [v7 workoutsListDataSource:self didScrollToSectionWithDateComponents:v6];
    }
  }
}

- (void)_reloadDataForVisibleCells:(id)a3
{
  p_tableView = &self->_tableView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  id v6 = [WeakRetained indexPathsForVisibleRows];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v6;
  id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v11 row])
        {
          id v12 = objc_loadWeakRetained((id *)p_tableView);
          id v13 = [v12 cellForRowAtIndexPath:v11];

          double v14 = [(CHWorkoutsListDataSource *)self _workoutForIndexPath:v11];
          double v15 = &__NSArray0__struct;
          if (AAUIShouldUseNewTrophyCase())
          {
            awardsDataProvider = self->_awardsDataProvider;
            uint64_t v17 = [v14 UUID];
            int64_t v18 = [v17 UUIDString];
            double v15 = [(CHAwardsDataProvider *)awardsDataProvider achievementsForWorkoutIdentifier:v18];
          }
          [v13 setWorkout:v14 fitnessAppContext:self->_fitnessAppContext formattingManager:self->_formattingManager achievementCount:[v15 count]];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sectionArray count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (![(NSArray *)self->_sectionArray count]) {
    return 0;
  }
  id v6 = [(NSArray *)self->_sectionArray objectAtIndexedSubscript:a4];
  id v7 = [(NSDictionary *)self->_rowDictionary objectForKeyedSubscript:v6];
  id v8 = [v7 count];

  if (v8) {
    int64_t v9 = (int64_t)v8 + 1;
  }
  else {
    int64_t v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 row])
  {
    id v8 = [(CHWorkoutsListDataSource *)self _workoutForIndexPath:v7];
    if (AAUIShouldUseNewTrophyCase())
    {
      awardsDataProvider = self->_awardsDataProvider;
      id v10 = [v8 UUID];
      uint64_t v11 = [v10 UUIDString];
      id v12 = [(CHAwardsDataProvider *)awardsDataProvider achievementsForWorkoutIdentifier:v11];
    }
    else
    {
      id v12 = &__NSArray0__struct;
    }
    id v13 = [v6 dequeueReusableCellWithIdentifier:@"WorkoutsListTableViewCellReuseIdentifier"];
    [v13 setWorkout:v8 fitnessAppContext:self->_fitnessAppContext formattingManager:self->_formattingManager achievementCount:[v12 count]];
  }
  else
  {
    id v13 = [v6 dequeueReusableCellWithIdentifier:@"WorkoutsListSummaryTableViewCellReuseIdentifier" forIndexPath:v7];
    double v14 = [v13 contentView];
    [v14 setClipsToBounds:1];

    double v15 = [(CHWorkoutDataProvider *)self->_dataProvider sortedDateComponentKeys];
    id v8 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));

    id v16 = [(CHWorkoutDataProvider *)self->_dataProvider workoutStatisticsForMonthAndYear];
    id v12 = [v16 objectForKeyedSubscript:v8];

    uint64_t v17 = [(CHWorkoutDataProvider *)self->_dataProvider currentFilteredTypeIdentifier];
    int64_t v18 = [(CHWorkoutFormattingManager *)self->_formattingManager fitnessUIFormattingManager];
    [v13 setWorkoutStatistics:v12 activityTypeKey:v17 formattingManager:v18];
  }
  [v13 setSelectionStyle:0];

  return v13;
}

- (BOOL)workout:(id)a3 wasOnSameDayAsWorkout:(id)a4
{
  currentCalendar = self->_currentCalendar;
  id v6 = a4;
  id v7 = [a3 startDate];
  id v8 = [v6 startDate];

  LOBYTE(currentCalendar) = [(NSCalendar *)currentCalendar isDate:v7 inSameDayAsDate:v8];
  return (char)currentCalendar;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if ([(CHWorkoutsListDataSource *)self tableView:a3 numberOfRowsInSection:a4] < 1) {
    return 0.0;
  }

  +[CHListTableHeaderView preferredHeight];
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(CHWorkoutsListDataSource *)self tableView:v6 numberOfRowsInSection:a4])
  {
    id v7 = [(CHWorkoutDataProvider *)self->_dataProvider sortedDateComponentKeys];
    id v8 = [v7 objectAtIndexedSubscript:a4];

    int64_t v9 = [(CHWorkoutDataProvider *)self->_dataProvider workoutStatisticsForMonthAndYear];
    id v10 = [v9 objectForKeyedSubscript:v8];

    uint64_t v11 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"WorkoutsListTableHeaderViewReuseIdentifier"];
    id v12 = [v10 startOfMonth];
    [v11 setDate:v12];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 row])
  {
    id v6 = [(CHWorkoutsListDataSource *)self _workoutForIndexPath:v5];
    +[CHWorkoutsListTableViewCell preferredHeightForWorkout:v6 formattingManager:self->_formattingManager];
    double v8 = v7;
  }
  else
  {
    int64_t v9 = [(CHWorkoutDataProvider *)self->_dataProvider sortedDateComponentKeys];
    id v6 = [v9 objectAtIndexedSubscript:[v5 section]];

    id v10 = [(CHWorkoutDataProvider *)self->_dataProvider workoutStatisticsForMonthAndYear];
    uint64_t v11 = [v10 objectForKeyedSubscript:v6];

    id v12 = [(CHWorkoutDataProvider *)self->_dataProvider currentFilteredTypeIdentifier];
    +[CHListSummaryTableViewCell heightForWorkoutActivityTypeKey:v12 statistics:v11];
    double v8 = v13;
  }
  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  double v7 = 0.0;
  if ((char *)[(NSArray *)self->_sectionArray count] - 1 != (unsigned char *)a4)
  {
    if ([(CHWorkoutsListDataSource *)self tableView:v6 numberOfRowsInSection:a4]) {
      double v7 = 11.0;
    }
    else {
      double v7 = 0.0;
    }
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a4;
  [a3 deselectRowAtIndexPath:v8 animated:1];
  if ([v8 row])
  {
    id v6 = [(CHWorkoutsListDataSource *)self _workoutForIndexPath:v8];
    double v7 = [(CHWorkoutsListDataSource *)self delegate];
    [v7 workoutsListDataSource:self didSelectWorkout:v6 atIndexPath:v8];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 row])
  {
    objc_initWeak(&location, self);
    id v8 = +[NSBundle mainBundle];
    int64_t v9 = [v8 localizedStringForKey:@"DELETE_WORKOUT" value:&stru_1008D8AB8 table:@"Localizable"];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10012736C;
    v15[3] = &unk_1008ACCC0;
    objc_copyWeak(&v17, &location);
    id v16 = v7;
    id v10 = +[UIContextualAction contextualActionWithStyle:0 title:v9 handler:v15];

    uint64_t v11 = +[UIColor redColor];
    [v10 setBackgroundColor:v11];

    long long v19 = v10;
    id v12 = +[NSArray arrayWithObjects:&v19 count:1];
    double v13 = +[UISwipeActionsConfiguration configurationWithActions:v12];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    double v13 = +[UISwipeActionsConfiguration configurationWithActions:&__NSArray0__struct];
  }

  return v13;
}

- (void)_deleteWorkoutAtIndexPath:(id)a3
{
  id v4 = [(CHWorkoutsListDataSource *)self _workoutForIndexPath:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained setEditing:0 animated:1];

  id v6 = [(CHWorkoutsListDataSource *)self delegate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001274BC;
  v8[3] = &unk_1008ACCE8;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 workoutsListDataSource:self requestsDeleteConfirmationForWorkout:v7 completion:v8];
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6 = a4;
  if ([v6 row])
  {
    id v7 = [(CHWorkoutsListDataSource *)self workoutForIndexPath:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = [WeakRetained detailViewControllerForWorkout:v7];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100127764;
    v15[3] = &unk_1008ACD10;
    id v16 = v9;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10012776C;
    v13[3] = &unk_1008ACD60;
    id v14 = v16;
    id v10 = v16;
    uint64_t v11 = +[UIContextMenuConfiguration configurationWithIdentifier:v6 previewProvider:v15 actionProvider:v13];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a5;
  id v8 = [a4 identifier];
  [(CHWorkoutsListDataSource *)self workoutForIndexPath:v8];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001279F8;
  v11[3] = &unk_1008ACD88;
  v11[4] = self;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v8;
  id v9 = v8;
  id v10 = v12;
  [v7 addCompletion:v11];
}

- (void)_checkCurrentMonth
{
  if (self->_offsetsStale)
  {
    [(CHWorkoutsListDataSource *)self _calculateSectionContentOffsets];
    self->_offsetsStale = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  [WeakRetained contentOffset];
  double v5 = v4;

  id v16 = [(NSArray *)self->_contentOffsetsForTopOfSection firstObject];
  if ([(NSArray *)self->_contentOffsetsForTopOfSection count])
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = -1;
    id v9 = v16;
    while (1)
    {
      uint64_t v10 = v8 + 1;
      id v17 = [(NSArray *)self->_contentOffsetsForTopOfSection objectAtIndexedSubscript:v8 + 1];
      [v17 doubleValue];
      if (v11 > v5 && ([v17 isEqual:v9] & 1) == 0) {
        break;
      }

      NSUInteger v12 = [(NSArray *)self->_contentOffsetsForTopOfSection count];
      NSUInteger v13 = v8 + 2;
      ++v8;
      uint64_t v6 = v7++;
      id v9 = v17;
      BOOL v14 = v13 >= v12;
      id v15 = v17;
      if (v14) {
        goto LABEL_12;
      }
    }

    id v15 = v9;
    uint64_t v10 = v6;
  }
  else
  {
    uint64_t v10 = 0;
    id v15 = v16;
  }
LABEL_12:
  id v18 = v15;
  [(CHWorkoutsListDataSource *)self setCurrentSection:v10];
}

- (id)_indexPathAdjustedForSummaryCellForRow:(int64_t)a3 inSection:(int64_t)a4
{
  return +[NSIndexPath indexPathForRow:a3 + 1 inSection:a4];
}

- (id)_workoutForIndexPath:(id)a3
{
  sectionArray = self->_sectionArray;
  id v5 = a3;
  uint64_t v6 = -[NSArray objectAtIndexedSubscript:](sectionArray, "objectAtIndexedSubscript:", [v5 section]);
  uint64_t v7 = [(NSDictionary *)self->_rowDictionary objectForKeyedSubscript:v6];
  uint64_t v8 = (char *)[v5 row];

  id v9 = [v7 objectAtIndexedSubscript:v8 - 1];

  return v9;
}

- (CHWorkoutsListDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHWorkoutsListDataSourceDelegate *)WeakRetained;
}

- (NSString)navBarBackdropGroupName
{
  return self->_navBarBackdropGroupName;
}

- (void)setNavBarBackdropGroupName:(id)a3
{
}

- (int64_t)currentSection
{
  return self->_currentSection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarBackdropGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentOffsetsForTopOfSection, 0);
  objc_storeStrong((id *)&self->_sectionArray, 0);
  objc_storeStrong((id *)&self->_rowDictionary, 0);
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_awardsDataProvider, 0);
  objc_storeStrong((id *)&self->_badgeImageFactory, 0);
  objc_storeStrong((id *)&self->_formattingManager, 0);
  objc_storeStrong((id *)&self->_fitnessAppContext, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);

  objc_destroyWeak((id *)&self->_tableView);
}

@end