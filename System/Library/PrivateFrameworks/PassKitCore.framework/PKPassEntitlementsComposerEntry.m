@interface PKPassEntitlementsComposerEntry
- (BOOL)isEqual:(id)a3;
- (NSCopying)identifier;
- (PKDisplayablePassEntitlement)displayableEntitlement;
- (PKPassEntitlementsComposerEntry)init;
- (PKPassSharedEntitlement)sharedEntitlement;
- (id)initWithDisplayableEntitlement:(void *)a3 parentEntitlementComposer:;
- (void)setDisplayableEntitlement:(id)a3;
- (void)setSharedEntitlement:(id)a3;
@end

@implementation PKPassEntitlementsComposerEntry

- (PKPassEntitlementsComposerEntry)init
{
  return 0;
}

- (id)initWithDisplayableEntitlement:(void *)a3 parentEntitlementComposer:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)PKPassEntitlementsComposerEntry;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 2, a2);
      objc_storeWeak(a1 + 1, v7);
    }
  }

  return a1;
}

- (NSCopying)identifier
{
  return (NSCopying *)[(PKDisplayablePassEntitlement *)self->_displayableEntitlement entitlementIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    sharedEntitlement = self->_sharedEntitlement;
    id v7 = (PKPassSharedEntitlement *)v5[3];
    if (sharedEntitlement && v7)
    {
      if (-[PKPassSharedEntitlement isEqual:](sharedEntitlement, "isEqual:"))
      {
LABEL_5:
        displayableEntitlement = self->_displayableEntitlement;
        v9 = (PKDisplayablePassEntitlement *)v5[2];
        if (displayableEntitlement && v9) {
          BOOL v10 = -[PKDisplayablePassEntitlement isEqual:](displayableEntitlement, "isEqual:");
        }
        else {
          BOOL v10 = displayableEntitlement == v9;
        }
        goto LABEL_12;
      }
    }
    else if (sharedEntitlement == v7)
    {
      goto LABEL_5;
    }
    BOOL v10 = 0;
LABEL_12:

    goto LABEL_13;
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (PKDisplayablePassEntitlement)displayableEntitlement
{
  v2 = (void *)[(PKDisplayablePassEntitlement *)self->_displayableEntitlement copy];
  return (PKDisplayablePassEntitlement *)v2;
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
  objc_destroyWeak((id *)&self->_parentEntitlementComposer);
}

@end