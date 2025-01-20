@interface CSMapDataQuality
+ (id)sharedInstance;
- (BOOL)turnByTurnDirectionsEnabled;
- (CSMapDataQuality)initWithGEOCountryConfiguration:(id)a3;
- (GEOCountryConfiguration)config;
@end

@implementation CSMapDataQuality

+ (id)sharedInstance
{
  if (qword_1003DD700 != -1) {
    dispatch_once(&qword_1003DD700, &stru_1003B0730);
  }
  v2 = (void *)qword_1003DD6F8;

  return v2;
}

- (CSMapDataQuality)initWithGEOCountryConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSMapDataQuality;
  v6 = [(CSMapDataQuality *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_config, a3);
  }

  return v7;
}

- (BOOL)turnByTurnDirectionsEnabled
{
  config = self->_config;
  if (!config)
  {
    if (qword_1003DB800 != -1) {
      dispatch_once(&qword_1003DB800, &stru_1003B0750);
    }
    v4 = qword_1003DB808;
    if (os_log_type_enabled((os_log_t)qword_1003DB808, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error reading country configuration", (uint8_t *)&v13, 2u);
    }
    config = self->_config;
    if (!config) {
      goto LABEL_13;
    }
  }
  id v5 = [(GEOCountryConfiguration *)config countryCode];

  if (v5)
  {
    if (qword_1003DB800 != -1) {
      dispatch_once(&qword_1003DB800, &stru_1003B0750);
    }
    v6 = (void *)qword_1003DB808;
    if (os_log_type_enabled((os_log_t)qword_1003DB808, OS_LOG_TYPE_DEBUG))
    {
      v7 = self->_config;
      v8 = v6;
      objc_super v9 = [(GEOCountryConfiguration *)v7 countryCode];
      int v13 = 138477827;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Country code %{private}@", (uint8_t *)&v13, 0xCu);
    }
    unsigned int v10 = [(GEOCountryConfiguration *)self->_config currentCountrySupportsDirections];
  }
  else
  {
LABEL_13:
    unsigned int v10 = 0;
  }
  if (qword_1003DB800 != -1) {
    dispatch_once(&qword_1003DB800, &stru_1003B0750);
  }
  v11 = qword_1003DB808;
  if (os_log_type_enabled((os_log_t)qword_1003DB808, OS_LOG_TYPE_INFO))
  {
    int v13 = 67240192;
    LODWORD(v14) = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Turn by turn directions: %{public}d", (uint8_t *)&v13, 8u);
  }
  return v10;
}

- (GEOCountryConfiguration)config
{
  return self->_config;
}

- (void).cxx_destruct
{
}

@end