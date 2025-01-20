@interface APDBAdInstanceRow
- (BOOL)insertOrUpdateIgnoringNilColumns;
- (NSArray)allEvents;
- (NSArray)impressionEvents;
- (NSArray)interactedEvents;
- (NSData)propertiesData;
- (NSData)relayData;
- (NSDictionary)properties;
- (NSDictionary)relay;
- (id)initHandle:(id)a3 bundleId:(id)a4 adamId:(id)a5 adMetadata:(id)a6 properties:(id)a7 table:(id)a8;
- (id)initHandle:(id)a3 campaign:(id)a4 adGroup:(id)a5 ad:(id)a6 creative:(id)a7 bundleId:(id)a8 searchTermId:(id)a9 adamId:(id)a10 adType:(id)a11 adFormatType:(id)a12 containerType:(id)a13 relay:(id)a14 adMetadata:(id)a15 properties:(id)a16 brand:(id)a17 advertiserCategory:(id)a18 table:(id)a19;
- (id)readOnlyColumns;
- (void)setProperties:(id)a3;
- (void)setPropertiesData:(id)a3;
- (void)setRelay:(id)a3;
- (void)setRelayData:(id)a3;
@end

@implementation APDBAdInstanceRow

- (id)readOnlyColumns
{
  v3 = +[NSSet setWithObjects:@"relay", @"properties", @"allEvents", @"impressionEvents", @"interactedEvents", 0];
  v7.receiver = self;
  v7.super_class = (Class)APDBAdInstanceRow;
  v4 = [(APDBAdInstanceRow *)&v7 readOnlyColumns];
  v5 = [v3 setByAddingObjectsFromSet:v4];

  return v5;
}

- (NSDictionary)relay
{
  return (NSDictionary *)[(APDBAdInstanceRow *)self dictionaryFromBlobForColumnName:@"relayData"];
}

- (void)setRelay:(id)a3
{
}

- (NSDictionary)properties
{
  return (NSDictionary *)[(APDBAdInstanceRow *)self dictionaryFromBlobForColumnName:@"propertiesData"];
}

- (void)setProperties:(id)a3
{
}

- (id)initHandle:(id)a3 campaign:(id)a4 adGroup:(id)a5 ad:(id)a6 creative:(id)a7 bundleId:(id)a8 searchTermId:(id)a9 adamId:(id)a10 adType:(id)a11 adFormatType:(id)a12 containerType:(id)a13 relay:(id)a14 adMetadata:(id)a15 properties:(id)a16 brand:(id)a17 advertiserCategory:(id)a18 table:(id)a19
{
  id v24 = a3;
  id v25 = a4;
  id v26 = a5;
  id v45 = a6;
  id v44 = a7;
  id v43 = a8;
  id v42 = a9;
  id v41 = a10;
  v27 = v26;
  id v40 = a11;
  v28 = v25;
  id v39 = a12;
  id v29 = a13;
  id v30 = a14;
  id v31 = a15;
  id v32 = a16;
  id v33 = a17;
  id v34 = a18;
  v46.receiver = self;
  v46.super_class = (Class)APDBAdInstanceRow;
  id v35 = [(APDBAdInstanceRow *)&v46 initAsNewObjectWithTable:a19];
  v36 = v35;
  if (v35)
  {
    [v35 setValue:v24 forColumnName:@"handle"];
    [v36 setValue:v28 forColumnName:@"campaign"];
    [v36 setValue:v27 forColumnName:@"adGroup"];
    [v36 setValue:v45 forColumnName:@"ad"];
    [v36 setValue:v44 forColumnName:@"creative"];
    [v36 setValue:v43 forColumnName:@"bundleId"];
    [v36 setValue:v42 forColumnName:@"searchTermId"];
    [v36 setValue:v41 forColumnName:@"adamId"];
    [v36 setValue:v40 forColumnName:@"adType"];
    [v36 setValue:v39 forColumnName:@"adFormatType"];
    [v36 setValue:v29 forColumnName:@"containerType"];
    [v36 setRelay:v30];
    [v36 setValue:v31 forColumnName:@"adMetadata"];
    [v36 setProperties:v32];
    [v36 setValue:v33 forColumnName:@"brand"];
    [v36 setValue:v34 forColumnName:@"advertiserCategory"];
  }

  return v36;
}

- (id)initHandle:(id)a3 bundleId:(id)a4 adamId:(id)a5 adMetadata:(id)a6 properties:(id)a7 table:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)APDBAdInstanceRow;
  id v17 = [(APDBAdInstanceRow *)&v20 initAsNewObjectWithTable:a8];
  v18 = v17;
  if (v17)
  {
    [v17 setValue:v13 forColumnName:@"handle"];
    [v18 setValue:v14 forColumnName:@"bundleId"];
    [v18 setValue:v15 forColumnName:@"adMetadata"];
    [v18 setProperties:v16];
  }

  return v18;
}

- (NSArray)allEvents
{
  v3 = [(APDBAdInstanceRow *)self table];
  v4 = [v3 manager];

  if (v4)
  {
    v5 = [v4 getTableForClass:objc_opt_class()];
    v6 = [(APDBAdInstanceRow *)self handle];
    objc_super v7 = [v5 allEventsForHandle:v6];
  }
  else
  {
    v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138477827;
      id v12 = (id)objc_opt_class();
      id v9 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", (uint8_t *)&v11, 0xCu);
    }
    objc_super v7 = 0;
  }

  return (NSArray *)v7;
}

- (NSArray)impressionEvents
{
  v3 = [(APDBAdInstanceRow *)self table];
  v4 = [v3 manager];

  if (v4)
  {
    v5 = [v4 getTableForClass:objc_opt_class()];
    v6 = [(APDBAdInstanceRow *)self handle];
    objc_super v7 = [v5 impressionEventsForHandle:v6];
  }
  else
  {
    v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138477827;
      id v12 = (id)objc_opt_class();
      id v9 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", (uint8_t *)&v11, 0xCu);
    }
    objc_super v7 = 0;
  }

  return (NSArray *)v7;
}

- (NSArray)interactedEvents
{
  v3 = [(APDBAdInstanceRow *)self table];
  v4 = [v3 manager];

  if (v4)
  {
    v5 = [v4 getTableForClass:objc_opt_class()];
    v6 = [(APDBAdInstanceRow *)self handle];
    objc_super v7 = [v5 interactedEventsForHandle:v6];
  }
  else
  {
    v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138477827;
      id v12 = (id)objc_opt_class();
      id v9 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", (uint8_t *)&v11, 0xCu);
    }
    objc_super v7 = 0;
  }

  return (NSArray *)v7;
}

- (BOOL)insertOrUpdateIgnoringNilColumns
{
  v3 = [(APDBAdInstanceRow *)self table];
  v4 = [v3 manager];

  if (v4)
  {
    v27 = v4;
    v35[0] = @"campaign";
    v35[1] = @"adGroup";
    v35[2] = @"ad";
    v35[3] = @"creative";
    v35[4] = @"bundleId";
    v35[5] = @"searchTermId";
    v35[6] = @"adamId";
    v35[7] = @"adType";
    v35[8] = @"adFormatType";
    v35[9] = @"containerType";
    v35[10] = @"relayData";
    v35[11] = @"adMetadata";
    v35[12] = @"propertiesData";
    v35[13] = @"brand";
    v35[14] = @"advertiserCategory";
    v5 = +[NSArray arrayWithObjects:v35 count:15];
    v6 = +[NSMutableArray array];
    objc_super v7 = +[NSMutableArray array];
    v8 = self;
    id v9 = [(APDBAdInstanceRow *)self columns];
    v10 = [v9 objectForKey:@"handle"];

    [v7 addObject:v10];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obj = v5;
    id v11 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v16 = +[NSString stringWithFormat:@"COALESCE((SELECT %@ FROM APDBAdInstance WHERE handle = ?), ?)", v15];
          [v6 addObject:v16];

          v33[0] = v10;
          id v17 = [(APDBAdInstanceRow *)v8 columns];
          v18 = [v17 objectForKey:v15];
          v33[1] = v18;
          v19 = +[NSArray arrayWithObjects:v33 count:2];
          [v7 addObjectsFromArray:v19];
        }
        id v12 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v12);
    }
    objc_super v20 = obj;

    v21 = [obj componentsJoinedByString:@", "];
    v22 = [v6 componentsJoinedByString:@", "];
    v23 = +[NSString stringWithFormat:@"INSERT OR REPLACE INTO APDBAdInstance (handle, %@) VALUES (?, %@)", v21, v22];

    v4 = v27;
    BOOL v24 = [v27 executeInsertQuery:v23 withParameters:v7] != 0;
  }
  else
  {
    objc_super v20 = APLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      id v37 = (id)objc_opt_class();
      id v25 = v37;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "[%{private}@]: Error APDatabaseManager is nil.", buf, 0xCu);
    }
    BOOL v24 = 0;
  }

  return v24;
}

- (NSData)relayData
{
  return self->_relayData;
}

- (void)setRelayData:(id)a3
{
}

- (NSData)propertiesData
{
  return self->_propertiesData;
}

- (void)setPropertiesData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesData, 0);

  objc_storeStrong((id *)&self->_relayData, 0);
}

@end