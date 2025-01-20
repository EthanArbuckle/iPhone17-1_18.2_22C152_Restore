@interface MRUpdateActiveSystemEndpointResponse
- (MRUpdateActiveSystemEndpointResponse)initWithError:(id)a3;
- (NSError)error;
- (id)description;
@end

@implementation MRUpdateActiveSystemEndpointResponse

- (MRUpdateActiveSystemEndpointResponse)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUpdateActiveSystemEndpointResponse;
  v6 = [(MRUpdateActiveSystemEndpointResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRUpdateActiveSystemEndpointResponse *)self error];
  v6 = [v3 stringWithFormat:@"<%@: %p error: %@>", v4, self, v5];

  return v6;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
}

@end