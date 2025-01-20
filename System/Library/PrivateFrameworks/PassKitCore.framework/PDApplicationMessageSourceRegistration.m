@interface PDApplicationMessageSourceRegistration
- (PDApplicationMessageSourceRegistration)init;
@end

@implementation PDApplicationMessageSourceRegistration

- (PDApplicationMessageSourceRegistration)init
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_sink, 0);
}

@end