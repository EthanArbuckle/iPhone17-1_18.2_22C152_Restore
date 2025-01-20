@interface MSDS3SessionTaskInfo
- (NSDictionary)httpHeaders;
- (NSString)s3url;
- (id)getRequestForTimeout:(double)a3;
- (void)setHttpHeaders:(id)a3;
- (void)setS3url:(id)a3;
@end

@implementation MSDS3SessionTaskInfo

- (id)getRequestForTimeout:(double)a3
{
  v5 = [(MSDS3SessionTaskInfo *)self s3url];
  v6 = +[NSURL URLWithString:v5];
  v7 = +[NSMutableURLRequest requestWithURL:v6 cachePolicy:1 timeoutInterval:a3];
  [(MSDSessionTaskInfo *)self setRequest:v7];

  v8 = [(MSDSessionTaskInfo *)self request];

  if (v8)
  {
    v9 = [(MSDSessionTaskInfo *)self request];
    [v9 setHTTPMethod:@"PUT"];

    v10 = [(MSDS3SessionTaskInfo *)self httpHeaders];

    if (v10)
    {
      v11 = sub_100068600();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received custom http headers to use.", buf, 2u);
      }

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v12 = [(MSDS3SessionTaskInfo *)self httpHeaders];
      id v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v13)
      {
        id v14 = v13;
        id v15 = 0;
        uint64_t v16 = *(void *)v29;
        do
        {
          v17 = 0;
          v18 = v15;
          do
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v12);
            }
            id v15 = *(id *)(*((void *)&v28 + 1) + 8 * (void)v17);

            v19 = sub_100068600();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              v23 = [(MSDS3SessionTaskInfo *)self httpHeaders];
              v24 = [v23 objectForKey:v15];
              *(_DWORD *)buf = 138412546;
              id v33 = v15;
              __int16 v34 = 2112;
              v35 = v24;
              _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Http Header: %@, Value: %@", buf, 0x16u);
            }
            v20 = [(MSDSessionTaskInfo *)self request];
            v21 = [(MSDS3SessionTaskInfo *)self httpHeaders];
            v22 = [v21 objectForKey:v15];
            [v20 setValue:v22 forHTTPHeaderField:v15];

            v17 = (char *)v17 + 1;
            v18 = v15;
          }
          while (v14 != v17);
          id v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v14);
      }
    }
    else
    {
      v12 = [(MSDSessionTaskInfo *)self request];
      [v12 setValue:@"application/gzip" forHTTPHeaderField:@"Content-Type"];
    }

    v25 = [(MSDSessionTaskInfo *)self request];
  }
  else
  {
    v27 = sub_100068600();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1000CDE80();
    }

    v25 = 0;
  }

  return v25;
}

- (NSString)s3url
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setS3url:(id)a3
{
}

- (NSDictionary)httpHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHttpHeaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_httpHeaders, 0);

  objc_storeStrong((id *)&self->_s3url, 0);
}

@end