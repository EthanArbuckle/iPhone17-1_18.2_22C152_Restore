@interface APDBAdInstance
- (BOOL)deleteAdInstancesWithNoEvents;
- (BOOL)insertAdInstanceWithHandle:(id)a3 bundleId:(id)a4 adamId:(id)a5 adMetadata:(id)a6 properties:(id)a7;
- (BOOL)insertOrUpdateAdInstanceWithHandle:(id)a3 campaign:(id)a4 adGroup:(id)a5 ad:(id)a6 creative:(id)a7 bundleId:(id)a8 searchTermId:(id)a9 adamId:(id)a10 adType:(id)a11 adFormatType:(id)a12 containerType:(id)a13 relay:(id)a14 adMetadata:(id)a15 properties:(id)a16 brand:(id)a17 advertiserCategory:(id)a18;
- (Class)rowClass;
- (id)adInstanceForHandle:(id)a3;
- (id)adInstancesForAdamId:(id)a3;
@end

@implementation APDBAdInstance

- (Class)rowClass
{
  return (Class)objc_opt_class();
}

- (BOOL)insertAdInstanceWithHandle:(id)a3 bundleId:(id)a4 adamId:(id)a5 adMetadata:(id)a6 properties:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = [(APDBAdInstance *)self manager];

  if (!v17)
  {
    v20 = APLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138477827;
      id v25 = (id)objc_opt_class();
      id v21 = v25;
      v22 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v24, 0xCu);
    }
LABEL_9:

    unsigned __int8 v19 = 0;
    goto LABEL_10;
  }
  if (!v12)
  {
    v20 = APLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138477827;
      id v25 = (id)objc_opt_class();
      id v21 = v25;
      v22 = "[%{private}@]: Error storing Ad Instance, NONNULL params are NULL";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v18 = [[APDBAdInstanceRow alloc] initHandle:v12 bundleId:v13 adamId:v14 adMetadata:v15 properties:v16 table:self];
  unsigned __int8 v19 = [v18 save];

LABEL_10:
  return v19;
}

- (BOOL)insertOrUpdateAdInstanceWithHandle:(id)a3 campaign:(id)a4 adGroup:(id)a5 ad:(id)a6 creative:(id)a7 bundleId:(id)a8 searchTermId:(id)a9 adamId:(id)a10 adType:(id)a11 adFormatType:(id)a12 containerType:(id)a13 relay:(id)a14 adMetadata:(id)a15 properties:(id)a16 brand:(id)a17 advertiserCategory:(id)a18
{
  id v57 = a3;
  id v56 = a4;
  id v55 = a5;
  id v54 = a6;
  id v52 = a7;
  id v47 = a8;
  id v53 = a9;
  id v24 = a10;
  id v25 = a11;
  id v26 = a12;
  id v27 = a13;
  id v28 = a14;
  id v29 = a15;
  id v50 = a16;
  id v30 = a17;
  id v31 = a18;
  v48 = self;
  v32 = [(APDBAdInstance *)self manager];

  v51 = v24;
  if (v32)
  {
    if (v57)
    {
      id v44 = v30;
      v33 = v30;
      v34 = v50;
      id v43 = v24;
      v35 = v47;
      id v36 = -[APDBAdInstanceRow initHandle:campaign:adGroup:ad:creative:bundleId:searchTermId:adamId:adType:adFormatType:containerType:relay:adMetadata:properties:brand:advertiserCategory:table:]([APDBAdInstanceRow alloc], "initHandle:campaign:adGroup:ad:creative:bundleId:searchTermId:adamId:adType:adFormatType:containerType:relay:adMetadata:properties:brand:advertiserCategory:table:", v57, v56, v55, v54, v52, v47, v53, v43, v25, v26, v27, v28, v29, v50, v44, v31,
              v48);
      unsigned __int8 v49 = [v36 insertOrUpdateIgnoringNilColumns];
    }
    else
    {
      id v46 = v25;
      v35 = v47;
      v40 = APLogForCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        id v59 = (id)objc_opt_class();
        id v41 = v59;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "[%{private}@]: Error storing Ad Instance, NONNULL params are NULL", buf, 0xCu);
      }
      unsigned __int8 v49 = 0;
      id v25 = v46;
      v33 = v30;
      v34 = v50;
    }
    v39 = v57;
  }
  else
  {
    id v45 = v25;
    v35 = v47;
    v37 = APLogForCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v59 = (id)objc_opt_class();
      id v38 = v59;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nill.", buf, 0xCu);
    }
    unsigned __int8 v49 = 0;
    v39 = v57;
    id v25 = v45;
    v33 = v30;
    v34 = v50;
  }

  return v49;
}

- (id)adInstanceForHandle:(id)a3
{
  id v4 = a3;
  v5 = [(APDBAdInstance *)self manager];
  if (v5)
  {
    if (v4)
    {
      v6 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"handle" forColumnType:3 withValue:v4];
      id v13 = v6;
      v7 = +[NSArray arrayWithObjects:&v13 count:1];
      v8 = [v5 executeSelectQuery:@"SELECT rowid, * FROM APDBAdInstance WHERE handle = ?", self, v7 forTable withParameters];

      if (v8)
      {
        v9 = [v8 firstObject];
      }
      else
      {
        v9 = 0;
      }

      goto LABEL_13;
    }
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      v11 = "[%{private}@]: Error getting adInstance for handle, NONNULL params are NULL";
      goto LABEL_9;
    }
  }
  else
  {
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v15 = (id)objc_opt_class();
      id v10 = v15;
      v11 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (id)adInstancesForAdamId:(id)a3
{
  id v4 = a3;
  v5 = [(APDBAdInstance *)self manager];
  if (v5)
  {
    if (v4)
    {
      v6 = [objc_alloc((Class)APDatabaseColumn) initWithName:@"adamId" forColumnType:3 withValue:v4];
      id v12 = v6;
      v7 = +[NSArray arrayWithObjects:&v12 count:1];
      v8 = [v5 executeSelectQuery:@"SELECT rowid, * FROM APDBAdInstance WHERE adamId = ?", self, v7 forTable withParameters];

      goto LABEL_10;
    }
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = (id)objc_opt_class();
      id v9 = v14;
      id v10 = "[%{private}@]: Error getting adInstance for adamId, NONNULL params are NULL";
      goto LABEL_8;
    }
  }
  else
  {
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v14 = (id)objc_opt_class();
      id v9 = v14;
      id v10 = "[%{private}@]: Error APDatabaseManager is nill.";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    }
  }
  v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)deleteAdInstancesWithNoEvents
{
  v2 = [(APDBAdInstance *)self manager];
  if (v2)
  {
    v3 = [v2 getTableForClass:objc_opt_class()];
    id v4 = v3;
    if (v3)
    {
      [v3 createEventViewIfNeeded];
      unsigned __int8 v5 = [v2 executeQuery:@"DELETE FROM APDBAdInstance WHERE handle IN (SELECT APDBAdInstance.handle FROM APDBAdInstance LEFT JOIN EventView ON APDBAdInstance.handle = EventView.handle WHERE EventView.handle IS NULL)" withParameters:&__NSArray0__struct];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  else
  {
    v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138477827;
      id v10 = (id)objc_opt_class();
      id v7 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nill.", (uint8_t *)&v9, 0xCu);
    }
    unsigned __int8 v5 = 0;
  }

  return v5;
}

@end