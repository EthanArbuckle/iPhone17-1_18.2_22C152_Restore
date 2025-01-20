@interface ASKStorefrontChangeHandlerToken
- (ASKStorefrontChangeHandlerToken)initWithHandler:(id)a3;
- (id)handler;
@end

@implementation ASKStorefrontChangeHandlerToken

- (ASKStorefrontChangeHandlerToken)initWithHandler:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASKStorefrontChangeHandlerToken;
  v5 = [(ASKStorefrontChangeHandlerToken *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id handler = v5->_handler;
    v5->_id handler = v6;
  }
  return v5;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
}

@end