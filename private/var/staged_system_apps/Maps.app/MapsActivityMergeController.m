@interface MapsActivityMergeController
- (id)_performProcess;
- (id)mergeActivities:(id)a3;
- (int64_t)_forcedViewMode;
- (void)_mergeActivities;
- (void)_mergeActivitiesIfNeeded;
@end

@implementation MapsActivityMergeController

- (id)mergeActivities:(id)a3
{
  objc_storeStrong((id *)&self->_activities, a3);

  return [(MapsActivityMergeController *)self _performProcess];
}

- (id)_performProcess
{
  [(MapsActivityMergeController *)self _mergeActivitiesIfNeeded];
  mergedActivity = self->_mergedActivity;

  return mergedActivity;
}

- (void)_mergeActivitiesIfNeeded
{
  NSUInteger v3 = [(NSArray *)self->_activities count];
  id v4 = [(NSArray *)self->_activities copy];
  v5 = +[NSUUID UUID];
  v6 = [v5 UUIDString];

  v7 = sub_1000A930C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "_mergeActivitiesIfNeeded (tag %@)", buf, 0xCu);
  }

  v8 = dispatch_get_global_queue(-2, 0);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  v15 = sub_100D36E80;
  v16 = &unk_1012E5D58;
  id v9 = v6;
  id v17 = v9;
  id v10 = v4;
  id v18 = v10;
  dispatch_async(v8, &v13);

  if (v3)
  {
    if (v3 == 1)
    {
      v11 = [(NSArray *)self->_activities lastObject];
      mergedActivity = self->_mergedActivity;
      self->_mergedActivity = v11;
    }
    else
    {
      [(MapsActivityMergeController *)self _mergeActivities];
    }
  }
}

- (void)_mergeActivities
{
  NSUInteger v3 = [(NSArray *)self->_activities objectAtIndexedSubscript:1];
  id v4 = [v3 action];

  v5 = [(NSArray *)self->_activities objectAtIndexedSubscript:1];
  v6 = [v5 mapsActivity];
  id v7 = [v6 copy];

  if (!v7)
  {
    if (v4 && ![v4 isCompatibleWithRestorationTask]
      || ([(NSArray *)self->_activities objectAtIndexedSubscript:0],
          v8 = objc_claimAutoreleasedReturnValue(),
          [v8 mapsActivity],
          id v9 = objc_claimAutoreleasedReturnValue(),
          id v7 = [v9 copy],
          v9,
          v8,
          !v7))
    {
      id v7 = +[MapsActivity mapsActivityPerDefault];
    }
  }
  id v10 = sub_100099700(self->_activities, &stru_101322960);
  v11 = +[GEOURLOptions accumulateObjects:v10];
  if (v11)
  {
    int64_t v12 = [(MapsActivityMergeController *)self _forcedViewMode];
    uint64_t v13 = 0;
    switch(v12)
    {
      case -1:
        goto LABEL_13;
      case 1:
      case 5:
        uint64_t v13 = 2;
        goto LABEL_12;
      case 2:
      case 6:
        uint64_t v13 = 1;
        goto LABEL_12;
      case 3:
        uint64_t v13 = 3;
        goto LABEL_12;
      case 7:
        uint64_t v13 = 4;
        goto LABEL_12;
      default:
LABEL_12:
        [v11 setMapType:v13];
LABEL_13:
        [v7 setDisplayOptions:v11];
        break;
    }
  }
  uint64_t v14 = [[RichMapsActivity alloc] initWithMapsActivity:v7 mapsAction:v4];
  mergedActivity = self->_mergedActivity;
  self->_mergedActivity = v14;

  v16 = +[NSUUID UUID];
  id v17 = [v16 UUIDString];

  id v18 = sub_1000A930C();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "_mergedActivity (tag %@)", buf, 0xCu);
  }

  v19 = self->_mergedActivity;
  v20 = dispatch_get_global_queue(-2, 0);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100D372A8;
  v23[3] = &unk_1012E5D58;
  id v24 = v17;
  v25 = v19;
  v21 = v19;
  id v22 = v17;
  dispatch_async(v20, v23);
}

- (int64_t)_forcedViewMode
{
  v2 = +[NSUserDefaults standardUserDefaults];
  NSUInteger v3 = [v2 objectForKey:@"__internal_ForcedViewMode"];

  if (!v3) {
    return -1;
  }
  id v4 = +[NSUserDefaults standardUserDefaults];
  unint64_t v5 = (unint64_t)[v4 integerForKey:@"__internal_ForcedViewMode"];
  if (v5 > 7) {
    int64_t v6 = -1;
  }
  else {
    int64_t v6 = qword_100F73FA0[v5];
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergedActivity, 0);

  objc_storeStrong((id *)&self->_activities, 0);
}

@end