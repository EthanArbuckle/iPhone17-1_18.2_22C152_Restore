@interface PHBrandedCallingContext
- (CTXPCServiceSubscriptionContext)context;
- (NSString)carrierName;
- (void)setCarrierName:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation PHBrandedCallingContext

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end