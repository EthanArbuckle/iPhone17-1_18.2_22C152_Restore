@interface NanoRoutePlanningWaypointRefinementState
- (void)_handleCompletionWithWaypoints:(id)a3 error:(id)a4;
- (void)start;
@end

@implementation NanoRoutePlanningWaypointRefinementState

- (void)start
{
  v3 = [(NanoRoutePlanningState *)self manager];
  v4 = [v3 request];

  v5 = [v4 waypoints];
  v6 = [v4 waypoints];
  v7 = sub_100099700(v6, &stru_101313878);

  id v8 = [v7 count];
  id v9 = [v5 count];
  v10 = sub_1005768D4();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v8 == v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "All waypoints are already refined", buf, 2u);
    }

    [(NanoRoutePlanningWaypointRefinementState *)self _handleCompletionWithWaypoints:v5 error:0];
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      id v30 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Will refine %lu waypoints", buf, 0xCu);
    }

    v12 = [v4 traits];
    id v13 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1009DC9C0;
    v24[3] = &unk_1013138C8;
    v25 = v14;
    id v26 = v12;
    id v27 = v4;
    id v15 = v13;
    id v28 = v15;
    id v16 = v12;
    v17 = v14;
    [v5 enumerateObjectsUsingBlock:v24];
    dispatch_group_leave(v17);
    objc_initWeak((id *)buf, self);
    isolationQueue = self->super._isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1009DCCC0;
    block[3] = &unk_1012E9340;
    objc_copyWeak(&v23, (id *)buf);
    id v21 = v15;
    id v22 = v5;
    id v19 = v15;
    dispatch_group_notify(v17, isolationQueue, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_handleCompletionWithWaypoints:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NanoRoutePlanningState *)self isActive])
  {
    id v8 = sub_100099700(v6, &stru_101313908);
    id v9 = sub_1005768D4();
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v20 = v7;
        __int16 v21 = 2114;
        id v22 = v8;
        BOOL v11 = "Error refining waypoints: %{public}@\nRefinement success: %{public}@";
        v12 = v10;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
        uint32_t v14 = 22;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v12, v13, v11, buf, v14);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v8;
      BOOL v11 = "Refined waypoints (%{public}@)";
      v12 = v10;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      uint32_t v14 = 12;
      goto LABEL_7;
    }

    id v15 = [(NanoRoutePlanningState *)self manager];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1009DD108;
    v16[3] = &unk_101313838;
    id v17 = v6;
    id v18 = v7;
    [v15 updateWithBlock:v16];
  }
}

@end