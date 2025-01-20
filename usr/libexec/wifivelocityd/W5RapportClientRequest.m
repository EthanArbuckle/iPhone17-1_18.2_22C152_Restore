@interface W5RapportClientRequest
- (NSDictionary)options;
- (NSString)description;
- (W5PeerRequestPayload)payload;
- (W5RapportClientRequest)initWithPayload:(id)a3 options:(id)a4 handler:(id)a5;
- (id)handler;
@end

@implementation W5RapportClientRequest

- (W5RapportClientRequest)initWithPayload:(id)a3 options:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = sub_10009756C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136316418;
    v22 = "-[W5RapportClientRequest initWithPayload:options:handler:]";
    __int16 v23 = 2080;
    v24 = "W5RapportClientRequest.m";
    __int16 v25 = 1024;
    int v26 = 18;
    __int16 v27 = 2114;
    id v28 = v10;
    __int16 v29 = 2114;
    id v30 = v9;
    __int16 v31 = 2114;
    id v32 = objc_retainBlock(v11);
    _os_log_send_and_compose_impl();
  }
  v20.receiver = self;
  v20.super_class = (Class)W5RapportClientRequest;
  v13 = [(W5RapportClientRequest *)&v20 init];
  v14 = v13;
  if (v13
    && (objc_storeStrong((id *)&v13->_payload, a3),
        id v15 = objc_retainBlock(v11),
        id handler = v14->_handler,
        v14->_id handler = v15,
        handler,
        v14->_handler))
  {
    v17 = (NSDictionary *)v10;
    p_super = &v14->_options->super;
    v14->_options = v17;
  }
  else
  {

    p_super = sub_10009756C();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315650;
      v22 = "-[W5RapportClientRequest initWithPayload:options:handler:]";
      __int16 v23 = 2080;
      v24 = "W5RapportClientRequest.m";
      __int16 v25 = 1024;
      int v26 = 34;
      _os_log_send_and_compose_impl();
    }
    v14 = 0;
  }

  return v14;
}

- (NSString)description
{
  v3 = +[NSMutableString stringWithCapacity:0];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ : %p", v5, self];

  v6 = [(W5RapportClientRequest *)self payload];
  [v3 appendFormat:@" payload='%@'", v6];

  [v3 appendString:@">"];
  id v7 = [v3 copy];

  return (NSString *)v7;
}

- (W5PeerRequestPayload)payload
{
  return self->_payload;
}

- (id)handler
{
  return self->_handler;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

@end