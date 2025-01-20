@interface CSDRelayIDSDualSessionData
- (NSData)data;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setData:(id)a3;
@end

@implementation CSDRelayIDSDualSessionData

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end