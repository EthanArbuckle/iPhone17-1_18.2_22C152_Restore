@interface NNChangeSerializer
- (id)changeFromData:(id)a3 ofType:(int64_t)a4;
- (id)dataFromChange:(id)a3;
@end

@implementation NNChangeSerializer

- (id)dataFromChange:(id)a3
{
  id v3 = a3;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v3;
    v7 = +[NSMutableDictionary dictionary];
    v8 = [v6 resultIdentifier];
    if (v8) {
      [v7 setObject:v8 forKeyedSubscript:@"identifier"];
    }
    v9 = [v6 requestDate];
    if (v9) {
      [v7 setObject:v9 forKeyedSubscript:@"date"];
    }
    id v10 = [v7 copy];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = 0;
      goto LABEL_16;
    }
    id v6 = [v3 result];
    NNHeadlineSyncableResultFromResult(v6, 1);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (v5 && v10)
  {
    v19 = v5;
    id v20 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v16 = 0;
    v12 = +[NSPropertyListSerialization dataWithPropertyList:v11 format:200 options:0 error:&v16];
    v13 = v16;

    if (!v12)
    {
      v14 = NNSetupCompanionSyncLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000094A0((uint64_t)v13, v14);
      }
    }
    goto LABEL_19;
  }
LABEL_16:
  v13 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Couldn't make data for change %@", buf, 0xCu);
  }
  v12 = 0;
LABEL_19:

  return v12;
}

- (id)changeFromData:(id)a3 ofType:(int64_t)a4
{
  v5 = (NNHeadlineRequestChange *)a3;
  id v28 = 0;
  id v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&v28];
  id v7 = v28;
  if (!v6)
  {
    v8 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100009518((uint64_t)v5, (uint64_t)v7, v8);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = v6;
    if ([v9 count] != (id)1)
    {
      v11 = NNSetupCompanionSyncLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = (NNHeadlineRequestChange *)v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Expected a dictionary, got a %@", buf, 0xCu);
      }
      goto LABEL_35;
    }
    id v10 = [v9 allKeys];
    v11 = [v10 firstObject];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v20 = NNSetupCompanionSyncLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v30 = (NNHeadlineRequestChange *)v11;
        __int16 v31 = 2112;
        int64_t v32 = (int64_t)v9;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Invalid objects for ClassName %@ and Dictionary %@", buf, 0x16u);
      }

      goto LABEL_35;
    }
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    unsigned int v14 = [v11 isEqualToString:v13];

    if (v14)
    {
      v15 = [v9 allValues];
      id v16 = [v15 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [v9 objectForKeyedSubscript:@"identifier"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v17 = 0;
        }
        id v18 = [v9 objectForKeyedSubscript:@"date"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          id v18 = 0;
        }
        v19 = [[NNHeadlineRequestChange alloc] initWithResultIdentifier:v17 requestDate:v18];

        goto LABEL_30;
      }
    }
    else
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      unsigned int v23 = [v11 isEqualToString:v22];

      if (!v23) {
        goto LABEL_35;
      }
      v24 = [v9 allValues];
      id v16 = [v24 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [[NNHeadlineResultChange alloc] initWithHeadlineResult:v16];
        goto LABEL_30;
      }
      v25 = NNSetupCompanionSyncLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v16;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Why does this change have an invalid result %@?", buf, 0xCu);
      }
    }
    v19 = 0;
LABEL_30:

    if (!v19
      || ([(NNHeadlineRequestChange *)v19 conformsToProtocol:&OBJC_PROTOCOL___SYChange] & 1) != 0)
    {
      goto LABEL_36;
    }
    v26 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Invalid change %@", buf, 0xCu);
    }

LABEL_35:
    v19 = 0;
LABEL_36:

    goto LABEL_37;
  }
  v9 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v5;
    __int16 v31 = 2048;
    int64_t v32 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Expected a data object, got a %@ with type %ld", buf, 0x16u);
  }
  v19 = 0;
LABEL_37:

  return v19;
}

@end