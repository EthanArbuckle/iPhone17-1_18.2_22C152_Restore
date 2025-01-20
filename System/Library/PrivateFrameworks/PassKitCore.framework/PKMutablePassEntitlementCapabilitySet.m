@interface PKMutablePassEntitlementCapabilitySet
- (void)_updateCapabilityRoleValue;
- (void)setIntraAccountSharingEnabled:(BOOL)a3;
- (void)setManageability:(unint64_t)a3;
- (void)setShareability:(unint64_t)a3;
- (void)setVisibility:(unint64_t)a3;
@end

@implementation PKMutablePassEntitlementCapabilitySet

- (void)setShareability:(unint64_t)a3
{
  if ([(PKPassEntitlementCapabilitySet *)self shareability] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKMutablePassEntitlementCapabilitySet;
    [(PKPassEntitlementCapabilitySet *)&v5 setShareability:a3];
    [(PKMutablePassEntitlementCapabilitySet *)self _updateCapabilityRoleValue];
  }
}

- (void)setManageability:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKMutablePassEntitlementCapabilitySet;
  [(PKPassEntitlementCapabilitySet *)&v4 setManageability:a3];
  [(PKMutablePassEntitlementCapabilitySet *)self _updateCapabilityRoleValue];
}

- (void)setVisibility:(unint64_t)a3
{
  if ([(PKPassEntitlementCapabilitySet *)self visibility] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKMutablePassEntitlementCapabilitySet;
    [(PKPassEntitlementCapabilitySet *)&v5 setVisibility:a3];
    [(PKMutablePassEntitlementCapabilitySet *)self _updateCapabilityRoleValue];
  }
}

- (void)setIntraAccountSharingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPassEntitlementCapabilitySet *)self intraAccountSharingEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PKMutablePassEntitlementCapabilitySet;
    [(PKPassEntitlementCapabilitySet *)&v5 setIntraAccountSharingEnabled:v3];
    [(PKMutablePassEntitlementCapabilitySet *)self _updateCapabilityRoleValue];
  }
}

- (void)_updateCapabilityRoleValue
{
  BOOL v3 = [(PKPassEntitlementCapabilitySet *)self capabilityRoleValue];

  if (v3)
  {
    objc_super v4 = [(PKPassEntitlementCapabilitySet *)self capabilityRoleValue];
    __int16 v5 = [v4 unsignedShortValue];

    objc_msgSend(NSNumber, "numberWithUnsignedShort:", PKPassEntitlementCapabilityRoleValueFrom(-[PKPassEntitlementCapabilitySet shareability](self, "shareability"), -[PKPassEntitlementCapabilitySet visibility](self, "visibility"), -[PKPassEntitlementCapabilitySet manageability](self, "manageability"), -[PKPassEntitlementCapabilitySet intraAccountSharingEnabled](self, "intraAccountSharingEnabled")) | v5 & 0xF760);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(PKPassEntitlementCapabilitySet *)self setCapabilityRoleValue:v6];
  }
}

@end