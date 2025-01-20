@interface MSDFMHRequest
- (BOOL)isValid;
- (BOOL)logicSync;
- (Class)getResponseClass;
- (MSDFMHRequest)init;
- (NSDictionary)bundleInfo;
- (NSString)countryCode;
- (NSString)language;
- (NSString)offlineDuration;
- (NSString)storeId;
- (id)getPostData;
- (id)getUrl;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setBundleInfo:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLogicSync:(BOOL)a3;
- (void)setOfflineDuration:(id)a3;
- (void)setStoreId:(id)a3;
@end

@implementation MSDFMHRequest

- (MSDFMHRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDFMHRequest;
  v2 = [(MSDDemoUnitServerRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MSDCommandServerRequest *)v2 setServer:@"api.demounit.net"];
    [(MSDCommandServerRequest *)v3 setPort:@"443"];
    [(MSDFMHRequest *)v3 setStoreId:0];
    v4 = v3;
  }

  return v3;
}

- (BOOL)isValid
{
  v6.receiver = self;
  v6.super_class = (Class)MSDFMHRequest;
  if (![(MSDDemoUnitServerRequest *)&v6 isValid]) {
    return 0;
  }
  v3 = [(MSDFMHRequest *)self bundleInfo];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)getPostData
{
  if ([(MSDFMHRequest *)self isValid])
  {
    v3 = objc_opt_new();
    BOOL v4 = [(MSDFMHRequest *)self storeId];

    if (v4)
    {
      v5 = [(MSDFMHRequest *)self storeId];
      [v3 setObject:v5 forKey:@"store_id"];
    }
    objc_super v6 = [(MSDFMHRequest *)self bundleInfo];
    id v7 = [v6 count];

    if (v7)
    {
      v8 = [(MSDFMHRequest *)self bundleInfo];
      [v3 setObject:v8 forKey:@"bundle_info"];
    }
    v9 = [(MSDFMHRequest *)self countryCode];

    if (v9)
    {
      v10 = [(MSDFMHRequest *)self countryCode];
      [v3 setObject:v10 forKey:@"country"];
    }
    v11 = [(MSDFMHRequest *)self language];

    if (v11)
    {
      v12 = [(MSDFMHRequest *)self language];
      [v3 setObject:v12 forKey:@"language"];
    }
    v13 = sub_100068600();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FMH payload: %{public}@", (uint8_t *)&v16, 0xCu);
    }

    v14 = [v3 convertToNSData];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)getUrl
{
  unsigned int v3 = [(MSDFMHRequest *)self logicSync];
  uint64_t v4 = [(MSDCommandServerRequest *)self deviceUDID];
  v5 = (void *)v4;
  if (v3)
  {
    objc_super v6 = [(MSDFMHRequest *)self offlineDuration];
    id v7 = +[NSString stringWithFormat:@"/api/device/%@/%@/hub?duration=%@", @"4", v5, v6];
  }
  else
  {
    id v7 = +[NSString stringWithFormat:@"/api/device/%@/%@/hub", @"4", v4];
  }

  return v7;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class();
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MSDFMHRequest;
  v8 = [(MSDServerRequest *)&v20 parseResponseForError:v6 andPayload:v7];
  v9 = [v8 error];

  if (v9)
  {
    v12 = 0;
    v11 = 0;
    goto LABEL_21;
  }
  v10 = [v7 objectForKey:@"statusCode"];
  if (!v10)
  {
    int v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000D0978(self);
    }
    v11 = 0;
    goto LABEL_19;
  }
  v11 = v10;
  if ([v10 intValue] != 200 && objc_msgSend(v11, "intValue") != 202)
  {
    int v16 = sub_100068600();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000D0A08(self);
    }
LABEL_19:

    v12 = 0;
    goto LABEL_21;
  }
  v12 = [v7 objectForKey:@"retryAfter"];
  if ([v11 intValue] == 202)
  {
    [v8 setRetryAfter:v12];
    goto LABEL_10;
  }
  id v19 = v6;
  v13 = [(MSDCommandServerRequest *)self getDataDictFromPayload:v7 error:&v19];
  id v14 = v19;

  if (v13)
  {
    [v8 setFmhDict:v13];

LABEL_9:
    id v6 = v14;
    goto LABEL_10;
  }
  id v6 = v14;
LABEL_21:
  v17 = [v8 error];

  if (!v17)
  {
    id v18 = v6;
    sub_1000C31D4(&v18, 3727744512, @"Unexpected server response.");
    id v14 = v18;

    [v8 setError:v14];
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

- (BOOL)logicSync
{
  return self->_logicSync;
}

- (void)setLogicSync:(BOOL)a3
{
  self->_logicSync = a3;
}

- (NSDictionary)bundleInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBundleInfo:(id)a3
{
}

- (NSString)offlineDuration
{
  return self->_offlineDuration;
}

- (void)setOfflineDuration:(id)a3
{
  self->_offlineDuration = (NSString *)a3;
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLanguage:(id)a3
{
}

- (NSString)storeId
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setStoreId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_bundleInfo, 0);
}

@end