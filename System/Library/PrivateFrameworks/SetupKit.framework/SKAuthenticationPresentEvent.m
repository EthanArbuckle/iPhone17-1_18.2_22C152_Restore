@interface SKAuthenticationPresentEvent
- (NSString)password;
- (SKAuthenticationPresentEvent)initWithPasswordType:(int)a3 password:(id)a4;
- (id)descriptionWithLevel:(int)a3;
- (int)passwordType;
@end

@implementation SKAuthenticationPresentEvent

- (void).cxx_destruct
{
}

- (int)passwordType
{
  return self->_passwordType;
}

- (NSString)password
{
  return self->_password;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0;
  }
  else
  {
    v10 = [(id)objc_opt_class() description];
    CUAppendF();
    id v4 = 0;
  }
  if (self->_passwordType)
  {
    CUAppendF();
    id v5 = v4;

    id v4 = v5;
  }
  CUAppendF();
  v6 = (__CFString *)v4;

  v7 = &stru_26D1CA560;
  if (v6) {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (SKAuthenticationPresentEvent)initWithPasswordType:(int)a3 password:(id)a4
{
  id v6 = a4;
  v7 = [(SKEvent *)self initWithEventType:110];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    password = v7->_password;
    v7->_password = (NSString *)v8;

    v7->_passwordType = a3;
    v10 = v7;
  }

  return v7;
}

@end