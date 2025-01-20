@interface ODDSiriSchemaODDFixedDimensions
- (BOOL)hasDeviceType;
- (BOOL)hasProgramCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)deviceType;
- (ODDSiriSchemaODDFixedDimensions)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDFixedDimensions)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)programCode;
- (unint64_t)hash;
- (void)deleteDeviceType;
- (void)deleteProgramCode;
- (void)setDeviceType:(id)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasProgramCode:(BOOL)a3;
- (void)setProgramCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDFixedDimensions

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasDeviceType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
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

- (ODDSiriSchemaODDFixedDimensions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ODDSiriSchemaODDFixedDimensions;
  v5 = [(ODDSiriSchemaODDFixedDimensions *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"deviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(ODDSiriSchemaODDFixedDimensions *)v5 setDeviceType:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"programCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDFixedDimensions setProgramCode:](v5, "setProgramCode:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDFixedDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDFixedDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDFixedDimensions *)self dictionaryRepresentation];
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
  if (self->_deviceType)
  {
    id v4 = [(ODDSiriSchemaODDFixedDimensions *)self deviceType];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"deviceType"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = [(ODDSiriSchemaODDFixedDimensions *)self programCode] - 1;
    if (v6 > 4) {
      uint64_t v7 = @"PROGRAMCODE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EBD310[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"programCode"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceType hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_programCode;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(ODDSiriSchemaODDFixedDimensions *)self deviceType];
  unsigned int v6 = [v4 deviceType];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(ODDSiriSchemaODDFixedDimensions *)self deviceType];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(ODDSiriSchemaODDFixedDimensions *)self deviceType];
    objc_super v11 = [v4 deviceType];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[20] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    int programCode = self->_programCode;
    if (programCode != [v4 programCode]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(ODDSiriSchemaODDFixedDimensions *)self deviceType];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDFixedDimensionsReadFrom(self, (uint64_t)a3);
}

- (void)deleteProgramCode
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasProgramCode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
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

@end