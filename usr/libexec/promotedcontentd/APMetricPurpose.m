@interface APMetricPurpose
- (APDestination)destination;
- (APEventChannel)channel;
- (APMetricPurpose)initWithPurposeDefinition:(id)a3;
- (APMetricPurpose)initWithPurposeJSON:(id)a3;
- (BOOL)_validateMetric:(id)a3 forKey:(id)a4 fromDictionary:(id)a5;
- (BOOL)_validateMetric:(id)a3 withMetrics:(id)a4;
- (BOOL)_validateRouteDefinition:(id)a3;
- (BOOL)metricIsDefined:(int64_t)a3;
- (BOOL)metricIsDiagnosticsAndUsage:(int64_t)a3;
- (BOOL)metricIsDisabled:(int64_t)a3;
- (NSDictionary)metrics;
- (NSString)name;
- (id)_metricsByNumber:(id)a3;
- (id)stringForMetric:(int64_t)a3;
- (int64_t)purpose;
@end

@implementation APMetricPurpose

- (BOOL)_validateMetric:(id)a3 forKey:(id)a4 fromDictionary:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v9 objectForKeyedSubscript:@"value"];
    v11 = [v9 objectForKeyedSubscript:@"dnu"];
    v12 = [v9 objectForKeyedSubscript:@"disabled"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      && (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
    {
      BOOL v13 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = APLogForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138543874;
          id v19 = v7;
          __int16 v20 = 2114;
          id v21 = v8;
          __int16 v22 = 2114;
          v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "The purpose (%{public}@) metric (%{public}@) value (%{public}@) isn't a number!", (uint8_t *)&v18, 0x20u);
        }
      }
      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = APLogForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138543874;
            id v19 = v7;
            __int16 v20 = 2114;
            id v21 = v8;
            __int16 v22 = 2114;
            v23 = v11;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "The purpose (%{public}@) metric (%{public}@) dnu (%{public}@) isn't a number!", (uint8_t *)&v18, 0x20u);
          }
        }
      }
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v16 = APLogForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138543874;
            id v19 = v7;
            __int16 v20 = 2114;
            id v21 = v8;
            __int16 v22 = 2114;
            v23 = v12;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "The purpose (%{public}@) metric (%{public}@) dnu (%{public}@) isn't a number!", (uint8_t *)&v18, 0x20u);
          }
        }
      }
      BOOL v13 = 0;
    }
  }
  else
  {
    v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543618;
      id v19 = v7;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "The purpose (%{public}@) value for metric (%{public}@) isn't a dictionary!", (uint8_t *)&v18, 0x16u);
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_validateMetric:(id)a3 withMetrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v6;
      int v18 = "The purpose (%{public}@) metrics are nil!";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
    }
LABEL_22:
    BOOL v17 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = APLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v6;
      int v18 = "The purpose (%{public}@) metrics in the definition isn't a dictionary!";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    char v12 = 1;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = APLogForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v25 = v6;
            __int16 v26 = 2114;
            uint64_t v27 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "The purpose (%{public}@) has a metric key (%{public}@) that is not a string!", buf, 0x16u);
          }

          char v12 = 0;
        }
        v16 = [v8 objectForKeyedSubscript:v14];
        if (![(APMetricPurpose *)self _validateMetric:v6 forKey:v14 fromDictionary:v16])char v12 = 0; {
      }
        }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v10);
    BOOL v17 = v12 & 1;
  }
  else
  {
    BOOL v17 = 1;
  }
LABEL_23:

  return v17;
}

- (BOOL)_validateRouteDefinition:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v23 = 0;
      id v7 = "The purpose definition can not be nil!";
      id v8 = v5;
      uint32_t v9 = 2;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, v23, v9);
    }
LABEL_23:

    BOOL v18 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = APLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v23 = 138543362;
      *(void *)&v23[4] = v4;
      id v7 = "The purpose definition is not a dictionary! %{public}@";
      id v8 = v5;
      uint32_t v9 = 12;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  v5 = [v4 objectForKeyedSubscript:@"name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = 1;
  }
  else
  {
    id v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v23 = 138543362;
      *(void *)&v23[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "The name (%{public}@) isn't a string!", v23, 0xCu);
    }

    int v6 = 0;
  }
  uint64_t v11 = [v4 objectForKeyedSubscript:@"purpose"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long v23 = 138543618;
      *(void *)&v23[4] = v5;
      *(_WORD *)&v23[12] = 2114;
      *(void *)&v23[14] = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "The purpose (%{public}@) number (%{public}@) in the definition isn't a number!", v23, 0x16u);
    }

    goto LABEL_23;
  }
  unint64_t v12 = (unint64_t)[v11 integerValue];
  uint64_t v13 = [v4 objectForKeyedSubscript:@"dest"];
  uint64_t v14 = (void *)v13;
  if ((v12 & 0x8000000000000000) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = +[NSURL URLWithString:v14];
      if (v15)
      {
LABEL_32:

        goto LABEL_33;
      }
      v16 = APLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v23 = 138543618;
        *(void *)&v23[4] = v5;
        *(_WORD *)&v23[12] = 2114;
        *(void *)&v23[14] = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "The purpose (%{public}@) destination (%{public}@) can not be converted to a URL!", v23, 0x16u);
      }

LABEL_31:
      int v6 = 0;
      goto LABEL_32;
    }
    v15 = APLogForCategory();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)long long v23 = 138543618;
    *(void *)&v23[4] = v5;
    *(_WORD *)&v23[12] = 2114;
    *(void *)&v23[14] = v14;
    long long v20 = "The purpose (%{public}@) destination (%{public}@) in the definition isn't a String!";
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v20, v23, 0x16u);
    goto LABEL_31;
  }
  if (v13)
  {
    v15 = APLogForCategory();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    *(_DWORD *)long long v23 = 138543618;
    *(void *)&v23[4] = v5;
    *(_WORD *)&v23[12] = 2114;
    *(void *)&v23[14] = v14;
    long long v20 = "The purpose (%{public}@) has a destination (%{public}@) when it shouldn't!";
    goto LABEL_30;
  }
LABEL_33:
  long long v21 = [v4 objectForKeyedSubscript:@"metrics" *(_OWORD *)v23, *(void *)&v23[16]];
  if (![(APMetricPurpose *)self _validateMetric:v5 withMetrics:v21]) {
    int v6 = 0;
  }
  if (!v6)
  {
    long long v22 = APLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v23 = 138543362;
      *(void *)&v23[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "There were type errors in the purpose definition: %{public}@", v23, 0xCu);
    }
  }
  BOOL v18 = v6 != 0;
LABEL_24:

  return v18;
}

- (id)_metricsByNumber:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v5 objectForKeyedSubscript:v10];
        unint64_t v12 = [v11 objectForKeyedSubscript:@"value"];
        uint64_t v13 = [v11 objectForKeyedSubscript:@"dnu"];
        if (v13) {
          +[NSDictionary dictionaryWithObjectsAndKeys:v10, @"name", v13, @"dnu", 0, (void)v19];
        }
        else {
        uint64_t v14 = +[NSDictionary dictionaryWithObjectsAndKeys:v10, @"name", 0, v17, v18, (void)v19];
        }
        [v4 setObject:v14 forKeyedSubscript:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  v15 = +[NSDictionary dictionaryWithDictionary:v4];

  return v15;
}

- (APMetricPurpose)initWithPurposeJSON:(id)a3
{
  id v11 = 0;
  id v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:&v11];
  id v5 = v11;
  if (v5)
  {
    id v6 = +[NSString stringWithFormat:@"Error parsing purpose JSON data: %@", v5];
    id v7 = APLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error parsing purpose JSON data: %{public}@", buf, 0xCu);
    }

    APSimulateCrash();
    goto LABEL_5;
  }
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self = [(APMetricPurpose *)self initWithPurposeDefinition:v4];
      uint64_t v8 = self;
      goto LABEL_6;
    }
    id v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "Parsed purpose definition isn't a dictionary!";
      goto LABEL_14;
    }
  }
  else
  {
    id v6 = APLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v10 = "Parsed purpose definition is nil!";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    }
  }
LABEL_5:

  uint64_t v8 = 0;
LABEL_6:

  return v8;
}

- (APMetricPurpose)initWithPurposeDefinition:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"purpose"];
  id v6 = [v5 integerValue];

  id v7 = +[APMetricPurposeRegistry metricRouteForPurpose:v6];
  if (v7)
  {
    uint64_t v8 = +[NSString stringWithFormat:@"Metric Route (%d) should not be created more than once, exiting!", v6];
    uint32_t v9 = APLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v27 = (int)v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Metric Route (%d) should not be created more than once, exiting!", buf, 8u);
    }

    APSimulateCrash();
  }
  if ([(APMetricPurpose *)self _validateRouteDefinition:v4])
  {
    v25.receiver = self;
    v25.super_class = (Class)APMetricPurpose;
    uint64_t v10 = [(APMetricPurpose *)&v25 init];
    if (v10)
    {
      uint64_t v11 = [v4 objectForKeyedSubscript:@"name"];
      name = v10->_name;
      v10->_name = (NSString *)v11;

      id v13 = [v4 objectForKeyedSubscript:@"purpose"];
      v10->_purpose = (int64_t)[v13 integerValue];

      uint64_t v14 = [APDestination alloc];
      v15 = [v4 objectForKeyedSubscript:@"dest"];
      v16 = [(APDestination *)v14 initWithString:v15];
      destination = v10->_destination;
      v10->_destination = v16;

      uint64_t v18 = [[APEventChannel alloc] initWithDestination:v10->_destination purpose:v10->_purpose];
      channel = v10->_channel;
      v10->_channel = v18;

      long long v20 = [v4 objectForKeyedSubscript:@"metrics"];
      uint64_t v21 = [(APMetricPurpose *)v10 _metricsByNumber:v20];
      metrics = v10->_metrics;
      v10->_metrics = (NSDictionary *)v21;

      +[APMetricPurposeRegistry setMetricPurpose:v10];
    }
    self = v10;
    long long v23 = self;
  }
  else
  {
    long long v23 = 0;
  }

  return v23;
}

- (BOOL)metricIsDefined:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  id v5 = [(NSDictionary *)self->_metrics objectForKeyedSubscript:v4];
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (BOOL)metricIsDiagnosticsAndUsage:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  id v5 = [(NSDictionary *)self->_metrics objectForKeyedSubscript:v4];
  id v6 = [v5 objectForKeyedSubscript:@"dnu"];
  unsigned __int8 v7 = [v6 BOOLValue];

  return v7;
}

- (BOOL)metricIsDisabled:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  id v5 = [(NSDictionary *)self->_metrics objectForKeyedSubscript:v4];
  id v6 = [v5 objectForKeyedSubscript:@"disabled"];
  unsigned __int8 v7 = [v6 BOOLValue];

  return v7;
}

- (id)stringForMetric:(int64_t)a3
{
  id v4 = +[NSNumber numberWithInteger:a3];
  id v5 = [(NSDictionary *)self->_metrics objectForKeyedSubscript:v4];
  id v6 = [v5 objectForKeyedSubscript:@"name"];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (APEventChannel)channel
{
  return self->_channel;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (APDestination)destination
{
  return self->_destination;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_channel, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end