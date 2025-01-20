@interface STCommunicationLimits
+ (BOOL)hasShownCompatibilityAlertForDSID:(id)a3;
+ (void)setHasShownCompatibilityAlert:(BOOL)a3 forDSID:(id)a4;
- (BOOL)contactsEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCommunicationLimits:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)contactManagementState;
- (int64_t)downtimeCommunicationLimit;
- (int64_t)screenTimeCommunicationLimit;
- (unint64_t)hash;
- (void)setContactManagementState:(int64_t)a3;
- (void)setContactsEditable:(BOOL)a3;
- (void)setDowntimeCommunicationLimit:(int64_t)a3;
- (void)setScreenTimeCommunicationLimit:(int64_t)a3;
@end

@implementation STCommunicationLimits

+ (BOOL)hasShownCompatibilityAlertForDSID:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  v5 = [v3 standardUserDefaults];
  v6 = [v5 objectForKey:@"HasShownCommunicationLimitsCompatibilityAlertByDSID"];

  v7 = [v6 objectForKeyedSubscript:v4];

  return v7 != 0;
}

+ (void)setHasShownCompatibilityAlert:(BOOL)a3 forDSID:(id)a4
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA40];
  id v5 = a4;
  v6 = [v4 standardUserDefaults];
  v7 = [v6 objectForKey:@"HasShownCommunicationLimitsCompatibilityAlertByDSID"];
  if (v7)
  {
    v8 = v7;
    v9 = (void *)[v7 mutableCopy];
    [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v5];
  }
  else
  {
    id v10 = v5;
    v11[0] = MEMORY[0x263EFFA88];
    v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  [v6 setObject:v9 forKey:@"HasShownCommunicationLimitsCompatibilityAlertByDSID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[STCommunicationLimits allocWithZone:a3] init];
  *((void *)result + 2) = self->_screenTimeCommunicationLimit;
  *((void *)result + 3) = self->_downtimeCommunicationLimit;
  *((void *)result + 4) = self->_contactManagementState;
  *((unsigned char *)result + 8) = self->_contactsEditable;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STCommunicationLimits *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = v4 != 0;
  }
  else
  {
    objc_opt_class();
    BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
      && [(STCommunicationLimits *)self isEqualToCommunicationLimits:v5];
  }

  return v6;
}

- (BOOL)isEqualToCommunicationLimits:(id)a3
{
  id v4 = (STCommunicationLimits *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else if (v4 {
         && (int64_t v6 = [(STCommunicationLimits *)self screenTimeCommunicationLimit],
  }
             v6 == [(STCommunicationLimits *)v5 screenTimeCommunicationLimit])
         && (int64_t v7 = [(STCommunicationLimits *)self downtimeCommunicationLimit],
             v7 == [(STCommunicationLimits *)v5 downtimeCommunicationLimit])
         && (int64_t v8 = [(STCommunicationLimits *)self contactManagementState],
             v8 == [(STCommunicationLimits *)v5 contactManagementState]))
  {
    BOOL v9 = [(STCommunicationLimits *)self contactsEditable];
    BOOL v10 = v9 ^ [(STCommunicationLimits *)v5 contactsEditable] ^ 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v3 = [(STCommunicationLimits *)self screenTimeCommunicationLimit];
  int64_t v4 = [(STCommunicationLimits *)self downtimeCommunicationLimit] ^ v3;
  int64_t v5 = v4 ^ [(STCommunicationLimits *)self contactManagementState];
  return v5 ^ [(STCommunicationLimits *)self contactsEditable];
}

- (int64_t)screenTimeCommunicationLimit
{
  return self->_screenTimeCommunicationLimit;
}

- (void)setScreenTimeCommunicationLimit:(int64_t)a3
{
  self->_screenTimeCommunicationLimit = a3;
}

- (int64_t)downtimeCommunicationLimit
{
  return self->_downtimeCommunicationLimit;
}

- (void)setDowntimeCommunicationLimit:(int64_t)a3
{
  self->_downtimeCommunicationLimit = a3;
}

- (int64_t)contactManagementState
{
  return self->_contactManagementState;
}

- (void)setContactManagementState:(int64_t)a3
{
  self->_contactManagementState = a3;
}

- (BOOL)contactsEditable
{
  return self->_contactsEditable;
}

- (void)setContactsEditable:(BOOL)a3
{
  self->_contactsEditable = a3;
}

@end