@interface NFSecureElementProxyListener
- (NFDriverWrapper)driverWrapper;
- (NFSecureElementProxyListener)initWithDriverWrapper:(id)a3;
- (id)transceiveWithData:(id)a3 outError:(id *)a4;
@end

@implementation NFSecureElementProxyListener

- (NFSecureElementProxyListener)initWithDriverWrapper:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureElementProxyListener;
  v6 = [(NFSecureElementProxyListener *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_driverWrapper, a3);
  }

  return v7;
}

- (id)transceiveWithData:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  v7 = [(NFSecureElementProxyListener *)self driverWrapper];
  v8 = sub_10002AD30(v7, 1, v6, 1, a4);

  return v8;
}

- (NFDriverWrapper)driverWrapper
{
  return self->_driverWrapper;
}

- (void).cxx_destruct
{
}

@end