@interface DataActivationPopupAssertion
- (DataActivationPopupAssertion)init;
- (id)initAndTakeAssertion:(BOOL)a3;
- (void)_releaseAssertion;
- (void)_takeAssertion;
- (void)dealloc;
- (void)invalidate;
@end

@implementation DataActivationPopupAssertion

- (id)initAndTakeAssertion:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DataActivationPopupAssertion;
  v4 = [(DataActivationPopupAssertion *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_active = 1;
    if (v3) {
      [(DataActivationPopupAssertion *)v4 _takeAssertion];
    }
    v6 = v5;
  }

  return v5;
}

- (DataActivationPopupAssertion)init
{
  return (DataActivationPopupAssertion *)[(DataActivationPopupAssertion *)self initAndTakeAssertion:1];
}

- (void)dealloc
{
  [(DataActivationPopupAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)DataActivationPopupAssertion;
  [(DataActivationPopupAssertion *)&v3 dealloc];
}

- (void)_takeAssertion
{
  if (self->_active)
  {
    if (self->_telephonyServerConnection
      || (objc_super v3 = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue(),
          (self->_telephonyServerConnection = v3) != 0))
    {
      if (!self->_dataActivationPopupAssertion)
      {
        unint64_t v4 = _CTServerConnectionDataActivationPopupAssertionCreate();
        if (v4) {
          NSLog(@"Failed to create data activation popup assertion: %i, %i", v4, HIDWORD(v4));
        }
      }
    }
  }
}

- (void)_releaseAssertion
{
  dataActivationPopupAssertion = self->_dataActivationPopupAssertion;
  if (dataActivationPopupAssertion)
  {
    CFRelease(dataActivationPopupAssertion);
    self->_dataActivationPopupAssertion = 0;
  }
  telephonyServerConnection = self->_telephonyServerConnection;
  if (telephonyServerConnection)
  {
    CFRelease(telephonyServerConnection);
    self->_telephonyServerConnection = 0;
  }
}

- (void)invalidate
{
  self->_active = 0;
}

@end