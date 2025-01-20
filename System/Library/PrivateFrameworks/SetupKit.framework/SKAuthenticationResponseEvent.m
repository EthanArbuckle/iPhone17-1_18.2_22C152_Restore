@interface SKAuthenticationResponseEvent
- (NSString)password;
- (SKAuthenticationResponseEvent)initWithPassword:(id)a3;
- (id)descriptionWithLevel:(int)a3;
@end

@implementation SKAuthenticationResponseEvent

- (void).cxx_destruct
{
}

- (NSString)password
{
  return self->_password;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v3 = 0;
  }
  else
  {
    v8 = [(id)objc_opt_class() description];
    CUAppendF();
    id v3 = 0;
  }
  CUAppendF();
  v4 = (__CFString *)v3;

  v5 = &stru_26D1CA560;
  if (v4) {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (SKAuthenticationResponseEvent)initWithPassword:(id)a3
{
  id v4 = a3;
  v5 = [(SKEvent *)self initWithEventType:130];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    password = v5->_password;
    v5->_password = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

@end