@interface MSDPingRequest
- (BOOL)isValid;
- (Class)getResponseClass;
- (NSDictionary)requestInfo;
- (id)getPostData;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
- (void)setRequestInfo:(id)a3;
@end

@implementation MSDPingRequest

- (BOOL)isValid
{
  v8.receiver = self;
  v8.super_class = (Class)MSDPingRequest;
  if (![(MSDCommandServerRequest *)&v8 isValid]) {
    return 0;
  }
  v3 = [(MSDPingRequest *)self requestInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(MSDPingRequest *)self requestInfo];
    v5 = [v4 objectForKey:@"UniqueDeviceID"];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)getPostData
{
  v2 = [(MSDPingRequest *)self requestInfo];
  v3 = [v2 convertToNSData];

  if (!v3)
  {
    id v4 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Falling back to minimal request info dictionary.", v9, 2u);
    }

    BOOL v6 = +[MSDTargetDevice sharedInstance];
    v7 = [v6 udid];
    [v4 setObject:v7 forKey:@"UniqueDeviceID"];

    [v4 setObject:&off_100162348 forKey:@"InternalStatus"];
    v3 = [v4 convertToNSData];
  }

  return v3;
}

- (Class)getResponseClass
{
  return (Class)objc_opt_class();
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MSDPingRequest;
  objc_super v8 = [(MSDServerRequest *)&v17 parseResponseForError:v6 andPayload:v7];
  v9 = [v8 error];

  if (!v9)
  {
    v10 = [v7 objectForKey:@"statusCode"];
    [v8 setStatusCode:v10];

    v11 = [v8 statusCode];

    if (!v11)
    {
      v14 = sub_100068600();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000DCB64(self, v14);
      }

      id v16 = v6;
      sub_1000C31D4(&v16, 3727744512, @"Unexpected server response.");
      id v15 = v16;

      id v6 = v15;
    }
  }
  v12 = [v8 error];

  if (!v12) {
    [v8 setError:v6];
  }

  return v8;
}

- (NSDictionary)requestInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequestInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end