@interface SKUIURLResolverResponse
- (NSData)data;
- (NSHTTPURLResponse)URLResponse;
- (SKUIURLResolverResponse)initWithData:(id)a3 URLResponse:(id)a4;
@end

@implementation SKUIURLResolverResponse

- (SKUIURLResolverResponse)initWithData:(id)a3 URLResponse:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIURLResolverResponse initWithData:URLResponse:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIURLResolverResponse;
  v9 = [(SKUIURLResolverResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_response, a4);
  }

  return v10;
}

- (NSData)data
{
  return self->_data;
}

- (NSHTTPURLResponse)URLResponse
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (void)initWithData:URLResponse:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIURLResolverResponse initWithData:URLResponse:]";
}

@end