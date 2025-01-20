@interface WCAFetchResponse
+ (BOOL)supportsSecureCoding;
+ (id)fetchResponseWithError:(id)a3;
- (NSError)error;
- (WCAFetchResponse)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation WCAFetchResponse

+ (id)fetchResponseWithError:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setError:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  error = self->_error;
  if (error) {
    [a3 encodeObject:error forKey:@"_error"];
  }
}

- (WCAFetchResponse)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WCAFetchResponse;
  id v3 = a3;
  id v4 = [(WCAFetchResponse *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_error", v8.receiver, v8.super_class);

  error = v4->_error;
  v4->_error = (NSError *)v5;

  return v4;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end