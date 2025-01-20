@interface IFTSchemaIFTAppRequirement
- (BOOL)accountSetupRequired;
- (BOOL)hasAccountSetupRequired;
- (BOOL)hasSignInRequired;
- (BOOL)hasUserConfirmationRequired;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)signInRequired;
- (BOOL)userConfirmationRequired;
- (IFTSchemaIFTAppRequirement)initWithDictionary:(id)a3;
- (IFTSchemaIFTAppRequirement)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Apprequirement;
- (void)deleteAccountSetupRequired;
- (void)deleteSignInRequired;
- (void)deleteUserConfirmationRequired;
- (void)setAccountSetupRequired:(BOOL)a3;
- (void)setHasAccountSetupRequired:(BOOL)a3;
- (void)setHasSignInRequired:(BOOL)a3;
- (void)setHasUserConfirmationRequired:(BOOL)a3;
- (void)setSignInRequired:(BOOL)a3;
- (void)setUserConfirmationRequired:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTAppRequirement

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void)setHasUserConfirmationRequired:(BOOL)a3
{
  self->_hasUserConfirmationRequired = a3;
}

- (BOOL)hasUserConfirmationRequired
{
  return self->_hasUserConfirmationRequired;
}

- (void)setHasAccountSetupRequired:(BOOL)a3
{
  self->_hasAccountSetupRequired = a3;
}

- (BOOL)hasAccountSetupRequired
{
  return self->_hasAccountSetupRequired;
}

- (void)setHasSignInRequired:(BOOL)a3
{
  self->_hasSignInRequired = a3;
}

- (BOOL)hasSignInRequired
{
  return self->_hasSignInRequired;
}

- (unint64_t)whichOneof_Apprequirement
{
  return self->_whichOneof_Apprequirement;
}

- (IFTSchemaIFTAppRequirement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFTSchemaIFTAppRequirement;
  v5 = [(IFTSchemaIFTAppRequirement *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"signInRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTAppRequirement setSignInRequired:](v5, "setSignInRequired:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"accountSetupRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTAppRequirement setAccountSetupRequired:](v5, "setAccountSetupRequired:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"userConfirmationRequired"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTAppRequirement setUserConfirmationRequired:](v5, "setUserConfirmationRequired:", [v8 BOOLValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (IFTSchemaIFTAppRequirement)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTAppRequirement *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTAppRequirement *)self dictionaryRepresentation];
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
  unint64_t whichOneof_Apprequirement = self->_whichOneof_Apprequirement;
  if (whichOneof_Apprequirement == 2)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTAppRequirement accountSetupRequired](self, "accountSetupRequired"));
    [v3 setObject:v5 forKeyedSubscript:@"accountSetupRequired"];

    unint64_t whichOneof_Apprequirement = self->_whichOneof_Apprequirement;
  }
  if (whichOneof_Apprequirement == 1)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTAppRequirement signInRequired](self, "signInRequired"));
    [v3 setObject:v6 forKeyedSubscript:@"signInRequired"];

    unint64_t whichOneof_Apprequirement = self->_whichOneof_Apprequirement;
  }
  if (whichOneof_Apprequirement == 3)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTAppRequirement userConfirmationRequired](self, "userConfirmationRequired"));
    [v3 setObject:v7 forKeyedSubscript:@"userConfirmationRequired"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_whichOneof_Apprequirement - 1;
  if (v2 > 2) {
    return 0;
  }
  else {
    return 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + *off_1E5EBF608[v2]);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (unint64_t whichOneof_Apprequirement = self->_whichOneof_Apprequirement,
        whichOneof_Apprequirement == objc_msgSend(v4, "whichOneof_Apprequirement"))
    && (int signInRequired = self->_signInRequired, signInRequired == [v4 signInRequired])
    && (int accountSetupRequired = self->_accountSetupRequired,
        accountSetupRequired == [v4 accountSetupRequired]))
  {
    int userConfirmationRequired = self->_userConfirmationRequired;
    BOOL v9 = userConfirmationRequired == [v4 userConfirmationRequired];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  unint64_t whichOneof_Apprequirement = self->_whichOneof_Apprequirement;
  id v6 = v4;
  if (whichOneof_Apprequirement == 1)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    unint64_t whichOneof_Apprequirement = self->_whichOneof_Apprequirement;
  }
  if (whichOneof_Apprequirement == 2)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    unint64_t whichOneof_Apprequirement = self->_whichOneof_Apprequirement;
  }
  if (whichOneof_Apprequirement == 3)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTAppRequirementReadFrom(self, (uint64_t)a3);
}

- (void)deleteUserConfirmationRequired
{
  if (self->_whichOneof_Apprequirement == 3)
  {
    self->_unint64_t whichOneof_Apprequirement = 0;
    self->_int userConfirmationRequired = 0;
  }
}

- (BOOL)userConfirmationRequired
{
  return self->_whichOneof_Apprequirement == 3 && self->_userConfirmationRequired;
}

- (void)setUserConfirmationRequired:(BOOL)a3
{
  self->_int signInRequired = 0;
  self->_int accountSetupRequired = 0;
  self->_unint64_t whichOneof_Apprequirement = 3;
  self->_int userConfirmationRequired = a3;
}

- (void)deleteAccountSetupRequired
{
  if (self->_whichOneof_Apprequirement == 2)
  {
    self->_unint64_t whichOneof_Apprequirement = 0;
    self->_int accountSetupRequired = 0;
  }
}

- (BOOL)accountSetupRequired
{
  return self->_whichOneof_Apprequirement == 2 && self->_accountSetupRequired;
}

- (void)setAccountSetupRequired:(BOOL)a3
{
  self->_int signInRequired = 0;
  self->_int userConfirmationRequired = 0;
  self->_unint64_t whichOneof_Apprequirement = 2;
  self->_int accountSetupRequired = a3;
}

- (void)deleteSignInRequired
{
  if (self->_whichOneof_Apprequirement == 1)
  {
    self->_unint64_t whichOneof_Apprequirement = 0;
    self->_int signInRequired = 0;
  }
}

- (BOOL)signInRequired
{
  return self->_whichOneof_Apprequirement == 1 && self->_signInRequired;
}

- (void)setSignInRequired:(BOOL)a3
{
  self->_int accountSetupRequired = 0;
  self->_int userConfirmationRequired = 0;
  self->_unint64_t whichOneof_Apprequirement = 1;
  self->_int signInRequired = a3;
}

@end