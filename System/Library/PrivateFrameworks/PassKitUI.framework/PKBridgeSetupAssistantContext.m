@interface PKBridgeSetupAssistantContext
- (FAFamilyMember)pairingFamilyMember;
- (FAFamilyMember)parentFamilyMember;
- (PKBridgeSetupAssistantContext)init;
- (PKPassLibraryDataProvider)dataProvider;
- (PKSetupAssistantPeerPaymentAddAssociatedAccountDelegate)peerPaymentDelegate;
- (void)extendableDescription:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setPairingFamilyMember:(id)a3;
- (void)setParentFamilyMember:(id)a3;
- (void)setPeerPaymentDelegate:(id)a3;
@end

@implementation PKBridgeSetupAssistantContext

- (PKBridgeSetupAssistantContext)init
{
  return [(PKSetupAssistantContext *)self initWithSetupAssistant:2];
}

- (void)extendableDescription:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKBridgeSetupAssistantContext;
  id v4 = a3;
  [(PKSetupAssistantContext *)&v6 extendableDescription:v4];
  [v4 appendFormat:@"dataProvider: '%@'; ", self->_dataProvider];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peerPaymentDelegate);
  [v4 appendFormat:@"peerPaymentDelegate: '%@'; ", WeakRetained];

  [v4 appendFormat:@"pairingFamilyMember: '%@'; ", self->_pairingFamilyMember];
  [v4 appendFormat:@"parentFamilyMember: '%@'; ", self->_parentFamilyMember];
}

- (PKPassLibraryDataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (PKSetupAssistantPeerPaymentAddAssociatedAccountDelegate)peerPaymentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peerPaymentDelegate);

  return (PKSetupAssistantPeerPaymentAddAssociatedAccountDelegate *)WeakRetained;
}

- (void)setPeerPaymentDelegate:(id)a3
{
}

- (FAFamilyMember)pairingFamilyMember
{
  return self->_pairingFamilyMember;
}

- (void)setPairingFamilyMember:(id)a3
{
}

- (FAFamilyMember)parentFamilyMember
{
  return self->_parentFamilyMember;
}

- (void)setParentFamilyMember:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFamilyMember, 0);
  objc_storeStrong((id *)&self->_pairingFamilyMember, 0);
  objc_destroyWeak((id *)&self->_peerPaymentDelegate);

  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end