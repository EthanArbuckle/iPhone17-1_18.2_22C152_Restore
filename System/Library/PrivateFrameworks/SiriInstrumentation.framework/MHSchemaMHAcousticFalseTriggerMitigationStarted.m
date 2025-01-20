@interface MHSchemaMHAcousticFalseTriggerMitigationStarted
- (BOOL)hasMitigationType;
- (BOOL)hasModelVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAcousticFalseTriggerMitigationStarted)initWithDictionary:(id)a3;
- (MHSchemaMHAcousticFalseTriggerMitigationStarted)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)modelVersion;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)mitigationType;
- (unint64_t)hash;
- (void)deleteMitigationType;
- (void)deleteModelVersion;
- (void)setHasMitigationType:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setMitigationType:(int)a3;
- (void)setModelVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAcousticFalseTriggerMitigationStarted

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasModelVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)mitigationType
{
  return self->_mitigationType;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (MHSchemaMHAcousticFalseTriggerMitigationStarted)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MHSchemaMHAcousticFalseTriggerMitigationStarted;
  v5 = [(MHSchemaMHAcousticFalseTriggerMitigationStarted *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(MHSchemaMHAcousticFalseTriggerMitigationStarted *)v5 setModelVersion:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"mitigationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAcousticFalseTriggerMitigationStarted setMitigationType:](v5, "setMitigationType:", [v8 intValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (MHSchemaMHAcousticFalseTriggerMitigationStarted)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAcousticFalseTriggerMitigationStarted *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAcousticFalseTriggerMitigationStarted *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    int v4 = [(MHSchemaMHAcousticFalseTriggerMitigationStarted *)self mitigationType];
    v5 = @"MHACOUSTICFALSETRIGGERMITIGATOR_TYPE_UNKNOWN";
    if (v4 == 1) {
      v5 = @"MHACOUSTICFALSETRIGGERMITIGATOR_TYPE_VOICETRIGGER";
    }
    if (v4 == 2) {
      v6 = @"MHACOUSTICFALSETRIGGERMITIGATOR_TYPE_CONTINUOUS_CONVERSATION";
    }
    else {
      v6 = v5;
    }
    [v3 setObject:v6 forKeyedSubscript:@"mitigationType"];
  }
  if (self->_modelVersion)
  {
    uint64_t v7 = [(MHSchemaMHAcousticFalseTriggerMitigationStarted *)self modelVersion];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"modelVersion"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_modelVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_mitigationType;
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
  v5 = [(MHSchemaMHAcousticFalseTriggerMitigationStarted *)self modelVersion];
  v6 = [v4 modelVersion];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(MHSchemaMHAcousticFalseTriggerMitigationStarted *)self modelVersion];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(MHSchemaMHAcousticFalseTriggerMitigationStarted *)self modelVersion];
    objc_super v11 = [v4 modelVersion];
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
    int mitigationType = self->_mitigationType;
    if (mitigationType != [v4 mitigationType]) {
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
  uint64_t v4 = [(MHSchemaMHAcousticFalseTriggerMitigationStarted *)self modelVersion];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAcousticFalseTriggerMitigationStartedReadFrom(self, (uint64_t)a3);
}

- (void)deleteMitigationType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasMitigationType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMitigationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMitigationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int mitigationType = a3;
}

- (void)deleteModelVersion
{
}

- (BOOL)hasModelVersion
{
  return self->_modelVersion != 0;
}

@end