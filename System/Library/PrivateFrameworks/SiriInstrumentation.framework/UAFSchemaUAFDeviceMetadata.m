@interface UAFSchemaUAFDeviceMetadata
- (BOOL)hasDeviceId;
- (BOOL)hasDeviceType;
- (BOOL)hasInputLocale;
- (BOOL)hasNanoSecondsSinceLastBoot;
- (BOOL)hasProgramCode;
- (BOOL)hasSystemBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)deviceType;
- (NSString)systemBuild;
- (SISchemaUUID)deviceId;
- (UAFSchemaUAFDeviceMetadata)initWithDictionary:(id)a3;
- (UAFSchemaUAFDeviceMetadata)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)inputLocale;
- (int)programCode;
- (unint64_t)hash;
- (unint64_t)nanoSecondsSinceLastBoot;
- (void)deleteDeviceId;
- (void)deleteDeviceType;
- (void)deleteInputLocale;
- (void)deleteNanoSecondsSinceLastBoot;
- (void)deleteProgramCode;
- (void)deleteSystemBuild;
- (void)setDeviceId:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setHasDeviceId:(BOOL)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasInputLocale:(BOOL)a3;
- (void)setHasNanoSecondsSinceLastBoot:(BOOL)a3;
- (void)setHasProgramCode:(BOOL)a3;
- (void)setHasSystemBuild:(BOOL)a3;
- (void)setInputLocale:(int)a3;
- (void)setNanoSecondsSinceLastBoot:(unint64_t)a3;
- (void)setProgramCode:(int)a3;
- (void)setSystemBuild:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation UAFSchemaUAFDeviceMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UAFSchemaUAFDeviceMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(UAFSchemaUAFDeviceMetadata *)self deviceId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(UAFSchemaUAFDeviceMetadata *)self deleteDeviceId];
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
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
}

- (void)setHasSystemBuild:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasDeviceId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)nanoSecondsSinceLastBoot
{
  return self->_nanoSecondsSinceLastBoot;
}

- (int)inputLocale
{
  return self->_inputLocale;
}

- (void)setSystemBuild:(id)a3
{
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (int)programCode
{
  return self->_programCode;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceId:(id)a3
{
}

- (SISchemaUUID)deviceId
{
  return self->_deviceId;
}

- (UAFSchemaUAFDeviceMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UAFSchemaUAFDeviceMetadata;
  v5 = [(UAFSchemaUAFDeviceMetadata *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"deviceId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(UAFSchemaUAFDeviceMetadata *)v5 setDeviceId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"deviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(UAFSchemaUAFDeviceMetadata *)v5 setDeviceType:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"programCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UAFSchemaUAFDeviceMetadata setProgramCode:](v5, "setProgramCode:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"systemBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(UAFSchemaUAFDeviceMetadata *)v5 setSystemBuild:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"inputLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UAFSchemaUAFDeviceMetadata setInputLocale:](v5, "setInputLocale:", [v13 intValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"nanoSecondsSinceLastBoot"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UAFSchemaUAFDeviceMetadata setNanoSecondsSinceLastBoot:](v5, "setNanoSecondsSinceLastBoot:", [v14 unsignedLongLongValue]);
    }
    v15 = v5;
  }
  return v5;
}

- (UAFSchemaUAFDeviceMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(UAFSchemaUAFDeviceMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(UAFSchemaUAFDeviceMetadata *)self dictionaryRepresentation];
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
  if (self->_deviceId)
  {
    id v4 = [(UAFSchemaUAFDeviceMetadata *)self deviceId];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"deviceId"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"deviceId"];
    }
  }
  if (self->_deviceType)
  {
    uint64_t v7 = [(UAFSchemaUAFDeviceMetadata *)self deviceType];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"deviceType"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v10 = [(UAFSchemaUAFDeviceMetadata *)self inputLocale] - 1;
    if (v10 > 0x3D) {
      v11 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      v11 = off_1E5EBFC90[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"inputLocale"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[UAFSchemaUAFDeviceMetadata nanoSecondsSinceLastBoot](self, "nanoSecondsSinceLastBoot"));
  [v3 setObject:v12 forKeyedSubscript:@"nanoSecondsSinceLastBoot"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_21;
  }
LABEL_17:
  unsigned int v13 = [(UAFSchemaUAFDeviceMetadata *)self programCode] - 1;
  if (v13 > 4) {
    v14 = @"PROGRAMCODE_UNKNOWN";
  }
  else {
    v14 = off_1E5EBFE80[v13];
  }
  [v3 setObject:v14 forKeyedSubscript:@"programCode"];
LABEL_21:
  if (self->_systemBuild)
  {
    v15 = [(UAFSchemaUAFDeviceMetadata *)self systemBuild];
    v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"systemBuild"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_deviceId hash];
  NSUInteger v4 = [(NSString *)self->_deviceType hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_programCode;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_systemBuild hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_inputLocale;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v8 = 2654435761u * self->_nanoSecondsSinceLastBoot;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(UAFSchemaUAFDeviceMetadata *)self deviceId];
  NSUInteger v6 = [v4 deviceId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(UAFSchemaUAFDeviceMetadata *)self deviceId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    objc_super v9 = [(UAFSchemaUAFDeviceMetadata *)self deviceId];
    unsigned int v10 = [v4 deviceId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v5 = [(UAFSchemaUAFDeviceMetadata *)self deviceType];
  NSUInteger v6 = [v4 deviceType];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v12 = [(UAFSchemaUAFDeviceMetadata *)self deviceType];
  if (v12)
  {
    unsigned int v13 = (void *)v12;
    v14 = [(UAFSchemaUAFDeviceMetadata *)self deviceType];
    v15 = [v4 deviceType];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[56] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    int programCode = self->_programCode;
    if (programCode != [v4 programCode]) {
      goto LABEL_20;
    }
  }
  uint64_t v5 = [(UAFSchemaUAFDeviceMetadata *)self systemBuild];
  NSUInteger v6 = [v4 systemBuild];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v18 = [(UAFSchemaUAFDeviceMetadata *)self systemBuild];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(UAFSchemaUAFDeviceMetadata *)self systemBuild];
    v21 = [v4 systemBuild];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  $B55BE137D096B817EB4BC92F4D083786 has = self->_has;
  int v26 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v27 = v4[56];
  if (v26 == ((v27 >> 1) & 1))
  {
    if (v26)
    {
      int inputLocale = self->_inputLocale;
      if (inputLocale != [v4 inputLocale]) {
        goto LABEL_20;
      }
      $B55BE137D096B817EB4BC92F4D083786 has = self->_has;
      unsigned int v27 = v4[56];
    }
    int v29 = (*(unsigned int *)&has >> 2) & 1;
    if (v29 == ((v27 >> 2) & 1))
    {
      if (!v29
        || (unint64_t nanoSecondsSinceLastBoot = self->_nanoSecondsSinceLastBoot,
            nanoSecondsSinceLastBoot == [v4 nanoSecondsSinceLastBoot]))
      {
        BOOL v23 = 1;
        goto LABEL_21;
      }
    }
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  NSUInteger v4 = [(UAFSchemaUAFDeviceMetadata *)self deviceId];

  if (v4)
  {
    uint64_t v5 = [(UAFSchemaUAFDeviceMetadata *)self deviceId];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v6 = [(UAFSchemaUAFDeviceMetadata *)self deviceType];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  uint64_t v7 = [(UAFSchemaUAFDeviceMetadata *)self systemBuild];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  objc_super v9 = v10;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    objc_super v9 = v10;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    objc_super v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFDeviceMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteNanoSecondsSinceLastBoot
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasNanoSecondsSinceLastBoot:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNanoSecondsSinceLastBoot
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNanoSecondsSinceLastBoot:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t nanoSecondsSinceLastBoot = a3;
}

- (void)deleteInputLocale
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasInputLocale:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInputLocale
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setInputLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int inputLocale = a3;
}

- (void)deleteSystemBuild
{
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

- (void)deleteProgramCode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasProgramCode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProgramCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setProgramCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int programCode = a3;
}

- (void)deleteDeviceType
{
}

- (BOOL)hasDeviceType
{
  return self->_deviceType != 0;
}

- (void)deleteDeviceId
{
}

- (BOOL)hasDeviceId
{
  return self->_deviceId != 0;
}

@end