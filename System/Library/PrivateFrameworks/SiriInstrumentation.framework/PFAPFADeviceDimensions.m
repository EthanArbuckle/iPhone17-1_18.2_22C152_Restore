@interface PFAPFADeviceDimensions
- (BOOL)hasDeviceType;
- (BOOL)hasProgramCode;
- (BOOL)hasSystemBuild;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)deviceType;
- (NSString)systemBuild;
- (PFAPFADeviceDimensions)initWithDictionary:(id)a3;
- (PFAPFADeviceDimensions)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)programCode;
- (unint64_t)hash;
- (void)deleteDeviceType;
- (void)deleteProgramCode;
- (void)deleteSystemBuild;
- (void)setDeviceType:(id)a3;
- (void)setHasDeviceType:(BOOL)a3;
- (void)setHasProgramCode:(BOOL)a3;
- (void)setHasSystemBuild:(BOOL)a3;
- (void)setProgramCode:(int)a3;
- (void)setSystemBuild:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PFAPFADeviceDimensions

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
}

- (void)setHasDeviceType:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasSystemBuild:(BOOL)a3
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

- (void)setSystemBuild:(id)a3
{
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (PFAPFADeviceDimensions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PFAPFADeviceDimensions;
  v5 = [(PFAPFADeviceDimensions *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"systemBuild"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(PFAPFADeviceDimensions *)v5 setSystemBuild:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"deviceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(PFAPFADeviceDimensions *)v5 setDeviceType:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"programCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PFAPFADeviceDimensions setProgramCode:](v5, "setProgramCode:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (PFAPFADeviceDimensions)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PFAPFADeviceDimensions *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PFAPFADeviceDimensions *)self dictionaryRepresentation];
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
    id v4 = [(PFAPFADeviceDimensions *)self deviceType];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"deviceType"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = [(PFAPFADeviceDimensions *)self programCode] - 1;
    if (v6 > 4) {
      uint64_t v7 = @"PROGRAMCODE_UNKNOWN";
    }
    else {
      uint64_t v7 = off_1E5EBEEE0[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"programCode"];
  }
  if (self->_systemBuild)
  {
    v8 = [(PFAPFADeviceDimensions *)self systemBuild];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"systemBuild"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_systemBuild hash];
  NSUInteger v4 = [(NSString *)self->_deviceType hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_programCode;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(PFAPFADeviceDimensions *)self systemBuild];
  unsigned int v6 = [v4 systemBuild];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(PFAPFADeviceDimensions *)self systemBuild];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(PFAPFADeviceDimensions *)self systemBuild];
    v10 = [v4 systemBuild];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(PFAPFADeviceDimensions *)self deviceType];
  unsigned int v6 = [v4 deviceType];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(PFAPFADeviceDimensions *)self deviceType];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(PFAPFADeviceDimensions *)self deviceType];
    v15 = [v4 deviceType];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int programCode = self->_programCode, programCode == [v4 programCode]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  NSUInteger v4 = [(PFAPFADeviceDimensions *)self systemBuild];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(PFAPFADeviceDimensions *)self deviceType];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unsigned int v6 = v7;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    unsigned int v6 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PFAPFADeviceDimensionsReadFrom(self, (uint64_t)a3);
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

- (void)deleteSystemBuild
{
}

- (BOOL)hasSystemBuild
{
  return self->_systemBuild != 0;
}

@end