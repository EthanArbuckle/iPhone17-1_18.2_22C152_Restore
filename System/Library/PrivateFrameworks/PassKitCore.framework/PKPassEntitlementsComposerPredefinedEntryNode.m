@interface PKPassEntitlementsComposerPredefinedEntryNode
- (BOOL)possibleIntraAccountSharing;
- (PKPassEntitlementsComposerPredefinedEntryNode)initWithPredefinedSelection:(id)a3 parentEntitlementComposer:(id)a4;
- (id)allPossibleManageability;
- (id)allPossibleShareability;
- (id)allPossibleVisibility;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)possibleManageability;
- (unint64_t)possibleShareability;
- (unint64_t)possibleVisibility;
@end

@implementation PKPassEntitlementsComposerPredefinedEntryNode

- (PKPassEntitlementsComposerPredefinedEntryNode)initWithPredefinedSelection:(id)a3 parentEntitlementComposer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 identifier];
  v12.receiver = self;
  v12.super_class = (Class)PKPassEntitlementsComposerPredefinedEntryNode;
  v10 = [(PKPassEntitlementsComposerEntryNode *)&v12 initWithIdentifier:v9 parentEntitlementComposer:v8];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_predefinedSelection, a3);
    [(PKPassEntitlementsComposerEntryNode *)v10 setEditable:0];
  }

  return v10;
}

- (unint64_t)possibleShareability
{
  v2 = [(PKPredefinedSharedEntitlementSelection *)self->_predefinedSelection sharedEntitlements];
  v3 = [v2 firstObject];
  unint64_t v4 = [v3 recipientShareability];

  return v4;
}

- (unint64_t)possibleVisibility
{
  v2 = [(PKPredefinedSharedEntitlementSelection *)self->_predefinedSelection sharedEntitlements];
  v3 = [v2 firstObject];
  unint64_t v4 = [v3 recipientVisibility];

  return v4;
}

- (unint64_t)possibleManageability
{
  v2 = [(PKPredefinedSharedEntitlementSelection *)self->_predefinedSelection sharedEntitlements];
  v3 = [v2 firstObject];
  unint64_t v4 = [v3 recipientManageability];

  return v4;
}

- (BOOL)possibleIntraAccountSharing
{
  v2 = [(PKPredefinedSharedEntitlementSelection *)self->_predefinedSelection sharedEntitlements];
  v3 = [v2 firstObject];
  char v4 = [v3 intraAccountSharingEnabled];

  return v4;
}

- (id)allPossibleShareability
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPassEntitlementsComposerPredefinedEntryNode possibleShareability](self, "possibleShareability"));
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)allPossibleVisibility
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPassEntitlementsComposerPredefinedEntryNode possibleVisibility](self, "possibleVisibility"));
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)allPossibleManageability
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPassEntitlementsComposerPredefinedEntryNode possibleManageability](self, "possibleManageability"));
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPassEntitlementsComposerPredefinedEntryNode;
  char v4 = [(PKPassEntitlementsComposerEntryNode *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 7, self->_predefinedSelection);
  return v4;
}

- (void).cxx_destruct
{
}

@end