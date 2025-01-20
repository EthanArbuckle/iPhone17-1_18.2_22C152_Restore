@interface SharedTripsTableDataSource
- (GEOSharedNavState)selectedTrip;
- (SharedTripsTableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4 tableViewReloadEvent:(id)a5;
- (id)sharedTripAtIndexPath:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)numberOfSharedTrips;
- (void)_updateCellForSharedTrip:(id)a3;
- (void)_updateTableSelection:(BOOL)a3;
- (void)_updateTableView;
- (void)_updateTableViewWithTrip:(id)a3;
- (void)dealloc;
- (void)setSelectedTrip:(id)a3;
- (void)setSelectedTrip:(id)a3 animated:(BOOL)a4;
- (void)sharedTripService:(id)a3 didReceiveSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4;
- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4;
- (void)sharedTripServiceDidUpdateReceivingAvailability:(id)a3;
@end

@implementation SharedTripsTableDataSource

- (SharedTripsTableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4 tableViewReloadEvent:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)SharedTripsTableDataSource;
  v12 = [(SharedTripsTableDataSource *)&v25 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tableView, a3);
    [(UITableView *)v13->_tableView setDataSource:v13];
    id v14 = [v10 copy];
    id cellProvider = v13->_cellProvider;
    v13->_id cellProvider = v14;

    if (v11)
    {
      id v16 = [v11 copy];
      id tableViewReloadEvent = v13->_tableViewReloadEvent;
      v13->_id tableViewReloadEvent = v16;
    }
    v18 = +[MSPSharedTripService sharedInstance];
    uint64_t v19 = [v18 receivedTrips];
    sharedTrips = v13->_sharedTrips;
    v13->_sharedTrips = (NSArray *)v19;

    v21 = sub_100933F40();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = sub_100099700(v13->_sharedTrips, &stru_1013028A8);
      *(_DWORD *)buf = 134349314;
      v27 = v13;
      __int16 v28 = 2112;
      v29 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with shared trips: %@", buf, 0x16u);
    }
    v23 = +[MSPSharedTripService sharedInstance];
    [v23 addReceivingObserver:v13];
  }
  return v13;
}

- (void)dealloc
{
  v3 = sub_100933F40();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)SharedTripsTableDataSource;
  [(SharedTripsTableDataSource *)&v4 dealloc];
}

- (void)setSelectedTrip:(id)a3
{
}

- (void)setSelectedTrip:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedTrip);

  if (WeakRetained != v6)
  {
    v8 = sub_100933F40();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v6 groupIdentifier];
      int v10 = 134349314;
      id v11 = self;
      __int16 v12 = 2112;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Selecting trip: %@", (uint8_t *)&v10, 0x16u);
    }
    objc_storeWeak((id *)&self->_selectedTrip, v6);
    [(SharedTripsTableDataSource *)self _updateTableSelection:v4];
  }
}

- (id)sharedTripAtIndexPath:(id)a3
{
  id v4 = [a3 row];
  if (v4 >= (id)[(NSArray *)self->_sharedTrips count])
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_sharedTrips objectAtIndexedSubscript:v4];
  }

  return v5;
}

- (unint64_t)numberOfSharedTrips
{
  return [(NSArray *)self->_sharedTrips count];
}

- (void)_updateTableSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = [(UITableView *)self->_tableView indexPathForSelectedRow];
  v5 = [(SharedTripsTableDataSource *)self selectedTrip];
  if (v11)
  {

    if (!v5) {
      [(UITableView *)self->_tableView deselectRowAtIndexPath:v11 animated:v3];
    }
  }
  else if (v5)
  {
    NSUInteger v6 = [(NSArray *)self->_sharedTrips count];

    if (v6)
    {
      sharedTrips = self->_sharedTrips;
      v8 = [(SharedTripsTableDataSource *)self selectedTrip];
      id v9 = [(NSArray *)sharedTrips indexOfObject:v8];

      if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        [(SharedTripsTableDataSource *)self setSelectedTrip:0];
      }
      else
      {
        int v10 = +[NSIndexPath indexPathForRow:v9 inSection:0];
        if (([0 isEqual:v10] & 1) == 0) {
          [(UITableView *)self->_tableView selectRowAtIndexPath:0 animated:v3 scrollPosition:1];
        }
      }
    }
  }
}

- (void)_updateCellForSharedTrip:(id)a3
{
  sharedTrips = self->_sharedTrips;
  v5 = [a3 equalityTest];
  id v6 = [(NSArray *)sharedTrips indexOfObjectPassingTest:v5];

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = +[NSIndexPath indexPathForRow:v6 inSection:0];
    tableView = self->_tableView;
    int v10 = v7;
    id v9 = +[NSArray arrayWithObjects:&v10 count:1];
    [(UITableView *)tableView reloadRowsAtIndexPaths:v9 withRowAnimation:5];

    [(SharedTripsTableDataSource *)self _updateTableSelection:0];
  }
}

- (void)_updateTableView
{
  [(UITableView *)self->_tableView reloadData];
  [(SharedTripsTableDataSource *)self _updateTableSelection:1];
  id tableViewReloadEvent = self->_tableViewReloadEvent;
  if (tableViewReloadEvent)
  {
    id v4 = (void (*)(void))*((void *)tableViewReloadEvent + 2);
    v4();
  }
}

- (void)_updateTableViewWithTrip:(id)a3
{
  id v4 = a3;
  v5 = self->_sharedTrips;
  id v6 = GEOResultRefinementSort_ptr;
  v7 = +[MSPSharedTripService sharedInstance];
  v8 = [v7 receivedTrips];

  id v9 = [(NSArray *)v5 count];
  id v10 = [v8 count];
  char v11 = 1;
  if (v4 && v9 == v10)
  {
    if ([(NSArray *)self->_sharedTrips count])
    {
      id v25 = v4;
      uint64_t v12 = 0;
      while (1)
      {
        v13 = [(NSArray *)v5 objectAtIndexedSubscript:v12];
        id v14 = [v8 objectAtIndexedSubscript:v12];
        uint64_t v15 = [v14 groupIdentifier];
        if (!v15) {
          break;
        }
        id v16 = (void *)v15;
        v17 = [v13 groupIdentifier];
        v18 = [v14 groupIdentifier];
        unsigned int v19 = [v17 isEqualToString:v18];

        if (!v19) {
          break;
        }

        if (++v12 >= [(NSArray *)self->_sharedTrips count])
        {
          char v11 = 0;
          goto LABEL_10;
        }
      }

      char v11 = 1;
LABEL_10:
      id v4 = v25;
      id v6 = GEOResultRefinementSort_ptr;
    }
    else
    {
      char v11 = 0;
    }
  }
  v20 = [v6[311] sharedInstance];
  v21 = [v20 receivedTrips];
  sharedTrips = self->_sharedTrips;
  self->_sharedTrips = v21;

  v23 = sub_100933F40();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = sub_100099700(self->_sharedTrips, &stru_1013028C8);
    *(_DWORD *)buf = 134349314;
    v27 = self;
    __int16 v28 = 2112;
    v29 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[%{public}p] Updated shared trips: %@", buf, 0x16u);
  }
  if (v11) {
    [(SharedTripsTableDataSource *)self _updateTableView];
  }
  else {
    [(SharedTripsTableDataSource *)self _updateCellForSharedTrip:v4];
  }
}

- (void)sharedTripServiceDidUpdateReceivingAvailability:(id)a3
{
}

- (void)sharedTripService:(id)a3 didReceiveSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4
{
}

- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4
{
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_sharedTrips count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id cellProvider = (void (**)(id, id, id, void *))self->_cellProvider;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(SharedTripsTableDataSource *)self sharedTripAtIndexPath:v7];
  id v10 = cellProvider[2](cellProvider, v8, v7, v9);

  return v10;
}

- (GEOSharedNavState)selectedTrip
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedTrip);

  return (GEOSharedNavState *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectedTrip);
  objc_storeStrong((id *)&self->_sharedTrips, 0);
  objc_storeStrong(&self->_tableViewReloadEvent, 0);
  objc_storeStrong(&self->_cellProvider, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end