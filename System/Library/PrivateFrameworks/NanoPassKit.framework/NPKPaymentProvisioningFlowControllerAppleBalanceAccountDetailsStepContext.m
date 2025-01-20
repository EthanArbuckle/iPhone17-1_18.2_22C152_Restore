@interface NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext
- (NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext)initWithRequestContext:(id)a3;
- (NSString)appleID;
- (PKCurrencyAmount)balance;
- (id)description;
- (void)setAppleID:(id)a3;
- (void)setBalance:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext

- (NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [(NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext *)self appleID];
  v6 = [(NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext *)self balance];
  v7 = [v3 stringWithFormat:@"<%@ appleID %@, balance %@>", v4, v5, v6];

  return v7;
}

- (PKCurrencyAmount)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_balance, 0);
}

@end