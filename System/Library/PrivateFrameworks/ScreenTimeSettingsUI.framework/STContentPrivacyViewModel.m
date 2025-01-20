@interface STContentPrivacyViewModel
- (BOOL)hasPasscode;
- (BOOL)isEligibleForAppDistribution;
- (BOOL)isLoaded;
- (BOOL)isLocalDevice;
- (BOOL)isSiriImageGenerationAllowed;
- (BOOL)restrictionsEnabled;
- (BOOL)shouldAllowEditing;
- (BOOL)shouldEnableRestriction:(id)a3;
- (BOOL)userIsManaged;
- (BOOL)userIsRemote;
- (NSMutableDictionary)valuesByRestriction;
- (NSNumber)userDSID;
- (NSSet)visibleRestrictions;
- (NSString)userName;
- (STCommunicationLimits)communicationLimits;
- (STContentPrivacyViewModel)init;
- (id)defaultValueForRestriction:(id)a3;
- (id)visibleRestrictionWithConfiguration:(id)a3 key:(id)a4;
- (unint64_t)userType;
- (void)setCommunicationLimits:(id)a3;
- (void)setHasPasscode:(BOOL)a3;
- (void)setIsLoaded:(BOOL)a3;
- (void)setIsLocalDevice:(BOOL)a3;
- (void)setIsSiriImageGenerationAllowed:(BOOL)a3;
- (void)setRestrictionsEnabled:(BOOL)a3;
- (void)setShouldAllowEditing:(BOOL)a3;
- (void)setUserDSID:(id)a3;
- (void)setUserIsManaged:(BOOL)a3;
- (void)setUserIsRemote:(BOOL)a3;
- (void)setUserName:(id)a3;
- (void)setUserType:(unint64_t)a3;
- (void)setValuesByRestriction:(id)a3;
- (void)setVisibleRestrictions:(id)a3;
@end

@implementation STContentPrivacyViewModel

- (STContentPrivacyViewModel)init
{
  v9.receiver = self;
  v9.super_class = (Class)STContentPrivacyViewModel;
  v2 = [(STContentPrivacyViewModel *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_isLocalDevice = 0;
    v2->_restrictionsEnabled = 0;
    uint64_t v4 = objc_opt_new();
    visibleRestrictions = v3->_visibleRestrictions;
    v3->_visibleRestrictions = (NSSet *)v4;

    uint64_t v6 = objc_opt_new();
    valuesByRestriction = v3->_valuesByRestriction;
    v3->_valuesByRestriction = (NSMutableDictionary *)v6;

    v3->_isSiriImageGenerationAllowed = 1;
  }
  return v3;
}

- (id)visibleRestrictionWithConfiguration:(id)a3 key:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = STSupportedConfigurations();
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  if (!v10)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"STContentPrivacyViewModel.m" lineNumber:246 description:@"Unknown configuration"];
  }
  v11 = [(STContentPrivacyViewModel *)self visibleRestrictions];
  v12 = [[STRestrictionItem alloc] initWithConfiguration:v7 restrictionKey:v8 labelName:&stru_26D9391A8 type:3 restrictionValue:0];

  v13 = [v11 member:v12];

  return v13;
}

- (id)defaultValueForRestriction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 restrictionType];
  uint64_t v6 = (void *)MEMORY[0x263EFFA88];
  switch(v5)
  {
    case 0:
      break;
    case 1:
      uint64_t v6 = (void *)MEMORY[0x263EFFA80];
      break;
    case 2:
      uint64_t v6 = (void *)MEMORY[0x263EFFA68];
      break;
    case 3:
      uint64_t v6 = [v4 otherInfo];
      break;
    default:
      id v7 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, @"STContentPrivacyViewModel.m", 271, @"Unimplemented type %d", v5);

      uint64_t v6 = 0;
      break;
  }

  return v6;
}

- (BOOL)shouldEnableRestriction:(id)a3
{
  id v4 = [a3 payloadKey];
  int v5 = [v4 isEqualToString:@"allowGameCenterNearbyMultiplayer"];

  if (v5)
  {
    uint64_t v6 = [[STRestrictionItem alloc] initWithConfiguration:@"system.gamecenter" restrictionKey:@"allowedGameCenterOtherPlayerTypes" labelName:&stru_26D9391A8 type:3 restrictionValue:0];
    id v7 = [(STContentPrivacyViewModel *)self valuesByRestriction];
    id v8 = [v7 objectForKeyedSubscript:v6];

    if (v8)
    {
      uint64_t v9 = [v8 integerValue];
      uint64_t v10 = [&unk_26D966FA0 integerValue];
      BOOL v11 = [(STContentPrivacyViewModel *)self restrictionsEnabled];
      BOOL v12 = v9 != v10 && v11;
    }
    else
    {
      BOOL v12 = [(STContentPrivacyViewModel *)self restrictionsEnabled];
    }

    return v12;
  }
  else
  {
    return [(STContentPrivacyViewModel *)self restrictionsEnabled];
  }
}

- (BOOL)isEligibleForAppDistribution
{
  v3 = +[STContentPrivacyViewModelCoordinator appRatingsRestrictionItem];
  id v4 = [(STContentPrivacyViewModel *)self valuesByRestriction];
  int v5 = [v4 objectForKeyedSubscript:v3];
  char v6 = [v5 isEqualToNumber:&unk_26D966FB8];

  LOBYTE(v4) = v6 | +[STDistributionEligibility evaluateEligibilityForAppDistribution];
  return (char)v4;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void)setIsLoaded:(BOOL)a3
{
  self->_isLoaded = a3;
}

- (BOOL)isLocalDevice
{
  return self->_isLocalDevice;
}

- (void)setIsLocalDevice:(BOOL)a3
{
  self->_isLocalDevice = a3;
}

- (BOOL)hasPasscode
{
  return self->_hasPasscode;
}

- (void)setHasPasscode:(BOOL)a3
{
  self->_hasPasscode = a3;
}

- (BOOL)restrictionsEnabled
{
  return self->_restrictionsEnabled;
}

- (void)setRestrictionsEnabled:(BOOL)a3
{
  self->_restrictionsEnabled = a3;
}

- (BOOL)shouldAllowEditing
{
  return self->_shouldAllowEditing;
}

- (void)setShouldAllowEditing:(BOOL)a3
{
  self->_shouldAllowEditing = a3;
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
}

- (NSNumber)userDSID
{
  return self->_userDSID;
}

- (void)setUserDSID:(id)a3
{
}

- (NSMutableDictionary)valuesByRestriction
{
  return self->_valuesByRestriction;
}

- (void)setValuesByRestriction:(id)a3
{
}

- (BOOL)isSiriImageGenerationAllowed
{
  return self->_isSiriImageGenerationAllowed;
}

- (void)setIsSiriImageGenerationAllowed:(BOOL)a3
{
  self->_isSiriImageGenerationAllowed = a3;
}

- (STCommunicationLimits)communicationLimits
{
  return (STCommunicationLimits *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCommunicationLimits:(id)a3
{
}

- (BOOL)userIsManaged
{
  return self->_userIsManaged;
}

- (void)setUserIsManaged:(BOOL)a3
{
  self->_userIsManaged = a3;
}

- (BOOL)userIsRemote
{
  return self->_userIsRemote;
}

- (void)setUserIsRemote:(BOOL)a3
{
  self->_userIsRemote = a3;
}

- (unint64_t)userType
{
  return self->_userType;
}

- (void)setUserType:(unint64_t)a3
{
  self->_userType = a3;
}

- (NSSet)visibleRestrictions
{
  return self->_visibleRestrictions;
}

- (void)setVisibleRestrictions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleRestrictions, 0);
  objc_storeStrong((id *)&self->_communicationLimits, 0);
  objc_storeStrong((id *)&self->_valuesByRestriction, 0);
  objc_storeStrong((id *)&self->_userDSID, 0);

  objc_storeStrong((id *)&self->_userName, 0);
}

@end