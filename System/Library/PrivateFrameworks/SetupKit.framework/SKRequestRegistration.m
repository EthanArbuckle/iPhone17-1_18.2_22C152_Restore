@interface SKRequestRegistration
- (NSDictionary)options;
- (NSString)requestID;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setOptions:(id)a3;
- (void)setRequestID:(id)a3;
@end

@implementation SKRequestRegistration

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_requestID, 0);
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setOptions:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setRequestID:(id)a3
{
}

- (NSString)requestID
{
  return self->_requestID;
}

@end