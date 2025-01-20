@interface RPWirelessPairingSession
- (BOOL)invalidated;
- (RPWirelessPairingSession)initWithUnderlyingObject:(id)a3;
- (RPWirelessPairingSession_Internal)underlyingObject;
- (void)endSession;
- (void)registerInvalidationHandlerOnQueue:(id)a3 handler:(id)a4;
@end

@implementation RPWirelessPairingSession

- (RPWirelessPairingSession)initWithUnderlyingObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPWirelessPairingSession;
  v6 = [(RPWirelessPairingSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlyingObject, a3);
  }

  return v7;
}

- (void)registerInvalidationHandlerOnQueue:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(RPWirelessPairingSession *)self underlyingObject];
  [v8 registerInvalidationHandlerWithInvokingOnQueue:v7 handler:v6];
}

- (void)endSession
{
  id v2 = [(RPWirelessPairingSession *)self underlyingObject];
  [v2 endSession];
}

- (BOOL)invalidated
{
  id v2 = [(RPWirelessPairingSession *)self underlyingObject];
  char v3 = [v2 invalidated];

  return v3;
}

- (RPWirelessPairingSession_Internal)underlyingObject
{
  return self->_underlyingObject;
}

- (void).cxx_destruct
{
}

@end