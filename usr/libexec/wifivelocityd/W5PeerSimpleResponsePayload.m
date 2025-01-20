@interface W5PeerSimpleResponsePayload
+ (id)payloadFromDictionary:(id)a3;
- (NSDictionary)dictionary;
- (NSNumber)version;
- (W5PeerSimpleResponsePayload)initWithRequest:(id)a3;
- (int64_t)status;
- (void)setDictionary:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVersion:(id)a3;
@end

@implementation W5PeerSimpleResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithRequest:v3];

  return v4;
}

- (W5PeerSimpleResponsePayload)initWithRequest:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)W5PeerSimpleResponsePayload;
  v5 = [(W5PeerSimpleResponsePayload *)&v9 init];
  if (v5)
  {
    v6 = (NSDictionary *)v4;
    p_super = &v5->_dictionary->super;
    v5->_dictionary = v6;
  }
  else
  {
    p_super = sub_10009756C();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315906;
      v11 = "-[W5PeerSimpleResponsePayload initWithRequest:]";
      __int16 v12 = 2080;
      v13 = "W5PeerSimpleResponsePayload.m";
      __int16 v14 = 1024;
      int v15 = 33;
      __int16 v16 = 2114;
      uint64_t v17 = 0;
      _os_log_send_and_compose_impl();
    }
  }

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

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end