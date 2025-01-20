@interface NRAssertionInfo
- (EPActiveDeviceAssertion)assertion;
- (NRPairingProxy)clientProxy;
- (NSString)assertionID;
- (NSUUID)pairingID;
- (id)clientBlock;
- (void)setAssertion:(id)a3;
- (void)setAssertionID:(id)a3;
- (void)setClientBlock:(id)a3;
- (void)setClientProxy:(id)a3;
- (void)setPairingID:(id)a3;
@end

@implementation NRAssertionInfo

- (NSUUID)pairingID
{
  return self->_pairingID;
}

- (void)setPairingID:(id)a3
{
}

- (NSString)assertionID
{
  return self->_assertionID;
}

- (void)setAssertionID:(id)a3
{
}

- (EPActiveDeviceAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (id)clientBlock
{
  return self->_clientBlock;
}

- (void)setClientBlock:(id)a3
{
}

- (NRPairingProxy)clientProxy
{
  return self->_clientProxy;
}

- (void)setClientProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong(&self->_clientBlock, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_assertionID, 0);

  objc_storeStrong((id *)&self->_pairingID, 0);
}

@end