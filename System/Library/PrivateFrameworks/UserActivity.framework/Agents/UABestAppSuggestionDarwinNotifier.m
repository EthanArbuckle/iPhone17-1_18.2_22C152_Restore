@interface UABestAppSuggestionDarwinNotifier
- (NSMutableDictionary)possibleItems;
- (NSUUID)lastUUID;
- (id)bestCornerItemsFromItems:(id)a3;
- (void)setItems:(id)a3;
- (void)setLastUUID:(id)a3;
- (void)setPossibleItems:(id)a3;
@end

@implementation UABestAppSuggestionDarwinNotifier

- (void)setItems:(id)a3
{
  v4 = [(UABestAppSuggestionDarwinNotifier *)self bestCornerItemsFromItems:a3];
  v5 = [v4 firstObject];
  uint64_t v6 = [v5 uuid];

  v7 = [(UABestAppSuggestionDarwinNotifier *)self lastUUID];
  if ([v7 isEqual:v6])
  {
  }
  else
  {
    uint64_t v8 = [(UABestAppSuggestionDarwinNotifier *)self lastUUID];
    uint64_t v9 = v8 | v6;

    if (v9)
    {
      v10 = sub_10000BA18(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = [(UABestAppSuggestionDarwinNotifier *)self lastUUID];
        int v12 = 138412546;
        v13 = v11;
        __int16 v14 = 2112;
        uint64_t v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "NOTIFY BEST CHANGE: %@ -> %@", (uint8_t *)&v12, 0x16u);
      }
      [(UABestAppSuggestionDarwinNotifier *)self setLastUUID:v6];
      notify_post(_UABestAppSuggestionChangedNotification);
    }
  }
}

- (id)bestCornerItemsFromItems:(id)a3
{
  id v3 = a3;
  p_info = &OBJC_METACLASS___UAPingNotifier.info;
  v5 = +[UAUserActivityDefaults sharedDefaults];
  [v5 cornerActionItemTimeout];
  double v7 = v6;

  if (v7 <= 0.0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = +[NSDate dateWithTimeIntervalSinceNow:-v7];
  }
  v32 = +[NSMutableArray array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v3;
  id v9 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v34;
    *(void *)&long long v10 = 138544131;
    long long v30 = v10;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        __int16 v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if (sub_10000AA28((uint64_t)objc_msgSend(v14, "type", v30)) && v8 != 0)
        {
          uint64_t v16 = [v14 when];
          if (v16)
          {
            v17 = (void *)v16;
            [v14 when];
            v19 = v18 = p_info;
            BOOL v20 = sub_100063C78(v19, v8);

            p_info = v18;
            if (v20)
            {
              v21 = sub_10000BA18(0);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                v22 = [v14 uuid];
                v23 = [v22 UUIDString];
                v24 = [v14 when];
                *(_DWORD *)buf = v30;
                v38 = v23;
                __int16 v39 = 2113;
                v40 = v14;
                __int16 v41 = 2114;
                v42 = v24;
                __int16 v43 = 2114;
                v44 = v8;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "BESTAPP: Ignoring item %{public}@/%{private}@ %{public}@, because it is earlier than %{public}@", buf, 0x2Au);

                p_info = v18;
              }
LABEL_22:

              continue;
            }
          }
        }
        v25 = [p_info + 471 sharedDefaults];
        if ([v25 activityReceivingAllowed])
        {
        }
        else
        {
          BOOL v26 = sub_10000AA28((uint64_t)[v14 type]);

          if (v26)
          {
            v21 = sub_10000BA18(0);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v27 = [v14 uuid];
              v28 = [v27 UUIDString];
              *(_DWORD *)buf = 138543619;
              v38 = v28;
              __int16 v39 = 2113;
              v40 = v14;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "BESTAPP: -- Ignoring item %{public}@/%{private}@, because it is not a local action", buf, 0x16u);
            }
            goto LABEL_22;
          }
        }
        [v32 addObject:v14];
      }
      id v11 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v11);
  }

  [v32 sortUsingComparator:&stru_1000C5B60];

  return v32;
}

- (NSMutableDictionary)possibleItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPossibleItems:(id)a3
{
}

- (NSUUID)lastUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLastUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUUID, 0);

  objc_storeStrong((id *)&self->_possibleItems, 0);
}

@end