@interface MODataDumpFormatter
- (BOOL)persistWithoutRandomization;
- (MOConfigurationManager)configManager;
- (MODataDumpFormatter)initWithEvents:(id)a3 bundles:(id)a4 ranking:(id)a5 settings:(id)a6 configManager:(id)a7;
- (id)extractJSONPayload;
- (void)_saveToDictionary:(id)a3 object:(id)a4 forKey:(id)a5;
- (void)setConfigManager:(id)a3;
- (void)setPersistWithoutRandomization:(BOOL)a3;
@end

@implementation MODataDumpFormatter

- (MODataDumpFormatter)initWithEvents:(id)a3 bundles:(id)a4 ranking:(id)a5 settings:(id)a6 configManager:(id)a7
{
  id v28 = a3;
  id v26 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    v30.receiver = self;
    v30.super_class = (Class)MODataDumpFormatter;
    v17 = [(MODataDumpFormatter *)&v30 init];
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_events, a3);
      objc_storeStrong((id *)&v18->_bundles, a4);
      objc_storeStrong((id *)&v18->_ranking, a5);
      objc_storeStrong((id *)&v18->_settings, a6);
      objc_storeStrong((id *)&v18->_configManager, a7);
      v19 = [(NSDictionary *)v18->_settings objectForKey:@"kMODataWithoutRandomization"];
      v18->_persistWithoutRandomization = [v19 BOOLValue];

      v20 = [[MOEventSerializationSessionHelper alloc] initWithRandomization:!v18->_persistWithoutRandomization];
      eventSerializer = v18->_eventSerializer;
      v18->_eventSerializer = v20;
    }
    self = v18;
    v22 = self;
  }
  else
  {
    v23 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MODataDumpFormatter initWithEvents:bundles:ranking:settings:configManager:](v23);
    }

    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"MODataDumpFormatter.m" lineNumber:51 description:@"Invalid parameter not satisfying: configManager"];

    v22 = 0;
  }

  return v22;
}

- (id)extractJSONPayload
{
  id v28 = objc_opt_new();
  v3 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v4 = self->_events;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v34;
    double v8 = 3.40282347e38;
    double v9 = 1.17549435e-38;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(v4);
        }
        v11 = [(MOEventSerializationSessionHelper *)self->_eventSerializer serializeEvent:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        if (v11)
        {
          [v3 addObject:v11];
          v12 = [v11 objectForKeyedSubscript:@"eventStartDate"];
          [v12 doubleValue];
          double v14 = v13;

          id v15 = [v11 objectForKeyedSubscript:@"eventEndDate"];
          [v15 doubleValue];
          double v17 = v16;

          if (v14 < v8) {
            double v8 = v14;
          }
          if (v17 > v9) {
            double v9 = v17;
          }
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 3.40282347e38;
    double v9 = 1.17549435e-38;
  }

  [v28 setObject:v3 forKey:@"kMOEvent"];
  if ([v3 count])
  {
    v18 = +[NSNumber numberWithDouble:v8];
    [v28 setObject:v18 forKey:@"kMOStartTimeFromEventWithEarliestStartDate"];

    v19 = +[NSNumber numberWithDouble:v9];
    [v28 setObject:v19 forKey:@"kMOEndTimeFromEventWithLatestEndDate"];
  }
  v20 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v21 = self->_bundles;
  id v22 = [(NSArray *)v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v21);
        }
        id v26 = [(MOEventSerializationSessionHelper *)self->_eventSerializer serializeEventBundle:*(void *)(*((void *)&v29 + 1) + 8 * (void)j)];
        if (v26) {
          [v20 addObject:v26];
        }
      }
      id v23 = [(NSArray *)v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v23);
  }

  [v28 setObject:v20 forKey:@"kMOEventBundle"];

  return v28;
}

- (void)_saveToDictionary:(id)a3 object:(id)a4 forKey:(id)a5
{
  if (a4)
  {
    if (a5) {
      [a3 setObject:a4 forKey:a5];
    }
  }
}

- (MOConfigurationManager)configManager
{
  return self->_configManager;
}

- (void)setConfigManager:(id)a3
{
}

- (BOOL)persistWithoutRandomization
{
  return self->_persistWithoutRandomization;
}

- (void)setPersistWithoutRandomization:(BOOL)a3
{
  self->_persistWithoutRandomization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_eventSerializer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_ranking, 0);
  objc_storeStrong((id *)&self->_bundles, 0);

  objc_storeStrong((id *)&self->_events, 0);
}

- (void)initWithEvents:(os_log_t)log bundles:ranking:settings:configManager:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configManager", v1, 2u);
}

@end