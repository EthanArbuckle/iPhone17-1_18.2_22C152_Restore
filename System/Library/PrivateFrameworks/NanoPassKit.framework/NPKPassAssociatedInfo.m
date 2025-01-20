@interface NPKPassAssociatedInfo
- (BOOL)hasDeviceBoundCommutePlans;
- (BOOL)isHomeAccessRestricted;
- (NPKBankConnectAccount)bankConnectAccount;
- (NPKPassAssociatedInfo)initWithTransitProperties:(id)a3 appletState:(id)a4 balanceFields:(id)a5 commutePlanFields:(id)a6 tiles:(id)a7 rangingSuspensionReason:(unint64_t)a8 accessories:(id)a9 isHomeAccessRestricted:(BOOL)a10 precursorPassDescription:(id)a11 hasDeviceBoundCommutePlans:(BOOL)a12;
- (NSArray)balanceFields;
- (NSArray)commutePlanFields;
- (NSArray)tiles;
- (NSDictionary)accessories;
- (PKPrecursorPassUpgradeRequestDescription)precursorPassDescription;
- (PKTransitAppletState)transitAppletState;
- (PKTransitPassProperties)transitProperties;
- (id)description;
- (unint64_t)rangingSuspensionReason;
- (void)setIsHomeAccessRestricted:(BOOL)a3;
@end

@implementation NPKPassAssociatedInfo

- (NPKPassAssociatedInfo)initWithTransitProperties:(id)a3 appletState:(id)a4 balanceFields:(id)a5 commutePlanFields:(id)a6 tiles:(id)a7 rangingSuspensionReason:(unint64_t)a8 accessories:(id)a9 isHomeAccessRestricted:(BOOL)a10 precursorPassDescription:(id)a11 hasDeviceBoundCommutePlans:(BOOL)a12
{
  id v34 = a3;
  id v33 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a11;
  v35.receiver = self;
  v35.super_class = (Class)NPKPassAssociatedInfo;
  v23 = [(NPKPassAssociatedInfo *)&v35 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_transitProperties, a3);
    objc_storeStrong((id *)&v24->_transitAppletState, a4);
    uint64_t v25 = [v18 copy];
    balanceFields = v24->_balanceFields;
    v24->_balanceFields = (NSArray *)v25;

    uint64_t v27 = [v19 copy];
    commutePlanFields = v24->_commutePlanFields;
    v24->_commutePlanFields = (NSArray *)v27;

    uint64_t v29 = [v20 copy];
    tiles = v24->_tiles;
    v24->_tiles = (NSArray *)v29;

    v24->_rangingSuspensionReason = a8;
    objc_storeStrong((id *)&v24->_precursorPassDescription, a11);
    objc_storeStrong((id *)&v24->_accessories, a9);
    v24->_isHomeAccessRestricted = a10;
    v24->_hasDeviceBoundCommutePlans = a12;
  }

  return v24;
}

- (id)description
{
  v3 = [NSString stringWithFormat:@"<%@:%p> {transitProperties:%@, appletState:%@, balanceFields:%@ commutePlanFields:%@, tiles:%@, rangingSuspensionReason:%lu, precursorPassDescription:%@, hasDeviceBoundCommutePlans:%lu", objc_opt_class(), self, self->_transitProperties, self->_transitAppletState, self->_balanceFields, self->_commutePlanFields, self->_tiles, self->_rangingSuspensionReason, self->_precursorPassDescription, self->_hasDeviceBoundCommutePlans];
  v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@", accessories:%@", self->_accessories];
  return v4;
}

- (PKTransitPassProperties)transitProperties
{
  return self->_transitProperties;
}

- (PKTransitAppletState)transitAppletState
{
  return self->_transitAppletState;
}

- (NSArray)balanceFields
{
  return self->_balanceFields;
}

- (NSArray)commutePlanFields
{
  return self->_commutePlanFields;
}

- (NSArray)tiles
{
  return self->_tiles;
}

- (unint64_t)rangingSuspensionReason
{
  return self->_rangingSuspensionReason;
}

- (BOOL)hasDeviceBoundCommutePlans
{
  return self->_hasDeviceBoundCommutePlans;
}

- (NPKBankConnectAccount)bankConnectAccount
{
  return self->_bankConnectAccount;
}

- (PKPrecursorPassUpgradeRequestDescription)precursorPassDescription
{
  return self->_precursorPassDescription;
}

- (NSDictionary)accessories
{
  return self->_accessories;
}

- (BOOL)isHomeAccessRestricted
{
  return self->_isHomeAccessRestricted;
}

- (void)setIsHomeAccessRestricted:(BOOL)a3
{
  self->_isHomeAccessRestricted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_precursorPassDescription, 0);
  objc_storeStrong((id *)&self->_bankConnectAccount, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_commutePlanFields, 0);
  objc_storeStrong((id *)&self->_balanceFields, 0);
  objc_storeStrong((id *)&self->_transitAppletState, 0);
  objc_storeStrong((id *)&self->_transitProperties, 0);
}

@end