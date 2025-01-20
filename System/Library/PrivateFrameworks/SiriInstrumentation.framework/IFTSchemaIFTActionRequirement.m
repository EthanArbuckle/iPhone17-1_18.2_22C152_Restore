@interface IFTSchemaIFTActionRequirement
- (BOOL)exists;
- (BOOL)hasAppRequirement;
- (BOOL)hasExists;
- (BOOL)hasPermissionRequirement;
- (BOOL)hasSystemRequirement;
- (BOOL)hasUnsupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)unsupported;
- (IFTSchemaIFTActionRequirement)initWithDictionary:(id)a3;
- (IFTSchemaIFTActionRequirement)initWithJSON:(id)a3;
- (IFTSchemaIFTAppRequirement)appRequirement;
- (IFTSchemaIFTPermissionRequirement)permissionRequirement;
- (IFTSchemaIFTSystemRequirement)systemRequirement;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Actionrequirement;
- (void)deleteAppRequirement;
- (void)deleteExists;
- (void)deletePermissionRequirement;
- (void)deleteSystemRequirement;
- (void)deleteUnsupported;
- (void)setAppRequirement:(id)a3;
- (void)setExists:(BOOL)a3;
- (void)setHasAppRequirement:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasPermissionRequirement:(BOOL)a3;
- (void)setHasSystemRequirement:(BOOL)a3;
- (void)setHasUnsupported:(BOOL)a3;
- (void)setPermissionRequirement:(id)a3;
- (void)setSystemRequirement:(id)a3;
- (void)setUnsupported:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTActionRequirement

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFTSchemaIFTActionRequirement;
  v5 = [(SISchemaInstrumentationMessage *)&v16 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTActionRequirement *)self appRequirement];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTActionRequirement *)self deleteAppRequirement];
  }
  v9 = [(IFTSchemaIFTActionRequirement *)self permissionRequirement];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTActionRequirement *)self deletePermissionRequirement];
  }
  v12 = [(IFTSchemaIFTActionRequirement *)self systemRequirement];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTActionRequirement *)self deleteSystemRequirement];
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
  objc_storeStrong((id *)&self->_systemRequirement, 0);
  objc_storeStrong((id *)&self->_permissionRequirement, 0);
  objc_storeStrong((id *)&self->_appRequirement, 0);
}

- (void)setHasSystemRequirement:(BOOL)a3
{
  self->_hasUnsupported = a3;
}

- (BOOL)hasSystemRequirement
{
  return self->_hasUnsupported;
}

- (void)setHasPermissionRequirement:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (BOOL)hasPermissionRequirement
{
  return *((unsigned char *)&self->_has + 3);
}

- (void)setHasAppRequirement:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasAppRequirement
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasUnsupported:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (BOOL)hasUnsupported
{
  return *((unsigned char *)&self->_has + 1);
}

- (BOOL)exists
{
  return self->_exists;
}

- (unint64_t)whichOneof_Actionrequirement
{
  return self->_whichOneof_Actionrequirement;
}

- (IFTSchemaIFTActionRequirement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IFTSchemaIFTActionRequirement;
  v5 = [(IFTSchemaIFTActionRequirement *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionRequirement setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"unsupported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTActionRequirement setUnsupported:](v5, "setUnsupported:", [v7 BOOLValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"appRequirement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[IFTSchemaIFTAppRequirement alloc] initWithDictionary:v8];
      [(IFTSchemaIFTActionRequirement *)v5 setAppRequirement:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"permissionRequirement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[IFTSchemaIFTPermissionRequirement alloc] initWithDictionary:v10];
      [(IFTSchemaIFTActionRequirement *)v5 setPermissionRequirement:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"systemRequirement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[IFTSchemaIFTSystemRequirement alloc] initWithDictionary:v12];
      [(IFTSchemaIFTActionRequirement *)v5 setSystemRequirement:v13];
    }
    int v14 = v5;
  }
  return v5;
}

- (IFTSchemaIFTActionRequirement)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTActionRequirement *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTActionRequirement *)self dictionaryRepresentation];
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
  if (self->_appRequirement)
  {
    id v4 = [(IFTSchemaIFTActionRequirement *)self appRequirement];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"appRequirement"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"appRequirement"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionRequirement exists](self, "exists"));
    [v3 setObject:v7 forKeyedSubscript:@"exists"];
  }
  if (self->_permissionRequirement)
  {
    int v8 = [(IFTSchemaIFTActionRequirement *)self permissionRequirement];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"permissionRequirement"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"permissionRequirement"];
    }
  }
  if (self->_systemRequirement)
  {
    int v11 = [(IFTSchemaIFTActionRequirement *)self systemRequirement];
    v12 = [v11 dictionaryRepresentation];
    if (v12)
    {
      [v3 setObject:v12 forKeyedSubscript:@"systemRequirement"];
    }
    else
    {
      v13 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v13 forKeyedSubscript:@"systemRequirement"];
    }
  }
  if (self->_whichOneof_Actionrequirement == 11)
  {
    int v14 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTActionRequirement unsupported](self, "unsupported"));
    [v3 setObject:v14 forKeyedSubscript:@"unsupported"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v3 = 0;
  }
  if (self->_whichOneof_Actionrequirement == 11) {
    uint64_t v4 = 2654435761 * self->_unsupported;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3 ^ [(IFTSchemaIFTAppRequirement *)self->_appRequirement hash];
  unint64_t v6 = [(IFTSchemaIFTPermissionRequirement *)self->_permissionRequirement hash];
  return v5 ^ v6 ^ [(IFTSchemaIFTSystemRequirement *)self->_systemRequirement hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t whichOneof_Actionrequirement = self->_whichOneof_Actionrequirement;
  if (whichOneof_Actionrequirement != objc_msgSend(v4, "whichOneof_Actionrequirement")) {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_22;
    }
  }
  int unsupported = self->_unsupported;
  if (unsupported != [v4 unsupported]) {
    goto LABEL_22;
  }
  int v8 = [(IFTSchemaIFTActionRequirement *)self appRequirement];
  v9 = [v4 appRequirement];
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_21;
  }
  uint64_t v10 = [(IFTSchemaIFTActionRequirement *)self appRequirement];
  if (v10)
  {
    int v11 = (void *)v10;
    v12 = [(IFTSchemaIFTActionRequirement *)self appRequirement];
    v13 = [v4 appRequirement];
    int v14 = [v12 isEqual:v13];

    if (!v14) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  int v8 = [(IFTSchemaIFTActionRequirement *)self permissionRequirement];
  v9 = [v4 permissionRequirement];
  if ((v8 == 0) == (v9 != 0)) {
    goto LABEL_21;
  }
  uint64_t v15 = [(IFTSchemaIFTActionRequirement *)self permissionRequirement];
  if (v15)
  {
    objc_super v16 = (void *)v15;
    v17 = [(IFTSchemaIFTActionRequirement *)self permissionRequirement];
    v18 = [v4 permissionRequirement];
    int v19 = [v17 isEqual:v18];

    if (!v19) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  int v8 = [(IFTSchemaIFTActionRequirement *)self systemRequirement];
  v9 = [v4 systemRequirement];
  if ((v8 == 0) != (v9 != 0))
  {
    uint64_t v20 = [(IFTSchemaIFTActionRequirement *)self systemRequirement];
    if (!v20)
    {

LABEL_25:
      BOOL v25 = 1;
      goto LABEL_23;
    }
    v21 = (void *)v20;
    v22 = [(IFTSchemaIFTActionRequirement *)self systemRequirement];
    v23 = [v4 systemRequirement];
    char v24 = [v22 isEqual:v23];

    if (v24) {
      goto LABEL_25;
    }
  }
  else
  {
LABEL_21:
  }
LABEL_22:
  BOOL v25 = 0;
LABEL_23:

  return v25;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_whichOneof_Actionrequirement == 11) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v4 = [(IFTSchemaIFTActionRequirement *)self appRequirement];

  if (v4)
  {
    unint64_t v5 = [(IFTSchemaIFTActionRequirement *)self appRequirement];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(IFTSchemaIFTActionRequirement *)self permissionRequirement];

  if (v6)
  {
    uint64_t v7 = [(IFTSchemaIFTActionRequirement *)self permissionRequirement];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(IFTSchemaIFTActionRequirement *)self systemRequirement];

  v9 = v11;
  if (v8)
  {
    uint64_t v10 = [(IFTSchemaIFTActionRequirement *)self systemRequirement];
    PBDataWriterWriteSubmessage();

    v9 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTActionRequirementReadFrom(self, (uint64_t)a3);
}

- (void)deleteSystemRequirement
{
  if (self->_whichOneof_Actionrequirement == 14)
  {
    self->_unint64_t whichOneof_Actionrequirement = 0;
    self->_systemRequirement = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTSystemRequirement)systemRequirement
{
  if (self->_whichOneof_Actionrequirement == 14) {
    v2 = self->_systemRequirement;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setSystemRequirement:(id)a3
{
  uint64_t v4 = (IFTSchemaIFTSystemRequirement *)a3;
  self->_int unsupported = 0;
  appRequirement = self->_appRequirement;
  self->_appRequirement = 0;

  permissionRequirement = self->_permissionRequirement;
  self->_permissionRequirement = 0;

  unint64_t v7 = 14;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichOneof_Actionrequirement = v7;
  systemRequirement = self->_systemRequirement;
  self->_systemRequirement = v4;
}

- (void)deletePermissionRequirement
{
  if (self->_whichOneof_Actionrequirement == 13)
  {
    self->_unint64_t whichOneof_Actionrequirement = 0;
    self->_permissionRequirement = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTPermissionRequirement)permissionRequirement
{
  if (self->_whichOneof_Actionrequirement == 13) {
    v2 = self->_permissionRequirement;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPermissionRequirement:(id)a3
{
  uint64_t v4 = (IFTSchemaIFTPermissionRequirement *)a3;
  self->_int unsupported = 0;
  appRequirement = self->_appRequirement;
  self->_appRequirement = 0;

  systemRequirement = self->_systemRequirement;
  self->_systemRequirement = 0;

  unint64_t v7 = 13;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichOneof_Actionrequirement = v7;
  permissionRequirement = self->_permissionRequirement;
  self->_permissionRequirement = v4;
}

- (void)deleteAppRequirement
{
  if (self->_whichOneof_Actionrequirement == 12)
  {
    self->_unint64_t whichOneof_Actionrequirement = 0;
    self->_appRequirement = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTAppRequirement)appRequirement
{
  if (self->_whichOneof_Actionrequirement == 12) {
    v2 = self->_appRequirement;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setAppRequirement:(id)a3
{
  uint64_t v4 = (IFTSchemaIFTAppRequirement *)a3;
  self->_int unsupported = 0;
  permissionRequirement = self->_permissionRequirement;
  self->_permissionRequirement = 0;

  systemRequirement = self->_systemRequirement;
  self->_systemRequirement = 0;

  unint64_t v7 = 12;
  if (!v4) {
    unint64_t v7 = 0;
  }
  self->_unint64_t whichOneof_Actionrequirement = v7;
  appRequirement = self->_appRequirement;
  self->_appRequirement = v4;
}

- (void)deleteUnsupported
{
  if (self->_whichOneof_Actionrequirement == 11)
  {
    self->_unint64_t whichOneof_Actionrequirement = 0;
    self->_int unsupported = 0;
  }
}

- (BOOL)unsupported
{
  return self->_whichOneof_Actionrequirement == 11 && self->_unsupported;
}

- (void)setUnsupported:(BOOL)a3
{
  appRequirement = self->_appRequirement;
  self->_appRequirement = 0;

  permissionRequirement = self->_permissionRequirement;
  self->_permissionRequirement = 0;

  systemRequirement = self->_systemRequirement;
  self->_systemRequirement = 0;

  self->_unint64_t whichOneof_Actionrequirement = 11;
  self->_int unsupported = a3;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end