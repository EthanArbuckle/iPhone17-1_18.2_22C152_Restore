@interface PKPassEntitlementCapabilitySet
+ (id)predefinedSets;
- (BOOL)intraAccountSharingEnabled;
- (NSNumber)capabilityRoleValue;
- (NSString)localizedName;
- (PKPassEntitlementCapabilitySet)init;
- (PKPassEntitlementCapabilitySet)initWithIntRole:(unsigned __int16)a3;
- (PKPassEntitlementCapabilitySet)initWithLocalizedName:(id)a3 shareability:(unint64_t)a4 manageability:(unint64_t)a5 visibility:(unint64_t)a6;
- (PKPassEntitlementCapabilitySet)initWithRole:(id)a3;
- (id)_initWithLocalizationKey:(id)a3 shareability:(unint64_t)a4 manageability:(unint64_t)a5 visibility:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopy;
- (unint64_t)manageability;
- (unint64_t)shareability;
- (unint64_t)visibility;
- (void)setCapabilityRoleValue:(id)a3;
- (void)setIntraAccountSharingEnabled:(BOOL)a3;
- (void)setLocalizedName:(id)a3;
- (void)setManageability:(unint64_t)a3;
- (void)setShareability:(unint64_t)a3;
- (void)setVisibility:(unint64_t)a3;
@end

@implementation PKPassEntitlementCapabilitySet

- (PKPassEntitlementCapabilitySet)init
{
  return 0;
}

- (PKPassEntitlementCapabilitySet)initWithLocalizedName:(id)a3 shareability:(unint64_t)a4 manageability:(unint64_t)a5 visibility:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPassEntitlementCapabilitySet;
  v12 = [(PKPassEntitlementCapabilitySet *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localizedName, a3);
    v13->_shareability = a4;
    v13->_manageability = a5;
    v13->_visibility = a6;
  }

  return v13;
}

- (PKPassEntitlementCapabilitySet)initWithRole:(id)a3
{
  id v4 = a3;
  if ([v4 length] == 4)
  {
    unsigned __int16 v8 = 0;
    v5 = objc_msgSend(v4, "pk_decodeHexadecimal");
    [v5 getBytes:&v8 length:2];

    unsigned __int16 v8 = bswap32(v8) >> 16;
    self = -[PKPassEntitlementCapabilitySet initWithIntRole:](self, "initWithIntRole:");
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PKPassEntitlementCapabilitySet)initWithIntRole:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = 3;
  uint64_t v5 = 2;
  if ((a3 & 2) == 0) {
    uint64_t v5 = a3 & 1;
  }
  if ((~a3 & 3) != 0) {
    uint64_t v4 = v5;
  }
  if ((~a3 & 7) != 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 999;
  }
  if ((a3 & 0x80) != 0) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  if ((~a3 & 0x90) != 0) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = -1;
  }
  if ((a3 & 0x800) != 0) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 1;
  }
  v10 = [(PKPassEntitlementCapabilitySet *)self initWithLocalizedName:&stru_1EE0F5368 shareability:v6 manageability:v8 visibility:v9];
  id v11 = v10;
  if (v10)
  {
    uint64_t shareability = v10->_shareability;
    if (shareability == 999) {
      int v13 = 15;
    }
    else {
      int v13 = 8;
    }
    if (shareability == 3) {
      int v14 = 11;
    }
    else {
      int v14 = v13;
    }
    if (shareability == 2) {
      int v15 = 10;
    }
    else {
      int v15 = 8;
    }
    if (shareability == 1) {
      int v15 = 9;
    }
    if (shareability <= 2) {
      int v16 = v15;
    }
    else {
      int v16 = v14;
    }
    v10->_intraAccountSharingEnabled = (v16 & ~v3) == 0;
    uint64_t v17 = [NSNumber numberWithUnsignedShort:v3];
    capabilityRoleValue = v11->_capabilityRoleValue;
    v11->_capabilityRoleValue = (NSNumber *)v17;
  }
  return v11;
}

- (id)_initWithLocalizationKey:(id)a3 shareability:(unint64_t)a4 manageability:(unint64_t)a5 visibility:(unint64_t)a6
{
  v10 = PKLocalizedShareableCredentialString((NSString *)a3, 0);
  id v11 = [(PKPassEntitlementCapabilitySet *)self initWithLocalizedName:v10 shareability:a4 manageability:a5 visibility:a6];

  return v11;
}

+ (id)predefinedSets
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = [[PKPassEntitlementCapabilitySet alloc] _initWithLocalizationKey:@"SHARED_ENTITLEMENT_CAPABILITY_SET_OWNER" shareability:999 manageability:-1 visibility:2];
  [v2 addObject:v3];

  id v4 = [[PKPassEntitlementCapabilitySet alloc] _initWithLocalizationKey:@"SHARED_ENTITLEMENT_CAPABILITY_SET_SUPER_ADMIN" shareability:999 manageability:-1 visibility:2];
  [v2 addObject:v4];

  id v5 = [[PKPassEntitlementCapabilitySet alloc] _initWithLocalizationKey:@"SHARED_ENTITLEMENT_CAPABILITY_SET_ADMIN" shareability:2 manageability:2 visibility:2];
  [v2 addObject:v5];

  id v6 = [[PKPassEntitlementCapabilitySet alloc] _initWithLocalizationKey:@"SHARED_ENTITLEMENT_CAPABILITY_SET_FAMILY" shareability:2 manageability:1 visibility:2];
  [v2 addObject:v6];

  id v7 = [[PKPassEntitlementCapabilitySet alloc] _initWithLocalizationKey:@"SHARED_ENTITLEMENT_CAPABILITY_SET_FRIEND" shareability:1 manageability:1 visibility:1];
  [v2 addObject:v7];

  id v8 = [[PKPassEntitlementCapabilitySet alloc] _initWithLocalizationKey:@"SHARED_ENTITLEMENT_CAPABILITY_SET_GUEST" shareability:0 manageability:1 visibility:1];
  [v2 addObject:v8];

  uint64_t v9 = (void *)[v2 copy];
  return v9;
}

- (id)mutableCopy
{
  capabilityRoleValue = self->_capabilityRoleValue;
  id v4 = [PKMutablePassEntitlementCapabilitySet alloc];
  if (capabilityRoleValue)
  {
    id v5 = [(PKPassEntitlementCapabilitySet *)v4 initWithIntRole:[(NSNumber *)self->_capabilityRoleValue unsignedShortValue]];
    id v6 = (void *)[(NSString *)self->_localizedName copy];
    [(PKPassEntitlementCapabilitySet *)v5 setLocalizedName:v6];

    return v5;
  }
  else
  {
    localizedName = self->_localizedName;
    unint64_t shareability = self->_shareability;
    unint64_t manageability = self->_manageability;
    unint64_t visibility = self->_visibility;
    return [(PKPassEntitlementCapabilitySet *)v4 initWithLocalizedName:localizedName shareability:shareability manageability:manageability visibility:visibility];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PKPassEntitlementCapabilitySet alloc];
  uint64_t v5 = [(NSString *)self->_localizedName copy];
  localizedName = v4->_localizedName;
  v4->_localizedName = (NSString *)v5;

  v4->_unint64_t shareability = self->_shareability;
  v4->_unint64_t manageability = self->_manageability;
  v4->_unint64_t visibility = self->_visibility;
  v4->_intraAccountSharingEnabled = self->_intraAccountSharingEnabled;
  objc_storeStrong((id *)&v4->_capabilityRoleValue, self->_capabilityRoleValue);
  return v4;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (unint64_t)shareability
{
  return self->_shareability;
}

- (void)setShareability:(unint64_t)a3
{
  self->_unint64_t shareability = a3;
}

- (unint64_t)manageability
{
  return self->_manageability;
}

- (void)setManageability:(unint64_t)a3
{
  self->_unint64_t manageability = a3;
}

- (unint64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(unint64_t)a3
{
  self->_unint64_t visibility = a3;
}

- (BOOL)intraAccountSharingEnabled
{
  return self->_intraAccountSharingEnabled;
}

- (void)setIntraAccountSharingEnabled:(BOOL)a3
{
  self->_intraAccountSharingEnabled = a3;
}

- (NSNumber)capabilityRoleValue
{
  return self->_capabilityRoleValue;
}

- (void)setCapabilityRoleValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilityRoleValue, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end