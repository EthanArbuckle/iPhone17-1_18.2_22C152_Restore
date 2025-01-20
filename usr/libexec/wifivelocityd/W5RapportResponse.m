@interface W5RapportResponse
+ (id)responseWithPayload:(id)a3 options:(id)a4 error:(id)a5;
- (NSDictionary)options;
- (NSError)error;
- (W5PeerPayload)payload;
- (W5RapportResponse)initWithPayload:(id)a3 options:(id)a4 error:(id)a5;
- (void)setError:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation W5RapportResponse

+ (id)responseWithPayload:(id)a3 options:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithPayload:v9 options:v8 error:v7];

  return v10;
}

- (W5RapportResponse)initWithPayload:(id)a3 options:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)W5RapportResponse;
  v12 = [(W5RapportResponse *)&v16 init];
  v13 = v12;
  if (!v12)
  {
    v14 = sub_10009756C();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
    int v17 = 136315650;
    v18 = "-[W5RapportResponse initWithPayload:options:error:]";
    __int16 v19 = 2080;
    v20 = "W5RapportResponse.m";
    __int16 v21 = 1024;
    int v22 = 40;
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v12->_error, a5);
  objc_storeStrong((id *)&v13->_payload, a3);
  objc_storeStrong((id *)&v13->_options, a4);
  v14 = sub_10009756C();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136316418;
    v18 = "-[W5RapportResponse initWithPayload:options:error:]";
    __int16 v19 = 2080;
    v20 = "W5RapportResponse.m";
    __int16 v21 = 1024;
    int v22 = 34;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 2114;
    id v28 = v11;
LABEL_4:
    _os_log_send_and_compose_impl();
  }
LABEL_5:

  return v13;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (W5PeerPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end