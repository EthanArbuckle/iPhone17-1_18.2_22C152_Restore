@interface ODDSiriSchemaODDAssistantCarPlayDimensions
- (BOOL)hasAssistantDimensions;
- (BOOL)hasCarPlayConnection;
- (BOOL)hasDirectAction;
- (BOOL)hasEnhancedVoiceTriggerMode;
- (BOOL)hasVehicleManufacturer;
- (BOOL)hasVehicleModel;
- (BOOL)hasVehicleName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)vehicleManufacturer;
- (NSString)vehicleModel;
- (NSString)vehicleName;
- (ODDSiriSchemaODDAssistantCarPlayDimensions)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDAssistantCarPlayDimensions)initWithJSON:(id)a3;
- (ODDSiriSchemaODDAssistantDimensions)assistantDimensions;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)carPlayConnection;
- (int)directAction;
- (int)enhancedVoiceTriggerMode;
- (unint64_t)hash;
- (void)deleteAssistantDimensions;
- (void)deleteCarPlayConnection;
- (void)deleteDirectAction;
- (void)deleteEnhancedVoiceTriggerMode;
- (void)deleteVehicleManufacturer;
- (void)deleteVehicleModel;
- (void)deleteVehicleName;
- (void)setAssistantDimensions:(id)a3;
- (void)setCarPlayConnection:(int)a3;
- (void)setDirectAction:(int)a3;
- (void)setEnhancedVoiceTriggerMode:(int)a3;
- (void)setHasAssistantDimensions:(BOOL)a3;
- (void)setHasCarPlayConnection:(BOOL)a3;
- (void)setHasDirectAction:(BOOL)a3;
- (void)setHasEnhancedVoiceTriggerMode:(BOOL)a3;
- (void)setHasVehicleManufacturer:(BOOL)a3;
- (void)setHasVehicleModel:(BOOL)a3;
- (void)setHasVehicleName:(BOOL)a3;
- (void)setVehicleManufacturer:(id)a3;
- (void)setVehicleModel:(id)a3;
- (void)setVehicleName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDAssistantCarPlayDimensions

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDAssistantCarPlayDimensions;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self assistantDimensions];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self deleteAssistantDimensions];
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
  objc_storeStrong((id *)&self->_vehicleModel, 0);
  objc_storeStrong((id *)&self->_vehicleName, 0);
  objc_storeStrong((id *)&self->_vehicleManufacturer, 0);
  objc_storeStrong((id *)&self->_assistantDimensions, 0);
}

- (void)setHasVehicleModel:(BOOL)a3
{
  self->_hasAssistantDimensions = a3;
}

- (void)setHasVehicleName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasVehicleManufacturer:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAssistantDimensions:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)carPlayConnection
{
  return self->_carPlayConnection;
}

- (int)directAction
{
  return self->_directAction;
}

- (int)enhancedVoiceTriggerMode
{
  return self->_enhancedVoiceTriggerMode;
}

- (void)setVehicleModel:(id)a3
{
}

- (NSString)vehicleModel
{
  return self->_vehicleModel;
}

- (void)setVehicleName:(id)a3
{
}

- (NSString)vehicleName
{
  return self->_vehicleName;
}

- (void)setVehicleManufacturer:(id)a3
{
}

- (NSString)vehicleManufacturer
{
  return self->_vehicleManufacturer;
}

- (void)setAssistantDimensions:(id)a3
{
}

- (ODDSiriSchemaODDAssistantDimensions)assistantDimensions
{
  return self->_assistantDimensions;
}

- (ODDSiriSchemaODDAssistantCarPlayDimensions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ODDSiriSchemaODDAssistantCarPlayDimensions;
  v5 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"assistantDimensions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[ODDSiriSchemaODDAssistantDimensions alloc] initWithDictionary:v6];
      [(ODDSiriSchemaODDAssistantCarPlayDimensions *)v5 setAssistantDimensions:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"vehicleManufacturer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(ODDSiriSchemaODDAssistantCarPlayDimensions *)v5 setVehicleManufacturer:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"vehicleName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(ODDSiriSchemaODDAssistantCarPlayDimensions *)v5 setVehicleName:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"vehicleModel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = (void *)[v12 copy];
      [(ODDSiriSchemaODDAssistantCarPlayDimensions *)v5 setVehicleModel:v13];
    }
    v14 = [v4 objectForKeyedSubscript:@"enhancedVoiceTriggerMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantCarPlayDimensions setEnhancedVoiceTriggerMode:](v5, "setEnhancedVoiceTriggerMode:", [v14 intValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"directAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantCarPlayDimensions setDirectAction:](v5, "setDirectAction:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"carPlayConnection"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDAssistantCarPlayDimensions setCarPlayConnection:](v5, "setCarPlayConnection:", [v16 intValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDAssistantCarPlayDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self dictionaryRepresentation];
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
  if (self->_assistantDimensions)
  {
    id v4 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self assistantDimensions];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"assistantDimensions"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"assistantDimensions"];
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    unsigned int v8 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self carPlayConnection] - 1;
    if (v8 > 2) {
      objc_super v9 = @"CARPLAYCONNECTION_UNKNOWN";
    }
    else {
      objc_super v9 = off_1E5EBDD58[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"carPlayConnection"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_8:
      if ((has & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_8;
  }
  unsigned int v10 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self directAction] - 1;
  if (v10 > 9) {
    v11 = @"SIRIDIRECTACTION_UNKNOWN_DIRECT_ACTION";
  }
  else {
    v11 = off_1E5EBDD70[v10];
  }
  [v3 setObject:v11 forKeyedSubscript:@"directAction"];
  if (*(unsigned char *)&self->_has)
  {
LABEL_18:
    unsigned int v12 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self enhancedVoiceTriggerMode] - 1;
    if (v12 > 3) {
      v13 = @"ENHANCEDVOICETRIGGERMODE_UNKNOWN";
    }
    else {
      v13 = off_1E5EBDDC0[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"enhancedVoiceTriggerMode"];
  }
LABEL_22:
  if (self->_vehicleManufacturer)
  {
    v14 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleManufacturer];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"vehicleManufacturer"];
  }
  if (self->_vehicleModel)
  {
    v16 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleModel];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"vehicleModel"];
  }
  if (self->_vehicleName)
  {
    v18 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleName];
    objc_super v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"vehicleName"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ODDSiriSchemaODDAssistantDimensions *)self->_assistantDimensions hash];
  NSUInteger v4 = [(NSString *)self->_vehicleManufacturer hash];
  NSUInteger v5 = [(NSString *)self->_vehicleName hash];
  NSUInteger v6 = [(NSString *)self->_vehicleModel hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v7 = 2654435761 * self->_enhancedVoiceTriggerMode;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = 2654435761 * self->_directAction;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v9 = 2654435761 * self->_carPlayConnection;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  NSUInteger v5 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self assistantDimensions];
  NSUInteger v6 = [v4 assistantDimensions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self assistantDimensions];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self assistantDimensions];
    unsigned int v10 = [v4 assistantDimensions];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleManufacturer];
  NSUInteger v6 = [v4 vehicleManufacturer];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleManufacturer];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleManufacturer];
    v15 = [v4 vehicleManufacturer];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleName];
  NSUInteger v6 = [v4 vehicleName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleName];
  if (v17)
  {
    v18 = (void *)v17;
    objc_super v19 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleName];
    v20 = [v4 vehicleName];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleModel];
  NSUInteger v6 = [v4 vehicleModel];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v22 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleModel];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleModel];
    v25 = [v4 vehicleModel];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  $D1A9539ABAD353427EFED0B769EB1DDA has = self->_has;
  unsigned int v30 = v4[52];
  if ((*(unsigned char *)&has & 1) == (v30 & 1))
  {
    if (*(unsigned char *)&has)
    {
      int enhancedVoiceTriggerMode = self->_enhancedVoiceTriggerMode;
      if (enhancedVoiceTriggerMode != [v4 enhancedVoiceTriggerMode]) {
        goto LABEL_22;
      }
      $D1A9539ABAD353427EFED0B769EB1DDA has = self->_has;
      unsigned int v30 = v4[52];
    }
    int v32 = (*(unsigned int *)&has >> 1) & 1;
    if (v32 == ((v30 >> 1) & 1))
    {
      if (v32)
      {
        int directAction = self->_directAction;
        if (directAction != [v4 directAction]) {
          goto LABEL_22;
        }
        $D1A9539ABAD353427EFED0B769EB1DDA has = self->_has;
        unsigned int v30 = v4[52];
      }
      int v34 = (*(unsigned int *)&has >> 2) & 1;
      if (v34 == ((v30 >> 2) & 1))
      {
        if (!v34
          || (int carPlayConnection = self->_carPlayConnection,
              carPlayConnection == [v4 carPlayConnection]))
        {
          BOOL v27 = 1;
          goto LABEL_23;
        }
      }
    }
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  NSUInteger v4 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self assistantDimensions];

  if (v4)
  {
    NSUInteger v5 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self assistantDimensions];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v6 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleManufacturer];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleName];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  uint64_t v8 = [(ODDSiriSchemaODDAssistantCarPlayDimensions *)self vehicleModel];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  unsigned int v10 = v11;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    unsigned int v10 = v11;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  unsigned int v10 = v11;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    unsigned int v10 = v11;
  }
LABEL_13:
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDAssistantCarPlayDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)deleteCarPlayConnection
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasCarPlayConnection:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCarPlayConnection
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCarPlayConnection:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int carPlayConnection = a3;
}

- (void)deleteDirectAction
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasDirectAction:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDirectAction
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDirectAction:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int directAction = a3;
}

- (void)deleteEnhancedVoiceTriggerMode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasEnhancedVoiceTriggerMode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnhancedVoiceTriggerMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setEnhancedVoiceTriggerMode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int enhancedVoiceTriggerMode = a3;
}

- (void)deleteVehicleModel
{
}

- (BOOL)hasVehicleModel
{
  return self->_vehicleModel != 0;
}

- (void)deleteVehicleName
{
}

- (BOOL)hasVehicleName
{
  return self->_vehicleName != 0;
}

- (void)deleteVehicleManufacturer
{
}

- (BOOL)hasVehicleManufacturer
{
  return self->_vehicleManufacturer != 0;
}

- (void)deleteAssistantDimensions
{
}

- (BOOL)hasAssistantDimensions
{
  return self->_assistantDimensions != 0;
}

@end