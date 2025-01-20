@interface W5PeerSensingResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (BOOL)result;
- (NSNumber)version;
- (NSString)errorStr;
- (W5PeerSensingResponsePayload)initWithRequest:(id)a3;
- (id)encode;
- (int64_t)status;
- (void)setErrorStr:(id)a3;
- (void)setResult:(BOOL)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerSensingResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerSensingResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)W5PeerSensingResponsePayload;
  v5 = [(W5PeerSensingResponsePayload *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"result"];
    v5->_result = [v6 BOOLValue];

    uint64_t v7 = [v4 objectForKeyedSubscript:@"error"];
    errorStr = v5->_errorStr;
    v5->_errorStr = (NSString *)v7;
  }
  else
  {
    errorStr = sub_10009756C();
    if (os_log_type_enabled(errorStr, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      v12 = "-[W5PeerSensingResponsePayload initWithRequest:]";
      __int16 v13 = 2080;
      v14 = "W5PeerSensingResponsePayload.m";
      __int16 v15 = 1024;
      int v16 = 34;
      __int16 v17 = 2114;
      uint64_t v18 = 0;
      _os_log_send_and_compose_impl();
    }
  }

  return v5;
}

- (id)encode
{
  id v3 = [(W5PeerSensingResponsePayload *)self errorStr];
  if (!v3)
  {
    if ([(W5PeerSensingResponsePayload *)self result]) {
      id v3 = 0;
    }
    else {
      id v3 = @"unknown error";
    }
  }
  v7[0] = @"result";
  id v4 = +[NSNumber numberWithBool:[(W5PeerSensingResponsePayload *)self result]];
  v7[1] = @"error";
  v8[0] = v4;
  v8[1] = v3;
  v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (NSNumber)version
{
  return self->version;
}

- (void)setVersion:(id)a3
{
  self->version = (NSNumber *)a3;
}

- (int64_t)status
{
  return self->status;
}

- (void)setStatus:(int64_t)a3
{
  self->status = a3;
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (NSString)errorStr
{
  return self->_errorStr;
}

- (void)setErrorStr:(id)a3
{
}

- (void).cxx_destruct
{
}

@end