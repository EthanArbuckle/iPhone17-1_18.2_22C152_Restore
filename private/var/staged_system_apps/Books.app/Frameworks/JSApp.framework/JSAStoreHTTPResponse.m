@interface JSAStoreHTTPResponse
- (JSAStoreHTTPResponse)initWithDictionary:(id)a3;
- (NSDictionary)_error;
- (NSDictionary)headers;
- (NSDictionary)performanceMetrics;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)output;
- (id)toDictionary;
- (int64_t)statusCode;
- (void)setHeaders:(id)a3;
- (void)setOutput:(id)a3;
- (void)setPerformanceMetrics:(id)a3;
- (void)setStatusCode:(int64_t)a3;
- (void)set_error:(id)a3;
@end

@implementation JSAStoreHTTPResponse

- (JSAStoreHTTPResponse)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)JSAStoreHTTPResponse;
  v5 = [(JSAStoreHTTPResponse *)&v20 init];
  if (v5)
  {
    objc_opt_class();
    v6 = [v4 objectForKeyedSubscript:@"statusCode"];
    v7 = BUDynamicCast();
    v5->_statusCode = (int64_t)[v7 integerValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"output"];
    id output = v5->_output;
    v5->_id output = (id)v8;

    objc_opt_class();
    v10 = [v4 objectForKeyedSubscript:@"_error"];
    uint64_t v11 = BUDynamicCast();
    error = v5->__error;
    v5->__error = (NSDictionary *)v11;

    objc_opt_class();
    v13 = [v4 objectForKeyedSubscript:@"headers"];
    uint64_t v14 = BUDynamicCast();
    headers = v5->_headers;
    v5->_headers = (NSDictionary *)v14;

    objc_opt_class();
    v16 = [v4 objectForKeyedSubscript:@"performance"];
    uint64_t v17 = BUDynamicCast();
    performanceMetrics = v5->_performanceMetrics;
    v5->_performanceMetrics = (NSDictionary *)v17;
  }
  return v5;
}

- (id)toDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithInteger:self->_statusCode];
  [v3 setObject:v4 forKeyedSubscript:@"statusCode"];

  id output = self->_output;
  if (output) {
    [v3 setObject:output forKeyedSubscript:@"output"];
  }
  error = self->__error;
  if (error) {
    [v3 setObject:error forKeyedSubscript:@"_error"];
  }
  headers = self->_headers;
  if (headers) {
    [v3 setObject:headers forKeyedSubscript:@"headers"];
  }
  performanceMetrics = self->_performanceMetrics;
  if (performanceMetrics) {
    [v3 setObject:performanceMetrics forKeyedSubscript:@"performance"];
  }

  return v3;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = +[NSNumber numberWithInteger:[(JSAStoreHTTPResponse *)self statusCode]];
  v6 = [(JSAStoreHTTPResponse *)self headers];
  v21 = [v6 objectForKeyedSubscript:@"x-apple-jingle-correlation-key"];
  v19 = [(JSAStoreHTTPResponse *)self headers];
  objc_super v20 = [v19 objectForKeyedSubscript:@"x-apple-request-uuid"];
  v7 = [(JSAStoreHTTPResponse *)self headers];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"x-apple-application-site"];
  v9 = [(JSAStoreHTTPResponse *)self headers];
  v10 = [v9 objectForKeyedSubscript:@"x-apple-application-instance"];
  uint64_t v11 = [(JSAStoreHTTPResponse *)self _error];
  if (v11)
  {
    [(JSAStoreHTTPResponse *)self _error];
    v18 = v6;
    v12 = v5;
    uint64_t v14 = v13 = v4;
    v15 = +[NSString stringWithFormat:@", error=%@", v14];
    v16 = +[NSString stringWithFormat:@"<%@(%p) code=%@, correlation=%@, uuid=%@, site=%@, instance=%@%@>", v13, self, v12, v21, v20, v8, v10, v15];

    id v4 = v13;
    v5 = v12;
    v6 = v18;
  }
  else
  {
    v16 = +[NSString stringWithFormat:@"<%@(%p) code=%@, correlation=%@, uuid=%@, site=%@, instance=%@%@>", v4, self, v5, v21, v20, v8, v10, &stru_B6668];
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[JSAStoreHTTPResponse allocWithZone:a3];
  v5 = [(JSAStoreHTTPResponse *)self toDictionary];
  v6 = [(JSAStoreHTTPResponse *)v4 initWithDictionary:v5];

  return v6;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (id)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (NSDictionary)_error
{
  return self->__error;
}

- (void)set_error:(id)a3
{
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void)setHeaders:(id)a3
{
}

- (NSDictionary)performanceMetrics
{
  return self->_performanceMetrics;
}

- (void)setPerformanceMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->__error, 0);

  objc_storeStrong(&self->_output, 0);
}

@end