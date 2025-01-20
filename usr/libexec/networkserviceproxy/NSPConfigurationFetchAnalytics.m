@interface NSPConfigurationFetchAnalytics
- (NSString)configFetchURL;
- (NSString)reason;
- (NSString)requestedServerUUID;
- (double)latency;
- (id)analyticsDict;
- (id)configFetchURLToIndex;
- (id)eventName;
- (int64_t)httpCode;
- (int64_t)nsurlErrorCode;
- (void)setConfigFetchURL:(id)a3;
- (void)setHttpCode:(int64_t)a3;
- (void)setLatency:(double)a3;
- (void)setNsurlErrorCode:(int64_t)a3;
- (void)setReason:(id)a3;
- (void)setRequestedServerUUID:(id)a3;
@end

@implementation NSPConfigurationFetchAnalytics

- (id)eventName
{
  return @"com.apple.nsp.configuration";
}

- (id)configFetchURLToIndex
{
  v3 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];

  if (v3)
  {
    v4 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
    unsigned __int8 v5 = [v4 isEqual:@"https://mask-api.icloud.com/v1/fetchConfigFile"];

    if (v5)
    {
      return &off_10010F6E8;
    }
    else
    {
      v7 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
      unsigned __int8 v8 = [v7 isEqual:@"https://mask-api.icloud.com/v1_1/fetchConfigFile"];

      if (v8)
      {
        return &off_10010F700;
      }
      else
      {
        v9 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
        unsigned __int8 v10 = [v9 isEqual:@"https://mask-api.icloud.com/v1_2/fetchConfigFile"];

        if (v10)
        {
          return &off_10010F718;
        }
        else
        {
          v11 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
          unsigned __int8 v12 = [v11 isEqual:@"https://mask-api.icloud.com/v1_3/fetchConfigFile"];

          if (v12)
          {
            return &off_10010F730;
          }
          else
          {
            v13 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
            unsigned __int8 v14 = [v13 isEqual:@"https://mask-api.icloud.com/v1_4/fetchConfigFile"];

            if (v14)
            {
              return &off_10010F748;
            }
            else
            {
              v15 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
              unsigned __int8 v16 = [v15 isEqual:@"https://mask-api.icloud.com/v1_5/fetchConfigFile"];

              if (v16)
              {
                return &off_10010F760;
              }
              else
              {
                v17 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                unsigned __int8 v18 = [v17 isEqual:@"https://mask-api.icloud.com/v1_6/fetchConfigFile"];

                if (v18)
                {
                  return &off_10010F778;
                }
                else
                {
                  v19 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                  unsigned __int8 v20 = [v19 isEqual:@"https://mask-api.icloud.com/v2_0/fetchConfigFile"];

                  if (v20)
                  {
                    return &off_10010F790;
                  }
                  else
                  {
                    v21 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                    unsigned __int8 v22 = [v21 isEqual:@"https://mask-api.icloud.com/v2_1/fetchConfigFile"];

                    if (v22)
                    {
                      return &off_10010F7A8;
                    }
                    else
                    {
                      v23 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                      unsigned __int8 v24 = [v23 isEqual:@"https://mask-api.icloud.com/v2_2/fetchConfigFile"];

                      if (v24)
                      {
                        return &off_10010F7C0;
                      }
                      else
                      {
                        v25 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                        unsigned __int8 v26 = [v25 isEqual:@"https://mask-api.icloud.com/v2_3/fetchConfigFile"];

                        if (v26)
                        {
                          return &off_10010F7D8;
                        }
                        else
                        {
                          v28 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                          unsigned __int8 v29 = [v28 isEqual:@"https://mask-api.icloud.com/v3_0/fetchConfigFile"];

                          if (v29)
                          {
                            return &off_10010F7F0;
                          }
                          else
                          {
                            v30 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                            unsigned __int8 v31 = [v30 isEqual:@"https://mask-api.icloud.com/v2_4/fetchConfigFile"];

                            if (v31)
                            {
                              return &off_10010F808;
                            }
                            else
                            {
                              v32 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                              unsigned __int8 v33 = [v32 isEqual:@"https://mask-api.icloud.com/v3_1/fetchConfigFile"];

                              if (v33)
                              {
                                return &off_10010F820;
                              }
                              else
                              {
                                v34 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                                unsigned __int8 v35 = [v34 isEqual:@"https://mask-api.icloud.com/v3_2/fetchConfigFile"];

                                if (v35)
                                {
                                  return &off_10010F838;
                                }
                                else
                                {
                                  v36 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                                  unsigned __int8 v37 = [v36 isEqual:@"https://mask-api.icloud.com/v3_3/fetchConfigFile"];

                                  if (v37)
                                  {
                                    return &off_10010F850;
                                  }
                                  else
                                  {
                                    v38 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                                    unsigned __int8 v39 = [v38 isEqual:@"https://mask-api.icloud.com/v3_4/fetchConfigFile"];

                                    if (v39)
                                    {
                                      return &off_10010F868;
                                    }
                                    else
                                    {
                                      v40 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                                      unsigned __int8 v41 = [v40 isEqual:@"https://mask-api.icloud.com/v3_5/fetchConfigFile"];

                                      if (v41)
                                      {
                                        return &off_10010F880;
                                      }
                                      else
                                      {
                                        v42 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                                        unsigned __int8 v43 = [v42 isEqual:@"https://mask-api.icloud.com/v3_6/fetchConfigFile"];

                                        if (v43)
                                        {
                                          return &off_10010F898;
                                        }
                                        else
                                        {
                                          v44 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                                          unsigned __int8 v45 = [v44 isEqual:@"https://mask-api.icloud.com/v4_0/fetchConfigFile"];

                                          if (v45)
                                          {
                                            return &off_10010F8B0;
                                          }
                                          else
                                          {
                                            v46 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                                            unsigned __int8 v47 = [v46 isEqual:@"https://mask-api.icloud.com/v4_1/fetchConfigFile"];

                                            if (v47)
                                            {
                                              return &off_10010F8C8;
                                            }
                                            else
                                            {
                                              v48 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                                              unsigned __int8 v49 = [v48 isEqual:@"https://mask-api.icloud.com/v4_2/fetchConfigFile"];

                                              if (v49)
                                              {
                                                return &off_10010F8E0;
                                              }
                                              else
                                              {
                                                v50 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                                                unsigned __int8 v51 = [v50 isEqual:@"https://mask-api.icloud.com/v4_3/fetchConfigFile"];

                                                if (v51)
                                                {
                                                  return &off_10010F8F8;
                                                }
                                                else
                                                {
                                                  v52 = [(NSPConfigurationFetchAnalytics *)self configFetchURL];
                                                  unsigned int v53 = [v52 isEqual:@"https://mask-api.icloud.com/v4_4/fetchConfigFile"];

                                                  if (v53) {
                                                    return &off_10010F910;
                                                  }
                                                  else {
                                                    return &off_10010F928;
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v27 = nplog_obj();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      int v54 = 136315138;
      v55 = "-[NSPConfigurationFetchAnalytics configFetchURLToIndex]";
      _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "%s called with null self.configFetchURL", (uint8_t *)&v54, 0xCu);
    }

    return 0;
  }
}

- (id)analyticsDict
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = [(NSPConfigurationFetchAnalytics *)self configFetchURLToIndex];
  [v3 setObject:v4 forKeyedSubscript:@"ConfigurationFetchPath"];

  unsigned __int8 v5 = +[NSNumber numberWithInteger:[(NSPConfigurationFetchAnalytics *)self httpCode]];
  [v3 setObject:v5 forKeyedSubscript:@"HTTPCode"];

  v6 = +[NSNumber numberWithInteger:[(NSPConfigurationFetchAnalytics *)self nsurlErrorCode]];
  [v3 setObject:v6 forKeyedSubscript:@"NSURLErrorCode"];

  v7 = [(NSPConfigurationFetchAnalytics *)self requestedServerUUID];
  [v3 setObject:v7 forKeyedSubscript:@"RequestedServerUUID"];

  [(NSPConfigurationFetchAnalytics *)self latency];
  unsigned __int8 v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v3 setObject:v8 forKeyedSubscript:@"Latency"];

  v9 = [(NSPConfigurationFetchAnalytics *)self reason];
  [v3 setObject:v9 forKeyedSubscript:@"Reason"];

  return v3;
}

- (NSString)configFetchURL
{
  return self->_configFetchURL;
}

- (void)setConfigFetchURL:(id)a3
{
}

- (int64_t)httpCode
{
  return self->_httpCode;
}

- (void)setHttpCode:(int64_t)a3
{
  self->_httpCode = a3;
}

- (int64_t)nsurlErrorCode
{
  return self->_nsurlErrorCode;
}

- (void)setNsurlErrorCode:(int64_t)a3
{
  self->_nsurlErrorCode = a3;
}

- (NSString)requestedServerUUID
{
  return self->_requestedServerUUID;
}

- (void)setRequestedServerUUID:(id)a3
{
}

- (double)latency
{
  return self->_latency;
}

- (void)setLatency:(double)a3
{
  self->_latency = a3;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  self->_reason = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedServerUUID, 0);

  objc_storeStrong((id *)&self->_configFetchURL, 0);
}

@end