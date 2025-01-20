@interface RAPRouteFeedbackDataSource
+ (Class)_cellClassForItemType:(unint64_t)a3;
- (Class)cellClassForItemType:(unint64_t)a3;
- (MKMapItem)endWaypointMapItem;
- (NSArray)allItems;
- (NSString)description;
- (RAPRouteFeedbackDataSource)initWithRecording:(id)a3 traitCollection:(id)a4 delegate:(id)a5;
- (UITraitCollection)traitCollection;
- (VGVehicle)vehicle;
- (id)_buildDataSourceForRoute:(id)a3 displayedStepIndices:(id)a4 missedStepIndex:(unint64_t)a5 includeOrigin:(BOOL)a6 includeDestination:(BOOL)a7;
- (id)_buildStepItems;
- (id)_routeForStepItem:(id)a3;
- (id)_stepItemForIndexPath:(id)a3;
- (id)_userPathForStepItem:(id)a3;
- (void)_setNeedsUpdateData;
- (void)_setupRoutes;
- (void)_updateData;
- (void)reloadDataSource:(id)a3;
- (void)reloadStepIndices:(id)a3 forDataSource:(id)a4;
- (void)setEndWaypointMapItem:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)setVehicle:(id)a3;
@end

@implementation RAPRouteFeedbackDataSource

- (RAPRouteFeedbackDataSource)initWithRecording:(id)a3 traitCollection:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RAPRouteFeedbackDataSource;
  v12 = [(RAPRouteFeedbackDataSource *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v11);
    objc_storeStrong((id *)&v13->_recording, a3);
    objc_storeStrong((id *)&v13->_traitCollection, a4);
    id v14 = objc_alloc((Class)MKMapItem);
    v15 = [(RAPDirectionsRecording *)v13->_recording endWaypoint];
    v16 = [v15 placeMapItemStorage];
    id v17 = [v14 initWithGeoMapItem:v16 isPlaceHolderPlace:0];
    [(RAPRouteFeedbackDataSource *)v13 setEndWaypointMapItem:v17];

    [(RAPRouteFeedbackDataSource *)v13 _setupRoutes];
  }

  return v13;
}

- (void)_setupRoutes
{
  recording = self->_recording;
  if (recording)
  {
    v4 = [(RAPDirectionsRecording *)recording userPaths];

    if (v4)
    {
      v5 = objc_opt_new();
      v6 = objc_opt_new();
      v7 = +[NSMapTable strongToStrongObjectsMapTable];
      v8 = +[NSMapTable strongToStrongObjectsMapTable];
      id v9 = [(RAPDirectionsRecording *)self->_recording userPaths];
      id v10 = [v9 sortedArrayUsingComparator:&stru_1012E6478];

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100373524;
      v35[3] = &unk_1012E64A0;
      id v11 = v6;
      id v36 = v11;
      v37 = self;
      id v12 = v7;
      id v38 = v12;
      id v13 = v8;
      id v39 = v13;
      [v10 enumerateObjectsUsingBlock:v35];
      id v14 = [v11 allKeys];
      v15 = [v14 sortedArrayUsingComparator:&stru_1012E64E0];

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100373858;
      v28[3] = &unk_1012E6508;
      id v29 = v11;
      id v30 = v12;
      id v31 = v13;
      v32 = self;
      id v33 = v15;
      id v34 = v5;
      id v16 = v5;
      id v17 = v15;
      id v18 = v13;
      id v19 = v12;
      id v20 = v11;
      [v17 enumerateObjectsUsingBlock:v28];
      v21 = (NSArray *)[v16 copy];
      dataSources = self->_dataSources;
      self->_dataSources = v21;
    }
    else
    {
      id v10 = sub_10058DD3C(self->_recording, 0);
      if (v10)
      {
        uint64_t v23 = [(RAPRouteFeedbackDataSource *)self _buildDataSourceForRoute:v10 displayedStepIndices:0 missedStepIndex:0x7FFFFFFFFFFFFFFFLL includeOrigin:1 includeDestination:1];
        v24 = v23;
        if (v23)
        {
          uint64_t v40 = v23;
          v25 = +[NSArray arrayWithObjects:&v40 count:1];
          p_super = &self->_dataSources->super;
          self->_dataSources = v25;
        }
        else
        {
          p_super = sub_10057670C();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v42 = v10;
            _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_ERROR, "Failed to create a dataSource for route: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        v24 = sub_10057670C();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v27 = self->_recording;
          *(_DWORD *)buf = 138412290;
          v42 = v27;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to create a route from recording: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    id v10 = sub_10057670C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Cannot setup content without a recording", buf, 2u);
    }
  }
}

- (id)_buildDataSourceForRoute:(id)a3 displayedStepIndices:(id)a4 missedStepIndex:(unint64_t)a5 includeOrigin:(BOOL)a6 includeDestination:(BOOL)a7
{
  v7 = (RouteStepListDataSource *)a3;
  if (a3)
  {
    uint64_t v10 = 66;
    if (a6) {
      uint64_t v10 = 67;
    }
    if (a7) {
      uint64_t v11 = v10 | 4;
    }
    else {
      uint64_t v11 = v10;
    }
    id v12 = a4;
    id v13 = v7;
    id v14 = [RouteStepListDataSource alloc];
    v15 = [(RAPRouteFeedbackDataSource *)self traitCollection];
    id v16 = +[RouteStepListMetrics rapMetrics];
    v7 = [(RouteStepListDataSource *)v14 initWithTraitCollection:v15 options:v11 metrics:v16 context:2];

    id v17 = [(RAPRouteFeedbackDataSource *)self traitCollection];
    [(RouteStepListDataSource *)v7 setTraitCollection:v17];

    [(RouteStepListDataSource *)v7 setRoute:v13];
    [(RouteStepListDataSource *)v7 setAllowedStepIndices:v12];

    [(RouteStepListDataSource *)v7 setMissedStepIndex:a5];
    id v18 = [(RAPRouteFeedbackDataSource *)self vehicle];
    [(RouteStepListDataSource *)v7 setVehicle:v18];

    [(RouteStepListDataSource *)v7 setDelegate:self];
  }

  return v7;
}

- (id)_userPathForStepItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = [v7 step];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_24:
      id v13 = sub_10057670C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v33) = 138412290;
        *(void *)((char *)&v33 + 4) = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to find a userPath for stepItem: %@", (uint8_t *)&v33, 0xCu);
      }
      id v21 = 0;
      goto LABEL_29;
    }
    id v9 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0;
    }
    id v7 = v10;

    uint64_t v8 = [v7 arrivalStep];
  }
  uint64_t v11 = (void *)v8;

  if (!v11) {
    goto LABEL_24;
  }
  *(void *)&long long v33 = 0;
  *((void *)&v33 + 1) = &v33;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
  dataSources = self->_dataSources;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100373F5C;
  v27[3] = &unk_1012E6530;
  id v13 = v11;
  v28 = v13;
  id v29 = &v33;
  [(NSArray *)dataSources enumerateObjectsUsingBlock:v27];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = [(RAPDirectionsRecording *)self->_recording userPaths];
  id v15 = [v14 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        unsigned int v19 = [v18 routeIndex];
        if (*(void *)(*((void *)&v33 + 1) + 24) == v19)
        {
          unsigned int v20 = [v18 stepIndex];
          if ([v13 stepIndex] == (id)v20)
          {
            id v21 = v18;
            goto LABEL_28;
          }
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v14 = sub_10057670C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "Failed to find selected userPath for stepItem: %@", buf, 0xCu);
  }
  id v21 = 0;
LABEL_28:

  _Block_object_dispose(&v33, 8);
LABEL_29:

  return v21;
}

- (id)_routeForStepItem:(id)a3
{
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = self->_dataSources;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v11 = [v10 items];
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v28 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v19;
          while (2)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v19 != v14) {
                objc_enumerationMutation(v11);
              }
              if (*(id *)(*((void *)&v18 + 1) + 8 * (void)j) == v4)
              {
                uint64_t v16 = [v10 route];

                goto LABEL_20;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v18 objects:v28 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v29 count:16];
    }
    while (v7);
  }

  sub_10057670C();
  id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, &v5->super, OS_LOG_TYPE_FAULT, "Failed to find route for stepItem: %@", buf, 0xCu);
  }
  uint64_t v16 = 0;
LABEL_20:

  return v16;
}

- (NSArray)allItems
{
  concatenatedStepItems = self->_concatenatedStepItems;
  if (!concatenatedStepItems)
  {
    id v4 = [(RAPRouteFeedbackDataSource *)self _buildStepItems];
    id v5 = self->_concatenatedStepItems;
    self->_concatenatedStepItems = v4;

    concatenatedStepItems = self->_concatenatedStepItems;
  }

  return concatenatedStepItems;
}

- (void)setTraitCollection:(id)a3
{
  id v5 = a3;
  traitCollection = self->_traitCollection;
  unint64_t v7 = (unint64_t)v5;
  id v8 = traitCollection;
  if (v7 | (unint64_t)v8)
  {
    id v9 = v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_traitCollection, a3);
      dataSources = self->_dataSources;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10037436C;
      v12[3] = &unk_1012E6558;
      id v13 = (id)v7;
      [(NSArray *)dataSources enumerateObjectsUsingBlock:v12];
    }
  }
}

- (void)setVehicle:(id)a3
{
  id v5 = a3;
  vehicle = self->_vehicle;
  unint64_t v7 = (unint64_t)v5;
  id v8 = vehicle;
  if (v7 | (unint64_t)v8)
  {
    id v9 = v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_vehicle, a3);
      dataSources = self->_dataSources;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100374468;
      v12[3] = &unk_1012E6558;
      id v13 = (id)v7;
      [(NSArray *)dataSources enumerateObjectsUsingBlock:v12];
    }
  }
}

- (id)_buildStepItems
{
  v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_dataSources;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) items];
        [v3 addObjectsFromArray:v9];
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100374634;
  v14[3] = &unk_1012E6580;
  id v15 = v3;
  id v10 = v3;
  [v10 enumerateObjectsUsingBlock:v14];
  uint64_t v11 = [v10 lastObject];
  [v11 setShowsHairline:0];

  id v12 = [v10 copy];

  return v12;
}

- (id)_stepItemForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [v4 section];
  if (v5 == (id)1)
  {
    id v7 = [v4 row];
    if ((uint64_t)v7 < (int64_t)[(NSArray *)self->_concatenatedStepItems count])
    {
      uint64_t v6 = -[NSArray objectAtIndexedSubscript:](self->_concatenatedStepItems, "objectAtIndexedSubscript:", [v4 row]);
      goto LABEL_6;
    }
    id v9 = sub_10057670C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = self->_concatenatedStepItems;
      uint64_t v11 = v10;
      if (v10)
      {
        if ([(NSArray *)v10 count])
        {
          id v12 = [(NSArray *)v11 componentsJoinedByString:@", "];
          id v13 = +[NSString stringWithFormat:@"<%p> [%@]", v11, v12];
        }
        else
        {
          id v13 = +[NSString stringWithFormat:@"<%p> (empty)", v11];
        }
      }
      else
      {
        id v13 = @"<nil>";
      }

      *(_DWORD *)buf = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      long long v18 = (RAPRouteFeedbackDataSource *)v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "_stepItemForIndexPath: called with invalid indexPath: %@, _concatenatedStepItems: %@", buf, 0x16u);
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = [(NSArray *)self->_concatenatedStepItems lastObject];
LABEL_6:
      id v8 = (void *)v6;
      goto LABEL_17;
    }
    id v9 = sub_10057670C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v16 = v4;
      __int16 v17 = 2112;
      long long v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "_stepItemForIndexPath: called with invalid section: %lu, dataSource: %@", buf, 0x16u);
    }
  }

  id v8 = 0;
LABEL_17:

  return v8;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(RAPDirectionsRecording *)self->_recording userPaths];
  id v5 = v4;
  if (v4)
  {
    if ([v4 count])
    {
      uint64_t v6 = [v5 componentsJoinedByString:@", "];
      id v7 = +[NSString stringWithFormat:@"<%p> [%@]", v5, v6];
    }
    else
    {
      id v7 = +[NSString stringWithFormat:@"<%p> (empty)", v5];
    }
  }
  else
  {
    id v7 = @"<nil>";
  }

  id v8 = [(RAPRouteFeedbackDataSource *)self allItems];
  id v9 = v8;
  if (v8)
  {
    if ([v8 count])
    {
      id v10 = [v9 componentsJoinedByString:@", "];
      uint64_t v11 = +[NSString stringWithFormat:@"<%p> [%@]", v9, v10];
    }
    else
    {
      uint64_t v11 = +[NSString stringWithFormat:@"<%p> (empty)", v9];
    }
  }
  else
  {
    uint64_t v11 = @"<nil>";
  }

  vehicle = self->_vehicle;
  id v13 = [(RAPRouteFeedbackDataSource *)self traitCollection];
  uint64_t v14 = +[NSString stringWithFormat:@"<%@ %p: userPaths='%@', allItems='%@', vehicle: %@, traitCollection: %@>", v3, self, v7, v11, vehicle, v13];

  return (NSString *)v14;
}

- (void)_setNeedsUpdateData
{
  if (!self->_needsUpdateData)
  {
    self->_needsUpdateData = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100374B94;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_updateData
{
  if (self->_needsUpdateData)
  {
    concatenatedStepItems = self->_concatenatedStepItems;
    self->_concatenatedStepItems = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dataSourceDidUpdate:self];

    self->_needsUpdateData = 0;
  }
}

- (void)reloadDataSource:(id)a3
{
}

- (void)reloadStepIndices:(id)a3 forDataSource:(id)a4
{
}

- (Class)cellClassForItemType:(unint64_t)a3
{
  return +[RAPRouteFeedbackDataSource _cellClassForItemType:a3];
}

+ (Class)_cellClassForItemType:(unint64_t)a3
{
  if (a3 > 1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = objc_opt_class();
  }
  return (Class)v4;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (MKMapItem)endWaypointMapItem
{
  return self->_endWaypointMapItem;
}

- (void)setEndWaypointMapItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endWaypointMapItem, 0);
  objc_storeStrong((id *)&self->_vehicle, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_concatenatedStepItems, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_recording, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end