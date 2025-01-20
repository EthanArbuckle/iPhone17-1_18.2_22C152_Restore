@interface IFTSchemaIFTSystemRequirement
- (BOOL)appLaunchRequired;
- (BOOL)authenticationRequired;
- (BOOL)carBluetoothIncompatible;
- (BOOL)carPlayIncompatible;
- (BOOL)deviceUnlockRequired;
- (BOOL)hasAppLaunchRequired;
- (BOOL)hasAuthenticationRequired;
- (BOOL)hasCarBluetoothIncompatible;
- (BOOL)hasCarPlayIncompatible;
- (BOOL)hasDeviceUnlockRequired;
- (BOOL)hasProtectedAppApprovalRequired;
- (BOOL)hasUserAuthenticationRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTSystemRequirement)initWithDictionary:(id)a3;
- (IFTSchemaIFTSystemRequirement)initWithJSON:(id)a3;
- (IFTSchemaIFTSystemRequirementAuthenticationRequest)userAuthenticationRequired;
- (IFTSchemaIFTSystemRequirementProtectedAppRequest)protectedAppApprovalRequired;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Systemrequirement;
- (void)deleteAppLaunchRequired;
- (void)deleteAuthenticationRequired;
- (void)deleteCarBluetoothIncompatible;
- (void)deleteCarPlayIncompatible;
- (void)deleteDeviceUnlockRequired;
- (void)deleteProtectedAppApprovalRequired;
- (void)deleteUserAuthenticationRequired;
- (void)setAppLaunchRequired:(BOOL)a3;
- (void)setAuthenticationRequired:(BOOL)a3;
- (void)setCarBluetoothIncompatible:(BOOL)a3;
- (void)setCarPlayIncompatible:(BOOL)a3;
- (void)setDeviceUnlockRequired:(BOOL)a3;
- (void)setHasAppLaunchRequired:(BOOL)a3;
- (void)setHasAuthenticationRequired:(BOOL)a3;
- (void)setHasCarBluetoothIncompatible:(BOOL)a3;
- (void)setHasCarPlayIncompatible:(BOOL)a3;
- (void)setHasDeviceUnlockRequired:(BOOL)a3;
- (void)setHasProtectedAppApprovalRequired:(BOOL)a3;
- (void)setHasUserAuthenticationRequired:(BOOL)a3;
- (void)setProtectedAppApprovalRequired:(id)a3;
- (void)setUserAuthenticationRequired:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTSystemRequirement

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IFTSchemaIFTSystemRequirement;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTSystemRequirement *)self protectedAppApprovalRequired];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTSystemRequirement *)self deleteProtectedAppApprovalRequired];
  }
  v9 = [(IFTSchemaIFTSystemRequirement *)self userAuthenticationRequired];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTSystemRequirement *)self deleteUserAuthenticationRequired];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAuthenticationRequired, 0);
  objc_storeStrong((id *)&self->_protectedAppApprovalRequired, 0);
}

- (void)setHasUserAuthenticationRequired:(BOOL)a3
{
  self->_hasUserAuthenticationRequired = a3;
}

- (BOOL)hasUserAuthenticationRequired
{
  return self->_hasUserAuthenticationRequired;
}

- (void)setHasProtectedAppApprovalRequired:(BOOL)a3
{
  self->_hasProtectedAppApprovalRequired = a3;
}

- (BOOL)hasProtectedAppApprovalRequired
{
  return self->_hasProtectedAppApprovalRequired;
}

- (void)setHasCarBluetoothIncompatible:(BOOL)a3
{
  self->_hasCarBluetoothIncompatible = a3;
}

- (BOOL)hasCarBluetoothIncompatible
{
  return self->_hasCarBluetoothIncompatible;
}

- (void)setHasCarPlayIncompatible:(BOOL)a3
{
  self->_hasCarPlayIncompatible = a3;
}

- (BOOL)hasCarPlayIncompatible
{
  return self->_hasCarPlayIncompatible;
}

- (void)setHasAppLaunchRequired:(BOOL)a3
{
  self->_hasAppLaunchRequired = a3;
}

- (BOOL)hasAppLaunchRequired
{
  return self->_hasAppLaunchRequired;
}

- (void)setHasAuthenticationRequired:(BOOL)a3
{
  self->_hasAuthenticationRequired = a3;
}

- (BOOL)hasAuthenticationRequired
{
  return self->_hasAuthenticationRequired;
}

- (void)setHasDeviceUnlockRequired:(BOOL)a3
{
  self->_hasDeviceUnlockRequired = a3;
}

- (BOOL)hasDeviceUnlockRequired
{
  return self->_hasDeviceUnlockRequired;
}

- (unint64_t)whichOneof_Systemrequirement
{
  return self->_whichOneof_Systemrequirement;
}

- (IFTSchemaIFTSystemRequirement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IFTSchemaIFTSystemRequirement;
  v5 = [(IFTSchemaIFTSystemRequirement *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"deviceUnlockRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTSystemRequirement setDeviceUnlockRequired:](v5, "setDeviceUnlockRequired:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"authenticationRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTSystemRequirement setAuthenticationRequired:](v5, "setAuthenticationRequired:", [v7 BOOLValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"appLaunchRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTSystemRequirement setAppLaunchRequired:](v5, "setAppLaunchRequired:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"carPlayIncompatible"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTSystemRequirement setCarPlayIncompatible:](v5, "setCarPlayIncompatible:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"carBluetoothIncompatible"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTSystemRequirement setCarBluetoothIncompatible:](v5, "setCarBluetoothIncompatible:", [v10 BOOLValue]);
    }
    int v11 = [v4 objectForKeyedSubscript:@"protectedAppApprovalRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[IFTSchemaIFTSystemRequirementProtectedAppRequest alloc] initWithDictionary:v11];
      [(IFTSchemaIFTSystemRequirement *)v5 setProtectedAppApprovalRequired:v12];
    }
    objc_super v13 = [v4 objectForKeyedSubscript:@"userAuthenticationRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [[IFTSchemaIFTSystemRequirementAuthenticationRequest alloc] initWithDictionary:v13];
      [(IFTSchemaIFTSystemRequirement *)v5 setUserAuthenticationRequired:v14];
    }
    v15 = v5;
  }
  return v5;
}

- (IFTSchemaIFTSystemRequirement)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTSystemRequirement *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTSystemRequirement *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  if (whichOneof_Systemrequirement == 3)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTSystemRequirement appLaunchRequired](self, "appLaunchRequired"));
    [v3 setObject:v5 forKeyedSubscript:@"appLaunchRequired"];

    unint64_t whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 2)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTSystemRequirement authenticationRequired](self, "authenticationRequired"));
    [v3 setObject:v6 forKeyedSubscript:@"authenticationRequired"];

    unint64_t whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 5)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTSystemRequirement carBluetoothIncompatible](self, "carBluetoothIncompatible"));
    [v3 setObject:v7 forKeyedSubscript:@"carBluetoothIncompatible"];

    unint64_t whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 4)
  {
    int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTSystemRequirement carPlayIncompatible](self, "carPlayIncompatible"));
    [v3 setObject:v8 forKeyedSubscript:@"carPlayIncompatible"];

    unint64_t whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 1)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTSystemRequirement deviceUnlockRequired](self, "deviceUnlockRequired"));
    [v3 setObject:v9 forKeyedSubscript:@"deviceUnlockRequired"];
  }
  if (self->_protectedAppApprovalRequired)
  {
    v10 = [(IFTSchemaIFTSystemRequirement *)self protectedAppApprovalRequired];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"protectedAppApprovalRequired"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"protectedAppApprovalRequired"];
    }
  }
  if (self->_userAuthenticationRequired)
  {
    objc_super v13 = [(IFTSchemaIFTSystemRequirement *)self userAuthenticationRequired];
    v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"userAuthenticationRequired"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"userAuthenticationRequired"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_whichOneof_Systemrequirement - 1;
  if (v3 > 4) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + *off_1E5EBF660[v3]);
  }
  unint64_t v5 = [(IFTSchemaIFTSystemRequirementProtectedAppRequest *)self->_protectedAppApprovalRequired hash] ^ v4;
  return v5 ^ [(IFTSchemaIFTSystemRequirementAuthenticationRequest *)self->_userAuthenticationRequired hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  unint64_t whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  if (whichOneof_Systemrequirement != objc_msgSend(v4, "whichOneof_Systemrequirement")) {
    goto LABEL_18;
  }
  int deviceUnlockRequired = self->_deviceUnlockRequired;
  if (deviceUnlockRequired != [v4 deviceUnlockRequired]) {
    goto LABEL_18;
  }
  int authenticationRequired = self->_authenticationRequired;
  if (authenticationRequired != [v4 authenticationRequired]) {
    goto LABEL_18;
  }
  int appLaunchRequired = self->_appLaunchRequired;
  if (appLaunchRequired != [v4 appLaunchRequired]) {
    goto LABEL_18;
  }
  int carPlayIncompatible = self->_carPlayIncompatible;
  if (carPlayIncompatible != [v4 carPlayIncompatible]) {
    goto LABEL_18;
  }
  int carBluetoothIncompatible = self->_carBluetoothIncompatible;
  if (carBluetoothIncompatible != [v4 carBluetoothIncompatible]) {
    goto LABEL_18;
  }
  int v11 = [(IFTSchemaIFTSystemRequirement *)self protectedAppApprovalRequired];
  v12 = [v4 protectedAppApprovalRequired];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_17;
  }
  uint64_t v13 = [(IFTSchemaIFTSystemRequirement *)self protectedAppApprovalRequired];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [(IFTSchemaIFTSystemRequirement *)self protectedAppApprovalRequired];
    v16 = [v4 protectedAppApprovalRequired];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v11 = [(IFTSchemaIFTSystemRequirement *)self userAuthenticationRequired];
  v12 = [v4 userAuthenticationRequired];
  if ((v11 == 0) != (v12 != 0))
  {
    uint64_t v18 = [(IFTSchemaIFTSystemRequirement *)self userAuthenticationRequired];
    if (!v18)
    {

LABEL_21:
      BOOL v23 = 1;
      goto LABEL_19;
    }
    v19 = (void *)v18;
    v20 = [(IFTSchemaIFTSystemRequirement *)self userAuthenticationRequired];
    v21 = [v4 userAuthenticationRequired];
    char v22 = [v20 isEqual:v21];

    if (v22) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_17:
  }
LABEL_18:
  BOOL v23 = 0;
LABEL_19:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  unint64_t whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  if (whichOneof_Systemrequirement == 1)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 2)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 3)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 4)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Systemrequirement = self->_whichOneof_Systemrequirement;
  }
  if (whichOneof_Systemrequirement == 5) {
    PBDataWriterWriteBOOLField();
  }
  unint64_t v5 = [(IFTSchemaIFTSystemRequirement *)self protectedAppApprovalRequired];

  if (v5)
  {
    v6 = [(IFTSchemaIFTSystemRequirement *)self protectedAppApprovalRequired];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(IFTSchemaIFTSystemRequirement *)self userAuthenticationRequired];

  int v8 = v10;
  if (v7)
  {
    v9 = [(IFTSchemaIFTSystemRequirement *)self userAuthenticationRequired];
    PBDataWriterWriteSubmessage();

    int v8 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTSystemRequirementReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserAuthenticationRequired
{
  if (self->_whichOneof_Systemrequirement == 7)
  {
    self->_unint64_t whichOneof_Systemrequirement = 0;
    self->_userAuthenticationRequired = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTSystemRequirementAuthenticationRequest)userAuthenticationRequired
{
  if (self->_whichOneof_Systemrequirement == 7) {
    v2 = self->_userAuthenticationRequired;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUserAuthenticationRequired:(id)a3
{
  id v4 = (IFTSchemaIFTSystemRequirementAuthenticationRequest *)a3;
  self->_int deviceUnlockRequired = 0;
  self->_int authenticationRequired = 0;
  self->_int appLaunchRequired = 0;
  self->_int carPlayIncompatible = 0;
  self->_int carBluetoothIncompatible = 0;
  protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
  self->_protectedAppApprovalRequired = 0;

  unint64_t v6 = 7;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichOneof_Systemrequirement = v6;
  userAuthenticationRequired = self->_userAuthenticationRequired;
  self->_userAuthenticationRequired = v4;
}

- (void)deleteProtectedAppApprovalRequired
{
  if (self->_whichOneof_Systemrequirement == 6)
  {
    self->_unint64_t whichOneof_Systemrequirement = 0;
    self->_protectedAppApprovalRequired = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTSystemRequirementProtectedAppRequest)protectedAppApprovalRequired
{
  if (self->_whichOneof_Systemrequirement == 6) {
    v2 = self->_protectedAppApprovalRequired;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setProtectedAppApprovalRequired:(id)a3
{
  id v4 = (IFTSchemaIFTSystemRequirementProtectedAppRequest *)a3;
  self->_int deviceUnlockRequired = 0;
  self->_int authenticationRequired = 0;
  self->_int appLaunchRequired = 0;
  self->_int carPlayIncompatible = 0;
  self->_int carBluetoothIncompatible = 0;
  userAuthenticationRequired = self->_userAuthenticationRequired;
  self->_userAuthenticationRequired = 0;

  unint64_t v6 = 6;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichOneof_Systemrequirement = v6;
  protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
  self->_protectedAppApprovalRequired = v4;
}

- (void)deleteCarBluetoothIncompatible
{
  if (self->_whichOneof_Systemrequirement == 5)
  {
    self->_unint64_t whichOneof_Systemrequirement = 0;
    self->_int carBluetoothIncompatible = 0;
  }
}

- (BOOL)carBluetoothIncompatible
{
  return self->_whichOneof_Systemrequirement == 5 && self->_carBluetoothIncompatible;
}

- (void)setCarBluetoothIncompatible:(BOOL)a3
{
  self->_int deviceUnlockRequired = 0;
  self->_int authenticationRequired = 0;
  self->_int appLaunchRequired = 0;
  self->_int carPlayIncompatible = 0;
  protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
  self->_protectedAppApprovalRequired = 0;

  userAuthenticationRequired = self->_userAuthenticationRequired;
  self->_userAuthenticationRequired = 0;

  self->_unint64_t whichOneof_Systemrequirement = 5;
  self->_int carBluetoothIncompatible = a3;
}

- (void)deleteCarPlayIncompatible
{
  if (self->_whichOneof_Systemrequirement == 4)
  {
    self->_unint64_t whichOneof_Systemrequirement = 0;
    self->_int carPlayIncompatible = 0;
  }
}

- (BOOL)carPlayIncompatible
{
  return self->_whichOneof_Systemrequirement == 4 && self->_carPlayIncompatible;
}

- (void)setCarPlayIncompatible:(BOOL)a3
{
  self->_int deviceUnlockRequired = 0;
  self->_int authenticationRequired = 0;
  self->_int appLaunchRequired = 0;
  self->_int carBluetoothIncompatible = 0;
  protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
  self->_protectedAppApprovalRequired = 0;

  userAuthenticationRequired = self->_userAuthenticationRequired;
  self->_userAuthenticationRequired = 0;

  self->_unint64_t whichOneof_Systemrequirement = 4;
  self->_int carPlayIncompatible = a3;
}

- (void)deleteAppLaunchRequired
{
  if (self->_whichOneof_Systemrequirement == 3)
  {
    self->_unint64_t whichOneof_Systemrequirement = 0;
    self->_int appLaunchRequired = 0;
  }
}

- (BOOL)appLaunchRequired
{
  return self->_whichOneof_Systemrequirement == 3 && self->_appLaunchRequired;
}

- (void)setAppLaunchRequired:(BOOL)a3
{
  self->_int deviceUnlockRequired = 0;
  self->_int authenticationRequired = 0;
  self->_int carPlayIncompatible = 0;
  self->_int carBluetoothIncompatible = 0;
  protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
  self->_protectedAppApprovalRequired = 0;

  userAuthenticationRequired = self->_userAuthenticationRequired;
  self->_userAuthenticationRequired = 0;

  self->_unint64_t whichOneof_Systemrequirement = 3;
  self->_int appLaunchRequired = a3;
}

- (void)deleteAuthenticationRequired
{
  if (self->_whichOneof_Systemrequirement == 2)
  {
    self->_unint64_t whichOneof_Systemrequirement = 0;
    self->_int authenticationRequired = 0;
  }
}

- (BOOL)authenticationRequired
{
  return self->_whichOneof_Systemrequirement == 2 && self->_authenticationRequired;
}

- (void)setAuthenticationRequired:(BOOL)a3
{
  self->_int deviceUnlockRequired = 0;
  self->_int appLaunchRequired = 0;
  self->_int carPlayIncompatible = 0;
  self->_int carBluetoothIncompatible = 0;
  protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
  self->_protectedAppApprovalRequired = 0;

  userAuthenticationRequired = self->_userAuthenticationRequired;
  self->_userAuthenticationRequired = 0;

  self->_unint64_t whichOneof_Systemrequirement = 2;
  self->_int authenticationRequired = a3;
}

- (void)deleteDeviceUnlockRequired
{
  if (self->_whichOneof_Systemrequirement == 1)
  {
    self->_unint64_t whichOneof_Systemrequirement = 0;
    self->_int deviceUnlockRequired = 0;
  }
}

- (BOOL)deviceUnlockRequired
{
  return self->_whichOneof_Systemrequirement == 1 && self->_deviceUnlockRequired;
}

- (void)setDeviceUnlockRequired:(BOOL)a3
{
  self->_int authenticationRequired = 0;
  self->_int appLaunchRequired = 0;
  self->_int carPlayIncompatible = 0;
  self->_int carBluetoothIncompatible = 0;
  protectedAppApprovalRequired = self->_protectedAppApprovalRequired;
  self->_protectedAppApprovalRequired = 0;

  userAuthenticationRequired = self->_userAuthenticationRequired;
  self->_userAuthenticationRequired = 0;

  self->_unint64_t whichOneof_Systemrequirement = 1;
  self->_int deviceUnlockRequired = a3;
}

@end