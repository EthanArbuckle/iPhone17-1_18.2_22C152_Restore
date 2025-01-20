@interface SKAuthenticationRequestEvent
- (SKAuthenticationRequestEvent)initWithPasswordType:(int)a3 pairingFlags:(unsigned int)a4 throttleSeconds:(int)a5;
- (id)descriptionWithLevel:(int)a3;
- (int)passwordType;
- (int)throttleSeconds;
- (unsigned)pairingFlags;
@end

@implementation SKAuthenticationRequestEvent

- (int)throttleSeconds
{
  return self->_throttleSeconds;
}

- (int)passwordType
{
  return self->_passwordType;
}

- (unsigned)pairingFlags
{
  return self->_pairingFlags;
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    id v4 = 0;
  }
  else
  {
    v11 = [(id)objc_opt_class() description];
    CUAppendF();
    id v4 = 0;
  }
  CUAppendF();
  v5 = (__CFString *)v4;

  if (self->_pairingFlags)
  {
    v12 = CUPrintFlags32();
    CUAppendF();
    v6 = v5;

    v5 = v6;
  }
  if (self->_throttleSeconds >= 1)
  {
    CUAppendF();
    v7 = v5;

    v5 = v7;
  }
  v8 = &stru_26D1CA560;
  if (v5) {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

- (SKAuthenticationRequestEvent)initWithPasswordType:(int)a3 pairingFlags:(unsigned int)a4 throttleSeconds:(int)a5
{
  v8 = [(SKEvent *)self initWithEventType:120];
  v9 = v8;
  if (v8)
  {
    v8->_passwordType = a3;
    v8->_pairingFlags = a4;
    v8->_throttleSeconds = a5;
    v10 = v8;
  }

  return v9;
}

@end