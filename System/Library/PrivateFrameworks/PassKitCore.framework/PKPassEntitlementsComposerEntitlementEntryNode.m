@interface PKPassEntitlementsComposerEntitlementEntryNode
- (BOOL)possibleIntraAccountSharing;
- (PKDisplayablePassEntitlement)displayableEntitlement;
- (PKPassEntitlementsComposerEntitlementEntryNode)init;
- (PKPassEntitlementsComposerEntitlementEntryNode)initWithDisplayableEntitlement:(id)a3 sharedEntitlement:(id)a4 parentEntitlementComposer:(id)a5;
- (PKPassSharedEntitlement)sharedEntitlement;
- (id)allPossibleManageability;
- (id)allPossibleShareability;
- (id)allPossibleVisibility;
- (id)copyWithZone:(_NSZone *)a3;
- (id)possibleTimeConfiguration;
- (unint64_t)possibleManageability;
- (unint64_t)possibleShareability;
- (unint64_t)possibleVisibility;
- (void)enumerateEntitlementEntries:(id)a3;
- (void)setDisplayableEntitlement:(id)a3;
- (void)setSharedEntitlement:(id)a3;
@end

@implementation PKPassEntitlementsComposerEntitlementEntryNode

- (PKPassEntitlementsComposerEntitlementEntryNode)init
{
  return 0;
}

- (PKPassEntitlementsComposerEntitlementEntryNode)initWithDisplayableEntitlement:(id)a3 sharedEntitlement:(id)a4 parentEntitlementComposer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 entitlementIdentifier];
  v15.receiver = self;
  v15.super_class = (Class)PKPassEntitlementsComposerEntitlementEntryNode;
  v13 = [(PKPassEntitlementsComposerEntryNode *)&v15 initWithIdentifier:v12 parentEntitlementComposer:v11];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_displayableEntitlement, a3);
    objc_storeStrong((id *)&v13->_sharedEntitlement, a4);
  }

  return v13;
}

- (unint64_t)possibleShareability
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(PKDisplayablePassEntitlement *)self->_displayableEntitlement entitlement];
  v3 = [v2 shareability];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v7 <= objc_msgSend(v10, "unsignedIntegerValue", (void)v12)) {
          unint64_t v7 = [v10 unsignedIntegerValue];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)possibleVisibility
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(PKDisplayablePassEntitlement *)self->_displayableEntitlement entitlement];
  v3 = [v2 visibility];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v7 <= objc_msgSend(v10, "unsignedIntegerValue", (void)v12)) {
          unint64_t v7 = [v10 unsignedIntegerValue];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)possibleManageability
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(PKDisplayablePassEntitlement *)self->_displayableEntitlement entitlement];
  v3 = [v2 manageability];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (v7 <= objc_msgSend(v10, "unsignedIntegerValue", (void)v12)) {
          unint64_t v7 = [v10 unsignedIntegerValue];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)possibleIntraAccountSharing
{
  return [(PKPassEntitlementsComposerEntitlementEntryNode *)self possibleShareability] != 0;
}

- (id)allPossibleShareability
{
  v2 = [(PKDisplayablePassEntitlement *)self->_displayableEntitlement entitlement];
  v3 = [v2 shareability];

  return v3;
}

- (id)allPossibleVisibility
{
  v2 = [(PKDisplayablePassEntitlement *)self->_displayableEntitlement entitlement];
  v3 = [v2 visibility];

  return v3;
}

- (id)allPossibleManageability
{
  v2 = [(PKDisplayablePassEntitlement *)self->_displayableEntitlement entitlement];
  v3 = [v2 manageability];

  return v3;
}

- (id)possibleTimeConfiguration
{
  v2 = [(PKDisplayablePassEntitlement *)self->_displayableEntitlement entitlement];
  v3 = [v2 timeConfiguration];

  return v3;
}

- (void)enumerateEntitlementEntries:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKPassEntitlementsComposerEntitlementEntryNode;
  id v4 = [(PKPassEntitlementsComposerEntryNode *)&v10 copyWithZone:a3];
  uint64_t v5 = [(PKDisplayablePassEntitlement *)self->_displayableEntitlement copy];
  uint64_t v6 = (void *)v4[7];
  v4[7] = v5;

  uint64_t v7 = [(PKPassSharedEntitlement *)self->_sharedEntitlement copy];
  uint64_t v8 = (void *)v4[8];
  v4[8] = v7;

  return v4;
}

- (PKDisplayablePassEntitlement)displayableEntitlement
{
  return self->_displayableEntitlement;
}

- (void)setDisplayableEntitlement:(id)a3
{
}

- (PKPassSharedEntitlement)sharedEntitlement
{
  return self->_sharedEntitlement;
}

- (void)setSharedEntitlement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEntitlement, 0);
  objc_storeStrong((id *)&self->_displayableEntitlement, 0);
}

@end