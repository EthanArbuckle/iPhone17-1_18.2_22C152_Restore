@interface SearchActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation SearchActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    [v7 setObject:&off_1013A7738 forKeyedSubscript:@"GEOMapServiceTraits_Source"];
    id v8 = v5;
    v9 = [v6 coordinator];

    if (v9)
    {
      v10 = sub_1000A930C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = [v8 searchItem];
        int v22 = 138412546;
        id v23 = v11;
        __int16 v24 = 2112;
        v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "SearchActionHandler : doSearchItem item %@ userInfo %@", (uint8_t *)&v22, 0x16u);
      }
      uint64_t v12 = [v6 coordinator];
    }
    else
    {
      v15 = [v6 navActionCoordinator];

      if (!v15)
      {
        if ([v6 isCarPlayOnlyContext])
        {
          v13 = +[CarChromeModeCoordinator sharedInstance];
          v14 = [v8 searchItem];
          [v13 displayRoutePlanningForDestination:v14 userInfo:v7];
        }
        else
        {
          v20 = sub_1000A930C();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = [v8 searchItem];
            int v22 = 138412546;
            id v23 = v21;
            __int16 v24 = 2112;
            v25 = v7;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "SearchActionHandler : appCoordinator item %@ userInfo %@", (uint8_t *)&v22, 0x16u);
          }
          v13 = [v6 appCoordinator];
          v14 = [v8 searchItem];
          [v13 openSearch:v14 userInfo:v7];
        }
        goto LABEL_7;
      }
      if (((MapsFeature_IsEnabled_DrivingMultiWaypointRoutes() & 1) != 0
         || (MapsFeature_IsEnabled_Maps420() & 1) != 0
         || MapsFeature_IsEnabled_Maps182())
        && [v8 searchAlongRoute])
      {
        v16 = sub_1000A930C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v22) = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "SearchActionHandler: handleSearchActionUsingSearchFieldItem.", (uint8_t *)&v22, 2u);
        }

        v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 searchAlongRoute]);
        [v7 setObject:v17 forKeyedSubscript:@"SearchAlongRoute"];

        v13 = [v6 navActionCoordinator];
        v14 = [v8 searchItem];
        [v13 handleSearchActionUsingSearchFieldItem:v14 withUserInfo:v7];
        goto LABEL_7;
      }
      v18 = sub_1000A930C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = [v8 searchItem];
        int v22 = 138412546;
        id v23 = v19;
        __int16 v24 = 2112;
        v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "SearchActionHandler : doSearchItem item %@ userInfo %@", (uint8_t *)&v22, 0x16u);
      }
      uint64_t v12 = [v6 navActionCoordinator];
    }
    v13 = (void *)v12;
    v14 = [v8 searchItem];
    [v13 viewController:0 doSearchItem:v14 withUserInfo:v7];
LABEL_7:

    goto LABEL_10;
  }
  v7 = sub_1000A930C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v22 = 138412290;
    id v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "SearchActionHandler : action is not a SearchAction %@ ", (uint8_t *)&v22, 0xCu);
  }
LABEL_10:
}

@end