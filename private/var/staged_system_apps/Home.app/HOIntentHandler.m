@interface HOIntentHandler
+ (id)intentHandlerWithNavigator:(id)a3;
+ (void)handleIntent:(id)a3 withNavigator:(id)a4;
- (BOOL)_shouldHandleMostRecentCameraClipForFilter:(id)a3 timeRange:(id)a4;
- (HOAppNavigator)navigator;
- (id)_serviceTypeFromFilter:(id)a3;
- (id)entityOfType:(int64_t)a3 inEntities:(id)a4;
- (void)handleConfigureIntent:(id)a3;
- (void)handleShowHomeIntent:(id)a3;
- (void)handleShowSingleAccessoryQuickControlsIntent:(id)a3;
- (void)setNavigator:(id)a3;
- (void)showHomeForFilter:(id)a3 withTimeRange:(id)a4;
- (void)showRoomForFilter:(id)a3 withTimeRange:(id)a4;
- (void)showServiceForFilter:(id)a3 withTimeRange:(id)a4;
@end

@implementation HOIntentHandler

+ (id)intentHandlerWithNavigator:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setNavigator:v3];

  return v4;
}

+ (void)handleIntent:(id)a3 withNavigator:(id)a4
{
  id v7 = a3;
  v6 = [a1 intentHandlerWithNavigator:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 handleConfigureIntent:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 handleShowHomeIntent:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 handleShowSingleAccessoryQuickControlsIntent:v7];
      }
    }
  }
}

- (void)showServiceForFilter:(id)a3 withTimeRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 entityName];
  v9 = [v8 description];

  v10 = [v6 home];
  v11 = [v10 description];

  v12 = [v6 room];
  v13 = [v12 description];

  if (!v9)
  {
    v14 = +[HFHomeKitDispatcher sharedDispatcher];
    v15 = [v14 home];

    v16 = [v15 hf_unitaryCameraProfile];
    v17 = v16;
    if (v16)
    {
      v18 = [v16 accessory];
      v9 = [v18 name];
    }
    else
    {
      v9 = 0;
    }
  }
  v19 = [(HOIntentHandler *)self _serviceTypeFromFilter:v6];
  if ([v19 isEqual:HMServiceTypeCameraControl])
  {
    v31 = v11;
    v20 = +[NSDate hf_sharedCalendar];
    [v7 startDateComponents];
    v22 = v21 = v7;
    v23 = [v20 dateFromComponents:v22];

    v24 = [v21 endDateComponents];
    v25 = [v20 dateFromComponents:v24];

    v32 = v21;
    if ([(HOIntentHandler *)self _shouldHandleMostRecentCameraClipForFilter:v6 timeRange:v21])
    {
      v26 = +[NSDate date];

      v27 = HFLogForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v9;
        __int16 v35 = 2112;
        v36 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Adjusted camera:%@ startDate: %@", buf, 0x16u);
      }
    }
    else
    {
      v26 = v23;
    }
    v11 = v31;
    v29 = HFLogForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v34 = v9;
      __int16 v35 = 2112;
      v36 = v26;
      __int16 v37 = 2112;
      v38 = v25;
      __int16 v39 = 2112;
      v40 = v31;
      __int16 v41 = 2112;
      v42 = v13;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Launch camera:%@, startDate:%@, endDate:%@, home:%@, room:%@", buf, 0x34u);
    }

    v30 = [(HOIntentHandler *)self navigator];
    [v30 showCameraWithName:v9 homeName:v31 startDate:v26 endDate:v25 roomName:v13];

    id v7 = v32;
  }
  else
  {
    v28 = [(HOIntentHandler *)self navigator];
    [v28 showServiceWithName:v9 serviceType:v19 homeName:v11 roomName:v13];
  }
}

- (void)handleShowSingleAccessoryQuickControlsIntent:(id)a3
{
  v4 = [a3 accessory];
  v5 = [v4 identifier];

  if (v5)
  {
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:v5];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = +[HFHomeKitDispatcher sharedDispatcher];
    v8 = [v7 homeManager];
    v9 = [v8 homes];

    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) hf_accessoryWithIdentifier:v6];
          if (v14)
          {
            v15 = (void *)v14;
            v16 = [(HOIntentHandler *)self navigator];
            id v17 = [v16 showAccessory:v15 secondaryDestination:0];

            goto LABEL_12;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)showRoomForFilter:(id)a3 withTimeRange:(id)a4
{
  id v6 = a4;
  id v7 = [a3 entityName];
  v8 = [v7 description];

  v9 = +[HFHomeKitDispatcher sharedDispatcher];
  id v10 = [v9 home];

  id v11 = [v10 hf_roomWithName:v8];
  uint64_t v12 = [v11 hf_unitaryCameraProfile];
  v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 accessory];
    v15 = [v14 name];

    v16 = +[NSDate hf_sharedCalendar];
    id v17 = [v6 startDateComponents];
    long long v18 = [v16 dateFromComponents:v17];

    id v26 = v6;
    long long v19 = [v6 endDateComponents];
    long long v20 = [v16 dateFromComponents:v19];

    long long v21 = HFLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v28 = v8;
      __int16 v29 = 2112;
      v30 = v15;
      __int16 v31 = 2112;
      v32 = v18;
      __int16 v33 = 2112;
      v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Displaying unitary camera in room:%@ with one camera:%@ startDate:%@ endDate:%@", buf, 0x2Au);
    }

    v22 = [(HOIntentHandler *)self navigator];
    v23 = [v10 name];
    [v22 showCameraWithName:v15 homeName:v23 startDate:v18 endDate:v20 roomName:v8];

    id v6 = v26;
  }
  else
  {
    v24 = [(HOIntentHandler *)self navigator];
    id v25 = [v24 showRoomWithName:v8];
  }
}

- (void)showHomeForFilter:(id)a3 withTimeRange:(id)a4
{
  v5 = [a3 home];
  id v7 = [v5 description];

  id v6 = [(HOIntentHandler *)self navigator];
  [v6 showHomeForName:v7];
}

- (void)handleShowHomeIntent:(id)a3
{
  id v4 = a3;
  v5 = [v4 filters];
  id v6 = [v5 count];

  id v7 = HFLogForCategory();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handle intent: %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = [v4 filters];
    id v7 = [v9 objectAtIndexedSubscript:0];

    id v10 = [v7 entityType];
    if (v10 == (id)1) {
      goto LABEL_10;
    }
    if (v10 == (id)3)
    {
      id v11 = [v4 time];
      [(HOIntentHandler *)self showRoomForFilter:v7 withTimeRange:v11];
      goto LABEL_12;
    }
    if (v10 != (id)7)
    {
LABEL_10:
      id v11 = [v4 time];
      [(HOIntentHandler *)self showHomeForFilter:v7 withTimeRange:v11];
    }
    else
    {
      id v11 = [v4 time];
      [(HOIntentHandler *)self showServiceForFilter:v7 withTimeRange:v11];
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v8)
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received Intent with missing filter : %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_13:
}

- (void)handleConfigureIntent:(id)a3
{
  id v4 = [a3 entities];
  v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = +[HFHomeKitDispatcher sharedDispatcher];
    id v7 = [v6 homeFuture];
    BOOL v8 = [(HOIntentHandler *)self entityOfType:1 inEntities:v5];
    if (v8)
    {
      v9 = [v6 allHomesFuture];
      __int16 v31 = _NSConcreteStackBlock;
      uint64_t v32 = 3221225472;
      __int16 v33 = sub_100052B14;
      v34 = &unk_1000C3C78;
      id v10 = v8;
      id v35 = v10;
      uint64_t v11 = [v9 flatMap:&v31];

      int v12 = [(HOIntentHandler *)self navigator];
      id v13 = [v10 entityName];
      uint64_t v14 = [v13 description];
      [v12 createOrShowHomeWithName:v14 home:v11];

      id v7 = (void *)v11;
    }
    v15 = [(HOIntentHandler *)self entityOfType:3 inEntities:v5];
    v16 = +[NSError hf_errorWithCode:30];
    id v17 = +[NAFuture futureWithError:v16];

    __int16 v29 = v15;
    if (v15)
    {
      long long v18 = [(HOIntentHandler *)self navigator];
      long long v19 = [v15 entityName];
      [v19 description];
      long long v20 = v8;
      v22 = long long v21 = v6;
      uint64_t v23 = [v18 createOrShowRoomWithName:v22 home:v7];

      id v6 = v21;
      BOOL v8 = v20;

      id v17 = (void *)v23;
    }
    v24 = -[HOIntentHandler entityOfType:inEntities:](self, "entityOfType:inEntities:", 5, v5, v29, v31, v32, v33, v34);
    if (v24)
    {
      id v25 = [(HOIntentHandler *)self navigator];
      id v26 = [v24 entityName];
      v27 = [v26 description];
      id v28 = [v25 createOrEditActionSetWithName:v27 home:v7 switchToHomeTab:0];
    }
  }
}

- (id)entityOfType:(int64_t)a3 inEntities:(id)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", (void)v13) == (id)a3)
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (id)_serviceTypeFromFilter:(id)a3
{
  unint64_t v3 = (unint64_t)[a3 deviceType] - 1;
  if (v3 <= 0x2A && ((0x6EFFFFFFFFFuLL >> v3) & 1) != 0) {
    id v4 = *(id *)*(&off_1000C4408 + v3);
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldHandleMostRecentCameraClipForFilter:(id)a3 timeRange:(id)a4
{
  id v5 = a4;
  if ([a3 deviceType] == (id)42)
  {
    id v6 = [v5 startDateComponents];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (HOAppNavigator)navigator
{
  return self->_navigator;
}

- (void)setNavigator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end